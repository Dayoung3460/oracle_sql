CALL add_plan_by_orders('[2,8]','test plan','["P001","P002"]','[10,20]','2024-12-06','2025-01-04',1);
CALL add_plan_by_orders('[2]','test생산계획','["P001"]','[10]','2024-12-13','2025-01-01',1);
CALL add_plan_by_orders('[2, 9]','당근오렌지 계획','["P001","P031"]','[10, 20]','2024-12-13','2025-01-01',2);

insert into orders(order_amount, total_price, order_status, per_price, product_code, orderlist_num)
values(100, 100000, 'preparing', 1000, 'P031', 9);

-- insert into orderlists(orderlist_-- title, order_date, due_date, orderlist_status, emp_num, client_num)
-- values('당근주문서', '2024-12-12', ');

select * from orders;
select * from orderlists;
SELECT *, rownum() FROM production_plan; -- 6
select * from order_plan_relation; -- 12

ALTER TABLE production_plan
DROP plan_qty;

SHOW CREATE TABLE order_plan_relation;

TRUNCATE TABLE production_plan;
TRUNCATE TABLE order_plan_relation;

ALTER TABLE order_plan_relation
modify COLUMN product_code varchar(50) not null;
ALTER TABLE order_plan_relation
modify COLUMN plan_qty int not null;

drop procedure add_plan_by_orders;

DELIMITER $$
CREATE PROCEDURE add_plan_by_orders(
	IN p_order_num_json_array TEXT,
    IN p_plan_name varchar(50),
    in p_product_code_json_array TEXT,
    in p_plan_qty_json_array TEXT,
    in p_plan_start_date datetime,
    in p_plan_end_date datetime,
    in p_emp_num int
)
BEGIN
	DECLARE i INT DEFAULT 1;
    DECLARE order_num_array_length INT;
    DECLARE order_num_value TEXT;
    DECLARE product_code_value TEXT;
    DECLARE plan_qty_value TEXT;
    

	DECLARE plan_num INT;
    DECLARE order_num INT;
    declare count int;
    
    DECLARE v_result_value VARCHAR(20);
    
    START TRANSACTION;
    
    SET order_num_array_length = JSON_LENGTH(p_order_num_json_array);
    
    select count(*)
    into count
    from order_plan_relation;
    
    set count = count + 1;
    
    -- 반복적으로 JSON 배열 요소 추출
    WHILE i <= order_num_array_length DO
        SET order_num_value = JSON_UNQUOTE(JSON_EXTRACT(p_order_num_json_array, CONCAT('$[', i - 1, ']')));
        SET product_code_value = JSON_UNQUOTE(JSON_EXTRACT(p_product_code_json_array, CONCAT('$[', i - 1, ']')));
        -- SELECT CONCAT('Extracted product_code: ', product_code_value);
        SET plan_qty_value = JSON_UNQUOTE(JSON_EXTRACT(p_plan_qty_json_array, CONCAT('$[', i - 1, ']')));
        
        INSERT INTO order_plan_relation (plan_num, order_num, product_code, plan_qty)
        VALUES (count, order_num_value, product_code_value, plan_qty_value);
		SET  v_result_value = FOUND_ROWS();
        
        if v_result_value != 1 then
			ROLLBACK;
			SET  v_result_value = 'order_plan_relation insert fail';
		END if;

        SET i = i + 1;
    END WHILE;
    
    -- 생산계획번호plan_num(count임), 생산계획명 plan_name, 제품코드 product_code, 계획수량 plan_qty
-- 계획일자 plan_create_date(sysdate), 계획시작일자 plan_start_date, 계획종료일자 plan_end_date, 
-- 계획진행상태 plan_status(default plan_waiting), 생산계획자 emp_num
    
    -- order_plan_relation의 plan_num이 production_plan의 plan_num에도 들어감
    insert into production_plan(plan_num, plan_name, plan_start_date, plan_end_date, plan_emp)
    value(count, p_plan_name, p_plan_start_date, p_plan_end_date, p_emp_num);
    SET  v_result_value = FOUND_ROWS();
    
    if v_result_value != 1 then
		ROLLBACK;
		SET  v_result_value = 'production_plan insert fail';
	END if;
    
    SET  v_result_value = 'success';
    select v_result_value as result;
    
    COMMIT;
END$$

DELIMITER ;

commit;

select * from output;

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
       (select outp.output_amount from output outp where outp.order_num = o.order_num) as output_amount
     FROM orders o INNER JOIN orderlists ol INNER JOIN product p inner join order_plan_relation opr
        ON o.orderlist_num = ol.orderlist_num
        WHERE o.product_code = p.product_code
        and opr.order_num = o.order_num
        and o.order_status in ('preparing', 'semiShipped');