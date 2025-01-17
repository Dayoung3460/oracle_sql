ALTER TABLE tbl_board ADD replycnt number(10) DEFAULT 0 NOT NULL;

select * from tbl_reply;

select * from tbl_board;

update tbl_board
set replycnt = (
    select count(bno) 
    from tbl_reply
    where bno = 3014669
)
where bno = 3014669;
commit;

select * from employees;
select * from jobs;

select * from departments;
SELECT
            /*+index_desc(employees EMP_EMP_ID_PK)*/
            employee_id,
            first_name,
            last_name,
            email,
            phone_number,
            hire_date,
            e.job_id,
            salary,
            commission_pct,
            manager_id,
            department_id,
            (select job_title from jobs where job_id = e.job_id) job_title
        FROM employees e;