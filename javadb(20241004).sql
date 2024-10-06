-- javadb에서 실행하기

create table boards(bno number primary key,
                    btitle varchar2(100) not null,
                    bcontent varchar2(1000) not null,
                    bwriter varchar2(50) not null,
                    bdate date default sysdate);
                    
create sequence seq_bno nocache;                    

-- 오라클 jdbc 드라이버
--C:\oraclexe\app\oracle\product\11.2.0\server\jdbc\lib\ojdbc6.jar
-- 이클립스 루트폴더 바로 밑에 lib폴더 만들고 그 안에 복붙
-- ojdbc6.jar 오른쪽 마우스 클릭 > build path > 첫번째꺼 클릭
-- Referenced Libraries 파일 생기고 안에 자르파일에 있던 것들 주루룩 들어있음

create table book(title varchar2(50) not null,
                  writer varchar2(50) not null,
                  price number not null,
                  bnum varchar2(50) not null);

-- 오라클 디비 버전 확인
SELECT * FROM v$version;
SELECT banner FROM v$version WHERE banner LIKE 'Oracle%';
