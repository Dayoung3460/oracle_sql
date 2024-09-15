select last_name,
       job_id,
       department_id,
       hire_date
from employees
order by hire_date;

-- ASC(오름차순)이 디폴드값이라 안써도 됨.
-- department_id로 정렬
select last_name,
       job_id,
       department_id,
       hire_date
from employees
order by 3;

-- department_id 먼저 asc로 정렬하고 salary를 desc로 정렬
select last_name,
       department_id,
       salary
from employees
order by department_id, salary desc;

select last_name,
       department_id,
       salary
from employees
order by department_id desc, salary desc;

-- &(치환변수): 한번 쓰고 버리는 변수.(변수명 크게 신경안써도 됨)
-- 메모리에 안남음
select employee_id,
       last_name,
       salary,
       department_id
from employees
where employee_id = &employee_num;

-- 값이 문자열이면 변수도 작은따옴표로 묶어줘야함
-- 안묶으면 값 입력할 때 따옴표 붙여줘야함
select last_name,
       salary * 12,
       department_id,
       job_id
from employees
where job_id = '&job_title';

select last_name,
       salary * 12,
       department_id,
       job_id
from employees
where job_id = &job_title;

select employee_id,
       last_name,
       job_id,
       &&c_id
from employees
order by &c_id;

-- 변수를 지움
undefine c_id;


--4. last name이 Matos와 Taylor인 사원의 last_name, 업무 ID, 그리고 입사일을 표시하시오. 
--   결과는 입사일을 기준으로 오름차순 정렬하시오.
select last_name,
       job_id,
       hire_date
from employees
where last_name in ('Matos', 'Tayler')
order by hire_date;
   
   

--5. 부서 20 및 50에 속하는 모든 사원의 이름과 부서 번호를 이름을 기준으로 영문자순으로 표시하시오.
select last_name,
       department_id
from employees
where department_id in (20, 50)
order by last_name;

--9. 커미션을 받는 모든 사원의 이름, 급여 및 커미션을 급여 및 커미션을 기준으로 내림차순으로 정렬하여 표시하시오.
select last_name,
       salary,
       commission_pct
from employees
where commission_pct is not null
order by salary desc, commission_pct desc;

-- dual: 오라클이 기본적으로 제공하는 테이블
desc dual;

select *
from dual;

-- row개수만큼 날짜 출력
select sysdate
from employees;

select sysdate
from dual;

select 'The job is for ' ||
       upper(last_name) ||
       ' is ' ||
       lower(job_id)
       as "EMPLOYEE DETAILS"
from employees;

select employee_id,
       last_name,
       department_id
from employees
where last_name = 'higgins';

select employee_id,
       last_name,
       department_id
from employees
where lower(last_name) = 'higgins';

select employee_id,
       last_name,
       department_id
from employees
where lower(last_name) like '%er';

select employee_id,
       concat (first_name, last_name) name,
       job_id,
       length (last_name),
       instr(last_name, 'a') "Contains 'a'?"
from employees
where substr(job_id, 4) = 'REP';

-- substr(last_name, 2, 3): idx 2부터 3자리
-- idx 1부터
select last_name,
       substr(last_name, 2),
       substr(last_name, 2, 3),
       substr(last_name, -2),
       substr(last_name, -4, 2)
from employees;

select 20 || substr(hire_date, 1, 2)
from employees;

select upper(last_name) u_Name,
       length(last_name) l_name
from employees
--where last_name like 'J%' or last_name like 'A%' or last_name like 'M%'
where upper(substr(last_name, 1, 1)) in ('J', 'A', 'M')
order by u_Name;

-- lpad(salary, 15, '$'): 
-- salary를 15자리까지 출력하는데 모자라는 자리수는 $로 채움 왼쪽에서부터
select first_name,
       lpad(salary, 15, '$') salary
from employees
order by salary;

-- round: 반올림
select round(45.923, 2), 
       round(45.923, 0),
       round(45.923, -1),
       round(45.923)
from dual;

-- trunc: 내림
select trunc(45.923, 2), 
       trunc(45.923, 0),
       trunc(45.923, -1),
       trunc(45.923)
from dual;

-- mod({first}, {second}): first를 second로 나눴을 때 나머지
-- modulo = 나머지 연산
select last_name,
       salary,
       mod(salary, 5000)
from employees
where job_id = 'SA_REP';

select sysdate
from dual;

select to_char(sysdate, 'yyyy.mm.dd hh24:mi:ss')
from dual;

-- (날짜 - 날짜) = 일수 반한
select last_name,
       hire_date,
       (sysdate - hire_date) / 7 as "WEEKS"
from employees
where department_id = 90;

select employee_id,
       last_name,
       salary,
       trunc(salary * 1.15, 0) "New Salary"
from employees;

select employee_id,
       last_name,
       salary,
       trunc(salary * 1.15, 0) "New Salary",
       trunc(salary * 1.15, 0) - salary "Increase"
from employees;

select employee_id,
       hire_date,
       months_between(sysdate, hire_date) tenure,
        months_between('24_11_12', sysdate) test,
       add_months(hire_date, 6) review,
       -- 입사 후 돌아오는 첫번째 금요일
       next_day(hire_date, '금'),
       -- 해당 달의 마지막 날
       last_day(hire_date)
from employees;

-- 날짜 반올림 기준 
-- 연: 6월 30일 자정
-- 달: 15일 자정(한 달에 며칠있는지 상관없)
-- 주: 수요일 낮 12시
-- 일: 낮 12시
select round(sysdate, 'year'),
       round(sysdate, 'month'),
       round(sysdate, 'day'),
       round(sysdate, 'dd')
from dual;

select trunc(sysdate, 'year'),
       trunc(sysdate, 'month'),
       trunc(sysdate, 'day'),
       trunc(sysdate, 'dd')
from dual;

select last_name,
       round(months_between(sysdate, hire_date)) "MONTHS_WORKED"
from employees;

select last_name,
       trunc((sysdate - hire_date) / 7) as "TENURE"
from employees
where department_id = 90;

-- department_id는 숫잔데 '90' 따옴표로 묶어도 암시적으로 숫자 타입으로 변환됨
select *
from employees
where department_id = '90';

-- to_char(): 날짜 타입 -> 문자 타입 변환
select to_char(hire_date, 'mm/yy') "Month_Hired",
       employee_id
from employees;

alter session set
nls_date_language = american;

-- 날짜 형식 요소는 대소문자 구분함
-- month / Month 구분함
-- dd앞에 fm: 날이 한자리일 때 앞에 0 붙여주는데 fm 쓰면 0 안붙여줌
select last_name,
       to_char(hire_date, 'dd Month yyyy') hiredate
from employees;

-- '' 안에서 문자열 써야될 때 ""로 묶으면 됨
select last_name,
       to_char(hire_date,
       'Ddspth "of" Month yyyy hh:mi:ss am') hiredate
from employees;

-- 숫자 형식 요소
-- 9: 숫자를 표시. 본 숫자만큼 자리수 표현됨
select salary,
       to_char(salary, '$99,999.00') new_salary,
       to_char(salary, 'L99,999.00') new_salary
from employees
where last_name = 'Ernst';

select to_number('$3,400', '$9,999')
from dual;

select to_number('3400')
from dual;

select to_date('2010년, 02월', 'yyyy"년", mm"월"')
from dual;

-- 2006년 이전에 입사한 사원들
select last_name,
        hire_date
from employees
--where to_char(hire_date, 'yyyy') < '2006';
where hire_date < to_date('2006', 'yyyy');


alter session set
nls_date_language = korean;

select last_name || ' earns ' || to_char(salary, '$999,999.00') || ' monthly but wants ' || to_char(salary * 3, '$999,999.00') || '.'
         as "Dream Salaries"
from employees;

select last_name || 
       ' earns ' || 
       to_char(salary, 'fm$999,999.00') || 
       ' monthly but wants ' || 
       to_char(salary * 3, 'fm$9,999,999.00') || 
       '.' 
       as "Dream Salaries"
from employees;

select last_name,
       hire_date,
       to_char(next_day(add_months(hire_date, 6), '월요일'), 'yyyy.mm.dd day') review
from employees;

select last_name,
       salary,
       nvl(commission_pct, 0),
       (salary * 12) + (salary * 12 * nvl(commission_pct, 0))
       as an_sal
from employees;

-- commission_pct에 null이 있을 수 있기 an_sal2 null 나오는 사람이 있음
select last_name,
       salary,
       nvl(commission_pct, 0),
       (salary * 12) + (salary * 12 * commission_pct)
       as an_sal2
from employees;

-- nvl(): 첫번째, 두번째 인자 같은 타입이여야함
select commission_pct,
--       nvl(commission_pct, 0)
--       nvl(commission_pct, '커미션 없음')
       nvl(to_char(commission_pct), '커미션 없음')
from employees;

-- nvl2({null일 수 있는 값}, {널이 아닐 경우 출력되는 값}, {널일 때 출력되는 값})
-- 두번째, 세번째 인자 타입이 같아야함. 첫번째는 상관없
select last_name,
       department_id,
       salary,
       commission_pct,
       nvl2(commission_pct, 'SAL+COMM', 'SAL') income
from employees
where department_id in (50, 80);

-- nullif(): 두개 인자값이 같으면 널 반환. 다르면 첫번째 인자값 반환
select first_name,
       length(first_name) "expr1",
       length(last_name) "expr2",
       nullif(length(first_name), length(last_name)) result
from employees;

select last_name,
       job_id,
       salary,
       case job_id when 'IT_PROG' then 1.10 * salary
                   when 'ST_CKERT' then 1.15 * salary
                   when 'SA_REP' then 1.20 * salary
                   else salary
        end revised_salary
from employees;

select last_name,
       job_id,
       salary,
       (case when job_id = 'IT_PROG' then 1.10 * salary
            when job_id = 'ST_CKERT' then 1.15 * salary
            when job_id = 'SA_REP' then 1.20 * salary
            else salary
        end) revised_salary
from employees;

select last_name,
       salary,
       (case when salary < 5000 then 'Low'
            when salary < 10000 then 'Medium'
            when salary < 20000 then 'Good'
            else 'Excellent'
        end) qualified_salary
from employees;











