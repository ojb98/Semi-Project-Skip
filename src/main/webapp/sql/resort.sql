-- 리조트 테이블
CREATE TABLE RESORT (
	RESORT_ID NUMBER PRIMARY KEY,
	UUID NUMBER REFERENCES USERS(UUID) ON DELETE CASCADE,
	NAME VARCHAR2(200) NOT NULL,
	RESORT_TYPE VARCHAR2(15) CHECK(RESORT_TYPE IN('CONDO','HOSTEL')),
	RESORT_PHONE VARCHAR2(50) NOT NULL,
	LOCATION VARCHAR2(200) NOT NULL,
	REMAIN_IMG VARCHAR2(255) NOT NULL,
	RESUB_IMG1 VARCHAR2(255),
	RESUB_IMG2 VARCHAR2(255),
	RESUB_IMG3 VARCHAR2(255),
	DESCRIPTION VARCHAR2(1000), 
    CHECK_TIME  VARCHAR2(20),   
    CREATED_AT DATE DEFAULT SYSDATE 
);

-- 시퀀스
CREATE SEQUENCE RESORT_SEQ START WITH 200;

-- INSERT
INSERT INTO RESORT VALUES(RESORT_SEQ.NEXTVAL, 1, '비발디파크', 'condo', '010-1111-1111', '강원도', '메인이미지1', '서브이미지1', '서브이미지2', '서브이미지3', '비발디파크 설명', '14시/12시', sysdate);

INSERT INTO RESORT VALUES(1, 1, '비발디파크', 'condo', '010-1111-1111', '강원도', '메인이미지1', '서브이미지1', '서브이미지2', '서브이미지3', '비발디파크 설명', '14시/12시', sysdate);
INSERT INTO RESORT VALUES(2, 2, '하이원리조트', 'condo', '010-2222-2222', '강원도', '메인이미지1', '서브이미지1', '서브이미지2', '서브이미지3', '하이원리조트 설명', '14시/12시', sysdate);
INSERT INTO RESORT VALUES(3, 3, '곤지암리조트', 'hostel', '010-3333-3333', '경기도', '메인이미지1', '서브이미지1', '서브이미지2', '서브이미지3', '곤지암리조트 설명', '14시/12시', sysdate);

-- 객실테이블
CREATE TABLE ROOM(
    room_id      NUMBER PRIMARY KEY, 
    resort_id    NUMBER REFERENCES RESORT(resort_id) ON DELETE CASCADE,
    room_name VARCHAR2(50) NOT NULL, 
    room_type    VARCHAR2(50) CHECK(room_type IN('SINGLE','TWIN','DOUBLE','SUITE','FAMILY')),
    room_quantity NUMBER(3) NOT NULL,
    max_guests     NUMBER(2) NOT NULL, 
    price_per_night  NUMBER(10,2) NOT NULL,
    rmain_img VARCHAR2(255) NOT NULL,    
    rsub_img1 VARCHAR2 (255),  
    rsub_img2  VARCHAR2(255),   
    rsub_img3  VARCHAR2(255),   
    description  VARCHAR2(1000), 
    created_at   DATE DEFAULT SYSDATE 
);

-- 시퀀스
CREATE SEQUENCE ROOM_SEQ;

-- INSERT
INSERT INTO ROOM VALUES(ROOM_SEQ.NEXTVAL, 1, '싱글룸', 'SINGLE', 10, 1, 100000, 'IMG1', 'IMG2', 'IMG3', 'IMG4', '싱글룸설명', SYSDATE);

INSERT INTO ROOM VALUES(1, 1, '싱글룸', 'SINGLE', 10, 1, 100000, 'IMG1', 'IMG2', 'IMG3', 'IMG4', '싱글룸설명', SYSDATE);
INSERT INTO ROOM VALUES(2, 2, '더블룸', 'DOUBLE', 15, 3, 200000, 'IMG1', 'IMG2', 'IMG3', 'IMG4', '더블룸설명', SYSDATE);
INSERT INTO ROOM VALUES(3, 3, '스위트', 'SUITE', 5, 3, 300000, 'IMG1', 'IMG2', 'IMG3', 'IMG4', '스위트룸설명', SYSDATE);


-- 시설 유형 테이블 (Facility_Types)
CREATE TABLE FACILITY_TYPES (
    type_id     NUMBER PRIMARY KEY, 
    type_name    VARCHAR2(100) UNIQUE NOT NULL
);

-- INSERT
insert into FACILITY_TYPES values(1,'편의시설');
insert into FACILITY_TYPES values(2,'프런트 데스크 서비스');
insert into FACILITY_TYPES values(3,'레저/건강');
insert into FACILITY_TYPES values(4,'식사/음료');
insert into FACILITY_TYPES values(5,'청소 서비스');
insert into FACILITY_TYPES values(6,'비즈니스 서비스');
insert into FACILITY_TYPES values(7,'교통/주차');
insert into FACILITY_TYPES values(8,'장애인 편의시설');
insert into FACILITY_TYPES values(9,'안전/보안');
insert into FACILITY_TYPES values(10,'객실시설');
insert into FACILITY_TYPES values(11,'일반시설');
insert into FACILITY_TYPES values(12,'인기시설');


-- 시설 테이블 (Facilities)
CREATE TABLE FACILITIES (
    facility_id  NUMBER PRIMARY KEY,
    type_id      NUMBER REFERENCES FACILITY_TYPES(type_id) ON DELETE CASCADE, 
    facility_name VARCHAR2(255) UNIQUE NOT NULL 
);

-- 시퀀스
CREATE SEQUENCE facilities_seq;

-- 1.편의시설
insert into FACILITIES values(facilities_seq.nextval,1,'인터넷');
insert into FACILITIES values(facilities_seq.nextval,1,'무료 와이파이');
insert into FACILITIES values(facilities_seq.nextval,1,'구내편의점');
insert into FACILITIES values(facilities_seq.nextval,1,'코인세탁실');
insert into FACILITIES values(facilities_seq.nextval,1,'스포츠샵');
insert into FACILITIES values(facilities_seq.nextval,1,'키즈 룸');
insert into FACILITIES values(facilities_seq.nextval,1,'놀이시설');
commit;

-- 2.프런트 데스크 서비스
insert into FACILITIES values(facilities_seq.nextval,2,'24시간 프런트 데스크');
insert into FACILITIES values(facilities_seq.nextval,2,'프런트 데스크 안전 금고');
insert into FACILITIES values(facilities_seq.nextval,2,'짐 보관');
insert into FACILITIES values(facilities_seq.nextval,2,'벨맨');
insert into FACILITIES values(facilities_seq.nextval,2,'모닝콜');
insert into FACILITIES values(facilities_seq.nextval,2,'컨시어지서비스');
insert into FACILITIES values(facilities_seq.nextval,2,'환전');
commit;

-- 3.레저/건강
insert into FACILITIES values(facilities_seq.nextval,3,'실내 수영장');
insert into FACILITIES values(facilities_seq.nextval,3,'사우나');
insert into FACILITIES values(facilities_seq.nextval,3,'헬스장');
insert into FACILITIES values(facilities_seq.nextval,3,'피트니스');
insert into FACILITIES values(facilities_seq.nextval,3,'요가');
insert into FACILITIES values(facilities_seq.nextval,3,'워터파크');
commit;

-- 4.식사/음료
insert into FACILITIES values(facilities_seq.nextval,4,'레스토랑');
insert into FACILITIES values(facilities_seq.nextval,4,'커피숍');
insert into FACILITIES values(facilities_seq.nextval,4,'바');
insert into FACILITIES values(facilities_seq.nextval,4,'조식');
commit;

-- 5.청소 서비스
insert into FACILITIES values(facilities_seq.nextval,5,'세탁서비스');
insert into FACILITIES values(facilities_seq.nextval,5,'드라이 클리닝');
commit;

-- 6.비즈니스 서비스
insert into FACILITIES values(facilities_seq.nextval,6,'회의실');
insert into FACILITIES values(facilities_seq.nextval,6,'다목적실');
insert into FACILITIES values(facilities_seq.nextval,6,'팩스');
insert into FACILITIES values(facilities_seq.nextval,6,'프린터');
insert into FACILITIES values(facilities_seq.nextval,6,'우편서비스');
insert into FACILITIES values(facilities_seq.nextval,6,'멀티미디어 디스플레이 시스템');
commit;

-- 7. 교통/주차
insert into FACILITIES values(facilities_seq.nextval,7,'전용주차장');
insert into FACILITIES values(facilities_seq.nextval,7,'발렛 파킹');
insert into FACILITIES values(facilities_seq.nextval,7,'무료 주차');
insert into FACILITIES values(facilities_seq.nextval,7,'렌터카 서비스');
insert into FACILITIES values(facilities_seq.nextval,7,'셔틀버스');
commit;

-- 8.장애인 편의시설
insert into FACILITIES values(facilities_seq.nextval,8,'휠체어 이용가능');
insert into FACILITIES values(facilities_seq.nextval,8,'장애인 지원 객실');
commit;

-- 9.안전/보안
insert into FACILITIES values(facilities_seq.nextval,9,'의무실');
insert into FACILITIES values(facilities_seq.nextval,9,'화재 경보기');
insert into FACILITIES values(facilities_seq.nextval,9,'소화기');
insert into FACILITIES values(facilities_seq.nextval,9,'공용 공간 CCTV');
insert into FACILITIES values(facilities_seq.nextval,9,'침입 경보');
insert into FACILITIES values(facilities_seq.nextval,9,'연기 감지기');
insert into FACILITIES values(facilities_seq.nextval,9,'보안 요원');
insert into FACILITIES values(facilities_seq.nextval,9,'구급상자');
commit;

-- 리조트-시설 매핑
CREATE TABLE RESORT_FACILITY_MAP (
    resort_id    NUMBER REFERENCES RESORT(resort_id) ON DELETE CASCADE, 
    facility_id  NUMBER REFERENCES FACILITIES(facility_id) ON DELETE CASCADE, 
    PRIMARY KEY (resort_id, facility_id)
);

-- INSERT
INSERT INTO RESORT_FACILITY_MAP VALUES (1, 1);
INSERT INTO RESORT_FACILITY_MAP VALUES (1, 2);
INSERT INTO RESORT_FACILITY_MAP VALUES (1, 3);
INSERT INTO RESORT_FACILITY_MAP VALUES (2, 4);
INSERT INTO RESORT_FACILITY_MAP VALUES (2, 5);
INSERT INTO RESORT_FACILITY_MAP VALUES (3, 6);



-- 객실 예약 테이블 (Room_Reservation)
CREATE TABLE ROOM_RESERVATION (
    resort_reserv_id NUMBER PRIMARY KEY, 
    uuid  NUMBER REFERENCES USERS(uuid) ON DELETE CASCADE, 
    room_id  NUMBER REFERENCES ROOM(room_id) ON DELETE CASCADE,
    checkin_date  DATE NOT NULL, 
    checkout_date  DATE NOT NULL, 
    quantity  NUMBER(2) NOT NULL,    
    total_price  NUMBER(10,2) NOT NULL, 
    status   VARCHAR2(50) DEFAULT '예약완료' CHECK(status IN('예약완료','예약취소')), 
    created_at  DATE DEFAULT SYSDATE 
);

-- 시퀀스
CREATE SEQUENCE RESORT_RESERV_ID_SEQ;

INSERT INTO ROOM_RESERVATION VALUES(RESORT_RESERV_ID_SEQ.NEXTVAL, 1, 1, '25/04/01', '25/04/02', 1, 100000,'예약완료', SYSDATE);

INSERT INTO ROOM_RESERVATION VALUES(1, 1, 1, '25/04/01', '25/04/02', 1, 100000,'예약완료', SYSDATE);
INSERT INTO ROOM_RESERVATION VALUES(2, 2, 2, '25/04/05', '25/04/07', 1, 120000,'예약완료', SYSDATE);
INSERT INTO ROOM_RESERVATION VALUES(3, 3, 3, '25/04/10', '25/04/13', 2, 200000,'예약완료', SYSDATE);




-- 리조트 결제 테이블
CREATE TABLE RESORT_PAYMENTS (
    payment_id   NUMBER PRIMARY KEY, 
    resort_reserv_id NUMBER REFERENCES ROOM_RESERVATION(resort_reserv_id) ON DELETE CASCADE,   
    uuid  NUMBER REFERENCES USERS(uuid) ON DELETE CASCADE,
    room_id NUMBER REFERENCES ROOM(room_id) ON DELETE CASCADE,
    total_price NUMBER(10,2) NOT NULL,  
    payment_method  VARCHAR2(20) CHECK(payment_method IN('CARD', 'KAKAOPAY', 'NAVERPAY')),
    status     VARCHAR2(20) DEFAULT '결제완료' CHECK(status IN('결제완료','결제취소')),  
    imp_uid    VARCHAR2(50) NOT NULL,   
    card_num   VARCHAR2(50),   
    card_name VARCHAR2(50),    
    created_at   DATE DEFAULT SYSDATE 
);

-- 시퀀스
CREATE SEQUENCE RESORT_PAYMENT_ID_SEQ;

-- INSERT
INSERT INTO RESORT_PAYMENTS VALUES(RESORT_PAYMENT_ID_SEQ.NEXTVAL,1,1,100000,'CARD','결제완료','IMP_UID1','CARDNUMBER1','신한카드',SYSDATE);

INSERT INTO RESORT_PAYMENTS VALUES(1,1,1,1,100000,'CARD','결제완료','IMP_UID1','CARDNUMBER1','신한카드',SYSDATE);
INSERT INTO RESORT_PAYMENTS VALUES(2,2,2,2,150000,'KAKAOPAY','결제완료','IMP_UID2','CARDNUMBER2','카카오페이',SYSDATE);
INSERT INTO RESORT_PAYMENTS VALUES(3,3,3,3,120000,'NAVERPAY','결제완료','IMP_UID3','CARDNUMBER3','네이버페이',SYSDATE);



-- 리조트 리뷰 테이블
CREATE TABLE RESORT_REVIEWS(
    review_id  NUMBER PRIMARY KEY,
    payment_id NUMBER REFERENCES PAYMENTS(payment_id) ON DELETE CASCADE,
    uuid  NUMBER REFERENCES USERS(uuid) ON DELETE CASCADE,
    resort_id NUMBER NOT NULL,
    rating NUMBER(3,2) NOT NULL CHECK(rating BETWEEN 1 AND 5),
    resort_comment NOT NULL VARCHAR2(1000),
    review_img VARCHAR2(255),
    created_at DATE DEFAULT SYSDATE
);

--시퀀스
create sequence resort_review_seq;

-- INSERT
INSERT INTO RENTALSHOP_REVIEWS VALUES (resort_review_seq.NEXTVAL, 1, 1, 4, 1, '장비 상태가 좋고 친절했어요!', NULL, SYSDATE);

INSERT INTO RENTALSHOP_REVIEWS VALUES (1, 1, 1, 4, 1, '장비 상태가 좋고 친절했어요!', NULL, SYSDATE);
INSERT INTO RENTALSHOP_REVIEWS VALUES (2, 2, 2, 3, 2, '시설은 괜찮았지만 직원이 좀 불친절했어요.', NULL, SYSDATE);
INSERT INTO RENTALSHOP_REVIEWS VALUES (3, 3, 3, 5, 3, '최고의 경험이었어요! 강력 추천합니다.', NULL, SYSDATE);

