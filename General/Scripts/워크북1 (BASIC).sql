-- 1번
-- 춘 기술대학교의 학과 이름과 계열을 조회
-- 단, 출력 헤더(컬럼명)는 "학과 명", "계열"로 표시하도록 함

SELECT DEPARTMENT_NAME "학과 명", CATEGORY "계열"
FROM TB_DEPARTMENT;


-- 2번
-- 학과의 학과 정원을 다음과 같은 형태로 조회

SELECT DEPARTMENT_NAME || '의 정원은 ' || CAPACITY || '명 입니다.' AS "학과별 정원"
FROM TB_DEPARTMENT;


-- 3번 
-- "국어국문학과"에 다니는 여학생 중 현재 휴학중인 여학생을 조회
-- (국문학과의 학과코드(DEPARTMENT_NO)는 001)

SELECT STUDENT_NAME "이름", 
			 STUDENT_SSN "주민등록번호",
			 ABSENCE_YN "휴학 여부 ",
			 DEPARTMENT_NO "학과번호"
FROM TB_STUDENT     
WHERE SUBSTR (STUDENT_SSN, 8, 1) = '2' 
-- WHERE SUBSTR (STUDENT_SSN, 8, 1) = '2'
-- 'STUDENT_SSN 필드의 8번째 문자가 2인 레코드를 선택하는 조건'
AND ABSENCE_YN = 'Y'
AND DEPARTMENT_NO = '001';
----------------------------------------------------
/* SUBSTR : 컬럼 또는 문자열에서 지정한 위치부터
 *          지정한 개수의 문자열을 잘라내어 반환
 * 
 * AND    : 여러 조건이 동시에 TRUE일 경우에 TRUE 값 반환
 * 
 * AND ABSENCE_YN = 'Y'
	 AND DEPARTMENT_NO = '001';
 * - 현재 휴학중인 여학생이면서 학과번호가 '001'인 
 * 
 * */ 
----------------------------------------------------


-- 4번
-- 도서관에서 대출 도서 장기 연체자들을 찾아 이름을 게시하고자 한다.
-- 그 대상자들의 학번이 다음과 같을 때 대상자들을 찾는 적절한 SQL 구문을 작성하시오
-- A513079, A513090, A513091, A513110, A513119
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN ('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY STUDENT_NO DESC;

------------------------------------------------------------------------------


-- 5번
-- 입학 정원이 20명 이상 30명 이하인 학과들의 학과 이름과 계열을 조회
SELECT DEPARTMENT_NAME, CATEGORY 
FROM TB_DEPARTMENT 
WHERE CAPACITY BETWEEN 20 AND 30;


/* 1. TB_DEPARTMENT 테이블에서
 * 2. 조회하려는 행은 CAPACITY 조건식은 BETWEEN 20 AND 30
 * 3. DEPARTMENT_NAME, CATEGORY 컬럼을 조회
 * 
 * 
 * - BETWEEN AND : 비교하려는 값이 지정 범위에 포함되면 TRUE를 리턴
 * 								 상한 값과 하한 값의 경계를 포함
 * 
 *   BETWEEN 20 AND 30 : CAPACITY(정원)이 20명 이상이거나 30명 이하인 행을 조회
 * */ 

------------------------------------------------------------------

-- 6번
-- 춘 기술대학교는 총장을 제외하고 모든 교수들이 소속 학과를 가지고 있다.
-- 그럼 춘 기술대학교 총장의 이름을 알아낼 수 있는 SQL 문장을 작성하시오
SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL; -- 임해정 

-- IN NULL : 이 조건식은 열의 값이 NULL인지 확인
-- 					 즉 열의 값이 NULL이면 조건이 참으로 평가됨
-- NULL    : 값이 없는 상태를 의미함

-- DEPARTMENT_NO IS NULL을 사용하는 쿼리는
-- DEPARTMENT_NO(학과번호)가 NULL인 사람을 찾음


----------------------------------------------------------------------
-- 7번
-- 수강신청을 하려고 한다. 선수과목 여부를 확인해야 하는데,
-- 선수과목이 존재하는 과목들은 어떤 과목인지 과목 번호를 조회

SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

-- IS NOT NULL : 이 조건식은 열의 값이 NULL이 아닌지 확인
-- 							 즉 열의 값이 NULL이 아니면 조건이 참으로 평가

/* PRATTENDING_CLASS_NO IS NOT NULL을 사용하는 쿼리는
 * PRATTENDING_CLASS_NO가 NULL이 아닌 사람을 찾음
 * */ 

/* 1. TB_CLASS인 테이블을 조회
 * 2. 조회하려는 행은 PREATTENDING_CLASS_NO(선수과목번호)
 *    조건식은 IS NOT NULL   
 * 3. CLASS_NO(과목번호) 컬럼중 */


-------------------------------------------------------------



-- 8번
-- 춘 대학에는 어떤 계열(CATEGORY)들이 있는지 오름차순으로 조회

SELECT DISTINCT CATEGORY
FROM TB_DEPARTMENT
ORDER BY 1 ASC;

-- ORDER BY 1 ASC : 결과를 정렬할 때 사용
--								  '1' 컬럼의 위치를 나타냄 -> CATEGORY
--   								ASC : 오름차순

/* 1. TB_DEPARTMENT인 테이블을 조회
 * 2. CATEGORY(계열) 컬럼중 DISTINCT(중복없이 유일한 값)들만 추출하고
 * 3. 그 결과를 오름차순으로 정렬
 * */ 
 