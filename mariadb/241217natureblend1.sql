use dev;

DELIMITER $$

create procedure yedam_ju
(in p_id varchar(100),
OUT result_id VARCHAR(100))

begin
	declare v_id varchar(100);
     set v_id = '100'; 
    SET result_id = CONCAT(v_id, p_id);
    
END$$
DELIMITER ;

drop procedure yedam_ju;

CALL yedam_ju('1234561234567', @output);
SELECT @output;

select * from employee;

ALTER TABLE employee ADD COLUMN level INT;

UPDATE employee SET level = 1 where emp_num in (123456, 7894564, 45678745);

select emp_num, name 
from employee
where job_num = 2 and position = '반장';

commit;

select emp_num, name 
  from employee
  where job_num = 2 and level >= 2
  or job_num = 6;

  
insert INTO employee(emp_num, name, birth, tel, job, job_num, position, employment_date, level)
values(23423, '표하연', '1999-11-11', '010-1233-1233', '관리자', 6, '관리자', '2020-02-02', 3);