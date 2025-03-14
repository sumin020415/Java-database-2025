/* DML 중 SELECT 이외 INSERT, UPDATE, DELETE */

-- INSERT
SELECT * FROM new_table;

-- INSERT QUERY 기본
INSERT INTO new_table (NO, name, jumin, birth, salary)
VALUES(1, '홍길동', '810205-1825697', '19810205', 5000);

-- 테이블 컬럼리스트와 동일한 순서, 동일한 값을 넣을때
-- 단, 컬럼리스트와 순서도 다르고, 값리스트 갯수도 다르면 컬럼리스트 생략불가!
INSERT INTO new_table
VALUES(2, '홍길순', '830105-2825698', '19830105', 4000);

-- 컬럼리스트 순서가 다를때는 반드시 적어줘야함 
INSERT INTO new_table (jumin, name, no)
VALUES('760921-1825899','성유고', 3);

-- 값이 뭔지 모를때는 NULL로 삽입
INSERT INTO new_table
VALUES(4, '홍길태', '830105-1825698', NULL, NULL); 

-- 한 테이블에 있는 데이터를 모두 옮기면서 새로운 테이블 생성
-- PK는 복사가 안됨!
CREATE TABLE professor_new
AS
SELECT * FROM professor;

SELECT * FROM professor_new;

-- 새로 만들어진 테이블 professor_new 데이터를 삽입 테스트
INSERT  INTO professor_new (profno, name, id, POSITION, pay, hiredate)
VALUES (4008, 'Tom Cruise', 'Cruise', 'omstrictor', 300, '2005-03-14')

-- professor_new는 PK이 없기 때문에 같은 값이 들어감
INSERT  INTO professor_new (profno, name, id, POSITION, pay, hiredate)
VALUES (4008, 'Tom Holland', 'Holland', 'instructor', 310, '2005-03-14')

INSERT ALL
	INTO new_table VALUES (5, '홍길길', '810205-1825697', '1981-0205', 5000)
	INTO new_table VALUES (6, '홍길평', '810205-1825697', '1981-0205', 5000)
	INTO new_table VALUES (7, '홍길똥', '810205-1825697', '1981-0205', 5000)
	INTO new_table VALUES (8, '홍길군', '810205-1825697', '1981-0205', 5000)
	INTO new_table VALUES (9, '홍길치', '810205-1825697', '1981-0205', 5000)
SELECT * FROM dual;

SELECT * FROM NEW_TABLE;