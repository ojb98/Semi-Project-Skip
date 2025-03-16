DROP TABLE RENT_PAYMENTS;
DROP TABLE RENT_RESERVATION_ITEM;
DROP TABLE RENTAL_RESERVATION;
DROP TABLE SALE;
DROP TABLE RENT_ITEM;
DROP TABLE RENTALSHOP;

CREATE TABLE RENTALSHOP(
    RENTALSHOP_ID NUMBER PRIMARY KEY,
    UUID NUMBER REFERENCES USERS(UUID) NOT NULL,
    NAME VARCHAR2(200) NOT NULL,
    LOCATION VARCHAR2(200) NOT NULL,
    REMAIN_IMG VARCHAR2(255) NOT NULL,
    RESUB_IMG1 VARCHAR2(255),
    RESUB_IMG2 VARCHAR2(255),
    RESUB_IMG3 VARCHAR2(255),
    DESCRIPTION VARCHAR2(1000),
    CREATED_AT DATE
);

CREATE TABLE RENT_ITEM(
    ITEM_ID NUMBER PRIMARY KEY,
    CATEGORY_ID NUMBER REFERENCES ITEM_CATEGORY(CATEGORY_ID) NOT NULL,
    RENTALSHOP_ID NUMBER REFERENCES RENTALSHOP(RENTALSHOP_ID) NOT NULL,
    ITEM_NAME VARCHAR2(50) NOT NULL,
    ITEM_DETAIL VARCHAR2(100),
    TOTAL_QUANTITY NUMBER NOT NULL,
    ITEM_IMG VARCHAR2(100) NOT NULL,
    CREATED_AT DATE NOT NULL
);

CREATE TABLE SALE(
    SALE_ID NUMBER PRIMARY KEY,
    SALE_PERCENT NUMBER(2, 2),
    SALE_AMOUNT NUMBER,
    CREATED_AT DATE
);

CREATE TABLE RENTAL_RESERVATION(
    RENT_RESERV_ID NUMBER PRIMARY KEY,
    RENTALSHOP_ID NUMBER REFERENCES RENTALSHOP(RENTALSHOP_ID) NOT NULL,
    UUID NUMBER REFERENCES USERS(UUID),
    RENTAL_START TIMESTAMP NOT NULL,
    RENTAL_END TIMESTAMP NOT NULL,
    TOTAL_PRICE NUMBER NOT NULL,
    STATUS VARCHAR2(20) CHECK(STATUS IN('예약완료', '대여중', '반납완료', '취소')) NOT NULL,
    CREATED_AT DATE
);

CREATE TABLE RENT_RESERVATION_ITEM(
    RENT_ITEM_ID NUMBER PRIMARY KEY,
    RENT_RESERV_ID NUMBER REFERENCES RENTAL_RESERVATION(RENT_RESERV_ID) NOT NULL,
    ITEM_ID NUMBER REFERENCES RENT_ITEM(ITEM_ID) NOT NULL,
    QUANTITY NUMBER NOT NULL,
    SUBTOTAL_PRICE NUMBER NOT NULL
);

CREATE TABLE RENT_PAYMENTS(
    PAYMENT_ID NUMBER PRIMARY KEY,
    RENT_RESERV_ID NUMBER REFERENCES RENTAL_RESERVATION(RENT_RESERV_ID) NOT NULL,
    UUID NUMBER REFERENCES USERS(UUID) NOT NULL,
    SALE_ID NUMBER REFERENCES SALE(SALE_ID) NOT NULL,
    TOTAL_PRICE NUMBER(10, 2) NOT NULL,
    PAYMENT_METHOD VARCHAR2(20) CHECK(PAYMENT_METHOD IN('CARD', 'KAKAOPAY', 'NAVERPAY')),
    STATUS VARCHAR2(20) CHECK(STATUS IN('결제완료', '결제취소')) NOT NULL,
    IMP_UID VARCHAR2(50) NOT NULL,
    CARD_NUM VARCHAR2(50),
    CARD_NAME VARCHAR2(50),
    CREATED_AT DATE NOT NULL
);

INSERT INTO RENTALSHOP VALUES(1, 21, '좋은 렌탈샵', '위치', '이미지1', '이미지2', '이미지3', '이미지4', '적당한 설명', SYSDATE);
INSERT INTO RENT_ITEM VALUES(1, 1, 1, '렌탈 스키', '좋은 스키', 100, '아이템 이미지', SYSDATE);
INSERT INTO SALE VALUES(1, 0, 1, SYSDATE);
INSERT INTO RENTAL_RESERVATION VALUES(1, 1, 21, '2025-01-20', '2025-01-22', 10000, '예약완료', SYSDATE);
INSERT INTO RENT_RESERVATION_ITEM VALUES(1, 1, 1, 1, 10000);
INSERT INTO RENT_PAYMENTS VALUES(1, 1, 21, 1, 10000, 'CARD', '결제완료', 'IMP', '1', '카드', SYSDATE);

COMMIT;

SELECT * FROM RENTALSHOP;
SELECT * FROM RENT_ITEM;
SELECT * FROM SALE;
SELECT * FROM RENTAL_RESERVATION;
SELECT * FROM RENT_RESERVATION_ITEM;
SELECT * FROM RENT_PAYMENTS;