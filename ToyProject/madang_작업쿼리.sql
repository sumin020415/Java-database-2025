-- madang 로그인

--조회
SELECT * FROM students;

-- 더미데이터 삽입
INSERT INTO Students(STD_ID, STD_NAME, STD_MOBILE, STD_REGYEAR)
VALUES (SEQ_STUDENT.nextval, '홍길동', '010-9999-8888', 1997);
INSERT INTO Students(STD_ID, STD_NAME, STD_MOBILE, STD_REGYEAR)
VALUES (SEQ_STUDENT.nextval, '홍길순', '010-9999-8877', 2000);

COMMIT;

SELECT std_id, std_name
	 , std_mobile, std_regyear
  FROM Students;