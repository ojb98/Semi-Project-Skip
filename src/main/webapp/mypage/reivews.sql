-- 참고용

CREATE OR REPLACE VIEW REVIEWS_VIEW AS
SELECT 'SKI' AS CATEGORY, REVIEW_ID, PAYMENT_ID, UUID, SKI_ID AS REF_ID, (SELECT NAME FROM SKI WHERE SKI_ID = SKI_REVIEWS.SKI_ID) AS REF_NAME, RATING, REVIEW_COMMENT, IMG, CREATED_AT
FROM SKI_REVIEWS
UNION
SELECT 'RENTAL' AS CATEGORY, REVIEW_ID, PAYMENT_ID, UUID, RENTALSHOP_ID AS REF_ID, (SELECT NAME FROM RENTALSHOP WHERE RENTALSHOP_ID = RENTALSHOP_REVIEWS.RENTALSHOP_ID) AS REF_NAME, RATING, REVIEW_COMMENT, IMG, CREATED_AT
FROM RENTALSHOP_REVIEWS
UNION
SELECT 'RESORT' AS CATEGORY, REVIEW_ID, PAYMENT_ID, UUID, RESORT_ID AS REF_ID, (SELECT NAME FROM RESORT WHERE RESORT_ID = RESORT_REVIEWS.RESORT_ID) AS REF_NAME, RATING, REVIEW_COMMENT, IMG, CREATED_AT
FROM RESORT_REVIEWS;