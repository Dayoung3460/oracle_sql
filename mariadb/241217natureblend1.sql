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
