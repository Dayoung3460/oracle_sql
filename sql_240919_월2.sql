commit;

select * from copy_emp;

select salary
from copy_emp
where employee_id = 176;

update copy_emp
set salary = 8888
where employee_id = 176;

-- ddl이기 때문에 자동 커밋
-- 다른 사용자에게 지금까지의 데이터 업데이트가 적용됨
-- 다른 사용자에서 salary select해보면 8888로 변경되어 있음
create table aa (
    a number(3));