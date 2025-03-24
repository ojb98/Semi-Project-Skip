-- 참고용

DROP TABLE SKI_PAYMENTS;
DROP TABLE SKI_RESERVATION_ITEM;
DROP TABLE SKI_RESERVATION;
DROP TABLE SKI_ITEM;
DROP TABLE ITEM_CATEGORY;
DROP TABLE SKI;

DROP SEQUENCE SKI_SEQ;
DROP SEQUENCE ITEM_CATEGORY_SEQ;
DROP SEQUENCE SKI_ITEM_SEQ;
DROP SEQUENCE SKI_RESERVATION_SEQ;
DROP SEQUENCE SKI_RESERVATION_ITEM_SEQ;
DROP SEQUENCE SKI_PAYMENTS_SEQ;

CREATE TABLE SKI(
    SKI_ID NUMBER PRIMARY KEY,
    UUID NUMBER REFERENCES USERS(UUID) NOT NULL,
    NAME VARCHAR2(100) NOT NULL,
    LOCATION VARCHAR2(200) NOT NULL,
    WEBCAM_URL VARCHAR2(300)
);

CREATE TABLE ITEM_CATEGORY(
    CATEGORY_ID NUMBER PRIMARY KEY,
    ITEM_TYPE VARCHAR2(100) CHECK(ITEM_TYPE IN('스키', '스노우보드', '스키복', '보호장구', '리프트권')),
    PRICE_PER_HOUR NUMBER
);

CREATE TABLE SKI_ITEM(
    ITEM_ID NUMBER PRIMARY KEY,
    CATEGORY_ID NUMBER REFERENCES ITEM_CATEGORY(CATEGORY_ID) NOT NULL,
    SKI_ID NUMBER REFERENCES SKI(SKI_ID) NOT NULL,
    ITEM_NAME VARCHAR2(50) NOT NULL,
    ITEM_DETAIL VARCHAR2(100),
    TOTAL_QUANTITY NUMBER NOT NULL,
    ITEM_IMG VARCHAR2(100) NOT NULL,
    CREATED_AT DATE NOT NULL
);

CREATE TABLE SKI_RESERVATION(
    SKI_RESERV_ID NUMBER PRIMARY KEY,
    SKI_ID NUMBER REFERENCES SKI(SKI_ID) NOT NULL,
    UUID NUMBER REFERENCES USERS(UUID) NOT NULL,
    RESERV_START TIMESTAMP NOT NULL,
    RESERV_END TIMESTAMP NOT NULL,
    TOTAL_PRICE NUMBER(10, 2),
    STATUS VARCHAR2(20) CHECK(STATUS IN('예약완료', '대여중', '반납완료', '취소')),
    CREATED_AT DATE NOT NULL
);

CREATE TABLE SKI_RESERVATION_ITEM(
    SKI_ITEM_ID NUMBER(6) PRIMARY KEY,
    SKI_RESERV_ID NUMBER REFERENCES SKI_RESERVATION(SKI_RESERV_ID) NOT NULL,
    ITEM_ID NUMBER REFERENCES SKI_ITEM(ITEM_ID) NOT NULL,
    QUANTITY NUMBER NOT NULL,
    SUBTOTAL_PRICE NUMBER(10, 2)
);

CREATE TABLE SKI_PAYMENTS(
    PAYMENT_ID NUMBER PRIMARY KEY,
    SKI_RESERV_ID NUMBER REFERENCES SKI_RESERVATION(SKI_RESERV_ID) NOT NULL,
    UUID NUMBER REFERENCES USERS(UUID) NOT NULL,
    TOTAL_PRICE NUMBER(10, 2) NOT NULL,
    PAYMENT_METHOD VARCHAR2(20) CHECK(PAYMENT_METHOD IN('CARD', 'KAKAOPAY', 'NAVERPAY')),
    STATUS VARCHAR2(20) CHECK(STATUS IN('결제완료', '결제취소')) NOT NULL,
    IMP_UID VARCHAR2(50) NOT NULL,
    CARD_NUM VARCHAR2(50),
    CARD_NAME VARCHAR2(50),
    CREATED_AT DATE NOT NULL
);

CREATE SEQUENCE SKI_SEQ;
CREATE SEQUENCE ITEM_CATEGORY_SEQ;
CREATE SEQUENCE SKI_ITEM_SEQ;
CREATE SEQUENCE SKI_RESERVATION_SEQ;
CREATE SEQUENCE SKI_RESERVATION_ITEM_SEQ;
CREATE SEQUENCE SKI_PAYMENTS_SEQ;

INSERT INTO SKI VALUES(SKI_SEQ.NEXTVAL, 21, '용평 리조트', '위치', '웹캠');
INSERT INTO ITEM_CATEGORY VALUES(ITEM_CATEGORY_SEQ.NEXTVAL, '스키', 1000);
INSERT INTO SKI_ITEM VALUES(SKI_ITEM_SEQ.NEXTVAL, 1, 1, '좋은 스키', '그냥 스키', 100, '이미지', SYSDATE);
INSERT INTO SKI_ITEM VALUES(SKI_ITEM_SEQ.NEXTVAL, 1, 1, '스키복', '그냥 스키복', 100, '이미지', SYSDATE);
INSERT INTO SKI_RESERVATION VALUES(SKI_RESERVATION_SEQ.NEXTVAL, 1, 21, SYSTIMESTAMP, SYSTIMESTAMP, 3000, '예약완료', SYSDATE);
INSERT INTO SKI_RESERVATION_ITEM VALUES(SKI_RESERVATION_ITEM_SEQ.NEXTVAL, 1, 1, 3, 3000);
INSERT INTO SKI_RESERVATION_ITEM VALUES(SKI_RESERVATION_ITEM_SEQ.NEXTVAL, 1, 1, 0, 0);
INSERT INTO SKI_RESERVATION_ITEM VALUES(SKI_RESERVATION_ITEM_SEQ.NEXTVAL, 1, 1, 0, 0);
INSERT INTO SKI_RESERVATION_ITEM VALUES(SKI_RESERVATION_ITEM_SEQ.NEXTVAL, 1, 21, 0, 0);
INSERT INTO SKI_PAYMENTS VALUES(SKI_PAYMENTS_SEQ.NEXTVAL, 1, 21, 3000, 'CARD', '결제완료', 'IMP', 'NUM', 'NAME', SYSDATE);


INSERT INTO SKI VALUES(2, 21, '비발디 파크', '위치', '웹캠');
INSERT INTO SKI_RESERVATION VALUES(2, 1, 21, SYSTIMESTAMP, SYSTIMESTAMP, 3000, '예약완료', SYSDATE);
INSERT INTO SKI_RESERVATION_ITEM VALUES(SKI_RESERVATION_ITEM_SEQ.NEXTVAL, 2, 1, 3, 3000);
INSERT INTO SKI_PAYMENTS VALUES(2, 2, 21, 3000, 'CARD', '결제완료', 'IMP', 'NUM', 'NAME', SYSDATE);

INSERT INTO SKI_RESERVATION VALUES(3, 2, 21, SYSTIMESTAMP, SYSTIMESTAMP, 30000, '예약완료', SYSDATE);
INSERT INTO SKI_RESERVATION_ITEM VALUES(SKI_RESERVATION_ITEM_SEQ.NEXTVAL, 3, 3, 3, 3000);
INSERT INTO SKI_RESERVATION_ITEM VALUES(SKI_RESERVATION_ITEM_SEQ.NEXTVAL, 3, 2, 1, 20000);
INSERT INTO SKI_RESERVATION_ITEM VALUES(SKI_RESERVATION_ITEM_SEQ.NEXTVAL, 3, 2, 1, 7000);
INSERT INTO SKI_PAYMENTS VALUES(3, 3, 21, 30000, 'CARD', '결제완료', 'IMP', 'NUM', 'NAME', SYSDATE);

INSERT INTO SKI_RESERVATION VALUES(4, 2, 21, SYSTIMESTAMP - INTERVAL '1' YEAR - INTERVAL '10' HOUR, SYSTIMESTAMP - INTERVAL '1' YEAR, 30000, '예약완료', SYSTIMESTAMP - INTERVAL '1' YEAR - INTERVAL '2' DAY);
INSERT INTO SKI_RESERVATION_ITEM VALUES(SKI_RESERVATION_ITEM_SEQ.NEXTVAL, 4, 1, 3, 1000);
INSERT INTO SKI_RESERVATION_ITEM VALUES(SKI_RESERVATION_ITEM_SEQ.NEXTVAL, 4, 1, 3, 1000);
INSERT INTO SKI_RESERVATION_ITEM VALUES(SKI_RESERVATION_ITEM_SEQ.NEXTVAL, 4, 1, 3, 1000);
INSERT INTO SKI_RESERVATION_ITEM VALUES(SKI_RESERVATION_ITEM_SEQ.NEXTVAL, 4, 1, 3, 1000);
INSERT INTO SKI_RESERVATION_ITEM VALUES(SKI_RESERVATION_ITEM_SEQ.NEXTVAL, 4, 1, 3, 1000);
INSERT INTO SKI_RESERVATION_ITEM VALUES(SKI_RESERVATION_ITEM_SEQ.NEXTVAL, 4, 1, 3, 1000);
INSERT INTO SKI_RESERVATION_ITEM VALUES(SKI_RESERVATION_ITEM_SEQ.NEXTVAL, 4, 2, 1, 20000);
INSERT INTO SKI_RESERVATION_ITEM VALUES(SKI_RESERVATION_ITEM_SEQ.NEXTVAL, 4, 2, 1, 2000);
INSERT INTO SKI_PAYMENTS VALUES(4, 4, 21, 30000, 'CARD', '결제완료', 'IMP', 'NUM', 'NAME', SYSDATE);

SELECT * FROM USERS;    
SELECT * FROM SKI;
SELECT * FROM ITEM_CATEGORY;
SELECT * FROM SKI_ITEM;
SELECT * FROM SKI_RESERVATION;
SELECT * FROM SKI_RESERVATION_ITEM;
SELECT * FROM SKI_PAYMENTS;

UPDATE SKI SET LOCATION = '강원 평창군 대관령면 올림픽로 715' WHERE NAME = '용평 리조트';
UPDATE SKI SET LOCATION = '강원특별자치도 홍천군 서면 한치골길 262 비발디파크' WHERE NAME = '비발디 파크';
INSERT INTO SKI VALUES(3, 21, '곤지암 리조트', '경기 광주시 도척면 도척윗로 278', '웹캠');

COMMIT;