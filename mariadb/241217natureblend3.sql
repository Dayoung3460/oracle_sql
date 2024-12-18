use natureblend;




select * from order_plan_relation;

CREATE TABLE `order_plan_relation` (
	`order_plan_num` int not null auto_increment primary key,
	`plan_num`	int	NOT NULL,
	`order_num`	int	NOT NULL
);

insert into order_plan_relation(plan_num, order_num)
values(1, 1), (1, 2), (1, 3);

SELECT VERSION();

drop procedure add_plan_by_orders;

-- 생산계획번호plan_num(count임), 생산계획명 plan_name, 제품코드 product_code, 계획수량 plan_qty
-- 계획일자 plan_create_date(sysdate), 계획시작일자 plan_start_date, 계획종료일자 plan_end_date, 
-- 계획진행상태 plan_status(default plan_waiting), 생산계획자 emp_num
DELIMITER $$
CREATE PROCEDURE add_plan_by_orders(
	IN json_array TEXT,
    IN p_plan_name varchar(50),
    in p_product_code varchar(50),
    in p_plan_qty int,
    in p_plan_start_date datetime,
    in p_plan_end_date datetime,
    in p_emp_num int
)
BEGIN
	DECLARE i INT DEFAULT 1;
    DECLARE array_length INT;
    DECLARE current_value TEXT;

	DECLARE plan_num INT;
    DECLARE order_num INT;
    declare count int;
    
    SET array_length = JSON_LENGTH(json_array);
    
    select count(*)
    into count
    from order_plan_relation;
    
    set count = count + 1;
    
    -- 반복적으로 JSON 배열 요소 추출
    WHILE i <= array_length DO
        SET current_value = JSON_UNQUOTE(JSON_EXTRACT(json_array, CONCAT('$[', i - 1, ']')));
        
        INSERT INTO order_plan_relation (plan_num, order_num)
        VALUES (count, current_value);

        SET i = i + 1;
    END WHILE;
    
    -- 생산계획번호plan_num(count임), 생산계획명 plan_name, 제품코드 product_code, 계획수량 plan_qty
-- 계획일자 plan_create_date(sysdate), 계획시작일자 plan_start_date, 계획종료일자 plan_end_date, 
-- 계획진행상태 plan_status(default plan_waiting), 생산계획자 emp_num
    
    -- order_plan_relation의 plan_num이 production_plan의 plan_num에도 들어감
    insert into production_plan(plan_num, plan_name, product_code, plan_qty, plan_start_date, plan_end_date, plan_emp)
    value(count, p_plan_name, p_product_code, p_plan_qty, p_plan_start_date, p_plan_end_date, p_emp_num);
END$$

DELIMITER ;

select * from employee;

select * from order_plan_relation;

select * from production_plan;

ALTER TABLE employee
MODIFY COLUMN emp_num INT AUTO_INCREMENT;

TRUNCATE TABLE order_plan_relation;


CALL add_plan_by_orders();

ALTER TABLE production_plan
MODIFY COLUMN plan_num INT;


ALTER TABLE production_plan
MODIFY COLUMN emp_num INT AUTO_INCREMENT;

commit;

ALTER TABLE production_plan
ADD COLUMN plan_num INT AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE production_plan
DROP plan_code;

ALTER TABLE production_plan
ADD COLUMN plan_num INT;

UPDATE production_plan
SET plan_num = CAST(plan_code AS UNSIGNED);

CALL add_plan_by_orders('[1, 2, 3]', '2024 생산 계획2', 'P001', 30, '2024-12-14', '2025-01-05', 1);

select * from employee;

insert into employee(emp_num, name, birth, tel, job, job_num, position, employment_date)
values(1234, '김다영', '1993-01-01', '010-2344-2344', '생산', 2, '반장', '2020-12-12');

delete from production_plan where plan_num = 4;

UPDATE employee SET emp_num = 2 where emp_num = 23423;
UPDATE employee SET emp_num = 3 where emp_num = 123456;
UPDATE employee SET emp_num = 4 where emp_num = 7894564;
UPDATE employee SET emp_num = 5 where emp_num = 45678745;

ALTER TABLE production_plan
MODIFY COLUMN plan_create_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

SELECT
       order_num,
       order_amount,
       total_price,
       order_status,
       per_price,
       o.product_code,
       o.orderlist_num,
       ol.order_date,
       ol.due_date,
       p.product_name
     FROM orders o INNER JOIN orderlists ol INNER JOIN product p
        ON o.orderlist_num = ol.orderlist_num
        WHERE o.product_code = p.product_code;
        
select * from output;
select * from orders;
select * from client;
select * from input_body;
select * from production_plan;
select * from order_plan_relation;

insert into output(client_num, product_code, output_amount, output_date, input_num, order_num)
values(1, 'P001', 10, '2024-12-30', 1, 1);

-- select orde.order_num, order_status, output_amount
-- from orders orde inner join output outp
-- where orde.order_num = outp.order_num
-- and orde.order_status = ;

UPDATE orders SET order_status = 'preparing' where order_status = 23423;
