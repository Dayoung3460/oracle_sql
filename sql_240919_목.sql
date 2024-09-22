-- 여기서부터 복습 0922

select last_name,
       job_id,
       employee_id,
       salary
from employees
where job_id = (select job_id
                from employees
                where employee_id = 141);
                
select last_name,
       job_id,
       employee_id
from employees
where job_id = (select job_id
                from employees
                where employee_id = 141)
and employee_id != 141;


select last_name,
       job_id,
       salary,
       employee_id
from employees
where job_id = (select job_id
                from employees
                where employee_id = 141)
and salary > (select salary
              from employees
              where employee_id = 141);

select last_name,
       job_id,
       salary
from employees
where salary = (select min(salary)
                from employees);

select min(salary)
from employees
group by department_id;

select last_name,
       salary,
       department_id
from employees
where salary in (select min(salary)
                 from employees
                 group by department_id);
             
--9000 - 최대값
--6000
--4800
--4800
--4200 - 최소값
select salary
from employees
where job_id = 'IT_PROG';
                    
 -- < any: 서브쿼리 값들과 다 비교해서 그것보다 작은 값(9000 미만 모든값)
select employee_id, 
       last_name,
       job_id,
       salary
from employees
where salary < any (select salary
                    from employees
                    where job_id = 'IT_PROG');
--4200 초과 모든값                   
select employee_id, 
       last_name,
       job_id,
       salary
from employees
where salary > any (select salary
                    from employees
                    where job_id = 'IT_PROG');
                    
-- 서브쿼리값의 최소값보다 작은 값이면 반환(4200 미만값들)     
select employee_id, 
       last_name,
       job_id,
       salary
from employees
where salary < all (select salary
                    from employees
                    where job_id = 'IT_PROG');

-- 서브쿼리값의 최대값보다 큰값이면 반환(9000 초과값들)      
select employee_id, 
       last_name,
       job_id,
       salary
from employees
where salary > all (select salary
                    from employees
                    where job_id = 'IT_PROG');
    
-- employees table이랑 똑같은데 데이터만 좀 다름
-- cre_empl.sql
select *
from empl_demo;

--108	100
--123	50
--100	80
select manager_id, department_id
from empl_demo
where first_name = 'John';

select employee_id,
       manager_id,
       department_id
from empl_demo
where (manager_id, department_id) in (select manager_id, department_id
                                      from empl_demo
                                      where first_name = 'John')
and first_name != 'John';

select employee_id,
       manager_id,
       department_id
from empl_demo
where (manager_id, department_id) in (select manager_id, department_id
                                      from empl_demo
                                      where first_name = 'John')
and first_name != 'John';

select employee_id,
       manager_id,
       department_id
from empl_demo
where manager_id in (select manager_id
                     from empl_demo
                     where first_name = 'John')
and department_id in (select department_id
                      from empl_demo
                      where first_name = 'John')
and first_name != 'John';

--1. Zlotkey와 동일한 부서에 속한 모든 사원의 이름과 입사일을 표시하는 질의를 작성하시오. Zlotkey는 결과에서 제외하시오.
select last_name,
       hire_date
from employees
where department_id = (select department_id
                       from employees
                       where LOWER(last_name) = 'zlotkey')
and lower(last_name) != 'zlotkey'
order by last_name;
                          
--2. 급여가 평균 급여보다 많은 모든 사원의 사원 번호와 이름을 표시하는 질의를 작성하고 결과를 급여에 대해 오름차순으로 정렬하시오.
select employee_id,
       last_name
from employees
where salary > (select avg(salary)
                from employees)
order by salary;
                
--3. 이름에 u가 포함된 사원과 같은 부서에서 일하는 모든 사원의 사원 번호와 이름을 표시하는 질의를 작성하고 질의를 실행하시오.
select employee_id,
       last_name
from employees
where department_id in (select department_id
                        from employees
                        where lower(last_name) like '%u%');

--4. 부서 위치 ID(location_id)가 1700인 모든 사원의 이름, 부서 번호 및 업무 ID를 표시하시오.
-- 카테시안 곱: employees 테이블의 행이 departments 테이블의 모든 행과 결합
select e.last_name,
       e.department_id,
       e.job_id
from employees e, departments d
where location_id = 1700;

-- location_id가 1700인 부서의 department_id를 먼저 선택한 후, 해당 부서에 속한 직원들을 employees 테이블에서 찾음
select last_name,
       department_id,
       job_id
from employees
where department_id in (select department_id
                        from departments
                        where location_id = 1700);

--5. King에게 보고하는(manager가 King) 모든 사원의 이름과 급여를 표시하시오.
select employee_id,
       last_name
from employees
where last_name = 'King';

select last_name,
       salary,
       manager_id
from employees
where manager_id in (select employee_id
                     from employees
                     where upper(last_name) = 'KING');

--6. Executive 부서의 모든 사원에 대한 부서 번호, 이름 및 업무 ID를 표시하시오.
select department_name
from departments;

select department_id,
       last_name,
       job_id
from employees
where department_id in (select department_id
                        from departments
                        where lower(department_name) = 'executive');

--7. 평균 급여보다 많은 급여를 받고 이름에 u가 포함된 사원과 같은 부서에서 근무하는 모든 사원의 사원 번호, 이름 및 급여를 표시하시오.
select avg(salary)
from employees;

select department_id
from employees
where lower(last_name) like '%u%';

-- lower() 하기. 첫글자가 U로 시작하는 사람도 포함해서.
select employee_id,
       last_name,
       salary
from employees
where salary > (select avg(salary)
                from employees)
and department_id in (select department_id
                     from employees
                     where lower(last_name) like '%u%');
            
--//////////////////////////////////////////////////////////
select * from job_history;

--job_history의 job_id와 employees의 job_id가 겹치는 사람은 하던 일에서 옮겼다가 다시 예전일로 돌아온 사람

--여기서부터 복습 0923

--176	SA_REP
--200	AD_ASST
select employee_id,
       job_id
from employees
where employee_id in (176, 200);

--176	SA_REP
--176	SA_MAN
--200	AD_ASST
--200	AC_ACCOUNT
select employee_id,
       job_id
from job_history
where employee_id in (176, 200);

-- 115개(107 + 10 - 2). 중복값 미포함. 176, 200번 사원은 겹치는 job_id가 있음 
--176	SA_REP
--200	AD_ASST
-- 이 두행 제외

-- 컬럼 기준으로 오름차순 정렬이 디폴트(1차 정렬: employee_id, 2차 정렬: job_id) 
-- union all 제외
select employee_id,
       job_id
from employees
union
select employee_id,
       job_id
from job_history;

-- 117개. 중복값 포함
select employee_id,
       job_id
from employees
union all
select employee_id,
       job_id
from job_history;

-- 차집합: minus
-- 합집합, 교집합은 집합 연산자 위아래 절 순서가 바껴도 결과 같음.
-- 차집합은 다름.
-- 107 - 2 = 105
select employee_id,
       job_id
from employees
minus
select employee_id,
       job_id
from job_history;

-- 10 - 2 = 8
select employee_id,
       job_id
from job_history
minus
select employee_id,
       job_id
from employees;

-- 2 rows: 전전직무가 지금 직무랑 같은 사원들(176, 200번 사원들)
select employee_id,
       job_id
from job_history
intersect
select employee_id,
       job_id
from employees;

-- DML(데이터 조작어): Data Manipulation language. 추가, 삭제, 변경

select * from departments;

-- insert 하려니 이미 있는 부서라 cre_hrdata.sql 다시 실행하고 employees가 20행 나오면 그 때 insert해보기
-- department_id가 PK라 중복 인서트 안됨
insert into departments(department_id,
                        department_name,
                        manager_id,
                        location_id)
values (70, 
        'Public Relations', 
        100, 
        1700);

-- 테이블의 모든 칼럼에 값을 입력할 땐 칼럼명 안적어줘도 됨.(지양)
insert into departments
values (71, 'Public Relations', 100, 1700);

-- 특정 칼럼에만 데이터 넣으면 나머지 칸엔 널값 들어감(암시적 널 삽입)
insert into departments(department_id,
                        department_name)
values (30, 'Purchasing');

-- 명시적 널입력. 두가지 방법: null or ''
insert into departments
values (100, 'Finance', null, '');

insert into employees
values (113,
       'Louis',
       'Popp',
       'LPOPP',
       '515.124.4567',
       sysdate,
       'AC_ACCOUNT',
       6900,
       null,
       205,
       110);
       
select * from employees;

insert into employees
values (114,
       'Den',
       'Raphealy',
       'DRAPHEAL',
       '515.127.4561',
       to_date('02 03, 1999', 'MM DD, YYYY'),
       'SA_REP',
       11000,
       .2,
       100,
       60);
       
-- sales_reps.sql 실행하기
select * from sales_reps;

-- insert 칼럼 개수와 select 해오는 칼럼 개수 같아야함
-- 개발서버에서 더미 데이터 넣을 때 이 방식 사용함(다른 테이블꺼 복붙해서)
-- pk 지정안해서 중복 데이터 삽입 가능
insert into sales_reps(id,
                       name,
                       salary,
                       commission_pct)
                       select employee_id,
                              last_name,
                              salary,
                              commission_pct
                       from employees
                       where job_id like '%REP%';

-- update 구문
update employees
set department_id = 50
where employee_id = 113;

insert into copy_emp
    select *
    from employees;
    
select * from copy_emp;

-- update시 where절이 없으면 set 절의 칼럼 데이터가 모두 변경됨
-- 모든 사원의 department_id를 100으로 변경함
update copy_emp
set department_id = 100;

update employees
set job_id = (select job_id
              from employees
              where employee_id = 205),
    salary = (select salary
              from employees
              where employee_id = 205)
where employee_id = 113;

--위와 같음
update employees
set (job_id, salary) = (select job_id,
                               salary
                        from employees
                        where employee_id = 205)
where employee_id = 113;

select * from employees
where employee_id in (113, 205);

select * from departments;

-- Delete 특정 행을 삭제할 때. 그냥 셀의 데이터를 삭제하려면 update로 널을 넣어줘야함
delete departments
where department_name = 'Finance';

-- 테이블 삭제(데이터가 rollback segment 안에 들어감)
-- data는 지워지지만 테이블 용량은 그대로.
-- 복구 가능
delete copy_emp;

-- 위와 같음 but rollback segment로 가지 않음. 복구 불가능
-- truncate: DDL: 데이터 정의어, Data Definition Language
-- 삭제 후 용량 줄어듦
-- 테이블이 삭제되지는 않고 데이터만 삭제됨
truncate table copy_emp;

select * from copy_emp;

rollback;

commit;

-- 현재 사용자 아닌 다른 사용자는 dml문 결과를 볼 수 없음. 커밋 전에는.
insert into copy_emp
    select *
    from employees;
    
select * from copy_emp;

-- 커밋 후에는 이전 상태의 데이터로 돌아갈 수 없음
commit;

update copy_emp
set salary = 9999
where employee_id = 176;

-- 다른 사용자가 셀렉트로 결과를 보면 salary 업데이트 안되어 있음
-- 아직 커밋전이니까
select salary
from copy_emp
where employee_id = 176;

-- 지금 상태에서 다른 사용자가 employee_id = 176의 salary를 8888로 업데이트해보면 무한 루프돎

-- 롤백해주면 루프 끝나고 다시 원래의 salary로 돌아옴
-- 다른 사용자의 해당 사원의 salary는 8888로 바껴있음
rollback;

-- 보통 응용 프로그램 안에 자동 커밋 해주는 기능이 있음
-- 직접 dml문 작업 후엔 꼭 커밋해주기

--1. 다음과 같이 실습에 사용할 MY_EMPLOYEE 테이블을 생성하시오.
CREATE TABLE my_employee
  (id         NUMBER(4) NOT NULL,
   last_name  VARCHAR2(25),
   first_name VARCHAR2(25),
   userid     VARCHAR2(8),
   salary     NUMBER(9,2));

--3. 다음 예제 데이터를 MY_EMPLOYEE 테이블에 추가하시오.(INSERT)
--ID	LAST_NAME 	FIRST_NAME 	USERID 	SALARY
--------- --------------- --------------- ------- ------
--      1	Patel 		Ralph 		Rpatel 	   895
--      2	Dancs 		Betty 		Bdancs 	   860
--      3	Biri 		Ben 		Bbiri 	  1100

insert into my_employee(ID,
                        LAST_NAME, 
                        FIRST_NAME, 
                        USERID, 
                        SALARY)
values(1, 
       'Patel', 
       'Ralph', 
       'Rpatel', 
       895);

insert into my_employee(ID,
                        LAST_NAME, 
                        FIRST_NAME, 
                        USERID, 
                        SALARY)
values(2, 
       'Dancs', 
       'Betty', 
       'Bdancs', 
       860);

insert into my_employee(ID,
                        LAST_NAME, 
                        FIRST_NAME, 
                        USERID, 
                        SALARY)
values(3, 
       'Biri', 
       'Ben', 
       'Bbiri', 
       1100);

--4. 테이블에 추가한 항목을 확인하시오.(SELECT)
select *
from my_employee;

--6. 사원 3의 성을 Drexler로 변경하시오.(UPDATE)
update my_employee
set last_name = 'Drexler'
where id = 3;

--7. 급여가 900 미만인 모든 사원의 급여를 1000으로 변경하고 테이블의 변경 내용을 확인하시오.(UPDATE)
update my_employee
set salary = 1000
where salary < 900;

--8. MY_EMPLOYEE 테이블에서 사원 3을 삭제하고 테이블의 변경 내용을 확인하시오.(DELETE)
delete my_employee
where id = 3;

--11. 테이블의 내용을 모두 삭제하고 테이블 내용이 비어 있는지 확인하시오.(DELETE)
delete my_employee;

-- 여기서 롤백하면 테이블은 있지만 데이터 안나타남
-- 처음에 create 하고 그 이후론 dml문이기 때문에 create 한데까지 롤백됨.

-- ddl: 디비 객체(table, view, sequence 등)를 다루는 명령어. create, alter, drop, truncate, rename

-- 디비에서 알아서 관리해주는 테이블들
select table_name
from user_tables;

select distinct object_type
from user_objects;

select *
from user_catalog;






            