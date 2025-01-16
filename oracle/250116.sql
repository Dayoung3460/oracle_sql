create table tbl_reply (
  rno number(10,0),
  bno number(10,0) not null,
  reply varchar2(1000) not null,
  replyer varchar2(50) not null,
  replyDate date default sysdate,
  updateDate date default sysdate
);

create sequence seq_board;
create sequence seq_reply;

alter table tbl_reply add constraint pk_reply primary key (rno);

alter table tbl_reply  add constraint fk_reply_board
foreign key (bno)  references  tbl_board (bno);

insert into tbl_reply (rno, bno, reply, replyer) values ( seq_reply.nextval, 3014669, '댓글1', '홍길동1' );
insert into tbl_reply (rno, bno, reply, replyer) values ( seq_reply.nextval, 3014669, '댓글추가', '홍길동2' );
insert into tbl_reply (rno, bno, reply, replyer) values ( seq_reply.nextval, 3014669, '댓글추가', '홍길동3' );
insert into tbl_reply (rno, bno, reply, replyer) values ( seq_reply.nextval, 3014670, '댓글4', '홍길동4' );
insert into tbl_reply (rno, bno, reply, replyer) values ( seq_reply.nextval, 3014671, '댓글5', '홍길동5' );
insert into tbl_reply (rno, bno, reply, replyer) values ( seq_reply.nextval, 3014672, '댓글6', '홍길동6' );
insert into tbl_reply (rno, bno, reply, replyer) values ( seq_reply.nextval, 3014672, '댓글7', '홍길동7' );
insert into tbl_reply (rno, bno, reply, replyer) values ( seq_reply.nextval, 3014673, '댓글8', '홍길동8' );
insert into tbl_reply (rno, bno, reply, replyer) values ( seq_reply.nextval, 3014673, '댓글9', '홍길동9' );
insert into tbl_reply (rno, bno, reply, replyer) values ( seq_reply.nextval, 3014674, '댓글0', '홍길동10' );

select * from tbl_reply;
select * from tbl_board;

select count(*) 
        from tbl_reply
        where bno = 3014669;

UPDATE tbl_reply
        SET
            reply = 3014669,
            replyer = "test"
        WHERE rno = 1;

commit;