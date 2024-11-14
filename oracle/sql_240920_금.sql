--VARCHAR is reserved by Oracle to support distinction between NULL and empty string in future
--VARCHAR2 does not distinguish between a NULL and empty string, and never will.
--If you rely on empty string and NULL being the same thing, you should use VARCHAR2
--걍 varchar2 써

create table sample
(sam1 number(4),
 sam2 varchar2(10),
 sam3 varchar2(20));

create table hire_dates
(id number(8),
 hire_date date default sysdate);
 
select * 
from sample;

select * from 
hire_dates;

insert into hire_dates
values(45, null);

-- hire_date 데이터는 안 넣었지만 디폴트값을 정해놨기 때문에 현재 날짜로 데이터 드가있음
insert into hire_dates(id)
values(35);

create table dept
(deptno number(2),
 dname varchar2(14),
 loc varchar(13),
 create_date date default sysdate);
 
select *
from dept;

select table_name 
from user_tables;

-- 생성한 table 칼럼은 서브쿼리 셀렉트에서 가져온 칼럼
create table dept80
    as
        select employee_id,
               last_name,
               salary * 12 annsal,
               hire_date
        from employees
        where department_id = 80;
        
-- department_id가 0인 부서는 없으니까 테이블만 만들어지고 데이터는 안들어감
-- 어떤 테이블이랑 같은 테이블 만들고 싶은데 데이터는 다 빼고싶을 때 이런 방법 쓰기도 함
create table dept83
    as
        select employee_id,
               last_name,
               salary * 12 annsal,
               hire_date
        from employees
        where department_id = 0;

-- 테이블 컬럼명을 서브쿼리 칼럼명이랑 다르게 하고 싶으면 직접 정해줘
-- annsal는 무시됨
create table dept81(empno, 
                    name, 
                    sal, 
                    cdate)
    as
        select employee_id,
               last_name,
               salary * 12 annsal,
               hire_date
        from employees
        where department_id = 80;
        
select * 
from dept81;

-- error
-- must name this expression with a column alias
-- 표현식은 무조건 컬럼 alias 정해줘야함
create table dept81
as
        select employee_id,
               last_name,
               salary * 12,
               hire_date
        from employees
        where department_id = 80;

-- alter option: 
--add 열추가, 
--modify 열변경: 컬럼 이름은 변경 불가, 숫자나 문자 열 길이를 기존 데이터보다 작게 설정하면 error
--drop 열드랍: 컬럼 하나씩 드랍 가능. alter는 ddl(data definition language)문이기 때문에 드랍할 때 조심. 바로 커밋되서 롤백 안됨

-- job_id 라는 컬럼 추가
-- 데이터는 다 널로 들어가 있음
alter table dept80
add (job_id varchar2(9));

-- 디폴트값 다 10000으로 넣고 칼럼 추가
-- 어떤 칼럼에 데이터를 다 넣어야한다 -> 일일이 다 넣을거? 컬럼 새로 추가하고 데이터 한번에 추가하면됨
alter table dept80
add (sal number(5) default 10000);

alter table dept80
modify (last_name varchar2(30));

alter table dept80
modify (last_name varchar2(10));

-- cannot decrease column length because some value is too big
alter table dept80
modify (last_name varchar2(4));

-- number(10)으로는 바뀌는데 값이 9999로는 안바뀜
--기본값(default) 변경은 새로운 행을 삽입할 때만 적용되며, 
--기존 데이터에는 영향을 주지 않습니다. 
--즉, 테이블에 이미 있는 행들의 sal 값은 기본값을 변경해도 자동으로 갱신되지 않습니다. 
--alter table 명령어로 기본값을 수정하더라도, 그 변경은 앞으로 새로 삽입되는 데이터에만 적용됩니다.
--기존 데이터의 sal 값을 모두 9999로 업데이트하려면, 직접 UPDATE 문을 사용해야 합니다.
alter table dept80
modify (sal number(10) default 9999);

alter table dept80
drop (sal);

-- alter option중에 set unused 가 있는데 drop이랑 같다고 보면됨
-- 컬럼은 있지만 blind 처리 됐다고 보면됨 unused 해놓고
-- 진짜 삭제해야할 때 drop unused colnums 해주면 됨
-- set unused 한걸 다시 롤백할순 없음

alter table dept80
set unused (last_name);

alter table dept80
drop unused columns;

-- ddl문 drop
-- table 삭제
drop table dept80;

-- 휴지통(user_recyclebin)에 dept80 드가있음
select *
from user_recyclebin;

select *
from recyclebin;

-- drop문 purge 옵션: 완전 삭제. 휴지통으로 안감. 실무에선 사용 지양
drop table dept81 purge;

-- drop한 테이블 복구
-- ddl이라 롤백은 불가. flashback으로 가능
flashback table dept80 to before drop;

-- 휴지통 비우기
purge recyclebin;

-- 객체: table, view, synonym, index, comment
-- table drop하면
-- table을 참고하고 있는 view나 synonym은 살아는 있지만 데이터는 볼 수 없음
-- table의 index는 table이랑 같이 날라감

rename sample to sam;

-- ddl이라 롤백 불가
-- drop: 객체 테이블 삭제. 
-- truncate: data만 삭제. 테이블은 남아있음
truncate table {table_name};

-- 사용자 테이블들 주석 조회
select * 
from user_tab_comments;

select *
from sam;

select *
from dept80;

-- 제약 조건 constraint condition
-- 프로그램 단에서 제약 조건을 걸 수도 있으니 디비에서 중복으로 할 필욘ㄴㄴ

-- 에러
-- integrity constraint(무결성 제약조건) (HR.EMP_DEPT_FK) violated - child record found
-- departments가 부모 테이블. employees가 자식
-- 부모테이블의 FK가 department_id이기 때문에 employees에 영향을 줌
-- 데이터의 일관성 유지하기 위해
delete departments
where department_id = 60;

-- not null은 칼럼단에서 지정해줘야함
-- not null은 프로그램단에서도 조건 걸 수 있기 때문에 디비에서 설정 안해줘도ㅇㅇ
create table emp_test (
    empid number(5),
    empname varchar2(10) not null,
-- 이렇게 설정해주는게 정석. 제약조건 이름(emp_test_empname_nn)을 안 만들어주면 sys_cnnnnn 이런식으로 자동으로 설정됨
--  empname varchar2(10) constraint emp_test_empname_nn not null,
    duty varchar2(9),
    sal number(7, 2),
    bonus number(7, 2),
    mgr number(5),
    hire_date date,
    deptid number(2));

insert into emp_test (empid,
                      empname)
values(111, 
       'SKJ');


insert into emp_test (empid,
                      empname)
values(222, 
       null);
       
-- not null, pk 제외하고는 모두 널값 들어갈 수 있음ㅇㅇ
-- unique, fk, check 제약조건엔 널값 가능

-- unique는 열 또는 열 집합의 모든 값이 고유
-- 복합키로 지정할 땐 테이블단에 적용
create table aaa(
    aa number(3),
    bb number(3),
    unique(aa, bb));
    
-- 복합이 아니면 컬럼단에 적용해주면 됨
--create table aaa(
--    aa number(3) unique,
--    bb number(3));
    
insert into aaa
values(1, 1);
insert into aaa
values(1, 2);
-- (1, null)은 열 2개 안드가있음. 하나만.
-- 복합 유니크로 걸었기 때문
-- (null, null)은 열 2개에 드가있음
-- 걍 데이터가 다 널인 열은 상관없음
insert into aaa
values(1, null);
insert into aaa
values(1, null);
insert into aaa
values(null, null);
insert into aaa
values(null, null);

select *
from aaa;

-- pk: 유일성, 최소성
-- 복합키로 설정 가능: 테이블단에서 설정
-- 유일성은 만족하지만 최소성을 만족하지 못하면 슈퍼키
-- 둘다 만족하면 후보키
-- 후보키에는 기본키, 대체키가 있음 모두 유일성, 최소성 만족
-- 사원번호, 주민번호는 모두 값이 유니크함 그래서 이 두개를 복합 기본키로 잡으면 최소성이 만족안됨. 
-- 둘 다 유니크한 값이기 때문에 하나만 기본키로 잡아주면됨
-- 회원id, 상품id 가 있을 때 한 회원이 상품 여러개 살 수 있음
-- ex) (1, 1), (1, 2)
-- 복합키로 설정가능.
-- 이때 회원id는 기본키, 상품id는 대체키

drop table dept_test;

create table dept_test (
    deptid number(2) primary key,
    dname varchar2(14) unique,
    loc varchar2(13));
    
-- 0924
    
insert into dept_test(deptid,
                      dname)
values(1,
       'YD01');
       
insert into dept_test(deptid,
                      dname)
values(null,
       'YD02');


insert into dept_test(deptid,
                      dname)
values(2,
       'YD01');
       
insert into dept_test(deptid,
                      dname)
values(2,
       'null');
       
-- fk의 데이터는 부모테이블의 pk 값만 들어갈 수 있음
-- fk키에 널값 가능
       
create table emp1(
    empid number(2),
    deptid number(2) references dept_test(deptid));
       
insert into emp1
values(11, 1);

insert into emp1
values(22, null);
       
insert into emp1
values(33, 2);

-- err. deptid의 pk에 3이 없기 때문에 insert안됨
-- integrity constraint (HR.SYS_C007016) violated - parent key not found
insert into emp1
values(44, 3);

select * 
from emp1;

select * 
from dept_test;

drop table emp1;

-- 부모 table의 pk가 삭제됐을 때 자식 테이블에서 해당 pk를 참조하고 있는 모든 행이 다 삭제됨
-- on delete set null: 위의 상황에서 행이 삭제되지 않고 부모 테이블 pk를 참조하고 있는 fk가 null로 들어감
create table emp1(
    empid number(2),
    deptid number(2) references dept_test(deptid) on delete set null);

insert into emp1
values(11, 1);

delete dept_test
where deptid = 1;
-- select * from emp1; 했을 때 (11, null)로 들어가있음
-- pk 1을 참조하고 있던 자식 테이블의 fk가 1인 데이터를 널로 바꿈

-- 무결성 제약 조건
--1. 객체 무결성: 오류뜸. 기본키는 널안됨. 유니크해야됨
--2. 참조 무결성: 오류뜸. fk는 부모pk여야함
--3. 도메인 무결성: 오류가 안뜸. 학과라는 칼럼이 있음 "컴공", "전자"라는 데이터가 드갈 수 있는데 "대구시" 이런값은 드가면 안되는데 드감 

-- constraint condition add

select *
from emp_test;

-- 키 추가는 add option 사용
--만약 emp_test 테이블에 이미 기본 키가 설정되어 있다면 error
alter table emp_test
add primary key(empid);

alter table emp_test
add foreign key(mgr) references emp_test(empid);

delete emp_test
where empid = 111;

-- not null 추가는 modify 옵션 추가
alter table emp_test
modify (duty not null);

desc emp_test;

-- 제약조건 삭제. drop. 
-- pk는 어차피 테이블에 하나라 칼럼명 안적어줘도됨

-- 제약조건들 조회. 
select *
from user_constraints
where table_name = 'EMP_TEST';

-- 제약조건 걸려있는 컬럼이름도 조회할 때
select *
from user_cons_columns
where table_name = 'EMP_TEST';

-- cascade랑 같이 drop하면 dept_test 참조하고 있는 테이블의 데이터까지 날림
alter table dept_test
drop primary key cascade;

select * from emp_test;

-- view
-- view 이름은 뒤에 vu를 붙이는게 컨벤션
-- 뷰는 실제 데이터를 가지고 있는게 아니고 테이블의 창문 역할을 할뿐
-- 뷰를 셀렉트하면 뷰 딕셔너리를 뒤져서 해당 뷰가 접근하고 있는 테이블에 접근해서 데이터를 보여줌
create view empvu80
    as select employee_id, 
              last_name,
              salary
       from employees
       where department_id = 80;
       
-- 뷰 수정
-- data가 아니라서 직접 수정할 수 없음. 덮어써야함
create or replace view salvu50
    (id_number,
     name,
     ann_salary)
as select employee_id,
          last_name,
          salary * 12
   from employees
   where department_id = 50;
       
select *
from user_objects;

drop view empvu80;

select *
from empvu80;

-- rownum은 실제 테이블의 데이터가 아님
select rownum, last_name
from employees;

-- sequence
-- rollback 발생하는경우 시퀀스 사이에 갭이 생길 수 있음
create sequence dept_deptid_seq
                increment by 10
                start with 120
                maxvalue 9999
                nocycle
                nocache;
                
insert into departments(department_id,
                        department_name,
                        location_id)
values(dept_deptid_seq.nextval,
        'Support', 2500);
        
drop sequence dept_deptid_seq;
        
select *
from departments;

-- synonym
-- 같은 테이블이지만 이름만 다를뿐
-- departments 삭제하면 d_sum은 남아있긴하지만 사용할 순 없음
-- 수정불가
-- public sysnonym도 있음. 공개적으로 사용하는 synonym
create synonym d_sum
for departments;

select * 
from d_sum;

drop synonym d_sum;

-------------------------------셤----------------------------------
-- 1.
select employee_id,
       last_name,
       salary,
       department_id
from employees
where salary >= 7000
and salary <= 12000
and last_name like 'H%';

-- 2.
select employee_id,
       last_name,
       job_id,
       salary,
       department_id
from employees
where department_id in (50, 60)
and salary > 5000;

-- 3.
select last_name,
       salary,
       (case when salary <= 5000 then salary * 1.2
             when salary <= 10000 then salary * 1.15
             when salary <= 15000 then salary * 1.1
                                  else salary
        end) increased_salary
from employees
where employee_id = &employee_id;

-- 4.
select department_id,
       department_name,
       city
from departments d join locations l 
    on d.location_id = l.location_id;

select department_id,
       department_name,
       city
from departments d natural join locations l;

select department_id,
       department_name,
       city
from departments d, locations l
where d.location_id = l.location_id;

-- 5.
select employee_id,
       last_name,
       job_id
from employees
where department_id = (select department_id
                       from departments
                       where upper(department_name) = 'IT');
                       
-- 6.
alter session set
nls_date_language = american;

select employee_id,
       first_name,
       last_name,
       email,
       phone_number,
       to_char(hire_date, 'fmdd"-"Mon"-"yy') hire_date,
       job_id,
       salary,
       commission_pct,
       manager_id,
       department_id
from employees
where hire_date < to_date('2005', 'yyyy')
and upper(job_id) = 'ST_CLERK';

-- 7.
select last_name,
       job_id,
       salary,
       commission_pct
from employees
where commission_pct is not null
order by salary desc;

-- 8.
create table prof(profno number(4),
                  name varchar2(15) not null,
                  id varchar2(15) not null,
                  hiredate date,
                  pay number(4));
                  
-- 9.
-- (1)
insert into prof(profno,
            name,
            id,
            hiredate,
            pay)
values(1001,
       'Mark',
       'm1001',
       '07_03_01',
       800);
       
insert into prof(profno,
            name,
            id,
            hiredate)
values(1003,
       'Adam',
       'a1003',
       '11_03_02');
       
commit;
       
-- (2)
update prof
set pay = 1200
where profno = 1001;

-- (3)
delete prof
where profno = 1003;

-- 10.
-- (1)
alter table prof
add primary key(profno);

-- (2)
alter table prof
add (gender char(3));

-- (3)
alter table prof
modify (name varchar2(20));









