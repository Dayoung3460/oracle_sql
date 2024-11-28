/*
cursor for loop
- 명시적 커서 처리하기 위한 단축 방법
- open, fetch, close 암시적으로 발생
- 커서를 다 돌아야 끝남

DECLARE
    cursor {커서명} is
        {select 문};
BEGIN
    for {레코드 타입 임시변수} in {커서명} loop <- OPEN / FETCH
        {커서에 데이터 존재하는 경우 수행되는 코드}
    end loop; <- CLOSE
END;
/
*/ 

DECLARE
    cursor emp_cursor is
        select employee_id, last_name, salary
        from employees;
BEGIN
    for emp_rec in emp_cursor loop
        dbms_output.put(emp_cursor%rowcount);
        dbms_output.put(': ' || emp_rec.employee_id);
        dbms_output.put(' ' || emp_rec.last_name);
        dbms_output.put_line(' ' || emp_rec.salary);
    end loop;
END;
/

-- 부서별 소속사원 확인
DECLARE
    cursor emp_of_dept_cursor is
        select employee_id, last_name, salary, department_id
        from employees
        where department_id = &부서번호;
BEGIN
    for emp_rec in emp_of_dept_cursor loop
        dbms_output.put(emp_of_dept_cursor%rowcount);
        dbms_output.put(': ' || emp_rec.employee_id);
        dbms_output.put(' ' || emp_rec.last_name);
        dbms_output.put_line(' ' || emp_rec.salary);
    end loop;
    
    -- cursor for loop 사용하면 end loop 될 때 커서 close됨.
    -- 커서 관력 속성 사용 불가
    -- 명시적 커서의 데이터가 있다는 것을 보장 못하면 CURSOR FOR LOOP 사용하지마
--    if emp_of_dept_cursor%rowcount = 0 then
--        dbms_output.put_line('해당 부서에 사원 없음');
--    end if;
END;
/
/*
1.
사원(employees) 테이블에서
사원의 사원번호, 사원이름, 입사연도를 
다음 기준에 맞게 각각 test01, test02에 입력하시오.

입사년도가 2025년(포함) 이전 입사한 사원은 test01 테이블에 입력
입사년도가 2025년 이후 입사한 사원은 test02 테이블에 입력
*/

DECLARE
    cursor emp_by_hdate_cursor is
        select employee_id, last_name, hire_date
        from employees;
BEGIN
    for emp_rec in emp_by_hdate_cursor loop
        dbms_output.put_line(emp_rec.hire_date);
        
--        TO_CHAR(emp_rec.hire_date, 'YYYYMMDD') <= '20251231'
        if emp_rec.hire_date <= TO_DATE('2025-12-31', 'YYYY-MM-DD') then
            insert into test01 (empid, ename, hiredate)
            values (emp_rec.employee_id, emp_rec.last_name, emp_rec.hire_date);
        else
            insert into test02
            values emp_rec;
        end if;
    end loop;
END;
/
select * from test02;
/*
2.
부서번호를 입력할 경우(&치환변수 사용)
해당하는 부서의 사원이름, 입사일자, 부서명을 출력하시오.
*/
DECLARE
    cursor EMP_BY_HDATE_CURSOR is
        select e.employee_id eid, e.hire_date hdate, d.department_name dept_name
        from employees e join departments d
            on (e.department_id = d.department_id)
        where e.department_id = &부서번호;
BEGIN
    for emp_rec in EMP_BY_HDATE_CURSOR loop
        dbms_output.put_line(emp_rec.eid || ' ' || emp_rec.hdate || ' ' || emp_rec.dept_name);
    end loop;
END;
/

-- 서브쿼리 이용 가능. but 속성 사용 불가. 이름이 없으니까
BEGIN
    for emp_rec in (select e.employee_id eid, e.hire_date hdate, d.department_name dept_name
                    from employees e join departments d
                        on (e.department_id = d.department_id)
                    where e.department_id = &부서번호) loop
        dbms_output.put_line(emp_rec.eid || ' ' || emp_rec.hdate || ' ' || emp_rec.dept_name);
    end loop;
END;
/
/*
3.
부서번호를 입력(&사용)할 경우 
사원이름, 급여, 연봉->(급여*12+(급여*nvl(커미션퍼센트,0)*12))
을 출력하는  PL/SQL을 작성하시오.
*/
DECLARE
    cursor emp_salary_cursor is
        select last_name, salary, (salary*12+(salary*nvl(commission_pct,0)*12)) salary_year
        from employees
        where department_id = &부서번호;
BEGIN
    for emp_rec in emp_salary_cursor loop
        dbms_output.put_line(emp_rec.last_name || ' ' || emp_rec.salary || ' ' || emp_rec.salary_year);
    end loop;

END;
/

DECLARE
    cursor emp_salary_cursor is
        select last_name, salary, commission_pct
        from employees
        where department_id = &부서번호;
        
    v_year number(10, 2);
BEGIN
    for emp_rec in emp_salary_cursor loop
        v_year := (emp_rec.salary*12+(emp_rec.salary*nvl(emp_rec.commission_pct,0)*12));
        dbms_output.put_line(emp_rec.last_name || ' ' || emp_rec.salary || ' ' || v_year);
    end loop;
END;
/

------------------------------------EXCEPTION------------------------------------------------

/*
예외이름 참고
--https://docs.oracle.com/cd/E11882_01/appdev.112/e25519/errors.htm#i9355

EXCEPTION
    when {예외이름} then
        {실행 코드}
    when others then <- 예외 일괄처리
        {실행 코드}
END;
/
*/

DECLARE
    v_ename employees.last_name%type;
BEGIN
    select last_name
    into v_ename
    from employees
    where department_id = &부서번호;
    
    dbms_output.put_line(v_ename);
EXCEPTION
    -- 부서번호 10 정상실행
    --         90 exact fetch returns more than requested number of rows
    --         0 no data found
    
    when no_data_found then
        dbms_output.put_line('해당 부서에 속한 사원 없음');
    when too_many_rows then
        dbms_output.put_line('사원이 2명 이상임');
        
        -- 오라클 에러코드 출력
        dbms_output.put('ORA: ' || sqlcode || ' ');
        -- 오라클 에러 메세지 출력
        dbms_output.put_line(substr(sqlerrm, 12));
        
        dbms_output.put_line(sqlerrm);
    when others then
        dbms_output.put_line('error');
END;
/

/*
DECLARE
-- 예외 정의. 
    e_emps_remaining exception;
    -- pragma: 컴파일전에 진행되는 전처리작업할 때 사용하는 키워드
    -- exception_init: 예외처리 초기화. e_emps_remaining 예외에 -2292로 초기화
    pragma exception_init (e_emps_remaining, -2292);
BEGIN

EXCEPTION
    when e_emps_remaining then
end;
/
*/

DECLARE
    -- ORA-02292: integrity constraint (HR.EMP_DEPT_FK) violated - child record found
    e_emps_remaining exception;
    pragma exception_init (e_emps_remaining, -02292);
BEGIN
    delete from departments
    where department_id = &부서번호;
EXCEPTION
    when e_emps_remaining then
        dbms_output.put_line('해당 부서 다른 테이블에서 사용중입니다');
END;
/

/*
-- custom error handling. oracle은 모르는 에러
DECLARE
    e_department_invalid exception;
BEGIN
    RAISE e_department_invalid <-에러 강제 실행
EXCEPTION
    when e_department_invalid then
end;
/
*/

DECLARE
    e_dept_del_fail exception;
BEGIN
    -- 0 입력했을 때 '0개 행이 삭제되었습니다' 라고 정상동작하지만 삭제된게 없다면 예외처리를 할 수도 있음
    delete from departments
    where department_id = &부서번호;
    
    if sql%rowcount = 0 then
        raise e_dept_del_fail;
    end if;
EXCEPTION
    when e_dept_del_fail then
        dbms_output.put_line('해당 부서는 존재하지 않습니다.');
        dbms_output.put_line('부서 번호를 확인해주세요.');
        
END;
/
/*
1.
drop table emp_test;

create table emp_test
as
  select employee_id, last_name
  from   employees
  where  employee_id < 200;

emp_test 테이블에서 사원번호를 사용(&치환변수 사용)하여 사원을 삭제하는 PL/SQL을 작성하시오.
(단, 사용자 정의 예외사항 사용)
(단, 사원이 없으면 "해당사원이 없습니다.'라는 오류메시지 발생)
*/
select * from emp_test;

DECLARE
    e_del_fail exception;
BEGIN
    delete from emp_test
    where employee_id = &사원번호;
    
    if sql%rowcount = 0 then
        raise e_del_fail;
    end if;
EXCEPTION
    when e_del_fail then
        dbms_output.put_line('해당사원이 없습니다.');
END;
/

/*
--------------------------------------프로시저----------------------------------------- 
* 매개변수 사용하여 호출할 수 있는 plsql block
* 매개변수 in(default), out, in out 모드 세개가 있음
    in: 프로시저, 함수에 값 전달, 걍 값 자체를 넘겨도 되고 변수를 넘겨도 되고, 상수 취급(read-only), 내부에서 변경 불가
    out: 값을 호출 환경으로 반환, 꼭 변수여야 함, 매개변수를 받아도 내부에선 그 변수를 널로 취급
    in out: in + out, 꼭 변수여야 함, 일반 변수 같음
* 함수에서 리턴값은 딱 하나임    
* 프로시저 제거: drop procedure {procedure name}
* dml만 가능

create procedure {procedure name}
    {arg name} [mode] {data type}
is
    -- 선언부: 로컬변수, 커서, 예외사항 등 선언
    -- declare절 없음
begin
    {procedure 수행 코드}
exception
    {error handling}
end;
/
*/

-- 실행 -> 프로시저 객체로 등록됨, 동일 객체 재등록 불가
create procedure test_pro
    (p_msg varchar2) -- 매개변수 in, 넘어오는 값에 대해 크기를 지정할순 없음
is
    v_msg varchar2(1000) := 'Hello';
begin
    dbms_output.put_line(v_msg || ' ' ||  p_msg);
exception
    when no_data_found then
        dbms_output.put_line('no data found');
end;
/

drop procedure raise_salary;

BEGIN
-- procedure 호출
    test_pro('pl/sql');
END;
/

DECLARE
    v_result varchar2(1000);
BEGIN
-- no function with name 'TEST_PRO' exists in this scope
-- 프로시저를 호출할 때는 단독으로만 호출 가능
-- 호출해서 값을 대입하는 이런 형태는 함수만 가능.
-- 호출 형태에 따라 오라클이 프로시전지 함순지 판단함
    v_result := test_pro('pl/sql');
    
    -- 프로시저는 반환값이 없음. 
    -- 매개변수를 통해서만(out) 값을 내보낼 수 있음
    -- 반환값을 할당하는 형태는 불가함
END;
/   

-- execute: sql developer에서 프로시저 단독으로 호출할 때 사용가능
-- 강제로 begin, end 사이에 넣어서 실행함
execute test_pro('world');

-- 매개변수 in mode
create procedure raise_salary
(p_eid in employees.employee_id%type)
is

begin
-- compile error
-- expression 'P_EID' cannot be used as an assignment target
-- in mode는 매개변수가 상수값임
-- error가 난 채로 실행해도 프로시저 객체로 등록은 됨
--    p_eid := 100;

    update employees
    set salary = salary * 1.1
    where employee_id = p_eid;
end;
/

declare
    v_first number(3, 0) := 100;
    v_second constant number(3, 0) := 149;
begin
    raise_salary(100); -- 리터럴 
    raise_salary(v_first + 30); -- 표현식
    raise_salary(v_first); -- 초기화된 변수 
    raise_salary(v_second); -- 상수 
end;
/
select * from employees;

-- ddl 사용하는 순간 지금까지 한거 커밋됨
rollback;

drop procedure test_p_out;

-- 매개변수 out mode: 호출환경으로 값 반환, 프로시저 내부에서 초기화되지 않은 변수로 인지
create procedure test_p_out
(p_num in number,
p_out out number)
is
 
begin
    dbms_output.put_line('in: ' || p_num);
    dbms_output.put_line('out: ' || p_out);
end; -- block 종료되는 순간 out mode의 매개변수가 가지고 있는 값이 그대로 반환
/

DECLARE
    v_result number(4, 0) := 1234;
BEGIN
    dbms_output.put_line('1) ' || v_result);
    test_p_out(1000, v_result);
    dbms_output.put_line('2) ' || v_result);
END;
/

create procedure pro_plus
(p_x in number,
 p_y in number,
 p_sum out number)
is

begin
    p_sum := p_x + p_y;
end;
/

declare
    v_sum number(10, 0);
begin
    -- out mode 파라미터 변수로 넘겨줘야함
    pro_plus(1, 2, v_sum);
    dbms_output.put_line(v_sum);
end;
/

-- in out mode: 기존 데이터를 변경할 때 사용. 파라미터 변수를 받아서 사용하고(변경하거나) 반환.
create procedure format_phone
(p_phone_no in out varchar2)
is

begin
    dbms_output.put_line('before: ' || p_phone_no);
    -- 받은 값을 받아서 변경하고 내보냄(값을 덮어씀)
    p_phone_no := substr(p_phone_no, 1, 3) || '-' || substr(p_phone_no, 4, 4) || '-' || substr(p_phone_no, 8);
    dbms_output.put_line('after: ' || p_phone_no);
end;
/

drop procedure format_phone;

declare
    v_phone varchar2(20) := '01031233235';
begin
    format_phone(v_phone);
    dbms_output.put_line(v_phone);
end;
/

/*
* plsql의 함수는 무조건 반환을 해야함
    - 계산을 할 때
    - sql문에서 사용가능(to_char(), sysdate 등)
    - sql문의 대부분 절에서 호출 가능
    - dml에서 사용 안함.
    - 거의 select에서..?
* 반환이 필요없는 경우에 프로시저를 사용함
    - sql문에서 사용 불가. plsql만.
    - 데이터를 변경하는 dml에서 자주 사용
*/

create function hello
return varchar2
is
begin
    return 'hello';
end;
/

drop function hello;

select hello form dual;

select * from dual;

/*
1.
주민등록번호를 입력하면 
다음과 같이 출력되도록 yedam_ju 프로시저를 작성하시오.

EXECUTE yedam_ju('9501011667777')
950101-1******
EXECUTE yedam_ju('1511013689977')
151101-3******

*/

create procedure yedam_ju
(p_id in varchar2)
is
    v_id varchar2(20);
begin
--    v_id := substr(p_id, 1, 6) || '-' || substr(p_id, 7, 1) || '******'; 

    -- rpad(가지고 있는 문자, 원하는 문자 길이, 빈공간의 오른쪽을 채울 것)
    -- rpad(substr(p_id, 7, 1), 7, '*'): '1'을 7자리로 만들건데 모자라는 부분을 *로 채움. 오른쪽에(lpad는 왼쪽에)
     v_id := substr(p_id, 1, 6) || '-' || rpad(substr(p_id, 7, 1), 7, '*'); 
    dbms_output.put_line(v_id);
end;
/
drop procedure yedam_ju;
/*
2.
사원번호를 입력할 경우
삭제하는 TEST_PRO 프로시저를 생성하시오.
단, 해당사원이 없는 경우 "해당사원이 없습니다." 출력
예) EXECUTE TEST_PRO(176)
*/
/*
procedure에서는 치환변수 사용안함.
객체로 등록할 때 치환변수 리터럴 값으로 등록됨
*/ 
drop procedure test_pro;

create procedure test_pro
(p_eid in employees.employee_id%type)
is
    
begin
    delete from employees
    where employee_id = p_eid;
    
    -- dml일 경우 sql%rowcount
    if sql%rowcount = 0 then
        dbms_output.put_line('해당사원이 없습니다');
    end if;
end;
/

declare
 v_eid employees.employee_id%type := &사원번호;
begin
    test_pro(v_eid);
end;
/
/*
3.
다음과 같이 PL/SQL 블록을 실행할 경우 
사원번호를 입력할 경우 사원의 이름(last_name)의 첫번째 글자를 제외하고는
'*'가 출력되도록 yedam_emp 프로시저를 생성하시오.

실행) EXECUTE yedam_emp(176)
실행결과) TAYLOR -> T*****  <- 이름 크기만큼 별표(*) 출력
*/
drop procedure yedam_emp;

create procedure yedam_emp
(p_eid in number)
is
    v_ename employees.last_name%type;
begin
    select last_name
    into v_ename
    from employees
    where employee_id = p_eid;
    
    -- \w: equivalent of [A-Za-z0-9_]
--    v_ename := substr(v_ename, 1, 1) || regexp_replace(substr(v_ename, 2), '\w', '*');
    v_ename := rpad(substr(v_ename, 1, 1), length(v_ename), '*');
    dbms_output.put_line(v_ename);
end;
/

declare
    v_eid employees.employee_id%type := &사원번호;
begin
    yedam_emp(v_eid);
end;
/
select * from employees;

/*
4.
부서번호를 입력할 경우 
해당부서에 근무하는 사원의 사원번호, 사원이름(last_name), 연차를 출력하는 get_emp 프로시저를 생성하시오. 
(cursor 사용해야 함)
단, 사원이 없을 경우 "해당 부서에는 사원이 없습니다."라고 출력(exception 사용)
실행) EXECUTE get_emp(30)
*/

select employee_id, last_name, to_char(sysdate, 'yyyy') - to_char(hire_date, 'yyyy') + 1 year_count
from employees
where department_id = 90;
        
select employee_id, last_name, hire_date
from employees
where department_id = 90;

drop procedure get_emp;

-- 연차: 들어온지 6갤 ex) 1년차
-- 경력: 개월수부터 시작 ex) 2년 3개월

update employees
set hire_date = '2010-10-22'
where employee_id = 202;

-- 들어온지 2년 4갤 ex) 3년차
-- trunc 내림
-- round 반올림
-- ceil 올림
select employee_id, hire_date, 
        months_between(sysdate, hire_date) 총개월수,
        ceil(months_between(sysdate, hire_date) / 12) 연차1, 
        trunc(months_between(sysdate, hire_date) / 12, 0) + 1 연차2, --위와 같음. trunc(a, b) b가 0: 소수점 표시x, 1: 소수점 첫째자리 절사, -1: 1단위 절사
        
        trunc(months_between(sysdate, hire_date) / 12, 0) 년, -- 경력
        mod(months_between(sysdate, hire_date), 12) 개월,
        round(mod(months_between(sysdate, hire_date), 12)) "개월(일수반올림)"        
from employees;

create procedure get_emp
(p_dept_id in employees.department_id%type)
is
    cursor emp_dept_cursor is
        select employee_id, last_name, ceil(months_between(sysdate, hire_date) / 12) year_count
        from employees
        where department_id = p_dept_id;
    
    v_emp_info emp_dept_cursor%rowtype;
    
    e_dept_found_fail exception;
        
begin
    open emp_dept_cursor;
    
    loop
        fetch emp_dept_cursor into v_emp_info;
            exit when emp_dept_cursor%notfound;
            
            dbms_output.put_line(v_emp_info.employee_id || ' ' || v_emp_info.last_name || ' ' || v_emp_info.year_count || '년차');
    end loop;
    
    if emp_dept_cursor%rowcount = 0 then
        raise e_dept_found_fail;
    end if;
    
    close emp_dept_cursor;
    
exception
    when e_dept_found_fail then
        dbms_output.put_line('해당 부서에는 사원이 없습니다.');
        -- 예외처리 이후에도 커서 닫아주면 좋음
        close emp_dept_cursor;
end;
/

declare
    v_dept_id employees.department_id%type := &부서번호;
begin
    get_emp(v_dept_id);
end;
/
select * from employees;

/*
5.
직원들의 사번, 급여 증가치만 입력하면 Employees테이블에 쉽게 사원의 급여를 갱신할 수 있는 y_update 프로시저를 작성하세요. 
만약 입력한 사원이 없는 경우에는 ‘No search employee!!’라는 메시지를 출력하세요.(예외처리)
실행) EXECUTE y_update(200, 10)
*/
drop procedure y_update;

create procedure y_update
(p_eid in employees.employee_id%type,
 p_raise_pct in number)
is
 
e_emp_not_found exception;
 
begin
    update employees
    set salary = salary + (salary * (p_raise_pct / 100))
    where employee_id = p_eid;
    
    if sql%rowcount = 0 then
        raise e_emp_not_found;
    end if;
 
exception
    when e_emp_not_found then
        dbms_output.put_line('No search employee!!');
end;
/

EXECUTE y_update(200, 10)

declare
    v_eid employees.employee_id%type := &사원번호;
    v_raise_pct number(2, 0) := &급여증가치;
begin
    y_update(v_eid, v_raise_pct);
end;
/

select * from employees;

 
