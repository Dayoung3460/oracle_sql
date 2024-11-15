CREATE TABLE `t_users`(
	`user_no` INT AUTO_INCREMENT PRIMARY KEY,
    `user_id` VARCHAR(100) NOT NULL, -- id를 pk로 설정하는 것 지양. 재가입이 허용되는 경우가 대부분이기 때문에 id를 유니크하게 만들 필요 없음
    `user_pwd` VARCHAR(100) NOT NULL,
    `user_name` VARCHAR(100) NOT NULL,
    `user_gender` CHAR(1) CHECK( user_gender IN ( 'M', 'F')),
    `user_age` INT,
    
    `join_date` DATE
);

-- 두개 같은 같 나옴
-- 성능 차이 있음.
-- now 더 많이 쓰긴함
select sysdate(); -- 호출할 때마다 시간 계산함. 로그 남기는 경우엔 이거 씀. 시간이 더 세밀하게 나옴. 밀리초까지
select now(); -- 한번 조회하면 'select now();'를 저장해놓고 다음에 갖다씀. 캐시같은 개념
select Date(now());
select Time(now());
select UNIX_TIMESTAMP();

-- data 대소문자 구분안함
-- 오라클에서는 lower, upper 시켜서 값 비교하는데 여기선 아님
-- 테이블, 컬럼에 백틱 사용하는게 흔함
insert into `t_users` (user_id, user_pwd, user_name, user_gender, user_age, join_date)
values('test3', 'pwd3', 'park', 'F', 1, Date(now()));

select * from t_users;

commit;