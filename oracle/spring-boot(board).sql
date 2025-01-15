create sequence seq_board;

create table tbl_board (
  bno number(10,0),
  title varchar2(200) not null,
  content varchar2(2000) not null,
  writer varchar2(50) not null,
  regdate date default sysdate,
  updatedate date default sysdate
);

alter table tbl_board add constraint pk_board primary key (bno);
commit;

insert into tbl_board (bno, title, content, writer)
values(seq_board.nextval, '피건쓰', '잠온다', '김다영');

insert into tbl_board (bno, title, content, writer)
values(seq_board.nextval, '학원', '학원 수업', '김다용');
insert into tbl_board (bno, title, content, writer)
values(seq_board.nextval, '커피', '카페라떼', '김나영');
insert into tbl_board (bno, title, content, writer)
values(seq_board.nextval, '컴', '컴퓨터', '김가영');
insert into tbl_board (bno, title, content, writer)
values(seq_board.nextval, 'unique', '스마트폰 충전중', '김보영');
insert into tbl_board (bno, title, content, writer)
values(seq_board.nextval, '프로젝트', 'last project', 'kim');
-- 2025 01 15

insert into tbl_board (bno, title, content, writer) select  seq_board.nextval, title, content, writer from tbl_board;
select count(*) from tbl_board;

select * from tbl_board order by bno + 1; -- 연산을 해서 굉장히 느림,, 풀스캔 -> 오더바이
select * from tbl_board where bno > 0; -- index태워서 쿼리 실행됨 range scan -> by index rowid
select * from tbl_board order by bno desc;

select * from(
    select rownum rn, bno, title, writer
    from (
        select bno, title, writer
        from tbl_board 
        order by title desc
    )
    where rownum <= 20
) where rn > 10;

select * from tbl_board;

select BNO, TITLE, WRITER from (
    select /*+ index_desc (tbl_board pk_board) */ 
        rownum rn, bno, title, writer
    from tbl_board
    where rownum <= 20
)where rn > 10;

SELECT BNO, TITLE, WRITER FROM (
    select /*+index_desc(TBL_BOARD PK_BOARD)*/ ROWNUM RN, BNO, TITLE, WRITER
    from tbl_board WHERE ROWNUM <=20
) WHERE RN > 10;

-- 계획설명
-- order by bno, where bno > 0
-- 같은 결과임
-- bno pk, index 라 알아서 bno 오름차순으로 정렬해줌

select /*+index_desc(TBL_BOARD PK_BOARD)*/ ROWNUM RN, BNO, TITLE, WRITER, REGDATE
                from tbl_board;
                
-- delete from tbl_board where bno > 500;

truncate table tbl_board;