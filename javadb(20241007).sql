
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

desc tbl_member;

insert into tbl_member (member_id, password, member_name)
values('guest', '5555555', '김손님');

commit;
select * from tbl_member;

update tbl_member
set phone = '010-1111-2222'
where member_id = 'user01';

commit;

select count(*)
from tbl_member
where member_id = :id
and password = :password;

select member_name
from tbl_member
where member_id = :id
and password = :password;


