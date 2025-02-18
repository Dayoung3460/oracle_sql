select cmmn_code
from hr_employee h
     join cmmn c on (h.authority = c.cmmn_code)
     where h.employee_num = 1;
     
select * from grpwr_in_approval;



select * from cmmn;
where cmmn_code like 'RT%';
COMMIT;
SELECT fn_get_cmmn_name('AU001') FROM dual;

INSERT INTO CMMN (CMMN_CODE, UPPER_CMMN_CODE, CMMN_NAME)
VALUES('DO', NULL, '문서 내/외부 결재 타입');
INSERT INTO CMMN (CMMN_CODE, UPPER_CMMN_CODE, CMMN_NAME)
VALUES('DO001', 'DO', '문서 내부 결재 타입');
INSERT INTO CMMN (CMMN_CODE, UPPER_CMMN_CODE, CMMN_NAME)
VALUES('DO002', 'DO', '문서 외부 결재 타입');
                 
INSERT INTO grpwr_vendor (
    VENDOR_ID,
    VENDOR_NAME,
    CHIEF_NAME,
    ADDRESS,
    OFFICER,
    BUSINESS_TYPE,
    EMAIL,
    BUSINESS_REGISTERATION_NUMBER,
    PHONE,
    MARGIN_RATE,
    BANK_NAME,
    BANK_ACCOUNT,
    DEPOSITOR
) VALUES 
(
    grpwr_apprv_seq.NEXTVAL, '블루팜', '김다일', '대구 남구 국채보상로34길 12',
    '홍길은', 'BT002', 'aaa@baa.com', '6156554-545', '010-5545-5855', '5', 'e', '656-6854654-654', '김다영'
);


select * from grpwr_vendor;

INSERT INTO grpwr_vendor (VENDOR_ID, VENDOR_NAME, CHIEF_NAME, ADDRESS, OFFICER, BUSINESS_TYPE, EMAIL, BUSINESS_REGISTERATION_NUMBER, PHONE, MARGIN_RATE, BANK_NAME, BANK_ACCOUNT, DEPOSITOR)
VALUES (grpwr_apprv_seq.NEXTVAL, '루미엘', '이하린', '서울 강남구 테헤란로 123', '박성민', 'BT001', 'lumiel@cos.com', '123-45-67890', '010-1234-5678', '7', '신한은행', '110-123-456789', '이하린');

INSERT INTO grpwr_vendor (VENDOR_ID, VENDOR_NAME, CHIEF_NAME, ADDRESS, OFFICER, BUSINESS_TYPE, EMAIL, BUSINESS_REGISTERATION_NUMBER, PHONE, MARGIN_RATE, BANK_NAME, BANK_ACCOUNT, DEPOSITOR)
VALUES (grpwr_apprv_seq.NEXTVAL, '더브릿지', '최지우', '부산 해운대구 해운대로 456', '김지훈', 'BT002', 'bridge@cos.com', '234-56-78901', '010-9876-5432', '6', 'KB국민은행', '356-7890-123456', '최지우');

INSERT INTO grpwr_vendor (VENDOR_ID, VENDOR_NAME, CHIEF_NAME, ADDRESS, OFFICER, BUSINESS_TYPE, EMAIL, BUSINESS_REGISTERATION_NUMBER, PHONE, MARGIN_RATE, BANK_NAME, BANK_ACCOUNT, DEPOSITOR)
VALUES (grpwr_apprv_seq.NEXTVAL, '벨라비스', '한예린', '인천 남동구 인주대로 789', '장민석', 'BT003', 'bellavis@cos.com', '345-67-89012', '010-1111-2222', '8', '우리은행', '1002-123-456789', '한예린');

INSERT INTO grpwr_vendor (VENDOR_ID, VENDOR_NAME, CHIEF_NAME, ADDRESS, OFFICER, BUSINESS_TYPE, EMAIL, BUSINESS_REGISTERATION_NUMBER, PHONE, MARGIN_RATE, BANK_NAME, BANK_ACCOUNT, DEPOSITOR)
VALUES (grpwr_apprv_seq.NEXTVAL, '네이처블룸', '박서준', '대전 중구 대종로 101', '김민지', 'BT001', 'nature@cos.com', '456-78-90123', '010-3333-4444', '5', '하나은행', '620-123-456789', '박서준');

INSERT INTO grpwr_vendor (VENDOR_ID, VENDOR_NAME, CHIEF_NAME, ADDRESS, OFFICER, BUSINESS_TYPE, EMAIL, BUSINESS_REGISTERATION_NUMBER, PHONE, MARGIN_RATE, BANK_NAME, BANK_ACCOUNT, DEPOSITOR)
VALUES (grpwr_apprv_seq.NEXTVAL, '스킨크래프트', '윤다솜', '울산 남구 삼산로 121', '오준혁', 'BT002', 'skincraft@cos.com', '567-89-01234', '010-5555-6666', '9', 'IBK기업은행', '123-456-789012', '윤다솜');

INSERT INTO grpwr_vendor (VENDOR_ID, VENDOR_NAME, CHIEF_NAME, ADDRESS, OFFICER, BUSINESS_TYPE, EMAIL, BUSINESS_REGISTERATION_NUMBER, PHONE, MARGIN_RATE, BANK_NAME, BANK_ACCOUNT, DEPOSITOR)
VALUES (grpwr_apprv_seq.NEXTVAL, '에센스랩', '차은우', '광주 서구 상무대로 151', '이수빈', 'BT003', 'essencelab@cos.com', '678-90-12345', '010-7777-8888', '7', '신한은행', '140-123-456789', '차은우');

INSERT INTO grpwr_vendor (VENDOR_ID, VENDOR_NAME, CHIEF_NAME, ADDRESS, OFFICER, BUSINESS_TYPE, EMAIL, BUSINESS_REGISTERATION_NUMBER, PHONE, MARGIN_RATE, BANK_NAME, BANK_ACCOUNT, DEPOSITOR)
VALUES (grpwr_apprv_seq.NEXTVAL, '코스블랑', '김아린', '서울 송파구 송파대로 201', '정우진', 'BT001', 'cosblanc@cos.com', '789-01-23456', '010-9999-0000', '6', 'KB국민은행', '045-678-901234', '김아린');

INSERT INTO grpwr_vendor (VENDOR_ID, VENDOR_NAME, CHIEF_NAME, ADDRESS, OFFICER, BUSINESS_TYPE, EMAIL, BUSINESS_REGISTERATION_NUMBER, PHONE, MARGIN_RATE, BANK_NAME, BANK_ACCOUNT, DEPOSITOR)
VALUES (grpwr_apprv_seq.NEXTVAL, '뷰티포지', '손연재', '서울 종로구 종로 45', '황현준', 'BT002', 'beautyforge@cos.com', '890-12-34567', '010-1212-3434', '8', '하나은행', '321-123-654987', '손연재');

INSERT INTO grpwr_vendor (VENDOR_ID, VENDOR_NAME, CHIEF_NAME, ADDRESS, OFFICER, BUSINESS_TYPE, EMAIL, BUSINESS_REGISTERATION_NUMBER, PHONE, MARGIN_RATE, BANK_NAME, BANK_ACCOUNT, DEPOSITOR)
VALUES (grpwr_apprv_seq.NEXTVAL, '퓨어스킨웍스', '정나래', '수원 팔달구 효원로 123', '백상훈', 'BT003', 'pureworks@cos.com', '901-23-45678', '010-4343-5656', '7', 'IBK기업은행', '563-897-231045', '정나래');

INSERT INTO grpwr_vendor (VENDOR_ID, VENDOR_NAME, CHIEF_NAME, ADDRESS, OFFICER, BUSINESS_TYPE, EMAIL, BUSINESS_REGISTERATION_NUMBER, PHONE, MARGIN_RATE, BANK_NAME, BANK_ACCOUNT, DEPOSITOR)
VALUES (grpwr_apprv_seq.NEXTVAL, '뷰티앤코', '오하나', '창원 성산구 중앙대로 456', '강하준', 'BT001', 'beautyco@cos.com', '012-34-56789', '010-6767-7878', '5', '우리은행', '789-321-654098', '오하나');

UPDATE grpwr_vendor
SET BUSINESS_TYPE = 'BT001'
WHERE BUSINESS_TYPE = 'BT003';

select * from stdr_document;

ALTER TABLE stdr_document
RENAME COLUMN BHF_NAME TO DEPT_NAME;

SELECT * FROM ERP_COMPANY;
SELECT * FROM stdr_document;

INSERT INTO stdr_document (DOCUMENT_ID,
                            DOCUMENT_TYPE,
                            DOCUMENT_NAME,
                            DOCUMENT_TEMPLATE,
                            DEPT_NAME,
                            APPROVAL_TYPE,
                            COMPANY_NUM)
VALUES (stdr_doc_seq.NEXTVAL, '근태', '근태수정요청서', '<h3>제목</h3><p>내용</p>', '영업', 'IN', 27);

INSERT INTO stdr_document (DOCUMENT_ID, DOCUMENT_TYPE, DOCUMENT_NAME, DOCUMENT_TEMPLATE, DEPT_NAME, APPROVAL_TYPE, COMPANY_NUM)
VALUES (stdr_doc_seq.NEXTVAL, '구매', '구매요청서', '<h3>구매 요청</h3><p>구매할 항목 상세</p>', '재고', 'IN', 1);

INSERT INTO stdr_document (DOCUMENT_ID, DOCUMENT_TYPE, DOCUMENT_NAME, DOCUMENT_TEMPLATE, DEPT_NAME, APPROVAL_TYPE, COMPANY_NUM)
VALUES (stdr_doc_seq.NEXTVAL, '인사', '인사발령서', '<h3>인사 발령</h3><p>발령 대상자 및 내용</p>', '인사', 'IN', 2);

INSERT INTO stdr_document (DOCUMENT_ID, DOCUMENT_TYPE, DOCUMENT_NAME, DOCUMENT_TEMPLATE, DEPT_NAME, APPROVAL_TYPE, COMPANY_NUM)
VALUES (stdr_doc_seq.NEXTVAL, '재무', '지출결의서', '<h3>지출 결의</h3><p>지출 내역과 사유</p>', '회계', 'IN', 3);

INSERT INTO stdr_document (DOCUMENT_ID, DOCUMENT_TYPE, DOCUMENT_NAME, DOCUMENT_TEMPLATE, DEPT_NAME, APPROVAL_TYPE, COMPANY_NUM)
VALUES (stdr_doc_seq.NEXTVAL, '총무', '자산변경신청서', '<h3>자산 변경</h3><p>변경할 자산 및 내용</p>', '회계', 'IN', 4);

COMMIT;

select * from grpwr_vendor;
select * from grpwr_in_approval;

UPDATE grpwr_in_approval 
SET company_num = 1;

ALTER TABLE grpwr_ex_approval 
MODIFY vendor_id NULL;

ALTER TABLE grpwr_vendor 
ADD ex_approval_id NUMBER(10, 0) DEFAULT 0 NOT NULL;

ALTER TABLE grpwr_vendor 
ADD company_num NUMBER(10, 0) DEFAULT 0 NOT NULL;

UPDATE grpwr_vendor 
SET company_num = 1;

UPDATE hr_employee 
SET employee_pw = '$2a$16$j3eZqBhb/670WwnTQ7L5T.fCfj5hv4hchCLkLBZ2Xib2VVUfp.7JG';

commit;

select * from hr_employee;
select * from erp_user_accounts;
select * from erp_company;

select h.employee_num,
               h.employee_id,
               h.employee_pw,
               h.employee_name,
               h.email,
               h.phone,
               h.position,
               h.company_num,
               h.department_num,
               h.authority,
               e.company_eng_name
        from hr_employee h join erp_company e
         on   h.company_num = e.company_num
        where h.employee_id = 'emp003';
        
SELECT employee_num, employee_id, employee_pw, employee_name, email, phone, position, company_num, department_num, authority, company_eng_name
FROM (
    -- hr_employee에서 가져오기
    SELECT h.employee_num,
           h.employee_id,
           h.employee_pw,
           h.employee_name,
           h.email,
           h.phone,
           h.position,
           h.company_num,
           h.department_num,
           h.authority,
           e.company_eng_name
    FROM hr_employee h 
    JOIN erp_company e ON h.company_num = e.company_num
    WHERE h.employee_id = 'oliveyoung'

    UNION ALL

    -- erp_user_accounts에서 가져오기
    SELECT NULL AS employee_num,  -- NULL이면 0으로 변환
           u.employee_id,
           u.employee_pw,
           NULL AS employee_name,
           NULL AS email,
           NULL AS phone,
           NULL AS position,
           u.company_num,
           NULL AS department_num,
           u.authority,
           NULL AS company_eng_name
    FROM erp_user_accounts u
    JOIN erp_company e ON u.company_num = e.company_num
    WHERE u.employee_id = 'oliveyoung'
) all_accounts;

SELECT 'ROLE_' || c.cmmn_code AS role_name
        FROM hr_employee h
                 JOIN cmmn c ON h.authority = c.cmmn_code
        WHERE h.employee_id = 'emp003'

        UNION ALL

        SELECT 'ROLE_' || c.cmmn_code AS role_name
        FROM erp_user_accounts u
                 JOIN cmmn c ON u.authority = c.cmmn_code
        WHERE u.employee_id = 'emp003';
        
select * from cmmn;
commit;
select * from grpwr_in_approval;

select * from hr_employee;

UPDATE grpwr_in_approval
SET employee_num = 1;

SELECT g.in_approval_id,
        g.document_id,
        g.employee_num,
        h.employee_name,
        g.in_approval_request_date,
        g.in_approval_status,
        g.in_approval_request_content,
        g.in_approval_rejected_content,
        g.in_approval_file_path,
        g.company_num
		FROM (SELECT /*+INDEX_DESC(grpwr_in_approval pk_grpwr_in_approval)*/
				rownum rn,
				g.in_approval_id,
				g.document_id,
				g.employee_num,
				h.employee_name,
				g.in_approval_request_date,
				g.in_approval_status,
				g.in_approval_request_content,
				g.in_approval_rejected_content,
				g.in_approval_file_path,
				g.company_num
		FROM grpwr_in_approval g join hr_employee h
			on g.employee_num = h.employee_num);
            
            
SELECT /*+INDEX_DESC(grpwr_in_approval pk_grpwr_in_approval)*/
				rownum rn,
				g.in_approval_id,
				g.document_id,
				g.employee_num,
				h.employee_name,
				g.in_approval_request_date,
				g.in_approval_status,
				g.in_approval_request_content,
				g.in_approval_rejected_content,
				g.in_approval_file_path,
				g.company_num
		FROM grpwr_in_approval g join hr_employee h
			on g.employee_num = h.employee_num;