CREATE TABLE accnut_deduction_details (
	deduction_details_code	varchar2(50)		NOT NULL,
	salary_account_book_code	varchar2(50)		NOT NULL,
	deduction_section	varchar2(20)		NOT NULL,
	deduction_amount	number(12,0)	DEFAULT 0	NOT NULL,
	process_alternative	varchar2(20)	DEFAULT 'PC01'	NOT NULL
);

COMMENT ON COLUMN accnut_deduction_details.deduction_section IS 'ex) 보험,() 연금(),소득세()';

CREATE TABLE grpwr_schedule (
	schedule_id	number(8, 0)		NOT NULL,
	schedule_type	varchar2(10)	DEFAULT 'DEPT'	NOT NULL,
	department_code	varchar2(20)		NULL,
	schedule_conent	varchar2(100)		NOT NULL,
	schedule_start_date	date		NOT NULL,
	schedule_end_date	date		NOT NULL,
	Field	VARCHAR(255)		NULL
);

COMMENT ON COLUMN grpwr_schedule.schedule_id IS 'sequence: grpwr_schdul_seq';


COMMENT ON COLUMN grpwr_schedule.schedule_type IS 'CHECK (schedule_type IN (''DEPT'', ''PERSONAL''))';


COMMENT ON COLUMN grpwr_schedule.department_code IS 'schedule_type이 DEPT 일 때 값이 있음';

CREATE TABLE accnut_dealings_account_book (
	dealings_account_book_code	varchar2(50)		NOT NULL,
	section	varchar2(20)		NOT NULL,
	types_of_transaction	varchar2(20)		NOT NULL,
	amount	number(12,0)	DEFAULT 0	NOT NULL,
	vat_alternative	char(1)	DEFAULT 'N'	NULL,
	dealings_contents	varchar2(100)		NULL,
	deal_date	date	DEFAULT sysdate	NOT NULL,
	department	varchar2(30)		NULL
);

COMMENT ON COLUMN accnut_dealings_account_book.section IS 'ex) 수익(), 지출()';

COMMENT ON COLUMN accnut_dealings_account_book.types_of_transaction IS 'ex) 현금(), 통장(), 카드()';

CREATE TABLE stdr_document (
	document_id	number(10)		NOT NULL,
	document_type	varchar2(50)		NOT NULL,
	document_name	varchar2(50)		NOT NULL,
	document_template	varchar2(1000)		NOT NULL,
	bhf_name	varchar2(30)		NOT NULL,
	approval_type	varchar2(30)	DEFAULT 'IN'	NOT NULL
);

COMMENT ON COLUMN stdr_document.document_id IS 'sequence: grpwr_doc_seq';

COMMENT ON COLUMN stdr_document.document_type IS 'ex) 휴가, 외근, 비용 등';

COMMENT ON COLUMN stdr_document.document_template IS 'html code';

COMMENT ON COLUMN stdr_document.bhf_name IS '결재하는 부서';

COMMENT ON COLUMN stdr_document.approval_type IS 'CHECK (approval_type IN (''IN'', ''OUT''))';

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

CREATE TABLE erp_bill (
	bill_num	number(6,0)		NOT NULL,
	subscription_num	number(6,0)		NOT NULL,
	employee_num	number(6,0)		NOT NULL,
	bill_form	varchar2(4)	DEFAULT 'EB01'	NOT NULL,
	pdf_address	varchar2(100)		NULL,
	issue_company	varchar2(4)	DEFAULT 'EI01'	NOT NULL,
	company_code	varchar2(50)		NULL,
	issue_date	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN erp_bill.bill_num IS '현영/세계 의 모든 발급 PDF 조회 시퀀스 erp_bill_seq';

COMMENT ON COLUMN erp_bill.subscription_num IS '구독번호';

COMMENT ON COLUMN erp_bill.employee_num IS '제공자 번호 이거나 수요자 번호이거나 상태별상이';

COMMENT ON COLUMN erp_bill.bill_form IS 'EB01=현금영수증, EB02=세금계산서 [EB]';

COMMENT ON COLUMN erp_bill.pdf_address IS '발급당시 서버에 저장된위치+파일명';

COMMENT ON COLUMN erp_bill.issue_company IS 'EI01=erp수요사 / EI02=erp공급사 [EI]';

COMMENT ON COLUMN erp_bill.company_code IS '발급처리회사가 EI01인경우 회사코드가 들어감';

COMMENT ON COLUMN erp_bill.issue_date IS '발급일자';

CREATE TABLE business_delivery (
	business_delivery_id	varchar2(50)		NOT NULL,
	order_id	varchar2(50)		NULL,
	delivery_date	date		NULL,
	employee_num	number(10)		NOT NULL,
	delivery_status	varchar2(20)		NOT NULL,
	remark	varchar2(1000)		NULL
);

COMMENT ON COLUMN business_delivery.delivery_status IS '출고대기,  출고완료';

CREATE TABLE bhf_order (
	order_code	varchar2(30)		NOT NULL,
	branch_office_id	varchar2(30)		NULL,
	progress_status	varchar2(10)	DEFAULT '신청'	NOT NULL,
	order_cancellation_reason	varchar2(1000)		NULL,
	order_date	date	DEFAULT sysdate	NOT NULL,
	due_date	date		NULL,
	remark	varchar2(1000)		NULL
);

COMMENT ON COLUMN bhf_order.progress_status IS '신청,승인,취소,출고,완료';

CREATE TABLE stdr_class_of_position (
	class_of_position_id	number(10)		NOT NULL,
	class_of_position	varchar2(10)		NOT NULL
);

CREATE TABLE purchs_purchase_header (
	purchase_num NUMBER NOT NULL,
	purchase_date DATE DEFAULT sysdate NOT NULL,
	purchase_due_date DATE NOT NULL,
	purchase_vat_flag NUMBER DEFAULT 0 NOT NULL,
	purchase_status VARCHAR2(20) DEFAULT '진행중' NOT NULL,
	vendor_id NUMBER(10) NOT NULL,
	employee_num NUMBER(10) NOT NULL,
	purchase_total_amount NUMBER DEFAULT 0 NOT NULL
);


COMMENT ON COLUMN purchs_purchase_header.purchase_num IS 'sysdate+seq';

COMMENT ON COLUMN purchs_purchase_header.purchase_vat_flag IS '사용(10%) = 0, 사용하지 않음 = 1';

COMMENT ON COLUMN purchs_purchase_header.purchase_status IS '진행중 ,완료 ,취소';

COMMENT ON COLUMN purchs_purchase_header.vendor_id IS 'FK';

COMMENT ON COLUMN purchs_purchase_header.employee_num IS 'FK';

CREATE TABLE erp_subscription_name (
	subscription_name_num	number(6,0)		NOT NULL,
	subscription_name	varchar2(100)		NOT NULL
);

COMMENT ON COLUMN erp_subscription_name.subscription_name_num IS '구독정보 (기준정보 테이블) 시퀀스 erp_subscrpt_name_seq';

COMMENT ON COLUMN erp_subscription_name.subscription_name IS 'sERPing, 인사관리, 그룹웨어, 지점관리 등(서비스명)';

CREATE TABLE login (
	login_id	number(10)		NOT NULL,
	company_num	number(10)		NOT NULL,
	employee_num	number(10)		NOT NULL,
	login_employee_id	varchar2(50)		NOT NULL,
	login_password	varchar2(500)		NOT NULL
);

CREATE TABLE stdr_goods_retrieval_reason (
	goods_retrieval_reason_id	number(10)		NOT NULL,
	section	varchar2(10)		NOT NULL,
	reason	varchar2(1000)		NOT NULL
);

COMMENT ON COLUMN stdr_goods_retrieval_reason.section IS '교환,반품';

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


CREATE TABLE bhf_order_detail (
	oderd_detail_code	varchar2(30)		NOT NULL,
	order_code	varchar2(30)		NOT NULL,
	goods_code	varchar2(30)		NULL,
	goods_name	varchar2(50)		NULL,
	option_code	varchar2(30)		NULL,
	option_name	varchar2(50)		NULL,
	goods_standard	varchar2(30)		NULL,
	quantity	number		NULL
);

CREATE TABLE erp_customer_service (
	customer_service_num	number(6,0)		NOT NULL,
	company_num	number(6,0)		NOT NULL,
	employee_num	number(6,0)		NOT NULL,
	customer_service_division	varchar2(4)	DEFAULT 'EQ04'	NOT NULL,
	customer_service_content	varchar2(4000)		NOT NULL,
	customer_service_date	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN erp_customer_service.customer_service_num IS '문의 답변번호 시퀀스 erp_cs_seq';

COMMENT ON COLUMN erp_customer_service.company_num IS '문의한 회사번호(!!erp회사이님!)';

COMMENT ON COLUMN erp_customer_service.employee_num IS '사원번호(문의 답변한 사원)';

COMMENT ON COLUMN erp_customer_service.customer_service_division IS '처리된내용(EQ01=단순문의, EQ02=상태변경, EQ03=발행, EQ04=신규등록) [EQ]';

COMMENT ON COLUMN erp_customer_service.customer_service_content IS '문의 처리 내용';

COMMENT ON COLUMN erp_customer_service.customer_service_date IS '문의 등록날짜';

CREATE TABLE erp_contract_document (
	contract_num	number(6,0)		NOT NULL,
	company_num	number(6,0)		NOT NULL,
	erp_contract_document	varchar2(200)		NOT NULL,
	erp_register_date	date	DEFAULT sysdate	NOT NULL,
	contract1	varchar2(51)		NULL,
	contract2	varchar2(51)		NULL,
	contract3	varchar2(51)		NULL,
	contract4	varchar2(51)		NULL,
	contract5	varchar2(51)		NULL,
	contract6	varchar2(51)		NULL,
	contract7	varchar2(51)		NULL,
	contract8	varchar2(51)		NULL,
	contract9	varchar2(51)		NULL,
	contract10	varchar2(51)		NULL,
	contract11	varchar2(51)		NULL,
	contract12	varchar2(51)		NULL,
	contract13	varchar2(51)		NULL,
	contract14	varchar2(51)		NULL,
	contract15	varchar2(51)		NULL,
	contract16	varchar2(51)		NULL,
	contract17	varchar2(51)		NULL,
	contract18	varchar2(51)		NULL,
	contract19	varchar2(51)		NULL,
	contract20	varchar2(51)		NULL,
	contract21	varchar2(51)		NULL,
	contract22	varchar2(51)		NULL,
	contract23	varchar2(51)		NULL,
	contract24	varchar2(51)		NULL,
	contract25	varchar2(51)		NULL,
	contract26	varchar2(51)		NULL,
	contract27	varchar2(51)		NULL,
	contract28	varchar2(51)		NULL,
	contract29	varchar2(51)		NULL,
	contract30	varchar2(51)		NULL
);

COMMENT ON COLUMN erp_contract_document.contract_num IS '회사별로 계약서가 1장 생긴다 시퀀시 erp_ctrtc_seq';

COMMENT ON COLUMN erp_contract_document.company_num IS '회사번호';

COMMENT ON COLUMN erp_contract_document.erp_contract_document IS '전자서명문서 (img 파일)';

COMMENT ON COLUMN erp_contract_document.erp_register_date IS '전자 서명일';

CREATE TABLE erp_subscription_option (
	subscription_option_num	number(6,0)		NOT NULL,
	subscription_name_num	number(6,0)		NOT NULL,
	subscription_option	varchar2(100)		NOT NULL,
	subscription_option_price	varchar2(100)		NOT NULL,
	subscription_discount	number(3,2)	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN erp_subscription_option.subscription_option_num IS '해당구독 어떤 옵션을 사용하는지 시퀀스 erp_subscrpt_option_seq';

COMMENT ON COLUMN erp_subscription_option.subscription_name_num IS '구독정보 (기준정보 테이블)';

COMMENT ON COLUMN erp_subscription_option.subscription_option IS '30일,무제한,기간맞춤 등';

COMMENT ON COLUMN erp_subscription_option.subscription_option_price IS '구독옵션의 가격';

COMMENT ON COLUMN erp_subscription_option.subscription_discount IS '원가 역산을 위한 할인율 옵션';

CREATE TABLE accnut_debt (
	debt_code	varchar2(50)		NOT NULL,
	debt_name	varchar2(100)		NOT NULL,
	section	varchar2(20)		NOT NULL,
	register_date	date	DEFAULT sysdate	NOT NULL,
	creditor	varchar2(100)		NULL,
	amount	number(12,0)	DEFAULT 0	NULL,
	interest	number(10,2)		NULL,
	time_limit	date	DEFAULT sysdate	NULL,
	prearrangement_due_date	date	DEFAULT sysdate	NULL
);

COMMENT ON COLUMN accnut_debt.section IS 'ex) 대출금(),미지급금()';

CREATE TABLE business_bhf (
	bhf_id	number(10)		NOT NULL,
	hhf_name	varchar2(30)		NOT NULL,
	bhf_phone	varchar2(30)		NOT NULL,
	bhf_address	varchar2(100)		NOT NULL,
	bhf_initial_cost	number(10)		NOT NULL,
	real_estate_name	varchar2(30)		NOT NULL,
	real_estate_phone	varchar2(100)		NOT NULL,
	rental_type	varchar2(30)	DEFAULT 'LFSTS'	NOT NULL,
	monthly_maintenance_cost	number(10)		NULL
);

COMMENT ON COLUMN business_bhf.bhf_initial_cost IS '단위: 만원';

COMMENT ON COLUMN business_bhf.rental_type IS 'CHECK (rental_type IN (''LFSTS'', ''MTHT''))';

COMMENT ON COLUMN business_bhf.monthly_maintenance_cost IS '단위: 만원';

CREATE TABLE business_cs_change_history (
	history_num	number		NOT NULL,
	order_id	varchar2(50)		NOT NULL,
	history_type	varchar2(20)		NOT NULL,
	register_date	date	DEFAULT sysdate	NOT NULL,
	history_contents	varchar2(4000)		NULL
);

COMMENT ON COLUMN business_cs_change_history.history_type IS '등록, 수정, 발송, 취소';

CREATE TABLE erp_subscription_list (
	subscription_num	number(6,0)		NOT NULL,
	company_num	number(6,0)		NOT NULL,
	subscription_name_num	number(6,0)		NOT NULL,
	subscription_option_num	number(6,0)		NOT NULL,
	employee_num	number(6,0)		NOT NULL,
	subscription_form	varchar2(4)	DEFAULT 'EL01'	NOT NULL,
	subscription_mean	varchar2(4)	DEFAULT 'EP01'	NOT NULL,
	subscription_mean_num	varchar2(50)		NULL,
	subscription_amount	number		NOT NULL,
	state	varchar2(4)	DEFAULT 'ES01'	NOT NULL,
	subscription_date	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN erp_subscription_list.subscription_num IS '구독번호 시퀀스 erp_subscrpt_seq';

COMMENT ON COLUMN erp_subscription_list.company_num IS '회사번호';

COMMENT ON COLUMN erp_subscription_list.subscription_name_num IS '구독정보 (기준정보 테이블)';

COMMENT ON COLUMN erp_subscription_list.subscription_option_num IS '해당구독 어떤 옵션을 사용하는지';

COMMENT ON COLUMN erp_subscription_list.employee_num IS '구독처리자 번호 (구독 서비스 결제한 사람)';

COMMENT ON COLUMN erp_subscription_list.subscription_form IS '구독형태(EL01=기간구독, EL02=정기구독) [EL]';

COMMENT ON COLUMN erp_subscription_list.subscription_mean IS 'EP01=무통장, EP02=카드, EP03=계좌, EP04=카카오, EP05=네이버 등 [EP]';

COMMENT ON COLUMN erp_subscription_list.subscription_mean_num IS '카드번호,계좌번호,페이번호 등등';

COMMENT ON COLUMN erp_subscription_list.subscription_amount IS '구독금액 서비스 다 이용해도 1년에 180만원';

COMMENT ON COLUMN erp_subscription_list.state IS 'ES01=요청, ES02=반려, ES03=신청, ES04=완료 [ES]';

COMMENT ON COLUMN erp_subscription_list.subscription_date IS '구독 요청 일시';

CREATE TABLE erp_answer (
	answer_num	number(6,0)		NOT NULL,
	inquiry_num	number(6,0)		NOT NULL,
	employee_num	number(6,0)		NOT NULL,
	answer_content	varchar2(4000)		NOT NULL,
	answer_date	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN erp_answer.answer_num IS '답변번호 시퀀스 erp_answer_seq';

COMMENT ON COLUMN erp_answer.inquiry_num IS '문의번호 시퀀스 erp_inqry_seq';

COMMENT ON COLUMN erp_answer.employee_num IS '사원번호(문의 답변한 사원)';

COMMENT ON COLUMN erp_answer.answer_content IS '답변 내용';

COMMENT ON COLUMN erp_answer.answer_date IS '답변 등록일시';

CREATE TABLE bhf_goods_mediation (
	mediation_code	varchar2(30)		NOT NULL,
	goods_code	varchar2(30)		NULL,
	goods_name	varchar2(50)		NULL,
	option_code	varchar2(30)		NULL,
	option_name	varchar2(50)		NULL,
	standard	varchar2(30)		NULL,
	quantity	number		NULL,
	mediation_quantity	number		NULL,
	mediation_reason	varchar2(1000)		NULL,
	mediation_date	date	DEFAULT sysdate	NOT NULL
);

CREATE TABLE hr_employee_history (
	history_num	number(10)		NOT NULL,
	employee_num	number(10)		NOT NULL,
	change_type	VARCHAR2(20)	DEFAULT 'CT001'	NOT NULL,
	previous_position	VARCHAR2(20)		NULL,
	new_position	VARCHAR2(20)		NULL,
	previous_department_num	number(10)		NULL,
	new_department_num	number(10)		NULL,
	previous_employment_type	VARCHAR2(20)		NULL,
	new_employment_type	VARCHAR2(20)		NULL,
	effective_date	DATE		NULL,
	processed_by	number(10)		NULL,
	register_date	date	DEFAULT sysdate	NULL,
	update_date	date	DEFAULT sysdate	NULL,
	employee_num2	number(10)		NOT NULL
);

COMMENT ON COLUMN hr_employee_history.history_num IS '이력 ID (PK, 자동 증가)';

COMMENT ON COLUMN hr_employee_history.employee_num IS '사원 ID (FK: HR_EMPLOYEE.employee_num 참조)';

COMMENT ON COLUMN hr_employee_history.change_type IS '변경 유형 (공통코드: CT, ex: 승진, 부서 이동, 근무형태 변경)';

COMMENT ON COLUMN hr_employee_history.previous_position IS '변경 전 직급 (공통코드: PO)';

COMMENT ON COLUMN hr_employee_history.new_position IS '변경 후 직급 (공통코드: PO)';

COMMENT ON COLUMN hr_employee_history.previous_department_num IS '변경 전 부서 ID (FK: HR_DEPARTMENT.department_id 참조)';

COMMENT ON COLUMN hr_employee_history.new_department_num IS '변경 후 부서 ID (FK: HR_DEPARTMENT.department_id 참조)';

COMMENT ON COLUMN hr_employee_history.previous_employment_type IS '이전 근무 유형 (공통코드: ET)';

COMMENT ON COLUMN hr_employee_history.new_employment_type IS '변경 후 근무 유형 (공통코드: ET)';

COMMENT ON COLUMN hr_employee_history.effective_date IS '변경 적용일(발령일)';

COMMENT ON COLUMN hr_employee_history.processed_by IS '처리 담당자 번호 (FK: HR_EMPLOYEE.employee_num 참조, 인사 담당자)';

COMMENT ON COLUMN hr_employee_history.register_date IS '이력 등록일';

COMMENT ON COLUMN hr_employee_history.update_date IS '이력 수정일';

COMMENT ON COLUMN hr_employee_history.employee_num2 IS '사원 고유번호 (PK, 자동 증가)';

CREATE TABLE stdr_classification (
	classification_id	number(10)		NOT NULL,
	classification_code	varchar2(20)		NOT NULL,
	classification_name	varchar2(20)		NOT NULL,
	distribution_time_limit	number(10)		NOT NULL
);

COMMENT ON COLUMN stdr_classification.classification_code IS '영어 대문자 두자리';

COMMENT ON COLUMN stdr_classification.distribution_time_limit IS '단위: 연';

CREATE TABLE cmmn (
	cmmn_code	varchar2(20)		NOT NULL,
	upper_cmmn_code	varchar2(20)		NULL,
	cmmn_name	varchar2(100)		NOT NULL,
	description	varchar2(100)		NULL
);

CREATE TABLE grpwr_internal_approval (
	internal_approval_id	number(8, 0)		NOT NULL,
	document_id	number(10)		NOT NULL,
	employee_num	number(10)		NOT NULL,
	in_approval_request_date	date	DEFAULT sysdate	NOT NULL,
	in_approval_status	varchar2(10)	DEFAULT 'WAITING'	NOT NULL,
	in_approval_request_content	varchar2(1000)		NOT NULL,
	in_approval_rejected_content	varchar2(500)		NULL,
	in_approval_rejected_path	VARCHAR(255)		NULL
);

COMMENT ON COLUMN grpwr_internal_approval.internal_approval_id IS 'sequence: grpwr_apprv_seq';

COMMENT ON COLUMN grpwr_internal_approval.document_id IS '기준정보_결재문서 문서번호';

COMMENT ON COLUMN grpwr_internal_approval.employee_num IS '결재 요청한 직원';

COMMENT ON COLUMN grpwr_internal_approval.in_approval_status IS 'CHECK (approval_status IN (''WAITING'', ''APPROVED'', ''REJECTED''))';

COMMENT ON COLUMN grpwr_internal_approval.in_approval_rejected_content IS 'html code';

CREATE TABLE accnut_incidental_cost (
	incidental_cost_code	varchar2(50)		NOT NULL,
	department	varchar2(30)		NULL,
	section	varchar2(20)		NOT NULL,
	card_num	varchar2(30)		NOT NULL,
	amount	number(12,0)	DEFAULT 0	NOT NULL,
	contents	varchar2(100)		NULL,
	register_date	date	DEFAULT sysdate	NOT NULL,
	pay_date	date	DEFAULT sysdate	NULL,
	image	varchar2(40)		NULL,
	process_alternative	varchar2(20)	DEFAULT 'PC01'	NOT NULL,
	employee_num	number(10)		NULL,
	employee_name	varchar2(100)		NULL,
	account_category	varchar2(20)		NULL,
	confirmer	number(10)		NULL
);

COMMENT ON COLUMN accnut_incidental_cost.section IS 'ex) 개인(), 법인()';

COMMENT ON COLUMN accnut_incidental_cost.process_alternative IS 'ex)';

CREATE TABLE bhf_returning_goods_detail (
	returning_goods_detail_code	varchar2(30)		NOT NULL,
	returning_goods_code	varchar2(30)		NOT NULL,
	goods_code	varchar2(30)		NULL,
	goods_name	varchar2(50)		NULL,
	option_code	varchar2(30)		NULL,
	option_name	varchar2(50)		NULL,
	quantity	number		NULL,
	exchange_returning_choice	varchar2(30)		NULL,
	returning_goods_reason	varchar2(1000)		NULL
);

COMMENT ON COLUMN bhf_returning_goods_detail.exchange_returning_choice IS '교환,반품';

CREATE TABLE hr_department (
	department_num	number(10)		NOT NULL,
	department_name	VARCHAR2(50)		NOT NULL,
	parent_department_num	number(10)		NULL,
	department_type	VARCHAR2(20)	DEFAULT 'DT001'	NOT NULL,
	manager_num	number(10)		NULL,
	department_status	VARCHAR2(20)	DEFAULT 'DS001'	NOT NULL,
	register_date	date	DEFAULT sysdate	NOT NULL,
	update_date	date	DEFAULT sysdate	NULL
);

COMMENT ON COLUMN hr_department.department_num IS '부서/팀 번호 (PK)';

COMMENT ON COLUMN hr_department.department_name IS '부서/팀명';

COMMENT ON COLUMN hr_department.parent_department_num IS '상위 부서 번호 (조직 계층 구조 관리, FK: HR_DEPARTMENT)';

COMMENT ON COLUMN hr_department.department_type IS '부서 유형 (공통코드: DT)';

COMMENT ON COLUMN hr_department.manager_num IS '부서장 번호 (FK: HR_EMPLOYEE.employee_id 참조)';

COMMENT ON COLUMN hr_department.department_status IS '부서 상태 (공통코드: DS)';

COMMENT ON COLUMN hr_department.register_date IS '등록일 (부서 생성일)';

COMMENT ON COLUMN hr_department.update_date IS '최종 수정일';

CREATE TABLE business_ship_LOT_detail (
	business_ship_LOT_detail_num	number(10)		NOT NULL,
	business_ship_detail_id	number(10)		NOT NULL,
	goods_lot_num	varchar2(40)		NOT NULL,
	ship_possible_qnt	number(10)	DEFAULT 0	NOT NULL,
	ship_qnt	number(10)	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN business_ship_LOT_detail.ship_possible_qnt IS '창고 LOT 수량 - 우선순위 더 높은 LOT 상세의 출고수량';

CREATE TABLE bhf_warehouse (
	warehouse_code	varchar2(30)		NOT NULL,
	branch_office_id	varchar2(30)		NULL,
	goods_code	varchar2(30)		NULL,
	goods_name	varchar2(50)		NULL,
	option_code	varchar2(30)		NULL,
	option_name	varchar2(50)		NULL,
	standard	varchar2(30)		NULL,
	quantity	number		NULL
);

CREATE TABLE business_order (
    order_id          VARCHAR2(50)   NOT NULL,
    order_code        VARCHAR2(30)   NULL,
    branch_office_id  NUMBER(10)     NOT NULL,
    order_name        VARCHAR2(100)  NOT NULL,
    total_amount      NUMBER(10,2)   DEFAULT 0  NOT NULL,
    purchase_vat      NUMBER(10,2)   DEFAULT 0  NOT NULL,
    order_date        DATE           NULL,
    register_date     DATE           DEFAULT sysdate  NOT NULL,
    cancel_date       DATE           NULL,
    due_date          DATE           NULL,
    sending_date      DATE           NULL,
    order_status      VARCHAR2(20)   NOT NULL,
    employee_num      NUMBER(10)     NOT NULL,
    remark            VARCHAR2(4000) NULL
);

COMMENT ON COLUMN business_order.branch_office_id IS '지점테이블';

COMMENT ON COLUMN business_order.order_status IS '발송준비중, 취소됨, 발송완료';

CREATE TABLE purchs_purchase_record (
	purchase_record_num	number		NOT NULL,
	purchase_record_date	date	DEFAULT sysdate	NOT NULL,
	purchase_recorde_reason	varchar2(100)		NOT NULL,
	purchase_record_type	varchar2(20)		NOT NULL,
	prev_quantity	number		NULL,
	new_quantity	number		NULL,
	prev_unit_price	number		NULL,
	new_unit_price	number		NULL,
	prev_total_amount	number		NULL,
	new_total_amount	number		NULL,
	prev_status	number	DEFAULT 0	NOT NULL,
	new_status	number		NULL,
	prev_due_date	date		NULL,
	new_due_date	date		NULL,
	prev_vat_flag	number		NULL,
	new_vat_flag	number		NULL,
	employee_num	number(10)		NOT NULL,
	purchase_body_num	number		NOT NULL,
	purchase_num	number		NOT NULL
);

COMMENT ON COLUMN purchs_purchase_record.purchase_record_type IS 'insert, update, delete';

COMMENT ON COLUMN purchs_purchase_record.prev_quantity IS 'insert시 null';

COMMENT ON COLUMN purchs_purchase_record.new_quantity IS 'delete 시  null';

COMMENT ON COLUMN purchs_purchase_record.prev_unit_price IS 'insert시 null';

COMMENT ON COLUMN purchs_purchase_record.new_unit_price IS 'delete 시  null';

COMMENT ON COLUMN purchs_purchase_record.prev_total_amount IS 'insert시 null';

COMMENT ON COLUMN purchs_purchase_record.new_total_amount IS 'delete 시  null';

COMMENT ON COLUMN purchs_purchase_record.prev_status IS '상태가 기본 진행중에만 수정  및 추가 , 삭제가능';

COMMENT ON COLUMN purchs_purchase_record.new_status IS 'insert, update의 경우 null,. 삭제 인 경우 만 2로 변경';

COMMENT ON COLUMN purchs_purchase_record.employee_num IS 'FK';

COMMENT ON COLUMN purchs_purchase_record.purchase_num IS 'sysdate+seq';

CREATE TABLE purchse_goods (
	goods_num	number		NOT NULL,
	goods_name	varchar2(50)		NOT NULL,
	goods_cost	number	DEFAULT 0	NOT NULL,
	goods_code	varchar2(50)		NOT NULL,
	goods_price	number	DEFAULT 0	NOT NULL,
	goods_supply_price	number	DEFAULT 0	NOT NULL,
	goods_standard	varchar(50)		NOT NULL,
	goods_description	varchar2(100)		NULL,
	goods_image	varchar(50)		NULL,
	goods_use_flag	number	DEFAULT 0	NOT NULL,
	classification_id	number(10)		NOT NULL,
	brand_id	number(10)		NOT NULL,
	employee_num	number(10)		NOT NULL,
	vendor_id	number(10)		NOT NULL
);

COMMENT ON COLUMN purchse_goods.goods_num IS '상품번호시퀀스 purchs_goods_seq';

COMMENT ON COLUMN purchse_goods.goods_code IS '분류코드+브랜드+001';

COMMENT ON COLUMN purchse_goods.goods_use_flag IS '사용중 = 0 , 사용중단 = 1';

COMMENT ON COLUMN purchse_goods.classification_id IS 'FK';

COMMENT ON COLUMN purchse_goods.brand_id IS 'FK';

COMMENT ON COLUMN purchse_goods.employee_num IS 'FK';

COMMENT ON COLUMN purchse_goods.vendor_id IS 'FK';

CREATE TABLE accnut_assets (
	assets_code	varchar2(50)		NOT NULL,
	assets_name	varchar2(100)		NOT NULL,
	section	varchar2(20)		NOT NULL,
	financial_institution	varchar2(20)		NULL,
	finance_information	varchar2(30)		NULL,
	owner	varchar2(100)		NULL,
	amount	number(12,0)	DEFAULT 0	NULL,
	register_date	date	DEFAULT sysdate	NOT NULL,
	quantity	number(10)		NULL,
	fixtures_amount	number(12,0)	DEFAULT 0	NULL
);

COMMENT ON COLUMN accnut_assets.section IS 'ex) 현금(), 통장(), 카드(), 비품()';

COMMENT ON COLUMN accnut_assets.financial_institution IS '은행 및 카드사를 의미 ex)농협(), 국민(), 기업()';

COMMENT ON COLUMN accnut_assets.finance_information IS '통장번호 및 카드번호를 의미';

CREATE TABLE business_cs_returning_goods (
    cs_returning_goods_id      VARCHAR2(50)   NOT NULL,
    returning_goods_detail_code VARCHAR2(30)   NULL,
    returning_qnt              NUMBER(10)     NULL,
    warehousing_qnt            NUMBER(10)     DEFAULT 0,
    disuse_qnt                 NUMBER(10)     DEFAULT 0,
    completion_date            DATE           NULL,
    warehouse_id               VARCHAR2(30)   NULL,
    employee_num               NUMBER(10)     NOT NULL
);

COMMENT ON COLUMN business_cs_returning_goods.returning_qnt IS '반품 수량';

COMMENT ON COLUMN business_cs_returning_goods.warehouse_id IS '입고테이블참고';

CREATE TABLE bhf_returning_goods (
	returning_goods_code	varchar2(30)		NOT NULL,
	branch_office_id	varchar2(30)		NULL,
	progress_status	varchar2(10)	DEFAULT '신청'	NOT NULL,
	request_date	date	DEFAULT sysdate	NOT NULL,
	remark	varchar2(1000)		NULL
);

COMMENT ON COLUMN bhf_returning_goods.progress_status IS '신청,승인,취소';

COMMENT ON COLUMN bhf_returning_goods.remark IS '반품취소사유';

CREATE TABLE erp_subs_info_list (
	subscription_num	number(6,0)		NOT NULL,
	company_num	number(6,0)		NOT NULL,
	subscription_form	varchar2(4)	DEFAULT 'EL01'	NOT NULL,
	subscription_name_num	number(6,0)		NOT NULL,
	subscription_option_num	number(6,0)		NOT NULL,
	subscription_end_date	date	DEFAULT sysdate	NOT NULL,
	subscription_update_date	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN erp_subs_info_list.subscription_num IS '구독번호 시퀀스 erp_subscrpt_info_seq';

COMMENT ON COLUMN erp_subs_info_list.company_num IS '회사번호 시퀀스 ( erp_cmpny_seq )';

COMMENT ON COLUMN erp_subs_info_list.subscription_form IS '구독형태(EL01=기간구독, EL02=정기구독) [EL]';

COMMENT ON COLUMN erp_subs_info_list.subscription_name_num IS '구독정보 (기준정보 테이블)';

COMMENT ON COLUMN erp_subs_info_list.subscription_end_date IS '(구독형태 EL01=만료일,  EL02  = 다음결제일 )';

COMMENT ON COLUMN erp_subs_info_list.subscription_update_date IS '구독결제후 정보 업데이트 된날짜';

CREATE TABLE bhf_closing_exact_calc_detail (
	closing_exact_calc_detail_code	varchar2(30)		NOT NULL,
	closing_exact_calc_code	varchar2(30)		NOT NULL,
	bnf_sle_qy	number		NULL,
	goods_code	varchar2(30)		NULL,
	goods_name	varchar2(50)		NULL,
	option_code	varchar2(30)		NULL,
	option_name	varchar2(50)		NULL
);

CREATE TABLE bhf_closing_exact_calculation (
	closing_exact_calculation_code	varchar2(30)		NOT NULL,
	branch_office_id	varchar2(30)		NULL,
	closing_date	date		NULL,
	business_reserves	number		NULL,
	cash_amount	number		NULL,
	cash_present	number		NULL,
	card_amount	number		NULL,
	sale_amount	number		NULL,
	transfer_amount	number		NULL
);

CREATE TABLE purchs_order_plan_body (
    order_plan_body_num       NUMBER          NOT NULL,
    order_plan_quantity       NUMBER          DEFAULT 0     NOT NULL,
    order_plan_total_amount   NUMBER          DEFAULT 0     NOT NULL,
    order_plan_unit_price     NUMBER          DEFAULT 0     NOT NULL,
    order_plan_supply_price   NUMBER          DEFAULT 0     NOT NULL,
    order_plan_vat            NUMBER          DEFAULT 0     NOT NULL,
    order_plan_standard       VARCHAR2(50)    NOT NULL,
    order_plan_status         VARCHAR2(20)    DEFAULT '결제대기중' NOT NULL,
    vendor_id                 NUMBER(10)      NOT NULL,
    order_plan_header_num     NUMBER          NOT NULL,
    option_num                NUMBER          NOT NULL
);


COMMENT ON COLUMN purchs_order_plan_body.order_plan_status IS '결제대기중, 진행중,완료,취소';

COMMENT ON COLUMN purchs_order_plan_body.vendor_id IS 'FK';

CREATE TABLE grpwr_board (
	board_id	number(8, 0)		NOT NULL,
	board_title	varchar2(100)		NOT NULL,
	board_content	varchar2(1000)		NOT NULL,
	board_category	varchar2(50)		NOT NULL,
	employee_num	number(10)		NOT NULL,
	board_date	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN grpwr_board.board_id IS 'sequence: grpwr_brd_seq';

COMMENT ON COLUMN grpwr_board.employee_num IS '게시글 작성자';

COMMENT ON COLUMN grpwr_board.board_date IS '게시글을 수정하면 업데이트';

CREATE TABLE purchs_warehousing_header (
    warehousing_header_num   NUMBER          NOT NULL,
    warehousing_date         DATE            DEFAULT sysdate  NOT NULL,
    warehousing_vat          NUMBER          DEFAULT 0        NOT NULL,
    manufacture_date         DATE            NOT NULL,
    employee_num             NUMBER(10)      NOT NULL,
    vendor_id                NUMBER(10)      NOT NULL,
    warehousing_chit         NUMBER          NOT NULL,
    warehousing_total_amount NUMBER          DEFAULT 0        NOT NULL
);

COMMENT ON COLUMN purchs_warehousing_header.warehousing_vat IS '사용(10%)=0 , 사용하지 않음 =1';

COMMENT ON COLUMN purchs_warehousing_header.employee_num IS 'FK';

COMMENT ON COLUMN purchs_warehousing_header.vendor_id IS 'FK';

COMMENT ON COLUMN purchs_warehousing_header.warehousing_chit IS 'sysdate+seq';

CREATE TABLE purchse_option (
	option_num	number		NOT NULL,
	option_code	varchar(50)		NOT NULL,
	option_name	varchar(50)		NOT NULL,
	option_safety_invoice	number	DEFAULT 0	NOT NULL,
	option_use_flag	number	DEFAULT 0	NOT NULL,
	warehouse_id	number(10)		NOT NULL,
	goods_num	number		NOT NULL
);

COMMENT ON COLUMN purchse_option.option_code IS '상품코드+001';

COMMENT ON COLUMN purchse_option.option_use_flag IS '사용중 = 0 , 사용중단 = 1';

COMMENT ON COLUMN purchse_option.warehouse_id IS 'FK';

COMMENT ON COLUMN purchse_option.goods_num IS '상품번호시퀀스 purchs_goods_seq';

CREATE TABLE purchs_warehousing_body (
    warehousing_body_num       NUMBER          NOT NULL,
    goods_lot_num              VARCHAR2(40)    NOT NULL,
    goods_consumption_date     DATE            NOT NULL,
    warehousing_standard_quantity NUMBER       DEFAULT 0        NOT NULL,
    warehousing_total_quantity NUMBER        DEFAULT 0        NOT NULL,
    warehousing_remaining_quantity NUMBER    DEFAULT 0        NOT NULL,
    warehousing_total_amount   NUMBER          DEFAULT 0        NOT NULL,
    warehousing_unit_price     NUMBER          DEFAULT 0        NOT NULL,
    warehousing_supply_price   NUMBER          DEFAULT 0        NOT NULL,
    warehousing_vat            NUMBER          DEFAULT 0        NOT NULL,
    warehouse_id               NUMBER(10)      NOT NULL,
    warehousing_header_num     NUMBER          NOT NULL,
    purchase_body_num          NUMBER          NOT NULL
);


COMMENT ON COLUMN purchs_warehousing_body.goods_lot_num IS '옵션코드+sysdate+seq';

COMMENT ON COLUMN purchs_warehousing_body.goods_consumption_date IS '제조일자+유통기한(분류의 유통기한)';

COMMENT ON COLUMN purchs_warehousing_body.warehousing_total_quantity IS '수량_박스 * 규격(1박스의 n개)';

COMMENT ON COLUMN purchs_warehousing_body.warehousing_remaining_quantity IS 'warehousing_total_quantity - disuse_quantity ==>  실제로 갯수 조회할때 당겨와야하는 정보';

COMMENT ON COLUMN purchs_warehousing_body.warehouse_id IS 'FK';

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

CREATE TABLE grpwr_chat_message (
	grpwr_msg_id	number(10)		NOT NULL,
	grpwr_room_id	number(10)		NOT NULL,
	employee_num	number(10)		NOT NULL,
	grpwr_msg_content	varchar2(500)		NOT NULL,
	grpwr_msg_sent_at	timestamp	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN grpwr_chat_message.grpwr_msg_id IS 'sequence: grpwr_msg_seq';

COMMENT ON COLUMN grpwr_chat_message.grpwr_room_id IS 'sequence: grpwr_room_seq';

CREATE TABLE hr_employee_contract (
	contract_num	number(10)		NOT NULL,
	employee_id	number(10)		NOT NULL,
	contract_type	VARCHAR2(20)	DEFAULT 'CT001'	NOT NULL,
	contract_start_date	date		NOT NULL,
	contract_end_date	date		NULL,
	salary	NUMBER(15,2)		NOT NULL,
	work_start_time	VARCHAR2(5)	DEFAULT '09:00'	NULL,
	work_end_time	VARCHAR2(5)	DEFAULT '18:00'	NULL,
	work_hours	NUMBER(3,1)	DEFAULT 8.0	NULL,
	probation_period	NUMBER(2)	DEFAULT 0	NULL,
	contract_status	VARCHAR2(20)	DEFAULT 'CS001'	NULL,
	termination_reason	VARCHAR2(255)		NULL,
	contract_file_path	VARCHAR2(255)		NULL,
	department_num	number(10)		NULL,
	position	VARCHAR2(20)	DEFAULT 'PO001'	NULL,
	register_date	date	DEFAULT sysdate	NOT NULL,
	update_date	date	DEFAULT sysdate	NULL,
	employee_num	number(10)		NOT NULL
);

COMMENT ON COLUMN hr_employee_contract.contract_num IS '계약 번호 (PK, 자동 증가)';

COMMENT ON COLUMN hr_employee_contract.employee_id IS '계약 대상 사원 번호 (FK: HR_EMPLOYEE.employee_num 참조)';

COMMENT ON COLUMN hr_employee_contract.contract_type IS '계약 유형 (공통코드: CT, 정규직, 계약직, 프리랜서, 인턴 등)';

COMMENT ON COLUMN hr_employee_contract.contract_start_date IS '계약 시작일';

COMMENT ON COLUMN hr_employee_contract.contract_end_date IS '계약 종료일 (NULL이면 정규직 등 무기한 계약)';

COMMENT ON COLUMN hr_employee_contract.salary IS '계약 급여 금액';

COMMENT ON COLUMN hr_employee_contract.work_start_time IS '근무 시작 시간 (HH:MI 형식)';

COMMENT ON COLUMN hr_employee_contract.work_end_time IS '근무 종료 시간 (HH:MI 형식)';

COMMENT ON COLUMN hr_employee_contract.work_hours IS '일 근무 시간 (소수점 가능, 기본 8시간 설정)';

COMMENT ON COLUMN hr_employee_contract.probation_period IS '수습 기간 (개월 단위, 기본 0개월)';

COMMENT ON COLUMN hr_employee_contract.contract_status IS '계약 상태 (공통코드: CS, 진행 중, 만료, 예정)';

COMMENT ON COLUMN hr_employee_contract.termination_reason IS '계약 해지 사유 (정규직 퇴사, 계약직 만료 등)';

COMMENT ON COLUMN hr_employee_contract.contract_file_path IS '계약서 파일 저장 경로';

COMMENT ON COLUMN hr_employee_contract.department_num IS '부서 번호 (FK: HR_DEPARTMENT.department_id 참조)';

COMMENT ON COLUMN hr_employee_contract.position IS '직급 (공통코드: PO, 사원, 대리, 과장 등)';

COMMENT ON COLUMN hr_employee_contract.register_date IS '계약 등록일 (계약 체결일과 동일)';

COMMENT ON COLUMN hr_employee_contract.update_date IS '계약 수정일 (계약 변경 시 업데이트)';

COMMENT ON COLUMN hr_employee_contract.employee_num IS '사원 고유번호 (PK, 자동 증가)';

CREATE TABLE stdr_authority (
	authority_id	number(10)		NOT NULL,
	authority	varchar2(10)		NOT NULL
);

CREATE TABLE hr_document_file (
	document_file_num	number(10)		NOT NULL,
	internal_approval_id	number(10)		NOT NULL,
	document_type	VARCHAR2(20)	DEFAULT 'DC001'	NOT NULL,
	file_path	VARCHAR2(500)		NOT NULL,
	register_date	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN hr_document_file.document_file_num IS '증명서 파일 번호(PK, 시퀀스 사용';

COMMENT ON COLUMN hr_document_file.internal_approval_id IS '전자결재 요청 ID (HR_INTERNAL_APPROVAL 참조, FK)';

COMMENT ON COLUMN hr_document_file.document_type IS '문서 유형 코드 (공통코드: DC)';

COMMENT ON COLUMN hr_document_file.file_path IS '파일 저장 경로 (예: /storage/documents/재직증명서_홍길동_20250210.pdf)';

COMMENT ON COLUMN hr_document_file.register_date IS '파일 생성일';

CREATE TABLE stdr_department (
	department_code	varchar2(10)		NOT NULL,
	Field	VARCHAR(255)		NULL
);

COMMENT ON COLUMN stdr_department.department_code IS 'ex) DEP001, DEP002...';

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
	ex_approval_rejected_content	varchar(500)		NULL
);

COMMENT ON COLUMN grpwr_ex_approval.document_id IS '기준정보 문서정보';

COMMENT ON COLUMN grpwr_ex_approval.employee_num IS '결재 요청한 직원';

COMMENT ON COLUMN grpwr_ex_approval.manager_num IS '결재 처리하는 관리자';

COMMENT ON COLUMN grpwr_ex_approval.ex_approval_status IS 'CHECK (ex_approval_status IN ('WAITING', 'MANATER_APPROVED', 'MANATER_REJECTED',  'VENDOR_APPROVED',  'VENDOR_REJECTED'))';

COMMENT ON COLUMN grpwr_ex_approval.ex_approval_request_content IS 'html code';

CREATE TABLE hr_leave_rejection_log (
	rejection_num	number(10)		NOT NULL,
	internal_approval_id	number(10)		NOT NULL,
	employee_num	number(10)		NOT NULL,
	rejected_by	number(10)		NOT NULL,
	rejected_reason	VARCHAR2(500)		NOT NULL,
	rejected_date	DATE		NOT NULL,
	employee_num2	number(10)		NOT NULL
);

COMMENT ON COLUMN hr_leave_rejection_log.rejection_num IS '반려 이력 ID (PK, 자동 증가)';

COMMENT ON COLUMN hr_leave_rejection_log.internal_approval_id IS '전자결재 요청 ID (FK)';

COMMENT ON COLUMN hr_leave_rejection_log.employee_num IS '신청한 사원 번호';

COMMENT ON COLUMN hr_leave_rejection_log.rejected_by IS '반려한 관리자 ID(FK)';

COMMENT ON COLUMN hr_leave_rejection_log.rejected_reason IS '반려 사유';

COMMENT ON COLUMN hr_leave_rejection_log.rejected_date IS '반려 날짜';

COMMENT ON COLUMN hr_leave_rejection_log.employee_num2 IS '사원 고유번호 (PK, 자동 증가)';

CREATE TABLE hr_employee (
	employee_num	number(10)		NOT NULL,
	employee_name	VARCHAR2(50)		NOT NULL,
	ssn	VARCHAR2(14)		NULL,
	email	VARCHAR2(100)		NULL,
	phone	VARCHAR2(20)		NULL,
	hire_date	date	DEFAULT sysdate	NOT NULL,
	department_num	number(10)		NULL,
	position	VARCHAR2(20)	DEFAULT 'PO001'	NULL,
	authority	VARCHAR2(20)	DEFAULT 'AU001'	NOT NULL,
	status	VARCHAR2(20)	DEFAULT 'ST001'	NOT NULL,
	quit_date	DATE		NULL,
	address	VARCHAR2(200)		NULL,
	zip_code	VARCHAR2(10)		NULL,
	employment_type	VARCHAR2(20)	DEFAULT 'ET001'	NOT NULL,
	bank_name	VARCHAR2(50)		NULL,
	account_num	VARCHAR2(30)		NULL,
	profile_image	VARCHAR2(255)		NULL,
	memo	VARCHAR2(500)		NULL,
	register_date	date	DEFAULT sysdate	NULL,
	update_date	date	DEFAULT sysdate	NULL,
	department_id2	number(10)		NOT NULL
);

COMMENT ON COLUMN hr_employee.employee_num IS '사원 고유번호 (PK, 자동 증가)';

COMMENT ON COLUMN hr_employee.employee_name IS '사원 이름';

COMMENT ON COLUMN hr_employee.ssn IS '주민등록번호 (암호화 저장 필요)';

COMMENT ON COLUMN hr_employee.email IS '이메일 주소 (유일값 제약 필요)';

COMMENT ON COLUMN hr_employee.phone IS '연락처 (전화번호 형식 검증 필요)';

COMMENT ON COLUMN hr_employee.hire_date IS '입사일';

COMMENT ON COLUMN hr_employee.department_num IS '부서 ID (FK: HR_DEPARTMENT 테이블 참조)';

COMMENT ON COLUMN hr_employee.position IS '직급 (공통코드: PO)';

COMMENT ON COLUMN hr_employee.authority IS '권한 (공통코드: AU)';

COMMENT ON COLUMN hr_employee.status IS '재직 상태 (공통코드: ST)';

COMMENT ON COLUMN hr_employee.quit_date IS '퇴사일 (퇴사 처리 시 입력)';

COMMENT ON COLUMN hr_employee.address IS '기본주소+상세주소';

COMMENT ON COLUMN hr_employee.zip_code IS '우편번호';

COMMENT ON COLUMN hr_employee.employment_type IS '근무 유형 (공통코드: ET)';

COMMENT ON COLUMN hr_employee.bank_name IS '급여 지급 은행명';

COMMENT ON COLUMN hr_employee.account_num IS '계좌번호 (암호화 저장 필요)';

COMMENT ON COLUMN hr_employee.profile_image IS '프로필 이미지 경로';

COMMENT ON COLUMN hr_employee.memo IS '메모';

COMMENT ON COLUMN hr_employee.register_date IS '등록일 (계정 생성 시 자동 입력)';

COMMENT ON COLUMN hr_employee.update_date IS '최종 수정일 (수정 시 자동 반영)';

COMMENT ON COLUMN hr_employee.department_id2 IS '부서/팀 ID (PK)';

CREATE TABLE stdr_warehouse (
	warehouse_id	number(10)		NOT NULL,
	warehouse_name	varchar2(20)		NOT NULL
);

CREATE TABLE purchs_purchase_body (
	purchase_body_num	number		NOT NULL,
	purchase_quantity	number	DEFAULT 0	NOT NULL,
	purchase_unit_price	number	DEFAULT 0	NOT NULL,
	purchase_supply_price	number	DEFAULT 0	NOT NULL,
	purchase_vat	number	DEFAULT 0	NOT NULL,
	purchase_num	number		NOT NULL,
	option_num	number		NOT NULL,
	order_plan_body_num	number		NULL
);

COMMENT ON COLUMN purchs_purchase_body.purchase_num IS 'sysdate+seq';

CREATE TABLE accnut_etc_payment (
	etc_payment_code	varchar2(50)		NOT NULL,
	section	varchar2(20)		NOT NULL,
	department	varchar2(30)		NULL,
	time_limit	date	DEFAULT sysdate	NOT NULL,
	amount	number(12,0)	DEFAULT 0	NOT NULL,
	payment_alternative	varchar2(20)	DEFAULT 'PY01'	NOT NULL,
	giro_num	varchar2(40)		NULL
);

CREATE TABLE purchs_goods_disuse (
    disuse_num                 NUMBER          NOT NULL,
    disuse_date                DATE            DEFAULT sysdate   NOT NULL,
    disuse_reason              VARCHAR2(100)   NOT NULL,
    disuse_quantity            NUMBER          DEFAULT 0         NOT NULL,
    disuse_remaining_quantity NUMBER          DEFAULT 0         NOT NULL,
    disuse_status              NUMBER          DEFAULT 0         NOT NULL,
    employee_num               NUMBER(10)      NOT NULL,
    warehousing_body_num      NUMBER          NOT NULL
);


COMMENT ON COLUMN purchs_goods_disuse.disuse_status IS '0:폐기 1: 폐기취소';

COMMENT ON COLUMN purchs_goods_disuse.employee_num IS 'FK';

CREATE TABLE hr_annual_leave (
	leave_num	number(10)		NOT NULL,
	employee_num	number(10)		NOT NULL,
	year	NUMBER(4)		NOT NULL,
	leave_category	VARCHAR2(20)	DEFAULT 'LC001'	NOT NULL,
	total_leave	NUMBER(3)		NOT NULL,
	used_leave	NUMBER(3)	DEFAULT 0	NOT NULL,
	remaining_leave	NUMBER(3)		NOT NULL,
	register_date	date	DEFAULT sysdate	NOT NULL,
	update_date	DATE	DEFAULT NULL	NULL,
	employee_num2	number(10)		NOT NULL
);

COMMENT ON COLUMN hr_annual_leave.leave_num IS '연차 번호 (PK, 자동 증가 시퀀스)';

COMMENT ON COLUMN hr_annual_leave.employee_num IS '사원번호 (FK: HR_EMPLOYEE.employee_num 참조)';

COMMENT ON COLUMN hr_annual_leave.year IS '연차 부여 기준 연도 / INSERT시 EXTRACT(YEAR FROM SYSDATE)';

COMMENT ON COLUMN hr_annual_leave.leave_category IS '연차 부여 유형 (공통코드: LC, 예: LC001=입사1년미만)';

COMMENT ON COLUMN hr_annual_leave.total_leave IS '해당 연도 부여된 총 연차(일)';

COMMENT ON COLUMN hr_annual_leave.used_leave IS '사용한 연차 (일)';

COMMENT ON COLUMN hr_annual_leave.remaining_leave IS '잔여 연차 (일) → total_leave - used_leave';

COMMENT ON COLUMN hr_annual_leave.register_date IS '연차 데이터 생성일';

COMMENT ON COLUMN hr_annual_leave.update_date IS '연차 데이터 수정일';

COMMENT ON COLUMN hr_annual_leave.employee_num2 IS '사원 고유번호 (PK, 자동 증가)';

CREATE TABLE purchs_order_plan_header (
	order_plan_header_num	number		NOT NULL,
	order_plan_title	varchar2(30)		NOT NULL,
	order_plan_date	date	DEFAULT sysdate	NOT NULL,
	order_plan_due_date	date		NOT NULL,
	order_plan_vat_flag	number	DEFAULT 0	NOT NULL,
	order_plan_flag	number	DEFAULT 0	NOT NULL,
	employee_num	number(10)		NOT NULL,
	order_plan_total_amount	number	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN purchs_order_plan_header.order_plan_header_num IS 'sysdate+시퀸스';

COMMENT ON COLUMN purchs_order_plan_header.order_plan_vat_flag IS '사용(10%) =0 , 사용 하지 않음= 1';

COMMENT ON COLUMN purchs_order_plan_header.order_plan_flag IS '등록=0  걔획취소=1';

COMMENT ON COLUMN purchs_order_plan_header.employee_num IS 'FK';

CREATE TABLE business_delivery_detail (
    business_delivery_detail_id NUMBER(10)     NOT NULL,
    business_delivery_id       VARCHAR2(50)   NOT NULL,
    order_detail_id            NUMBER(10)     NULL,
    option_num                 NUMBER         NOT NULL,
    delivery_demand_qnt        NUMBER(10)     DEFAULT 0   NOT NULL,
    delivery_total_qnt         NUMBER(10)     DEFAULT 0   NOT NULL,
    sufficiency_status         NUMBER(1)      DEFAULT 0   NOT NULL
);


COMMENT ON COLUMN business_delivery_detail.delivery_demand_qnt IS '출고해야할 수량';

COMMENT ON COLUMN business_delivery_detail.delivery_total_qnt IS '촐고LOT상세의 출고수량의 합 = 출고한 수량';

COMMENT ON COLUMN business_delivery_detail.sufficiency_status IS '출고총수량이  요구수량과 같은 경우 true';

CREATE TABLE stdr_brand (
	brand_id	number(10)		NOT NULL,
	brand_code	varchar2(20)		NOT NULL,
	brand_name	varchar2(20)		NOT NULL
);

COMMENT ON COLUMN stdr_brand.brand_code IS '영어 대문자 두자리';



CREATE TABLE hr_attendance_log (
	attendance_num	number(10)		NOT NULL,
	employee_num	number(10)		NOT NULL,
	company_num	number(10)		NOT NULL,
	work_date	DATE		NOT NULL,
	scheduled_check_in	DATE		NULL,
	scheduled_check_out	DATE		NULL,
	actual_check_in	DATE	DEFAULT NULL	NULL,
	actual_check_out	DATE	DEFAULT NULL	NULL,
	barcode_scan_id	VARCHAR2(50)	DEFAULT NULL	NULL,
	work_status	VARCHAR2(10)	DEFAULT 'WS001'	NOT NULL,
	overtime_hours	NUMBER(5,2)	DEFAULT 0	NULL,
	attendance_status	VARCHAR2(20)	DEFAULT 'AT001'	NOT NULL,
	approval_status	VARCHAR2(20)	DEFAULT 'AP001'	NOT NULL,
	register_date	date	DEFAULT sysdate	NULL,
	update_date	date	DEFAULT sysdate	NULL,
	employee_num3	number(10)		NOT NULL
);

COMMENT ON COLUMN hr_attendance_log.attendance_num IS '출퇴근 기록 번호 (PK, 자동 증가)';

COMMENT ON COLUMN hr_attendance_log.employee_num IS '사원 번호(FK: HR_EMPLOYEE.employee_num 참조)';

COMMENT ON COLUMN hr_attendance_log.company_num IS '회사 번호';

COMMENT ON COLUMN hr_attendance_log.work_date IS '근무일 (YYYY-MM-DD, 출퇴근 기준 날짜)';

COMMENT ON COLUMN hr_attendance_log.scheduled_check_in IS '기준 출근 시간 (스케줄 기반 출근시간)';

COMMENT ON COLUMN hr_attendance_log.scheduled_check_out IS '기준 퇴근 시간 (스케줄 기반 퇴근시간)';

COMMENT ON COLUMN hr_attendance_log.actual_check_in IS '실제 출근 시간';

COMMENT ON COLUMN hr_attendance_log.actual_check_out IS '실제 퇴근 시간';

COMMENT ON COLUMN hr_attendance_log.barcode_scan_id IS '사원증 바코드 태깅 ID (출입 기록 매칭용)';

COMMENT ON COLUMN hr_attendance_log.work_status IS '출근 상태 (공통코드: WS)';

COMMENT ON COLUMN hr_attendance_log.overtime_hours IS '초과 근무 시간 (시간 단위, 소수점 2자리까지 저장 가능)';

COMMENT ON COLUMN hr_attendance_log.attendance_status IS '근태 상태 (공통코드: AT)';

COMMENT ON COLUMN hr_attendance_log.approval_status IS '승인 상태 (공통코드: AP)';

COMMENT ON COLUMN hr_attendance_log.register_date IS '기록 생성 일자';

COMMENT ON COLUMN hr_attendance_log.update_date IS '수정일';

COMMENT ON COLUMN hr_attendance_log.employee_num3 IS '사원 고유번호 (PK, 자동 증가)';

CREATE TABLE erp_employees (
	employee_num	number(6,0)		NOT NULL,
	employee_id	varchar2(20)		NOT NULL,
	employee_pw	varchar2(200)		NOT NULL,
	employee_name	varchar2(15)		NOT NULL,
	department	varchar2(50)		NOT NULL,
	position	varchar2(50)		NOT NULL,
	job	varchar2(50)		NOT NULL,
	birthday	date		NOT NULL,
	phone	varchar2(13)		NOT NULL,
	email	varchar2(50)		NOT NULL,
	address	varchar2(200)		NOT NULL,
	hire_date	date	DEFAULT sysdate	NOT NULL,
	retirement_date	date		NULL,
	work_state	varchar2(4)	DEFAULT 'EM01'	NOT NULL,
	udate_date	date	DEFAULT sysdate	NOT NULL,
	register_date	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN erp_employees.employee_num IS '사원번호 시퀀스 erp_emp_seq';

COMMENT ON COLUMN erp_employees.employee_id IS '사원아이디 (이니셜+생년+연락처끝4자리)';

COMMENT ON COLUMN erp_employees.employee_pw IS '사원비밀번호(이름을 영타로 적은거)';

COMMENT ON COLUMN erp_employees.employee_name IS '사원이름';

COMMENT ON COLUMN erp_employees.department IS '부서';

COMMENT ON COLUMN erp_employees.position IS '직급';

COMMENT ON COLUMN erp_employees.job IS '업무';

COMMENT ON COLUMN erp_employees.birthday IS '생년월일';

COMMENT ON COLUMN erp_employees.phone IS '연락처';

COMMENT ON COLUMN erp_employees.email IS '이메일';

COMMENT ON COLUMN erp_employees.address IS '주소';

COMMENT ON COLUMN erp_employees.hire_date IS '입사일';

COMMENT ON COLUMN erp_employees.retirement_date IS '퇴사일';

COMMENT ON COLUMN erp_employees.work_state IS '상태 (EM01=근무, EM02=퇴사) [EM]';

COMMENT ON COLUMN erp_employees.udate_date IS '수정일';

COMMENT ON COLUMN erp_employees.register_date IS '등록일';

CREATE TABLE business_order_detail (
	order_detail_id	number(10)		NOT NULL,
	order_id	varchar2(50)		NOT NULL,
	goods_num	number		NULL,
	option_num	number		NULL,
	quantity	number(10, 0)	DEFAULT 0	NOT NULL,
	goods_standard	varchar(50)		NOT NULL,
	unit_price	number(10,2)	DEFAULT 0	NOT NULL,
	summation_amt	number(10,2)	DEFAULT 0	NOT NULL
);

COMMENT ON COLUMN business_order_detail.goods_num IS '(구매 테이블 참고)';

CREATE TABLE erp_company (
	company_num	number(6,0)		NOT NULL,
	company_name	varchar2(50)		NOT NULL,
	company_eng_name	varchar2(50)		NOT NULL,
	representation_name	varchar2(15)		NOT NULL,
	representation_phone	varchar2(13)		NOT NULL,
	charger_name	varchar2(15)		NOT NULL,
	charger_phone	varchar2(13)		NOT NULL,
	charger_email	varchar2(50)		NOT NULL,
	company_address	varchar2(200)		NOT NULL,
	business_num	varchar2(12)		NOT NULL,
	business_license	varchar2(100)		NOT NULL,
	service_state	varchar2(4)	DEFAULT 'EC01'	NOT NULL,
	register_date	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN erp_company.company_num IS '회사번호 시퀀스 erp_cmpny_seq';

COMMENT ON COLUMN erp_company.company_name IS '회사명';

COMMENT ON COLUMN erp_company.company_eng_name IS '회사영문명(회사코드)';

COMMENT ON COLUMN erp_company.representation_name IS '대표자명';

COMMENT ON COLUMN erp_company.representation_phone IS '대표자연락처';

COMMENT ON COLUMN erp_company.charger_name IS '담당자명';

COMMENT ON COLUMN erp_company.charger_phone IS '담당자연락처';

COMMENT ON COLUMN erp_company.charger_email IS '이메일';

COMMENT ON COLUMN erp_company.company_address IS '업체주소';

COMMENT ON COLUMN erp_company.business_num IS '사업자번호';

COMMENT ON COLUMN erp_company.business_license IS '사업자등록증(이미지 파일 주소)';

COMMENT ON COLUMN erp_company.service_state IS '서비스상태(EC01=서비스,EC02=일시정지, EC03=종료) [EC]';

COMMENT ON COLUMN erp_company.register_date IS '등록일';

CREATE TABLE purchs_disuse_record (
	disuse_record_num	number		NOT NULL,
	disuse_record_date	date	DEFAULT sysdate	NOT NULL,
	disuse_record_reason	varchar2(100)		NOT NULL,
	disuse_record_type	varchar2(20)		NOT NULL,
	prev_disuse_quantity	number		NULL,
	new_disuse_quantity	number		NULL,
	disuse_prev_status	number	DEFAULT 0	NOT NULL,
	disuse_new_status	number		NULL,
	employee_num	number(10)		NOT NULL,
	disuse_num	number		NOT NULL
);

COMMENT ON COLUMN purchs_disuse_record.disuse_record_type IS 'update, delete';

COMMENT ON COLUMN purchs_disuse_record.new_disuse_quantity IS 'delete 시  null';

COMMENT ON COLUMN purchs_disuse_record.disuse_new_status IS 'update경우 0 , delete경우 1';

COMMENT ON COLUMN purchs_disuse_record.employee_num IS 'FK';

CREATE TABLE erp_inquiry (
	inquiry_num	number(6,0)		NOT NULL,
	company_name	varchar2(50)		NOT NULL,
	charger_name	varchar2(15)		NOT NULL,
	charger_phone	varchar2(13)		NOT NULL,
	charger_email	varchar2(50)		NOT NULL,
	inquiry_content	varchar2(4000)		NOT NULL,
	inquiry_date	date	DEFAULT sysdate	NOT NULL
);

COMMENT ON COLUMN erp_inquiry.inquiry_num IS '문의번호 시퀀스 erp_inqry_seq';

COMMENT ON COLUMN erp_inquiry.company_name IS '문의 회사 이름';

COMMENT ON COLUMN erp_inquiry.charger_name IS '문의 회사 담당자명';

COMMENT ON COLUMN erp_inquiry.charger_phone IS '문의 회사 담당자 연락처';

COMMENT ON COLUMN erp_inquiry.charger_email IS '문의 회사 담당자 이메일';

COMMENT ON COLUMN erp_inquiry.inquiry_content IS '문의 회사 문의 내용';

COMMENT ON COLUMN erp_inquiry.inquiry_date IS '문의 등록일시';

CREATE TABLE grpwr_chat_room (
	room_id	number(10)		NOT NULL,
	employee_num1	number(10)		NOT NULL,
	employee_num2	number(10)		NOT NULL,
	grpwr_room_created_at	timestamp		NOT NULL
);

COMMENT ON COLUMN grpwr_chat_room.room_id IS 'sequence: grpwr_room_seq';

COMMENT ON COLUMN grpwr_chat_room.employee_num1 IS '사원번호 / CONSTRAINT unique_chat UNIQUE (employee_num1, employee_num2)';

COMMENT ON COLUMN grpwr_chat_room.employee_num2 IS '사원번호';

CREATE TABLE hr_business_trip (
	trip_num	number(10)		NOT NULL,
	employee_num	number(10)		NOT NULL,
	trip_date	DATE		NOT NULL,
	trip_type	VARCHAR2(20)	DEFAULT 'TP001'	NOT NULL,
	departure	VARCHAR2(100)		NOT NULL,
	destination	VARCHAR2(100)		NOT NULL,
	purpose	VARCHAR2(255)		NOT NULL,
	request_status	VARCHAR2(20)	DEFAULT 'AP001'	NOT NULL,
	register_date	date	DEFAULT sysdate	NOT NULL,
	update_date	date	DEFAULT sysdate	NULL,
	employee_num2	number(10)		NOT NULL
);

COMMENT ON COLUMN hr_business_trip.trip_num IS '출장/외근 기록 번호 (PK, 자동 증가)';

COMMENT ON COLUMN hr_business_trip.employee_num IS '사원번호 (FK: HR_EMPLOYEE.employee_num 참조)';

COMMENT ON COLUMN hr_business_trip.trip_date IS '출장/외근 날짜 (YYYY-MM-DD)';

COMMENT ON COLUMN hr_business_trip.trip_type IS '출장/외근 구분 (공통코드: TP)';

COMMENT ON COLUMN hr_business_trip.departure IS '출발지 (사옥, 지점, 기타 출발 위치 입력 가능)';

COMMENT ON COLUMN hr_business_trip.destination IS '목적지 (출장/외근 목적지, 고객사 등)';

COMMENT ON COLUMN hr_business_trip.purpose IS '출장/외근 목적 상세 설명';

COMMENT ON COLUMN hr_business_trip.request_status IS '요청 상태 (공통코드: AP, 대기중, 승인, 반려)';

COMMENT ON COLUMN hr_business_trip.register_date IS '출장/외근 요청 생성 일자';

COMMENT ON COLUMN hr_business_trip.update_date IS '최종 수정일';

COMMENT ON COLUMN hr_business_trip.employee_num2 IS '사원 고유번호 (PK, 자동 증가)';

CREATE TABLE accnut_salary_account_book (
	salary_account_book_code	varchar2(50)		NOT NULL,
	employee_code	varchar2(50)		NOT NULL,
	employee_name	varchar2(100)		NOT NULL,
	department	varchar2(30)		NULL,
	salary	number(12,0)	DEFAULT 0	NOT NULL,
	excess_allowance	number(12,0)	DEFAULT 0	NULL,
	bonus	number(10,2)		NULL,
	incidental_cost	number(12,0)	DEFAULT 0	NULL,
	deduction_item	number(12,0)	DEFAULT 0	NULL,
	payment_amount	number(12,0)	DEFAULT 0	NOT NULL,
	payment_prearranged_date	date	DEFAULT sysdate	NULL,
	payment_alternative	varchar2(20)	DEFAULT 'PY01'	NOT NULL,
	payer	number(10)		NULL
);

COMMENT ON COLUMN accnut_salary_account_book.payment_alternative IS 'ex)';

ALTER TABLE accnut_deduction_details ADD CONSTRAINT PK_ACCNUT_DEDUCTION_DETAILS PRIMARY KEY (
	deduction_details_code
);

ALTER TABLE grpwr_schedule ADD CONSTRAINT PK_GRPWR_SCHEDULE PRIMARY KEY (
	schedule_id
);

ALTER TABLE accnut_dealings_account_book ADD CONSTRAINT PK_ACCNUT_DEALINGS_ACCOUNT_BOOK PRIMARY KEY (
	dealings_account_book_code
);

ALTER TABLE stdr_document ADD CONSTRAINT PK_STDR_DOCUMENT PRIMARY KEY (
	document_id
);

ALTER TABLE grpwr_vendor ADD CONSTRAINT PK_GRPWR_VENDOR PRIMARY KEY (
	vendor_id
);

ALTER TABLE erp_bill ADD CONSTRAINT PK_ERP_BILL PRIMARY KEY (
	bill_num
);

ALTER TABLE business_delivery ADD CONSTRAINT PK_BUSINESS_DELIVERY PRIMARY KEY (
	business_delivery_id
);

ALTER TABLE bhf_order ADD CONSTRAINT PK_BHF_ORDER PRIMARY KEY (
	order_code
);

ALTER TABLE stdr_class_of_position ADD CONSTRAINT PK_STDR_CLASS_OF_POSITION PRIMARY KEY (
	class_of_position_id
);

ALTER TABLE purchs_purchase_header ADD CONSTRAINT PK_PURCHS_PURCHASE_HEADER PRIMARY KEY (
	purchase_num
);

ALTER TABLE erp_subscription_name ADD CONSTRAINT PK_ERP_SUBSCRIPTION_NAME PRIMARY KEY (
	subscription_name_num
);

ALTER TABLE login ADD CONSTRAINT PK_LOGIN PRIMARY KEY (
	login_id
);

ALTER TABLE stdr_goods_retrieval_reason ADD CONSTRAINT PK_STDR_GOODS_RETRIEVAL_REASON PRIMARY KEY (
	goods_retrieval_reason_id
);

ALTER TABLE grpwr_event ADD CONSTRAINT PK_GRPWR_EVENT PRIMARY KEY (
	event_id
);

ALTER TABLE bhf_order_detail ADD CONSTRAINT PK_BHF_ORDER_DETAIL PRIMARY KEY (
	oderd_detail_code
);

ALTER TABLE erp_customer_service ADD CONSTRAINT PK_ERP_CUSTOMER_SERVICE PRIMARY KEY (
	customer_service_num
);

ALTER TABLE erp_contract_document ADD CONSTRAINT PK_ERP_CONTRACT_DOCUMENT PRIMARY KEY (
	contract_num
);

ALTER TABLE erp_subscription_option ADD CONSTRAINT PK_ERP_SUBSCRIPTION_OPTION PRIMARY KEY (
	subscription_option_num
);

ALTER TABLE accnut_debt ADD CONSTRAINT PK_ACCNUT_DEBT PRIMARY KEY (
	debt_code
);

ALTER TABLE business_bhf ADD CONSTRAINT PK_BUSINESS_BHF PRIMARY KEY (
	bhf_id
);

ALTER TABLE business_customer_satisfaction_change_history ADD CONSTRAINT PK_BUSINESS_CUSTOMER_SATISFACTION_CHANGE_HISTORY PRIMARY KEY (
	history_num
);

ALTER TABLE erp_subscription_list ADD CONSTRAINT PK_ERP_SUBSCRIPTION_LIST PRIMARY KEY (
	subscription_num
);

ALTER TABLE erp_answer ADD CONSTRAINT PK_ERP_ANSWER PRIMARY KEY (
	answer_num
);

ALTER TABLE bhf_goods_mediation ADD CONSTRAINT PK_BHF_GOODS_MEDIATION PRIMARY KEY (
	mediation_code
);

ALTER TABLE hr_employee_history ADD CONSTRAINT PK_HR_EMPLOYEE_HISTORY PRIMARY KEY (
	history_num
);

ALTER TABLE stdr_classification ADD CONSTRAINT PK_STDR_CLASSIFICATION PRIMARY KEY (
	classification_id
);

ALTER TABLE cmmn ADD CONSTRAINT PK_CMMN PRIMARY KEY (
	cmmn_code
);

ALTER TABLE grpwr_internal_approval ADD CONSTRAINT PK_GRPWR_INTERNAL_APPROVAL PRIMARY KEY (
	internal_approval_id
);

ALTER TABLE accnut_incidental_cost ADD CONSTRAINT PK_ACCNUT_INCIDENTAL_COST PRIMARY KEY (
	incidental_cost_code
);

ALTER TABLE bhf_returning_goods_detail ADD CONSTRAINT PK_BHF_RETURNING_GOODS_DETAIL PRIMARY KEY (
	returning_goods_detail_code
);

ALTER TABLE hr_department ADD CONSTRAINT PK_HR_DEPARTMENT PRIMARY KEY (
	department_num
);

ALTER TABLE business_delivery_LOT_detail ADD CONSTRAINT PK_BUSINESS_DELIVERY_LOT_DETAIL PRIMARY KEY (
	business_delivery_LOT_detail_num
);

ALTER TABLE bhf_warehouse ADD CONSTRAINT PK_BHF_WAREHOUSE PRIMARY KEY (
	warehouse_code
);

ALTER TABLE business_order ADD CONSTRAINT PK_BUSINESS_ORDER PRIMARY KEY (
	order_id
);

ALTER TABLE purchs_purchase_record ADD CONSTRAINT PK_PURCHS_PURCHASE_RECORD PRIMARY KEY (
	purchase_record_num
);

ALTER TABLE purchse_goods ADD CONSTRAINT PK_PURCHSE_GOODS PRIMARY KEY (
	goods_num
);

ALTER TABLE accnut_assets ADD CONSTRAINT PK_ACCNUT_ASSETS PRIMARY KEY (
	assets_code
);

ALTER TABLE business_customer_satisfaction_returning_goods ADD CONSTRAINT PK_BUSINESS_CUSTOMER_SATISFACTION_RETURNING_GOODS PRIMARY KEY (
	cs_returning goods_id
);

ALTER TABLE bhf_returning_goods ADD CONSTRAINT PK_BHF_RETURNING_GOODS PRIMARY KEY (
	returning_goods_code
);

ALTER TABLE erp_subscription_infomation_list ADD CONSTRAINT PK_ERP_SUBSCRIPTION_INFOMATION_LIST PRIMARY KEY (
	subscription_num
);

ALTER TABLE CopyOfbhf_closing_exact_calculation_detail ADD CONSTRAINT PK_COPYOFBHF_CLOSING_EXACT_CALCULATION_DETAIL PRIMARY KEY (
	closing_exact_calculation_detail_code
);

ALTER TABLE bhf_closing_exact_calculation ADD CONSTRAINT PK_BHF_CLOSING_EXACT_CALCULATION PRIMARY KEY (
	closing_exact_calculation_code
);

ALTER TABLE purchs_order_plan_body ADD CONSTRAINT PK_PURCHS_ORDER_PLAN_BODY PRIMARY KEY (
	order_plan_body_num
);

ALTER TABLE grpwr_board ADD CONSTRAINT PK_GRPWR_BOARD PRIMARY KEY (
	board_id
);

ALTER TABLE purchs_warehousing_header ADD CONSTRAINT PK_PURCHS_WAREHOUSING_HEADER PRIMARY KEY (
	warehousing_ header_num
);

ALTER TABLE purchse_option ADD CONSTRAINT PK_PURCHSE_OPTION PRIMARY KEY (
	option_num
);

ALTER TABLE purchs_warehousing_body ADD CONSTRAINT PK_PURCHS_WAREHOUSING_BODY PRIMARY KEY (
	warehousing_ body_num
);

ALTER TABLE grpwr_reply ADD CONSTRAINT PK_GRPWR_REPLY PRIMARY KEY (
	reply_id
);

ALTER TABLE grpwr_chat_message ADD CONSTRAINT PK_GRPWR_CHAT_MESSAGE PRIMARY KEY (
	grpwr_msg_id
);

ALTER TABLE hr_employee_contract ADD CONSTRAINT PK_HR_EMPLOYEE_CONTRACT PRIMARY KEY (
	contract_num
);

ALTER TABLE stdr_authority ADD CONSTRAINT PK_STDR_AUTHORITY PRIMARY KEY (
	authority_id
);

ALTER TABLE hr_document_file ADD CONSTRAINT PK_HR_DOCUMENT_FILE PRIMARY KEY (
	document_file_num
);

ALTER TABLE stdr_department ADD CONSTRAINT PK_STDR_DEPARTMENT PRIMARY KEY (
	department_code
);

ALTER TABLE grpwr_external_approval ADD CONSTRAINT PK_GRPWR_EXTERNAL_APPROVAL PRIMARY KEY (
	external_approval_id
);

ALTER TABLE hr_leave_rejection_log ADD CONSTRAINT PK_HR_LEAVE_REJECTION_LOG PRIMARY KEY (
	rejection_num
);

ALTER TABLE hr_employee ADD CONSTRAINT PK_HR_EMPLOYEE PRIMARY KEY (
	employee_num
);

ALTER TABLE stdr_warehouse ADD CONSTRAINT PK_STDR_WAREHOUSE PRIMARY KEY (
	warehouse_id
);

ALTER TABLE purchs_purchase_body ADD CONSTRAINT PK_PURCHS_PURCHASE_BODY PRIMARY KEY (
	purchase_body_num
);

ALTER TABLE accnut_etc_payment ADD CONSTRAINT PK_ACCNUT_ETC_PAYMENT PRIMARY KEY (
	etc_payment_code
);

ALTER TABLE purchs_goods_disuse ADD CONSTRAINT PK_PURCHS_GOODS_DISUSE PRIMARY KEY (
	disuse_num
);

ALTER TABLE hr_annual_leave ADD CONSTRAINT PK_HR_ANNUAL_LEAVE PRIMARY KEY (
	leave_num
);

ALTER TABLE purchs_order_plan_header ADD CONSTRAINT PK_PURCHS_ORDER_PLAN_HEADER PRIMARY KEY (
	order_plan_header_num
);

ALTER TABLE business_delivery_detail ADD CONSTRAINT PK_BUSINESS_DELIVERY_DETAIL PRIMARY KEY (
	business_delivery_detail_id
);

ALTER TABLE stdr_brand ADD CONSTRAINT PK_STDR_BRAND PRIMARY KEY (
	brand_id
);

ALTER TABLE hr_attendance_log ADD CONSTRAINT PK_HR_ATTENDANCE_LOG PRIMARY KEY (
	attendance_num
);

ALTER TABLE erp_employees ADD CONSTRAINT PK_ERP_EMPLOYEES PRIMARY KEY (
	employee_num
);

ALTER TABLE business_order_detail ADD CONSTRAINT PK_BUSINESS_ORDER_DETAIL PRIMARY KEY (
	order_detail_id
);

ALTER TABLE erp_company ADD CONSTRAINT PK_ERP_COMPANY PRIMARY KEY (
	company_num
);

ALTER TABLE purchs_disuse_record ADD CONSTRAINT PK_PURCHS_DISUSE_RECORD PRIMARY KEY (
	disuse_record_num
);

ALTER TABLE erp_inquiry ADD CONSTRAINT PK_ERP_INQUIRY PRIMARY KEY (
	inquiry_num
);

ALTER TABLE grpwr_chat_room ADD CONSTRAINT PK_GRPWR_CHAT_ROOM PRIMARY KEY (
	room_id
);

ALTER TABLE hr_business_trip ADD CONSTRAINT PK_HR_BUSINESS_TRIP PRIMARY KEY (
	trip_num
);

ALTER TABLE accnut_salary_account_book ADD CONSTRAINT PK_ACCNUT_SALARY_ACCOUNT_BOOK PRIMARY KEY (
	salary_account_book_code
);

