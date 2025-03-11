/* 내장함수 */

/* 문자(열)함수 */

-- INITCAP() : 영어에서 첫글자만 대문자로 출력하고 나머지는 전부 소문자로 출력하는 함수
SELECT initcap('hello oracle') AS "result"
  FROM dual;  -- 실제하지 않는 테이블(Oracle만!)
  
-- LOWER() 모든글자 소문자, UPPER() 모든글자 대문자로
SELECT LOWER(first_name) AS "first_name"
	 , first_name AS "Original first_name"
     , UPPER(last_name) AS "last_name"
     , last_name AS "Original last_name"
  FROM employees;

-- LENGTH()/LENGTHB() 함수
SELECT LENGTH('Hello oracle')     -- 영어 글자길이 12
	 , LENGTHB('Hello oracle')    -- 12bytes (영어철자 하나당 1byte)
	 , LENGTH('반가워요 오라클')  -- 한글 글자길이 8
	 , LENGTHB('반가워요 오라클') -- 22bytes (보통 한글은 한글자당 3byte / 한글7자*3byte = 21byte + 공백 1byte)
	 , ASCII('A')
	 , ASCII('a')
	 , ASCII('가')
  FROM dual;

-- CONCAT()
SELECT CONCAT(CONCAT(first_name, ' '), last_name) AS "full_name"
  FROM employees;