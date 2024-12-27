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

select * from process_work_header;

update process_work_header
set process_status = 'processing', 
    process_start_time = '2024-12-26 12:12:12', 
    process_end_time = null
where process_work_header_num = 1;

select * from maintenance;


-- 공정검사 - 세척검사 insert 프로시저

-- 실행 방법(공정작업바디번호, 총 (검사) 수량, 사원번호)
CALL qc_p_cleaning_input_list(?, ?, ?, @result);

-- 실행 후 잘 삽입됬다면 'Success!' 안됬다면 'Fail...' 출력
-- 실행 방법(공정작업바디번호, 총 (검사) 수량, 사원번호)
CALL qc_p_cleaning_input_list(4, 50, 1, @result);

-- 프로시저 생성 구조(mysql로 생성)
-- 세척: QCPC
-- 포장: QCPP
-- 음료: QCPB
-- ------------------

select * from qc_process_cleaning;

DELIMITER //

CREATE PROCEDURE qc_p_cleaning_input_list
(
    IN v_process_num INT,
    IN v_total_qnt INT,
    IN v_emp_num INT,
    OUT v_result VARCHAR(20)
)
BEGIN
    DECLARE v_count INT DEFAULT 0;
    DECLARE v_qc_cleaning_id VARCHAR(20);
    DECLARE v_result_value VARCHAR(20);

    -- 트랜잭션 시작
    START TRANSACTION;

    -- 테이블에 데이터가 있는지 확인
    SELECT COUNT(*) INTO v_count FROM qc_process_cleaning;

    -- qc_cleaning_id 생성
    IF v_count != 0 THEN
        SELECT 
            CASE 
                WHEN DATE_FORMAT(SUBSTRING(qc_cleaning_id, 5, 6), '%y%m%d') = DATE_FORMAT(NOW(), '%y%m%d') THEN
                    CASE 
                        WHEN LENGTH(CAST(RIGHT(qc_cleaning_id, 4) AS UNSIGNED) + 1) = 1 THEN CONCAT('QCPC', DATE_FORMAT(NOW(), '%y%m%d'), '000', CAST(RIGHT(qc_cleaning_id, 4) AS UNSIGNED) + 1)
                        WHEN LENGTH(CAST(RIGHT(qc_cleaning_id, 4) AS UNSIGNED) + 1) = 2 THEN CONCAT('QCPC', DATE_FORMAT(NOW(), '%y%m%d'), '00', CAST(RIGHT(qc_cleaning_id, 4) AS UNSIGNED) + 1)
                        WHEN LENGTH(CAST(RIGHT(qc_cleaning_id, 4) AS UNSIGNED) + 1) = 3 THEN CONCAT('QCPC', DATE_FORMAT(NOW(), '%y%m%d'), '0', CAST(RIGHT(qc_cleaning_id, 4) AS UNSIGNED) + 1)
                        ELSE CONCAT('QCPC', DATE_FORMAT(NOW(), '%y%m%d'), CAST(RIGHT(qc_cleaning_id, 4) AS UNSIGNED) + 1)
                    END
                ELSE 
                    CONCAT('QCPC', DATE_FORMAT(NOW(), '%y%m%d'), '0001')
            END AS cleaning_id
        INTO v_qc_cleaning_id
        FROM qc_process_cleaning
        ORDER BY qc_cleaning_id DESC
        LIMIT 1;
    ELSE
        SET v_qc_cleaning_id = CONCAT('QCPC', DATE_FORMAT(NOW(), '%y%m%d'), '0001');
    END IF;

    -- INSERT 작업 수행
    IF v_qc_cleaning_id IS NOT NULL THEN
        INSERT INTO qc_process_cleaning(qc_cleaning_id, total_qnt, inspec_start, inspec_status, emp_num, process_num)
        VALUES (v_qc_cleaning_id, v_total_qnt, CURRENT_TIMESTAMP, '검사요청완료', v_emp_num, v_process_num);

        -- INSERT 성공 여부 확인
        IF ROW_COUNT() = 1 THEN
            COMMIT;
            SET v_result = 'Success!';
        ELSE
            ROLLBACK;
            SET v_result = 'Fail...';
        END IF;
    ELSE
        ROLLBACK;
        SET v_result = 'Fail...';
    END IF;
    
    SELECT v_result AS result;

END//
DELIMITER ;

DELIMITER //

CREATE PROCEDURE qc_p_cleaning_input_list
(
    IN v_process_num INT,
    IN v_total_qnt INT,
    IN v_emp_num INT,
    OUT v_result VARCHAR(20)
)
BEGIN
    DECLARE v_count INT DEFAULT 0;
    DECLARE v_qc_cleaning_id VARCHAR(20);
    DECLARE v_result_value VARCHAR(20);

    -- 트랜잭션 시작
    START TRANSACTION;

    -- 테이블에 데이터가 있는지 확인
    SELECT COUNT(*) INTO v_count FROM qc_process_cleaning;

    -- qc_cleaning_id 생성
    IF v_count != 0 THEN
        SELECT 
            CASE 
                WHEN DATE_FORMAT(SUBSTRING(qc_cleaning_id, 5, 6), '%y%m%d') = DATE_FORMAT(NOW(), '%y%m%d') THEN
                    CASE 
                        WHEN LENGTH(CAST(RIGHT(qc_cleaning_id, 4) AS UNSIGNED) + 1) = 1 THEN CONCAT('QCPC', DATE_FORMAT(NOW(), '%y%m%d'), '000', CAST(RIGHT(qc_cleaning_id, 4) AS UNSIGNED) + 1)
                        WHEN LENGTH(CAST(RIGHT(qc_cleaning_id, 4) AS UNSIGNED) + 1) = 2 THEN CONCAT('QCPC', DATE_FORMAT(NOW(), '%y%m%d'), '00', CAST(RIGHT(qc_cleaning_id, 4) AS UNSIGNED) + 1)
                        WHEN LENGTH(CAST(RIGHT(qc_cleaning_id, 4) AS UNSIGNED) + 1) = 3 THEN CONCAT('QCPC', DATE_FORMAT(NOW(), '%y%m%d'), '0', CAST(RIGHT(qc_cleaning_id, 4) AS UNSIGNED) + 1)
                        ELSE CONCAT('QCPC', DATE_FORMAT(NOW(), '%y%m%d'), CAST(RIGHT(qc_cleaning_id, 4) AS UNSIGNED) + 1)
                    END
                ELSE 
                    CONCAT('QCPC', DATE_FORMAT(NOW(), '%y%m%d'), '0001')
            END AS cleaning_id
        INTO v_qc_cleaning_id
        FROM qc_process_cleaning
        ORDER BY qc_cleaning_id DESC
        LIMIT 1;
    ELSE
        SET v_qc_cleaning_id = CONCAT('QCPC', DATE_FORMAT(NOW(), '%y%m%d'), '0001');
    END IF;

    -- INSERT 작업 수행
    IF v_qc_cleaning_id IS NOT NULL THEN
        INSERT INTO qc_process_cleaning(qc_cleaning_id, total_qnt, inspec_start, inspec_status, emp_num, process_num)
        VALUES (v_qc_cleaning_id, v_total_qnt, CURRENT_TIMESTAMP, '검사요청완료', v_emp_num, v_process_num);

        -- INSERT 성공 여부 확인
        IF ROW_COUNT() = 1 THEN
            COMMIT;
            SET v_result = 'Success!';
        ELSE
            ROLLBACK;
            SET v_result = 'Fail...';
        END IF;
    ELSE
        ROLLBACK;
        SET v_result = 'Fail...';
    END IF;
    
    SELECT v_result AS result;

END//
DELIMITER ;

select * from qc_packaging;
select * from qc_process_cleaning;

drop procedure qc_p_packaging_input_list;

CALL qc_p_packaging_input_list(32,3,7, @result);

truncate table qc_packaging;


DELIMITER //
CREATE PROCEDURE qc_p_packaging_input_list
(
    IN v_process_num INT,
    IN v_total_qnt INT,
    IN v_emp_num INT,
    OUT v_result VARCHAR(20)
)
BEGIN
    DECLARE v_count INT DEFAULT 0;
    DECLARE v_qc_packing_id VARCHAR(20);
    DECLARE v_result_value VARCHAR(20);

    -- 트랜잭션 시작
    START TRANSACTION;

    -- 테이블에 데이터가 있는지 확인
    SELECT COUNT(*) INTO v_count FROM qc_packaging;

    -- qc_cleaning_id 생성
    IF v_count != 0 THEN
        SELECT 
            CASE 
                WHEN DATE_FORMAT(SUBSTRING(qc_packing_id, 5, 6), '%y%m%d') = DATE_FORMAT(NOW(), '%y%m%d') THEN
                    CASE 
                        WHEN LENGTH(CAST(RIGHT(qc_packing_id, 4) AS UNSIGNED) + 1) = 1 THEN CONCAT('QCPP', DATE_FORMAT(NOW(), '%y%m%d'), '000', CAST(RIGHT(qc_packing_id, 4) AS UNSIGNED) + 1)
                        WHEN LENGTH(CAST(RIGHT(qc_packing_id, 4) AS UNSIGNED) + 1) = 2 THEN CONCAT('QCPP', DATE_FORMAT(NOW(), '%y%m%d'), '00', CAST(RIGHT(qc_packing_id, 4) AS UNSIGNED) + 1)
                        WHEN LENGTH(CAST(RIGHT(qc_packing_id, 4) AS UNSIGNED) + 1) = 3 THEN CONCAT('QCPP', DATE_FORMAT(NOW(), '%y%m%d'), '0', CAST(RIGHT(qc_packing_id, 4) AS UNSIGNED) + 1)
                        ELSE CONCAT('QCPP', DATE_FORMAT(NOW(), '%y%m%d'), CAST(RIGHT(qc_packing_id, 4) AS UNSIGNED) + 1)
                    END
                ELSE 
                    CONCAT('QCPP', DATE_FORMAT(NOW(), '%y%m%d'), '0001')
            END AS packing_id
        INTO v_qc_packing_id
        FROM qc_packaging
        ORDER BY qc_packing_id DESC
        LIMIT 1;
    ELSE
        SET v_qc_packing_id = CONCAT('QCPP', DATE_FORMAT(NOW(), '%y%m%d'), '0001');
    END IF;

    -- INSERT 작업 수행
    IF v_qc_packing_id IS NOT NULL THEN
        INSERT INTO qc_packaging(qc_packing_id, total_qnt, inspec_start, inspec_status, emp_num, process_num)
        VALUES (v_qc_packing_id, v_total_qnt, CURRENT_TIMESTAMP, '검사요청완료', v_emp_num, v_process_num);

        -- INSERT 성공 여부 확인
        IF ROW_COUNT() = 1 THEN
            COMMIT;
            SET v_result = 'Success!';
        ELSE
            ROLLBACK;
            SET v_result = 'Fail...';
        END IF;
    ELSE
        ROLLBACK;
        SET v_result = 'Fail...';
    END IF;
    
    SELECT v_result AS result;

END//
DELIMITER ;

select * from invalid_material;

select *
from process_work_header;

select * from process_work_body;

-- delete from process_work_body where process_num in (23, 24, 25, 26, 27, 28);

select * from invalid_material 
where 

commit;

select * from production_order;
select * from production_plan;
select * from order_plan_relation;

select * from process_work_header;
select * from process_work_body;

select * from 

select 
	production_order_num, 
	production_order_name, 
    pp.plan_name, 
    your_product(po.product_code, 'product_name') as product_name,
    po.work_date,
    po.production_order_qty,
    po.production_order_status
from production_order po join production_plan pp
where po.plan_num = pp.plan_num;



select plan_name, p.plan_create_date, p.plan_start_date,p.plan_end_date, p.plan_status, p.plan_emp, p.plan_num, your_product(o.product_code, 'product_name') as product_name, o.product_code, o.plan_qty
from production_plan p join order_plan_relation o
where p.plan_num = o.plan_num;

update production_plan
set plan_status = ?
where plan_num = ?;

select 
rownum(),
        production_order_num, 
        production_order_name, 
        po.plan_num, 
        po.product_code, 
        p.product_name, 
        DATE_FORMAT(work_date, '%Y-%m-%d') AS work_date, 
        production_order_qty, 
        production_order_date, 
        emp_num, 
        po.production_order_status,
        o.order_plan_num
    from production_order po inner join product p right join order_plan_relation o
        on po.product_code = p.product_code
        and o.plan_num = po.plan_num
    where po.production_order_status in ('work_waiting', 'work_in_process');


select 
rownum(),
        production_order_num, 
        production_order_name, 
        po.plan_num, 
        po.product_code, 
        p.product_name, 
        DATE_FORMAT(work_date, '%Y-%m-%d') AS work_date, 
        production_order_qty, 
        production_order_date, 
        emp_num, 
        po.production_order_status
    from production_order po inner join product p inner join production_plan pp
        on po.product_code = p.product_code
        and pp.plan_num = po.plan_num;
        
select * from material_lot_qty1;
        
drop procedure deductMaterial;

DELIMITER //
CREATE PROCEDURE `deductMaterial`(
    IN p_production_order_num INT
)
BEGIN
    -- 변수 선언
    DECLARE v_material_code VARCHAR(50);
    DECLARE v_lot_code VARCHAR(50);
    DECLARE v_material_qty INT;
    DECLARE done INT DEFAULT 0;

    -- 커서 선언
    DECLARE cur CURSOR FOR
        SELECT material_code, lot_code, material_qty
        FROM invalid_material
        WHERE production_order_num = p_production_order_num;

    -- 핸들러 선언
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;

    -- 커서 열기
    OPEN cur;

    -- 레코드 순회
    read_loop: LOOP
        -- 커서에서 한 행씩 추출
        FETCH cur INTO v_material_code, v_lot_code, v_material_qty;

        -- 종료 조건
        IF done THEN
            LEAVE read_loop;
        END IF;

        -- 1. material_lot_qty1 테이블의 out_qty 업데이트
        UPDATE material_lot_qty1
        SET out_qty = out_qty + v_material_qty
        WHERE material_code = v_material_code
		  AND material_nomal = 'b1'
          AND lot_code = v_lot_code;

        -- 2. stok_qty 재계산
        UPDATE material_lot_qty1
        SET stok_qty = in_qty - out_qty
        WHERE material_code = v_material_code
          AND material_nomal = 'b1'
          AND lot_code = v_lot_code;

        -- 3. invalid_material 테이블의 is_out, out_date 업데이트
        UPDATE invalid_material
        SET is_out = TRUE,
            out_date = NOW()
        WHERE material_code = v_material_code
          AND lot_code = v_lot_code
          AND production_order_num = p_production_order_num;

    END LOOP;

    -- 커서 닫기
    CLOSE cur;

END//
DELIMITER ;


