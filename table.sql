CREATE USER TARA IDENTIFIED BY TARA;
GRANT RESOURCE, CONNECT TO TARA;
COMMIT;

--MEMBER ���̺�
CREATE TABLE MEMBER (
    USER_NO NUMBER PRIMARY KEY,
    USER_ID VARCHAR2(20) NOT NULL UNIQUE,
    USER_PWD VARCHAR2(200) NOT NULL,
    USER_NAME VARCHAR2(15) NOT NULL,
    PHONE VARCHAR2(20),
    USER_EMAIL VARCHAR2(40),
    USER_ROLE NUMBER DEFAULT 1,
    ADDRESS VARCHAR2(40),
    USER_IMG VARCHAR(40), 
    TRAVEL VARCHAR2(40),    
    CREATE_DATE DATE DEFAULT SYSDATE,
    MODIFY_DATE DATE DEFAULT SYSDATE,
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN MEMBER.USER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN MEMBER.USER_ID IS 'ȸ�����̵�';
COMMENT ON COLUMN MEMBER.USER_PWD IS 'ȸ����й�ȣ';
COMMENT ON COLUMN MEMBER.USER_NAME IS 'ȸ���̸�';
COMMENT ON COLUMN MEMBER.PHONE IS '��ȭ��ȣ';
COMMENT ON COLUMN MEMBER.USER_EMAIL IS '�̸���';
COMMENT ON COLUMN MEMBER.USER_ROLE IS 'ȸ��Ÿ��(1 ����, 2 ����)';
COMMENT ON COLUMN MEMBER.ADDRESS IS '������';
COMMENT ON COLUMN MEMBER.USER_IMG IS '�����ʻ���';
COMMENT ON COLUMN MEMBER.TRAVEL IS '������������';
COMMENT ON COLUMN MEMBER.CREATE_DATE IS 'ȸ����������';
COMMENT ON COLUMN MEMBER.MODIFY_DATE IS 'ȸ����������';
COMMENT ON COLUMN MEMBER.STATUS IS 'ȸ�����°�(Y/N)';

CREATE SEQUENCE SEQ_UNO;

INSERT INTO MEMBER VALUES(
    SEQ_UNO.NEXTVAL,'admin', 'admin','������','010-0000-0000','admin@admin.com',2,'����� ������ ���ﵿ', NULL,NULL, SYSDATE, SYSDATE, DEFAULT
);


INSERT INTO MEMBER VALUES(
    SEQ_UNO.NEXTVAL,'user10', 'user10','����','010-0000-0000','a3n@3.com',1,'����� ������ ���ﵿ', NULL,NULL, SYSDATE, SYSDATE, DEFAULT);

COMMIT;

-- ��� ��ȸ
-- SELECT * FROM MEMBER WHERE USER_ID=? AND USER_PWD=?

-- ��� �߰�
-- INSERT INTO MEMBER VALUES(SEQ_UNO.NEXTVAL,?,?,?,?,?,1,?,?,?,SYSDATE,SYSDATE,'Y')

-- ��� ã��
-- SELECT * FROM MEMBER WHERE USER_ID=?

-- ��� ����
-- UPDATE MEMBER SET USER_NAME=?,MODIFY_DATE=SYSDATE WHERE USER_ID=?

-- ��� �н����� ����
-- UPDATE MEMBER SET USER_PWD=? WHERE USER_ID=?

-- ��� ����
-- UPDATE MEMBER SET STATUS='N' WHERE USER_ID=?


--BOARD ���̺�
CREATE TABLE BOARD (	
    BOARD_NO NUMBER PRIMARY KEY,
    BOARD_WRITER_NO NUMBER, 
    LOC_NAME VARCHAR2(10) NOT NULL,
    BOARD_NAME VARCHAR2(10) NOT NULL,
    BOARD_TITLE VARCHAR2(100) NOT NULL,
    BOARD_CONTENT VARCHAR2(2000),
    BOARD_READCOUNT NUMBER DEFAULT 0, 
    BOARD_ORIGINAL_FILENAME VARCHAR2(100), 
	BOARD_RENAMED_FILENAME VARCHAR2(100),
    TRANSPORT VARCHAR2(20),
    TRAVEL_MONEY VARCHAR2(20),
    BOARD_SCORE NUMBER,
    BOARD_CREATE_DATE DATE DEFAULT SYSDATE, 
    BOARD_MODIFY_DATE DATE DEFAULT SYSDATE, 
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN('Y', 'N')),
    CONSTRAINT FK_BOARD_WRITER FOREIGN KEY(BOARD_WRITER_NO) REFERENCES MEMBER(USER_NO) ON DELETE SET NULL
);

COMMENT ON COLUMN BOARD.BOARD_NO IS '�Խñ۹�ȣ';
COMMENT ON COLUMN BOARD.BOARD_WRITER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN BOARD.LOC_NAME IS '�����̸�';
COMMENT ON COLUMN BOARD.BOARD_NAME IS '�Խ����̸�';
COMMENT ON COLUMN BOARD.BOARD_TITLE IS '�Խñ�����';
COMMENT ON COLUMN BOARD.BOARD_CONTENT IS '�Խñ۳���';
COMMENT ON COLUMN BOARD.BOARD_READCOUNT IS '��ȸ��';
COMMENT ON COLUMN BOARD.BOARD_ORIGINAL_FILENAME IS '�����̸�';
COMMENT ON COLUMN BOARD.BOARD_RENAMED_FILENAME IS '����������̸�';
COMMENT ON COLUMN BOARD.TRANSPORT IS '�������';
COMMENT ON COLUMN BOARD.TRAVEL_MONEY IS '���';
COMMENT ON COLUMN BOARD.BOARD_SCORE IS '����';
COMMENT ON COLUMN BOARD.BOARD_CREATE_DATE IS '�������';
COMMENT ON COLUMN BOARD.BOARD_MODIFY_DATE IS '��������';
COMMENT ON COLUMN BOARD.STATUS IS '�Խñۻ��� (Y/N)';

CREATE SEQUENCE SEQ_BOARD_NO;


INSERT INTO BOARD VALUES
(SEQ_BOARD_NO.NEXTVAL, 2, '������', '����','������ ���� �Խñ�','�Խñ� �����Դϴ�', DEFAULT, '�������ϸ�.txt', '��������ϸ�.txt','����','0',0,SYSDATE,SYSDATE, 'Y');

BEGIN
    FOR N IN 1..52
    LOOP
        INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL, 2, '������', '����','������ �Խñ� ' || SEQ_BOARD_NO.CURRVAL,'�Խñ� �����Դϴ�'||  SEQ_BOARD_NO.CURRVAL, DEFAULT,null, null,null,null,null,SYSDATE,SYSDATE, 'Y');
    END LOOP;
    
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN ROLLBACK;
END;
/

COMMIT;

-- �Խñ� ��ȸ
SELECT B.BOARD_NO, B.BOARD_TITLE, M.USER_ID, B.BOARD_CREATE_DATE, B.BOARD_READCOUNT,
        (SELECT COUNT(*) FROM LIKECOUNT WHERE BOARD_NO = 1) LCOUNT , (SELECT COUNT(*) FROM COMMENTS WHERE COMMENT_BOARD_NO = 1) CCOUNT
FROM BOARD B, MEMBER M
WHERE B.BOARD_WRITER_NO = M.USER_NO AND B.STATUS ='Y' AND B.BOARD_NO = 1
ORDER BY BOARD_NO DESC;

-- �������� ����Ʈ ��ȸ�ϱ�
SELECT B.BOARD_NO, B.BOARD_TITLE, M.USER_ID, B.BOARD_CREATE_DATE, B.BOARD_READCOUNT
FROM BOARD B
JOIN MEMBER M ON(B.BOARD_WRITER_NO = M.USER_NO)
WHERE B.STATUS = 'Y'
ORDER BY BOARD_NO DESC;

-- �� �Խñ� ����
-- SELECT COUNT(*) FROM BOARD;

-- ��ȸ�� ����
-- UPDATE BOARD SET BOARD_READCOUNT=BOARD_READCOUNT+1 WHERE BOARD_NO=?

-- �Խñ� �ۼ�
-- INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,?,?,?,?,?,DEFAULT,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT);

-- �Խñ� ����
-- UPDATE BOARD SET BOARD_TITLE=?,BOARD_CONTENT=? WHERE BOARD_NO=?

-- �Խñ� ����
-- UPDATE BOARD SET STATUS=? WHERE BOARD_NO=?

--������̺�
CREATE TABLE COMMENTS (
    COMMENT_NO NUMBER PRIMARY KEY,
    COMMENT_BOARD_NO NUMBER,
    COMMENT_WRITER_NO NUMBER,
    COMMENT_CONTENT VARCHAR2(200),
    COMMENT_CREATE_DATE DATE DEFAULT SYSDATE,
    COMMENT_MODIFY_DATE DATE DEFAULT SYSDATE, 
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (STATUS IN ('Y', 'N')),
    CONSTRAINT FK_COMMENT_WRITER FOREIGN KEY(COMMENT_WRITER_NO) REFERENCES MEMBER(USER_NO) ON DELETE SET NULL,
    CONSTRAINT FK_COMMENT_BOARD FOREIGN KEY(COMMENT_BOARD_NO) REFERENCES BOARD(BOARD_NO) ON DELETE CASCADE
);
COMMENT ON COLUMN COMMENTS.COMMENT_NO IS '��۹�ȣ';
COMMENT ON COLUMN COMMENTS.COMMENT_BOARD_NO IS '�Խñ۹�ȣ';
COMMENT ON COLUMN COMMENTS.COMMENT_WRITER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN COMMENTS.COMMENT_CONTENT IS '��۳���';
COMMENT ON COLUMN COMMENTS.COMMENT_CREATE_DATE IS '�������';
COMMENT ON COLUMN COMMENTS.COMMENT_MODIFY_DATE IS '��������';
COMMENT ON COLUMN COMMENTS.STATUS IS '��ۻ���(Y/N)';


CREATE SEQUENCE SEQ_COMMENT_NO;

INSERT INTO COMMENTS VALUES(SEQ_COMMENT_NO.NEXTVAL, 1, 2, 'ASDASD', SYSDATE, SYSDATE, DEFAULT);

-- insert query
-- INSERT INTO COMMENTS VALUES(SEQ_COMMENT_NO.NEXTVAL, ?, ?, ?, SYSDATE, SYSDATE,DEFAULT);


-- �� �Խ��ǿ� �ش��ϴ� ��� ����Ʈ ��ȸ�� ������
SELECT COMMENT_NO, COMMENT_BOARD_NO, COMMENT_CONTENT, USER_ID, C.COMMENT_CREATE_DATE, C.COMMENT_MODIFY_DATE, C.STATUS
FROM COMMENTS C
JOIN MEMBER M ON(C.COMMENT_WRITER_NO = M.USER_NO)
WHERE C.STATUS='Y' AND COMMENT_BOARD_NO = 2
ORDER BY COMMENT_CREATE_DATE DESC;


--���ƿ�
CREATE TABLE LIKECOUNT(
    BOARD_NO NUMBER,
    USER_NO NUMBER, 
    STATUS VARCHAR2(1) DEFAULT 'Y',
    CONSTRAINT FK_BOARD_NO FOREIGN KEY(BOARD_NO) REFERENCES BOARD(BOARD_NO) ON DELETE CASCADE,
    CONSTRAINT FK_USER_NO FOREIGN KEY(USER_NO) REFERENCES MEMBER(USER_NO) ON DELETE CASCADE
);

COMMENT ON COLUMN LIKECOUNT.BOARD_NO IS '�Խñ۹�ȣ';
COMMENT ON COLUMN LIKECOUNT.USER_NO IS 'ȸ����ȣ';
COMMENT ON COLUMN LIKECOUNT.STATUS IS '���ƿ����(Y,N)';

-- ���ƿ� ùŬ����
-- INSERT INTO LIKECOUNT VALUES(?,?,'Y');

-- �Խñ� ���ƿ� �����˻�
-- SELECT COUNT(*) FROM LIKECOUNT WHERE BOARD_NO=?;

-- ���ƿ�� ���¿��� ��ҽ�(���)
-- UPDATE LIKECOUNT SET STATUS='N' WHERE USER_NO=? AND BOARD_NO=?;

-- ��ҵ� ���¿��� ���ƿ��(���ƿ�)
-- UPDATE LIKECOUNT SET STATUS='Y' WHERE USER_NO=? AND BOARD_NO=?;


--�湮�ڼ�
CREATE TABLE VISIT(
    V_DATE DATE DEFAULT SYSDATE
);

SELECT * FROM MEMBER WHERE USER_NO BETWEEN 1 AND 10;

SELECT * FROM(SELECT ROWNUM AS RNUM, USER_NO, USER_ID, USER_NAME, USER_EMAIL,CREATE_DATE, STATUS 
    FROM(SELECT USER_NO, USER_ID, USER_NAME,USER_EMAIL, CREATE_DATE, STATUS FROM MEMBER ORDER BY USER_NO DESC)
    )WHERE RNUM BETWEEN 1 AND 10;