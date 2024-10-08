-- javadb에서 실행하기

create table boards(bno number primary key,
                    btitle varchar2(100) not null,
                    bcontent varchar2(1000) not null,
                    bwriter varchar2(50) not null,
                    bdate date default sysdate);
                    
create sequence seq_bno nocache;                    
select * from boards;
-- 오라클 jdbc 드라이버
--C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib\ojdbc6.jar
-- 이클립스 루트폴더 바로 밑에 lib폴더 만들고 그 안에 복붙
-- ojdbc6.jar 오른쪽 마우스 클릭 > build path > 첫번째꺼 클릭
-- Referenced Libraries 파일 생기고 안에 자르파일에 있던 것들 주루룩 들어있음

create table book(title varchar2(50) not null,
                  writer varchar2(50) not null,
                  price number not null,
                  bnum varchar2(50) not null);

-- 오라클 디비 버전 확인
SELECT * FROM v$version;
SELECT banner FROM v$version WHERE banner LIKE 'Oracle%';

select * from tbl_member;

create table tbl_member (
    member_id varchar2(30) primary key ,
    password varchar2(30) not null,
    member_name varchar2(50) not null,
    phone varchar2(20),
    responsibility varchar2(10) default 'User', -- User, Admin
    creation_date date default sysdate
);

insert into tbl_member (member_id, password, member_name)
values('user01', '123456789', '홍길동');


insert into tbl_member (member_id, password, member_name)
values('guest', '5555555', '김손님');

insert into tbl_member (member_id, password, member_name, responsibility)
values('admin', '9999', '관리자', 'Admin');

commit;

-- COUNT(*) = COUNT(1)
select count(*) from tbl_member
      where member_id = :id
      and password = :password;


select * from book;
-- where title like '%java%';