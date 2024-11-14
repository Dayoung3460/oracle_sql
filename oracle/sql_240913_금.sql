select last_name,
       nvl(to_char(commission_pct), 'No Commission') comm
from employees;

select job_id,
       (case when job_id = 'AD_PRES'  then 'A'
             when job_id = 'ST_MAN'   then 'B'
             when job_id = 'IT PROG'  then 'C'
             when job_id = 'SA_REP'   then 'D'
             when job_id = 'ST_CLERK' then 'E'
                                      else '0'
        end) grade
from employees;

--nvl2(): 오라클 디비에서만 사용가능
select last_name,
       salary,
       commission_pct,
       nvl2(commission_pct, 'Yes', 'No') "commission"
from employees;

-- case when then 구문은 모든 표준 디비에서 다 씀
select last_name,
       salary,
       commission_pct,
       (case when commission_pct is not null then 'Yes'
                                             else 'No'
        end) "commission"              
from employees;

select last_name, 
       salary,
       (case when salary <= 20000 then salary * 1.2
             when salary <= 30000 then salary * 1.15
             when salary <= 50000 then salary * 1.1
                                  else salary
        end) increased_salary
from employees
order by last_name, salary, increased_salary; 

-- 그룹함수: 행 집합에 대해 연산. 값 결과 하나만 반환
select avg(salary),
       max(salary),
       min(salary),
       sum(salary)
from employees
where job_id like '%REP%';

-- 문자, 날짜 타입도 min, max 사용 가능. 오름차순 기준으로. 
select min(hire_date),
       max(hire_date)
from employees;

select min(last_name),
       max(last_name)
from employees;

-- count(*): null포함 행 수 반환
-- count({컬럼명}): 널 제외 행 수 반환
-- count(distinct, {컬럼명}): 중복값 제거하고

-- 부서에 소속된 사원은 몇명인가(department_id가 null인 사람 제외)
select count(department_id)
from employees;

-- 사원이 있는 부서는 몇 개인가
select count(distinct department_id)
from employees;

-- 사원이 몇명이냐
select count(*)
from employees;

-- department_id가 50번인 사원 몇 명이냐
select count(*)
from employees
where department_id = 50;

-- department_id기 80번인 사원중에 commission_pct 받는 사원은 몇 명이냐
select count(commission_pct)
from employees
where department_id = 80;

-- avg(): null값 빼고 계산해서 모든 사원수로 나누지 않음
select avg(commission_pct)
from employees;

-- 널값을 0으로 바꾼 후 평균값 내기
select avg(nvl(commission_pct, 0))
from employees;

-- select 절에 그룹함수 + 일반컬럼(들)이 있다면 group by 절에 일반컬럼(들) 무조건 포함되어야 함.
-- 반대로는 선택적임
select department_id,
       avg(nvl(salary, 0))
from employees
group by department_id;

select avg(nvl(salary, 0))
from employees
group by department_id;

select department_id,
       avg(nvl(salary, 0))
from employees
group by department_id
order by 2;

select department_id,
       job_id,
       sum(salary)
from employees
group by department_id, 
         job_id
order by department_id;

select department_id,
       job_id,
       sum(salary)
from employees
where department_id > 40
group by department_id, 
         job_id
order by job_id;

-- error 
-- 1. employees 테이블에는
-- 2. avg(salary) 컬럼이 없어
-- where는 행을 제한할뿐
select department_id,
       avg(salary)
from employees
where avg(salary) > 8000
group by department_id;

-- error resolved.
-- 1. from 2. group by 3. having 4. select
-- having: where절에서 제어할 수 없었던 부분을 having에서 할 수 있음.
-- where 절과 문법은 같음
-- 그룹을 제한.
-- group by에서 행 그룹화 시키고, having에서 그룹 함수 적용하여 그룹 제한
select department_id,
       avg(salary)
from employees
group by department_id
having avg(salary) > 8000;

select department_id,
       max(salary)
from employees
group by department_id
having max(salary) > 10000;

-- having 절에서 썼던 칼럼을 꼭 select에서 안써도 됨
select department_id,
       avg(salary)
from employees
group by department_id
having max(salary) > 10000;

select job_id,
       sum(salary) payroll
from employees
where job_id not like '%REP%'
group by job_id
having sum(salary) > 13000
order by sum(salary);

-- upper쓰면 더 정확하겠지
-- where절에서는 순수 일반 칼럼가지고 행 제어
select job_id,
       sum(salary) payroll
from employees
where job_id not like upper('%REP%')
group by job_id
having sum(salary) > 13000
order by payroll;

-- group function은 중첩 한번만 가능함
-- 부서별 평균 급여중 젤 높은 값
-- 그룹함수 중첩으로 있을 때 그룹 바이 꼭 있어야함
select max(avg(salary))
from employees
group by department_id;

-- error
-- select 절에 group function 중첩 시 일반칼럼 올 수 없음
select max(avg(salary)),
       department_id
from employees
group by department_id;

-- cross join: 풀스캔. 모든 경우의 수를 루프 돌아서
-- employees * departments 
-- 표준 문법
select last_name,
       department_name
from employees cross join departments;

-- 오라클 문법
-- cross join 안써도됨 쉼표로 구분
select last_name,
       department_name
from employees, departments;

select count(*)
from employees;

select count(*)
from locations;

-- natural join: 두 테이블에서 같은 이름 가진 칼럼(location_id) 기준으로 조인. 교집합만 출력
-- 한 테이블의 기본키와 다른 테이블의 외래키끼리 조인함(대부분. 관계형 데이터베이스기 때문)
-- 표준 문법
select department_id
       department_name,
       location_id,
       city
from departments natural join locations;

-- error
-- natural join 할 때 중복되는 칼럼명(location_id)에 하나의 테이블 별칭 사용 불가.
select d.department_id,
       d.department_name,
       l.location_id,
       l.city
from departments d natural join locations l;

-- 중복되는 칼럼(location_id)앞에 테이블 별칭 안붙이니까 오류안남
select d.department_id,
       d.department_name,
       location_id,
       l.city
from departments d natural join locations l;

-- 오라클 문법
select department_id,
       department_name,
       departments.location_id,
       locations.location_id,
       city
from departments, locations
where departments.location_id = locations.location_id;

-- where 절을 사용하면 from에서 join 키워드 안넣어줘도됨
-- using이나 on을 사용하면 join 넣어줘야함
select d.department_id,
       d.department_name,
       d.location_id,
       l.location_id,
       l.city
from departments d, locations l
where d.location_id = l.location_id;

-- join할 때는 최소 (조인할 테이블 개수 - 1)개의 조건이 있어야함

-- using 칼럼은 소괄호로 묶어야함.
-- using: join할 때 겹치는 칼럼이 두개 이상일 때 어떤 칼럼을 기준으로 조인할지
select employee_id,
       last_name,
       location_id,
       department_id
from employees join departments using (department_id);

-- 표준 문법
select e.employee_id,
       e.last_name,
       e.department_id,
       d.department_id,
       d.location_id
from employees e join departments d
     on (e.department_id = d.department_id);
     
-- 오라클 문법
select e.employee_id,
       e.last_name,
       e.department_id,
       d.department_id,
       d.location_id
from employees e, departments d
where e.department_id = d.department_id;

-- 사원이름과 해당 사원이 소속된 부서이름 출력
-- 오라클 문법
select e.last_name,
       d.department_name
from employees e, departments d
where e.department_id = d.department_id;

-- 위와 같은 쿼리. 표준 문법(where 대신에 on 사용)
select e.last_name,
       d.department_name
from employees e join departments d
     on (e.department_id = d.department_id);

-- 세 개의 테이블을 조인하기 때문에 조인 조건 최소 2개 있어야함
select e.employee_id,
       l.city,
       d.department_name
from employees e join departments d
                  on (d.department_id = e.department_id)
                 join locations l
                  on (d.location_id = l.location_id);
            
-- 오라클 문법
select e.employee_id,
       e.manager_id,
       l.city,
       d.department_name
from employees e, departments d, locations l
where d.department_id = e.department_id
and d.location_id = l.location_id
and e.manager_id = 149;

-- 표준 문법
select e.employee_id,
       l.city,
       d.department_name
from employees e join departments d
                  on (d.department_id = e.department_id)
                 join locations l
                  on (d.location_id = l.location_id)
                 and e.manager_id = 149;

-- 위와 같음                 
select e.employee_id,
       l.city,
       d.department_name
from employees e join departments d
                  on (d.department_id = e.department_id)
                 join locations l
                  on (d.location_id = l.location_id)
where e.manager_id = 149;

-- inner join이 디폴드. 교집합.
-- outer join 합집합(근데 왼쪽이랑 합할지, 오른쪽이랑 합할지, 풀로 합할지)

-- self join. 같은 테이블끼리 별칭만 달리해서 조인함. 
-- 표준 문법
select w.last_name emp,
       m.last_name mgr,
       w.manager_id,
       m.employee_id
from employees w join employees m
                  on (w.manager_id = m.employee_id);

select * from employees;

-- 오라클 문법
select w.last_name emp,
       m.last_name mgr
from employees w, employees m
where w.manager_id = m.employee_id;

CREATE TABLE job_grades (
  grade_level VARCHAR2(3),
  lowest_sal  NUMBER(10),
  highest_sal NUMBER(10));
  
INSERT INTO job_grades
VALUES ('A', 1000, 2999);
INSERT INTO job_grades
VALUES ('B', 3000, 5999);
INSERT INTO job_grades
VALUES ('C', 6000, 9999);
INSERT INTO job_grades
VALUES ('D', 10000, 14999);
INSERT INTO job_grades
VALUES ('E', 15000, 24999);
INSERT INTO job_grades
VALUES ('F', 25000, 40000);

select *
from job_grades;

select e.last_name,
       e.salary,
       j.grade_level,
       j.lowest_sal,
       j.highest_sal
from employees e join job_grades j
on e.salary
   between j.lowest_sal and j.highest_sal;
   
-- 표준 문법(오라클은 outer 키워드 빼도 괜춘)
select e.last_name,
       e.department_id,
       d.department_name
from employees e left outer join departments d
     on (e.department_id = d.department_id);
     
-- 오라클 문법
-- 위와 같은 쿼리
select e.last_name,
       e.department_id,
       d.department_name
from employees e, departments d
where e.department_id = d.department_id(+);

select e.last_name,
       e.department_id,
       d.department_name
from employees e right outer join departments d
     on (e.department_id = d.department_id);
     
-- 오라클 문법
-- 위와 같은 쿼리
select e.last_name,
       e.department_id,
       d.department_name
from employees e, departments d
where e.department_id(+) = d.department_id;
     
select e.last_name,
       e.department_id,
       d.department_id,
       d.department_name
from employees e full outer join departments d
     on (e.department_id = d.department_id);

-- 오라클에서는 full outer join 없음

--1. LOCATIONS 및 COUNTRIES 테이블을 사용하여 모든 부서의 주소를 생성하는 query를 작성하시오. 출력에 위치ID(location_id), 
-- 주소(street_address), 구/군(city), 시/도(state_province) 및 국가(country_name)를 표시하시오.
-- 조인 조건을 안적으면 합집합 출력. 적어야 교집합 
SELECT location_id, street_address, city, state_province, country_name
FROM   locations NATURAL JOIN countries;

SELECT l.location_id, l.street_address, l.city, l.state_province, c.country_name
FROM   locations l JOIN countries c
                     ON (l.country_id = c.country_id);

SELECT l.location_id, l.street_address, l.city, l.state_province, c.country_name
FROM   locations l, countries c
WHERE  l.country_id = c.country_id;

--2. 모든 사원의 이름, 소속 부서번호 및 부서 이름을 표시하는 query를 작성하시오.
select e.last_name,
       e.department_id,
       d.department_name
from employees e join departments d
     on e.department_id = d.department_id; 

-- 에러. natural join은 겹치는 칼럼이 하나만 있을 때
-- 이 쿼리는 두개(department_id, manager_id)라 natural join 안됨
select e.last_name,
       e.department_id,
       d.department_name
from employees e natural join departments d;

-- 겹치는 칼럼 2개 이상일 때 어떤 컬럼 기준으로 할지 USING절
SELECT last_name, department_id, department_name
FROM   employees JOIN departments USING (department_id);

SELECT e.last_name, e.department_id, d.department_name
FROM   employees e, departments d
WHERE  e.department_id = d.department_id;

--3. Toronto에 근무하는 사원에 대한 보고서를 필요로 합니다. toronto(CITY)에서 근무하는 모든 사원의 이름, 직무, 부서번호 및 부서 이름을 표시하시오.
-- 테이블이 세개니까 테이블 조인하는 조건 두개 이상 있어야함
-- 마지막 and l.city = 'Toronto' 는 조인 조건이 아니라 그냥 출력되는 행 제한한거임
SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM   employees e JOIN departments d
                     ON (e.department_id = d.department_id)
                   JOIN locations l
                     ON (d.location_id = l.location_id)
WHERE  LOWER(l.city) = 'toronto';

SELECT e.last_name, e.job_id, e.department_id, d.department_name
FROM   employees e, departments d, locations l
WHERE  e.department_id = d.department_id
AND    d.location_id = l.location_id
AND    LOWER(l.city) = 'toronto';

--4. 사원의 이름 및 사원 번호를 해당 관리자의 이름 및 관리자 번호와 함께 표시하는 보고서를 작성하는데, 
--열 레이블을 각각 Employee, Emp#, Manager 및 Mgr#으로 지정하시오.
SELECT w.last_name "Employee", w.employee_id "EMP#", 
       m.last_name "Manager", m.employee_id "Mgr#"
FROM   employees w JOIN employees m
                     ON (w.manager_id = m.employee_id);
                     
select * 
from employees;

SELECT w.last_name "Employee", w.employee_id "EMP#", 
       m.last_name "Manager", m.employee_id "Mgr#"
FROM   employees w, employees m
WHERE  w.manager_id = m.employee_id;

SELECT w.last_name||'('||w.employee_id||')의 관리자는 '||
       m.last_name||'('||m.employee_id||')입니다.' "Notice"
FROM   employees w, employees m
WHERE  w.manager_id = m.employee_id;

--5. King과 같이 해당 관리자가 지정되지 않은 사원도 표시하도록 4번 문장을 수정합니다. 사원 번호순으로 결과를 정렬하시오. 
SELECT   w.last_name "Employee", w.employee_id "EMP#", 
         m.last_name "Manager", m.employee_id "Mgr#"
FROM     employees w LEFT OUTER JOIN employees m
                                  ON (w.manager_id = m.employee_id)
ORDER BY 2;

SELECT   w.last_name "Employee", w.employee_id "EMP#", 
         m.last_name "Manager", m.employee_id "Mgr#"
FROM     employees w, employees m
WHERE    w.manager_id = m.employee_id(+)
ORDER BY 2;

--6. 직무 등급 및 급여에 대한 보고서를 필요로 합니다. 모든 사원의 이름, 직무, 부서 이름, 급여 및 등급을 표시하는 query를 작성하시오.
-- 테이블 세개니까 조인 조건 두개 건거임
select last_name,
       job_id,
       department_name,
       salary,
       grade_level,
       e.department_id
from employees e, job_grades j, departments d
where e.department_id = d.department_id
and e.salary between j.lowest_sal and highest_sal;

select * from employees;

SELECT e.last_name, e.job_id, d.department_name, e.salary, j.grade_level
FROM   employees e JOIN departments d
                     ON (e.department_id = d.department_id)
                   JOIN job_grades j
                     ON (e.salary BETWEEN j.lowest_sal AND j.highest_sal);

select *
from job_grades;

-- 서브쿼리: 디비 많이 접근할수록 느려. 쿼리가 여러 문장이라도 하나로 표현. 최대한 사용하는게 효율적임. 쿼리 안에 쿼리
-- select 안에 select 서브쿼리 ->
-- 소괄호로 묶어. 비교연산자 뒤에 써
-- 서브쿼리에 오더바이 못씀(from 절에서 사용할 땐 제외)
-- 












