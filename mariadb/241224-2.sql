SELECT *, rownum() FROM production_plan;
select * from order_plan_relation;
select * from product;

SELECT 
ROW_NUMBER() OVER (ORDER BY pp.plan_num, o.product_code) AS rownum,
ROW_NUMBER() OVER (PARTITION BY pp.plan_num ORDER BY o.product_code) AS rownum_by_plan,
    pp.plan_num, 
    pp.plan_name, 
    o.product_code, 
    p.product_name, 
    p.capacity,
    SUM(o.plan_qty) AS total_plan_qty, 
    pp.plan_start_date, 
    pp.plan_end_date
    
FROM 
    production_plan pp 
INNER JOIN 
    order_plan_relation o 
    ON pp.plan_num = o.plan_num 
INNER JOIN 
    product p 
    ON o.product_code = p.product_code
WHERE 
    pp.plan_status = 'plan_waiting'
GROUP BY 
    pp.plan_num, 
    pp.plan_name, 
    o.product_code, 
    p.product_name, 
    pp.plan_start_date, 
    pp.plan_end_date;

select process_sequence, process_name, material_code
from process_chart 
where product_code = 'P001'
order by process_sequence;

insert into process_chart(product_code, process_code, process_sequence, process_name)
values('P001', 'P2', 1, '음료제작공정');
insert into process_chart(product_code, process_code, process_sequence, process_name)
values('P001', 'P3', 2, '포장공정');
insert into process_chart(product_code, process_code, process_sequence, process_name)
values('P001', 'P1', 1, '세척공정');

update process_chart set process_sequence = 2 where process_chart_num = 1;
update process_chart set process_sequence = 3 where process_chart_num = 2;

delete from process_chart where process_chart_num = 4;
select * from process_chart;



insert into material(material_code, material_name, safety_inventory, expiration_date, regi_date)
values('M036', '세척병(500ml)', 1000, 365, '2024-12-20');

ALTER TABLE process_chart
modify COLUMN product_code varchar(30) not null;

ALTER TABLE process_chart
DROP COLUMN material_code;


ALTER TABLE process_chart
add COLUMN material_code varchar(30) null;

commit;

delete from material where material_code = 'M036';
select * from bom;
-- 31	P031	당근이세요(500ml)	500ml
select * from bom_material order by bom_num;

insert into bom_material(bom_num, material_code, material, material_con)
value(1, 'M037', '페트병(500ml)', 1);

-- delete from bom_material where bom_seq in (83, 84, 63, 81, 82);

select * from material;
-- M036	세척병(500ml)	1000	365	2024-12-20 00:00:00
select * from product;

-- P031	당근이세요(500ml)	500

update product set capacity = 1500 where product_code in ('P007', 'P011','P013','P015', 'P017', 'P019', 'P021','P023');
commit;
ALTER TABLE process_chart
modify COLUMN process_chart_num int auto_increment;



CREATE TABLE `process_chart` (
	`process_chart_num`	int	NOT NULL,
	`product_code`	varchar(30)	NOT NULL,
	`process_code`	varchar(30)	NOT NULL,
	`process_sequence`	varchar(50)	NOT NULL,
	`process_name`	varchar(30)	NOT NULL
);

ALTER TABLE `process_chart` ADD CONSTRAINT `PK_PROCESS_CHART` PRIMARY KEY (
	`process_chart_num`
);

select * from process_based_information;
-- p1	세척공정	세척기기
-- p2	음료제작공정	음료제작기기
-- p3	포장공정	포장기기