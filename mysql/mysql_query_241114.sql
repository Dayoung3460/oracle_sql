show databases;
use sakila;
show tables;
select * from actor;

-- %: 특정 ip 상관없이 접속가능.  
-- 제한 둘려면 % 대신에 ip 입력
-- MySQL server랑 버전이 안맞으면 에러나는 것 같음
-- 버전 맞추기 
CREATE USER 'dev01'@'%' IDENTIFIED WITH MYSQL_NATIVE_PASSWORD BY '1234';

create database dev; 
-- default db를 dev로 하겠다
use dev;
create table customers (
	id int auto_increment primary key,
    name varchar(45) not null,
    email varchar(45),
    phone varchar(45) not null,
    address varchar(45)
);

INSERT INTO customers (id, name, email, phone, address)
VALUES ( 1, 'John Doe', 'john@mail.com', '010-0000-000', '');

commit;

select * from customers;

grant all privileges on dev.* to 'dev01'@'%' with grant option;

-- privilege 즉각 반영
flush privileges;

