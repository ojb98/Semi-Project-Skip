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
CREATE SEQUENCE room_seq;

-- INSERT
INSERT INTO ROOM VALUES(ROOM_SEQ.NEXTVAL, 2, '싱글룸', 'SINGLE', 10, 1, 100000, 'IMG1', 'IMG2', 'IMG3', 'IMG4', '싱글룸설명', SYSDATE);
INSERT INTO ROOM VALUES(ROOM_SEQ.NEXTVAL, 3, '더블룸', 'DOUBLE', 15, 3, 200000, 'IMG1', 'IMG2', 'IMG3', 'IMG4', '더블룸설명', SYSDATE);

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
