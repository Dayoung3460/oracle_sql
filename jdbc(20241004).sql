-- session: 접속 시작부터 끝
-- transaction: 커밋, 롤백같은 일의 시작부터 끝
-- 오라클 디벨로퍼12 이상부터 가능
--alter session set "_oracle_script" = true;

create user java identified by 1234;
grant connect, resource, dba to java;
grant unlimited tablespace to java;

-- db 새로 만들기. db이름: javadb, 사용자이름: java, 비번: 1234 / localhost / 1521 / xe 

