/* empno에 해당하는 사원의 급여를 인상하는 프로시저 */

-- SELECT * FROM emp WHERE empno = 7900;

CREATE OR REPLACE PROCEDURE UP_SAL
(
	v_empno	emp.empno%TYPE
)
IS
	cnt_emp	number(1,0);
BEGIN
	SELECT COUNT(*) INTO cnt_emp
	  FROM emp
	 WHERE empno = v_empno;

	IF cnt_emp > 0 THEN
		UPDATE emp SET
			sal = sal + (sal * 0.1)
		 WHERE empno = v_empno;
	
		DBMS_OUTPUT.PUT_LINE('업데이트 가능');
	ELSE 
		DBMS_OUTPUT.PUT_LINE('업데이트 불가');
	END IF;
END UP_SAL;

-- 프로시저 실행
CALL up_sal(7900);

SELECT * FROM emp WHERE empno = 7900;