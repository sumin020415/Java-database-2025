/*단일행 함수*/

SELECT concat('Hello', 'Oracle') -- 한행 한열만 출력되는 값 : 스칼라(Scalar)값
   FROM dual;

-- 인덱스가 1부터 시작, 일반프로그래밍언어는 배열이 0부터 시작하는 것과 차이가 있음
-- SUBSTR(변환할값, 인덱스, 길기) - 파이썬 substring() 함수와 동일
-- -인덱스 : 뒤에서부터 위치
SELECT substr(email, 1,2), -- 진짜진짜 많이 씀
      substr(email, -2,2),
      email
   FROM HR.EMPLOYEES;

-- 전화번호 자를 때, 주민번호 자를 때 SUBSTR() 활용

-- INSTR(체크할 문자열, 찾는글자, 시작위치, 몇번째)
SELECT '010-1111-2222',
      instr('010-1111-2222', '-', 1,1), -- 4
      instr('010-1111-2222', '-', 1,2)  -- 9
   FROM dual;

-- LPAD(문자열, 자리수, 채울문자), RPAD(문자열, 자리수, 채울문자)
-- 2025-11-23
-- 2025-3-12 -> 2025-03-12
-- 0000100 규칙인데
-- 101 -> 0000101
SELECT LPAD('100',7,'0'), -- 많이 씀!
      RPAD('ABC',7,'-')
   FROM dual;

-- TRIM() 함수 트리플. == python strip() 함수와 동일
-- LTRIM(), RTRIM(), TRIM()
SELECT '<<<' || '    Hello Oracle    ' || '>>>',
       '<<<' || LTRIM('    Hello Oracle    ') || '>>>',
       '<<<' || RTRIM('    Hello Oracle    ') || '>>>',
       '<<<' || TRIM('    Hello Oracle    ') || '>>>'
   FROM dual;

-- REPLACE(), python에서도 동일하게 존재
SELECT phone_number,
      replace(phone_number, '123','831') -- 많이 씀!
   FROM HR.EMPLOYEES;


/* 숫자함수, 집계함수와 같이 사용이 많이 됨. */

-- ROUND() 반올림 함수 - 파이썬 존재
-- CEIL() 올림함수, FLOOR() 내림함수, TRUNC() 내림함수 소수점
-- MOD() 나누기 나머지값 = 파이썬 - modw(), % 연산과 동일
-- POWER() 파이썬 math.pow(), power(), 2^10 승수계산 동일

SELECT 786.5427 AS res1
 	 , round(786.5427) AS round0 -- 소수점없이
 	 , round(786.5427, 1) AS round1 -- 소수점1
 	 , round(786.5427, 3) AS round3 -- 소수점3
 	 , ceil(786.5427) AS ceilRes 
 	 , floor(786.5427) AS floorRes 
 	 , trunc(786.5427) AS truncRes
 	 , mod(10, 3) AS "나머지"
 	 , power(2, 10) AS "2의 10승"
  FROM dual;

/* 
 * 날짜함수, 나라마다 표현방식 다름 
 * 2025-03-12 아시아..
 * March/12/2025 미국,캐나다..
 * 12/March/2025  유럽,인도,베트남..
 * 포맷팅을 많이 함.
 */
-- 오늘(현재)날짜
SELECT sysdate AS 오늘날짜 -- GMT기준 +09필요
	-- 날짜 포맷팅 사용되는 YY, YYYY, MM, DD, DAY 년월일
	-- AM/PM, HH, HH24, MI, SS, W(주차), Q(분기)
 	 , TO_CHAR(sysdate, 'YYYY-MM-DD DAY') AS 한국식
 	 , TO_CHAR(sysdate, 'AM HH24:MI:SS') AS 미국식
 	 , TO_CHAR(sysdate, 'MON/DD/YYYY') AS 영국식
  FROM dual;

-- ADD_MONTHS() 월을 추가함수
SELECT hire_date, 
       TO_CHAR(hire_date, 'YYYY-MM-DD') AS 입사일자, 
       ADD_MONTHS(hire_date, 3) AS 정규직일자,
       NEXT_DAY(hire_date, '월') AS 돌아오는월요일, -- 'MON' == '월'
       LAST_DAY('2025-02-01') AS 달마지막날
FROM HR.EMPLOYEES;

-- GMT +9
-- INTERVAL 숫자 뒤 HOUR, DAY, MONTH, YEAR 사용가능
SELECT to_char(sysdate + INTERVAL '9' HOUR, 'YYYY-MM-DD HH24:MI:SS') AS seoul_time  
  FROM dual;

/* 형 변환 함수 */
-- TO_CHAR()
-- 숫자형을 문자형으로 변경
-- 9,999,999,999,999
SELECT 12345 AS 원본
	 , TO_CHAR(12345,'9999999') AS "원본+두자리"
	 , TO_CHAR(12345,'0999999') AS "원본+두자리0"
	 , TO_CHAR(12345,'$99999') AS "통화단위+원본"
	 , TO_CHAR(12345,'99999.99') AS "소수점"
	 , TO_CHAR(12345,'99,999') AS "천단위쉼표"  -- 진짜 많이씀
  FROM DUAL;

-- TO_NUMBER() 문자형된 데이터를 숫자로 변경
SELECT '5.0' * 5
	 , TO_NUMBER('5.0') AS 숫자형변환
--	 , TO_NUMBER('5.0') AS 숫자형변환  -- 숫자로 변경할 수 없는 형태는 불가
  FROM dual;

-- TO_DATE() 날짜형태를 문자형으로 변경
SELECT '2025-03-12'
	 , TO_DATE('2025-03-12') + 10  -- 날짜 계산을 위해 변형함
  FROM dual;

/* 일반함수 */
-- NVL(컬럼or데이터) 널값을 다른값으로 치환
SELECT commission_pct
	 , NVL(commission_pct, 0.0)
  FROM HR.EMPLOYEES;

SELECT NVL(hire_date, sysdate)  -- 입사일자가 비어있으면 오늘날짜로 대체
  FROM HR.EMPLOYEES;

-- NVL2(컬럼|데이터, 널이 아닐때 처리, 널일때 처리할 부분)
SELECT commission_pct
	 , salary
	 , NVL2(commission_pct, salary + (salary * commission_pct), salary) AS 커미션급여
  FROM HR.EMPLOYEES;

-- DECODE(A, B, '1', '2') A가 B일경우 1 아니면 2
-- 오라클만 있음
SELECT email, phone_number, job_id
	 , DECODE (job_id, 'IT_PROG', '개발자만세!', '나머진 다죽어') AS 캐치프레이즈
  FROM HR.EMPLOYEES;
-- WHERE job_id = 'IT_PROG';

/* 
 * CASE 구문, 정말중요함!! 
 * if, elif의 중복된 구문과 유사
 * */




















