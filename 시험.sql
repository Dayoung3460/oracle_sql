-- 1.
select employee_id,
       last_name,
       salary,
       department_id
from employees
where salary >= 7000
and salary <= 12000
and last_name like 'H%';

-- 2.
select employee_id,
       last_name,
       job_id,
       salary,
       department_id
from employees
where department_id in (50, 60)
and salary > 5000;

-- 3.
select last_name,
       salary,
       (case when salary <= 5000 then salary * 1.2
             when salary <= 10000 then salary * 1.15
             when salary <= 15000 then salary * 1.1
                                  else salary
        end) increased_salary
from employees
where employee_id = &employee_id;

-- 4.
select department_id,
       department_name,
       city
from departments d join locations l 
    on d.location_id = l.location_id;

select department_id,
       department_name,
       city
from departments d natural join locations l;

select department_id,
       department_name,
       city
from departments d, locations l
where d.location_id = l.location_id;

-- 5.
select employee_id,
       last_name,
       job_id
from employees
where department_id = (select department_id
                       from departments
                       where upper(department_name) = 'IT');
                       
-- 6.
alter session set
nls_date_language = american;

select employee_id,
       first_name,
       last_name,
       email,
       phone_number,
       to_char(hire_date, 'fmdd"-"Mon"-"yy') hire_date,
       job_id,
       salary,
       commission_pct,
       manager_id,
       department_id
from employees
where hire_date < to_date('2005', 'yyyy')
and upper(job_id) = 'ST_CLERK';

-- 7.
select last_name,
       job_id,
       salary,
       commission_pct
from employees
where commission_pct is not null
order by salary desc;

-- 8.
create table prof(profno number(4),
                  name varchar2(15) not null,
                  id varchar2(15) not null,
                  hiredate date,
                  pay number(4));
                  
-- 9.
-- (1)
insert into prof(profno,
            name,
            id,
            hiredate,
            pay)
values(1001,
       'Mark',
       'm1001',
       '07_03_01',
       800);
       
insert into prof(profno,
            name,
            id,
            hiredate)
values(1003,
       'Adam',
       'a1003',
       '11_03_02');
       
commit;
       
-- (2)
update prof
set pay = 1200
where profno = 1001;

-- (3)
delete prof
where profno = 1003;

-- 10.
-- (1)
alter table prof
add primary key(profno);

-- (2)
alter table prof
add (gender char(3));

-- (3)
alter table prof
modify (name varchar2(20));
