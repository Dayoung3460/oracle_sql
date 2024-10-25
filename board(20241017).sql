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

alter table tbl_event
add event_no number;

create table test (
    test_no number primary key
);

select count(*) 
from test;

desc tbl_board;

create sequence board_seq;

create sequence event_seq;

select * from tbl_member;

insert into tbl_board(board_no, title, content, writer)
values(board_seq.nextval, 'board test', 'content test', 'user2');

insert into tbl_board(board_no, title, content, writer)
values(board_seq.nextval, 'board test2', 'content test2', 'user9');
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

update tbl_reply
set reply_date = sysdate, 
    reply = 'comment'
where reply_no = 11;
        
commit;

select 

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
values('user9', 'test1234', 'test', '010-1111-1111', 'Admin');

commit;

create table tbl_reply (
    reply_no number,
    reply varchar2(1000) not null,
    replyer varchar2(30) not null,
    board_no number not null,
    reply_date date default sysdate
);

create sequence reply_seq;

-- pk_reply 기본 키 제약 조건 이름. 인덱스 이름이됨
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

select * from tbl_member;

update tbl_reply
		set
		reply_date = sysdate,
		reply = 1111111
		where reply_no = 11;
        
-- /*+ */ 안에 개발자가 임의로 해당 쿼리를 실행하는 방법 정의. 오류나도 쿼리가 오류가 나진않음
-- index값인 pk_reply을 기준으로 가져오겠다
-- order by 보다 훨씬 빠름
-- index도 가능
-- 댓글 페이지네이션
select a.*
from (select /*+ index_desc (r pk_reply) */ rownum rn, r.* 
      from tbl_reply r
      where board_no = :boardNo) a
where a.rn > (:page - 1) * 5
and   a.rn <= (:page * 5);

-- count()와 같은 집계 함수는 보통 GROUP BY 와 함께 사용
-- GROUP BY 없이 다른 열들을 선택하려고 할 때 오류가 발생
-- Oracle에서는 count(r.*)와 같은 형식은 허용되지 않음
-- t.*는 tbl_board 테이블의 모든 열을 의미하지만, GROUP BY 절에 모든 열을 명시하지 않으면 오류 발생
select t.board_no, count(*) as reply_count
from tbl_board t join tbl_reply r 
on t.board_no = r.board_no
group by t.board_no;

select writer, count(1)
from tbl_board
group by writer;

select * from tbl_member;

select writer, member_name, count(1)
from tbl_board b
join tbl_member m
on b.writer = m.member_id
group by writer, member_name;

UPDATE tbl_member
SET member_name = ''
WHERE member_id = 'user7';

update tbl_event
set event_no = event_seq.nextval
where event_no is null;

update tbl_event
set start_date = '2024-10-01', end_date = '2024-10-03'
where event_no = 6;


select * from tbl_event;

create table tbl_event (
    title varchar2(1000) not null,
    start_date varchar2(20) not null,
    end_date varchar2(20)
);



insert into tbl_event values('meeing1', '2024-10-05', null);
insert into tbl_event values('meeing2', '2024-10-06', '2024-10-07');
insert into tbl_event values('title', 'meeing3', '2024-10-07', 89);
insert into tbl_event values('meeing4', '2024-10-06', '2024-10-17T21:00:00');

delete from tbl_event
where rownum between 1 and 14;

select * from tbl_event;

delete tbl_event
where event_no is null;

commit;