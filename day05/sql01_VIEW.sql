/* VIEW */

-- sysdba로 실행해야함 권한주기
-- ROLE
GRANT CREATE VIEW TO sampleuser;

-- 
SELECT * FROM emp2;

-- 뷰생성 DDL
CREATE VIEW V_emp2
AS 	
	SELECT empno, name, deptno, tel, POSITION, pempno
	  FROM emp2;

-- 뷰로 SELECT
SELECT *
  FROM V_emp2;

-- 뷰로 INSERT
-- 단, 뷰에 속하지 않는 컬럼 중 NOT NULL 조건이 있으면 데이터 삽입불가
INSERT INTO V_emp2 VALUES (20000219, 'Tom Halland', 1004, '051)627-9968', 'IT Programmer', 19960303);

-- not null인 deptno컬럼 빼고 뷰 수정.
CREATE OR REPLACE VIEW V_emp2
AS 	
	SELECT empno, name, tel, POSITION, pempno
	  FROM emp2;

-- deptno 컬럼 NOT NULL인데 뷰에는 존재하지 않아 INSERT 불가
INSERT INTO V_emp2 VALUES (20000220, 'Zen Daiya', 1004, '051)627-9968', 'IT Programmer', 19960303);

-- CRUD 중 SELECT만 가능하게 만들려면
CREATE OR REPLACE VIEW V_emp2
AS 	
	SELECT empno, name, deptno, tel, POSITION, pempno
	  FROM emp2
WITH READ ONLY;

-- 삽입 불가
INSERT INTO V_emp2 VALUES (20000221, 'Hugo Sung', 1004, '051)627-9968', 'IT Programmer', 19960303);

-- 복합뷰. 조인등으로 여러 테이블을 합쳐서 보여주는 뷰
-- 복합뷰는 INSERT, UPDATE, DELETE가 거의 불가.
CREATE OR REPLACE VIEW V_emp3
AS
	SELECT e.empno, e.name, e.deptno, d.dname
	  FROM emp2 e, dept2 d
	 WHERE e.deptno = d.code;

-- 조회
SELECT * FROM V_emp3;


COMMIT;