--------------------------------------------------------
--  파일이 생성됨 - 금요일-11월-08-2024   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence BOARD_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JAVA"."BOARD_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1301 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BOOK_OPTION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JAVA"."BOOK_OPTION_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BOOK_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JAVA"."BOOK_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 241 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence HWAN_TEST
--------------------------------------------------------

   CREATE SEQUENCE  "JAVA"."HWAN_TEST"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REPLY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "JAVA"."REPLY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1181 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_BNO
--------------------------------------------------------

   CREATE SEQUENCE  "JAVA"."SEQ_BNO"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 10 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence SEQ_BUY
--------------------------------------------------------

   CREATE SEQUENCE  "JAVA"."SEQ_BUY"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "JAVA"."BOARD" 
   (	"BOARD_NO" NUMBER, 
	"BOARD_CATEGORY" VARCHAR2(40 BYTE), 
	"BOOK_NO" VARCHAR2(40 BYTE), 
	"SECRET_FLAG" NUMBER DEFAULT 0, 
	"TITLE" VARCHAR2(200 BYTE), 
	"CONTENT" VARCHAR2(1000 BYTE), 
	"NOTICE_FLAG" NUMBER DEFAULT 0, 
	"BOARD_FILE" VARCHAR2(40 BYTE), 
	"WRITER" VARCHAR2(40 BYTE), 
	"VIEW_CNT" NUMBER DEFAULT 0, 
	"WRITE_DATE" DATE DEFAULT sysdate, 
	"REPLY_NO" NUMBER, 
	"BOARD_PW" VARCHAR2(10 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BOARDS
--------------------------------------------------------

  CREATE TABLE "JAVA"."BOARDS" 
   (	"BNO" NUMBER, 
	"BTITLE" VARCHAR2(100 BYTE), 
	"CONTENT" VARCHAR2(1000 BYTE), 
	"BWRITER" VARCHAR2(50 BYTE), 
	"BDATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table BOOK
--------------------------------------------------------

  CREATE TABLE "JAVA"."BOOK" 
   (	"TITLE" VARCHAR2(50 BYTE), 
	"WRITER" VARCHAR2(50 BYTE), 
	"PRICE" NUMBER, 
	"BNUM" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table EMPLOYEE
--------------------------------------------------------

  CREATE TABLE "JAVA"."EMPLOYEE" 
   (	"EMPLOYEE_ID" VARCHAR2(50 BYTE), 
	"EMPLOYEE_NAME" VARCHAR2(50 BYTE), 
	"PHONE" VARCHAR2(50 BYTE), 
	"HIRE_DATE" DATE DEFAULT sysdate, 
	"SALARY" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "JAVA"."MEMBER" 
   (	"MEMBER_ID" VARCHAR2(40 BYTE), 
	"PASSWORD" VARCHAR2(40 BYTE), 
	"MEMBER_NAME" VARCHAR2(40 BYTE), 
	"ADDRESS" VARCHAR2(1000 BYTE), 
	"EMAIL" VARCHAR2(40 BYTE), 
	"TEL" VARCHAR2(40 BYTE), 
	"JOINED_DATE" DATE DEFAULT sysdate, 
	"PERMISSION" VARCHAR2(40 BYTE) DEFAULT 'user', 
	"QUIT" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table PRODUCT_TBL
--------------------------------------------------------

  CREATE TABLE "JAVA"."PRODUCT_TBL" 
   (	"PRD_CODE" CHAR(4 BYTE), 
	"PRD_NAME" VARCHAR2(100 BYTE), 
	"PRD_DESC" VARCHAR2(1000 BYTE), 
	"ORIGIN_PRICE" NUMBER, 
	"SALE_PRICE" NUMBER, 
	"STAR_POINT" NUMBER, 
	"PROD_IMAGE" VARCHAR2(100 BYTE), 
	"CREATION_DATE" DATE DEFAULT sysdate --생성일자.

   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SITE
--------------------------------------------------------

  CREATE TABLE "JAVA"."SITE" 
   (	"SITE_NO" NUMBER, 
	"SITE_NAME" VARCHAR2(40 BYTE), 
	"CATEGORY" VARCHAR2(20 BYTE), 
	"SITE_MAX" NUMBER DEFAULT 2, 
	"SITE_PRICE" NUMBER DEFAULT 0, 
	"USE_FLAG" VARCHAR2(10 BYTE) DEFAULT 'y'
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SITE_BOOK
--------------------------------------------------------

  CREATE TABLE "JAVA"."SITE_BOOK" 
   (	"BOOK_NO" NUMBER, 
	"MEMBER_ID" VARCHAR2(40 BYTE), 
	"SITE_NO" NUMBER, 
	"MEM_CNT" NUMBER DEFAULT 2, 
	"START_DATE" VARCHAR2(40 BYTE), 
	"END_DATE" VARCHAR2(40 BYTE), 
	"CAR_NUM" VARCHAR2(40 BYTE), 
	"TOTAL_PRICE" NUMBER DEFAULT 0, 
	"REVIEW_FLAG" NUMBER DEFAULT 0, 
	"CANCEL_FLAG" NUMBER DEFAULT 0, 
	"CREATE_DATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SITE_BOOK_OPTION
--------------------------------------------------------

  CREATE TABLE "JAVA"."SITE_BOOK_OPTION" 
   (	"OPTION_NO" NUMBER, 
	"BOOK_NO" NUMBER, 
	"MEMBER_ID" VARCHAR2(40 BYTE), 
	"SITE_NO" NUMBER
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table SITE_OPTION
--------------------------------------------------------

  CREATE TABLE "JAVA"."SITE_OPTION" 
   (	"OPTION_NO" NUMBER, 
	"OPTION_NAME" VARCHAR2(200 BYTE), 
	"OPTION_PRICE" NUMBER DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_BOARD
--------------------------------------------------------

  CREATE TABLE "JAVA"."TBL_BOARD" 
   (	"BOARD_NO" NUMBER, 
	"TITLE" VARCHAR2(100 BYTE), 
	"CONTENT" VARCHAR2(1000 BYTE), 
	"WRITER" VARCHAR2(50 BYTE), 
	"VIEW_CNT" NUMBER DEFAULT 0, 
	"WRITE_DATE" DATE DEFAULT sysdate, 
	"UPDATE_DATE" DATE DEFAULT sysdate -- 최종수정일
, 
	"IMG" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_BUY
--------------------------------------------------------

  CREATE TABLE "JAVA"."TBL_BUY" 
   (	"BUY_DATE" DATE DEFAULT sysdate, 
	"BUY_TYPE" VARCHAR2(50 BYTE), 
	"BUY_NAME" VARCHAR2(50 BYTE), 
	"BUY_QUAN" NUMBER(10,0), 
	"BUY_CAUTION" VARCHAR2(50 BYTE), 
	"BUY_NO" NUMBER(5,0)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_BUY_LIST
--------------------------------------------------------

  CREATE TABLE "JAVA"."TBL_BUY_LIST" 
   (	"LIST_NAME" VARCHAR2(50 BYTE), 
	"BUY_DATE" DATE DEFAULT sysdate, 
	"COP_NAME" VARCHAR2(50 BYTE), 
	"STO_TYPE" VARCHAR2(50 BYTE), 
	"BUY_QUAN" NUMBER(5,0), 
	"CONTENT" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_CARE_LIST
--------------------------------------------------------

  CREATE TABLE "JAVA"."TBL_CARE_LIST" 
   (	"CARE_NO" VARCHAR2(50 BYTE), 
	"CARE_DATE" DATE DEFAULT sysdate, 
	"P_ID" VARCHAR2(50 BYTE), 
	"STO_TYPE" VARCHAR2(50 BYTE), 
	"SELL_QUAN" NUMBER(5,0), 
	"CONS_ID" VARCHAR2(50 BYTE), 
	"CONTENT" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_CONSULT
--------------------------------------------------------

  CREATE TABLE "JAVA"."TBL_CONSULT" 
   (	"CONS_DATE" DATE DEFAULT sysdate, 
	"CONS_ID" VARCHAR2(50 BYTE), 
	"P_ID" VARCHAR2(50 BYTE), 
	"ANI_NAME" VARCHAR2(50 BYTE), 
	"ANI_TYPE" VARCHAR2(50 BYTE), 
	"CONS_CONTENT" VARCHAR2(50 BYTE), 
	"CONS_PRESCRIPTION" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_EVENT
--------------------------------------------------------

  CREATE TABLE "JAVA"."TBL_EVENT" 
   (	"TITLE" VARCHAR2(1000 BYTE), 
	"START_DATE" VARCHAR2(20 BYTE), 
	"END" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_MEMBER
--------------------------------------------------------

  CREATE TABLE "JAVA"."TBL_MEMBER" 
   (	"MEMBER_ID" VARCHAR2(30 BYTE), 
	"PASSWORD" VARCHAR2(30 BYTE), 
	"MEMBER_NAME" VARCHAR2(30 BYTE), 
	"PHONE" VARCHAR2(20 BYTE), 
	"RESPONSIBILITY" VARCHAR2(10 BYTE) DEFAULT 'User', 
	"CREATION_DATE" DATE DEFAULT sysdate --데이터생성 시점저장.

   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_PERSON
--------------------------------------------------------

  CREATE TABLE "JAVA"."TBL_PERSON" 
   (	"P_ID" VARCHAR2(50 BYTE), 
	"P_NAME" VARCHAR2(50 BYTE), 
	"P_AGE" VARCHAR2(50 BYTE), 
	"P_PHONE" VARCHAR2(50 BYTE), 
	"P_HOME" VARCHAR2(50 BYTE), 
	"P_ANIMALS" VARCHAR2(50 BYTE), 
	"P_DATE" DATE DEFAULT sysdate, 
	"PW" VARCHAR2(50 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_REPLY
--------------------------------------------------------

  CREATE TABLE "JAVA"."TBL_REPLY" 
   (	"REPLY_NO" NUMBER, 
	"REPLY" VARCHAR2(1000 BYTE), 
	"REPLYER" VARCHAR2(30 BYTE), 
	"BOARD_NO" NUMBER, 
	"REPLY_DATE" DATE DEFAULT sysdate
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table TBL_STORAGE
--------------------------------------------------------

  CREATE TABLE "JAVA"."TBL_STORAGE" 
   (	"STO_TYPE" VARCHAR2(50 BYTE), 
	"STO_QUAN" NUMBER(10,0) DEFAULT 0, 
	"STO_SELL" NUMBER(10,0) DEFAULT 0, 
	"STO_NOW" NUMBER(10,0) DEFAULT 0, 
	"STO_LOSS" NUMBER(10,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
REM INSERTING into JAVA.BOARD
SET DEFINE OFF;
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1025,'notice',null,0,'해변 진출입로 공사안내','추암해변 진출입로 포장공사로 인하여 6.24.~6.25 양일간 캠핑장 출입시 불편이 예상되오니 참조하시기 바랍니다.!',1,null,'admin',9,to_date('24/11/08','RR/MM/DD'),0,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1029,'notice',null,0,'2024년 해돋이 행사 공지','▣ 추암해변 신년 해맞이 행사현황


○ 일 시 : 2019.12.31(화) 18:00 ~ 2020.1.1(수) 09:00

    - 해뜨는 시각 : 07:38분 예상

○ 장 소 : 추암해변 광장일원

○ 주요 행사내용

    - 추암 케이크 트리 설치 : 1개소

    - 파티오 난로 해변설치 운영

    - 입체글자 조형물 포토존 설치

    - 촛대바위 다리 구간 아트조명 설치

    - 2020 새해 소망 기원판 운영 등',0,null,'admin',29,to_date('24/11/08','RR/MM/DD'),0,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1032,'notice',null,0,'캠핑장 온라인 예약 및 취소 방법 안내',' 첨부파일중 이미지미리보기',0,null,'admin',3,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1033,'notice',null,0,'코로나19관련 12/15 ~ 상황해제시 임시폐쇄 안내.','동해시 코로나19관련 다수 확진자 발생으로 인해 캠핑장 방역을 위해 12/15 ~ 상황해제시 임시 폐쇄하오니 양해바랍니다.

방역지침에 따라 기간이 연장될 수 있음을 안내드립니다.',0,null,'admin',3,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1034,'notice',null,0,'캠핑장 예약시간 공지사항','예약시간을 정오 12시로 바꾸는 과정에서 테스트 진행 결과 지속적으로 오류가 발생하고 있습니다.

예약시간 변경 시 더 많은 혼란과 불편을 드릴 것으로 판단하여 앞으로 예약시간은 기존대로 매월 1일 24시에 열릴 예정입니다.

이용에 불편을 드려 정말 죄송합니다.',0,null,'admin',62,to_date('24/11/08','RR/MM/DD'),0,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1035,'notice',null,0,'캠핑장 홍보촬영 협조 안내','
안녕하세요!

전북 특별한 관광지 영상콘텐츠 홍보영상 제작을 위해 웅포캠핑장 내에서 홍보 영상 촬영 예정에 있습니다.

촬영일시 : 11. 2. (토) 10 : 00 ~ 18 : 00
촬영장소 : 웅포캠핑장, 웅포곰개나루길
촬영내용 : 익산 홍보영상 스케치 및 드론(항공) 촬영',0,null,'admin',5,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1036,'notice',null,0,'무통장 환급 지연 안내','안녕하십니까

망상 오토 캠핑 리조트 입니다.

정부 프로그램 변경으로 인한 오류 발생으로 

2.5~2.18 무통장 취소분에 대하여

무통장 환급건이 지연되고 있습니다.

해당 기관 문의 결과 2.27(화) 환급 예정이며

2.19부터 발생되는 취소분은 정상적(취소후 15일 이내)으로 진행될 예정입니다.

환급 건이 늦어지게 된 점 다시 한번 사과드립니다.

죄송합니다.',0,null,'admin',4,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1037,'notice',null,0,'2024년 물놀이장 운영공지','어린이 물놀이장은 여름해수욕장 개장 시기에 맞춰 2024.07.10~08.18까지 운영 합니다.

운영시간은 11:00~18:00이며, 중간 1시간 용수 교체시간 있습니다.



이용수칙 관련

1. 입장시 워터슈즈만 착용가능합니다(크록스,슬리퍼X)

2. 튜브,물총,비누방울 사용금지

3. 물놀이장 주변 취식금지(주류 제외한 음료는 가능)

4. 소중한 우리 자녀의 안전을 위해 성인 이용 자재 및 뛰어다니기 금지!!

상기 사항 꼭 지켜주시고 안전한 물놀이를 위해 안전요원 지시에 따라주세요 

많이 이용해 주시기 바랍니다



※ 우천시 운영 중단 합니다. ',0,null,'admin',1,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1024,'notice',null,0,'2024년 인더숲캠핑장 이용만족도 설문조사 실시 안내','2024년 인더숲 캠핑장 이용만족도 설문조사 바로가기 >>>',0,null,'admin',8,to_date('24/10/24','RR/MM/DD'),0,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1042,'notice',null,0,'캠핑장 각종 벌레 해충 주의 요망 안내','우리 캠핑장은 산 속에 조성되어 각종 벌레, 산바퀴벌레 등 해충이 나타 날 수 있습니다. 

포충기와 정기적 방역 중이나 산속에 근본적 해결은 어려운 상황 입니다.

이점에 유의해 주시고 에프킬라, 모기향, 사전 준비해 캠핑을 즐겨주시기 바랍니다. ',0,null,'admin',2,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1043,'qna',null,0,'입실 시간 언제인가요??','입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1044,'qna',null,0,'드라이기 있나요??','헤어드라이기 있는지 궁금해요',0,null,'user02',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1045,'qna',null,0,'야외수영장은 몇 시에 오픈인가요','수영장 열리는 시간에 맞춰서 가려고요...',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1046,'qna',null,0,'휴무 있나요???','1월 1일에도 영업하나요??',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1047,'qna',null,1,'문의','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다.',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1048,'qna',null,0,'1월 1일에 여나요','연다면 입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1049,'qna',null,0,'화장실 위치','어딘가요????',0,null,'user02',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1050,'qna',null,0,'텐트 브랜드 문의','대여용 텐트가 어디 브랜드인가요',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1051,'qna',null,0,'내년 2월 예약 미리 가능한가요','내년 예약 미리 하고 싶습니다...',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1052,'qna',null,1,'물어볼 게 있습니다','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다........',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1053,'qna',null,0,'크리스마스에는 영업하나요','연다면 입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1054,'qna',null,0,'매점 있을까요','어디 있나요?? 뭐 파는지 알 수 있나요',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1055,'qna',null,0,'가격 문의','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다........',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1056,'qna',null,0,'2025년 예약가능여부','내년 예약 미리 하고 싶습니다...',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1059,'notice',null,0,'2024년 해돋이 행사 공지','▣ 추암해변 신년 해맞이 행사현황


○ 일 시 : 2019.12.31(화) 18:00 ~ 2020.1.1(수) 09:00

    - 해뜨는 시각 : 07:38분 예상

○ 장 소 : 추암해변 광장일원

○ 주요 행사내용

    - 추암 케이크 트리 설치 : 1개소

    - 파티오 난로 해변설치 운영

    - 입체글자 조형물 포토존 설치

    - 촛대바위 다리 구간 아트조명 설치

    - 2020 새해 소망 기원판 운영 등',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1060,'notice',null,0,'캠핑장 온라인 예약 및 취소 방법 안내',' 첨부파일중 이미지미리보기',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1061,'notice',null,0,'코로나19관련 12/15 ~ 상황해제시 임시폐쇄 안내.','동해시 코로나19관련 다수 확진자 발생으로 인해 캠핑장 방역을 위해 12/15 ~ 상황해제시 임시 폐쇄하오니 양해바랍니다.

방역지침에 따라 기간이 연장될 수 있음을 안내드립니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1062,'notice',null,0,'캠핑장 예약시간 공지사항','예약시간을 정오 12시로 바꾸는 과정에서 테스트 진행 결과 지속적으로 오류가 발생하고 있습니다.

예약시간 변경 시 더 많은 혼란과 불편을 드릴 것으로 판단하여 앞으로 예약시간은 기존대로 매월 1일 24시에 열릴 예정입니다.

이용에 불편을 드려 정말 죄송합니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1063,'notice',null,0,'캠핑장 홍보촬영 협조 안내','
안녕하세요!

전북 특별한 관광지 영상콘텐츠 홍보영상 제작을 위해 웅포캠핑장 내에서 홍보 영상 촬영 예정에 있습니다.

촬영일시 : 11. 2. (토) 10 : 00 ~ 18 : 00
촬영장소 : 웅포캠핑장, 웅포곰개나루길
촬영내용 : 익산 홍보영상 스케치 및 드론(항공) 촬영',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1064,'notice',null,0,'무통장 환급 지연 안내','안녕하십니까

망상 오토 캠핑 리조트 입니다.

정부 프로그램 변경으로 인한 오류 발생으로 

2.5~2.18 무통장 취소분에 대하여

무통장 환급건이 지연되고 있습니다.

해당 기관 문의 결과 2.27(화) 환급 예정이며

2.19부터 발생되는 취소분은 정상적(취소후 15일 이내)으로 진행될 예정입니다.

환급 건이 늦어지게 된 점 다시 한번 사과드립니다.

죄송합니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1065,'notice',null,0,'2024년 물놀이장 운영공지','어린이 물놀이장은 여름해수욕장 개장 시기에 맞춰 2024.07.10~08.18까지 운영 합니다.

운영시간은 11:00~18:00이며, 중간 1시간 용수 교체시간 있습니다.



이용수칙 관련

1. 입장시 워터슈즈만 착용가능합니다(크록스,슬리퍼X)

2. 튜브,물총,비누방울 사용금지

3. 물놀이장 주변 취식금지(주류 제외한 음료는 가능)

4. 소중한 우리 자녀의 안전을 위해 성인 이용 자재 및 뛰어다니기 금지!!

상기 사항 꼭 지켜주시고 안전한 물놀이를 위해 안전요원 지시에 따라주세요 

많이 이용해 주시기 바랍니다



※ 우천시 운영 중단 합니다. ',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1070,'notice',null,0,'2024년 인더숲캠핑장 이용만족도 설문조사 실시 안내','2024년 인더숲 캠핑장 이용만족도 설문조사 바로가기 >>>',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1071,'notice',null,0,'캠핑장 각종 벌레 해충 주의 요망 안내','우리 캠핑장은 산 속에 조성되어 각종 벌레, 산바퀴벌레 등 해충이 나타 날 수 있습니다. 

포충기와 정기적 방역 중이나 산속에 근본적 해결은 어려운 상황 입니다.

이점에 유의해 주시고 에프킬라, 모기향, 사전 준비해 캠핑을 즐겨주시기 바랍니다. ',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1072,'qna',null,0,'입실 시간 언제인가요??','입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1073,'qna',null,0,'드라이기 있나요??','헤어드라이기 있는지 궁금해요',0,null,'user02',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1074,'qna',null,0,'야외수영장은 몇 시에 오픈인가요','수영장 열리는 시간에 맞춰서 가려고요...',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1075,'qna',null,0,'휴무 있나요???','1월 1일에도 영업하나요??',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1076,'qna',null,1,'문의','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다.',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1077,'qna',null,0,'1월 1일에 여나요','연다면 입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1078,'qna',null,0,'화장실 위치','어딘가요????',0,null,'user02',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1079,'qna',null,0,'텐트 브랜드 문의','대여용 텐트가 어디 브랜드인가요',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1080,'qna',null,0,'내년 2월 예약 미리 가능한가요','내년 예약 미리 하고 싶습니다...',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1081,'qna',null,1,'물어볼 게 있습니다','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다........',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1082,'qna',null,0,'크리스마스에는 영업하나요','연다면 입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1083,'qna',null,0,'매점 있을까요','어디 있나요?? 뭐 파는지 알 수 있나요',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1084,'qna',null,0,'가격 문의','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다........',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1085,'qna',null,0,'2025년 예약가능여부','내년 예약 미리 하고 싶습니다...',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1086,'notice',null,0,'해변 진출입로 공사안내','추암해변 진출입로 포장공사로 인하여 6.24.~6.25 양일간 캠핑장 출입시 불편이 예상되오니 참조하시기 바랍니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1088,'notice',null,0,'2024년 해돋이 행사 공지','▣ 추암해변 신년 해맞이 행사현황


○ 일 시 : 2019.12.31(화) 18:00 ~ 2020.1.1(수) 09:00

    - 해뜨는 시각 : 07:38분 예상

○ 장 소 : 추암해변 광장일원

○ 주요 행사내용

    - 추암 케이크 트리 설치 : 1개소

    - 파티오 난로 해변설치 운영

    - 입체글자 조형물 포토존 설치

    - 촛대바위 다리 구간 아트조명 설치

    - 2020 새해 소망 기원판 운영 등',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1089,'notice',null,0,'캠핑장 온라인 예약 및 취소 방법 안내',' 첨부파일중 이미지미리보기',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1090,'notice',null,0,'코로나19관련 12/15 ~ 상황해제시 임시폐쇄 안내.','동해시 코로나19관련 다수 확진자 발생으로 인해 캠핑장 방역을 위해 12/15 ~ 상황해제시 임시 폐쇄하오니 양해바랍니다.

방역지침에 따라 기간이 연장될 수 있음을 안내드립니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1091,'notice',null,0,'캠핑장 예약시간 공지사항','예약시간을 정오 12시로 바꾸는 과정에서 테스트 진행 결과 지속적으로 오류가 발생하고 있습니다.

예약시간 변경 시 더 많은 혼란과 불편을 드릴 것으로 판단하여 앞으로 예약시간은 기존대로 매월 1일 24시에 열릴 예정입니다.

이용에 불편을 드려 정말 죄송합니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1092,'notice',null,0,'캠핑장 홍보촬영 협조 안내','
안녕하세요!

전북 특별한 관광지 영상콘텐츠 홍보영상 제작을 위해 웅포캠핑장 내에서 홍보 영상 촬영 예정에 있습니다.

촬영일시 : 11. 2. (토) 10 : 00 ~ 18 : 00
촬영장소 : 웅포캠핑장, 웅포곰개나루길
촬영내용 : 익산 홍보영상 스케치 및 드론(항공) 촬영',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1093,'notice',null,0,'무통장 환급 지연 안내','안녕하십니까

망상 오토 캠핑 리조트 입니다.

정부 프로그램 변경으로 인한 오류 발생으로 

2.5~2.18 무통장 취소분에 대하여

무통장 환급건이 지연되고 있습니다.

해당 기관 문의 결과 2.27(화) 환급 예정이며

2.19부터 발생되는 취소분은 정상적(취소후 15일 이내)으로 진행될 예정입니다.

환급 건이 늦어지게 된 점 다시 한번 사과드립니다.

죄송합니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1094,'notice',null,0,'2024년 물놀이장 운영공지','어린이 물놀이장은 여름해수욕장 개장 시기에 맞춰 2024.07.10~08.18까지 운영 합니다.

운영시간은 11:00~18:00이며, 중간 1시간 용수 교체시간 있습니다.



이용수칙 관련

1. 입장시 워터슈즈만 착용가능합니다(크록스,슬리퍼X)

2. 튜브,물총,비누방울 사용금지

3. 물놀이장 주변 취식금지(주류 제외한 음료는 가능)

4. 소중한 우리 자녀의 안전을 위해 성인 이용 자재 및 뛰어다니기 금지!!

상기 사항 꼭 지켜주시고 안전한 물놀이를 위해 안전요원 지시에 따라주세요 

많이 이용해 주시기 바랍니다



※ 우천시 운영 중단 합니다. ',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1099,'notice',null,0,'2024년 인더숲캠핑장 이용만족도 설문조사 실시 안내','2024년 인더숲 캠핑장 이용만족도 설문조사 바로가기 >>>',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1100,'notice',null,0,'캠핑장 각종 벌레 해충 주의 요망 안내','우리 캠핑장은 산 속에 조성되어 각종 벌레, 산바퀴벌레 등 해충이 나타 날 수 있습니다. 

포충기와 정기적 방역 중이나 산속에 근본적 해결은 어려운 상황 입니다.

이점에 유의해 주시고 에프킬라, 모기향, 사전 준비해 캠핑을 즐겨주시기 바랍니다. ',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1101,'qna',null,0,'입실 시간 언제인가요??','입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1102,'qna',null,0,'드라이기 있나요??','헤어드라이기 있는지 궁금해요',0,null,'user02',1,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1103,'qna',null,0,'야외수영장은 몇 시에 오픈인가요','수영장 열리는 시간에 맞춰서 가려고요...',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1104,'qna',null,0,'휴무 있나요???','1월 1일에도 영업하나요??',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1105,'qna',null,1,'문의','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다.',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1106,'qna',null,0,'1월 1일에 여나요','연다면 입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1107,'qna',null,0,'화장실 위치','어딘가요????',0,null,'user02',1,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1108,'qna',null,0,'텐트 브랜드 문의','대여용 텐트가 어디 브랜드인가요',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1109,'qna',null,0,'내년 2월 예약 미리 가능한가요','내년 예약 미리 하고 싶습니다...',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1110,'qna',null,1,'물어볼 게 있습니다','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다........',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1111,'qna',null,0,'크리스마스에는 영업하나요','연다면 입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1112,'qna',null,0,'매점 있을까요','어디 있나요?? 뭐 파는지 알 수 있나요',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1113,'qna',null,0,'가격 문의','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다........',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1114,'qna',null,0,'2025년 예약가능여부','내년 예약 미리 하고 싶습니다...',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1115,'notice',null,0,'해변 진출입로 공사안내','추암해변 진출입로 포장공사로 인하여 6.24.~6.25 양일간 캠핑장 출입시 불편이 예상되오니 참조하시기 바랍니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1117,'notice',null,0,'2024년 해돋이 행사 공지','▣ 추암해변 신년 해맞이 행사현황


○ 일 시 : 2019.12.31(화) 18:00 ~ 2020.1.1(수) 09:00

    - 해뜨는 시각 : 07:38분 예상

○ 장 소 : 추암해변 광장일원

○ 주요 행사내용

    - 추암 케이크 트리 설치 : 1개소

    - 파티오 난로 해변설치 운영

    - 입체글자 조형물 포토존 설치

    - 촛대바위 다리 구간 아트조명 설치

    - 2020 새해 소망 기원판 운영 등',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1118,'notice',null,0,'캠핑장 온라인 예약 및 취소 방법 안내',' 첨부파일중 이미지미리보기',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1119,'notice',null,0,'코로나19관련 12/15 ~ 상황해제시 임시폐쇄 안내.','동해시 코로나19관련 다수 확진자 발생으로 인해 캠핑장 방역을 위해 12/15 ~ 상황해제시 임시 폐쇄하오니 양해바랍니다.

방역지침에 따라 기간이 연장될 수 있음을 안내드립니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1120,'notice',null,0,'캠핑장 예약시간 공지사항','예약시간을 정오 12시로 바꾸는 과정에서 테스트 진행 결과 지속적으로 오류가 발생하고 있습니다.

예약시간 변경 시 더 많은 혼란과 불편을 드릴 것으로 판단하여 앞으로 예약시간은 기존대로 매월 1일 24시에 열릴 예정입니다.

이용에 불편을 드려 정말 죄송합니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1121,'notice',null,0,'캠핑장 홍보촬영 협조 안내','
안녕하세요!

전북 특별한 관광지 영상콘텐츠 홍보영상 제작을 위해 웅포캠핑장 내에서 홍보 영상 촬영 예정에 있습니다.

촬영일시 : 11. 2. (토) 10 : 00 ~ 18 : 00
촬영장소 : 웅포캠핑장, 웅포곰개나루길
촬영내용 : 익산 홍보영상 스케치 및 드론(항공) 촬영',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1122,'notice',null,0,'무통장 환급 지연 안내','안녕하십니까

망상 오토 캠핑 리조트 입니다.

정부 프로그램 변경으로 인한 오류 발생으로 

2.5~2.18 무통장 취소분에 대하여

무통장 환급건이 지연되고 있습니다.

해당 기관 문의 결과 2.27(화) 환급 예정이며

2.19부터 발생되는 취소분은 정상적(취소후 15일 이내)으로 진행될 예정입니다.

환급 건이 늦어지게 된 점 다시 한번 사과드립니다.

죄송합니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1123,'notice',null,0,'2024년 물놀이장 운영공지','어린이 물놀이장은 여름해수욕장 개장 시기에 맞춰 2024.07.10~08.18까지 운영 합니다.

운영시간은 11:00~18:00이며, 중간 1시간 용수 교체시간 있습니다.



이용수칙 관련

1. 입장시 워터슈즈만 착용가능합니다(크록스,슬리퍼X)

2. 튜브,물총,비누방울 사용금지

3. 물놀이장 주변 취식금지(주류 제외한 음료는 가능)

4. 소중한 우리 자녀의 안전을 위해 성인 이용 자재 및 뛰어다니기 금지!!

상기 사항 꼭 지켜주시고 안전한 물놀이를 위해 안전요원 지시에 따라주세요 

많이 이용해 주시기 바랍니다



※ 우천시 운영 중단 합니다. ',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1128,'notice',null,0,'2024년 인더숲캠핑장 이용만족도 설문조사 실시 안내','2024년 인더숲 캠핑장 이용만족도 설문조사 바로가기 >>>',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1129,'notice',null,0,'캠핑장 각종 벌레 해충 주의 요망 안내','우리 캠핑장은 산 속에 조성되어 각종 벌레, 산바퀴벌레 등 해충이 나타 날 수 있습니다. 

포충기와 정기적 방역 중이나 산속에 근본적 해결은 어려운 상황 입니다.

이점에 유의해 주시고 에프킬라, 모기향, 사전 준비해 캠핑을 즐겨주시기 바랍니다. ',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1130,'qna',null,0,'입실 시간 언제인가요??','입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1131,'qna',null,0,'드라이기 있나요??','헤어드라이기 있는지 궁금해요',0,null,'user02',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1132,'qna',null,0,'야외수영장은 몇 시에 오픈인가요','수영장 열리는 시간에 맞춰서 가려고요...',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1133,'qna',null,0,'휴무 있나요???','1월 1일에도 영업하나요??',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1134,'qna',null,1,'문의','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다.',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1135,'qna',null,0,'1월 1일에 여나요','연다면 입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1136,'qna',null,0,'화장실 위치','어딘가요????',0,null,'user02',1,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1137,'qna',null,0,'텐트 브랜드 문의','대여용 텐트가 어디 브랜드인가요',0,null,'user03',1,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1138,'qna',null,0,'내년 2월 예약 미리 가능한가요','내년 예약 미리 하고 싶습니다...',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1139,'qna',null,1,'물어볼 게 있습니다','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다........',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1140,'qna',null,0,'크리스마스에는 영업하나요','연다면 입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1141,'qna',null,0,'매점 있을까요','어디 있나요?? 뭐 파는지 알 수 있나요',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1142,'qna',null,0,'가격 문의','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다........',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1143,'qna',null,0,'2025년 예약가능여부','내년 예약 미리 하고 싶습니다...',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1144,'notice',null,0,'해변 진출입로 공사안내','추암해변 진출입로 포장공사로 인하여 6.24.~6.25 양일간 캠핑장 출입시 불편이 예상되오니 참조하시기 바랍니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1146,'notice',null,0,'2024년 해돋이 행사 공지','▣ 추암해변 신년 해맞이 행사현황


○ 일 시 : 2019.12.31(화) 18:00 ~ 2020.1.1(수) 09:00

    - 해뜨는 시각 : 07:38분 예상

○ 장 소 : 추암해변 광장일원

○ 주요 행사내용

    - 추암 케이크 트리 설치 : 1개소

    - 파티오 난로 해변설치 운영

    - 입체글자 조형물 포토존 설치

    - 촛대바위 다리 구간 아트조명 설치

    - 2020 새해 소망 기원판 운영 등',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1147,'notice',null,0,'캠핑장 온라인 예약 및 취소 방법 안내',' 첨부파일중 이미지미리보기',0,null,'admin',1,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1148,'notice',null,0,'코로나19관련 12/15 ~ 상황해제시 임시폐쇄 안내.','동해시 코로나19관련 다수 확진자 발생으로 인해 캠핑장 방역을 위해 12/15 ~ 상황해제시 임시 폐쇄하오니 양해바랍니다.

방역지침에 따라 기간이 연장될 수 있음을 안내드립니다.',0,null,'admin',1,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1149,'notice',null,0,'캠핑장 예약시간 공지사항','예약시간을 정오 12시로 바꾸는 과정에서 테스트 진행 결과 지속적으로 오류가 발생하고 있습니다.

예약시간 변경 시 더 많은 혼란과 불편을 드릴 것으로 판단하여 앞으로 예약시간은 기존대로 매월 1일 24시에 열릴 예정입니다.

이용에 불편을 드려 정말 죄송합니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1150,'notice',null,0,'캠핑장 홍보촬영 협조 안내','
안녕하세요!

전북 특별한 관광지 영상콘텐츠 홍보영상 제작을 위해 웅포캠핑장 내에서 홍보 영상 촬영 예정에 있습니다.

촬영일시 : 11. 2. (토) 10 : 00 ~ 18 : 00
촬영장소 : 웅포캠핑장, 웅포곰개나루길
촬영내용 : 익산 홍보영상 스케치 및 드론(항공) 촬영',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1151,'notice',null,0,'무통장 환급 지연 안내','안녕하십니까

망상 오토 캠핑 리조트 입니다.

정부 프로그램 변경으로 인한 오류 발생으로 

2.5~2.18 무통장 취소분에 대하여

무통장 환급건이 지연되고 있습니다.

해당 기관 문의 결과 2.27(화) 환급 예정이며

2.19부터 발생되는 취소분은 정상적(취소후 15일 이내)으로 진행될 예정입니다.

환급 건이 늦어지게 된 점 다시 한번 사과드립니다.

죄송합니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1152,'notice',null,0,'2024년 물놀이장 운영공지','어린이 물놀이장은 여름해수욕장 개장 시기에 맞춰 2024.07.10~08.18까지 운영 합니다.

운영시간은 11:00~18:00이며, 중간 1시간 용수 교체시간 있습니다.



이용수칙 관련

1. 입장시 워터슈즈만 착용가능합니다(크록스,슬리퍼X)

2. 튜브,물총,비누방울 사용금지

3. 물놀이장 주변 취식금지(주류 제외한 음료는 가능)

4. 소중한 우리 자녀의 안전을 위해 성인 이용 자재 및 뛰어다니기 금지!!

상기 사항 꼭 지켜주시고 안전한 물놀이를 위해 안전요원 지시에 따라주세요 

많이 이용해 주시기 바랍니다



※ 우천시 운영 중단 합니다. ',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1153,'notice',null,0,'시설보수로 인한 예약제한 운영 안내 ','『훼미리롯지동 지붕개량 보수공사』 관계로 인해 아래와 같이 시설이용이 제한되오니, 예약시 반드시 참고하시어 이용에 불편함 없으시기 바랍니다.

아울러, 시설이용에 불편드려 죄송하며, 빠른시일내 보수공사를 마무리하여 좀더 나은 모습으로 찾아뵙도록 하겠습니다. 

 

○ 예약중지기간 : 2017. 12. 4(월) ~ 2017. 12. 31(일), 총27일간

○ 예약중지시설 : 훼미리롯지동 전체시설 



기타 궁금한 사항은 033)539-3600~02 문의 주시기 바랍니다.',1,null,'admin',6,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1154,'notice',null,0,'[예약안내] 12월 캠핑장 지역주민 우선예약 안내','◆ 2024. 12. 1.(일) 14:00에 오픈하는 2024년 12월분 지역주민 우선예약과 관련하여 우선 예약 가능한 시설을 공지하오니,
이용에 참고하시기 바랍니다.

◆ 1n the 숲 캠핑장이 위치한 지역에 거주하시는 분들은 대기 없이 우선예약 가능합니다.

☛ 지역주민 우선예약기간(11월분): 10. 1.(화) 14:00 ~ 10. 2.(수) 13:00

○ 카라반(2대): 1, 2호

○ 오토캠핑장(2개): 1, 2번 사이트

○ 데크캠핑장(2개): 1, 2번 사이트


※ 주말예약의 경우 경쟁률이 높은 상황입니다. 원하시는 날짜에 예약을 못 하시더라도 양해해주시기 바랍니다.

※ <참고사항>
○ 카라반 내 침구류는 구비되어 있으나, 숲속에 위치한 캠핑장 특성상 추울 수 있으니,
여분의 이불이나 옷을 준비해 오시기 바랍니다.
○ 문의: 1n the 숲 캠핑장 관리사무소 (053-133-1333)',1,null,'admin',6,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1156,'notice',null,0,'안전하고 즐거운 캠핑! 인더숲캠핑장과 함께해요!','인더숲캠핑장과 함께 캠핑 에티켓과 안전수칙에 대한 동영상입니다~!
사전에 공부를 하고 준비해서 갈수록 캠핑은 더 안전하고 즐거워질 거에요
모두들 캠핑장 에티켓과 안전수칙! 꼭 지켜주실꺼죠?
그럼 우리 모두 달서별빛캠프 캠핑장에서 행복한 시간 보내길 바라요~',1,null,'admin',2,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1157,'notice',null,0,'2024년 인더숲캠핑장 이용만족도 설문조사 실시 안내','2024년 인더숲 캠핑장 이용만족도 설문조사 바로가기 >>>',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1158,'notice',null,0,'캠핑장 각종 벌레 해충 주의 요망 안내','우리 캠핑장은 산 속에 조성되어 각종 벌레, 산바퀴벌레 등 해충이 나타 날 수 있습니다. 

포충기와 정기적 방역 중이나 산속에 근본적 해결은 어려운 상황 입니다.

이점에 유의해 주시고 에프킬라, 모기향, 사전 준비해 캠핑을 즐겨주시기 바랍니다. ',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1160,'qna',null,0,'드라이기 있나요??','헤어드라이기 있는지 궁금해요!!',0,null,'user02',18,to_date('24/11/08','RR/MM/DD'),1263,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1161,'qna',null,0,'야외수영장은 몇 시에 오픈인가요','수영장 열리는 시간에 맞춰서 가려고요...',0,null,'user03',8,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1162,'qna',null,0,'휴무 있나요???','1월 1일에도 영업하나요??',0,null,'user04',4,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1163,'qna',null,1,'문의','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다.',0,null,'user05',9,to_date('24/11/08','RR/MM/DD'),1262,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1164,'qna',null,0,'1월 1일에 여나요','연다면 입실 시간 문의합니다.',0,null,'user01',2,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1165,'qna',null,0,'화장실 위치','어딘가요????',0,null,'user02',2,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1166,'qna',null,0,'텐트 브랜드 문의','대여용 텐트가 어디 브랜드인가요',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1167,'qna',null,0,'내년 2월 예약 미리 가능한가요','내년 예약 미리 하고 싶습니다...',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1168,'qna',null,1,'물어볼 게 있습니다','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다........',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1169,'qna',null,0,'크리스마스에는 영업하나요','연다면 입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1170,'qna',null,0,'매점 있을까요','어디 있나요?? 뭐 파는지 알 수 있나요',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1171,'qna',null,0,'가격 문의','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다........',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1172,'qna',null,0,'2025년 예약가능여부','내년 예약 미리 하고 싶습니다...',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1173,'notice',null,0,'해변 진출입로 공사안내','추암해변 진출입로 포장공사로 인하여 6.24.~6.25 양일간 캠핑장 출입시 불편이 예상되오니 참조하시기 바랍니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1175,'notice',null,0,'2024년 해돋이 행사 공지','▣ 추암해변 신년 해맞이 행사현황


○ 일 시 : 2019.12.31(화) 18:00 ~ 2020.1.1(수) 09:00

    - 해뜨는 시각 : 07:38분 예상

○ 장 소 : 추암해변 광장일원

○ 주요 행사내용

    - 추암 케이크 트리 설치 : 1개소

    - 파티오 난로 해변설치 운영

    - 입체글자 조형물 포토존 설치

    - 촛대바위 다리 구간 아트조명 설치

    - 2020 새해 소망 기원판 운영 등',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1176,'notice',null,0,'캠핑장 온라인 예약 및 취소 방법 안내',' 첨부파일중 이미지미리보기',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1177,'notice',null,0,'코로나19관련 12/15 ~ 상황해제시 임시폐쇄 안내.','동해시 코로나19관련 다수 확진자 발생으로 인해 캠핑장 방역을 위해 12/15 ~ 상황해제시 임시 폐쇄하오니 양해바랍니다.

방역지침에 따라 기간이 연장될 수 있음을 안내드립니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1178,'notice',null,0,'캠핑장 예약시간 공지사항','예약시간을 정오 12시로 바꾸는 과정에서 테스트 진행 결과 지속적으로 오류가 발생하고 있습니다.

예약시간 변경 시 더 많은 혼란과 불편을 드릴 것으로 판단하여 앞으로 예약시간은 기존대로 매월 1일 24시에 열릴 예정입니다.

이용에 불편을 드려 정말 죄송합니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1179,'notice',null,0,'캠핑장 홍보촬영 협조 안내','
안녕하세요!

전북 특별한 관광지 영상콘텐츠 홍보영상 제작을 위해 웅포캠핑장 내에서 홍보 영상 촬영 예정에 있습니다.

촬영일시 : 11. 2. (토) 10 : 00 ~ 18 : 00
촬영장소 : 웅포캠핑장, 웅포곰개나루길
촬영내용 : 익산 홍보영상 스케치 및 드론(항공) 촬영',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1180,'notice',null,0,'무통장 환급 지연 안내','안녕하십니까

망상 오토 캠핑 리조트 입니다.

정부 프로그램 변경으로 인한 오류 발생으로 

2.5~2.18 무통장 취소분에 대하여

무통장 환급건이 지연되고 있습니다.

해당 기관 문의 결과 2.27(화) 환급 예정이며

2.19부터 발생되는 취소분은 정상적(취소후 15일 이내)으로 진행될 예정입니다.

환급 건이 늦어지게 된 점 다시 한번 사과드립니다.

죄송합니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1181,'notice',null,0,'2024년 물놀이장 운영공지','어린이 물놀이장은 여름해수욕장 개장 시기에 맞춰 2024.07.10~08.18까지 운영 합니다.

운영시간은 11:00~18:00이며, 중간 1시간 용수 교체시간 있습니다.



이용수칙 관련

1. 입장시 워터슈즈만 착용가능합니다(크록스,슬리퍼X)

2. 튜브,물총,비누방울 사용금지

3. 물놀이장 주변 취식금지(주류 제외한 음료는 가능)

4. 소중한 우리 자녀의 안전을 위해 성인 이용 자재 및 뛰어다니기 금지!!

상기 사항 꼭 지켜주시고 안전한 물놀이를 위해 안전요원 지시에 따라주세요 

많이 이용해 주시기 바랍니다



※ 우천시 운영 중단 합니다. ',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1184,'notice',null,0,'◆2024년 11월분 캠핑장 사이트 예약안내(우선예약 등)◆','◆2024년 11월분 캠핑장 사이트 예약안내(우선예약 등)◆
★ 달서구민(주민등록 주소지를 달서구에 둔 자) 우선예약이 가능합니다!(12. 1.(화) 14시부터) ★
',0,null,'admin',8,to_date('24/11/08','RR/MM/DD'),0,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1186,'notice',null,0,'2024년 인더숲캠핑장 이용만족도 설문조사 실시 안내','2024년 인더숲 캠핑장 이용만족도 설문조사 바로가기 >>>',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1187,'notice',null,0,'캠핑장 각종 벌레 해충 주의 요망 안내','우리 캠핑장은 산 속에 조성되어 각종 벌레, 산바퀴벌레 등 해충이 나타 날 수 있습니다. 

포충기와 정기적 방역 중이나 산속에 근본적 해결은 어려운 상황 입니다.

이점에 유의해 주시고 에프킬라, 모기향, 사전 준비해 캠핑을 즐겨주시기 바랍니다. ',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1188,'qna',null,0,'입실 시간 언제인가요??','입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1189,'qna',null,0,'드라이기 있나요??','헤어드라이기 있는지 궁금해요',0,null,'user02',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1190,'qna',null,0,'야외수영장은 몇 시에 오픈인가요','수영장 열리는 시간에 맞춰서 가려고요...',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1191,'qna',null,0,'휴무 있나요???','1월 1일에도 영업하나요??',0,null,'user04',1,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1192,'qna',null,1,'문의','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다.',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1193,'qna',null,0,'1월 1일에 여나요','연다면 입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1194,'qna',null,0,'화장실 위치','어딘가요????',0,null,'user02',5,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1195,'qna',null,0,'텐트 브랜드 문의','대여용 텐트가 어디 브랜드인가요',0,null,'user03',1,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1196,'qna',null,0,'내년 2월 예약 미리 가능한가요','내년 예약 미리 하고 싶습니다...',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1197,'qna',null,1,'물어볼 게 있습니다','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다........',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1198,'qna',null,0,'크리스마스에는 영업하나요','연다면 입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1199,'qna',null,0,'매점 있을까요','어디 있나요?? 뭐 파는지 알 수 있나요',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1200,'qna',null,0,'가격 문의','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다........',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1201,'qna',null,0,'2025년 예약가능여부','내년 예약 미리 하고 싶습니다...',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1202,'notice',null,0,'해변 진출입로 공사안내','추암해변 진출입로 포장공사로 인하여 6.24.~6.25 양일간 캠핑장 출입시 불편이 예상되오니 참조하시기 바랍니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1204,'notice',null,0,'2024년 해돋이 행사 공지','▣ 추암해변 신년 해맞이 행사현황


○ 일 시 : 2019.12.31(화) 18:00 ~ 2020.1.1(수) 09:00

    - 해뜨는 시각 : 07:38분 예상

○ 장 소 : 추암해변 광장일원

○ 주요 행사내용

    - 추암 케이크 트리 설치 : 1개소

    - 파티오 난로 해변설치 운영

    - 입체글자 조형물 포토존 설치

    - 촛대바위 다리 구간 아트조명 설치

    - 2020 새해 소망 기원판 운영 등',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1205,'notice',null,0,'캠핑장 온라인 예약 및 취소 방법 안내',' 첨부파일중 이미지미리보기',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1206,'notice',null,0,'코로나19관련 12/15 ~ 상황해제시 임시폐쇄 안내.','동해시 코로나19관련 다수 확진자 발생으로 인해 캠핑장 방역을 위해 12/15 ~ 상황해제시 임시 폐쇄하오니 양해바랍니다.

방역지침에 따라 기간이 연장될 수 있음을 안내드립니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1207,'notice',null,0,'캠핑장 예약시간 공지사항','예약시간을 정오 12시로 바꾸는 과정에서 테스트 진행 결과 지속적으로 오류가 발생하고 있습니다.

예약시간 변경 시 더 많은 혼란과 불편을 드릴 것으로 판단하여 앞으로 예약시간은 기존대로 매월 1일 24시에 열릴 예정입니다.

이용에 불편을 드려 정말 죄송합니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1208,'notice',null,0,'캠핑장 홍보촬영 협조 안내','
안녕하세요!

전북 특별한 관광지 영상콘텐츠 홍보영상 제작을 위해 웅포캠핑장 내에서 홍보 영상 촬영 예정에 있습니다.

촬영일시 : 11. 2. (토) 10 : 00 ~ 18 : 00
촬영장소 : 웅포캠핑장, 웅포곰개나루길
촬영내용 : 익산 홍보영상 스케치 및 드론(항공) 촬영',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1209,'notice',null,0,'무통장 환급 지연 안내','안녕하십니까

망상 오토 캠핑 리조트 입니다.

정부 프로그램 변경으로 인한 오류 발생으로 

2.5~2.18 무통장 취소분에 대하여

무통장 환급건이 지연되고 있습니다.

해당 기관 문의 결과 2.27(화) 환급 예정이며

2.19부터 발생되는 취소분은 정상적(취소후 15일 이내)으로 진행될 예정입니다.

환급 건이 늦어지게 된 점 다시 한번 사과드립니다.

죄송합니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1210,'notice',null,0,'2024년 물놀이장 운영공지','어린이 물놀이장은 여름해수욕장 개장 시기에 맞춰 2024.07.10~08.18까지 운영 합니다.

운영시간은 11:00~18:00이며, 중간 1시간 용수 교체시간 있습니다.



이용수칙 관련

1. 입장시 워터슈즈만 착용가능합니다(크록스,슬리퍼X)

2. 튜브,물총,비누방울 사용금지

3. 물놀이장 주변 취식금지(주류 제외한 음료는 가능)

4. 소중한 우리 자녀의 안전을 위해 성인 이용 자재 및 뛰어다니기 금지!!

상기 사항 꼭 지켜주시고 안전한 물놀이를 위해 안전요원 지시에 따라주세요 

많이 이용해 주시기 바랍니다



※ 우천시 운영 중단 합니다. ',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1215,'notice',null,0,'2024년 인더숲캠핑장 이용만족도 설문조사 실시 안내','2024년 인더숲 캠핑장 이용만족도 설문조사 바로가기 >>>',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1216,'notice',null,0,'캠핑장 각종 벌레 해충 주의 요망 안내','우리 캠핑장은 산 속에 조성되어 각종 벌레, 산바퀴벌레 등 해충이 나타 날 수 있습니다. 

포충기와 정기적 방역 중이나 산속에 근본적 해결은 어려운 상황 입니다.

이점에 유의해 주시고 에프킬라, 모기향, 사전 준비해 캠핑을 즐겨주시기 바랍니다. ',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1217,'qna',null,0,'입실 시간 언제인가요??','입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1218,'qna',null,0,'드라이기 있나요??','헤어드라이기 있는지 궁금해요',0,null,'user02',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1219,'qna',null,0,'야외수영장은 몇 시에 오픈인가요','수영장 열리는 시간에 맞춰서 가려고요...',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1220,'qna',null,0,'휴무 있나요???','1월 1일에도 영업하나요??',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1221,'qna',null,1,'문의','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다.',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1222,'qna',null,0,'1월 1일에 여나요','연다면 입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1223,'qna',null,0,'화장실 위치','어딘가요????',0,null,'user02',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1224,'qna',null,0,'텐트 브랜드 문의','대여용 텐트가 어디 브랜드인가요',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1225,'qna',null,0,'내년 2월 예약 미리 가능한가요','내년 예약 미리 하고 싶습니다...',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1226,'qna',null,1,'물어볼 게 있습니다','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다........',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1227,'qna',null,0,'크리스마스에는 영업하나요','연다면 입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1228,'qna',null,0,'매점 있을까요','어디 있나요?? 뭐 파는지 알 수 있나요',0,null,'user03',1,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1229,'qna',null,0,'가격 문의','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다........',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1230,'qna',null,0,'2025년 예약가능여부','내년 예약 미리 하고 싶습니다...',0,null,'user04',1,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1231,'notice',null,0,'해변 진출입로 공사안내','추암해변 진출입로 포장공사로 인하여 6.24.~6.25 양일간 캠핑장 출입시 불편이 예상되오니 참조하시기 바랍니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1233,'notice',null,0,'2024년 해돋이 행사 공지','▣ 추암해변 신년 해맞이 행사현황


○ 일 시 : 2019.12.31(화) 18:00 ~ 2020.1.1(수) 09:00

    - 해뜨는 시각 : 07:38분 예상

○ 장 소 : 추암해변 광장일원

○ 주요 행사내용

    - 추암 케이크 트리 설치 : 1개소

    - 파티오 난로 해변설치 운영

    - 입체글자 조형물 포토존 설치

    - 촛대바위 다리 구간 아트조명 설치

    - 2020 새해 소망 기원판 운영 등',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1234,'notice',null,0,'캠핑장 온라인 예약 및 취소 방법 안내',' 첨부파일중 이미지미리보기',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1235,'notice',null,0,'코로나19관련 12/15 ~ 상황해제시 임시폐쇄 안내.','동해시 코로나19관련 다수 확진자 발생으로 인해 캠핑장 방역을 위해 12/15 ~ 상황해제시 임시 폐쇄하오니 양해바랍니다.

방역지침에 따라 기간이 연장될 수 있음을 안내드립니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1236,'notice',null,0,'캠핑장 예약시간 공지사항','예약시간을 정오 12시로 바꾸는 과정에서 테스트 진행 결과 지속적으로 오류가 발생하고 있습니다.

예약시간 변경 시 더 많은 혼란과 불편을 드릴 것으로 판단하여 앞으로 예약시간은 기존대로 매월 1일 24시에 열릴 예정입니다.

이용에 불편을 드려 정말 죄송합니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1237,'notice',null,0,'캠핑장 홍보촬영 협조 안내','
안녕하세요!

전북 특별한 관광지 영상콘텐츠 홍보영상 제작을 위해 웅포캠핑장 내에서 홍보 영상 촬영 예정에 있습니다.

촬영일시 : 11. 2. (토) 10 : 00 ~ 18 : 00
촬영장소 : 웅포캠핑장, 웅포곰개나루길
촬영내용 : 익산 홍보영상 스케치 및 드론(항공) 촬영',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1238,'notice',null,0,'무통장 환급 지연 안내','안녕하십니까

망상 오토 캠핑 리조트 입니다.

정부 프로그램 변경으로 인한 오류 발생으로 

2.5~2.18 무통장 취소분에 대하여

무통장 환급건이 지연되고 있습니다.

해당 기관 문의 결과 2.27(화) 환급 예정이며

2.19부터 발생되는 취소분은 정상적(취소후 15일 이내)으로 진행될 예정입니다.

환급 건이 늦어지게 된 점 다시 한번 사과드립니다.

죄송합니다.',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1239,'notice',null,0,'2024년 물놀이장 운영공지','어린이 물놀이장은 여름해수욕장 개장 시기에 맞춰 2024.07.10~08.18까지 운영 합니다.

운영시간은 11:00~18:00이며, 중간 1시간 용수 교체시간 있습니다.



이용수칙 관련

1. 입장시 워터슈즈만 착용가능합니다(크록스,슬리퍼X)

2. 튜브,물총,비누방울 사용금지

3. 물놀이장 주변 취식금지(주류 제외한 음료는 가능)

4. 소중한 우리 자녀의 안전을 위해 성인 이용 자재 및 뛰어다니기 금지!!

상기 사항 꼭 지켜주시고 안전한 물놀이를 위해 안전요원 지시에 따라주세요 

많이 이용해 주시기 바랍니다



※ 우천시 운영 중단 합니다. ',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1244,'notice',null,0,'2024년 인더숲캠핑장 이용만족도 설문조사 실시 안내','2024년 인더숲 캠핑장 이용만족도 설문조사 바로가기 >>>',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1245,'notice',null,0,'캠핑장 각종 벌레 해충 주의 요망 안내','우리 캠핑장은 산 속에 조성되어 각종 벌레, 산바퀴벌레 등 해충이 나타 날 수 있습니다. 

포충기와 정기적 방역 중이나 산속에 근본적 해결은 어려운 상황 입니다.

이점에 유의해 주시고 에프킬라, 모기향, 사전 준비해 캠핑을 즐겨주시기 바랍니다. ',0,null,'admin',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1246,'qna',null,0,'입실 시간 언제인가요??','입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1247,'qna',null,0,'드라이기 있나요??','헤어드라이기 있는지 궁금해요',0,null,'user02',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1248,'qna',null,0,'야외수영장은 몇 시에 오픈인가요','수영장 열리는 시간에 맞춰서 가려고요...',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1249,'qna',null,0,'휴무 있나요???','1월 1일에도 영업하나요??',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1250,'qna',null,1,'문의','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다.',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1251,'qna',null,0,'1월 1일에 여나요','연다면 입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1252,'qna',null,0,'화장실 위치','어딘가요????',0,null,'user02',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1253,'qna',null,0,'텐트 브랜드 문의','대여용 텐트가 어디 브랜드인가요',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1254,'qna',null,0,'내년 2월 예약 미리 가능한가요','내년 예약 미리 하고 싶습니다...',0,null,'user04',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1255,'qna',null,1,'물어볼 게 있습니다','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다........',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1256,'qna',null,0,'크리스마스에는 영업하나요','연다면 입실 시간 문의합니다.',0,null,'user01',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1257,'qna',null,0,'매점 있을까요','어디 있나요?? 뭐 파는지 알 수 있나요',0,null,'user03',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1258,'qna',null,0,'가격 문의','혹시 가격 깎아주실 수 있나요?....

        안 되면 죄송합니다........',0,null,'user05',0,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1259,'qna',null,0,'2025년 예약가능여부','내년 예약 미리 하고 싶습니다...',0,null,'user04',1,to_date('24/11/08','RR/MM/DD'),null,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1260,'review',null,0,'자연 속 힐링, 최고의 캠핑 경험이었습니다!','이번 주말 가족들과 함께 캠핑장을 다녀왔습니다. 도심을 벗어나 맑은 공기와 푸른 숲 속에서 여유로운 시간을 보낼 수 있어서 정말 힐링이 되었어요. 시설도 청결하고 잘 관리되어 있어 편리하게 이용할 수 있었습니다. 특히 밤하늘에 쏟아지는 별들을 보며 모닥불을 피우니, 일상에서 쌓였던 스트레스가 모두 날아가는 느낌이었어요!

캠핑장 직원분들도 친절하게 안내해 주셔서 감사했습니다. 다음에 기회가 된다면 친구들과 함께 또 오고 싶습니다. 강력 추천합니다!',0,null,'user02',21,to_date('24/11/08','RR/MM/DD'),0,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1261,'notice',null,0,'10월 20일 호우주의보/태풍주의보 관련 캠핑장 이용 안내','10월 20일 현재 동해시 호우주의보, 강풍o 태풍주의보 : 남해동부먼바다, 동해남부북쪽먼바다, 동해남부남쪽먼바다
o 강풍주의보 : 울릉도.독도, 울산, 부산, 경상남도(거제), 경상북도(경북북동산지, 울진평지, 경주, 포항, 영덕), 강원도(강원북부산지, 강원중부산지, 강원남부산지, 삼척평지, 동해평지, 강릉평지, 양양평지, 고성평지, 속초평지, 태백)
o 풍랑주의보 : 제주도남쪽먼바다, 남해동부앞바다(거제시동부앞바다, 부산앞바다), 동해중부전해상, 동해남부앞바다

캠핑장 이용에 주의 바랍니다.!',0,null,'admin',4,to_date('24/11/08','RR/MM/DD'),0,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1270,'reply',null,0,'└ [RE] : 문의','절대 안 됩니다.!',0,null,'admin',10,to_date('24/11/08','RR/MM/DD'),1163,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1272,'reply',null,0,'└ [RE] : 매점 있을까요','간단한 과자와 마시멜로, 음료수, 생수 판매중입니다~!',0,null,'admin',2,to_date('24/11/08','RR/MM/DD'),1228,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1271,'reply',null,0,'└ [RE] : 야외수영장은 몇 시에 오픈인가요','동절기라 영업하지 않으려 합니다....!',0,null,'admin',18,to_date('24/11/08','RR/MM/DD'),1161,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1273,'reply',null,0,'└ [RE] : 화장실 위치','안쪽으로 가시면 됩니다',0,null,'admin',3,to_date('24/11/08','RR/MM/DD'),1194,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1274,'qna',null,1,'반려동물 동반 가능 여부 문의드립니다.','안녕하세요. 캠핑장 이용 시 반려동물과 함께 방문할 계획인데, 반려동물 동반이 가능한지 문의드립니다. 가능하다면 몇 가지 추가 질문이 있습니다.

반려동물과 동반 가능한 사이트가 따로 지정되어 있나요?
반려동물을 위한 편의 시설이 있는지 궁금합니다.
반려동물 동반 시 주의사항이나 추가 비용이 발생하는지 알려주시면 감사하겠습니다.
답변 주시면 예약에 참고하겠습니다. 좋은 하루 보내세요! 감사합니다.',0,null,'user02',7,to_date('24/11/08','RR/MM/DD'),0,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1282,'reply',null,0,'└ [RE] : 드라이기 있나요??','아쉽지만 없네요ㅠㅠ',0,null,'admin',4,to_date('24/11/08','RR/MM/DD'),1160,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1276,'reply',null,1,'└ [RE] : 반려동물 동반 가능 여부 문의드립니다.','동반 가능합니다',0,null,'admin',7,to_date('24/11/08','RR/MM/DD'),1274,'1234');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1283,'review','114',0,'좋아요','정말 행복합니다.',0,null,'user02',3,to_date('24/11/08','RR/MM/DD'),0,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1285,'reply',null,0,'└ [RE] : 화장실 위치','안으로 들어가세요!!!!!!',0,null,'admin',3,to_date('24/11/08','RR/MM/DD'),1165,'0');
Insert into JAVA.BOARD (BOARD_NO,BOARD_CATEGORY,BOOK_NO,SECRET_FLAG,TITLE,CONTENT,NOTICE_FLAG,BOARD_FILE,WRITER,VIEW_CNT,WRITE_DATE,REPLY_NO,BOARD_PW) values (1286,'qna',null,1,'문의','문의입니다!!!',0,'coffee.jpg','admin',1,to_date('24/11/08','RR/MM/DD'),0,'0000');
REM INSERTING into JAVA.BOARDS
SET DEFINE OFF;
Insert into JAVA.BOARDS (BNO,BTITLE,CONTENT,BWRITER,BDATE) values (1,'추운날','날이춥다','글쓴이1',to_date('24/10/04','RR/MM/DD'));
Insert into JAVA.BOARDS (BNO,BTITLE,CONTENT,BWRITER,BDATE) values (3,'제목2','내용2','글쓴이2',to_date('24/10/04','RR/MM/DD'));
Insert into JAVA.BOARDS (BNO,BTITLE,CONTENT,BWRITER,BDATE) values (4,'행복','바람분다','글쓴이3',to_date('24/10/04','RR/MM/DD'));
Insert into JAVA.BOARDS (BNO,BTITLE,CONTENT,BWRITER,BDATE) values (5,'제목4','내용4','글쓴이4',to_date('24/10/04','RR/MM/DD'));
Insert into JAVA.BOARDS (BNO,BTITLE,CONTENT,BWRITER,BDATE) values (6,'제목5','내용5','글쓴이5',to_date('24/10/04','RR/MM/DD'));
Insert into JAVA.BOARDS (BNO,BTITLE,CONTENT,BWRITER,BDATE) values (7,'제목5','내용5','글쓴이5',to_date('24/10/04','RR/MM/DD'));
Insert into JAVA.BOARDS (BNO,BTITLE,CONTENT,BWRITER,BDATE) values (8,'눈오는밤','눈내림','snow',to_date('24/10/04','RR/MM/DD'));
Insert into JAVA.BOARDS (BNO,BTITLE,CONTENT,BWRITER,BDATE) values (9,'눈오는밤','눈내림','snow',to_date('24/10/04','RR/MM/DD'));
REM INSERTING into JAVA.BOOK
SET DEFINE OFF;
Insert into JAVA.BOOK (TITLE,WRITER,PRICE,BNUM) values ('2','2',2,'2');
Insert into JAVA.BOOK (TITLE,WRITER,PRICE,BNUM) values ('2','2',102,'2');
Insert into JAVA.BOOK (TITLE,WRITER,PRICE,BNUM) values ('1','1',200,'100');
Insert into JAVA.BOOK (TITLE,WRITER,PRICE,BNUM) values ('3','3',103,'3');
Insert into JAVA.BOOK (TITLE,WRITER,PRICE,BNUM) values ('1','1',100,'100');
Insert into JAVA.BOOK (TITLE,WRITER,PRICE,BNUM) values ('4','4',141,'41');
Insert into JAVA.BOOK (TITLE,WRITER,PRICE,BNUM) values ('3','3',3,'3');
Insert into JAVA.BOOK (TITLE,WRITER,PRICE,BNUM) values ('4','4',41,'41');
Insert into JAVA.BOOK (TITLE,WRITER,PRICE,BNUM) values ('2','2',102,'2');
Insert into JAVA.BOOK (TITLE,WRITER,PRICE,BNUM) values ('1','1',200,'100');
Insert into JAVA.BOOK (TITLE,WRITER,PRICE,BNUM) values ('3','3',103,'3');
Insert into JAVA.BOOK (TITLE,WRITER,PRICE,BNUM) values ('4','4',141,'41');
Insert into JAVA.BOOK (TITLE,WRITER,PRICE,BNUM) values ('2','2',102,'2');
Insert into JAVA.BOOK (TITLE,WRITER,PRICE,BNUM) values ('1','1',200,'100');
Insert into JAVA.BOOK (TITLE,WRITER,PRICE,BNUM) values ('3','3',103,'3');
Insert into JAVA.BOOK (TITLE,WRITER,PRICE,BNUM) values ('4','4',141,'41');
REM INSERTING into JAVA.EMPLOYEE
SET DEFINE OFF;
Insert into JAVA.EMPLOYEE (EMPLOYEE_ID,EMPLOYEE_NAME,PHONE,HIRE_DATE,SALARY) values ('3','3','3',to_date('15/08/07','RR/MM/DD'),'200');
Insert into JAVA.EMPLOYEE (EMPLOYEE_ID,EMPLOYEE_NAME,PHONE,HIRE_DATE,SALARY) values ('1','2','3',to_date('00/01/01','RR/MM/DD'),'500');
Insert into JAVA.EMPLOYEE (EMPLOYEE_ID,EMPLOYEE_NAME,PHONE,HIRE_DATE,SALARY) values ('2','2','2',to_date('24/10/01','RR/MM/DD'),'100');
REM INSERTING into JAVA.MEMBER
SET DEFINE OFF;
Insert into JAVA.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,ADDRESS,EMAIL,TEL,JOINED_DATE,PERMISSION,QUIT) values ('admin','0000','관리자','41935|대구 중구 남일동 135-1|5층 예담직업전문학교','admin@yedam.ac','010-1234-5678',to_date('24/11/08','RR/MM/DD'),'admin',0);
Insert into JAVA.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,ADDRESS,EMAIL,TEL,JOINED_DATE,PERMISSION,QUIT) values ('user01','0000','홍길동','41937|대구 중구 동성로 7|태왕아파트 204동 1005호','hongs@gmail.com','010-4578-1244',to_date('24/11/08','RR/MM/DD'),'user',0);
Insert into JAVA.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,ADDRESS,EMAIL,TEL,JOINED_DATE,PERMISSION,QUIT) values ('user02','0000','이민박','06034|서울 강남구 가로수길 23|롯데캐슬 401동 1204호','minpark@gmail.com','010-4572-4622',to_date('24/11/08','RR/MM/DD'),'user',0);
Insert into JAVA.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,ADDRESS,EMAIL,TEL,JOINED_DATE,PERMISSION,QUIT) values ('user03','0000','김미니','63534|제주특별자치도 서귀포시 가가로 25|미니아파트101동781호','mini@naver.com','010-4741-1655',to_date('24/11/08','RR/MM/DD'),'user',0);
Insert into JAVA.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,ADDRESS,EMAIL,TEL,JOINED_DATE,PERMISSION,QUIT) values ('user04','0000','이주리','62404|광주 광산구 가마길 21|푸르지오 401동 1503호','jurie123@hanmail.net','010-6758-1369',to_date('24/11/08','RR/MM/DD'),'user',0);
Insert into JAVA.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,ADDRESS,EMAIL,TEL,JOINED_DATE,PERMISSION,QUIT) values ('user05','0000','강유인','25511|강원특별자치도 강릉시 가작로 16-1|힐스테이트 407동 2004호','yunin456@naver.com','010-7456-2451',to_date('24/11/08','RR/MM/DD'),'user',0);
Insert into JAVA.MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,ADDRESS,EMAIL,TEL,JOINED_DATE,PERMISSION,QUIT) values ('user','0000','홍길동','41806|대구 서구 큰장로25길 6-10|태스트','leadon@daum.net','010-5412-4574',to_date('24/11/08','RR/MM/DD'),'user',1);
REM INSERTING into JAVA.PRODUCT_TBL
SET DEFINE OFF;
Insert into JAVA.PRODUCT_TBL (PRD_CODE,PRD_NAME,PRD_DESC,ORIGIN_PRICE,SALE_PRICE,STAR_POINT,PROD_IMAGE,CREATION_DATE) values ('P001','과테말라 안티구아','아주 맛있는 과테말라 안티구아 입니다',3000,2500,5,'과테말라 안티구아.jpg',to_date('24/10/30','RR/MM/DD'));
Insert into JAVA.PRODUCT_TBL (PRD_CODE,PRD_NAME,PRD_DESC,ORIGIN_PRICE,SALE_PRICE,STAR_POINT,PROD_IMAGE,CREATION_DATE) values ('P002','니카라구아 더치','아주 맛있는 니카라구아 더치 입니다',4000,3500,4,'니카라구아 더치.jpg',to_date('24/10/30','RR/MM/DD'));
Insert into JAVA.PRODUCT_TBL (PRD_CODE,PRD_NAME,PRD_DESC,ORIGIN_PRICE,SALE_PRICE,STAR_POINT,PROD_IMAGE,CREATION_DATE) values ('P003','브라질산토스','아주 맛있는 브라질산토스 입니다',6000,5500,3,'브라질산토스.jpg',to_date('24/10/30','RR/MM/DD'));
Insert into JAVA.PRODUCT_TBL (PRD_CODE,PRD_NAME,PRD_DESC,ORIGIN_PRICE,SALE_PRICE,STAR_POINT,PROD_IMAGE,CREATION_DATE) values ('P004','에티오피아 예가체프','아주 맛있는 에티오피아 예가체프 입니다',7000,6500,2,'에티오피아 예가체프.jpg',to_date('24/10/30','RR/MM/DD'));
Insert into JAVA.PRODUCT_TBL (PRD_CODE,PRD_NAME,PRD_DESC,ORIGIN_PRICE,SALE_PRICE,STAR_POINT,PROD_IMAGE,CREATION_DATE) values ('P005','케냐 오크라톡신','아주 맛있는 케냐 오크라톡신 입니다',3500,2800,1,'케냐 오크라톡신.jpg',to_date('24/10/30','RR/MM/DD'));
Insert into JAVA.PRODUCT_TBL (PRD_CODE,PRD_NAME,PRD_DESC,ORIGIN_PRICE,SALE_PRICE,STAR_POINT,PROD_IMAGE,CREATION_DATE) values ('P006','코스타리카 따라주','아주 맛있는 코스타리카 따라주 입니다',4500,3200,3,'코스타리카 따라주.jpg',to_date('24/10/30','RR/MM/DD'));
REM INSERTING into JAVA.SITE
SET DEFINE OFF;
Insert into JAVA.SITE (SITE_NO,SITE_NAME,CATEGORY,SITE_MAX,SITE_PRICE,USE_FLAG) values (1001,'카라반1','caravan',4,100000,'n');
Insert into JAVA.SITE (SITE_NO,SITE_NAME,CATEGORY,SITE_MAX,SITE_PRICE,USE_FLAG) values (1002,'카라반2','caravan',4,100000,'n');
Insert into JAVA.SITE (SITE_NO,SITE_NAME,CATEGORY,SITE_MAX,SITE_PRICE,USE_FLAG) values (1003,'오토1','auto',2,50000,'y');
Insert into JAVA.SITE (SITE_NO,SITE_NAME,CATEGORY,SITE_MAX,SITE_PRICE,USE_FLAG) values (1004,'오토2','auto',2,50000,'y');
Insert into JAVA.SITE (SITE_NO,SITE_NAME,CATEGORY,SITE_MAX,SITE_PRICE,USE_FLAG) values (1005,'데크1','deck',2,25000,'y');
Insert into JAVA.SITE (SITE_NO,SITE_NAME,CATEGORY,SITE_MAX,SITE_PRICE,USE_FLAG) values (1006,'데크2','deck',2,25000,'y');
REM INSERTING into JAVA.SITE_BOOK
SET DEFINE OFF;
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (115,'user01',1006,2,'2024/10/14','2024/10/16','18나 6604',187000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (116,'user01',1006,2,'2024/11/21','2024/11/25','18나 6604',187000,0,1,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (117,'user02',1004,2,'2024/11/12','2024/11/14',null,65000,0,1,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (118,'user02',1004,2,'2024/11/24','2024/11/25','12가 3456',91000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (119,'user05',1005,2,'2024/11/08','2024/11/10',null,155000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (120,'user02',1002,4,'2024/11/28','2024/12/01',null,286000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (121,'user04',1003,2,'2024/11/18','2024/11/21',null,185000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (122,'user04',1001,4,'2024/11/27','2024/11/29','34나 5678',170000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (123,'user03',1003,2,'2024/11/28','2024/11/30',null,152000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (124,'user05',1005,2,'2025/01/23','2025/01/24',null,44000,0,1,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (125,'user05',1001,4,'2025/01/10','2025/01/11',null,109000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (126,'user05',1004,2,'2025/04/10','2025/04/11',null,180000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (127,'user05',1005,2,'2025/04/12','2025/04/13',null,127000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (128,'user05',1001,4,'2025/05/10','2025/05/11',null,286000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (129,'user05',1005,2,'2025/07/21','2025/07/22',null,85000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (130,'user05',1005,2,'2025/01/01','2025/01/02',null,136000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (131,'user05',1003,2,'2025/04/17','2025/04/18',null,82000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (132,'user05',1001,4,'2025/02/17','2025/02/18',null,170000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (133,'user05',1006,2,'2025/02/21','2025/02/22',null,62000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (114,'user02',1001,3,'2024/10/10 13:00:00','2024/10/11 10:00:00','대구31 가1712',150000,0,0,to_date('24/10/30','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (134,'user05',1001,4,'2024/11/08','2024/11/09',null,137000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (135,'user05',1005,2,'2024/11/14','2024/11/15',null,34000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (136,'user01',1004,2,'2024/11/15','2024/11/16',null,120000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (137,'user05',1003,2,'2025/02/10','2025/02/11',null,50000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (138,'user05',1001,4,'2025/04/12','2025/04/13',null,100000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (139,'user05',1005,2,'2025/04/30','2025/05/01',null,25000,0,1,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (140,'user05',1001,4,'2025/04/14','2025/04/15',null,110000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (141,'user05',1005,2,'2025/04/21','2025/04/22',null,104000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (142,'user05',1003,2,'2025/04/15','2025/04/16',null,55000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (143,'user05',1005,2,'2025/04/04','2025/04/05',null,66000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (144,'user05',1004,2,'2025/04/18','2025/04/20',null,91000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (145,'user05',1003,2,'2025/04/12','2025/04/13',null,60000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (146,'user05',1002,4,'2025/04/17','2025/04/19',null,160000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (147,'user05',1005,2,'2025/04/13','2025/04/14',null,57000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (148,'user05',1006,2,'2025/04/17','2025/04/18',null,95000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (149,'user05',1006,2,'2025/04/12','2025/04/13',null,30000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (150,'user05',1006,2,'2025/04/13','2025/04/14',null,25000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (151,'user05',1006,2,'2025/04/27','2025/04/28',null,25000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (152,'user05',1003,2,'2025/04/21','2025/04/22',null,129000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (153,'user05',1001,4,'2025/04/16','2025/04/17',null,115000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (154,'user05',1004,2,'2025/04/03','2025/04/04',null,60000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (155,'user05',1005,2,'2025/04/05','2025/04/06',null,95000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (156,'user05',1006,2,'2025/04/06','2025/04/07',null,85000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (157,'user05',1006,2,'2025/04/16','2025/04/17',null,57000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (158,'user05',1003,2,'2025/04/01','2025/04/02',null,60000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (159,'user05',1005,2,'2025/04/01','2025/04/02',null,30000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (160,'user05',1001,4,'2025/04/09','2025/04/10',null,105000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (161,'user05',1006,2,'2025/04/02','2025/04/03',null,35000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (162,'user05',1004,2,'2025/04/02','2025/04/03',null,60000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (163,'user05',1002,4,'2025/04/16','2025/04/17',null,100000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (164,'user05',1002,4,'2025/04/01','2025/04/02',null,100000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (165,'user05',1003,2,'2025/04/08','2025/04/09',null,60000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (166,'user05',1004,2,'2025/04/07','2025/04/08',null,50000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (167,'user05',1004,2,'2025/04/06','2025/04/07',null,50000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (168,'user05',1005,2,'2025/04/16','2025/04/17',null,35000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (169,'user05',1002,4,'2025/04/07','2025/04/08',null,119000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (170,'user05',1003,2,'2025/04/11','2025/04/12',null,55000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (171,'user05',1004,2,'2025/04/15','2025/04/17',null,55000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (172,'user05',1003,2,'2025/04/22','2025/04/23',null,55000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (173,'user05',1006,2,'2025/04/01','2025/04/02',null,57000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (174,'user05',1002,4,'2025/04/02','2025/04/03',null,109000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (175,'user05',1004,2,'2025/04/04','2025/04/05',null,110000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (176,'user05',1006,2,'2025/04/05','2025/04/06',null,35000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (177,'user05',1001,4,'2025/04/24','2025/04/25',null,137000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (178,'user05',1002,4,'2025/04/23','2025/04/27',null,179000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (179,'user05',1003,2,'2025/04/16','2025/04/17',null,55000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (180,'user05',1003,2,'2025/04/13','2025/04/14',null,60000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (181,'user05',1006,2,'2025/04/22','2025/04/23',null,40000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (182,'user05',1004,2,'2025/04/14','2025/04/15',null,129000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (183,'user05',1005,2,'2025/04/15','2025/04/16',null,72000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (184,'user05',1006,2,'2025/04/03','2025/04/04',null,104000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (185,'user05',1005,2,'2025/04/10','2025/04/11',null,95000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (186,'user05',1001,4,'2025/04/07','2025/04/08',null,179000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (187,'user05',1005,2,'2025/04/07','2025/04/08',null,57000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (188,'user05',1003,2,'2025/04/06','2025/04/07',null,180000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (189,'user05',1004,2,'2025/04/13','2025/04/14',null,180000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (190,'user05',1002,4,'2025/04/03','2025/04/04',null,109000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (191,'user05',1001,4,'2025/04/17','2025/04/18',null,100000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (192,'user05',1003,2,'2025/04/05','2025/04/06',null,50000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (193,'user05',1006,2,'2025/04/04','2025/04/05',null,25000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (194,'user05',1001,4,'2025/04/06','2025/04/07',null,141000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (195,'user05',1005,2,'2025/04/24','2025/04/25',null,25000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (196,'user05',1006,2,'2025/04/21','2025/04/22',null,25000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (197,'user05',1006,2,'2025/04/23','2025/04/24',null,25000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (198,'user05',1005,2,'2025/04/17','2025/04/18',null,25000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (199,'user05',1005,2,'2025/04/19','2025/04/20',null,85000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (200,'user05',1003,2,'2025/04/19','2025/04/20',null,82000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (201,'user05',1001,4,'2025/04/15','2025/04/16',null,179000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (202,'user05',1006,2,'2025/04/15','2025/04/16',null,34000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (203,'user05',1002,4,'2025/04/15','2025/04/16',null,160000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (204,'user05',1005,2,'2025/04/20','2025/04/21',null,30000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (205,'user05',1001,4,'2025/04/11','2025/04/12',null,100000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (206,'user05',1006,2,'2025/04/19','2025/04/20',null,25000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (207,'user05',1003,2,'2025/04/25','2025/04/26',null,50000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (208,'user05',1004,2,'2025/04/08','2025/04/09',null,50000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (209,'user05',1001,4,'2025/04/13','2025/04/14',null,105000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (210,'user05',1003,2,'2025/04/27','2025/04/28',null,129000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (211,'user05',1006,2,'2025/04/24','2025/04/25',null,35000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (212,'user05',1003,2,'2025/04/20','2025/04/21',null,120000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (213,'user05',1003,2,'2025/04/14','2025/04/15',null,50000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (214,'user05',1006,2,'2025/04/07','2025/04/08',null,25000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (215,'user05',1001,4,'2025/04/25','2025/04/26',null,132000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (216,'user05',1002,4,'2025/04/21','2025/04/22',null,109000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (217,'user05',1004,2,'2025/04/27','2025/04/28',null,59000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (218,'user05',1006,2,'2025/04/29','2025/04/30',null,85000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (219,'user05',1003,2,'2025/04/24','2025/04/25',null,55000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (220,'user05',1006,2,'2025/04/26','2025/04/27',null,25000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (221,'user05',1001,4,'2025/04/21','2025/04/22',null,132000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (222,'user05',1005,2,'2025/04/23','2025/04/24',null,25000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (223,'user05',1004,2,'2025/04/05','2025/04/06',null,120000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (224,'user05',1003,2,'2025/04/28','2025/04/29',null,55000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (225,'user05',1006,2,'2025/04/20','2025/04/21',null,25000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (226,'user05',1003,2,'2025/04/26','2025/04/27',null,50000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (227,'user04',1004,2,'2025/04/23','2025/04/24',null,55000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (228,'user04',1004,2,'2025/04/28','2025/04/29',null,60000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (229,'user04',1003,2,'2025/04/23','2025/04/24',null,55000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (230,'user04',1002,4,'2025/04/12','2025/04/13',null,100000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (231,'user04',1005,2,'2025/04/14','2025/04/15',null,30000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (232,'user04',1003,2,'2025/04/29','2025/04/30',null,82000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (233,'user04',1001,4,'2025/04/05','2025/04/06',null,100000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (234,'user04',1002,4,'2025/04/05','2025/04/06',null,160000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (235,'user04',1002,4,'2025/04/14','2025/04/15',null,109000,0,0,to_date('24/11/08','RR/MM/DD'));
Insert into JAVA.SITE_BOOK (BOOK_NO,MEMBER_ID,SITE_NO,MEM_CNT,START_DATE,END_DATE,CAR_NUM,TOTAL_PRICE,REVIEW_FLAG,CANCEL_FLAG,CREATE_DATE) values (236,'user01',1001,4,'2024/11/26','2024/11/27',null,151000,0,0,to_date('24/11/08','RR/MM/DD'));
REM INSERTING into JAVA.SITE_BOOK_OPTION
SET DEFINE OFF;
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,114,'gihwan',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,115,'user01',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,115,'user01',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,115,'user01',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,116,'user01',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,116,'user01',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,116,'user01',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,117,'user02',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,117,'user02',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,118,'user02',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,118,'user02',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,119,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,119,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,120,'user02',1002);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,120,'user02',1002);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,120,'user02',1002);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,120,'user02',1002);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,120,'user02',1002);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,120,'user02',1002);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,121,'user04',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,121,'user04',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,121,'user04',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,122,'user04',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,123,'user03',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,123,'user03',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,123,'user03',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,124,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,124,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,125,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,126,'user05',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,126,'user05',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,127,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,127,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,128,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,128,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,128,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,128,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,128,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,128,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,129,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,130,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,130,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,130,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,131,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,132,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,133,'user05',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,133,'user05',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,134,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,134,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,135,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,136,'user01',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,140,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,141,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,141,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,142,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,113,'gihwan',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,114,'gihwan',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,143,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,143,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,144,'user05',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,144,'user05',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,145,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,146,'user05',1002);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,147,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,148,'user05',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,149,'user05',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,152,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,152,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,153,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,153,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,154,'user05',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,155,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,156,'user05',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,157,'user05',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,158,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,159,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,160,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,161,'user05',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,162,'user05',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,165,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,168,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,169,'user05',1002);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,169,'user05',1002);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,170,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,171,'user05',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,172,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,173,'user05',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,174,'user05',1002);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,175,'user05',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,176,'user05',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,177,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,177,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,178,'user05',1002);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,178,'user05',1002);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,179,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,180,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,181,'user05',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,181,'user05',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,182,'user05',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,182,'user05',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,183,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,183,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,183,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,184,'user05',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,184,'user05',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,185,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,186,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,186,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,187,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,188,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,188,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,189,'user05',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,189,'user05',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,190,'user05',1002);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,194,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,194,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,199,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,200,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,201,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,201,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,202,'user05',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,203,'user05',1002);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,204,'user05',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,209,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,210,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,210,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,211,'user05',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,212,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,215,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,216,'user05',1002);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,217,'user05',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,218,'user05',1006);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,219,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,221,'user05',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (102,223,'user05',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,224,'user05',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,227,'user04',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,228,'user04',1004);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,229,'user04',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (105,231,'user04',1005);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,232,'user04',1003);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (101,234,'user04',1002);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,235,'user04',1002);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (103,236,'user01',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (104,236,'user01',1001);
Insert into JAVA.SITE_BOOK_OPTION (OPTION_NO,BOOK_NO,MEMBER_ID,SITE_NO) values (106,236,'user01',1001);
REM INSERTING into JAVA.SITE_OPTION
SET DEFINE OFF;
Insert into JAVA.SITE_OPTION (OPTION_NO,OPTION_NAME,OPTION_PRICE) values (101,'바베큐',20000);
Insert into JAVA.SITE_OPTION (OPTION_NO,OPTION_NAME,OPTION_PRICE) values (102,'캠프파이어',70000);
Insert into JAVA.SITE_OPTION (OPTION_NO,OPTION_NAME,OPTION_PRICE) values (103,'튜브',8000);
Insert into JAVA.SITE_OPTION (OPTION_NO,OPTION_NAME,OPTION_PRICE) values (104,'텐트',50000);
Insert into JAVA.SITE_OPTION (OPTION_NO,OPTION_NAME,OPTION_PRICE) values (105,'보드게임',8000);
Insert into JAVA.SITE_OPTION (OPTION_NO,OPTION_NAME,OPTION_PRICE) values (106,'유아침구',10000);
REM INSERTING into JAVA.TBL_BOARD
SET DEFINE OFF;
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (100,'점심','점심내용','test2',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (101,'test[수정]','test[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (134,'dd익히기','내용입니다','test999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (6,'점심','점심내용','test2',9,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (7,'test[수정]','test[수정]','user03',4,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (8,'dd','dd','test9999',3,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (10,'게시글테스트[수정]>>>','글내용입니다[수정]','user03',7,to_date('24/10/17','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (11,'dd익히기','내용입니다','test999',3,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (12,'HTML','javascript','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (13,'점심','점심내용','test2',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (14,'test[수정]','test[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (15,'dd','dd','test9999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (16,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (17,'dd익히기','내용입니다','test999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (18,'HTML','javascript','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (19,'점심','점심내용','test2',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (20,'test[수정]','test[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (21,'dd','dd','test9999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (22,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (23,'dd익히기','내용입니다','test999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (24,'HTML','javascript','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (25,'점심','점심내용','test2',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (26,'test[수정]','test[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (27,'dd','dd','test9999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (28,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (29,'dd익히기','내용입니다','test999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (30,'HTML','javascript','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (31,'점심','점심내용','test2',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (32,'test[수정]','test[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (33,'dd','dd','test9999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (34,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (35,'dd익히기','내용입니다','test999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (36,'HTML','javascript','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (38,'test[수정]>','test[수정]','user03',2,to_date('24/10/17','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (39,'dd','dd','test9999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (40,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (41,'dd익히기','내용입니다','test999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (42,'HTML','javascript','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (43,'점심','점심내용','test2',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (44,'test[수정]','test[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (45,'dd','dd','test9999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (46,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (47,'dd익히기','내용입니다','test999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (48,'HTML','javascript','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (49,'점심','점심내용','test2',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (50,'test[수정]','test[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (51,'dd','dd','test9999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (102,'dd','dd','test9999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (53,'dd익히기','내용입니다','test999',2,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (54,'HTML','javascript','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (55,'점심','점심내용','test2',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (56,'test[수정]','test[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (57,'dd','dd','test9999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (58,'게시글테스트[수정]>>','글내용입니다[수정]','user03',6,to_date('24/10/17','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (59,'dd익히기','내용입니다','test999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (60,'HTML','javascript','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (61,'점심','점심내용','test2',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (62,'test[수정]','test[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (63,'dd','dd','test9999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (64,'게시글테스트[수정]>','글내용입니다[수정]','user03',1,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (65,'dd익히기','내용입니다','test999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (66,'HTML','javascript','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (67,'점심','점심내용','test2',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (68,'test[수정]','test[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (69,'dd','dd','test9999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (70,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (71,'dd익히기','내용입니다','test999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (72,'HTML','javascript','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (73,'점심','점심내용','test2',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (74,'test[수정]','test[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (75,'dd','dd','test9999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (103,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (77,'dd익히기','내용입니다','test999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (78,'HTML','javascript','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (79,'점심','점심내용','test2',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (80,'test[수정]','test[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (81,'dd','dd','test9999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (82,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (83,'dd익히기','내용입니다','test999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (84,'HTML','javascript','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (85,'점심','점심내용','test2',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (86,'test[수정]','test[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (87,'dd','dd','test9999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (88,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (89,'dd익히기','내용입니다','test999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (90,'HTML','javascript','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (91,'점심','점심내용','test2',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (92,'test[수정]','test[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (93,'dd','dd','test9999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (94,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (95,'dd익히기','내용입니다','test999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (96,'HTML','javascript','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (97,'점심','점심내용','test2',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (98,'test[수정]','test[수정]','user03',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (99,'dd','dd','test9999',0,to_date('24/10/17','RR/MM/DD'),to_date('24/10/17','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (104,'dd익히기','내용입니다','test999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (105,'HTML','javascript','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (106,'점심','점심내용','test2',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (107,'test[수정]','test[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (108,'dd','dd','test9999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (109,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (110,'dd익히기','내용입니다','test999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (111,'HTML','javascript','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (112,'점심','점심내용','test2',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (113,'test[수정]','test[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (114,'dd','dd','test9999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (115,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (116,'dd익히기','내용입니다','test999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (117,'HTML','javascript','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (118,'점심','점심내용','test2',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (119,'test[수정]','test[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (120,'dd','dd','test9999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (121,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (122,'dd익히기','내용입니다','test999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (123,'HTML','javascript','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (124,'점심','점심내용','test2',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (125,'test[수정]','test[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (126,'dd','dd','test9999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (127,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (128,'dd익히기','내용입니다','test999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (129,'HTML','javascript','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (130,'점심','점심내용','test2',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (131,'test[수정]','test[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (132,'dd','dd','test9999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (133,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (135,'HTML','javascript','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (136,'점심','점심내용','test2',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (137,'test[수정]','test[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (138,'dd','dd','test9999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (139,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (140,'dd익히기','내용입니다','test999',1,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (141,'HTML','javascript','user03',2,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (142,'점심','점심내용','test2',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (143,'test[수정]','test[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (144,'dd','dd','test9999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (145,'dd익히기','내용입니다','test999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (146,'HTML','javascript','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (147,'점심','점심내용','test2',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (148,'test[수정]','test[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (149,'dd','dd','test9999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (150,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (151,'dd익히기','내용입니다','test999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (152,'HTML','javascript','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (153,'점심','점심내용','test2',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (154,'test[수정]','test[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (155,'dd','dd','test9999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (156,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (157,'dd익히기','내용입니다','test999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (158,'HTML','javascript','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (159,'점심','점심내용','test2',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (160,'test[수정]','test[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (161,'dd','dd','test9999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (162,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (163,'dd익히기','내용입니다','test999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (164,'HTML','javascript','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (165,'점심','점심내용','test2',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (166,'test[수정]','test[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (167,'dd','dd','test9999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (168,'dd익히기','내용입니다','test999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (169,'HTML','javascript','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (170,'점심','점심내용','test2',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (171,'test[수정]','test[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (172,'dd','dd','test9999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (173,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (174,'dd익히기','내용입니다','test999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (175,'HTML','javascript','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (176,'점심','점심내용','test2',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (177,'test[수정]','test[수정]','user03',1,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (178,'dd','dd','test9999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (179,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (180,'dd익히기','내용입니다','test999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (181,'HTML','javascript','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (182,'점심','점심내용','test2',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (183,'test[수정]','test[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (184,'dd','dd','test9999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (185,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (186,'dd익히기','내용입니다','test999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (187,'HTML','javascript','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (188,'점심','점심내용','test2',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (189,'test[수정]','test[수정]','user03',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (190,'dd','dd','test9999',0,to_date('24/10/18','RR/MM/DD'),to_date('24/10/18','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (192,'이미지테스트','등록테스트','user03',3,to_date('24/10/21','RR/MM/DD'),to_date('24/10/21','RR/MM/DD'),'칵테일2.jpg');
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (193,'이미지테스트','이미지테스트','user03',5,to_date('24/10/21','RR/MM/DD'),to_date('24/10/21','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (194,'ㅇㅇ','ㅇㅇ','user03',3,to_date('24/10/21','RR/MM/DD'),to_date('24/10/21','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (201,'게시글테스트','글작성내용입니다','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (202,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (203,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (204,'JSP익히기','서블릿 중요 내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (205,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (206,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (207,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (208,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (209,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (210,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (211,'게시글테스트[수정]>>>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (212,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (213,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (214,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (215,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (216,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (217,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (218,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (219,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (220,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (221,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (222,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (223,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (224,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (225,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (226,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (227,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (228,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (229,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (230,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (231,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (232,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (233,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (234,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (235,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (236,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (237,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (238,'test[수정]>','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (239,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (240,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (241,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (242,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (243,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (244,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (245,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (246,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (247,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (248,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (249,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (250,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (251,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (252,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (253,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (254,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (255,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (256,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (257,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (258,'게시글테스트[수정]>>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (259,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (260,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (261,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (262,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (263,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (264,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (265,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (266,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (267,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (268,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (269,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (270,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (271,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (272,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (273,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (274,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (275,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (276,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (277,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (278,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (279,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (280,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (281,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (282,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (283,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (284,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (285,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (286,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (287,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (288,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (289,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (290,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (291,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (292,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (293,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (294,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (295,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (296,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (297,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (298,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (299,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (300,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (301,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (302,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (303,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (304,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (305,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (306,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (307,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (308,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (309,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (310,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (311,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (312,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (313,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (314,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (315,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (316,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (317,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (318,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (319,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (320,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (321,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (322,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (323,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (324,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (325,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (326,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (327,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (328,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (329,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (330,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (331,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (332,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (333,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (334,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (335,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (336,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (337,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (338,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (339,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (340,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (341,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (342,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (343,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (344,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (345,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (346,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (347,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (348,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (349,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (350,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (351,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (352,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (353,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (354,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (355,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (356,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (357,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (358,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (359,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (360,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (361,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (362,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (363,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (364,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (365,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (366,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (367,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (368,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (369,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (370,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (371,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (372,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (373,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (374,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (375,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (376,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (377,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (378,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (379,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (380,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (381,'dd익히기','내용입니다','test999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (382,'HTML','javascript','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (383,'점심','점심내용','test2',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (384,'test[수정]','test[수정]','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (385,'dd','dd','test9999',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (386,'이미지테스트','등록테스트','user03',0,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (387,'이미지테스트','이미지테스트','user03',2,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (388,'ㅇㅇ','ㅇㅇ','user03',3,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (389,'게시글테스트','글작성내용입니다','user03',2,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (390,'dd익히기','내용입니다','test999',7,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (391,'HTML','javascript','user03',385,to_date('24/10/22','RR/MM/DD'),to_date('24/10/22','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (401,'게시글테스트','글작성내용입니다','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (402,'dd익히기','내용입니다','user111',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (403,'HTML','javascript','user12',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (404,'JSP익히기','서블릿 중요 내용입니다','user24',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (405,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (406,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (407,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (408,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (409,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (410,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (411,'게시글테스트[수정]>>>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (412,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (413,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (414,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (415,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (416,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (417,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (418,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (419,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (420,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (421,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (422,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (423,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (424,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (425,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (426,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (427,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (428,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (429,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (430,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (431,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (432,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (433,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (434,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (435,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (436,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (437,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (438,'test[수정]>','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (439,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (440,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (441,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (442,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (443,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (444,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (445,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (446,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (447,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (448,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (449,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (450,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (451,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (452,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (453,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (454,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (455,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (456,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (457,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (458,'게시글테스트[수정]>>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (459,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (460,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (461,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (462,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (463,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (464,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (465,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (466,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (467,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (468,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (469,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (470,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (471,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (472,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (473,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (474,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (475,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (476,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (477,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (478,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (479,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (480,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (481,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (482,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (483,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (484,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (485,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (486,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (487,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (488,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (489,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (490,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (491,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (492,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (493,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (494,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (495,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (496,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (497,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (498,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (499,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (500,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (501,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (502,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (503,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (504,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (505,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (506,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (507,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (508,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (509,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (510,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (511,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (512,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (513,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (514,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (515,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (516,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (517,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (518,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (519,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (520,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (521,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (522,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (523,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (524,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (525,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (526,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (527,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (528,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (529,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (530,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (531,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (532,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (533,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (534,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (535,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (536,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (537,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (538,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (539,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (540,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (541,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (542,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (543,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (544,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (545,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (546,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (547,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (548,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (549,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (550,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (551,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (552,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (553,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (554,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (555,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (556,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (557,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (558,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (559,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (560,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (561,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (562,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (563,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (564,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (565,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (566,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (567,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (568,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (569,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (570,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (571,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (572,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (573,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (574,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (575,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (576,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (577,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (578,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (579,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (580,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (581,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (582,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (583,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (584,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (585,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (586,'이미지테스트','등록테스트','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (587,'이미지테스트','이미지테스트','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (588,'ㅇㅇ','ㅇㅇ','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (589,'게시글테스트','글작성내용입니다','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (590,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (591,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (592,'JSP익히기','서블릿 중요 내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (593,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (594,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (595,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (596,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (597,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (598,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (599,'게시글테스트[수정]>>>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (600,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (601,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (602,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (603,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (604,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (605,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (606,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (607,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (608,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (609,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (610,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (611,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (612,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (613,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (614,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (615,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (616,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (617,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (618,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (619,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (620,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (621,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (622,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (623,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (624,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (625,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (626,'test[수정]>','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (627,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (628,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (629,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (630,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (631,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (632,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (633,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (634,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (635,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (636,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (637,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (638,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (639,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (640,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (641,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (642,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (643,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (644,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (645,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (646,'게시글테스트[수정]>>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (647,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (648,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (649,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (650,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (651,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (652,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (653,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (654,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (655,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (656,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (657,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (658,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (659,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (660,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (661,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (662,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (663,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (664,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (665,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (666,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (667,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (668,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (669,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (670,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (671,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (672,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (673,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (674,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (675,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (676,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (677,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (678,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (679,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (680,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (681,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (682,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (683,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (684,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (685,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (686,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (687,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (688,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (689,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (690,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (691,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (692,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (693,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (694,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (695,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (696,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (697,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (698,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (699,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (700,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (701,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (702,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (703,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (704,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (705,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (706,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (707,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (708,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (709,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (710,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (711,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (712,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (713,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (714,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (715,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (716,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (717,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (718,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (719,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (720,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (721,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (722,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (723,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (724,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (725,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (726,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (727,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (728,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (729,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (730,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (731,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (732,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (733,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (734,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (735,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (736,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (737,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (738,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (739,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (740,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (741,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (742,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (743,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (744,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (745,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (746,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (747,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (748,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (749,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (750,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (751,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (752,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (753,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (754,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (755,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (756,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (757,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (758,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (759,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (760,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (761,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (762,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (763,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (764,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (765,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (766,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (767,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (768,'게시글테스트[수정]>','글내용입니다[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (769,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (770,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (771,'점심','점심내용','test2',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (772,'test[수정]','test[수정]','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (773,'dd','dd','test9999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (774,'이미지테스트','등록테스트','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (775,'이미지테스트','이미지테스트','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (776,'ㅇㅇ','ㅇㅇ','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (777,'게시글테스트','글작성내용입니다','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (778,'dd익히기','내용입니다','test999',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (779,'HTML','javascript','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (780,'게시글테스트','글작성내용입니다','user03',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (781,'dd익히기','내용입니다','user111',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (782,'HTML','javascript','user12',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
Insert into JAVA.TBL_BOARD (BOARD_NO,TITLE,CONTENT,WRITER,VIEW_CNT,WRITE_DATE,UPDATE_DATE,IMG) values (783,'JSP익히기','서블릿 중요 내용입니다','user24',0,to_date('24/10/24','RR/MM/DD'),to_date('24/10/24','RR/MM/DD'),null);
REM INSERTING into JAVA.TBL_BUY
SET DEFINE OFF;
REM INSERTING into JAVA.TBL_BUY_LIST
SET DEFINE OFF;
Insert into JAVA.TBL_BUY_LIST (LIST_NAME,BUY_DATE,COP_NAME,STO_TYPE,BUY_QUAN,CONTENT) values ('b01',to_date('24/02/02','RR/MM/DD'),'kim01','p01',100,'none');
REM INSERTING into JAVA.TBL_CARE_LIST
SET DEFINE OFF;
Insert into JAVA.TBL_CARE_LIST (CARE_NO,CARE_DATE,P_ID,STO_TYPE,SELL_QUAN,CONS_ID,CONTENT) values ('s01',to_date('22/02/02','RR/MM/DD'),'eee555','p01',50,'cat111','none');
REM INSERTING into JAVA.TBL_CONSULT
SET DEFINE OFF;
Insert into JAVA.TBL_CONSULT (CONS_DATE,CONS_ID,P_ID,ANI_NAME,ANI_TYPE,CONS_CONTENT,CONS_PRESCRIPTION) values (to_date('02/02/02','RR/MM/DD'),'cat222','bbb222','chewing','cat_black','left-arm','fucidin');
Insert into JAVA.TBL_CONSULT (CONS_DATE,CONS_ID,P_ID,ANI_NAME,ANI_TYPE,CONS_CONTENT,CONS_PRESCRIPTION) values (to_date('01/01/01','RR/MM/DD'),'cat111','aaa111','bbobbi','cat_white','eye_problem','water');
Insert into JAVA.TBL_CONSULT (CONS_DATE,CONS_ID,P_ID,ANI_NAME,ANI_TYPE,CONS_CONTENT,CONS_PRESCRIPTION) values (to_date('03/03/03','RR/MM/DD'),'dog333','ccc333','ddungee','dog_orange','eat_problem','medicin');
REM INSERTING into JAVA.TBL_EVENT
SET DEFINE OFF;
Insert into JAVA.TBL_EVENT (TITLE,START_DATE,END) values ('회의1','2024-10-15',null);
Insert into JAVA.TBL_EVENT (TITLE,START_DATE,END) values ('회식','2024-10-13T19:00:00','2024-10-13T21:00:00');
Insert into JAVA.TBL_EVENT (TITLE,START_DATE,END) values ('출장','2024-10-06','2024-10-11');
Insert into JAVA.TBL_EVENT (TITLE,START_DATE,END) values ('asd','2024-10-03','2024-10-04');
REM INSERTING into JAVA.TBL_MEMBER
SET DEFINE OFF;
Insert into JAVA.TBL_MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PHONE,RESPONSIBILITY,CREATION_DATE) values ('admin','9999','관리자',null,'Admin',to_date('24/10/22','RR/MM/DD'));
Insert into JAVA.TBL_MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PHONE,RESPONSIBILITY,CREATION_DATE) values ('test2','2222','test2','2222','User',to_date('24/10/16','RR/MM/DD'));
Insert into JAVA.TBL_MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PHONE,RESPONSIBILITY,CREATION_DATE) values ('test999','999','연습99','010-9999-9999','User',to_date('24/10/15','RR/MM/DD'));
Insert into JAVA.TBL_MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PHONE,RESPONSIBILITY,CREATION_DATE) values ('test9999','999','연습99','010-9999-9999','User',to_date('24/10/15','RR/MM/DD'));
Insert into JAVA.TBL_MEMBER (MEMBER_ID,PASSWORD,MEMBER_NAME,PHONE,RESPONSIBILITY,CREATION_DATE) values ('user03','1111','홍길순3','010-3333-3333','User',to_date('24/10/22','RR/MM/DD'));
REM INSERTING into JAVA.TBL_PERSON
SET DEFINE OFF;
Insert into JAVA.TBL_PERSON (P_ID,P_NAME,P_AGE,P_PHONE,P_HOME,P_ANIMALS,P_DATE,PW) values ('ddd444','ddd','4','010-4444-4444','사막','4',to_date('04/04/04','RR/MM/DD'),'444');
Insert into JAVA.TBL_PERSON (P_ID,P_NAME,P_AGE,P_PHONE,P_HOME,P_ANIMALS,P_DATE,PW) values ('bbb222','bbb','2','010-2222-2222','이천','2',to_date('02/02/02','RR/MM/DD'),'222');
Insert into JAVA.TBL_PERSON (P_ID,P_NAME,P_AGE,P_PHONE,P_HOME,P_ANIMALS,P_DATE,PW) values ('aaa111','aaa','1','010-1111-1111','일산','1',to_date('01/01/01','RR/MM/DD'),'111');
Insert into JAVA.TBL_PERSON (P_ID,P_NAME,P_AGE,P_PHONE,P_HOME,P_ANIMALS,P_DATE,PW) values ('eee555','김기환','33','010-5555-5555','대구','5',to_date('22/02/02','RR/MM/DD'),'555');
Insert into JAVA.TBL_PERSON (P_ID,P_NAME,P_AGE,P_PHONE,P_HOME,P_ANIMALS,P_DATE,PW) values ('ccc333','ccc','3','010-3333-3333','삼척','3',to_date('03/03/03','RR/MM/DD'),'333');
REM INSERTING into JAVA.TBL_REPLY
SET DEFINE OFF;
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (10,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (12,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (4,'댓글3','user01',376,to_date('24/10/22','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (5,'댓글4','user01',375,to_date('24/10/22','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (6,'댓글6','user01',375,to_date('24/10/22','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (7,'fgfgdh','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (11,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (13,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (14,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (15,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (16,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (46,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (47,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (49,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (52,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (53,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (54,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (55,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (56,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (57,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (59,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (60,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (61,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (62,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (63,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (64,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (65,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (66,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (67,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (68,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (69,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (70,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (71,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (72,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (73,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (74,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (75,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (76,'tgsdfgdsfg','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (77,'tgsdfgdsfg','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (78,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (79,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (80,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (82,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (84,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (87,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (88,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (89,'hjj','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (92,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (93,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (94,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (95,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (96,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (99,'asdfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (100,'asasd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (101,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (103,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (104,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (105,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (235,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (110,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (111,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (112,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (113,'fgfgdh','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (114,'sdfasfd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (115,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (116,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (117,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (118,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (119,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (120,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (121,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (122,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (123,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (124,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (125,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (126,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (127,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (128,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (129,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (130,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (131,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (132,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (133,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (134,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (135,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (136,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (137,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (138,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (139,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (140,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (141,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (142,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (143,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (144,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (145,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (146,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (147,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (148,'tgsdfgdsfg','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (149,'tgsdfgdsfg','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (150,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (151,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (152,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (153,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (154,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (155,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (156,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (157,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (158,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (159,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (160,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (161,'hjj','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (162,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (163,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (164,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (165,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (166,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (167,'asdasd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (168,'asdfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (169,'asdfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (170,'asasd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (171,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (172,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (173,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (174,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (175,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (176,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (177,'hi','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (178,'bye','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (179,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (180,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (181,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (182,'fgfgdh','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (183,'sdfasfd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (184,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (185,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (186,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (187,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (188,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (189,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (190,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (191,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (192,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (193,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (194,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (195,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (196,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (197,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (198,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (199,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (200,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (201,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (202,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (203,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (204,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (205,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (206,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (207,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (208,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (209,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (210,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (211,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (212,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (213,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (214,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (215,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (216,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (217,'tgsdfgdsfg','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (218,'tgsdfgdsfg','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (219,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (220,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (221,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (222,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (223,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (224,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (225,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (226,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (227,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (228,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (229,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (230,'hjj','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (231,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (232,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (233,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (234,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (236,'asdasd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (237,'asdfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (238,'asdfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (239,'asasd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (240,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (241,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (242,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (243,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (244,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (245,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (246,'hi','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (247,'bye','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (248,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (249,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (250,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (251,'fgfgdh','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (252,'sdfasfd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (253,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (254,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (255,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (256,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (257,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (258,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (259,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (260,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (261,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (262,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (263,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (264,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (265,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (266,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (267,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (268,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (269,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (270,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (271,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (272,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (273,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (274,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (275,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (276,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (277,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (278,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (279,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (280,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (281,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (282,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (283,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (284,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (285,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (286,'tgsdfgdsfg','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (287,'tgsdfgdsfg','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (288,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (289,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (290,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (291,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (292,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (293,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (294,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (295,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (296,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (297,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (298,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (299,'hjj','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (300,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (301,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (302,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (303,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (304,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (305,'asdasd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (306,'asdfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (307,'asdfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (308,'asasd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (309,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (310,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (311,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (312,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (313,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (314,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (315,'hi','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (316,'bye','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (317,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (318,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (319,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (320,'fgfgdh','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (321,'sdfasfd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (322,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (323,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (324,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (325,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (326,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (327,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (328,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (329,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (330,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (331,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (332,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (333,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (334,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (335,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (336,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (337,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (338,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (339,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (340,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (341,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (342,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (343,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (344,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (345,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (346,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (347,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (348,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (349,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (350,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (351,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (352,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (353,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (354,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (355,'tgsdfgdsfg','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (356,'tgsdfgdsfg','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (357,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (358,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (359,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (360,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (361,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (362,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (363,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (364,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (365,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (366,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (367,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (368,'hjj','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (369,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (370,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (371,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (372,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (373,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (374,'asdasd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (375,'asdfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (376,'asdfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (377,'asasd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (378,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (379,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (380,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (381,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (382,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (383,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (384,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (385,'hi','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (386,'bye','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (387,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (388,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (389,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (390,'fgfgdh','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (391,'sdfasfd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (392,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (393,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (394,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (395,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (396,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (397,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (398,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (399,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (400,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (401,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (402,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (403,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (404,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (405,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (406,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (407,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (408,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (409,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (410,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (411,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (412,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (413,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (414,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (415,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (416,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (417,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (418,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (419,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (420,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (421,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (422,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (423,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (424,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (425,'tgsdfgdsfg','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (426,'tgsdfgdsfg','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (427,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (428,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (429,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (430,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (431,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (432,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (433,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (434,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (435,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (436,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (437,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (438,'hjj','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (439,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (440,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (441,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (442,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (443,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (444,'asdasd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (445,'asdfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (446,'asdfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (447,'asasd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (448,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (449,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (450,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (451,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (452,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (453,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (454,'hi','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (455,'bye','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (456,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (457,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (458,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (459,'fgfgdh','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (460,'sdfasfd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (461,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (462,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (463,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (464,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (465,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (466,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (467,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (468,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (469,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (470,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (471,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (472,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (473,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (474,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (475,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (476,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (477,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (478,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (479,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (480,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (481,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (482,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (483,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (484,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (485,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (486,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (487,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (488,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (489,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (490,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (491,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (492,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (493,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (494,'tgsdfgdsfg','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (495,'tgsdfgdsfg','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (496,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (497,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (498,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (499,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (500,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (501,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (502,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (503,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (504,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (505,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (506,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (507,'hjj','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (508,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (509,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (510,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (511,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (512,'asdasd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (513,'asdfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (514,'asdfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (515,'asasd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (516,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (517,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (518,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (519,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (520,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (521,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (522,'hi','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (523,'bye','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (524,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (525,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (526,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (527,'fgfgdh','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (528,'sdfasfd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (529,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (530,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (531,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (532,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (533,'afasfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (534,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (535,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (536,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (537,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (538,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (539,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (540,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (541,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (542,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (543,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (544,'safasdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (545,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (546,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (547,'aaa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (548,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (549,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (550,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (551,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (552,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (553,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (554,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (555,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (556,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (557,'fsfas','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (558,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (559,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (560,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (561,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (562,'tgsdfgdsfg','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (563,'tgsdfgdsfg','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (564,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (565,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (566,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (567,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (568,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (569,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (570,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (571,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (572,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (573,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (574,'asdfsadfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (575,'hjj','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (576,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (577,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (578,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (579,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (580,'21112','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (581,'asdasd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (582,'asdfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (583,'asdfsadf','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (584,'asasd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (585,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (586,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (587,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (588,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (589,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (590,'asdfa','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (591,'hi','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (592,'bye','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (593,'test','user03',390,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (594,'test','user03',388,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (621,'댓글6','user01',375,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (622,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (623,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (624,'fgfgdh','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (599,'sfasfdsfsaasd','user03',391,to_date('24/10/23','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (625,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (626,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (627,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (628,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (629,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (630,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (631,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (632,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (633,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (634,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (635,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (636,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (637,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (638,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (639,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (640,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (641,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (642,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (643,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (644,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (645,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (646,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (647,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (648,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (649,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (650,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (651,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (652,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (653,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (654,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (655,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (656,'tgsdfgdsfg','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (657,'tgsdfgdsfg','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (658,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (659,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (660,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (661,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (662,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (663,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (664,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (665,'hjj','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (666,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (667,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (668,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (669,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (670,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (671,'asdfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (672,'asasd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (673,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (674,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (675,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (676,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (677,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (678,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (679,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (680,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (681,'fgfgdh','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (682,'sdfasfd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (683,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (684,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (685,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (686,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (687,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (688,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (689,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (690,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (691,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (692,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (693,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (694,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (695,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (696,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (697,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (698,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (699,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (700,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (701,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (702,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (703,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (704,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (705,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (706,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (707,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (708,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (709,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (710,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (711,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (712,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (713,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (714,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (715,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (716,'tgsdfgdsfg','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (717,'tgsdfgdsfg','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (718,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (719,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (720,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (721,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (722,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (723,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (724,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (725,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (726,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (727,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (728,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (729,'hjj','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (730,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (731,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (732,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (733,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (734,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (735,'asdasd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (736,'asdfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (737,'asdfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (738,'asasd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (739,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (740,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (741,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (742,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (743,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (744,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (745,'hi','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (746,'bye','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (747,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (748,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (749,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (750,'fgfgdh','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (751,'sdfasfd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (752,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (753,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (754,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (755,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (756,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (757,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (758,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (759,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (760,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (761,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (762,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (763,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (764,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (765,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (766,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (767,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (768,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (769,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (770,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (771,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (772,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (773,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (774,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (775,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (776,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (777,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (778,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (779,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (780,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (781,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (782,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (783,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (784,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (785,'tgsdfgdsfg','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (786,'tgsdfgdsfg','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (787,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (788,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (789,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (790,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (791,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (792,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (793,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (794,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (795,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (796,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (797,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (798,'hjj','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (799,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (800,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (801,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (802,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (803,'asdasd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (804,'asdfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (805,'asdfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (806,'asasd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (807,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (808,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (809,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (810,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (811,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (812,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (813,'hi','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (814,'bye','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (815,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (816,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (817,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (818,'fgfgdh','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (819,'sdfasfd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (820,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (821,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (822,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (823,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (824,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (825,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (826,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (827,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (828,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (829,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (830,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (831,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (832,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (833,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (834,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (835,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (836,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (837,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (838,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (839,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (840,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (841,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (842,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (843,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (844,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (845,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (846,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (847,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (848,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (849,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (850,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (851,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (852,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (853,'tgsdfgdsfg','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (854,'tgsdfgdsfg','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (855,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (856,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (857,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (858,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (859,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (860,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (861,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (862,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (863,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (864,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (865,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (866,'hjj','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (867,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (868,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (869,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (870,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (871,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (872,'asdasd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (873,'asdfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (874,'asdfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (875,'asasd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (876,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (877,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (878,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (879,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (880,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (881,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (882,'hi','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (883,'bye','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (884,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (885,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (886,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (887,'fgfgdh','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (888,'sdfasfd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (889,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (890,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (891,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (892,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (893,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (894,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (895,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (896,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (897,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (898,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (899,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (900,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (901,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (902,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (903,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (904,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (905,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (906,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (907,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (908,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (909,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (910,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (911,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (912,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (913,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (914,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (915,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (916,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (917,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (918,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (919,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (920,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (921,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (922,'tgsdfgdsfg','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (923,'tgsdfgdsfg','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (924,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (925,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (926,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (927,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (928,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (929,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (930,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (931,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (932,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (933,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (934,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (935,'hjj','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (936,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (937,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (938,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (939,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (940,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (941,'asdasd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (942,'asdfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (943,'asdfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (944,'asasd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (945,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (946,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (947,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (948,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (949,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (950,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (951,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (952,'hi','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (953,'bye','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (954,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (955,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (956,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (957,'fgfgdh','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (958,'sdfasfd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (959,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (960,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (961,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (962,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (963,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (964,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (965,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (966,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (967,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (968,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (969,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (970,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (971,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (972,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (973,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (974,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (975,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (976,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (977,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (978,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (979,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (980,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (981,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (982,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (983,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (984,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (985,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (986,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (987,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (988,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (989,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (990,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (991,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (992,'tgsdfgdsfg','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (993,'tgsdfgdsfg','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (994,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (995,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (996,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (997,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (998,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (999,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1000,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1001,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1002,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1003,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1004,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1005,'hjj','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1006,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1007,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1008,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1009,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1010,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1011,'asdasd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1012,'asdfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1013,'asdfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1014,'asasd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1015,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1016,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1017,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1018,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1019,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1020,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1021,'hi','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1022,'bye','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1023,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1024,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1025,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1026,'fgfgdh','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1027,'sdfasfd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1028,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1029,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1030,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1031,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1032,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1033,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1034,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1035,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1036,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1037,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1038,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1039,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1040,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1041,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1042,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1043,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1044,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1045,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1046,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1047,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1048,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1049,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1050,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1051,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1052,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1053,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1054,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1055,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1056,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1057,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1058,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1059,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1060,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1061,'tgsdfgdsfg','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1062,'tgsdfgdsfg','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1063,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1064,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1065,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1066,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1067,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1068,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1069,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1070,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1071,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1072,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1073,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1074,'hjj','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1075,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1076,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1077,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1078,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1079,'asdasd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1080,'asdfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1081,'asdfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1082,'asasd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1083,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1084,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1085,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1086,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1087,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1088,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1089,'hi','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1090,'bye','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1091,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1092,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1093,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1094,'fgfgdh','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1095,'sdfasfd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1096,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1097,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1098,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1099,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1100,'afasfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1101,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1102,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1103,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1104,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1105,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1106,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1107,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1108,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1109,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1110,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1111,'safasdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1112,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1113,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1114,'aaa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1115,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1116,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1117,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1118,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1119,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1120,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1121,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1122,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1123,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1124,'fsfas','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1125,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1126,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1127,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1128,'fsfassdfsadfsdfsdf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1129,'tgsdfgdsfg','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1130,'tgsdfgdsfg','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1131,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1132,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1133,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1134,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1135,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1136,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1137,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1138,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1139,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1140,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1141,'asdfsadfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1142,'hjj','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1143,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1144,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1145,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1146,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1147,'21112','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1148,'asdasd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1149,'asdfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1150,'asdfsadf','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1151,'asasd','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1152,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1153,'asdfa','user03',391,to_date('24/10/24','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1161,'asdfsadf','user03',391,to_date('24/10/28','RR/MM/DD'));
Insert into JAVA.TBL_REPLY (REPLY_NO,REPLY,REPLYER,BOARD_NO,REPLY_DATE) values (1162,'asdfsadf','user03',391,to_date('24/10/28','RR/MM/DD'));
REM INSERTING into JAVA.TBL_STORAGE
SET DEFINE OFF;
Insert into JAVA.TBL_STORAGE (STO_TYPE,STO_QUAN,STO_SELL,STO_NOW,STO_LOSS) values ('p01',50,0,0,0);
Insert into JAVA.TBL_STORAGE (STO_TYPE,STO_QUAN,STO_SELL,STO_NOW,STO_LOSS) values ('t01',0,0,0,0);
Insert into JAVA.TBL_STORAGE (STO_TYPE,STO_QUAN,STO_SELL,STO_NOW,STO_LOSS) values ('p02',0,0,0,0);
Insert into JAVA.TBL_STORAGE (STO_TYPE,STO_QUAN,STO_SELL,STO_NOW,STO_LOSS) values ('t02',0,0,0,0);
--------------------------------------------------------
--  DDL for Index PK_REPLY
--------------------------------------------------------

  CREATE UNIQUE INDEX "JAVA"."PK_REPLY" ON "JAVA"."TBL_REPLY" ("REPLY_NO") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  Constraints for Table BOOK
--------------------------------------------------------

  ALTER TABLE "JAVA"."BOOK" MODIFY ("BNUM" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."BOOK" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."BOOK" MODIFY ("WRITER" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."BOOK" MODIFY ("TITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table EMPLOYEE
--------------------------------------------------------

  ALTER TABLE "JAVA"."EMPLOYEE" ADD PRIMARY KEY ("EMPLOYEE_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JAVA"."EMPLOYEE" MODIFY ("EMPLOYEE_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_CONSULT
--------------------------------------------------------

  ALTER TABLE "JAVA"."TBL_CONSULT" ADD PRIMARY KEY ("CONS_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JAVA"."TBL_CONSULT" MODIFY ("CONS_CONTENT" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."TBL_CONSULT" MODIFY ("ANI_TYPE" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."TBL_CONSULT" MODIFY ("ANI_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARDS
--------------------------------------------------------

  ALTER TABLE "JAVA"."BOARDS" ADD PRIMARY KEY ("BNO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JAVA"."BOARDS" MODIFY ("BWRITER" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."BOARDS" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."BOARDS" MODIFY ("BTITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_MEMBER
--------------------------------------------------------

  ALTER TABLE "JAVA"."TBL_MEMBER" ADD PRIMARY KEY ("MEMBER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JAVA"."TBL_MEMBER" MODIFY ("MEMBER_NAME" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."TBL_MEMBER" MODIFY ("PASSWORD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCT_TBL
--------------------------------------------------------

  ALTER TABLE "JAVA"."PRODUCT_TBL" ADD PRIMARY KEY ("PRD_CODE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JAVA"."PRODUCT_TBL" MODIFY ("PRD_DESC" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."PRODUCT_TBL" MODIFY ("PRD_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "JAVA"."MEMBER" ADD PRIMARY KEY ("MEMBER_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JAVA"."MEMBER" MODIFY ("PERMISSION" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."MEMBER" MODIFY ("JOINED_DATE" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."MEMBER" MODIFY ("TEL" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."MEMBER" MODIFY ("MEMBER_NAME" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."MEMBER" MODIFY ("PASSWORD" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SITE_OPTION
--------------------------------------------------------

  ALTER TABLE "JAVA"."SITE_OPTION" ADD PRIMARY KEY ("OPTION_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table SITE_BOOK
--------------------------------------------------------

  ALTER TABLE "JAVA"."SITE_BOOK" ADD PRIMARY KEY ("BOOK_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JAVA"."SITE_BOOK" MODIFY ("CREATE_DATE" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."SITE_BOOK" MODIFY ("END_DATE" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."SITE_BOOK" MODIFY ("START_DATE" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."SITE_BOOK" MODIFY ("MEM_CNT" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."SITE_BOOK" MODIFY ("SITE_NO" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."SITE_BOOK" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "JAVA"."BOARD" ADD PRIMARY KEY ("BOARD_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JAVA"."BOARD" MODIFY ("WRITE_DATE" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."BOARD" MODIFY ("TITLE" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."BOARD" MODIFY ("BOARD_CATEGORY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SITE
--------------------------------------------------------

  ALTER TABLE "JAVA"."SITE" ADD PRIMARY KEY ("SITE_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JAVA"."SITE" MODIFY ("USE_FLAG" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."SITE" MODIFY ("SITE_PRICE" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."SITE" MODIFY ("SITE_MAX" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."SITE" MODIFY ("CATEGORY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_EVENT
--------------------------------------------------------

  ALTER TABLE "JAVA"."TBL_EVENT" MODIFY ("START_DATE" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."TBL_EVENT" MODIFY ("TITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_STORAGE
--------------------------------------------------------

  ALTER TABLE "JAVA"."TBL_STORAGE" ADD PRIMARY KEY ("STO_TYPE")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JAVA"."TBL_STORAGE" MODIFY ("STO_LOSS" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."TBL_STORAGE" MODIFY ("STO_NOW" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."TBL_STORAGE" MODIFY ("STO_SELL" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."TBL_STORAGE" MODIFY ("STO_QUAN" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_BOARD
--------------------------------------------------------

  ALTER TABLE "JAVA"."TBL_BOARD" ADD PRIMARY KEY ("BOARD_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JAVA"."TBL_BOARD" MODIFY ("WRITER" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."TBL_BOARD" MODIFY ("CONTENT" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."TBL_BOARD" MODIFY ("TITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_BUY_LIST
--------------------------------------------------------

  ALTER TABLE "JAVA"."TBL_BUY_LIST" ADD PRIMARY KEY ("LIST_NAME")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JAVA"."TBL_BUY_LIST" MODIFY ("STO_TYPE" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."TBL_BUY_LIST" MODIFY ("COP_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_REPLY
--------------------------------------------------------

  ALTER TABLE "JAVA"."TBL_REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY ("REPLY_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JAVA"."TBL_REPLY" MODIFY ("BOARD_NO" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."TBL_REPLY" MODIFY ("REPLYER" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."TBL_REPLY" MODIFY ("REPLY" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_CARE_LIST
--------------------------------------------------------

  ALTER TABLE "JAVA"."TBL_CARE_LIST" ADD PRIMARY KEY ("CARE_NO")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JAVA"."TBL_CARE_LIST" MODIFY ("CONS_ID" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."TBL_CARE_LIST" MODIFY ("STO_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_PERSON
--------------------------------------------------------

  ALTER TABLE "JAVA"."TBL_PERSON" ADD PRIMARY KEY ("P_ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "JAVA"."TBL_PERSON" MODIFY ("P_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table TBL_BUY
--------------------------------------------------------

  ALTER TABLE "JAVA"."TBL_BUY" MODIFY ("BUY_QUAN" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."TBL_BUY" MODIFY ("BUY_NAME" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."TBL_BUY" MODIFY ("BUY_TYPE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table SITE_BOOK_OPTION
--------------------------------------------------------

  ALTER TABLE "JAVA"."SITE_BOOK_OPTION" MODIFY ("SITE_NO" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."SITE_BOOK_OPTION" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."SITE_BOOK_OPTION" MODIFY ("BOOK_NO" NOT NULL ENABLE);
  ALTER TABLE "JAVA"."SITE_BOOK_OPTION" MODIFY ("OPTION_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table TBL_BUY
--------------------------------------------------------

  ALTER TABLE "JAVA"."TBL_BUY" ADD CONSTRAINT "FK_BUY" FOREIGN KEY ("BUY_TYPE")
	  REFERENCES "JAVA"."TBL_STORAGE" ("STO_TYPE") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table TBL_CONSULT
--------------------------------------------------------

  ALTER TABLE "JAVA"."TBL_CONSULT" ADD CONSTRAINT "FK" FOREIGN KEY ("P_ID")
	  REFERENCES "JAVA"."TBL_PERSON" ("P_ID") ON DELETE SET NULL ENABLE;
