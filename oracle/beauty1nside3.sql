select * from grpwr_in_approval where employee_num = 1;

update hr_employee
set employee_pw = '$2a$10$CN.xGP4ObA.BQfiBW935YuHvmDZn9o9KyUVh0bL5PBZg09A2Rk.am'
where employee_id = 240103001;

commit;

select * from stdr_warehouse;

select * from hr_department
where company_num = 45 and department_name like '%팀'
;
select * from stdr_dept;
select * from hr_employee where company_num = 45;
select * from erp_company;
select * from erp_user_accounts;

select * from stdr_warehouse;
select * from cmmn;

select rowId, msg_id, msg_content from grpwr_chat_message
order by rowId;

SELECT
            msg_id,
            room_id,
            employee_num,
            msg_content,
            send_date
        FROM grpwr_chat_message
        WHERE msg_id = (SELECT MAX(msg_id) FROM grpwr_chat_message);

select * from cmmn;

select * from stdr_document;
select * from stdr_dept;
select * from grpwr_in_approval where company_num = 1;

update stdr_dept
set branch = '남구점' where dept_no = 4;

select * from hr_employee;
ALTER TABLE STDR_DOCUMENT 
MODIFY DOCUMENT_TEMPLATE VARCHAR2(4000);

commit;

CREATE SEQUENCE stdr_doc_seq
START WITH 1       
INCREMENT BY 1     
NOCACHE           
NOCYCLE;          

ALTER TABLE GRPWR_IN_APPROVAL 
RENAME COLUMN IN_APPROVAL_REJECTED_PATH TO IN_APPROVAL_FILE_PATH;

select * from GRPWR_IN_APPROVAL;
select * from hr_employee;
INSERT INTO GRPWR_IN_APPROVAL (
    IN_APPROVAL_ID, DOCUMENT_ID, EMPLOYEE_NUM, IN_APPROVAL_REQUEST_DATE, 
    IN_APPROVAL_STATUS, IN_APPROVAL_REQUEST_CONTENT, IN_APPROVAL_REJECTED_CONTENT, 
    IN_APPROVAL_FILE_PATH, COMPANY_NUM
) VALUES 
(
    grpwr_apprv_seq.NEXTVAL, 5, 3, SYSDATE, 
    'WAITING', '<p>Approval request for project A</p>', NULL, 
    NULL, 1
);
commit;
INSERT INTO GRPWR_IN_APPROVAL (
    IN_APPROVAL_ID, DOCUMENT_ID, EMPLOYEE_NUM, IN_APPROVAL_REQUEST_DATE, 
    IN_APPROVAL_STATUS, IN_APPROVAL_REQUEST_CONTENT, IN_APPROVAL_REJECTED_CONTENT, 
    IN_APPROVAL_FILE_PATH, COMPANY_NUM
) VALUES 
(
    grpwr_apprv_seq.NEXTVAL, 1002, 20002, SYSDATE - 1, 
    'APPROVED', '<p>Approval request for budget review</p>', NULL, 
    NULL, 3002
);

INSERT INTO GRPWR_IN_APPROVAL (
    IN_APPROVAL_ID, DOCUMENT_ID, EMPLOYEE_NUM, IN_APPROVAL_REQUEST_DATE, 
    IN_APPROVAL_STATUS, IN_APPROVAL_REQUEST_CONTENT, IN_APPROVAL_REJECTED_CONTENT, 
    IN_APPROVAL_FILE_PATH, COMPANY_NUM
) VALUES 
(
    grpwr_apprv_seq.NEXTVAL, 1003, 20003, SYSDATE - 2, 
    'REJECTED', '<p>Request for software license purchase</p>', 
    'Insufficient budget', '/rejected_docs/license_rejection.pdf', 3003
);

INSERT INTO GRPWR_IN_APPROVAL (
    IN_APPROVAL_ID, DOCUMENT_ID, EMPLOYEE_NUM, IN_APPROVAL_REQUEST_DATE, 
    IN_APPROVAL_STATUS, IN_APPROVAL_REQUEST_CONTENT, IN_APPROVAL_REJECTED_CONTENT, 
    IN_APPROVAL_FILE_PATH, COMPANY_NUM
) VALUES 
(
    grpwr_apprv_seq.NEXTVAL, 1004, 20004, SYSDATE - 3, 
    'WAITING', '<p>Approval request for team outing</p>', NULL, 
    NULL, 3004
);

INSERT INTO GRPWR_IN_APPROVAL (
    IN_APPROVAL_ID, DOCUMENT_ID, EMPLOYEE_NUM, IN_APPROVAL_REQUEST_DATE, 
    IN_APPROVAL_STATUS, IN_APPROVAL_REQUEST_CONTENT, IN_APPROVAL_REJECTED_CONTENT, 
    IN_APPROVAL_FILE_PATH, COMPANY_NUM
) VALUES 
(
    grpwr_apprv_seq.NEXTVAL, 1005, 20005, SYSDATE - 4, 
    'APPROVED', '<p>Approval request for hiring new developer</p>', NULL, 
    NULL, 3005
);

select * from hr_employee;
select * from erp_company;

select company_eng_name, employee_id, employee_pw
from hr_employee h join erp_company e
on h.company_num = e.company_num;

select * from cmmn;

SELECT employee_pw FROM hr_employee WHERE employee_id = 'emp003';

UPDATE hr_employee 
SET employee_pw = 'hashed_pw' 
WHERE employee_id = 'emp003';
commit;

UPDATE hr_employee 
SET employee_pw = '$2a$16$j3eZqBhb/670WwnTQ7L5T.fCfj5hv4hchCLkLBZ2Xib2VVUfp.7JG' 
WHERE employee_id = 'emp003';

select cmmn_code
        from hr_employee h
                 join cmmn c on (h.authority = c.cmmn_code);
                 
select * from stdr_dept;

update stdr_dept
set company_num = 1;

CREATE TABLE stdr_dept (
    dept_no   NUMBER PRIMARY KEY,       -- 번호 (기본 키)
    dept_name VARCHAR2(50) NOT NULL,    -- 부서명
    branch    VARCHAR2(50) NOT NULL,    -- 지점명
    address   VARCHAR2(255) NOT NULL    -- 주소
);
INSERT INTO stdr_dept (dept_no, dept_name, branch, address) VALUES (1, '영업', '본사', '서울특별시 중구 중앙대로 101');
INSERT INTO stdr_dept (dept_no, dept_name, branch, address) VALUES (2, '제품', '본사', '서울특별시 중구 중앙대로 101');
INSERT INTO stdr_dept (dept_no, dept_name, branch, address) VALUES (3, '지점', '중구', '대구 중구 중앙대로 403');
INSERT INTO stdr_dept (dept_no, dept_name, branch, address) VALUES (4, '지점', '남구', '대구 남구 남대로 50');

CREATE SEQUENCE stdr_dept_seq 
    START WITH 1      -- 1부터 시작
    INCREMENT BY 1    -- 1씩 증가
    NOCACHE           -- 캐시 없이 사용
    NOCYCLE;          -- 최대값 도달 시 초기화 안 함

commit;

ALTER TABLE STDR_DEPT 
ADD company_num NUMBER(8,0);

ALTER TABLE GRPWR_IN_APPROVAL 
MODIFY IN_APPROVAL_REQUEST_CONTENT VARCHAR2(2000);



SELECT CONSTRAINT_NAME, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'STDR_DEPT' AND CONSTRAINT_TYPE = 'P';

ALTER TABLE STDR_DEPT DROP PRIMARY KEY;
ALTER TABLE STDR_DEPT 
ADD CONSTRAINT pk_stdr_dept PRIMARY KEY (dept_no);

select * from grpwr_in_approval;
select * from stdr_document;
select * from hr_department;

select * from hr_employee;
select * from erp_user_accounts;
select * from cmmn where cmmn_code like 'PO%';

select * from grpwr_chat_room;
select * from grpwr_chat_message;

select * from bsn_bhf;

ALTER TABLE business_bhf RENAME TO bsn_bhf;
ALTER TABLE bsn_bhf RENAME COLUMN HHF_NAME TO bhf_name;
commit;

select * from grpwr_room_employee;

ALTER TABLE grpwr_chat_message 
RENAME COLUMN grpwr_msg_id TO msg_id;

ALTER TABLE grpwr_chat_message 
RENAME COLUMN GRPWR_ROOM_ID TO room_id;

ALTER TABLE grpwr_chat_message 
RENAME COLUMN GRPWR_MSG_CONTENT TO msg_content;

ALTER TABLE grpwr_chat_message 
RENAME COLUMN GRPWR_MSG_SENT_AT TO send_date;

ALTER TABLE grpwr_chat_room 
MODIFY created_at DEFAULT SYSDATE;

CREATE TABLE grpwr_room_employee (
    room_id NUMBER(10) NOT NULL,
    employee_num NUMBER(10) NOT NULL,
    PRIMARY KEY (room_id, employee_num),
    FOREIGN KEY (room_id) REFERENCES grpwr_chat_room(room_id),
    FOREIGN KEY (employee_num) REFERENCES hr_employee(employee_num)
);




ALTER TABLE grpwr_chat_room 
RENAME COLUMN GRPWR_ROOM_CREATED_AT TO created_at;

ALTER TABLE grpwr_chat_room 
ADD CONSTRAINT unique_chat UNIQUE (employee_num1, employee_num2);

CREATE SEQUENCE  "BEAUTY1NSIDE"."GRPWR_CAHT_ROOM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 179 NOCACHE  NOORDER  NOCYCLE ;
CREATE SEQUENCE  "BEAUTY1NSIDE"."GRPWR_CAHT_MESSAGE_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 179 NOCACHE  NOORDER  NOCYCLE ;

SELECT *
FROM grpwr_chat_room
WHERE (employee_num1 = 1 AND employee_num2 = 41)
   OR (employee_num1 = 41 AND employee_num2 = 1)
FETCH FIRST 1 ROW ONLY; -- Oracle에서 LIMIT 1 대체


CREATE SEQUENCE  "BEAUTY1NSIDE"."BSN_BHF_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 19 NOCACHE  NOORDER  NOCYCLE ;

INSERT INTO bsn_bhf (
    BHF_ID, BHF_NAME, BHF_PHONE, BHF_ADDRESS, BHF_INITIAL_COST, 
    REAL_ESTATE_NAME, REAL_ESTATE_PHONE, RENTAL_TYPE, MONTHLY_MAINTENANCE_COST, COMPANY_NUM
) VALUES (
    BSN_BHF_SEQ.NEXTVAL,  -- 시퀀스를 사용하여 자동 증가
    '강남점',  -- BHF_NAME
    '02-1234-5678',  -- BHF_PHONE
    '서울특별시 강남구 테헤란로 123',  -- BHF_ADDRESS
    5000,  -- BHF_INITIAL_COST (단위: 만원)
    'ABC 부동산',  -- REAL_ESTATE_NAME
    '02-9876-5432',  -- REAL_ESTATE_PHONE
    'LFSTS',  -- RENTAL_TYPE (CHECK 조건: 'LFSTS' 또는 'MTHT')
    null,  -- MONTHLY_MAINTENANCE_COST (단위: 만원, NULL 가능)
    1  -- COMPANY_NUM
);

INSERT INTO bsn_bhf (
    BHF_ID, BHF_NAME, BHF_PHONE, BHF_ADDRESS, BHF_INITIAL_COST, 
    REAL_ESTATE_NAME, REAL_ESTATE_PHONE, RENTAL_TYPE, MONTHLY_MAINTENANCE_COST, COMPANY_NUM
) VALUES (
    BSN_BHF_SEQ.NEXTVAL,
    '서초점', 
    '02-2222-3333', 
    '서울특별시 서초구 서초대로 456', 
    7000, 
    'XYZ 부동산', 
    '02-5555-6666', 
    'MTHT', 
    100,  -- 월 유지비를 입력하지 않음 (NULL 허용)
    1
);

INSERT INTO bsn_bhf (
    BHF_ID, BHF_NAME, BHF_PHONE, BHF_ADDRESS, BHF_INITIAL_COST, 
    REAL_ESTATE_NAME, REAL_ESTATE_PHONE, RENTAL_TYPE, MONTHLY_MAINTENANCE_COST, COMPANY_NUM
) VALUES 
(BSN_BHF_SEQ.NEXTVAL, '역삼점', '02-1111-2222', '서울 강남구 역삼동 123', 5000, 'A 부동산', '02-2222-3333', 'LFSTS', NULL, 1);
INSERT INTO bsn_bhf (
    BHF_ID, BHF_NAME, BHF_PHONE, BHF_ADDRESS, BHF_INITIAL_COST, 
    REAL_ESTATE_NAME, REAL_ESTATE_PHONE, RENTAL_TYPE, MONTHLY_MAINTENANCE_COST, COMPANY_NUM
) VALUES 
(BSN_BHF_SEQ.NEXTVAL, '잠실점', '02-2222-3333', '서울 송파구 올림픽대로 456', 6000, 'B 부동산', '02-3333-4444', 'MTHT', 250, 1);
INSERT INTO bsn_bhf (
    BHF_ID, BHF_NAME, BHF_PHONE, BHF_ADDRESS, BHF_INITIAL_COST, 
    REAL_ESTATE_NAME, REAL_ESTATE_PHONE, RENTAL_TYPE, MONTHLY_MAINTENANCE_COST, COMPANY_NUM
) VALUES 
(BSN_BHF_SEQ.NEXTVAL, '종각점', '02-3333-4444', '서울 종로구 종각로 789', 4500, 'C 부동산', '02-4444-5555', 'LFSTS', NULL, 1);
INSERT INTO bsn_bhf (
    BHF_ID, BHF_NAME, BHF_PHONE, BHF_ADDRESS, BHF_INITIAL_COST, 
    REAL_ESTATE_NAME, REAL_ESTATE_PHONE, RENTAL_TYPE, MONTHLY_MAINTENANCE_COST, COMPANY_NUM
) VALUES 
(BSN_BHF_SEQ.NEXTVAL, '구로점', '02-4444-5555', '서울 구로구 디지털로 100', 5500, 'D 부동산', '02-5555-6666', 'MTHT', 200, 1);
INSERT INTO bsn_bhf (
    BHF_ID, BHF_NAME, BHF_PHONE, BHF_ADDRESS, BHF_INITIAL_COST, 
    REAL_ESTATE_NAME, REAL_ESTATE_PHONE, RENTAL_TYPE, MONTHLY_MAINTENANCE_COST, COMPANY_NUM
) VALUES 
(BSN_BHF_SEQ.NEXTVAL, '서초벤처점', '02-5555-6666', '서울 서초구 서초대로 200', 7000, 'E 부동산', '02-6666-7777', 'LFSTS', NULL, 1);
INSERT INTO bsn_bhf (
    BHF_ID, BHF_NAME, BHF_PHONE, BHF_ADDRESS, BHF_INITIAL_COST, 
    REAL_ESTATE_NAME, REAL_ESTATE_PHONE, RENTAL_TYPE, MONTHLY_MAINTENANCE_COST, COMPANY_NUM
) VALUES 
(BSN_BHF_SEQ.NEXTVAL, '마포점', '02-6666-7777', '서울 마포구 마포대로 300', 4800, 'F 부동산', '02-7777-8888', 'MTHT', 180, 1);
INSERT INTO bsn_bhf (
    BHF_ID, BHF_NAME, BHF_PHONE, BHF_ADDRESS, BHF_INITIAL_COST, 
    REAL_ESTATE_NAME, REAL_ESTATE_PHONE, RENTAL_TYPE, MONTHLY_MAINTENANCE_COST, COMPANY_NUM
) VALUES 
(BSN_BHF_SEQ.NEXTVAL, '성수점', '02-7777-8888', '서울 성동구 성수동 400', 6200, 'G 부동산', '02-8888-9999', 'LFSTS', NULL, 1);
INSERT INTO bsn_bhf (
    BHF_ID, BHF_NAME, BHF_PHONE, BHF_ADDRESS, BHF_INITIAL_COST, 
    REAL_ESTATE_NAME, REAL_ESTATE_PHONE, RENTAL_TYPE, MONTHLY_MAINTENANCE_COST, COMPANY_NUM
) VALUES 
(BSN_BHF_SEQ.NEXTVAL, '대치점', '02-8888-9999', '서울 강남구 대치동 500', 5300, 'H 부동산', '02-9999-0000', 'MTHT', 220, 1);
INSERT INTO bsn_bhf (
    BHF_ID, BHF_NAME, BHF_PHONE, BHF_ADDRESS, BHF_INITIAL_COST, 
    REAL_ESTATE_NAME, REAL_ESTATE_PHONE, RENTAL_TYPE, MONTHLY_MAINTENANCE_COST, COMPANY_NUM
) VALUES 
(BSN_BHF_SEQ.NEXTVAL, '용산점', '02-9999-0000', '서울 용산구 한강대로 600', 5800, 'I 부동산', '02-0000-1111', 'LFSTS', NULL, 1);
INSERT INTO bsn_bhf (
    BHF_ID, BHF_NAME, BHF_PHONE, BHF_ADDRESS, BHF_INITIAL_COST, 
    REAL_ESTATE_NAME, REAL_ESTATE_PHONE, RENTAL_TYPE, MONTHLY_MAINTENANCE_COST, COMPANY_NUM
) VALUES 
(BSN_BHF_SEQ.NEXTVAL, '강동점', '02-0000-1111', '서울 강동구 천호대로 700', 4900, 'J 부동산', '02-1111-2222', 'MTHT', 210, 1);
