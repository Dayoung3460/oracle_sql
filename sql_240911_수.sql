select last_name,
       job_id,
        salary
from employees
where job_id = 'SA_REP' or job_id = 'AD_PRES' and salary > 15000;

select last_name,
       job_id,
        salary
from employees
where job_id in ('SA_REP', 'AD_PRES') and salary > 15000;
--where (job_id = 'SA_REP' or job_id = 'AD_PRES') and salary > 15000;

-- _: 한글자 뜻함. 진짜 텍스트로 사용하려면 escape
select job_id
from employees
where job_id like '%SA\_%' escape '\';


select job_id
from employees
where job_id like '%\_%' escape '\';

select last_name,
manager_id
from employees
where manager_id is null;

-- not: is null에서는 not이 중간에 들어가지면 그 외엔 is 앞에 not
select last_name,
manager_id
from employees
where manager_id is not null;

select employee_id,
        last_name,
        job_id,
        salary
from employees
where salary >= 10000 and job_id like '%MAN%';

select employee_id,
        last_name,
        job_id,
        salary
from employees
where salary >= 10000
and job_id like '%MAN%';



select last_name,
        manager_id
from employees
where manager_id is not null;

select last_name,
        manager_id
from employees
where manager_id is null;

select job_id
from employees
where job_id like '%SA%' escape '\';

select last_name
from employees
where last_name like '_o%';

select last_name,
        hire_date
from employees
where hire_date like '06%';

select first_name
from employees
where first_name like 'S%';

select employee_id,
        manager_id,
        department_id,
        last_name
from employees
where last_name in ('Hartstein');

select employee_id,
        last_name,
        salary,
        manager_id
from employees
where manager_id in (100, 101, 201);

select last_name
from employees
where last_name between 'S' and 'Tz';

select last_name
from employees
where last_name between 'S' and 'T';

select last_name
from employees
where last_name between 'S' and 'Tzzzzzz';

select last_name
from employees
where last_name between 'King' and 'Smith';

-- low, high값도 포함임
select last_name,
        salary
from employees
where salary between 2500 and 3500
order by salary;

select last_name,
        salary
from employees
where salary <= 3000;

select *
from  tab;

select *
from departments;

select DEPARTMENT_ID,
        DEPARTMENT_NAME,
        MANAGER_ID,
        LOCATION_ID
from departments;

select last_name,
        salary,
        salary + 300
from employees;

select last_name,
        salary,
        12 * salary + 100
from employees;

--order by: 오름차순일 때 널값은 젤 마지
select last_name,
        job_id,
        salary,
        commission_pct막
from employees
order by commission_pct;

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

select last_name||'의 직업은 '||job_id||'입니다' as introduce
from employees;

select last_name||' is '||job_id||' '||333333 as introduce
from employees;

/* distinct: 중복값 제거 */
select distinct department_id
from employees;

select department_id
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
-- 사원 번호가 가장 앞에 오고 이어서 각 사원의 이름(last_name), 업무 코드(job_id), 입사일(hire_date)이 오도록 질의를 작성하시오.
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
select last_name, hire_date
from employees
where hire_date = '94_08_16';

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
where hire_date like '95%';

-- like '_o%': 두번째 문자가 o인 이름 가진 사원들 출력
select last_name
from employees
where last_name like '_o%';


select last_name,
        salary
from employees
where salary = 3000;

select last_name,
        job_id,
        department_id
from employees
where last_name = 'Whalen';

select employee_id,
        last_name,
        job_id,
        department_id
from employees
where department_id = 110;

select employee_id,
        last_name,
        job_id,
        department_id
from employees
where department_id = 90;

select distinct department_id, job_id
from employees;

select department_id, job_id
from employees;

select job_id || ', ' || last_name "Employee and Title"
from employees;

select employee_id "Emp #",
        last_name "Employee",
        job_id "Job",
        hire_date "Hire_Date"
from employees;

select distinct job_id
from employees;

select employee_id,
        last_name,
        job_id,
        hire_date STARTDATE
from employees;

select *
from departments;

select distinct department_id
from employees;

select department_id
from employees;

select last_name||' is '||job_id||' '||333333
as introduce
from employees;

select last_name||'is '||job_id||333333
as introduce
from employees;

select last_name||'의 직업은 '||job_id||'입니다'
as introduce
from employees;

select last_name||'('||job_id||')' "Employees",
        last_name,
        job_id
from employees;

select last_name as name,
commission_pct as comm
from employees;

select last_name as name,
commission_pct,
12 * salary * NVL(commission_pct, 0) as "commC"
from employees;

select last_name as name,
commission_pct,
12 * salary * NVL(commission_pct, 0) as comm
from employees;

select last_name,
commission_pct,
12 * salary * nvl(commission_pct, 0) as no_null
from employees;

select last_name,
commission_pct,
12 * salary * commission_pct
from employees;

select last_name,
job_id,
salary,
commission_pct
from employees;

select last_name,
salary,
salary + 300
from employees;

select location_id,
location_id
from departments;

select location_id,
department_id
from departments;

select DEPARTMENT_ID,
DEPARTMENT_NAME,
MANAGER_ID,
LOCATION_ID
from departments;

select *
from  tab;

select DEPARTMENT_Id,
DEPARTMENT_NAME,
MANAGER_ID,
LOCATION_ID
from departments;

select department_id
from departments;

grant connect, resource to hr;
SELECT *
FROM TAB;


--1. DEPARTMENTS 테이블의 구조를 표시하고 테이블의 모든 데이터를 선택하시오.
DESC departments;
SELECT *
FROM   departments;

--2. EMPLOYEES 테이블의 구조를 표시하시오. 사원 번호(employee_id)가 가장 앞에 오고 이어서 각 사원의 이름(last_name), 업무 코드(job_id), 입사일(hire_date)이 오도록 질의를 작성하시오. HIRE_DATE 열에 STARTDATE라는 별칭을 지정하시오.
DESC employees;
SELECT employee_id, last_name, job_id, hire_date AS startdate
FROM   employees;

--3. EMPLOYEES 테이블의 업무 코드(job_id)를 중복되지 않게 표시하는 질의를 작성하시오.
SELECT DISTINCT job_id
FROM   employees;

--4. 2번의 명령문을 복사하시오. 머리글을 각각 Emp #, Employee, Job 및 Hire Date로 명명한 다음 질의를 다시 실행하시오.
SELECT employee_id "Emp #", last_name "Employee", job_id "Job", hire_date "Hire Date"
FROM   employees;

--5. 업무 ID(job_id)와 이름(last_name)을 연결한 다음 쉼표 및 공백으로 구분하여 표시하고 열 이름을 Employee and Title로 지정하시오.
SELECT job_id || ', ' || last_name AS "Employee and Title"
FROM   employees;


--1. 급여가 12,000를 넘는 사원의 이름과 급여를 표시하는 질의를 실행하시오.
select last_name,
       salary
from employees
where salary > 12000;

--2. 사원 번호가 176인 사원의 이름과 부서 번호를 표시하는 질의를 실행하시오.
select last_name, department_id
from employees
where employee_id = 176;


--3. 급여가 5,000에서 12,000 사이에 포함되지 않는 
--   모든 사원의 이름과 급여를 표시하도록 질의를 실행하시오.

select last_name,
       salary
from employees
where salary not between 5000 and 12000;

--4. last name이 Matos와 Taylor인 사원의 last_name, 업무 ID, 그리고 입사일을 표시하시오.
select last_name,
       job_id,
       hire_date
from employees
where last_name in ('Matos', 'Taylor');


--6. 급여가 5,000와 12,000 사이이고 부서 번호가 20 또는 50인 사원의 이름과 급여를 나열하도록 질의를 작성하시오. 
--   열 레이블은 Employee와 Monthly Salary로 각각 지정하시오.
select last_name "Employee",
       salary "Monthly Salary",
       department_id
from employees
where salary between 5000 and 12000
  and (department_id = 20 
  or department_id = 50);
  

--7. 2004년에 입사한 모든 사원의 이름과 입사일을 표시하시오.
select last_name,
       hire_date
from employees
where hire_date like '04%';

--8. 관리자가 없는 모든 사원의 이름과 업무를 표시하시오.
select last_name,
       job_id
from employees
where manager_id is null;

--10. 이름의 세번째 문자가 a인 모든 사원의 이름을 표시하시오.
select last_name
from employees
where last_name like '__a%';

--11. 이름에 a와 e가 있는 모든 사원의 이름을 표시하시오.
select last_name
from employees
where last_name like '%a%' and last_name like '%e%';
--where {col name} in (): checks for exact matches rather than patterns.
--where last_name in ( '%a%',  '%e%');

--12. 업무가 영업 사원(SA_REP) 또는 사무원(ST_CLERK)이면서 
    --급여가 2,500, 3,500, 7,000이 아닌 모든 사원의 이름, 업무 및 급여를 표시하시오.
select last_name, job_id, salary
from employees
where job_id in ('SA_REP', 'ST_CLERK')
and salary not in (2500, 3500, 7000);

--13. 커미션 비율(commission_pct)이 20%인 모든 사원의 이름, 급여 및 커미션을 표시하도록 
    --명령문을 작성하여 실행하시오.
select last_name, salary, commission_pct
from employees
--The IS operator is used to check for NULL values, not for equality comparisons.
--where commission_pct is 0.2
where commission_pct = 0.2;



--1. 급여가 12,000를 넘는 사원의 이름과 급여를 표시하는 질의를 실행하시오.
SELECT last_name, salary
FROM   employees
WHERE  salary > 12000; 

--2. 사원 번호가 176인 사원의 이름과 부서 번호를 표시하는 질의를 실행하시오.
SELECT last_name, department_id
FROM   employees
WHERE  employee_id = 176;

--3. 급여가 5,000에서 12,000 사이에 포함되지 않는 모든 사원의 이름과 급여를 표시하도록 질의를 실행하시오.
SELECT last_name, salary
FROM   employees
WHERE  salary NOT BETWEEN 5000 AND 12000;

-- 큰따옴표를 사용할 때는 as 로 별칭 사용할 때, 나중에 배울 함수 딱 두군데 뿐임

--4. last_name이 Matos와 Taylor인 사원의 last_name, 업무 ID, 그리고 입사일을 표시하시오. 결과는 입사일을 기준으로 오름차순 정렬하시오.
SELECT   last_name, job_id, hire_date
FROM     employees
WHERE    last_name IN ('Matos', 'Taylor')
ORDER BY hire_date;
--또는
SELECT   last_name, job_id, hire_date
FROM     employees
WHERE    last_name IN ('Matos', 'Taylor')
ORDER BY 3;

--5. 부서 20 및 50에 속하는 모든 사원의 이름과 부서 번호를 이름을 기준으로 영문자순으로 표시하시오.
SELECT   last_name, department_id
FROM     employees
WHERE    department_id IN (20, 50)
ORDER BY last_name;
--또는
SELECT   last_name, department_id
FROM     employees
WHERE    department_id IN (20, 50)
ORDER BY 1;

--6. 급여가 5,000와 12,000 사이이고 부서 번호가 20 또는 50인 사원의 이름과 급여를 나열하도록 질의를 작성하시오. 열 레이블은 Employee와 Monthly Salary로 각각 지정하시오.
SELECT last_name "Employee", salary "Monthly Salary"
FROM   employees
WHERE  salary BETWEEN 5000 AND 12000 
AND    department_id IN (20, 50);

--7. 2004년에 입사한 모든 사원의 이름과 입사일을 표시하시오.
SELECT last_name, hire_date
FROM   employees
WHERE  hire_date LIKE '04%';

--8. 관리자가 없는 모든 사원의 이름과 업무를 표시하시오.
SELECT last_name, job_id
FROM   employees
WHERE  manager_id IS NULL;

--9. 커미션을 받는 모든 사원의 이름, 급여 및 커미션을 급여 및 커미션을 기준으로 내림차순으로 정렬하여 표시하시오.
SELECT   last_name, salary, commission_pct
FROM     employees
WHERE    commission_pct IS NOT NULL
ORDER BY salary DESC, commission_pct DESC;

--10. 이름의 세번째 문자가 a인 모든 사원의 이름을 표시하시오.
SELECT last_name
FROM   employees
WHERE  last_name LIKE '__a%';

--11. 이름에 a와 e가 있는 모든 사원의 이름을 표시하시오.
SELECT last_name 
FROM   employees
WHERE  last_name LIKE '%a%'
AND    last_name LIKE '%e%';

--12. 업무가 영업 사원(SA_REP) 또는 사무원(ST_CLERK)이면서 급여가 2,500, 3,500 또는 7,000이 아닌 모든 사원의 이름, 업무 및 급여를 표시하시오.
SELECT last_name, job_id, salary
FROM   employees
WHERE  job_id IN ('SA_REP', 'ST_CLERK')
AND    salary NOT IN (2500, 3500, 7000);

--13. 커미션 비율(commission_pct)이 20%인 모든 사원의 이름, 급여 및 커미션을 표시하도록 명령문을 작성하여 실행하시오.
SELECT last_name, salary, commission_pct
FROM   employees
WHERE  commission_pct = .20;



