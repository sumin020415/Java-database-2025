/* 사용자 생성, 시존 사용자 사용해제, 권한주기 */

-- HR 계정 잠금 해제 [@ XE - sys(sysdba)]
ALTER USER hr account unlock;
ALTER USER hr IDENTIFIED BY 12345;

SELECT *
  FROM employees;

-- PRIVILEGES 권한
-- CREATE SESSION : 접속권한
-- CREATE TABLE, ALTER ANY TABLE, DROP ANY TABLE, ..
-- 권한은 하나하나 다 부여해야 함 

/*
-- scott 계정 잠금해제. 계정이 없을 수도 있음
ALTER USER scott ACCOUNT UNLOCK;

-- scott은 CREATE SESSION권한없음. LOGON DENIED.
-- scott에게 접속권한 부여.
GRANT CREATE SESSION TO scott;
FLUSH PRIVILEGES;
*/

SELECT * FROM jobs;

CREATE VIEW JOBS_VIEW
AS
	SELECT *
	  FROM jobs;

-- HR 계정에 어떤 권한이 있는지 조회
SELECT *
  FROM USER_TAB_PRIVS;

-- HR로 테이블 생성
CREATE TABLE TEST(
	ID NUMBER PRIMARY KEY,
	NAME VARCHAR(20) NOT NULL
);

-- ROLE(역할) 관리
-- 여러 권한을 묶어놓은 개념
-- ROLE 확인
-- CONNECT : DB접속 및 테이블생성, 조회 권한
-- RESOURCE : PL/SQL 사용권한
-- DBA : 모든 시스템권한
-- EXP_FULL_DATABASE : DB익스포트 권한...
SELECT * FROM USER_ROLE_PRIVS;

SELECT * FROM DBA_ROLE_PRIVS;

-- HR에게 DBA역할 ROLE 부여
GRANT DBA TO HR;

SELECT * FROM SAMPLEUSER.MEMBER;

-- HR에게 DBA역할 권한 해제
REVOKE DBA FROM HR;

COMMIT;