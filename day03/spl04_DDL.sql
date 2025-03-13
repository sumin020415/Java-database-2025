/*
 * DDL - 데이터조작언어
 * CREATE, ALTER, DROP, TRUNCATE..
 * 객체를 생성하고, 수정하고ㅡ 삭제하거나, 데이터를 초기화.. 
 */

-- no, name, birth 컬럼의 테이블 nes_table을 생성하시오
-- create table new_table ();
CREATE TABLE new_table (
	NO		NUMBER(5,0) PRIMARY KEY,  -- PK는 지정하는게 기본
	NAME	VARCHAR2(20) NOT NULL,
	JUMIN	CHAR(14),  -- 
	BIRTH	DATE
);	

-- 삭제
DROP TABLE new_table;

-- 기본값을 설정하면서 테이블 생성
CREATE TABLE new_table (
	NO		NUMBER(5,0) PRIMARY KEY,  -- PK는 지정하는게 기본
	NAME	VARCHAR2(20) NOT NULL,
	JUMIN	CHAR(14),  -- 
	BIRTH	DATE,
	salary	NUMBER(7,0) DEFAULT 0  -- 아무값도 넣지않고 INSERT하면 NULL을 0으로 대체
);	

-- 테이블 컬럼에 주석추가
COMMENT ON COLUMN new_table.name IS '사원이름';

-- 기본키가 두개인 테이블 생성
CREATE TABLE DOUBLEKEYTBL (
	ID		NUMBER(5,0),
	CODE	CHAR(4),
	NAME	VARCHAR2(20) NOT NULL,
	JUMIN	CHAR(14) UNIQUE,
	CONSTRAINT DOUBLEKEYTBL_PK PRIMARY KEY(ID,CODE)
);

-- new_member 부모테이블과 new_board 자식테이블간의 관계가 성립된 테이블 생성하시오
CREATE TABLE new_member (
	IDX 	NUMBER PRIMARY KEY,
	NAME	VARCHAR2(20) NOT NULL,
	ID		VARCHAR2(20) NOT NULL, 
	PASS	VARCHAR2(256) NOT NULL
);

-- new_board는 new_member의 PK IDX를 외래키로 사용
CREATE TABLE new_board (
	BIDX		NUMBER PRIMARY KEY,
	TITLE		VARCHAR2(125) NOT NULL,
	CONTENT		LONG NOT NULL,
	REG_DATE	DATE DEFAULT sysdate,
	COUNT 		NUMBER(6,0) DEFAULT 0,
	MIDX		NUMBER NOT NULL,
	CONSTRAINT FK_MEMBERIDX FOREIGN KEY (MIDX) REFERENCES new_member (IDX)
);

-- ALTER 기존 테이블을 수정할 때 사용
ALTER TABLE new_table ADD (adress VARCHAR2(200));

-- ALTER로 기존 테이블에 전화번호 컬럼 추가
-- 이미 데이터가 존재하는 테이블에서 NOT NULL 컬럼은 추가불가함!!
ALTER TABLE new_table ADD (tel VARCHAR2(20));  -- 가능
ALTER TABLE new_table ADD (tel VARCHAR2(20) NOT NULL);  -- 불가

-- 컬럼수정
ALTER TABLE new_table MODIFY (adress VARCHAR2(100));

-- 컬럼명 변경
ALTER TABLE SAMPLEUSER.NEW_TABLE RENAME COLUMN ADRESS TO ADDRESS;

-- DROP 테이블 삭제
-- purge 휴지통으로 보냄
DROP TABLE new_table purge;

-- TRUNCATE 테이블 초기화
-- ID(자동으로 증가하는) 1,2,3,4,5
TRUNCATE TABLE new_table;