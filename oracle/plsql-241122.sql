-- paging
-- select 에 rownum이 있는데 order by를 하면 rownum 순서가 다 깨짐
-- select 한 다음에 order by를 하니까 
select d.*
from(select rownum rn, e.*
    from employees e
    order by first_name
    ) d
where rn between 1 and 10;

-- first_name으로 오더바이 먼저 해놓은 테이블에서 rownum 10개 짜름
select d.*
from(select rownum rn, e.*
    from (select * 
            from employees
            order by first_name) e
    ) d
where rn between 1 and 10;

-- ***** 모든 사원의 부서정보
-- left outer join: 사원의 수만큼 rows가 나오게 돼있음
SELECT employee_id, 
	   first_name, 
	   department_name,
       e.department_id
FROM employees e 
	 LEFT OUTER JOIN departments d
     ON(e.department_id = d.department_id);
     
-- 모든 사원의 부서정보 + 각 부서의 부서장(manager_id) 정보
SELECT e.employee_id, 
	   e.first_name, 
	   d.department_name,
       m.first_name
FROM employees e 
    join departments d
    on(e.department_id = d.department_id)
    join employees m
    on(d.manager_id = m.employee_id);
    
-- 조인은 순서대로 함
SELECT e.employee_id, 
	   e.first_name, 
	   d.department_name,
       m.first_name
FROM employees e 
    left outer join departments d
    on(e.department_id = d.department_id)
    right outer join employees m
    on(d.manager_id = m.employee_id);
    
SELECT e.employee_id, 
	   e.first_name, 
	   d.department_name,
       m.first_name
FROM employees e 
    join departments d
    on(e.department_id = d.department_id)
    left outer join employees m
    on(d.manager_id = m.employee_id);
    
    -- ddl create alter drop / dml insert update delete / dcl grant revoke / tcl commit rollback savepoint

-- oracle command
-- DBMS_OUTPUT.PUT_LINE(프로시저)를 사용하려면 이 설정 필요
-- 화면에 출력하는 프로시저임. like console.log()
-- sql에서 ~개 행이 출력되었습니다, 수정되었습니다 출력되잖아
-- plsql에서는 그런거 안나옴.
-- 나오게 해주는 프로시저.
-- off 하면 내부에서를 실행되지만 화면으로 출력은 안됨
-- 고정되는 값이 아니라서 sql 시작할 때 필수 명령어~~
set serveroutput on

-- /: 블럭의 끝. 컴파일과 실행을 동시에 함. 항상 새 줄에다가 쓰기
begin
    DBMS_OUTPUT.PUT_LINE('Hello, pl/sql!!');
END;
/

-- 트랜젝션: sql 구문 여러개를 하나의 작업으로. 논리 작업. ex) 계좌이체
-- 프로시저: 특정작업을 위해 plsql 명령어들 모아놓은거

declare
    v_str varchar2(100);
    v_num constant number(2, 0) := 10;
    v_count number(2, 0) not null default 5;
    v_sum number(3, 0) := v_num + v_count;
begin
    v_str := 1;
    DBMS_OUTPUT.PUT_LINE('v_str : ' || v_str);
    DBMS_OUTPUT.PUT_LINE('v_num : ' || v_num);
    -- v_num := 100; -- expression 'V_NUM' cannot be used as an assignment target
    
    DBMS_OUTPUT.PUT_LINE('v_count : ' || v_count);
    DBMS_OUTPUT.PUT_LINE('v_sum : ' || v_sum);
end;
/

-- 스칼라 데이터 타입에서 불린은 값 세개 가짐. 널 포함됨
-- pls_integer: 검색속도 빠름. 인덱스로 사용됨. 
-- number(5, 2)의 최대값: 999.99 첫번째 인자: 총길이, 두번째: 총길이 중 소수점 길이
-- number(2, 2)의 최대값: 0.99

-- 지정된 타입을 복사해서 쓰겠다, 지정된 타입이 변경되면 같이 변경됨 - %TYPE
-- ex. v_ename emp.ename%TYPE;
-- v_min_balance v_balance%TYPE := 10;
-- 

DECLARE
-- 실행할 때마다 데이터 타입을 실시간으로 업데이트함
    v_eid employees.employee_id%TYPE;
    v_ename employees.last_name%TYPE;
    v_new v_ename%type; --변수의 타입을 참조하는 것도 가능
begin
    select employee_id, last_name
    into v_eid, v_ename -- employee_id, last_name이 v_eid, v_ename에 대입됨?
    from employees
    where employee_id = 100;
    
    -- v_eid := 'water'; -- character to number conversion error
    v_new := v_eid || ' ' || v_ename;
    dbms_output.put_line(v_new);
end;
/

-- byte, char
-- byte: 실제 메모리 크기. 영문 1byte 한글 3byte 
-- char: 글자 크기. char가 25일 때 byte가 25일수도, 75일수도
-- varchar2 최대 크기 4000 byte

/*
plsql에서 
그룹함수(lower() 등), decode 함수 사용불가
데이터 유형 변환, 날짜 함수는 가능
*/

declare
    v_date date;
begin
    v_date := sysdate + 7; -- 24/11/29 현재날짜+7일
    dbms_output.put_line(v_date);
end;
/

-- 지수 연산자: **
-- 10의 2승: 10 ** 2 = 100
-- sql에서는 문자열을 '+'로 연결 못함 '||' 사용

-- plsql 안에서 sql은
-- select, dml, tcl만 사용 가능.
-- ddl(create, alter, drop), dcl(commit , rollback, savepoint) 사용ㄴㄴ

declare
    v_name employees.last_name%type;
begin
    select last_name
    -- into절은 select와 짝꿍. 없으면 안됨. 조회값을 변수에 선언. 
    -- select 컬럼 갯수 = into 절 변수 갯수
    into v_name
    from employees
    -- 변수에 값을 하나만 넣어야하니까 where로 결과값 하나만 나오록 필터 걸어야됨
    where employee_id = 100;
    dbms_output.put_line(v_name);
end;
/


declare
    v_name employees.last_name%type;
begin
    select last_name
    into v_name
    from employees
    -- 부서번호 50. 같은 부서 사람이 2명 이상이면 에러 -- exact fetch returns more than requested number of rows
    -- 부서번호 10. 1명이여야됨
    -- 부서번호 0. 빵명이면 -- no data found
    where department_id = &부서번호;
    dbms_output.put_line(v_name);
end;
/

declare
    v_eid employees.employee_id%type;
    v_ename employees.last_name%type;
begin
    select employee_id, last_name
    into v_eid, v_ename
    from employees
    where employee_id = 100;
    
    dbms_output.put_line(v_eid);
    dbms_output.put_line(v_ename);
end;
/

/*
1.
사원번호를 입력(치환변수사용&)할 경우
사원번호, 사원이름, 부서이름  
을 출력하는 PL/SQL을 작성하시오.
*/
declare
    v_eid employees.employee_id%type;
    v_ename employees.last_name%type;
    v_dname departments.department_name%type;
begin
    select e.employee_id, e.last_name, d.department_name
    into v_eid, v_ename, v_dname
    from employees e join departments d
    on e.department_id = d.department_id
    where employee_id = &사원번호; -- 100
    
--    select e.employee_id, e.last_name, (select department_name from departments where department_id = e.department_id) dname
--    into v_eid, v_ename, v_dname
--    from employees e
--    where employee_id = &사원번호; -- 100
    
    dbms_output.put_line(v_eid);
    dbms_output.put_line(v_ename);
    dbms_output.put_line(v_dname);
end;
/

-- 위의 문제에서 join, subquery 사용안하고
-- plsql을 사용하면 변수가 있으니까 join, subquery를 사용안해도 같은 결과를 낼 수 있음
declare
    v_eid employees.employee_id%type;
    v_ename employees.last_name%type;
    v_did departments.department_id%type;
    v_dname departments.department_name%type;
begin
    select employee_id, last_name, department_id
    into v_eid, v_ename, v_did
    from employees 
    where employee_id = &사원번호; -- 100
    
    select department_id
    into v_did
    from departments
    where department_id = v_did;
    
    dbms_output.put_line(v_eid);
    dbms_output.put_line(v_ename);
    dbms_output.put_line(v_dname);
end;
/

select * from employees;
select * from departments;
/*
2.
사원번호를 입력(치환변수사용&)할 경우 
사원이름, 
급여, 
연봉->(급여*12+(nvl(급여,0)*nvl(커미션퍼센트,0)*12))
을 출력하는  PL/SQL을 작성하시오.
*/
declare
    v_ename employees.last_name%type;
    v_esal employees.salary%type;
    v_esal_year number(20);
begin
    select last_name, salary, (salary*12+(nvl(salary,0)*nvl(commission_pct,0)*12))
    into v_ename, v_esal, v_esal_year
    from employees 
    where employee_id = &사원번호; -- 100
    
    dbms_output.put_line(v_ename);
    dbms_output.put_line(v_esal);
    dbms_output.put_line(v_esal_year);
end;
/

-- 연봉을 select문에서 연산하지 않고 분리해서
declare
    v_ename employees.last_name%type;
    v_esal employees.salary%type;
    v_esal_year employees.salary%type;
    v_comm employees.commission_pct%type;
begin
    select last_name, salary, commission_pct
    into v_ename, v_esal, v_comm
    from employees 
    where employee_id = &사원번호; -- 100
    
    v_esal_year := v_esal*12+(nvl(v_esal,0)*nvl(v_comm,0)*12);
    
    dbms_output.put_line(v_ename);
    dbms_output.put_line(v_esal);
    dbms_output.put_line(v_esal_year);
end;
/

CREATE OR REPLACE PROCEDURE get_employee_details (
    p_emp_id IN employees.employee_id%TYPE
) AS
    v_eid employees.employee_id%TYPE;
    v_ename employees.last_name%TYPE;
    v_esal employees.salary%TYPE;
    v_esal_year employees.salary%TYPE;
BEGIN
    SELECT employee_id, last_name, salary, 
           (salary*12 + (NVL(salary, 0) * NVL(commission_pct, 0) * 12))
    INTO v_eid, v_ename, v_esal, v_esal_year
    FROM employees
    WHERE employee_id = p_emp_id;

    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_eid);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('Monthly Salary: ' || v_esal);
    DBMS_OUTPUT.PUT_LINE('Yearly Salary: ' || v_esal_year);
END;
/

begin
    get_employee_details(103);
end;
/

declare
    v_deptno departments.department_id%type;
    v_comm employees.commission_pct%type := .1;
begin
    select department_id
    into v_deptno
    from employees
    where employee_id = &사원번호;
    
    insert into employees
    (employee_id, last_name, email, hire_date, job_id, department_id)
    values
    (1000, 'Hong', 'hkd@google.com', sysdate, 'IT_PROG', v_deptno);

    update employees
    set salary = (nvl(salary, 0) + 10000) * v_comm
    where employee_id = 1000;
    
    -- 프로시저 안에서도 커밋을 해줘야함
    commit;
end;
/
rollback;

select *
from employees
where employee_id in (100, 1000);

-- delete한 값이 없어도 걍 성공적으로 완료되었습니다 라고 뜸
begin
    delete from employees
    where employee_id = 1000;
end;
/

-- 커서: sql을 실행한 메모리 영역
 -- 암시적 커서: 이름 없. insert, update, delete -> 세개를 실행하면 오라클이 커서 메모리를 만들고 자동으로 수행하고 없어짐
--                SQL%ROWCOUNT: 가장 최근 SQL 문이 적용된 행의 개수를 알 수 있음
 -- 명시적 커서: 이름 있. 재호출이 가능함. 
