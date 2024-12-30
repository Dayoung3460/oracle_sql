select * from orders;

SELECT
       o.order_num,
       order_amount,
       total_price,
       order_status,
       per_price,
       o.product_code,
       o.orderlist_num,
       ol.order_date,
       ol.due_date,
       p.product_name,
       opr.plan_qty,
       order_amount - opr.plan_qty AS unplanned_qty,
       (select sum(outp.output_amount) from output outp where outp.order_num = o.order_num) as output_amount
     FROM orders o INNER JOIN orderlists ol INNER JOIN product p inner join order_plan_relation opr
           ON o.orderlist_num = ol.orderlist_num
     WHERE o.product_code = p.product_code
       and opr.order_num = o.order_num;
       
       select outp.output_amount 
       from output outp inner join orders o
       where outp.order_num = o.order_num;
       
       select * from output;
       select * from orders;
       
select * from production_order;
       


drop table process_work_header;
commit;
CREATE TABLE `process_work_header` (
	`process_work_header_num`	int	NOT NULL auto_increment	PRIMARY KEY COMMENT 'auto_increment',
	`production_order_num`	int	NOT NULL,
	`production_order_name`	varchar(50)	NOT NULL,
	`production_order_qty`	int	NOT NULL,
    `product_code`	varchar(50)	NOT NULL,
	`product_name`	varchar(50)	NOT NULL,
    `capacity` int not null,
	`process_code`	varchar(20)	NOT NULL,
	`process_name`	varchar(50)	NOT NULL,
	`machine_type`	varchar(50)	NOT NULL,
	`proceess_status`	varchar(50)	NOT NULL DEFAULT 'process_waiting' COMMENT '진행 전(process_waiting), 진행중(processing), 완료(process_complete)',
	`process_start_time`	datetime	NULL,
	`process_end_time`	datetime	NULL
);

-- drop table process_work_body;
CREATE TABLE `process_work_body` (
	`process_num`	int	NOT NULL auto_increment	COMMENT 'auto_increment',
	`process_work_header_num`	int	NOT NULL	COMMENT 'auto_increment',
	`emp_num`	int	NOT NULL,
	`machine_num`	int	NOT NULL,
	`partial_process_status`	varchar(50)	NOT NULL	DEFAULT 'partial_process_waiting'	COMMENT '진행 전(partial_process_waiting), 진행중(partial_processing), 완료(partial_process_complete)',
	`process_todo_qty`	int	NOT NULL,
	`process_complete_qty`	int	NULL,
	`fail_qty`	int	NULL,
	`success_qty`	int	NULL,
	`partial_process_start_time`	datetime	NULL,
	`partial_process_end_time`	datetime	NULL,
	`is_inspected`	varchar(5)	NOT NULL	DEFAULT false	COMMENT 'true/false',
    `product_code` varchar(50) not null,
    `capacity` int not null
);
ALTER TABLE `process_work_body` ADD CONSTRAINT `PK_PROCESS_WORK_BODY` PRIMARY KEY (
	`process_num`
);
commit;
-- drop procedure getMaterialStock;

DELIMITER $$
CREATE PROCEDURE `getMaterialStock`(
	IN p_material_code_json_array TEXT
)
BEGIN
	DECLARE i INT DEFAULT 1;
	DECLARE material_code_array_length INT;
	DECLARE material_code_value TEXT;

	-- 기존 테이블 삭제 및 새로 생성
	DROP TEMPORARY TABLE IF EXISTS temp_result;

	-- 임시 테이블 생성
	CREATE TEMPORARY TABLE IF NOT EXISTS temp_result (
		material_code VARCHAR(50),
        material_name VARCHAR(50),
		lot_code VARCHAR(50),
		stok_qty INT,
		limit_date DATE,
        invalid_qty int
	);

	START TRANSACTION;

	SET material_code_array_length = JSON_LENGTH(p_material_code_json_array);
	
    WHILE i <= material_code_array_length DO
		SET material_code_value = JSON_UNQUOTE(JSON_EXTRACT(p_material_code_json_array, CONCAT('$[', i - 1, ']')));
	
		-- 결과값을 임시 테이블에 삽입
		INSERT INTO temp_result (material_code, material_name, lot_code, stok_qty, limit_date, invalid_qty)
		select 
			m1.material_code, 
			m2.material_name, 
            m1.lot_code, 
            stok_qty, 
            limit_date,
			(select sum(material_qty) 
				from invalid_material i
				where m1.lot_code = i.lot_code) as invalid_qty
		from material_lot_qty1 m1 inner join material m2
        on m1.material_code = m2.material_code
		where material_nomal = 'b1' 
			and material_lot_state = 'c1'
			and m1.material_code = material_code_value;

		SET i = i + 1;
	END WHILE;

	select material_code, material_name, lot_code, stok_qty, limit_date, invalid_qty from temp_result;
    commit;
END$$
DELIMITER ;

commit;

select process_sequence, pc.process_name, pc.process_code, machine_type
    from process_chart pc inner join process_based_information pb
    on pc.process_code = pb.process_code
    where product_code = 'P001'
    order by process_sequence;
    
select * from process_work_header;

select production_order_num, production_order_name, plan_num, po.product_code, p.product_name, work_date, production_order_qty, production_order_date, emp_num
from production_order po inner join product p
on po.product_code = p.product_code
where po.production_order_status in ('work_waiting', 'work_in_process');

select * from production_order;
commit;
select * from process_work_header 
where process_status = 'process_waiting'
and work_date = CURDATE();

ALTER TABLE process_work_header
RENAME COLUMN proceess_status to process_status;

ALTER TABLE process_work_header
add COLUMN work_date datetime not null;

ALTER TABLE process_work_body
drop COLUMN capacity;

update process_work_header set work_date = '2024-12-23' where process_work_header_num = 6;

select * from process_work_body;
select * from process_work_header;

update process_work_body
    set emp_num = 1, 
        machine_num = 1, 
        process_todo_qty = 5, 
        partial_process_start_time = NOW(), 
        partial_process_status = 'partial_processing',
        fail_qty = null,
        success_qty = null
    where process_num = 12;
    
    update process_work_body
set emp_num = 45678747,
                            machine_num = 14,
                            process_todo_qty = 2,
                            partial_process_start_time = NOW(),
                            partial_process_status = 'partial_processing',fail_qty = 1,
            success_qty = 0 where process_num = 14;



-- 작업자, 설비코드, 작업량, 시작시간, 정비상태 업데이트
update process_work_body
set emp_num = 2, machine_num = 1, process_todo_qty = 2, partial_process_start_time = '2024-12-24', partial_process_status = 'partial_processing'
where process_num = 8;

select * from production_order;
commit;

-- delete from process_work_header where process_work_header_num = 12;

-- insert into process_work_body(process_work_header_num, process_code)

ALTER TABLE process_work_body
modify COLUMN process_todo_qty int;

select process_num, process_work_header_num, emp_num, machine_num, partial_process_status, process_todo_qty,process_complete_qty, fail_qty, success_qty,partial_process_start_time, partial_process_end_time,is_inspected   
    from process_work_body 
    where process_work_header_num = 7;

select * from employee;

commit;

insert into employee (name, birth, tel, job, job_num, position, employment_date, level)
values('박사원', '1999-09-09', '010-2344-2344', '생산', 2, '사원', '2020-02-02', 1);
insert into employee (name, birth, tel, job, job_num, position, employment_date, level)
values('나사원', '1999-09-05', '010-2343-2344', '생산', 2, '사원', '2019-02-02', 1);
insert into employee (name, birth, tel, job, job_num, position, employment_date, level)
values('마사원', '1994-09-05', '010-2243-2344', '생산', 2, '사원', '2019-06-02', 1);

select * from employee where job_num = 2;

select emp_num, name, birth, tel, job, job_num, position
    from employee
    where job_num = 2;

commit;

select * from machine 
where process_code = 'p1' 
and machine_state = 'run';

select process_num, process_work_header_num, emp_num, your_employee(emp_num, 'name') as emp_name, machine_num, your_machine(machine_num, 'machine_name') as machine_name, partial_process_status, process_todo_qty,process_complete_qty, fail_qty, success_qty,partial_process_start_time, partial_process_end_time,is_inspected   
    from process_work_body 
    where process_work_header_num = 7;
    
    
select * from machine;
    
DELIMITER //
CREATE FUNCTION `your_machine`(v_machine_num int,
    v_colnum varchar(50)
) RETURNS varchar(50) CHARSET utf8mb3 COLLATE utf8mb3_general_ci
    DETERMINISTIC
BEGIN
	declare v_return_data varchar(50);
	
	SELECT
        CASE 
            WHEN v_colnum = 'machine_name' THEN machine_name
            WHEN v_colnum = 'model_num' THEN model_num
            WHEN v_colnum = 'machine_location' THEN machine_location
            WHEN v_colnum = 'machine_state' THEN machine_state
            WHEN v_colnum = 'process_code' THEN process_code
            ELSE 'Invalid Column'
        END
    INTO v_return_data
    FROM machine		
    WHERE machine_num = v_machine_num;	
    
    RETURN v_return_data;
END;
//
DELIMITER ;

commit;

 CALL qc_p_packaging_input_list(32,3,7, @result);
 
select ph.process_work_header_num, production_order_num, process_name, your_machine(pb.machine_num, 'machine_name')  
from process_work_header ph join process_work_body pb
on ph.process_work_header_num = pb.process_work_header_num;
 
 select * from process_work_header;
  select * from process_work_body;
  
  update process_work_header
  set product_name = '포도17'
  where process_work_header_num in (1, 2, 3, 4, 5, 6, 7, 8, 9, 13, 14, 15, 16, 17, 18, 19, 20, 21);
  
  
select 
	ph.process_work_header_num, 
    production_order_num, 
    process_name, 
    your_machine(pb.machine_num, 'machine_name') as machine_name,    
    your_employee(pb.emp_num, 'name') as emp_name,
    ph.product_name,
    ph.capacity,
    pb.process_complete_qty,
    pb.fail_qty,
	pb.success_qty,
    pb.partial_process_start_time,
    pb.partial_process_end_time,
    pb.partial_process_status
from process_work_header ph join process_work_body pb
on ph.process_work_header_num = pb.process_work_header_num
where pb.partial_process_status = 'partial_process_complete';

select * from qc_packaging;


select * from product;

select * from employee;

select * from process_work_body;
select * from process_work_header;

-- [57,70,1]
CALL qc_p_cleaning_input_list(57,70,1, @result);

select 
      plan_name, 
      p.plan_create_date, 
      p.plan_start_date,
      p.plan_end_date, 
      p.plan_status, 
      p.plan_emp, 
      p.plan_num,
      your_product(o.product_code, 'product_name') as product_name,
      o.plan_qty
  from production_plan p join order_plan_relation o
  where p.plan_num = o.plan_num
   and product_code = 'P001'
   and plan_start_date >= '2024-12-23'
   and plan_end_date <= '2025-01-01';
   
   select 
      plan_name, 
      p.plan_create_date, 
      p.plan_start_date,
      p.plan_end_date, 
      p.plan_status, 
      p.plan_emp, 
      p.plan_num,
      your_product(o.product_code, 'product_name') as product_name,
      o.plan_qty,
      o.order_plan_num
  from production_plan p join order_plan_relation o
  where p.plan_num = o.plan_num;
  
  select * from order_plan_relation;
  select * from production_plan;
  
  delete from order_plan_relation
  where order_plan_num in (2, 3);
  
  SELECT 
        product_code,
          product_name,
          expiration_date
FROM product;
  
  
select o.plan_num, o.order_plan_num
from production_plan p join order_plan_relation o
where p.plan_num = o.plan_num;

-- plan_end_date, plan_name, plan_qty, plan_start_date, product_name 수정가능
-- plan_start_date, plan_end_date, plan_name - production_plan에서 수정
-- plan_qty, product_name - order_plan_relation에서 수정

update production_plan
set plan_start_date = '2024-12-13', plan_end_date = '2024-12-31', plan_name = '수정계획'
where plan_num = 1;

update order_plan_relation
set plan_qty = 20, product_code = 'P002'
where order_plan_num = 10;

select * from employee;
