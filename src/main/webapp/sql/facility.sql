-- 시설 유형 테이블 (Facility_Types)
CREATE TABLE FACILITY_TYPES (
    type_id     NUMBER PRIMARY KEY, 
    type_name    VARCHAR2(100) UNIQUE NOT NULL
);

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
commit;


-- 시설 테이블 (Facilities)
CREATE TABLE FACILITIES (
    facility_id  NUMBER PRIMARY KEY,
    type_id      NUMBER REFERENCES FACILITY_TYPES(type_id) ON DELETE CASCADE, 
    facility_name VARCHAR2(255) UNIQUE NOT NULL 
);

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


-- 리조트-시설 매핑 테이블 (Resort_Facility_Map)
CREATE TABLE RESORT_FACILITY_MAP (
    resort_id    NUMBER REFERENCES RESORT(resort_id) ON DELETE CASCADE, 
    facility_id  NUMBER REFERENCES FACILITIES(facility_id) ON DELETE CASCADE, 
    PRIMARY KEY (resort_id, facility_id)
);


--시퀀스
CREATE SEQUENCE facilities_seq;