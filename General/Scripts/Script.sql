SELECT
	AREA_NAME 지역명,
	MEMBER_ID 아이디,
	MEMBER_NAME 이름,
	GRADE_NAME 등급명
FROM TB_MEMBER M
JOIN TB_GRADE ON (GRADE = GRADE_CODE)
JOIN TB_AREA A ON (M.AREA_CODE = A.AREA_CODE)
WHERE
	M.AREA_CODE = (
	SELECT AREA_CODE
	FROM TB_MEMBER
	WHERE MEMBER_NAME = '김영희')
ORDER BY 이름 ASC;


SELECT
	AREA_NAME 지역명,
	MEMBER_ID 아이디,
	MEMBER_NAME 이름,
	GRADE_NAME 등급명
FROM
	TB_MEMBER
JOIN TB_GRADE ON
	(GRADE = GRADE_CODE)
JOIN TB_AREA
		USING (AREA_CODE)
	-- 문제원인 1 : 8번째 TB_AREA를 JOIN하는 구문에서
	--           ON(AREA_CODE = AREA_CODE)로 작성되어
	--           컬럼명이 같아 어떤 테이블의 컬럼인지 구분되지 않는 문제가 발생
	-- 해결방법 1 : ON을 USING 구문으로 변경하여 같은 컬럼명으로 JOIN이 가능하도록 함
	--                 (AREA_CODE = AREA_CODE) -> USING (AREA_CODE)
WHERE
	AREA_CODE = (
	SELECT
		AREA_CODE
	FROM
		TB_MEMBER
	WHERE
		MEMBER_NAME = '김영희')
	-- 문제원인 2 : 서브쿼리의 WHERE절에 '이름'이라는 별칭이 작성되어
	--                         SELECT가 정상 수행되지 않음
	-- 해결방법 2 : 서브쿼리의 '이름' 별칭을 컬럼명인 MEMBER_NAME으로 변경
	--           -> WHERE 이름 = '김영희' -> WHERE MEMBER_NAME = '김영희'
ORDER BY
	이름 ASC;
	-- 문제원인 3 : 요구사항에서 이름을 오름차순으로 요구했으나
	--                      ORDER BY절에 DESC 내림차순으로 작성됨
	-- 해결방법 3 : ORDER BY절에 DESC를 지우거나 ASC로 바꿔 정렬하도록함
	--                      -> ORDER BY 이름 또는 ORDER BY 이름 ASC;