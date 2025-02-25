select * from grpwr_in_approval;
select * from stdr_document;
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
    grpwr_apprv_seq.NEXTVAL, 5, 1, SYSDATE, 
    'WAITING', '<p>????????????</p>', NULL, 
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
