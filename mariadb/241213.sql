USE natureblend;

CREATE TABLE `production_plan` (
	`plan_code`	varchar(20)	NOT NULL,
	`plan_name`	varchar(50)	NOT NULL,
	`product_code`	varchar(20)	NOT NULL,
	`plan_qty`	int	NOT NULL,
	`plan_create_date`	datetime	NOT NULL,
	`plan_start_date`	datetime	NOT NULL,
	`plan_end_date`	datetime	NOT NULL,
	`plan_status`	VARCHAR(20)	NOT NULL	DEFAULT 'plan_waiting',
	`plan_emp`	varchar(10)	NOT NULL
);

ALTER TABLE `production_plan` ADD CONSTRAINT `PK_PRODUCTION_PLAN` PRIMARY KEY (
	`plan_code`
);

SELECT * FROM `product`;

INSERT INTO productproduct
VALUES('PROD001', '애플팜 500ml', NOW());
COMMIT;

SELECT 
        product_code,
          product_name,
          expiration_date
FROM product

CREATE TABLE `order_plan_relation` (
	`plan_num`	int	NOT NULL auto_increment,
	`order_num`	int	NOT NULL	
);

