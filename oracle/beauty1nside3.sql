select * from grpwr_in_approval;

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

SELECT CONSTRAINT_NAME, TABLE_NAME
FROM USER_CONSTRAINTS
WHERE TABLE_NAME = 'STDR_DEPT' AND CONSTRAINT_TYPE = 'P';

ALTER TABLE STDR_DEPT DROP PRIMARY KEY;
ALTER TABLE STDR_DEPT 
ADD CONSTRAINT pk_stdr_dept PRIMARY KEY (dept_no);

select * from grpwr_in_approval;
select * from stdr_document;
