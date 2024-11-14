-- dcl
-- grant, revoke(권한 뺏기)

-- system 권한
select *
from system_privilege_map;

-- user 추가 유저네임: skj, 비번: test
create user skj
identified by test;

-- 권한 부여
-- skj, kdy, ... 여러명 가능
grant create session
to skj;

grant create session, create table, create view
to skj;

-- 권한 뺏기
revoke create table, create view
from skj;

-- 유저 비번 변경
alter user skj
identified by lion;

-- 권한 만들기
create role manager;

-- 매니저 롤에 권한주기
grant create session, create table, create view
to manager;

-- skj한테 해당 롤 주기
grant manager
to skj;

-- 롤 드랍
drop role manager;

----------------- sql*plus에서 테스트----------------------
--conn
--Enter user-name: skj/test
--Enter user-name: skj/lion

--객체 권한 주기
-- hr계정(스키마)의 employees 테이블 조회 권한을 skj한테 주기
grant select
on hr.employees
to skj;

----------------- sql*plus에서 테스트----------------------
-- skj 유저로 연결된 상태에서
-- select * from hr.employees;

-- 권한 뺏기
revoke select
on hr.employees
from skj;

-- user에게 부여된 객체 권한 조회
select *
from user_tab_privs_recd;

-- user에게 부여된 system 권한 조회
select *
from user_sys_privs;











