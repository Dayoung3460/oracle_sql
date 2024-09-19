select last_name,
       job_id
from employees
where job_id = (select job_id
                from employees
                where employee_id = 141);
                
select last_name,
       job_id
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
-- 이건 왜 안되지
select e.last_name,
       e.department_id,
       d.department_id,
       e.job_id
from employees e, departments d
where location_id = 1700;

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
       salary
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
values (70, 'Public Relations', 100, 1700);















            