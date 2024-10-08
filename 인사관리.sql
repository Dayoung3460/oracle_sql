select *
from  tab;

select *
from departments;

select DEPARTMENT_ID,
       DEPARTMENT_NAME,
       MANAGER_ID,
       LOCATION_ID
from departments;

select *
from departments;

select department_id,
       location_id
from departments;

select location_id,
       department_id
from departments;

select location_id,
       location_id
from departments;

select last_name,
       salary,
       salary + 300
from employees;    

select * 
from employees;

select last_name,
       salary,
       12 * salary + 100
from employees;    

select last_name,
       salary,
       12 * (salary + 100)
from employees;

select last_name,
       job_id,
       salary,
       commission_pct
from employees;

-- 함수 NVL(널값, 바꿀값): 널값을 0으로 변경해서 반환
select last_name,
       commission_pct,
       12 * salary * NVL(commission_pct, 0)
from employees;      

/* 
as: [계산식] as [별칭] 
(as keyword 생략 가능, 대소문자 구별이나 특수문자 있을 땐 큰따옴표로 묶어줘야함)
*/
select last_name as name,
       commission_pct as comm
from employees; 

/*
||: 연결 연산자
*/
select last_name || job_id as "Employees",
       last_name,
       job_id
from employees;

/*
리터럴은 ''로 묶어줌. 숫자는 그냥 써도 됨
*/
select last_name||'('||job_id||')' "Employees",
       last_name,
       job_id
from employees;

select last_name||'의 직업은 '||job_id||'입니다'
       as introduce
from employees;

select last_name||' is '||job_id||' '||333333
       as introduce
from employees;

/* distinct: 중복값 제거 */
select distinct department_id
from employees;

/* [department_id와 job_id] 가 중복되는 값(row) 제거(같은 부서 안에서 같은 직업인 사람 중복 제거)*/
select distinct department_id, job_id
from employees;

/* 
desc: describe 약어
그냥 왼쪽 탭에서 테이블 더블클릭해도 확인 가능
*/
desc employees;

--1. DEPARTMENTS 테이블의 모든 데이터를 조회하시오.
select *
from departments;

--2. EMPLOYEES 테이블에서
--  사원 번호가 가장 앞에 오고 이어서 각 사원의 이름(last_name), 업무 코드(job_id), 입사일(hire_date)이 오도록 질의를 작성하시오. 
-- HIRE_DATE 열에 STARTDATE라는 별칭을 지정하시오. 
select employee_id,
       last_name,
       job_id,
       hire_date STARTDATE
from employees;       

--3. EMPLOYEES 테이블의 업무 코드(job_id)를 중복되지 않게 표시하는 질의를 작성하시오.
select distinct job_id
from employees;

--4. 2번의 명령문을 복사하시오. 
--머리글을 각각 Emp #, Employee, Job 및 Hire Date로 명명한 다음 질의를 다시 실행하시오.
select employee_id "Emp #",
       last_name "Employee",
       job_id "Job",
       hire_date "Hire_Date"
from employees;

--5. 업무 ID(job_id)와 이름(last_name)을 연결한 다음 쉼표 및 공백으로 구분하여 표시하고 열 이름을 Employee and Title로 지정하시오.
select job_id || ', ' || last_name "Employee and Title"
from employees;

--where: 출력되는 row 제한
select employee_id,
       last_name,
       job_id,
       department_id
from employees
where department_id = 110;

select last_name,
       job_id,
       department_id
from employees
where last_name = 'Whalen';

--날짜(yy_mm_dd) 작은 따옴표로 묶어
select last_name
from employees
where hire_date = '06_01_03';

select last_name,
       salary
from employees
where salary <= 3000;

-- between {low} and {high}: low랑 high값도 포함임
-- 숫자, 문자, 날짜 다 됨
select last_name,
       salary
from employees
where salary between 2500 and 3500;

-- 실행되고 오류안뜸. 조심혀
select last_name,
       salary
from employees
where salary between 3500 and 2500;

select last_name
from employees
where last_name between 'King' and 'Smith';

-- S로 시작하는 이름만 나옴
select last_name
from employees
where last_name between 'S' and 'T';

--S로 시작하는 이름 + T로 시작하는 이름 다 나옴
--z가 가장 마지막이니까 한글로 치면 '힣'
select last_name
from employees
where last_name between 'S' and 'Tzzzzz';

-- in(): in안에 들어있는 값을 가지고 있는 row로 제한
select employee_id,
       last_name,
       salary,
       manager_id
from employees
where manager_id in (100, 101, 201);

select employee_id,
       manager_id, 
       department_id,
       last_name
from employees
where last_name in ('Hartstein');

-- like 'S%': S로 시작하는 모든 문자
select first_name
from employees
where first_name like 'S%';

-- 06년 이후로 입사한 사원들 출력
-- 우리나라 날짜 데이터는 yy_mm_dd 이기 때문에
select last_name,
       hire_date
from employees
where hire_date like '06%';

-- like '_o%': 두번째 문자가 o인 이름 가진 사원들 출력
select last_name
from employees
where last_name like '_o%';












