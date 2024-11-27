/*
조합 데이터: 여러값을 가질 수 있는 데이터 타입
 - 레코드: 내부에 필드를 가지는 데이터 구조. 데이터 조회 시 자주 사용
    * 필드는 상수로 정의x
    * 필드명 데이터타입 [not null] [:= default]
 - %rowtype
 - table type
 
declare
    -- 레코드 타입 정의
    type {레코드타입명} is record
        (필드명 데이터타입,
         필드명 데이터타입 := 초기값,
         필드명 데이터타입 not null := 초기값);
         
    변수명 레코드타입명;     
begin
    변수명.필드명 := 변경값;
    -- 변수명으로 한 번에 조회 불가
    dbms_output.put_line(변수명.필드명)
end;
/
*/

declare
-- record type definition
    type emp_record_type is record
        (empno number(6, 0),
        -- not null은 초기값과 같이 설정해줘야함
        ename employees.last_name%type not null := 'Hong',
        sal employees.salary%type := 0);
        
    -- 레코드 타입의 변수 선언
    v_emp_info emp_record_type; -- 출력할 때 사용하는 레코드
    v_emp_rec emp_record_type; -- 입력받을 값을 있는 레코드
begin
    dbms_output.put(v_emp_info.empno);
    dbms_output.put(', ' || v_emp_info.ename);
    dbms_output.put_line(', ' || v_emp_info.sal);
    
    v_emp_rec.empno := &사원번호;
    
    select employee_id, last_name, salary
    into v_emp_info -- 필드를 여러개 가지는 레코드. 필드순서 지켜야함. 레코드 타입 정의할 때 순서대로. 필드의 데이터타입이 다르면 값 할당 안됨. - numeric or value error
    from employees
    where employee_id = v_emp_rec.empno;
    
    dbms_output.put(v_emp_info.empno);
    dbms_output.put(', ' || v_emp_info.ename);
    dbms_output.put_line(', ' || v_emp_info.sal);
end;
/

/*
%rowtype: table 혹은 뷰의 한행을 record type으로 변환 -> 타입 정의없이 변수 선언으로 바로 사용
*/
DECLARE
-- 특정 테이블의 rowtype을 가져옴
    v_emp_rec employees%rowtype;
BEGIN
-- 아스타(*) 사용해야함. rowtype에 필드가 뭐가 들었는지 모르니까
    select * 
    into v_emp_rec
    from employees
    where employee_id = &사원번호;
    
    dbms_output.put_line(v_emp_rec.employee_id);
END;
/

/*
table type: 레코드와 결합하여 한 테이블에 들어있는 모든 데이터를 변수에 담아 가져올 수 있음
- 동일한 데이터 타입의 값을 여러개 가짐
- declare에서 초기화 불가
ex) 자주 select 하는 쿼리가 있어. 자꾸 select 하는 것보다 변수에 할당해놓고 재사용하는게 좋음. 자원 소모 줄임
ex) 변수는 메모리에 저장됨. 하드에서 뒤지는 것 보다 빠르고 좋지

인덱스(키, 정수 - 음수, 0 포함)를 사용함. 필드는 없음.
인덱스가 제각각임. 1씩 커지는거 아님. 동적으로 변함
java의 배열과 비슷한 형태 but, 크기 고정 x
인덱스의 데이터 타입은 pls_integer / binary_integer를 주로 사용함. 음수가 범위에 포함됨. 두 개 다 범위는 같은데 pls_integer가 검색 속도가 빠름.
2차 배열은 안됨.(테이블 안의 테이블 x)


declare
    type {table type name} is table of {data type}
        index of binary_integer;
        
    {변수명} {table type name};
begin
    변수명(index) := 초기값;
    dbms_output.put_line(변수명(인덱스));
end;
/
*/

declare
    type num_table_type is table of number
        index by binary_integer;
        
    v_num_info num_table_type;
begin
    -- 인덱스가 시작되는 값이 따로 없음
    -- 1000을 강제로 -10번 인덱스에 값을 넣음
    v_num_info(-10) := 1000;
    v_num_info(1111111111) := 12345;
    
    dbms_output.put_line(v_num_info(1111111111));
--    dbms_output.put_line(v_num_info(5)); -- no data found
end;
/

DECLARE
    type num_table_type is table of number
    index by binary_integer;
    
    v_num_info num_table_type;
    v_idx number;
BEGIN
    v_num_info(-23) := 1;
    v_num_info(-5) := 2;
    v_num_info(11) := 3;
    v_num_info(1121) := 4;
    
    -- table type이 가지고 있는 값 개수 - 4
    dbms_output.put_line('값 개수: ' || v_num_info.count);
--    
--    -- 인덱스의 최소 최대값 가져와서 for looping
--    for idx in v_num_info.first .. v_num_info.last loop
--        if v_num_info.exists(idx) then
--            dbms_output.put_line(v_num_info(idx));
--        end if;   
--    end loop;
    
    -- 실제 값만 검색하기
    v_idx := v_num_info.first;
    loop
        dbms_output.put_line(v_num_info(v_idx));
        
        exit when v_num_info.last <= v_idx;
        v_idx := v_num_info.next(v_idx);
    end loop;
END;
/

-- count(*) null 포함
-- count(commission_pct) commission_pct이 널이면 포함 안함
select count(*), count(commission_pct)
from employees;

-- 빈 테이블이라 둘 다 0 나옴
select count(*), count(commission_pct)
from employees
where employee_id = 0;


-- 지양해야할 코드.
-- 사원 한 명 조회하려면 select를 두번이나 타야됨
DECLARE
    type emp_table_type is table of employees%rowtype
        index by binary_integer;
        
    v_emp_list emp_table_type;
    v_emp_rec employees%rowtype;
    
    v_min employees.employee_id%type;
    v_max v_min%type;
    
    v_count number;
BEGIN
-- employee_id 최소, 최대값
    select min(employee_id), max(employee_id)
    into v_min, v_max
    from employees;

-- table 조회
-- min과 max 사이에 사원 아이디 없는 경우 있음(NO_DATA_FOUND 예외)
    for eid in v_min .. v_max loop
        select count(*)
        into v_count
        from employees
        where employee_id = eid;
        
        -- 해당 사원번호 기준 데이터가 없는 경우 다음 조건으로
        continue when v_count = 0;
    
        select *
        into v_emp_rec
        from employees
        where employee_id = eid;
    
        v_emp_list(eid) := v_emp_rec;
    end loop;
    
    -- 테이블 타입의 데이터 조회
    for idx in v_emp_list.first .. v_emp_list.last loop
        if v_emp_list.exists(idx) then
            -- 해당 인덱스에 데이터가 있는 경우
            dbms_output.put(v_emp_list(idx).employee_id);
            dbms_output.put(', ' || v_emp_list(idx).last_name);
            dbms_output.put_line(', ' || v_emp_list(idx).salary);
            
            -- row를 통째로 가지고 올 수 없음 필드로 조회해야함
--            dbms_output.put_line(v_emp_list(idx));
        end if;
    end loop;

END;
/


/*
명시적 커서: 둘 이상의 행을 반환하는 질의에 대해 선언(다중행 select문)
    한 건만 가져오는 경우엔 사용하지마 비효율적임
    직접 선언하고 이름 지정.
활성집합: 커서가 가지고 있는 데이터를 display 시킨 데이터들
명시적 커서는 활성집합에서 현재 위치를 가리킴
내가 필요한 행을 커서를 움직여서 가리킴
포인터와 비슷한... 
명시적 커서는 행을 아래로만 내릴 수 있음. 못 올라감
활성집합 소멸 시키고 다시 open 해서 내려가야함

open: 커서 실행 -> 활성집합 식별(생성)
    포인터의 위치를 활성 집합의 첫 번째 행 앞으로 지정(첫번째 데이터보다 위에)
fetch into: 포인터를 이동시킴(첫번째 행으로 이동)
    포인터 가리킨 데이터를 into 뒤의 변수에 할당
    현재 가리키는 데이터 인출
close: 활성집합(결과) 소멸. 메모리에 있는 데이터 삭제. 커서 닫음.
    close 안하면 계속 해당 메모리를 잡고 있음(비효율)

1. declare
2. open
3. fetch
4. close

DECLARE
    cursor {커서명} is
        select문(sql의 select문. into x)
BEGIN
    open {커서명};
    fetch {커서명} into {변수};
    close {커서명}
END;
/
*/

DECLARE
    cursor emp_cursor is
        select employee_id, last_name, hire_date
        from employees;
    
    -- fetch into에 사용할 변수
    -- 커서의 select절 컬럼 구성 만큼 필요
    v_eid employees.employee_id%type;
    v_ename employees.last_name%type;
    v_hdate employees.hire_date%type;
BEGIN
    open emp_cursor;
    
    -- 첫번째 행의 데이터들이 변수에 할당됨. 순서대로
    -- 포인터를 한번만 실행(이동)함.
    fetch emp_cursor into v_eid, v_ename, v_hdate;
    
    dbms_output.put_line(v_eid || ', ' || v_ename || ', ' || v_hdate);
    
    close emp_cursor;

END;
/

DECLARE
    cursor emp_cursor is
        select employee_id, last_name, hire_date
        from employees;
    
    v_eid employees.employee_id%type;
    v_ename employees.last_name%type;
    v_hdate employees.hire_date%type;
BEGIN
    open emp_cursor;
    
    -- 활성집합의 모든 데이터 출력
    loop
        fetch emp_cursor into v_eid, v_ename, v_hdate;
        
        -- %notfound: 새로운 데이터가 없으면 true
        -- 결과가 없는경우 에러가 나지 않고 또 마지막 행을 가리키기 때문에 fetch후에 바로 체크 해줘야함
        exit when emp_cursor%notfound;
        
        -- %rowcount: fetch를 실행해서 가져온 행수
        dbms_output.put_line(emp_cursor%rowcount);
        dbms_output.put_line(v_eid || ', ' || v_ename || ', ' || v_hdate);
    end loop;
    
    -- error: cursor already open 오픈된 상태에서 같은 커서 또 오픈 불가
--    open emp_cursor;

    -- cursor 실행 여부 체크
    if not emp_cursor%isopen then
--    if emp_cursor%isopen = false then
        open emp_cursor;
    end if;
    
    -- 마지막 v_eid가 출력됨
    dbms_output.put_line(v_eid);
    close emp_cursor;
    
    -- error: invalid cursor 이미 close했는데 뭘 또 접근하냐
--    dbms_output.put_line(emp_cursor%rowcount);

END;
/

-- 특정 부서에 속한 사원의 사원번호, 이름, 업무 출력
DECLARE
    cursor emp_of_dept_cursor is
        select employee_id, last_name, job_id
        from employees
        where department_id = &부서번호;
    
    v_eid employees.employee_id%type;
    v_ename employees.last_name%type;
    v_jobid employees.job_id%type;

BEGIN
    open emp_of_dept_cursor;
    
    loop
        fetch emp_of_dept_cursor into v_eid, v_ename, v_jobid;
        exit when emp_of_dept_cursor%notfound;
        
        -- loop 문 내 유동값. 현재 반환된 데이터 개수
        dbms_output.put_line(emp_of_dept_cursor%rowcount);
        dbms_output.put_line(v_eid || ' ' || v_ename || ' ' || v_jobid);
    end loop;
    
    -- 커서의 총 데이터 개수
    if emp_of_dept_cursor%rowcount = 0 then
        dbms_output.put_line('not data');
    end if;
    
    close emp_of_dept_cursor;
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
        
    v_eid employees.employee_id%type;
    v_ename employees.last_name%type;
    v_hdate employees.hire_date%type;
BEGIN
    open emp_by_hdate_cursor;
    
    loop
        fetch emp_by_hdate_cursor into v_eid, v_ename, v_hdate;
        exit when emp_by_hdate_cursor%notfound;
        
        if v_hdate <= to_date('2025-01-01') then
            insert into test01 (empid, ename, hiredate)
            values (v_eid, v_ename, v_hdate);
        else
            insert into test02 (empid, ename, hiredate)
            values (v_eid, v_ename, v_hdate);
        end if;
        
    end loop;
    
    close emp_by_hdate_cursor;
END;
/

DECLARE
    cursor emp_by_hdate_cursor is
        select employee_id, last_name, hire_date
        from employees;
    
    type emp_record_type is record
        (eid employees.employee_id%type,
        ename employees.last_name%type,
        hdate employees.hire_date%type);
        
    v_emp_info emp_record_type;
BEGIN
    open emp_by_hdate_cursor;
    
    loop
        fetch emp_by_hdate_cursor into v_emp_info;
        exit when emp_by_hdate_cursor%notfound;
        
        if v_emp_info.hdate <= to_date('2025-01-01') then
            insert into test01
            values v_emp_info;
        else
            insert into test02
            values v_emp_info;
        end if;
        
    end loop;
    
    close emp_by_hdate_cursor;
END;
/

select * from test01;
select * from test02;
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
/*
2.
부서번호를 입력할 경우(&치환변수 사용)
해당하는 부서의 사원이름, 입사일자, 부서명을 출력하시오.
*/

DECLARE
    v_dept_id_input employees.department_id%type := &부서번호;
    
    cursor EMP_BY_HDATE_CURSOR is
        select e.employee_id, e.hire_date, d.department_name
        from employees e join departments d
        on e.department_id = d.department_id
        where e.department_id = v_dept_id_input;
    
    v_eid employees.employee_id%type;
    v_hdate employees.hire_date%type;
    v_dept_name departments.department_name%type;
BEGIN
    open EMP_BY_HDATE_CURSOR;
    
    loop 
        fetch EMP_BY_HDATE_CURSOR into v_eid, v_hdate, v_dept_name;
        exit when emp_by_hdate_cursor%notfound;
        
        dbms_output.put_line(v_eid || ' ' || v_hdate || ' ' || v_dept_name);
    end loop;
    
    close EMP_BY_HDATE_CURSOR;
END;
/

DECLARE
    v_dept_id_input employees.department_id%type := &부서번호;
    
    cursor EMP_BY_HDATE_CURSOR is
        select e.employee_id, e.hire_date, d.department_name
        from employees e join departments d
        on e.department_id = d.department_id
        where e.department_id = v_dept_id_input;
        
    type emp_record_type is record
        (eid employees.employee_id%type,
        hdate employees.hire_date%type,
        dept_name departments.department_name%type);
        
    v_emp_info emp_record_type;
    
BEGIN
    open EMP_BY_HDATE_CURSOR;
    
    loop 
        fetch EMP_BY_HDATE_CURSOR into v_emp_info;
        exit when emp_by_hdate_cursor%notfound;
        
        dbms_output.put_line(v_emp_info.eid || ' ' || v_emp_info.hdate || ' ' || v_emp_info.dept_name);
    end loop;
    
    close EMP_BY_HDATE_CURSOR;
END;
/

DECLARE
    cursor EMP_BY_HDATE_CURSOR is
        select e.employee_id, e.hire_date, d.department_name
        from employees e join departments d
        on e.department_id = d.department_id
        where e.department_id = &부서번호;
    
    emp_record_type EMP_BY_HDATE_CURSOR%rowtype;
    
BEGIN
    open EMP_BY_HDATE_CURSOR;
    
    loop 
        fetch EMP_BY_HDATE_CURSOR into emp_record_type;
        exit when emp_by_hdate_cursor%notfound;
        
        dbms_output.put_line(emp_record_type.employee_id || ' ' || emp_record_type.hire_date || ' ' || emp_record_type.department_name);
    end loop;
    
    close EMP_BY_HDATE_CURSOR;
END;
/

/*
3.
부서번호를 입력(&사용)할 경우 
사원이름, 급여, 연봉->(급여*12+(급여*nvl(커미션퍼센트,0)*12))
을 출력하는  PL/SQL을 작성하시오.
*/

DECLARE
    v_dept_id_input employees.department_id%type := &부서번호;
    
    cursor emp_salary_cursor is
        select last_name, salary, (salary*12+(salary*nvl(commission_pct,0)*12)) salary_year
        from employees
        where v_dept_id_input = department_id;
    
    v_ename employees.last_name%type;
    v_salary employees.salary%type;
    v_salary_year number;
    
BEGIN
    open emp_salary_cursor;
    
    loop 
        fetch emp_salary_cursor into v_ename, v_salary, v_salary_year;
        exit when emp_salary_cursor%notfound;
      
        dbms_output.put_line(v_ename || ' ' || v_salary || ' ' || v_salary_year);
    end loop;
    
    close emp_salary_cursor;

END;
/

DECLARE
    cursor emp_salary_cursor is
        select last_name, salary, commission_pct
        from employees
        where &부서번호 = department_id;
    
    -- cursor의 select절 기반으로 rowtype을 가져오는거 - record
    v_emp_rec emp_salary_cursor%rowtype;
    v_year number(10, 2);
BEGIN
    open emp_salary_cursor;
    
    loop 
        fetch emp_salary_cursor into v_emp_rec;
        exit when emp_salary_cursor%notfound;
        
        v_year := (v_emp_rec.salary*12+(v_emp_rec.salary*nvl(v_emp_rec.commission_pct,0)*12));
      
        dbms_output.put_line(v_emp_rec.last_name || ' ' || v_emp_rec.salary || ' ' || v_year);
    end loop;
    
    close emp_salary_cursor;

END;
/


DECLARE
    cursor emp_salary_cursor is
        select last_name, salary, (salary*12+(salary*nvl(commission_pct,0)*12)) salary_year
        from employees
        where department_id = &부서번호;
        
    v_emp_rec emp_salary_cursor%rowtype;
BEGIN
    open emp_salary_cursor;
    
    loop 
        fetch emp_salary_cursor into v_emp_rec;
        exit when emp_salary_cursor%notfound;
      
        dbms_output.put_line(v_emp_rec.last_name || ' ' || v_emp_rec.salary || ' ' || v_emp_rec.salary_year);
    end loop;
    
    close emp_salary_cursor;

END;
/
