-- 다음 요구사항을 충족할 수 있도록 SQL문을 작성하고 실행하였지만, 실패하거나 일부가 요구사항에 맞게 작성되지 않았다.
-- SQL문을 분석하여 원인과 조치내용을 작성하시오.

CREATE TABLE MEMBERS (
		
		MEMBER_ID VARCHAR2 (20),
		MEMBER_PWD VARCHAR2 (20) NOT NULL,
		MEMBER_NAME VARCHAR2 (30),
		MEMBER_AGE NUMBER(3),
		MEMBER_EMAIL VARCHAR2(50),
		CONSTRAINT MEMBER_ID_PK PRIMARY KEY(MEMBER_ID)
	
		
);

DROP TABLE MEMBERS;

SELECT * FROM MEMBERS;

INSERT INTO MEMBERS 
VALUES ('user01','pass01','지호','20','jiho@kh.or.kr');

-- 원인 1. PRIMARY KEY 제약조건을 작성하는 구문에서
--        식별하기위한 제약조건이 올바르게 작성되지않음

-- 해결 1. 테이블 레벌을 올바르게 설정함
--        CONSTRAINT MEMBER_ID_PK PRIMARY KEY(MEMBER_ID)

-- 원인 2. 작성된 MEMBER_NAME의 데이터 타입이 CHAR이기때문에
--        실제입력되는 값보다 짧아도 공백으로 채우게됨

-- 해결 2. 데이터 타입을 VARCHAR2로 요구사항에 맞게 수정 
					
----------------------------------------------------------------------------------------------



CREATE TABLE BOARDS(
		BOARD_NO NUMBER PRIMARY KEY,
		BOARD_TITLE VARCHAR2(100),
		BOARD_CONTENT VARCHAR2(4000),
		BOARD_WRITER VARCHAR2(20),
		BOARD_REG_DATE DATE DEFAULT SYSDATE,
		
		CONSTRAINT FK_BOARD_WRITER FOREIGN KEY (BOARD_WRITER) REFERENCES MEMBERS(MEMBER_ID)
);


-- 원인 1. BOARD_WRITER 컬럼에
--        FOREIGN KEY 제약조건 설정방식이 잘못됨
--        CONSTRAINT를 통해 명시가 되지않음
--        REFERENCES를 사용하여 참조할 테이블과 컬럼지정 X   

-- 해결 1. 테이블 레벨에 맞는 설정방식을 올바르게 작성함 
--        CONSTRAINT FK_BOARD_WRITER FOREIGN KEY (BOARD_WRITER) REFERENCES MEMBERS(MEMBER_ID)


-- 원인 2. BOARD_REG_DATE 컬럼에 입력된 현재시간은 문자열로 이루어져있어서 잘못 작성됨

-- 해결 2. 시스템에 저장되있는 현재 날짜를 반환하는 함수를 사용 SYSDATE