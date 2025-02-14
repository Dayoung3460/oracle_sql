ALTER TABLE tbl_board ADD replycnt number(10) DEFAULT 0 NOT NULL;

select * from tbl_reply;

select * from tbl_board;

update tbl_board
set replycnt = (
    select count(bno) 
    from tbl_reply
    where bno = 3014669
)
where bno = 3014669;
commit;

select * from employees;
select * from jobs;

select * from departments;
SELECT
            /*+index_desc(employees EMP_EMP_ID_PK)*/
            employee_id,
            first_name,
            last_name,
            email,
            phone_number,
            hire_date,
            e.job_id,
            salary,
            commission_pct,
            manager_id,
            department_id,
            (select job_title from jobs where job_id = e.job_id) job_title
        FROM employees e;
        
        
select * from customer;
select * from address;
select * from posts;

-----------------------------------------------------------

CREATE TABLE BOOK_TBL_06(
BOOK_NO         NUMBER,
BOOK_NAME       VARCHAR2(50),
BOOK_COVERIMG   VARCHAR2(20),
BOOK_DATE       DATE,
BOOK_PRICE      NUMBER,
BOOK_PUBLISHER  VARCHAR2(50),
BOOK_INFO       VARCHAR2(2000),
PRIMARY KEY(BOOK_NO) );

insert into book_tbl_06 values(100, '리눅스',          '100.jpg', '15/09/02', 24000, '나룩스','운영체제, DB기초, 네트워크 기초, 개발환경구축'); 
insert into book_tbl_06 values(101, '자바',            '101.jpg', '16/01/10', 20000, '이자바', '프로그래밍 언어');
insert into book_tbl_06 values(102, '자바웹프로그래밍','102.jpg', '16/10/30', 25000, '김프로', '개발환경/서버프로그램/배치프로그램');
insert into book_tbl_06 values(103, '오픈소스활용하기','103.jpg', '17/09/01', 30000, '박오픈', '형상관리, 빌드, 배포');
insert into book_tbl_06 values(104, 'HTML',            '104.jpg', '18/04/04', 10000, '홍길동', 'HTML/CSS/JAVASCRIPT/JQUERY');

CREATE TABLE RENT_TBL_06(
RENT_NO     NUMBER,
BOOK_NO     NUMBER,
RENT_PRICE  NUMBER,
RENT_DATE   DATE,
RENT_STATUS CHAR(1),
PRIMARY KEY(RENT_NO) );

insert into RENT_TBL_06 values(10001, 100, 2400, '18/07/02',1);
insert into RENT_TBL_06 values(10002, 101, 2000, '18/07/04',1);
insert into RENT_TBL_06 values(10003, 100, 2400, '18/08/02',1);
insert into RENT_TBL_06 values(10004, 100, 2400, '18/08/12',1);
insert into RENT_TBL_06 values(10005, 102, 2500, '18/08/13',1);
insert into RENT_TBL_06 values(10006, 103, 3000, '18/08/13',1);
insert into RENT_TBL_06 values(10007, 103, 3000, '18/08/20',0);
insert into RENT_TBL_06 values(10008, 100, 2400, '18/09/03',1);
insert into RENT_TBL_06 values(10009, 100, 2400, '18/09/08',1);
insert into RENT_TBL_06 values(10010, 100, 2400, '18/09/14',0);
insert into RENT_TBL_06 values(10011, 102, 2500, '18/09/14',0);

CREATE SEQUENCE book_no_seq
  START WITH 1
  INCREMENT BY 1;

commit;




create user com identified by com01;
grant resource, connect, create view to com;























  

   