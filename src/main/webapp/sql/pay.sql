-- 리조트 결제 테이블
CREATE TABLE PAYMENTS (
    payment_id   NUMBER PRIMARY KEY, 
    resort_reserv_id NUMBER REFERENCES ROOM_RESERVATION(resort_reserv_id) ON DELETE CASCADE,   
    uuid  NUMBER REFERENCES USERS(uuid) ON DELETE CASCADE, 
    total_price NUMBER(10,2) NOT NULL,  
    payment_method  VARCHAR2(20) CHECK(payment_method IN('CARD', 'KAKAOPAY', 'NAVERPAY')),
    status     VARCHAR2(20) DEFAULT '결제완료' CHECK(status IN('결제완료','결제취소')),  
    imp_uid    VARCHAR2(50) NOT NULL,   
    card_num   VARCHAR2(50),   
    card_name VARCHAR2(50),    
    created_at   DATE DEFAULT SYSDATE 
);
