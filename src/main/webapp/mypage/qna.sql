CREATE TABLE QNA(
	QNA_ID NUMBER PRIMARY KEY,
	UUID NUMBER REFERENCES USERS(UUID) NOT NULL,
	CATEGORY VARCHAR2(20) CHECK(CATEGORY IN('SKI', 'RENTAL', 'RESORT')) NOT NULL,
	REF_ID NUMBER NOT NULL,
	TITLE VARCHAR2(50) NOT NULL,
	CONTENT VARCHAR2(300) NOT NULL,
	STATUS VARCHAR2(15) CHECK(STATUS IN('CHECKING', 'COMPLETED')) NOT NULL,
	CREATED_AT DATE NOT NULL
);

CREATE TABLE QNA_RE(
	QNA_RE_ID NUMBER PRIMARY KEY,
	QNA_ID NUMBER REFERENCES QNA(QNA_ID) NOT NULL,
	UUID NUMBER REFERENCES USERS(UUID) NOT NULL,
	CONTENT VARCHAR2(300) NOT NULL,
	CREATED_AT DATE NOT NULL
);

INSERT INTO QNA VALUES(1, 21, 'SKI', 1, '적당한 문의##################################', '냉무', 'CHECKING', SYSDATE);
INSERT INTO QNA VALUES(2, 21, 'SKI', 1, '적당한 문의##################################', '냉무', 'CHECKING', SYSDATE);
INSERT INTO QNA VALUES(3, 21, 'SKI', 1, '적당한 문의##################################', '냉무', 'CHECKING', SYSDATE);
INSERT INTO QNA VALUES(4, 21, 'SKI', 1, '적당한 문의##################################', '냉무', 'CHECKING', SYSDATE);
INSERT INTO QNA VALUES(5, 21, 'SKI', 1, '적당한 문의##################################', '냉무', 'CHECKING', SYSDATE);
INSERT INTO QNA VALUES(6, 21, 'SKI', 1, '적당한 문의##################################', '냉무', 'CHECKING', SYSDATE);
INSERT INTO QNA VALUES(7, 21, 'SKI', 1, '적당한 문의##################################', '냉무', 'COMPLETED', SYSDATE);
INSERT INTO QNA VALUES(8, 21, 'SKI', 1, '적당한 문의##################################', '냉무', 'COMPLETED', SYSDATE);
INSERT INTO QNA VALUES(9, 21, 'SKI', 1, '적당한 문의##################################', '냉무', 'COMPLETED', SYSDATE);
INSERT INTO QNA VALUES(10, 21, 'SKI', 1, '적당한 문의##################################', '냉무', 'COMPLETED', SYSDATE);

INSERT INTO QNA_RE VALUES(1, 7, 21, 'ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁAAAAAAAAAAㅁ', SYSDATE);
INSERT INTO QNA_RE VALUES(2, 8, 21, 'ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁAAAAAAAAAAㅁ', SYSDATE);
INSERT INTO QNA_RE VALUES(3, 9, 21, 'ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁAAAAAAAAAAㅁ', SYSDATE);
INSERT INTO QNA_RE VALUES(4, 10, 21, 'ㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁㅁAAAAAAAAAAㅁ', SYSDATE);

COMMIT;