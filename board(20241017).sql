create table tbl_board (
    board_no number primary key,
    title varchar2(100) not null,
    content varchar2(1000) not null,
    writer varchar2(50) not null,
    view_cnt number default 0,
    write_date date default sysdate,
    update_date date default sysdate
);

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

commit;