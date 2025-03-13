/* 
 * 복수행 함수 마무리 
 * 24시간 7일 365일
 */

-- GROUP BY
-- 그룹핑 시 GROUP BY에 들어가는 컬럼만 SELECT 절에 사용가능
-- WHERE 절은 일반적 조건만 비교, HAVING 집계함수를 조건에 사용할 때
SELECT department_id
	 , SUM(salary)
  FROM employees
 GROUP BY department_id
 HAVING SUM(salary) <= 20000
 ORDER BY 2 ASC;  -- SUM(SALARY)와 동일. SELECT절 순서에 따라
 
 -- RANK() - 1,2,2,4 순
 -- DENSE_RANK() - 1,2,2,3 순
 -- ROW_NAUBER() - 행번호
 -- 전에 employee에서 급여가 높은 사람부터 순위 매길때
 SELECT first_name || ' ' || last_name AS "full_name"
 	  , salary
 	  , department_id
 	  , RANK() OVER (ORDER BY salary desc) AS "RANK"
 	  , DENSE_RANK() OVER (ORDER BY salary desc) AS "DENSE_RANK"  -- 일상에서 DENSE-RANK 더 많이 사용
 	  , ROW_NUMBER() OVER (ORDER BY salary desc) AS "ROW_NUM"
  FROM employees
 WHERE salary IS NOT NULL;
 
 -- 부서별(department_id), 급여놓은 사람부터 랭킹을 매길때
SELECT first_name || ' ' || last_name AS "full_name"
 	  , salary
 	  , department_id
 	  , RANK() OVER (PARTITION BY department_id ORDER BY salary desc) AS "RANK"
 	  , DENSE_RANK() OVER (PARTITION BY department_id ORDER BY salary desc) AS "DENSE_RANK"  -- 일상에서 DENSE-RANK 더 많이 사용
 	  , ROW_NUMBER() OVER (PARTITION BY department_id ORDER BY salary desc) AS "ROW_NUM"  -- PARTITION BY 잘 사용안함
  FROM employees
 WHERE salary IS NOT NULL
 ORDER BY department_id;