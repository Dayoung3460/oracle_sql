-- paging
-- select 에 rownum이 있는데 order by를 하면 rownum 순서가 다 깨짐
-- select 한 다음에 order by를 하니까 
select d.*
from(select rownum rn, e.*
    from employees e
    order by first_name
    ) d
where rn between 1 and 10;

-- first_name으로 오더바이 먼저 해놓은 테이블에서 rownum 10개 짜름
select d.*
from(select rownum rn, e.*
    from (select * 
            from employees
            order by first_name) e
    ) d
where rn between 1 and 10;

-- ***** 모든 사원의 부서정보
-- left outer join: 사원의 수만큼 rows가 나오게 돼있음
SELECT employee_id, 
	   first_name, 
	   department_name,
       e.department_id
FROM employees e 
	 LEFT OUTER JOIN departments d
     ON(e.department_id = d.department_id);
     
-- 모든 사원의 부서정보 + 각 부서의 부서장(manager_id) 정보
SELECT e.employee_id, 
	   e.first_name, 
	   d.department_name,
       m.first_name
FROM employees e 
    join departments d
    on(e.department_id = d.department_id)
    join employees m
    on(d.manager_id = m.employee_id);
    
-- 조인은 순서대로 함
SELECT e.employee_id, 
	   e.first_name, 
	   d.department_name,
       m.first_name
FROM employees e 
    left outer join departments d
    on(e.department_id = d.department_id)
    right outer join employees m
    on(d.manager_id = m.employee_id);
    
SELECT e.employee_id, 
	   e.first_name, 
	   d.department_name,
       m.first_name
FROM employees e 
    join departments d
    on(e.department_id = d.department_id)
    left outer join employees m
    on(d.manager_id = m.employee_id);
    
    -- ddl create alter drop / dml insert update delete / dcl grant revoke / tcl commit rollback savepoint

-- oracle command
-- DBMS_OUTPUT.PUT_LINE(프로시저)를 사용하려면 이 설정 필요
-- 화면에 출력하는 프로시저임. like console.log()
-- sql에서 ~개 행이 출력되었습니다, 수정되었습니다 출력되잖아
-- plsql에서는 그런거 안나옴.
-- 나오게 해주는 프로시저.
-- off 하면 내부에서를 실행되지만 화면으로 출력은 안됨
-- 고정되는 값이 아니라서 sql 시작할 때 필수 명령어~~
--set serveroutput on

-- /: 블럭의 끝. 컴파일과 실행을 동시에 함. 항상 새 줄에다가 쓰기
begin
    DBMS_OUTPUT.PUT_LINE('Hello, pl/sql!!');
END;
/

-- 트랜젝션: sql 구문 여러개를 하나의 작업으로. 논리 작업. ex) 계좌이체
-- 프로시저: 특정작업을 위해 plsql 명령어들 모아놓은거

declare
    v_str varchar2(100);
    v_num constant number(2, 0) := 10;
    v_count number(2, 0) not null default 5;
    v_sum number(3, 0) := v_num + v_count;
begin
    v_str := 1;
    DBMS_OUTPUT.PUT_LINE('v_str : ' || v_str);
    DBMS_OUTPUT.PUT_LINE('v_num : ' || v_num);
    -- v_num := 100; -- expression 'V_NUM' cannot be used as an assignment target
    
    DBMS_OUTPUT.PUT_LINE('v_count : ' || v_count);
    DBMS_OUTPUT.PUT_LINE('v_sum : ' || v_sum);
end;
/

-- 스칼라 데이터 타입에서 불린은 값 세개 가짐. 널 포함됨
-- pls_integer: 검색속도 빠름. 인덱스로 사용됨. 
-- number(5, 2)의 최대값: 999.99 첫번째 인자: 총길이, 두번째: 총길이 중 소수점 길이
-- number(2, 2)의 최대값: 0.99

-- 지정된 타입을 복사해서 쓰겠다, 지정된 타입이 변경되면 같이 변경됨 - %TYPE
-- ex. v_ename emp.ename%TYPE;
-- v_min_balance v_balance%TYPE := 10;
-- 

DECLARE
-- 실행할 때마다 데이터 타입을 실시간으로 업데이트함
    v_eid employees.employee_id%TYPE;
    v_ename employees.last_name%TYPE;
    v_new v_ename%type; --변수의 타입을 참조하는 것도 가능
begin
    select employee_id, last_name
    into v_eid, v_ename -- employee_id, last_name이 v_eid, v_ename에 대입됨?
    from employees
    where employee_id = 100;
    
    -- v_eid := 'water'; -- character to number conversion error
    v_new := v_eid || ' ' || v_ename;
    dbms_output.put_line(v_new);
end;
/

-- byte, char
-- byte: 실제 메모리 크기. 영문 1byte 한글 3byte 
-- char: 글자 크기. char가 25일 때 byte가 25일수도, 75일수도
-- varchar2 최대 크기 4000 byte

/*
plsql에서 
그룹함수(lower() 등), decode 함수 사용불가. sql과 함께 사용해야함
데이터 유형 변환, 날짜 함수는 가능
*/

declare
    v_date date;
begin
    v_date := sysdate + 7; -- 24/11/29 현재날짜+7일
    dbms_output.put_line(v_date);
end;
/

-- 지수 연산자: **
-- 10의 2승: 10 ** 2 = 100
-- sql에서는 문자열을 '+'로 연결 못함 '||' 사용

-- plsql 안에서 sql은
-- select, dml, tcl만 사용 가능.
-- ddl(create, alter, drop), dcl(commit , rollback, savepoint) 사용ㄴㄴ

declare
    v_name employees.last_name%type;
begin
    select last_name
    -- into절은 select와 짝꿍. 없으면 안됨. 조회값을 변수에 선언. 
    -- select 컬럼 갯수 = into 절 변수 갯수
    into v_name
    from employees
    -- 변수에 값을 하나만 넣어야하니까 where로 결과값 하나만 나오록 필터 걸어야됨
    where employee_id = 100;
    dbms_output.put_line(v_name);
end;
/


declare
    v_name employees.last_name%type;
begin
    select last_name
    into v_name
    from employees
    -- 부서번호 50. 같은 부서 사람이 2명 이상이면 에러 -- exact fetch returns more than requested number of rows
    -- 부서번호 10. 1명이여야됨
    -- 부서번호 0. 빵명이면 -- no data found
    where department_id = &부서번호;
    dbms_output.put_line(v_name);
end;
/

declare
    v_eid employees.employee_id%type;
    v_ename employees.last_name%type;
begin
    select employee_id, last_name
    into v_eid, v_ename
    from employees
    where employee_id = 100;
    
    dbms_output.put_line(v_eid);
    dbms_output.put_line(v_ename);
end;
/

/*
1.
사원번호를 입력(치환변수사용&)할 경우
사원번호, 사원이름, 부서이름  
을 출력하는 PL/SQL을 작성하시오.
*/
declare
    v_eid employees.employee_id%type;
    v_ename employees.last_name%type;
    v_dname departments.department_name%type;
begin
    select e.employee_id, e.last_name, d.department_name
    into v_eid, v_ename, v_dname
    from employees e join departments d
    on e.department_id = d.department_id
    where employee_id = &사원번호; -- 100
    
--    select e.employee_id, e.last_name, (select department_name from departments where department_id = e.department_id) dname
--    into v_eid, v_ename, v_dname
--    from employees e
--    where employee_id = &사원번호; -- 100
    
    dbms_output.put_line(v_eid);
    dbms_output.put_line(v_ename);
    dbms_output.put_line(v_dname);
end;
/

-- 위의 문제에서 join, subquery 사용안하고
-- plsql을 사용하면 변수가 있으니까 join, subquery를 사용안해도 같은 결과를 낼 수 있음
declare
    v_eid employees.employee_id%type;
    v_ename employees.last_name%type;
    v_did departments.department_id%type;
    v_dname departments.department_name%type;
begin
    select employee_id, last_name, department_id
    into v_eid, v_ename, v_did
    from employees 
    where employee_id = &사원번호; -- 100
    
    select department_id
    into v_did
    from departments
    where department_id = v_did;
    
    dbms_output.put_line(v_eid);
    dbms_output.put_line(v_ename);
    dbms_output.put_line(v_dname);
end;
/

select * from employees;
select * from departments;
/*
2.
사원번호를 입력(치환변수사용&)할 경우 
사원이름, 
급여, 
연봉->(급여*12+(nvl(급여,0)*nvl(커미션퍼센트,0)*12))
을 출력하는  PL/SQL을 작성하시오.
*/
declare
    v_ename employees.last_name%type;
    v_esal employees.salary%type;
    v_esal_year number(20);
begin
    select last_name, salary, (salary*12+(nvl(salary,0)*nvl(commission_pct,0)*12))
    into v_ename, v_esal, v_esal_year
    from employees 
    where employee_id = &사원번호; -- 100
    
    dbms_output.put_line(v_ename);
    dbms_output.put_line(v_esal);
    dbms_output.put_line(v_esal_year);
end;
/

-- 연봉을 select문에서 연산하지 않고 분리해서
declare
    v_ename employees.last_name%type;
    v_esal employees.salary%type;
    v_esal_year employees.salary%type;
    v_comm employees.commission_pct%type;
begin
    select last_name, salary, commission_pct
    into v_ename, v_esal, v_comm
    from employees 
    where employee_id = &사원번호; -- 100
    
    v_esal_year := v_esal*12+(nvl(v_esal,0)*nvl(v_comm,0)*12);
    
    dbms_output.put_line(v_ename);
    dbms_output.put_line(v_esal);
    dbms_output.put_line(v_esal_year);
end;
/

CREATE OR REPLACE PROCEDURE get_employee_details (
    p_emp_id IN employees.employee_id%TYPE
) AS
    v_eid employees.employee_id%TYPE;
    v_ename employees.last_name%TYPE;
    v_esal employees.salary%TYPE;
    v_esal_year employees.salary%TYPE;
BEGIN
    SELECT employee_id, last_name, salary, 
           (salary*12 + (NVL(salary, 0) * NVL(commission_pct, 0) * 12))
    INTO v_eid, v_ename, v_esal, v_esal_year
    FROM employees
    WHERE employee_id = p_emp_id;

    DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_eid);
    DBMS_OUTPUT.PUT_LINE('Name: ' || v_ename);
    DBMS_OUTPUT.PUT_LINE('Monthly Salary: ' || v_esal);
    DBMS_OUTPUT.PUT_LINE('Yearly Salary: ' || v_esal_year);
END;
/

begin
    get_employee_details(103);
end;
/

declare
    v_deptno departments.department_id%type;
    v_comm employees.commission_pct%type := .1;
begin
    select department_id
    into v_deptno
    from employees
    where employee_id = &사원번호;
    
    insert into employees
    (employee_id, last_name, email, hire_date, job_id, department_id)
    values
    (1000, 'Hong', 'hkd@google.com', sysdate, 'IT_PROG', v_deptno);

    update employees
    set salary = (nvl(salary, 0) + 10000) * v_comm
    where employee_id = 1000;
    
    -- 프로시저 안에서도 커밋을 해줘야함
    commit;
end;
/
rollback;

select *
from employees
where employee_id in (100, 1000);

-- delete한 값이 없어도 걍 성공적으로 완료되었습니다 라고 뜸
begin
    delete from employees
    where employee_id = 1000;
end;
/

-- plsql 커서: sql을 실행한 메모리 영역
 -- 암시적 커서: 이름 없. insert, update, delete -> 세개를 실행하면 오라클이 커서 메모리를 만들고 자동으로 수행하고 없어짐
 --                     쿼리문 하나씩 가능. 이전 쿼리 메모리를 덮어씀
--                     직접 접근 불가
--                     속성- SQL%ROWCOUNT: 가장 최근 SQL 문이 적용된 행의 개수를 알 수 있음(dml 실행결과 확인) create insert update delete
 -- 명시적 커서: 이름 있. 재호출이 가능함. 
 
begin
    delete from employees
    where employee_id = 0;
    
    -- 여러개의 sql을 실행해도 마지막 하나만 나옴
    dbms_output.put_line(sql%rowcount || '건이 삭제되었습니다.');
end;
/

/**** 제어문: 예외 상황일 때 사용
if {조건식} then
    {실행코드}
elsif
    {실행코드}
else 
    {실행코드}
end if;
*/

begin
-- child record error 나면 employee_id를 fk(부모 자식 관계)로 사용하고 있는 칼럼들을 확인해야해
-- employees에서 manager_id, departments에서 manager_id 체크해서 여기서 사용안하는 employee_id만 삭제 가능
    delete from employees
    where employee_id = &사원번호;
    
    if sql%rowcount >= 1 then
        dbms_output.put_line('정상적으로 삭제되었습니다.');
    else
        dbms_output.put_line('삭제 실패');
        dbms_output.put_line('사원 번호를 확인해주세요');
    end if;    
end;
/

-- 아무데서도 참조안하고 있는 사원찾기
select employee_id
from employees
where employee_id not in (select manager_id
                            from employees
                            where manager_id is not null
                            union
                            select manager_id
                            from departments
                            where manager_id is not null);
select * from employees;

declare
    v_score number(2, 0) := &정수;
    v_grade char(1);
--  마지막에 else 구문 안하고 싶으면 이렇게 초기값을 주면됨    
--  v_grade char(1) := 'F';
begin
    if v_score >= 90 then
        v_grade := 'A';
    elsif v_score >= 80 then
        v_grade := 'B';
    elsif v_score >= 70 then
        v_grade := 'C';
    elsif v_score >= 60 then
        v_grade := 'D';
    else
        v_grade := 'F';
    end if;
    
    dbms_output.put_line(v_grade);
end;
/

select * from employees;

-- 사원번호 입력받았을 때 해당 사원의 업무(job_id)가 영업(SA_REP)인 경우 확인하기
declare
    v_empid employees.employee_id%type := &사원번호;
    v_jobid employees.job_id%type;
    v_sa_emp_cnt number(2, 0);
begin
--    select count(*)
--    into v_sa_emp_cnt
--    from employees
--    where upper(job_id) like '%SA%'
--    and employee_id = v_empid;
--    
--    if v_sa_emp_cnt > 0 then
--        dbms_output.put_line(v_empid || '번 사원의 업무는 영업이 맞습니다');
--    else
--        dbms_output.put_line(v_empid || '번 사원의 업무는 영업이 아닙니다');
    
    select job_id
    into v_jobid
    from employees
    where employee_id = v_empid;

    if upper(v_jobid) like '%SA%' then
        dbms_output.put_line(v_empid || '번 사원의 업무는 영업이 맞습니다');
    else
        dbms_output.put_line(v_empid || '번 사원의 업무는 ' || v_jobid || ' 입니다');

    end if;
end;
/

/*
3.
사원번호를 입력(치환변수사용&)할 경우
입사일이 2025년 이후(2025년 포함)이면 'New employee' 출력
      2025년 이전이면 'Career employee' 출력
단, DBMS_OUTPUT.PUT_LINE ~ 은 한번만 사용
*/

declare
    v_hiredate employees.hire_date%type;
    v_emp varchar2(20) := 'New employee';
begin
    select hire_date
    into v_hiredate
    from employees
    where employee_id = &사원번호;
    
--    if v_hiredate < to_date('2025-01-01') then    
    if to_char(v_hiredate, 'yyyy') < '2025' then
--    if 2025 >= extract (year from v_hiredate) then
        v_emp := 'Career employee';
    end if;
    
    dbms_output.put_line(v_emp);
end;
/

/*
4.
사원번호를 입력(치환변수사용&)할 경우
사원들 중 2025년 이후(2025년 포함)에 입사한 사원의 사원번호, 
사원이름, 입사일을 test01 테이블에 입력하고, 2025년 이전에 
입사한 사원의 사원번호,사원이름,입사일을 test02 테이블에 입력하시오.
*/

create table test01(empid, ename, hiredate)
as
  select employee_id, last_name, hire_date
  from employees
  where  employee_id = 0;

create table test02(empid, ename, hiredate)
as
  select employee_id, last_name, hire_date
  from   employees
  where  employee_id = 0;

select * from employees;

declare
    v_hiredate employees.hire_date%type;
    v_empid employees.employee_id%type;
    v_empname employees.last_name%type;
begin
    select employee_id, last_name, hire_date 
    into v_empid, v_empname, v_hiredate
    from employees
    where employee_id = &사원번호;

    if v_hiredate >= to_date('2025-01-01') then
        insert into test01 (empid, ename, hiredate)
        values(v_empid, v_empname, v_hiredate);
    else
        insert into test02 (empid, ename, hiredate)
        values(v_empid, v_empname, v_hiredate);
    end if;
end;
/

/*
5.
급여가  5000이하이면 20% 인상된 급여
급여가 10000이하이면 15% 인상된 급여
급여가 15000이하이면 10% 인상된 급여
급여가 15001이상이면 급여 인상없음

사원번호를 입력(치환변수)하면 사원이름, 급여, 인상된 급여가 출력되도록 PL/SQL 블록을 생성하시오.
*/

declare
    v_ename employees.last_name%type;
    v_sal employees.salary%type;
    v_raise number(2, 0) := 0;
    v_new_sal employees.salary%type;
begin
    select last_name, salary
    into v_ename, v_sal
    from employees
    where employee_id = &사원번호;
    
    if v_sal <= 5000 then
        v_raise := 20;
    elsif v_sal <= 10000 then
        v_raise := 15;
    elsif v_sal <= 15000 then
        v_raise := 10;
    end if;
    
    v_new_sal := v_sal + (v_sal * v_raise/100);
    dbms_output.put_line(v_ename ||' '|| v_sal ||' '|| v_new_sal);
    
end;
/

-- loop
/*
begin
    loop
        {실행문}
    exit [when 종료 조건]
    end loop;
end;
/
*/

begin
    loop
        dbms_output.put_line('hello');
        exit; -- exit 안걸면: buffer overflow, limit of 1000000 bytes
    end loop;
end;
/

declare
    v_count number(1, 0) := 0;
begin
    loop
        dbms_output.put_line('hello');
        v_count := v_count + 1;
        exit when v_count >= 5;
    end loop;
end;
/

-- 1 ~ 10 정수의 총합
declare
    v_num number(2, 0) := 1;
    v_sum number(2, 0) := 0;
begin
    loop
        v_sum := v_sum + v_num;
        v_num := v_num + 1;
    exit when v_num > 10;
    end loop;
    
    dbms_output.put_line(v_sum);
end;
/

/*

6. 다음과 같이 출력되도록 하시오.
*         
**        
***       
****     
*****    

*/
declare
    v_tree varchar2(6) := '';
begin
    loop
        v_tree := v_tree || '*';
        dbms_output.put_line(v_tree);
        exit when length(v_tree) >= 5;
    end loop;
end;
/


/*
7. 치환변수(&)를 사용하면 숫자를 입력하면 
해당 구구단이 출력되도록 하시오.
예) 2 입력시 아래와 같이 출력
2 * 1 = 2
2 * 2 = 4
...

*/

declare
    v_dan number(1, 0) := &dan;
    v_cnt number(2, 0) := 1;
begin
    loop
        dbms_output.put_line(v_dan || '*' || v_cnt || '=' || v_dan * v_cnt);
        v_cnt := v_cnt + 1;
    exit when v_cnt > 9; 
    end loop;
end;
/

/*
8. 구구단 2~9단까지 출력되도록 하시오.
*/
declare
    v_factor number(2, 0) := 2;
    v_last_factor number(2, 0) := 9;
    v_multiply number(2, 0) := 1;
begin
    loop
        loop
            dbms_output.put_line(v_factor || '*' || v_multiply || '=' || v_factor * v_multiply);
            v_multiply := v_multiply + 1;
        exit when v_multiply > 9; 
        end loop;
        
        v_factor := v_factor + 1;
        v_multiply := 1;
        exit when v_last_factor < v_factor;
     end loop;
end;
/

/*
while {반복조건} loop
    {실행 코드}
end loop;
*/

declare
    v_count number(1, 0) := 0;
begin
    while v_count < 3 loop
        dbms_output.put_line('hello');
        v_count := v_count + 1;
    end loop;
end;
/

-- 1 ~ 10까지 숫자 합
declare
    v_num number(2, 0) := 0;
    v_sum number(2, 0) := 0;
begin
    while v_num <= 10
    loop
        v_sum := v_sum + v_num; 
        v_num := v_num + 1;
    end loop;
    dbms_output.put_line(v_sum);
end;
/

declare
    v_tree varchar2(10) := '*';
begin
-- 오라클 함수에서 공백은 다 널
-- length('') -> null
-- length(' ') -> 1
-- v_tree 초기값을 ''공백으로 하면 
-- while nvl(length(v_tree), 0) <= 5 loop
    while length(v_tree) <= 5 loop
        dbms_output.put_line(v_tree);
        v_tree := v_tree || '*';
    end loop;
end;
/

/*
7. 치환변수(&)를 사용하면 숫자를 입력하면 
해당 구구단이 출력되도록 하시오.
예) 2 입력시 아래와 같이 출력
2 * 1 = 2
2 * 2 = 4
...

*/

declare
    v_factor number(1, 0) := &factor;
    v_cnt number(2, 0) := 1;
begin
    while v_cnt <= 9
    loop
        dbms_output.put_line(v_factor || '*' || v_cnt || '=' || v_factor * v_cnt);
        v_cnt := v_cnt + 1;
    end loop;
end;
/

/*
8. 구구단 2~9단까지 출력되도록 하시오.
*/
declare
    v_factor number(2, 0) := 2;
    v_last_num number(2, 0) := 9;
    v_multiply number(2, 0) := 1;
begin
    while v_last_num >= v_factor loop
        while v_multiply <= v_last_num loop
            dbms_output.put_line(v_factor || '*' || v_multiply || '=' || v_factor * v_multiply);
            v_multiply := v_multiply + 1;
        end loop;
        
        v_factor := v_factor + 1;
        v_multiply := 1;
     end loop;
end;
/

-- for loop: 지정된 범위 안 모든 정수의 개수만큼 루핑

begin
    for num in -1 .. 5 loop
        dbms_output.put_line(num);
    end loop;
end;
/

-- 최대값보다 최소값이 크면 실행안됨
declare
    v_max number(1, 0) := &최대값;
begin
    for idx in 1 .. v_max loop
        if idx = 3 then
            continue;
        else 
            dbms_output.put_line(idx);
        end if;
    end loop;
end;
/

-- 역순으로 루핑(내림차순)
begin
    for idx in reverse 1 .. 5 loop
        dbms_output.put_line(idx);
    end loop;
end;
/

declare
    v_sum number(2, 0) := 0;
begin
    for idx in 1 .. 10 loop
        v_sum := v_sum + idx;
    end loop;
    dbms_output.put_line(v_sum);
end;
/

DECLARE
    v_tree varchar2(10) := '*';
BEGIN
    for star in 1 .. 5 loop
        dbms_output.put_line(v_tree);
        v_tree := v_tree || '*';
    end loop;
END;
/

BEGIN
    for line in 1 .. 5 loop
        for tree in 1 .. line loop
            dbms_output.put('*');
            end loop;
        dbms_output.put_line('');
    end loop;
END;
/

declare
    v_factor number(1, 0) := &factor;
    v_cnt number(2, 0) := 1;
begin
    for idx in 1 .. 9 loop    
        dbms_output.put_line(v_factor || '*' || v_cnt || '=' || v_factor * v_cnt);
        v_cnt := v_cnt + 1;
    end loop;
end;
/

declare
    v_factor number(2, 0) := 2;
    v_last_num number(2, 0) := 9;
    v_multiply number(2, 0) := 1;
begin
    for dan in v_factor .. v_last_num loop
        for num in v_multiply .. v_last_num loop
            dbms_output.put_line(v_factor || '*' || v_multiply || '=' || v_factor * v_multiply);
            v_multiply := v_multiply + 1;
        end loop;
        
        v_factor := v_factor + 1;
        v_multiply := 1;
     end loop;
end;
/




