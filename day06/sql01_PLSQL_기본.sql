/* PL/SQL */
-- SET SERVEROUTPUT ON;  - 콘솔에서만 사용

DECLARE  -- 선언부. 여기에 사용할 모든 변수를 선언
	v_empno	emp.empno%TYPE;  -- NUMBER(4,0); 대체해서 특정 테이블의 컬럼과 같은 데이터타입을 쓰겠다고 선언
	v_ename emp.ename%TYPE;  -- VARCHAR(10)과 동일
BEGIN  -- PL/SQL 시작 지정
	SELECT empno, ename INTO v_empno, v_ename  -- 변수값을 할당
	  FROM emp
	 WHERE empno = :empno;  -- DYNAMIC 변수 (원래는 &empno로 작성하여어하지만 DBEAVER 때문에 :empno로 변경)

	
		-- 정상실행될 경우 출력
		DBMS_OUTPUT.PUT_LINE(v_empno || '- 이 멤버의 이름은 ' || v_ename);
EXCEPTION  -- 예외처리 부분
	WHEN NO_DATA_FOUND THEN
		DBMS_OUTPUT.PUT_LINE('멤버가 없음');
	WHEN TOO_MANY_ROWS THEN
		DBMS_OUTPUT.PUT_LINE('데이터가 너무 많음');
END;  -- PL/SQL 종료부분
/
COMMIT;

