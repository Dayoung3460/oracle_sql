
DROP TABLE grpwr_schedule;

CREATE TABLE grpwr_schedule (
	schedule_id	number(8, 0)		NOT NULL,
	schedule_type	varchar2(10)	DEFAULT 'DEPT'	NOT NULL,
	department_code	varchar2(20)		NULL,
	schedule_conent	varchar2(100)		NOT NULL,
	schedule_start_date	date		NOT NULL,
	schedule_end_date	date		NOT NULL,
	employee_num	number(10)		NOT NULL,
	company_num	number(6, 0)		NOT NULL
);

COMMENT ON COLUMN grpwr_schedule.schedule_id IS 'sequence: grpwr_schdul_seq';

COMMENT ON COLUMN grpwr_schedule.schedule_type IS 'CHECK (gender IN (''DEPT'', ''PERSONAL''))';

COMMENT ON COLUMN grpwr_schedule.department_code IS 'schedule_type이 DEPT 일 때 값이 있음';

DROP TABLE stdr_document;

CREATE TABLE stdr_document (
	document_id	number(10)		NOT NULL,
	document_type	varchar2(50)		NOT NULL,
	document_name	varchar2(50)		NOT NULL,
	document_template	varchar2(1000)		NOT NULL,
	bhf_name	varchar2(30)		NOT NULL,
	approval_type	varchar2(30)	DEFAULT 'IN'	NOT NULL,
	company_num	number(6, 0)		NOT NULL
);

COMMENT ON COLUMN stdr_document.document_id IS 'sequence: grpwr_doc_seq';

COMMENT ON COLUMN stdr_document.document_type IS 'ex) 휴가, 외근, 비용 등';

COMMENT ON COLUMN stdr_document.document_template IS 'html code';

COMMENT ON COLUMN stdr_document.bhf_name IS '결재하는 부서';

COMMENT ON COLUMN stdr_document.approval_type IS 'CHECK (approval_type IN (''IN'', ''OUT''))';

DROP TABLE grpwr_vendor;

CREATE TABLE grpwr_vendor (
	vendor_id	number(10)		NOT NULL,
	vendor_name	varchar2(30)		NOT NULL,
	chief_name	varchar2(30)		NOT NULL,
	address	varchar2(100)		NOT NULL,
	officer	varchar2(30)		NOT NULL,
	business_type	varchar2(30)	DEFAULT 'INDIVIDUAL'	NOT NULL,
	email	varchar2(100)		NOT NULL,
	business_registeration_number	varchar2(30)		NOT NULL,
	phone	varchar2(30)		NOT NULL,
	margin_rate	number(10)		NOT NULL,
	bank_name	varchar2(30)		NOT NULL,
	bank_account	varchar2(30)		NOT NULL,
	depositor	varchar2(30)		NOT NULL
);

COMMENT ON COLUMN grpwr_vendor.business_type IS 'CHECK (business_type IN (''INDIVIDUAL'', ''CORPORATION''))';


DROP TABLE login;

CREATE TABLE login (
	login_id	number(10)		NOT NULL,
	company_eng_name	varchar2(50)		NOT NULL,
	employee_num	number(10)		NOT NULL,
	login_employee_id	varchar2(50)		NOT NULL,
	login_password	varchar2(500)		NOT NULL
);

DROP TABLE grpwr_event;

CREATE TABLE grpwr_event (
	event_id	number(10)		NOT NULL,
	board_id	number(8, 0)		NOT NULL,
	product_standard	varchar2(10)	DEFAULT 'CATEGORY'	NOT NULL,
	classification_id	number(10)		NULL,
	brand_id	number(10)		NULL,
	event_percentage	number(3)		NOT NULL,
	event_start_date	date		NOT NULL,
	event_end_date	date		NOT NULL
);

COMMENT ON COLUMN grpwr_event.board_id IS 'sequence: grpwr_brd_seq';

COMMENT ON COLUMN grpwr_event.product_standard IS 'CHECK (gender IN (''CATEGORY'', ''BRAND''))';

DROP TABLE business_bhf;

CREATE TABLE business_bhf (
	bhf_id	number(10)		NOT NULL,
	hhf_name	varchar2(30)		NOT NULL,
	bhf_phone	varchar2(30)		NOT NULL,
	bhf_address	varchar2(100)		NOT NULL,
	bhf_initial_cost	number(10)		NOT NULL,
	real_estate_name	varchar2(30)		NOT NULL,
	real_estate_phone	varchar2(100)		NOT NULL,
	rental_type	varchar2(30)	DEFAULT 'LFSTS'	NOT NULL,
	monthly_maintenance_cost	number(10)		NULL,
	company_num	number(6, 0)		NOT NULL
);

COMMENT ON COLUMN business_bhf.bhf_initial_cost IS '단위: 만원';

COMMENT ON COLUMN business_bhf.rental_type IS 'CHECK (rental_type IN (''LFSTS'', ''MTHT''))';

COMMENT ON COLUMN business_bhf.monthly_maintenance_cost IS '단위: 만원';

DROP TABLE stdr_classification;

CREATE TABLE stdr_classification (
	classification_id	number(10)		NOT NULL,
	classification_code	varchar2(20)		NOT NULL,
	classification_name	varchar2(20)		NOT NULL,
	distribution_time_limit	number(10)		NOT NULL,
	company_num	number(6, 0)		NOT NULL
);

COMMENT ON COLUMN stdr_classification.classification_code IS '영어 대문자 두자리';

COMMENT ON COLUMN stdr_classification.distribution_time_limit IS '단위: 연';

DROP TABLE grpwr_in_approval;

CREATE TABLE grpwr_in_approval (
	in_approval_id	number(8, 0)		NOT NULL,
	document_id	number(10)		NOT NULL,
	employee_num	number(10)		NOT NULL,
	in_approval_request_date	date	DEFAULT sysdate	NOT NULL,
	in_approval_status	varchar2(10)	DEFAULT 'WAITING'	NOT NULL,
	in_approval_request_content	varchar2(1000)		NOT NULL,
	in_approval_rejected_content	varchar2(500)		NULL,
	in_approval_rejected_path	VARCHAR(255)		NULL,
	company_num	number(6, 0)		NOT NULL
);

COMMENT ON COLUMN grpwr_in_approval.in_approval_id IS 'sequence: grpwr_apprv_seq';

COMMENT ON COLUMN grpwr_in_approval.document_id IS '기준정보_결재문서 문서번호';

COMMENT ON COLUMN grpwr_in_approval.employee_num IS '결재 요청한 직원';

COMMENT ON COLUMN grpwr_in_approval.in_approval_status IS 'CHECK (approval_status IN (''WAITING'', ''APPROVED'', ''REJECTED''))';

COMMENT ON COLUMN grpwr_in_approval.in_approval_request_content IS 'html code';

DROP TABLE grpwr_board;

CREATE TABLE grpwr_board (
	board_id	number(8, 0)		NOT NULL,
	board_title	varchar2(100)		NOT NULL,
	board_content	varchar2(1000)		NOT NULL,
	board_category	varchar2(50)		NOT NULL,
	employee_num	number(10)		NOT NULL,
	board_date	date	DEFAULT sysdate	NOT NULL,
	company_num	number(6, 0)		NOT NULL
);

COMMENT ON COLUMN grpwr_board.board_id IS 'sequence: grpwr_brd_seq';

COMMENT ON COLUMN grpwr_board.employee_num IS '게시글 작성자';

COMMENT ON COLUMN grpwr_board.board_date IS '게시글을 수정하면 업데이트';

DROP TABLE grpwr_reply;

CREATE TABLE grpwr_reply (
	reply_id	number(8, 0)		NOT NULL,
	board_id	number(8, 0)		NOT NULL,
	employee_num	number(10)		NOT NULL,
	reply_content	varchar2(500)		NOT NULL,
	reply_date	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN grpwr_reply.reply_id IS 'sequence: grpwr_reply_seq';

COMMENT ON COLUMN grpwr_reply.board_id IS 'sequence: grpwr_brd_seq';

COMMENT ON COLUMN grpwr_reply.employee_num IS '댓글 작성자';

COMMENT ON COLUMN grpwr_reply.reply_date IS '댓글 수정하면 업데이트됨';

DROP TABLE grpwr_chat_message;

CREATE TABLE grpwr_chat_message (
	grpwr_msg_id	number(10)		NOT NULL,
	grpwr_room_id	number(10)		NOT NULL,
	employee_num	number(10)		NOT NULL,
	grpwr_msg_content	varchar2(500)		NOT NULL,
	grpwr_msg_sent_at	timestamp	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN grpwr_chat_message.grpwr_msg_id IS 'sequence: grpwr_msg_seq';

COMMENT ON COLUMN grpwr_chat_message.grpwr_room_id IS 'sequence: grpwr_room_seq';

DROP TABLE grpwr_ex_approval;

CREATE TABLE grpwr_ex_approval (
	ex_approval_id	number(10)		NOT NULL,
	vendor_id	number(10)		NOT NULL,
	document_id	number(10)		NOT NULL,
	employee_num	number(10)		NOT NULL,
	manager_num	number(10)		NULL,
	ex_approval_request_date	date	DEFAULT sysdate	NOT NULL,
	ex_approval_completed_date	date		NULL,
	ex_approval_status	varchar2(10)	DEFAULT 'WAITING'	NOT NULL,
	ex_approval_request_content	varchar2(1000)		NOT NULL,
	ex_approval_rejected_content	varchar(500)		NULL,
	company_num	number(6, 0)		NOT NULL
);

COMMENT ON COLUMN grpwr_ex_approval.document_id IS '기준정보 문서정보';

COMMENT ON COLUMN grpwr_ex_approval.employee_num IS '결재 요청한 직원';

COMMENT ON COLUMN grpwr_ex_approval.manager_num IS '결재 처리하는 관리자';

COMMENT ON COLUMN grpwr_ex_approval.ex_approval_status IS 'CHECK (ex_approval_status IN (''WAITING'', ''MANAGER_APPROVED'', ''MANAGER_REJECTED'',  ''VENDOR_APPROVED'',  ''VENDOR_REJECTED''))';

COMMENT ON COLUMN grpwr_ex_approval.ex_approval_request_content IS 'html code';

DROP TABLE stdr_warehouse;

CREATE TABLE stdr_warehouse (
	warehouse_id	number(10)		NOT NULL,
	warehouse_name	varchar2(20)		NOT NULL,
	company_num	number(6, 0)		NOT NULL
);

DROP TABLE stdr_brand;

CREATE TABLE stdr_brand (
	brand_id	number(10)		NOT NULL,
	brand_code	varchar2(20)		NOT NULL,
	brand_name	varchar2(20)		NOT NULL,
	company_num	number(6, 0)		NOT NULL
);

COMMENT ON COLUMN stdr_brand.brand_code IS '영어 대문자 두자리';

DROP TABLE grpwr_chat_room;

CREATE TABLE grpwr_chat_room (
	room_id	number(10)		NOT NULL,
	employee_num1	number(10)		NOT NULL,
	employee_num2	number(10)		NOT NULL,
	grpwr_room_created_at	timestamp		NOT NULL,
	company_num	number(6, 0)		NOT NULL
);

COMMENT ON COLUMN grpwr_chat_room.room_id IS 'sequence: grpwr_room_seq';

COMMENT ON COLUMN grpwr_chat_room.employee_num1 IS '사원번호 / CONSTRAINT unique_chat UNIQUE (employee_num1, employee_num2)';

COMMENT ON COLUMN grpwr_chat_room.employee_num2 IS '사원번호';

ALTER TABLE grpwr_schedule ADD CONSTRAINT PK_GRPWR_SCHEDULE PRIMARY KEY (
	schedule_id
);

ALTER TABLE stdr_document ADD CONSTRAINT PK_STDR_DOCUMENT PRIMARY KEY (
	document_id
);

ALTER TABLE grpwr_vendor ADD CONSTRAINT PK_GRPWR_VENDOR PRIMARY KEY (
	vendor_id
);

ALTER TABLE login ADD CONSTRAINT PK_LOGIN PRIMARY KEY (
	login_id
);

ALTER TABLE grpwr_event ADD CONSTRAINT PK_GRPWR_EVENT PRIMARY KEY (
	event_id
);

ALTER TABLE business_bhf ADD CONSTRAINT PK_BUSINESS_BHF PRIMARY KEY (
	bhf_id
);

ALTER TABLE stdr_classification ADD CONSTRAINT PK_STDR_CLASSIFICATION PRIMARY KEY (
	classification_id
);

ALTER TABLE grpwr_in_approval ADD CONSTRAINT PK_GRPWR_IN_APPROVAL PRIMARY KEY (
	in_approval_id
);

ALTER TABLE grpwr_board ADD CONSTRAINT PK_GRPWR_BOARD PRIMARY KEY (
	board_id
);

ALTER TABLE grpwr_reply ADD CONSTRAINT PK_GRPWR_REPLY PRIMARY KEY (
	reply_id
);

ALTER TABLE grpwr_chat_message ADD CONSTRAINT PK_GRPWR_CHAT_MESSAGE PRIMARY KEY (
	grpwr_msg_id
);

ALTER TABLE grpwr_ex_approval ADD CONSTRAINT PK_GRPWR_EX_APPROVAL PRIMARY KEY (
	ex_approval_id
);

ALTER TABLE stdr_warehouse ADD CONSTRAINT PK_STDR_WAREHOUSE PRIMARY KEY (
	warehouse_id
);

ALTER TABLE stdr_brand ADD CONSTRAINT PK_STDR_BRAND PRIMARY KEY (
	brand_id
);

ALTER TABLE grpwr_chat_room ADD CONSTRAINT PK_GRPWR_CHAT_ROOM PRIMARY KEY (
	room_id
);

ALTER TABLE grpwr_event ADD CONSTRAINT FK_board_TO_event FOREIGN KEY (
	board_id
)
REFERENCES grpwr_board (
	board_id
);

ALTER TABLE grpwr_reply ADD CONSTRAINT FK_board_TO_reply FOREIGN KEY (
	board_id
)
REFERENCES grpwr_board (
	board_id
);

ALTER TABLE grpwr_chat_message ADD CONSTRAINT FK_room_TO_message FOREIGN KEY (
	grpwr_room_id
)
REFERENCES grpwr_chat_room (
	room_id
);

ALTER TABLE grpwr_ex_approval ADD CONSTRAINT FK_vendor_TO_ex_approval FOREIGN KEY (
	vendor_id
)
REFERENCES grpwr_vendor (
	vendor_id
);