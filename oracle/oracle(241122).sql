create table department (
    deptid number(10) primary key,
    deptname varchar2(10),
    location varchar2(10),
    tel varchar2(15)
);

insert into department (deptid, deptname, location, tel)
values (1001, '총무팀', '본101호', '053-777-8777');
insert into department (deptid, deptname, location, tel)
values (1002, '회계팀', '본102호', '053-888-9999');
insert into department (deptid, deptname, location, tel)
values (1003, '영업팀', '본103호', '053-222-3333');


select * from department;

create table employee2 (
    empid number(10) primary key,
    empname varchar2(10),
    hiredate date,
    addr varchar2(12),
    tel varchar2(15),
    deptid number(10) references department(deptid) -- fk
);

-- 이렇게 외래키 설정도 가능
--deptid number(10),
--constraint emp_deptid_fk foreign key(deptid) references deparment(deptid)


insert into employee2 (empid, empname, hiredate, addr, tel, deptid)
values (20121945, '박민수', '2012/03/02', '대구', '010-1111-1234', 1001);
insert into employee2 (empid, empname, hiredate, addr, tel, deptid)
values (20101817, '박준식', '2010/09/01', '경산', '010-2222-1234', 1003);
insert into employee2 (empid, empname, hiredate, addr, tel, deptid)
values (20122245, '선아라', '2012/03/02', '대구', '010-3333-1222', 1002);
insert into employee2 (empid, empname, hiredate, addr, tel, deptid)
values (20121729, '이범수', '2011/03/02', '서울', '010-3333-4444', 1001);
insert into employee2 (empid, empname, hiredate, addr, tel, deptid)
values (20121646, '이융희', '2012/09/01', '부산', '010-1234-2222', 1003);
          
--CREATE OR REPLACE VIEW v_emp 
--AS
--    SELECT empno
--         , ename
--         , job
--         , hiredate
--      FROM emp
--;
--
--create view view_emp
--as select 
          
select e.empid, e.empname, e.birthday, d.deptname
from employee2 e join department d
on e.deptid = d.deptid
where e.hiredate > (select hiredate
                    from employee2
                    where empid = 20121729);
                
update employee2
set deptid = (select deptid
            from department
            where deptname = '회계팀')
where deptid = (select deptid
                from department
                where deptname = '영업팀');

select e.empname, e.hiredate, d.deptname
from department d join employee2 e
on e.deptid = d.deptid
where d.deptname = '총무팀';

delete employee2
where addr = '대구';

alter table employee2
add birthday date;

alter table employee2
MODIFY empname not null;


select * from employee2;






-- 241122 정답
--1. 비식별관계
--2. HAVING 절
--3. 선수영문명 중에서 두번째 문자가 A인 데이터
--4. 3개(n-1개)
--5. Inline View
--6.
DROP TABLE department1;
CREATE TABLE department1
(deptid    NUMBER(10) PRIMARY KEY,
 deptname  VARCHAR2(10),
 location  VARCHAR2(10),
 tel       VARCHAR2(15)
);

DROP TABLE employees1;
CREATE TABLE employees1
(empid    NUMBER(10) PRIMARY KEY,
 empname  VARCHAR2(10),
 hiredate DATE,
 addr     VARCHAR2(12),
 tel      VARCHAR2(15),
 deptid   NUMBER(10) REFERENCES department1(deptid)
 /*
 deptid   NUMBER(10),
 CONSTRAINT emp_deptid_fk FOREIGN KEY(deptid) REFERENCES department1(deptid)
 */
);

--7. 
ALTER TABLE employees1
ADD birthday DATE;

--8.
INSERT INTO department1
VALUES(1001, '총무팀', '본101호', '053-777-8777');
INSERT INTO department1
VALUES(1002, '회계팀', '본102호', '053-888-9999');
INSERT INTO department1
VALUES(1003, '영업팀', '본103호', '053-222-3333');

-- 날짜함수 to_date 사용하기!
-- char -> date: to_date
-- date -> char: to_char
-- char -> num: to_number
-- 오라클 데이터 변환 함수 세개!

INSERT INTO employees1(EMPID, EMPNAME, HIREDATE, ADDR, TEL, DEPTID)
VALUES(20121945, '박민수', TO_DATE('12/03/02', 'YY/MM/DD'), '대구','010-1111-1234',1001);
INSERT INTO employees1(EMPID, EMPNAME, HIREDATE, ADDR, TEL, DEPTID)
VALUES(20101817, '박준식', TO_DATE('10/09/01', 'YY/MM/DD'), '경산','010-2222-1234',1003);
INSERT INTO employees1(EMPID, EMPNAME, HIREDATE, ADDR, TEL, DEPTID)
VALUES(20122245, '선아라', TO_DATE('12/03/02', 'YY/MM/DD'), '대구','010-3333-1222',1002);
INSERT INTO employees1(EMPID, EMPNAME, HIREDATE, ADDR, TEL, DEPTID)
VALUES(20121729, '이범수', TO_DATE('11/03/02', 'YY/MM/DD'), '서울','010-3333-4444',1001);
INSERT INTO employees1(EMPID, EMPNAME, HIREDATE, ADDR, TEL, DEPTID)
VALUES(20121646, '이융희', TO_DATE('12/09/01', 'YY/MM/DD'), '부산','010-1234-2222',1003);

SELECT * FROM department1;
SELECT * FROM employees1;

--9.
-- MODIFY: 제약조건 변경 불가. 추가 삭제만 가능
ALTER TABLE employees1
MODIFY empname NOT NULL;

desc employees1;

-- 오라클 조인은 쓰지마 표준써
--10. 
-- 이너조인: 조건을 만족하는 것만 보여줌
SELECT e.empname, 
	   e.hiredate, 
	   d.deptname
FROM   employee2 e 
	   INNER JOIN department d
       ON(e.deptid = d.deptid)
WHERE    d.deptname = '총무팀';


--11.
DELETE FROM employee
WHERE  ADDR = '대구';

--12.
UPDATE employee
SET    deptid = (SELECT deptid
                 FROM   department
                 WHERE  deptname='회계팀')
WHERE  deptid = (SELECT deptid
                 FROM   department
                 WHERE  deptname='영업팀');
                 
--13.
SELECT e.empid, 
	   e.empname, 
	   e.birthday, 
	   d.deptname
FROM   employee e 
	   JOIN department d
       ON (d.deptid = e.deptid)
WHERE  e.hiredate > (SELECT hiredate
                     FROM   employee
                     WHERE  empid = 20121729);
                                         
--14.
GRANT CREATE VIEW TO hr;

-- view: alter 사용 불가. create 아니면 drop
-- replace: 기존 뷰가 있으면 기존거 삭제하고 새거 만들고, 없으면 그냥 만듦
-- 웬만하면 create/drop 사용하기. replace를 사용하면 같은 이름의 뷰로 생성해도 이미있다고 안알려주고 걍 대체해버림
-- OR REPLACE: 뷰를 수정할 때 DROP 없이 수정이 가능
-- 뷰에서 dml이 가능하긴 한데 사용안함(제약조건이 너무 많아서) select만 사용해라
-- 복잡한 select문을 뷰를 등록해놓고 사용하면 좋음
-- 정보보안 목적 ex) employees table은 일반 사원이 접근불가함. 샐러리 정보가 포함돼 있으니까. 샐러리 뺀 사원정보만 뷰로 빼서 사용
CREATE OR REPLACE VIEW emp_vu 
AS
  SELECT e.empname, 
		 e.addr, 
		 d.deptname
  FROM   employee2 e 
         JOIN department d
         ON (d.deptid = e.deptid)
  WHERE  d.deptname='총무팀';

-- emp_vu 뷰 사용
  SELECT empname, 
		 addr, 
		 deptname
  FROM emp_vu;
  


