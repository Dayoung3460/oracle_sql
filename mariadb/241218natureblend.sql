select * from orderlists;
select * from orders;
select * from product;

insert into orders(order_amount, total_price, order_status, per_price, product_code, orderlist_num)
values(100, 200000, 0, 2000, 'P001', 1);
insert into orders(order_amount, total_price, order_status, per_price, product_code, orderlist_num)
values(100, 200000, 1, 2000, 'P001', 2);
insert into orders(order_amount, total_price, order_status, per_price, product_code, orderlist_num)
values(100, 200000, 0, 2000, 'P001', 2);
insert into orders(order_amount, total_price, order_status, per_price, product_code, orderlist_num)
values(100, 200000, 0, 2000, 'P001', 3);
insert into orders(order_amount, total_price, order_status, per_price, product_code, orderlist_num)
values(100, 200000, 0, 2000, 'P001', 4);
insert into orders(order_amount, total_price, order_status, per_price, product_code, orderlist_num)
values(100, 200000, 0, 2000, 'P001', 5);
insert into orders(order_amount, total_price, order_status, per_price, product_code, orderlist_num)
values(120, 120000, 0, 1000, 'P002', 6);

commit;

insert into input_body(product_code, product_lot, input_amount, input_flag, warehouse_code, qc_packing_id, expire_date, dispose_flag, inputlist_num)
values('P001', 'P0011215Z2024', 200, 0, 'W001', 'PC001', '2025-02-15', 0, 1);

select * from input_body;

SELECT
       product_code,
       input_amount,
       input_flag,
       dispose_flag
     FROM input_body
        where product_code = 'P001';

select * from warehouse;
select * from input_header;

select * 
from orderlists join orders o
on o.orderlist_num;

select * from product;
select * from qc_packaging;


DELIMITER $$
CREATE PROCEDURE material_order_input
    (IN client_num INT, 
     IN emp_num INT, 
     IN material_code VARCHAR(50), 
     IN ord_qty INT, 
     IN unit_price INT, 
     IN total_price INT, 
     OUT result INT )
BEGIN
    DECLARE v_order_date VARCHAR(50);

    select
        order_code
    INTO
        v_order_date
    FROM
        material_order_head
    WHERE
        order_date >= CURDATE()
    ORDER BY
        order_date DESC
    LIMIT 1 ;
    SELECT v_order_date;
    SET result = 1;
END$$
DELIMITER ;

select * from order_plan_relation;
select * from production_plan;

select * from orders;

SET SQL_SAFE_UPDATES = 0;

UPDATE orders
SET order_status = 'semiShipped'
WHERE TRIM(order_status) = '1';

SET SQL_SAFE_UPDATES = 1;

select o.order_num, p.plan_name, p.plan_qty
from orders o inner join production_plan p
where o.order_num = p.order_num;

select sum(p.plan_qty)
from order_plan_relation o inner join production_plan p inner join orders ord
where o.plan_num = p.plan_num
and ord.order_num = o.order_num
and o.order_num = 1;


-- 주문리스트. 기계획량도 같이 조회
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
       p.product_name,
        (select sum(pp.plan_qty)
from order_plan_relation opr inner join production_plan pp inner join orders ord
where opr.plan_num = pp.plan_num
and ord.order_num = opr.order_num
and opr.order_num = o.order_num) as planned_qty

     FROM orders o INNER JOIN orderlists ol INNER JOIN product p
        ON o.orderlist_num = ol.orderlist_num
        WHERE o.product_code = p.product_code;


