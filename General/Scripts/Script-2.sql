SELECT AREA_NAME 지역명,
			 MEMBER_ID 아이디,
			 MEMBER_NAME 이름,
			 GRADE_NAME 등급명

FROM TB_MEMBER 
JOIN TB_GRADE ON(GRADE = GRADE_CODE)
JOIN TB_AREA USING (AREA_CODE)

WHERE AREA_CODE = (
	SELECT AREA_CODE 
	FROM TB_MEMBER
	WHERE MEMBER_NAME = '김영희'
	)

ORDER BY 이름 ASC;



-- JOIN : 같은 값을 가진 컬럼을 연결함 

/* TB_MEMBER 와 TB_AREA 조인 (ON 사용)
MEMBER_ID 	MEMBER_PWD 	MEMBER_NAME 	GRADE 	AREA_CODE | AREA_CODE	AREA_NAME
hong01			pass01			홍길동					10			02				|	02					서울	
leess99			pass02			이순신					10			032				| 032					인천
ss50000			pass03			신사임당				30			031				| 031					경기
iu93	  		pass04			아이유					30			02				| 02          서울
pcs1234			pass05			박철수					20			031				| 031         경기
you_js			pass06			유재석					10			02				| 02 					서울
kyh9876			pass07			김영희					20			031				| 031         경기
 
 * */


/* TB_MEMBER 와 TB_AREA 조인 (USING 사용)
MEMBER_ID 	MEMBER_PWD 	MEMBER_NAME 	GRADE |	AREA_CODE |	AREA_NAME
hong01			pass01			홍길동					10		|	02				|		서울	
leess99			pass02			이순신					10		|	032				|		인천
ss50000			pass03			신사임당				30		|	031				| 	경기
iu93	  		pass04			아이유					30		|	02				|   서울
pcs1234			pass05			박철수					20		|	031				|   경기
you_js			pass06			유재석					10		|	02				| 	서울
kyh9876			pass07			김영희					20		|	031				|   경기
 
 * */


-- 홍길동 회원과 같은 지역에 사는 회원들의 지역명, 아이디, 이름, 등급명을 내림차순으로 조회

SELECT AREA_NAME 지역명,
			 MEMBER_ID 아이디,
			 MEMBER_NAME 이름,
			 GRADE_NAME 등급명
			 
FROM TB_MEMBER K
JOIN TB_GRADE  ON (GRADE = GRADE_CODE)
JOIN TB_AREA O ON (O.AREA_CODE = K.AREA_CODE)
WHERE 
	  K.AREA_CODE = (
		SELECT AREA_CODE
		FROM TB_MEMBER
		WHERE MEMBER_NAME = '홍길동')
ORDER BY 이름 ASC;	
-------------------------------------------------

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
	WHERE MEMBER_NAME = '홍길동')
ORDER BY 이름 DESC;


		