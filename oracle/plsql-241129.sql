/*
*** trigger

*/
-- 1) 테이블 준비
DROP TABLE employee;
CREATE TABLE employee
AS
    SELECT *
    FROM employees;
    
CREATE TABLE t_job_history
AS
    SELECT *
    FROM job_history;

-- 2) 사원의 업무나 부서가 변경될 경우 t_job_history 테이블에 이전내역 입력
CREATE PROCEDURE add_job_history 
(p_eid IN employees.employee_id%TYPE,
 p_pre_hdate IN employees.hire_date%TYPE,
 p_new_hdate IN employees.hire_date%TYPE,
 p_job_id IN jobs.job_id%TYPE,
 p_dept_id IN departments.department_id%TYPE)
IS

BEGIN
    INSERT INTO job_history (employee_id, start_date, end_date, job_id, department_id)
    VALUES (p_eid, p_pre_hdate, p_new_hdate, p_job_id, p_dept_id);
END;
/

drop trigger update_job_history;

-- 3) employee 테이블이 변경될 경우 자동으로 진행될 작업을 트리거로 생성
CREATE OR REPLACE TRIGGER update_job_history

-- 트리거 이벤트
-- insert, update, delete가 될 때 트리거 등록 가능. 여러개 조합도 가능
-- 트리거 타이밍
-- before, after
-- instead of: view를 사용할 때
  AFTER UPDATE OF job_id, department_id ON employees -- employees table에서 job_id, department_id 가 변경된 후 트리거 실행하겠다
  
  -- update가 여러행에서 일어날 수 있음.
  -- 이 때 변경된 모든 행마다 트리거 실행하겠다(행트리거). 문장 트리거: 변경된 모든 행에 대해서 트리거 한번한 실행하겠다
  FOR EACH ROW 
BEGIN
    -- 트리거 실행 이전, 이후 데이터 모두를 가져올 수 있음
    -- :old가 붙으면 변경 전 데이터
  add_job_history(:old.employee_id, :old.hire_date, sysdate,
                  :old.job_id, :old.department_id);
END;
/


SELECT *
FROM job_history
ORDER BY end_date;


-- 100번의 job_id를 변경하면 job_history 테이블에 이전 job에 대한 히스토리 insert
UPDATE employees
SET job_id = 'IT_PROG'
WHERE employee_id = 100;

-- 여러행이 업데이트되면 트리거도 그만큼 실행됨
UPDATE employees
SET job_id = 'IT_PROG'
WHERE department_id = 50;

select *
from employees e join departments d
on (e.department_id = d.department_id);

/*
*** sql 튜닝
- 최적화. 개선작업. 쿼리 개선.
- 옵티마이저 - 실행계획
- 실행계획 확인 명령어: 
    cmd -> sqlplus -> hr/hr -> set autotrace on exp -> select last_name, salary from employees where employee_id = 200;
    
    * INDEX UNIQUE SCAN: 인덱스가 있으면 테이블을 뒤지는게 아니라 인덱스를 뒤짐. 인덱스 기반으로 테이블 접근
        (pk, unique 제약조건 거는순간 유니크 인덱스 객체가 생성됨)
    * emp_emp_id_pk index: rowId, employee_id 칼럼이 있음. employees table 기반으로 인덱스를 세팅함
                            index의 rowId와 employees의 rowId를 매핑시켜서 데이터 가져옴 - 빠름

SELECT *
FROM job_history
ORDER BY end_date; 요 쿼리 실행 후 확인
ex) * select statement -> 
    1. table access: object_name - job_history
    2. sort. order by. cost(비용. 시간.) 4의 비용
    
select *
from employees  e
join departments d
on e.department_id = d.department_id; 요 쿼리 실행 후 확인
ex) * select statement -> 
    1. merge join
    

*/

-- 1) 사전준비
-- 1-1) 데이터를 저장할 테이블 생성
DROP TABLE t_emps;

-- create table {table name} as 로 테이블 생성할 때 제약조건은 다 버리고 가져옴
CREATE TABLE t_emps
AS 
    SELECT *
    FROM employees;


ALTER TABLE t_emps
ADD CONSTRAINT t_emps_pk PRIMARY KEY (employee_id);

ALTER TABLE t_emps
MODIFY employee_id NUMBER(38,0);

ALTER TABLE t_emps
MODIFY last_name VARCHAR2(1000);

-- 1-2) PRIMARY KEY로 사용할 예정인 컬럼에 들어갈 시퀀스 객체 생성
DROP SEQUENCE t_emps_empid_seq;
CREATE SEQUENCE t_emps_empid_seq
    START WITH 1000;
 
-- 1-3) 임의 데이터 생성(||: 문자열 연결)
BEGIN
    FOR count IN 1 .. 10 LOOP
        INSERT INTO t_emps(employee_id, last_name, email, hire_date, job_id)
        SELECT t_emps_empid_seq.NEXTVAL, last_name || count, email, hire_date, job_id
        FROM t_emps;
    END LOOP;
END;
/

SELECT COUNT(*)
FROM t_emps;

-- 1) 인덱스를 활용한 검색 유무
    -- 자주 사용하는(검색이나 정렬할 때) 컬럼엔 인덱스 설정하기

-- 예시 1 : 인덱스가 적용되지 않은 컬럼(3.411초 걸림)
SELECT *
FROM t_emps
WHERE last_name = 'King15';

-- 예시 2 : 인덱스가 적용된 컬럼(0.001초 걸림)
SELECT *
FROM t_emps
WHERE employee_id = 11356912;



-- 2) ORDER BY vs INDEX
-- 예시 1 : 인덱스가 없는 컬럼을 기준으로 정렬한 경우. 느려
    -- 걍 테이블을 바로 접근 -> order by 소팅
SELECT *
FROM t_emps
ORDER BY last_name;

-- 예시 2 :  인덱스가 있는 컬럼을 기준으로 정렬해! 빨라
    -- 인덱스(t_emps_pk)로 풀스캔함 -> 테이블 접근(인덱스에 맞춰서 테이블 데이터 넣음)
    
    -- dml이 발생할 때 index도 업데이트가 됨(ex. 회원 추가할 때 회원번호가 인덱스에도 추가)
    -- 인덱스 생성 무분별하게 하면 dml이 느려질 수 있음
    -- where, on 절 이용해서 잘 튜닝혀
SELECT *
FROM t_emps
ORDER BY employee_id;

-- 3) HINT 사용: 옵티마이저한테 내가 원하는 방식 요청. 옵티마이저가 항상 똑똑한건 아녀. 힌트 주기
    -- /*+ {힌트} */ 
    -- 칼럼 앞에 힌트
    -- full: 전체 스캔. 잘 안쓰이긴 함.
    -- index_asc/desc: 지정된 인덱스를 기준으로 셀렉트 해달라. 오더바이랑 같은 효과. 
                        -- 인덱스 이름으로 지정. 이렇게 인덱스 이름을 활용할 때를 대비하여 pk 이름 지정해주는게 좋아
    -- 힌트 오타나면 옵티마이저가 무시함. 힌트 무시하고 실행 so, 실행계획 보고 내가 의도한대로 실행됐는지 확인해. cost가 낮게 나오면 성능적으로 나아졌다~
    -- 힌트 외에도 여러 쿼리 작성해보고 같은 결과값에 따라 낮은 비용 나오는걸로 선택해
    
    
-- 3-1) FULL
SELECT /*+ FULL (t_emps) */ *
FROM t_emps;

-- 3-2) INDEX_ASC
SELECT /*+ INDEX_ASC(t_emps t_emps_pk) */ *
FROM t_emps;

-- 3-3) INDEX_DESC
-- 인덱스로 역순 풀스캔 -> 테이블 접근 index rowId로
SELECT /*+ INDEX_DESC(t_emps t_emps_pk) */ *
FROM t_emps;
