use natureblend;

DELIMITER $$

drop procedure get_stock;

commit;

DELIMITER $$

CREATE PROCEDURE get_stock(IN p_product_code VARCHAR(10))
BEGIN
    DECLARE r_stock INT DEFAULT 0;
    DECLARE v_product_code VARCHAR(10);
    DECLARE v_input_amount INT;
    DECLARE v_input_flag TINYINT;
    DECLARE v_dispose_flag TINYINT;
    DECLARE done INT DEFAULT 0;

    -- 커서 정의
    DECLARE stock_cursor CURSOR FOR 
        SELECT
            product_code,
            input_amount,
            input_flag,
            dispose_flag
        FROM input_body
        WHERE product_code = p_product_code;

    -- 핸들러 정의
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- 커서 열기
    OPEN stock_cursor;

    -- 커서 순회
    stock_loop: LOOP
        FETCH stock_cursor INTO v_product_code, v_input_amount, v_input_flag, v_dispose_flag;
        IF done THEN
            LEAVE stock_loop;
        END IF;

        -- 조건 확인 후 누적합산
        IF v_input_flag = 0 AND v_dispose_flag = 0 THEN
            SET r_stock = r_stock + v_input_amount;
        END IF;
    END LOOP stock_loop;

    -- 커서 닫기
    CLOSE stock_cursor;

    -- 결과 반환
    SELECT r_stock AS stock;
END$$

DELIMITER ;

CALL get_stock('P001');
commit;

-- sert into production_plan()

select * from order_plan_relation;

-- 1. 새 열 추가
ALTER TABLE order_plan_relation ADD COLUMN order_plan_num INT;

-- 2. 기존 데이터 변환
UPDATE order_plan_relation SET plan_num = CAST(plan_code AS SIGNED);

-- 3. 기존 열 삭제
ALTER TABLE order_plan_relation DROP COLUMN plan_code;

ALTER TABLE order_plan_relation DROP PRIMARY KEY, ADD PRIMARY KEY (`order_num`, `plan_num`);

DELIMITER $$

ALTER TABLE order_plan_relation DROP FOREIGN KEY order_num;

select * from order_plan_relation;


select * from material_lot_qty1;
