-- 리조트 리뷰 테이블

CREATE TABLE RESORT_REVIEWS(
    review_id  NUMBER PRIMARY KEY,  -- 리뷰 아이디
    -- payment_id  NUMBER REFERENCES PAYMENTS(payment_id) ON DELETE CASCADE, -- 결제 아이디  (
    payment_id NUMBER, -- 결제 테이블 생성전 임의의 값
    uuid  NUMBER REFERENCES USERS(uuid) ON DELETE CASCADE, -- 유저 아이디
    resort_id NUMBER NOT NULL, -- 리조트 아이디 
    rating NUMBER(3,2) NOT NULL CHECK(rating BETWEEN 1 AND 5), -- 별점
    resort_comment NOT NULL VARCHAR2(1000), -- 리뷰 내용
    review_img VARCHAR2(255),   -- 리뷰 이미지
    created_at DATE DEFAULT SYSDATE  -- 작성일
);
