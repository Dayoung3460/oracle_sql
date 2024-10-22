create table tbl_board (
    board_no number primary key,
    title varchar2(100) not null,
    content varchar2(1000) not null,
    writer varchar2(50) not null,
    view_cnt number default 0,
    write_date date default sysdate,
    update_date date default sysdate
);

alter table tbl_board
add image varchar2(100);

create table test (
    test_no number primary key
);

select count(*) 
from test;

desc tbl_board;

create sequence board_seq;

select * from tbl_member;

insert into tbl_board(board_no, title, content, writer)
values(board_seq.nextval, 'board test', 'content test', 'user2');

insert into tbl_board(board_no, title, content, writer)
values(board_seq.nextval, 'board test2', 'content test2', 'user3');
insert into tbl_board(board_no, title, content, writer)
values(board_seq.nextval, 'board test3', 'content test3', 'user4');
insert into tbl_board(board_no, title, content, writer)
values(board_seq.nextval, 'board test4', 'content test4', 'user5');
insert into tbl_board(board_no, title, content, writer)
values(board_seq.nextval, 'board test5', 'content test5', 'user6');
insert into tbl_board(board_no, title, content, writer)
values(board_seq.nextval, 'null', 'null', 'user116');

commit;
update tbl_board set title = 'jsp' 
where board_no = 2;

select b.*, m.member_name
from tbl_board b join tbl_member m
on b.writer = m.member_id
order by board_no;

delete from tbl_board
where board_no = 2;

-- select해온 모든 열을 인서트
insert into tbl_board(board_no, title, content, writer)
select board_seq.nextval, title, content, writer
from tbl_board;

select * from tbl_board
where board_no = 26;

-- 페이징 
select b.*, (select count(*) from tbl_board totalCount)
from (select rownum rn, a.*
    from (select *
        from tbl_board
        order by board_no) a) b
where b.rn > (:page - 1) * 5 and b.rn <= (:page * 5);

select count(*) 
from tbl_board;

select * from tbl_member;

select * from tbl_board;

insert into tbl_member(member_id, password, member_name, phone, responsibility)
values('user7', 'test1234', 'test', '010-1111-1111', 'Admin');

commit;

create table tbl_reply (
    reply_no number,
    reply varchar2(1000) not null,
    replyer varchar2(30) not null,
    board_no number not null,
    reply_date date default sysdate
);

create sequence reply_seq;

alter table tbl_reply add constraint pk_reply primary key (reply_no);

insert into tbl_reply(reply_no, reply, replyer, board_no)
values(reply_seq.nextval, 'reply11111', 'user2', 596); 
insert into tbl_reply(reply_no, reply, replyer, board_no)
values(reply_seq.nextval, 'reply222222', 'user2', 596); 
insert into tbl_reply(reply_no, reply, replyer, board_no)
values(reply_seq.nextval, 'reply33333', 'user2', 596); 
insert into tbl_reply(reply_no, reply, replyer, board_no)
values(reply_seq.nextval, 'reply33333', 'user2', 596); 
insert into tbl_reply(reply_no, reply, replyer, board_no)
values(reply_seq.nextval, 'reply2', 'user2', 595); 
insert into tbl_reply(reply_no, reply, replyer, board_no)
values(reply_seq.nextval, 'reply3', 'user2', 592); 

select * 
from tbl_reply;

select *
from tbl_reply
where board_no = 596;

select reply_no,
		reply,
		replyer,
		board_no,
		reply_date
		from tbl_reply
		where board_no = 596
		order by reply_no desc;
        
commit;

