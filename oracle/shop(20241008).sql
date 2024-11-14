--1. 회원 테이블
--    회원 번호, 회원 이름, 생년월일, 휴대폰 번호, 아이디, 비밀번호, 이메일, 등급, 가입 경로, auth(user / admin), 가입 날짜
--
--2. 상품 테이블(user: read-only)
--    상품 이름, 가격, 할인률, 갯수, 콤보
--
--3. 예약 테이블
--    회원 이름, 휴대폰 번호, 상품 이름, 갯수, 배송/픽업 선택, 배송/픽업 시간,
--
--4. 회원 등급 테이블
--    white, silver, gold

create table grade (
    name varchar2(50) primary key,
    discount_perc number(3, 1) not null
);

ALTER TABLE grade 
MODIFY discount_perc NUMBER(5, 2);

ALTER TABLE grade 
MODIFY name varchar2(50);

select * from grade;

insert into grade(name, discount_perc)
values('WHITE', 0);
insert into grade(name, discount_perc)
values('SILVER', 5);
insert into grade(name, discount_perc)
values('GOLD', 10);



SELECT 
    booking_no,
    member_name,
    phone,
    product_name,
    quantity,
    is_delivery,
    TO_CHAR(del_pick_time, 'YYYY-MM-DD HH24:MI:SS') AS del_pick_time
FROM booking;

drop table booking;

ALTER TABLE order_details
RENAME COLUMN product_name TO product_no;

ALTER TABLE order_details
modify del_pick_time date;

create table order_details (
    order_no number primary key,
    member_name varchar2(50) not null,
    phone varchar2(50) not null,
    product_name varchar2(50) not null,
    quantity number not null,
    is_delivery varchar2(10) not null, -- true, false
    del_pick_time date,
    order_time date default sysdate
);

insert into booking (booking_no, member_name, phone, product_name, quantity, is_delivery, del_pick_time)
values(seq_product_no.NEXTVAL, 
        'kim', 
        '010-2222-2222', 
        'pizza', 
        1, 
        1, 
        TO_DATE('2024-10-08 14:30:00', 'YYYY-MM-DD HH24:MI:SS')
);

create sequence seq_booking_no
    increment by 1
    start with 1
    minvalue 1
    maxvalue 9999
    nocycle
    noorder
    nocache;


    
--🍕🍔🌭🥗🍜
--🍟🍺
create table product (
    product_no number primary key,
    name varchar2(50) not null,
    price number not null,
    discount number default 0,
    quantity number default 0,
    combo number(1) default 0
);

select * from order_details;

ALTER TABLE order_details MODIFY order_time DEFAULT TO_DATE(SYSDATE, 'YYYY-MM-DD HH24:MI:SS');
commit;

ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY-MM-DD HH24:MI:SS';

select * from product;
create sequence seq_product_no
    increment by 1
    start with 1
    minvalue 1
    maxvalue 9999
    nocycle
    noorder
    nocache;

insert into product (product_no, name, price)
values(seq_product_no.NEXTVAL, 'pizza', 5000);
   
drop table member;
   
create table member (
    member_no number primary key,
    name varchar2(50) not null,
    birth date not null,
    phone varchar2(20) not null,
    id varchar2(50) not null,
    password varchar2(30) not null,
    email varchar2(50) not null,
    grade varchar2(10) default 'WHITE' not null,
    signup_source varchar2(100),
    auth varchar(10) default 'USER',
    signup_date date default sysdate
);

CREATE OR REPLACE TRIGGER trg_product_no
    BEFORE INSERT ON product
    FOR EACH ROW
    WHEN (NEW.product_no IS NULL) -- Only generate if member_no is not provided
BEGIN
    :NEW.product_no := seq_product_no.NEXTVAL;
END;
/
commit;

ALTER TABLE MEMBER
MODIFY id primary key;

CREATE OR REPLACE TRIGGER trg_member_no
BEFORE INSERT ON member
FOR EACH ROW
WHEN (NEW.member_no IS NULL) -- Only generate if member_no is not provided
BEGIN
  :NEW.member_no := seq_member_no.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER trg_order_no
BEFORE INSERT ON order_details
FOR EACH ROW
WHEN (NEW.order_no IS NULL) -- Only generate if member_no is not provided
BEGIN
  :NEW.order_no := seq_order_no.NEXTVAL;
END;
/
commit;
ALTER TABLE ORDER_DETAILS
    MODIFY DEL_PICK_TIME datatype NULL;

create sequence seq_order_no 
    increment by 1
    start with 1
    minvalue 1
    maxvalue 9999
    nocycle
    noorder
    nocache;

--ALTER TABLE MEMBER DROP COLUMN MEMBER_NO;

ALTER TABLE product DROP COLUMN discount;
ALTER TABLE product DROP COLUMN combo;

--ALTER TABLE MEMBER
--ADD MEMBER_NO NUMBER DEFAULT seq_member_no.NEXTVAL;
--
--ALTER TABLE MEMBER
--ADD MEMBER_NO NUMBER DEFAULT seq_member_no.NEXTVAL;

ALTER TABLE member
DROP PRIMARY KEY;

select * from member;


--
--ALTER TABLE MEMBER
--MODIFY MEMBER_NO NUMBER DEFAULT seq_member_no.NEXTVAL primary key;

create sequence seq_member_no 
    increment by 1
    start with 1
    minvalue 1
    maxvalue 9999
    nocycle
    noorder
    nocache; 
    
create sequence seq_order_no 
    increment by 1
    start with 1
    minvalue 1
    maxvalue 9999
    nocycle
    noorder
    nocache; 
    
select * from member;    
    
insert into member (member_no, name, birth, phone, id, password, auth, email)
values(seq_member_no.NEXTVAL, 'dayoung', '1993-03-04', '010-0000-0000', 'da1234', 'test1234', 'ADMIN', 'ekdud3460@naver.com');
    
select * from member;
select * from product;
select * from order_details;


delete member where member_no = 2;

ALTER TABLE MEMBER
    MODIFY id primary key;

CREATE OR REPLACE TRIGGER trg_member_no
    BEFORE INSERT ON member
    FOR EACH ROW
    WHEN (NEW.member_no IS NULL) -- Only generate if member_no is not provided
BEGIN
    :NEW.member_no := seq_member_no.NEXTVAL;
END;
/

ALTER TABLE ORDER_DETAILS
    MODIFY DEL_PICK_TIME date NULL;    
    
    
    
select * from MEMBER;
    
    
select * from member;
select * from product;
select * from order_details;
select * from grade;

drop table grade;

select member.member_name, member.phone
from member, ORDER_DETAILS
where MEMBER_NAME = (select member_name from order_details);


delete member where member_no = 2;

ALTER TABLE MEMBER
    MODIFY id primary key;

select member_no name, birth,phone,id,email,grade,signup_source,auth,signup_date,order_no
from member
where order_no is not null;

ALTER TABLE member
    MODIFY total_payment_amount DEFAULT 0;

alter table MEMBER
add total_payment_amount number;

alter table ORDER_DETAILS
    add order_price number;

alter table ORDER_DETAILS
    add product_name varchar2(100);

alter table ORDER_DETAILS
add member_id varchar2(100);

ALTER TABLE ORDER_DETAILS
    DROP COLUMN member_no;


CREATE OR REPLACE TRIGGER trg_member_no
    BEFORE INSERT ON member
    FOR EACH ROW
    WHEN (NEW.member_no IS NULL) -- Only generate if member_no is not provided
BEGIN
    :NEW.member_no := seq_member_no.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER trg_grade
    BEFORE INSERT ON member
    FOR EACH ROW
    WHEN (NEW.member_no IS NULL) -- Only generate if member_no is not provided
BEGIN
    :NEW.member_no := seq_member_no.NEXTVAL;
END;
/

CREATE OR REPLACE TRIGGER trg_product_no
    BEFORE INSERT ON product
    FOR EACH ROW
    WHEN (NEW.product_no IS NULL) -- Only generate if member_no is not provided
BEGIN
    :NEW.product_no := seq_product_no.NEXTVAL;
END;
/

ALTER TABLE ORDER_DETAILS
    MODIFY DEL_PICK_TIME date NULL;

ALTER TABLE member
    RENAME COLUMN name TO member_name;

CREATE OR REPLACE TRIGGER update_member_grade
    BEFORE UPDATE OF total_payment_amount ON member
    FOR EACH ROW
BEGIN
    IF :NEW.total_payment_amount > 10000 THEN
        :NEW.grade := 'GOLD';
    ELSIF :NEW.total_payment_amount > 5000 THEN
        :NEW.grade := 'SILVER';
    ELSE
        :NEW.grade := 'WHITE';
    END IF;
END;
/    
    
    
    
    
    
    
    