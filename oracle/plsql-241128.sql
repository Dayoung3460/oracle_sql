----------팡!---------function----------션!----------
/*
프로시저처럼 객체로 등록
return 구문이 있음(필수) -> 반환값 없는 처리를 할 땐 프로시저 사용
매개변수 모드는 in만 있음. return 구문 이용해서 반환할 수 있으니까
계산 용도로 많이 사용됨. dml 없을 때.

create function {함수명}
({매개변수} {매개변수 타입}) <- in mode만 사용하므로 in 생략
return {return type}
is
    {선언부}
begin
    {실행코드};
    return {리턴값};
exception
    when {예외 이름} then
        return {리턴값};
end;
/
*/

drop function test_func;

create function test_func
(p_msg varchar2)
return varchar2
is
    v_msg varchar2(1000) := 'hello ';
begin
    return (v_msg || p_msg);
exception
    when no_data_found then
        return 'no_data_found';
end;
/

declare
    v_return varchar2(100);
begin
    -- 함수는 걍 실행만 못함. 리턴값을 꼭 변수에 할당해야함
--    'TEST_FUNC' is not a procedure or is undefined
--    test_func('world');

    v_return := test_func('world');
    dbms_output.put_line(v_return);
end;
/

select test_func('pl/sql')
from dual;

drop function plus_func;

create function plus_func
(p_num1 number, -- sql이 인지하는 데이터만 가능.(boolean, record, table x, char, date, number만 가능)
p_num2 number)
return number
is
begin
    return p_num1 + p_num2;
end;
/

select plus_func(122, 23)
from dual;

/*
- view로 셀렉트문 등록하는 것 처럼 성능향상, 유지관리 향상 위해.
- 데이터 보안, 무결성 향상도.
*/

-- 사원번호와 해당 사원의 직속상사 이름 출력

select * from employees;

drop function mname_func;

create function mname_func
(p_eid employees.employee_id%type)
return varchar2
is
    v_mname employees.last_name%type;
begin
    select m.last_name
    into v_mname
    from employees e join employees m
        on e.manager_id = m.employee_id
    where e.employee_id = p_eid;
    
    return v_mname;
end;
/

select employee_id, mname_func(employee_id)
from employees;

select name, text
from user_source
where type in ('PROCEDURE', 'FUNCTION');

/*
1.
사원번호를 입력하면 
last_name + first_name 이 출력되는 
y_yedam 함수를 생성하시오.

실행) EXECUTE DBMS_OUTPUT.PUT_LINE(y_yedam(174))
출력 예)  Abel Ellen

SELECT employee_id, y_yedam(employee_id)
FROM   employees;
*/

create function y_yedam
(p_eid employees.employee_id%type)
return varchar2
IS
    v_e_full_name varchar2(50);
BEGIN
    select (last_name || ' ' || first_name) full_name
    into v_e_full_name
    from employees
    where employee_id = p_eid;
    
    return v_e_full_name;
END;
/

/*
2.
사원번호를 입력할 경우 다음 조건을 만족하는 결과가 출력되는 ydinc 함수를 생성하시오.
- 급여가 5000 이하이면 20% 인상된 급여 출력
- 급여가 10000 이하이면 15% 인상된 급여 출력
- 급여가 20000 이하이면 10% 인상된 급여 출력
- 급여가 20000 초과이면 급여 그대로 출력
실행) SELECT last_name, salary, YDINC(employee_id)
     FROM   employees; 
*/

drop function ydinc;

CREATE FUNCTION ydinc
(p_eid employees.employee_id%type)
return number
IS
    v_sal employees.salary%type;
    v_raise number(2, 0);
BEGIN
    select salary
    into v_sal
    from employees
    where employee_id = p_eid;
    
    if v_sal < 5000 then
        v_raise := 20;
    elsif v_sal < 10000 then
        v_raise := 15;
    elsif v_sal < 20000 then
        v_raise := 10;
    else
        v_raise := 0;
    end if;
    
    return v_sal + v_sal * v_raise / 100;
END;
/
/*
3.
사원번호를 입력하면 해당 사원의 연봉이 출력되는 yd_func 함수를 생성하시오.
->연봉계산 : (급여+(급여*인센티브퍼센트))*12
실행) SELECT last_name, salary, YD_FUNC(employee_id)
     FROM   employees;  
*/

drop function yd_func;

CREATE FUNCTION yd_func
(p_eid employees.employee_id%type)
return number
IS
    v_annual_sal number(10, 0);
BEGIN
    select (nvl(salary, 0)+(nvl(salary, 0)*nvl(commission_pct, 0)))*12 
    into v_annual_sal
    from employees
    where employee_id = p_eid;
    
    return v_annual_sal;
END;
/

CREATE VIEW emp_above_avg_sal AS
SELECT last_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

select * from emp_above_avg_sal;
select * from employees;

select avg(salary)
from employees;






------------------------------평가----------------------------------

-- 2.
DECLARE
    v_dname departments.department_name%type;
    v_job_id employees.job_id%type;
    v_sal employees.salary%type;
    v_annul_sal number(10, 0);
BEGIN
    select d.department_name, e.job_id, e.salary, (nvl(e.salary, 0)+(nvl(e.salary, 0)*nvl(e.commission_pct, 0)))*12 
    into v_dname, v_job_id, v_sal, v_annul_sal
    from employees e join departments d
        on (e.department_id = d.department_id)
    where employee_id = &사원번호;
    
    dbms_output.put_line(v_dname || ' ' || v_job_id || ' ' || v_sal || ' ' || v_annul_sal);
END;
/

-- 3.
DECLARE
    v_hiredate employees.hire_date%type;
    
    -- 'Career employee'로 초기화
    v_emp varchar2(20) := 'Career employee';
BEGIN
    select hire_date
    into v_hiredate
    from employees
    where employee_id = &사원번호;
    
    if to_char(v_hiredate, 'yyyy') > '2015' then
        v_emp := 'New employee';
    end if;
    
    dbms_output.put_line(v_emp);
END;
/

-- 4.

DECLARE
    v_dan number(2, 0) := 1;
    v_num number(2, 0) := 1;
    v_last_num constant number(1, 0) := 9;
BEGIN
    for dan in v_dan .. v_last_num loop
    
        if mod(dan, 2) = 1 then
            for num in v_num .. v_last_num loop
                dbms_output.put(v_dan || 'x' || v_num || '=' || v_dan * v_num || ' ');
                v_num := v_num + 1;
            end loop;
        end if;    

        dbms_output.put_line(' ');
        v_dan := v_dan + 1;
        v_num := 1;
     end loop;
END;
/

-- 5.
DECLARE
    cursor emp_cursor is
        select employee_id, last_name, salary
        from employees
        where department_id = &부서번호;
    
    v_emp_rec emp_cursor%rowtype;
BEGIN
    open emp_cursor;
    
    loop
        fetch emp_cursor into v_emp_rec;
            exit when emp_cursor%notfound;
            dbms_output.put_line(v_emp_rec.employee_id || ' ' || v_emp_rec.last_name || ' ' || v_emp_rec.salary);
    end loop;
    
    close emp_cursor;
END;
/


-- 6.

CREATE PROCEDURE emp_pro
(p_eid in employees.employee_id%type,
p_raise_pct in number)
IS
    e_emp_not_found exception;
BEGIN
    update employees
    set salary = salary + (salary * (p_raise_pct / 100))
    where employee_id = p_eid;
    
    if sql%rowcount = 0 then
        raise e_emp_not_found;
    end if;
 
EXCEPTION
    when e_emp_not_found then
        dbms_output.put_line('No search employee!!');
END;
/

EXECUTE emp_pro(202, 10);

-- 7.
drop procedure info_pro;

CREATE PROCEDURE info_pro
(p_ssn in varchar2)
IS
    v_age number(3, 0);
    v_gender varchar2(10);
BEGIN
    -- 주민번호 첫째자리가 0~2 일 때 2000년대생
    if substr(p_ssn, 1, 1) <= '2' then
        v_age := months_between(sysdate, to_date(substr(p_ssn, 1, 6), 'yymmdd')) / 12;
        
    -- 주민번호 첫째자리가 3~9 일 때 1900년대생
    else
        v_age := months_between(sysdate, to_date('19' || substr(p_ssn, 1, 6), 'yyyymmdd')) / 12;
    end if;
    
    if substr(p_ssn, 7, 1) = 1 then
        v_gender := '남';
    elsif substr(p_ssn, 7, 1) = 3 then
        v_gender := '남';
    else 
        -- 주민번호 뒷자리 첫째자리가 2, 4일 때 여성
        v_gender := '여';
    end if;
    
    dbms_output.put_line('만' || v_age || '세' || ' ' || v_gender);
    
END;
/
EXECUTE info_pro('9811022234567');

-- 8.

CREATE FUNCTION get_year
(p_eid employees.employee_id%type)
return number
IS
    v_year number(3, 0);
BEGIN
    -- (개월수/12)로 연차를 구하고 소수점(일수) 버리기
    select trunc(months_between(sysdate, hire_date) / 12, 0)
    into v_year
    from employees
    where employee_id = p_eid;
    
    return v_year;
END;
/

select hire_date, get_year(employee_id)
from employees;

-- 9.

CREATE FUNCTION get_mname
(p_dname departments.department_name%type)
return varchar2
IS
    d_mname employees.last_name%type;
BEGIN
    select (select e.last_name
            from employees e
            where e.employee_id = d.manager_id) m_name
    into d_mname
    from departments d
    where department_name = p_dname;
    
    return d_mname;
END;
/

select get_mname('Sales')
from dual;

-- 10.
select name, text
from user_source
where type in ('PROCEDURE', 'FUNCTION', 'PACKAGE', 'PACKAGE BODY');

-- 11.

DECLARE
    v_hypen varchar2(100):= '';
    v_star varchar2(100) := '';
    v_line number(1, 0) := 9;
BEGIN
    for line in 1 .. 9 loop
    
        for hypen in reverse 1 .. v_line loop
            v_hypen := v_hypen || '-';
        end loop;
        for star in v_line .. 9 loop
            v_star := v_star || '*';
        end loop;
        
        dbms_output.put_line(v_hypen || v_star);
        
        v_line := v_line - 1;
        v_hypen := '';
        v_star := '';
    end loop;
END;
/

