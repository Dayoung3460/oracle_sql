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

-- �Լ� NVL(�ΰ�, �ٲܰ�): �ΰ��� 0���� �����ؼ� ��ȯ
select last_name,
       commission_pct,
       12 * salary * NVL(commission_pct, 0)
from employees;      

/* 
as: [����] as [��Ī] 
(as keyword ���� ����, ��ҹ��� �����̳� Ư������ ���� �� ū����ǥ�� ���������)
*/
select last_name as name,
       commission_pct as comm
from employees; 

/*
||: ���� ������
*/
select last_name || job_id as "Employees",
       last_name,
       job_id
from employees;

/*
���ͷ��� ''�� ������. ���ڴ� �׳� �ᵵ ��
*/
select last_name||'('||job_id||')' "Employees",
       last_name,
       job_id
from employees;

select last_name||'�� ������ '||job_id||'�Դϴ�'
       as introduce
from employees;

select last_name||' is '||job_id||' '||333333
       as introduce
from employees;

/* distinct: �ߺ��� ���� */
select distinct department_id
from employees;

/* [department_id�� job_id] �� �ߺ��Ǵ� ��(row) ����(���� �μ� �ȿ��� ���� ������ ��� �ߺ� ����)*/
select distinct department_id, job_id
from employees;

/* 
desc: describe ���
�׳� ���� �ǿ��� ���̺� ����Ŭ���ص� Ȯ�� ����
*/
desc employees;

--1. DEPARTMENTS ���̺��� ��� �����͸� ��ȸ�Ͻÿ�.
select *
from departments;

--2. EMPLOYEES ���̺���
--  ��� ��ȣ�� ���� �տ� ���� �̾ �� ����� �̸�(last_name), ���� �ڵ�(job_id), �Ի���(hire_date)�� ������ ���Ǹ� �ۼ��Ͻÿ�. 
-- HIRE_DATE ���� STARTDATE��� ��Ī�� �����Ͻÿ�. 
select employee_id,
       last_name,
       job_id,
       hire_date STARTDATE
from employees;       

--3. EMPLOYEES ���̺��� ���� �ڵ�(job_id)�� �ߺ����� �ʰ� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�.
select distinct job_id
from employees;

--4. 2���� ��ɹ��� �����Ͻÿ�. 
--�Ӹ����� ���� Emp #, Employee, Job �� Hire Date�� ����� ���� ���Ǹ� �ٽ� �����Ͻÿ�.
select employee_id "Emp #",
       last_name "Employee",
       job_id "Job",
       hire_date "Hire_Date"
from employees;

--5. ���� ID(job_id)�� �̸�(last_name)�� ������ ���� ��ǥ �� �������� �����Ͽ� ǥ���ϰ� �� �̸��� Employee and Title�� �����Ͻÿ�.
select job_id || ', ' || last_name "Employee and Title"
from employees;

--where: ��µǴ� row ����
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

--��¥(yy_mm_dd) ���� ����ǥ�� ����
select last_name
from employees
where hire_date = '06_01_03';

select last_name,
       salary
from employees
where salary <= 3000;

-- between {low} and {high}: low�� high���� ������
-- ����, ����, ��¥ �� ��
select last_name,
       salary
from employees
where salary between 2500 and 3500;

-- ����ǰ� �����ȶ�. ������
select last_name,
       salary
from employees
where salary between 3500 and 2500;

select last_name
from employees
where last_name between 'King' and 'Smith';

-- S�� �����ϴ� �̸��� ����
select last_name
from employees
where last_name between 'S' and 'T';

--S�� �����ϴ� �̸� + T�� �����ϴ� �̸� �� ����
--z�� ���� �������̴ϱ� �ѱ۷� ġ�� '�R'
select last_name
from employees
where last_name between 'S' and 'Tzzzzz';

-- in(): in�ȿ� ����ִ� ���� ������ �ִ� row�� ����
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

-- like 'S%': S�� �����ϴ� ��� ����
select first_name
from employees
where first_name like 'S%';

-- 06�� ���ķ� �Ի��� ����� ���
-- �츮���� ��¥ �����ʹ� yy_mm_dd �̱� ������
select last_name,
       hire_date
from employees
where hire_date like '06%';

-- like '_o%': �ι�° ���ڰ� o�� �̸� ���� ����� ���
select last_name
from employees
where last_name like '_o%';












