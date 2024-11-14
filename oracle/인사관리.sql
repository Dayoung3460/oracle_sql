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

-- ÇÔ¼ö NVL(³Î°ª, ¹Ù²Ü°ª): ³Î°ªÀ» 0À¸·Î º¯°æÇØ¼­ ¹ÝÈ¯
select last_name,
       commission_pct,
       12 * salary * NVL(commission_pct, 0)
from employees;      

/* 
as: [°è»ê½Ä] as [º°Äª] 
(as keyword »ý·« °¡´É, ´ë¼Ò¹®ÀÚ ±¸º°ÀÌ³ª Æ¯¼ö¹®ÀÚ ÀÖÀ» ¶© Å«µû¿ÈÇ¥·Î ¹­¾îÁà¾ßÇÔ)
*/
select last_name as name,
       commission_pct as comm
from employees; 

/*
||: ¿¬°á ¿¬»êÀÚ
*/
select last_name || job_id as "Employees",
       last_name,
       job_id
from employees;

/*
¸®ÅÍ·²Àº ''·Î ¹­¾îÁÜ. ¼ýÀÚ´Â ±×³É ½áµµ µÊ
*/
select last_name||'('||job_id||')' "Employees",
       last_name,
       job_id
from employees;

select last_name||'ÀÇ Á÷¾÷Àº '||job_id||'ÀÔ´Ï´Ù'
       as introduce
from employees;

select last_name||' is '||job_id||' '||333333
       as introduce
from employees;

/* distinct: Áßº¹°ª Á¦°Å */
select distinct department_id
from employees;

/* [department_id¿Í job_id] °¡ Áßº¹µÇ´Â °ª(row) Á¦°Å(°°Àº ºÎ¼­ ¾È¿¡¼­ °°Àº Á÷¾÷ÀÎ »ç¶÷ Áßº¹ Á¦°Å)*/
select distinct department_id, job_id
from employees;

/* 
desc: describe ¾à¾î
±×³É ¿ÞÂÊ ÅÇ¿¡¼­ Å×ÀÌºí ´õºíÅ¬¸¯ÇØµµ È®ÀÎ °¡´É
*/
desc employees;

--1. DEPARTMENTS Å×ÀÌºíÀÇ ¸ðµç µ¥ÀÌÅÍ¸¦ Á¶È¸ÇÏ½Ã¿À.
select *
from departments;

--2. EMPLOYEES Å×ÀÌºí¿¡¼­
--  »ç¿ø ¹øÈ£°¡ °¡Àå ¾Õ¿¡ ¿À°í ÀÌ¾î¼­ °¢ »ç¿øÀÇ ÀÌ¸§(last_name), ¾÷¹« ÄÚµå(job_id), ÀÔ»çÀÏ(hire_date)ÀÌ ¿Àµµ·Ï ÁúÀÇ¸¦ ÀÛ¼ºÇÏ½Ã¿À. 
-- HIRE_DATE ¿­¿¡ STARTDATE¶ó´Â º°ÄªÀ» ÁöÁ¤ÇÏ½Ã¿À. 
select employee_id,
       last_name,
       job_id,
       hire_date STARTDATE
from employees;       

--3. EMPLOYEES Å×ÀÌºíÀÇ ¾÷¹« ÄÚµå(job_id)¸¦ Áßº¹µÇÁö ¾Ê°Ô Ç¥½ÃÇÏ´Â ÁúÀÇ¸¦ ÀÛ¼ºÇÏ½Ã¿À.
select distinct job_id
from employees;

--4. 2¹øÀÇ ¸í·É¹®À» º¹»çÇÏ½Ã¿À. 
--¸Ó¸®±ÛÀ» °¢°¢ Emp #, Employee, Job ¹× Hire Date·Î ¸í¸íÇÑ ´ÙÀ½ ÁúÀÇ¸¦ ´Ù½Ã ½ÇÇàÇÏ½Ã¿À.
select employee_id "Emp #",
       last_name "Employee",
       job_id "Job",
       hire_date "Hire_Date"
from employees;

--5. ¾÷¹« ID(job_id)¿Í ÀÌ¸§(last_name)À» ¿¬°áÇÑ ´ÙÀ½ ½°Ç¥ ¹× °ø¹éÀ¸·Î ±¸ºÐÇÏ¿© Ç¥½ÃÇÏ°í ¿­ ÀÌ¸§À» Employee and Title·Î ÁöÁ¤ÇÏ½Ã¿À.
select job_id || ', ' || last_name "Employee and Title"
from employees;

--where: Ãâ·ÂµÇ´Â row Á¦ÇÑ
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

--³¯Â¥(yy_mm_dd) ÀÛÀº µû¿ÈÇ¥·Î ¹­¾î
select last_name
from employees
where hire_date = '06_01_03';

select last_name,
       salary
from employees
where salary <= 3000;

-- between {low} and {high}: low¶û high°ªµµ Æ÷ÇÔÀÓ
-- ¼ýÀÚ, ¹®ÀÚ, ³¯Â¥ ´Ù µÊ
select last_name,
       salary
from employees
where salary between 2500 and 3500;

-- ½ÇÇàµÇ°í ¿À·ù¾È¶ä. Á¶½ÉÇô
select last_name,
       salary
from employees
where salary between 3500 and 2500;

select last_name
from employees
where last_name between 'King' and 'Smith';

-- S·Î ½ÃÀÛÇÏ´Â ÀÌ¸§¸¸ ³ª¿È
select last_name
from employees
where last_name between 'S' and 'T';

--S·Î ½ÃÀÛÇÏ´Â ÀÌ¸§ + T·Î ½ÃÀÛÇÏ´Â ÀÌ¸§ ´Ù ³ª¿È
--z°¡ °¡Àå ¸¶Áö¸·ÀÌ´Ï±î ÇÑ±Û·Î Ä¡¸é 'ÆR'
select last_name
from employees
where last_name between 'S' and 'Tzzzzz';

-- in(): in¾È¿¡ µé¾îÀÖ´Â °ªÀ» °¡Áö°í ÀÖ´Â row·Î Á¦ÇÑ
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

-- like 'S%': S·Î ½ÃÀÛÇÏ´Â ¸ðµç ¹®ÀÚ
select first_name
from employees
where first_name like 'S%';

-- 06³â ÀÌÈÄ·Î ÀÔ»çÇÑ »ç¿øµé Ãâ·Â
-- ¿ì¸®³ª¶ó ³¯Â¥ µ¥ÀÌÅÍ´Â yy_mm_dd ÀÌ±â ¶§¹®¿¡
select last_name,
       hire_date
from employees
where hire_date like '06%';

-- like '_o%': µÎ¹øÂ° ¹®ÀÚ°¡ oÀÎ ÀÌ¸§ °¡Áø »ç¿øµé Ãâ·Â
select last_name
from employees
where last_name like '_o%';












