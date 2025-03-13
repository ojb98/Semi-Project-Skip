-- 리조트 리뷰 답변 테이블
CREATE TABLE RESORT_REVIEWS_RE(
    review_re_id  NUMBER PRIMARY KEY, -- 리뷰 답변 아이디
    review_id NUMBER REFERENCES RESORT_REVIEWS(review_id) ON DELETE CASCADE,  -- 리뷰 아이디
    uuid NUMBER REFERENCES USERS(uuid) ON DELETE CASCADE, -- 관리자 아이디
    content VARCHAR2(300) NOT NULL, -- 답변 내용
    created_at DATE DEFAULT SYSDATE -- 답변일  
);