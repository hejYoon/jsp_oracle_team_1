   create table BOARD(
	BOARDNUM varchar2(10) NOT NULL primary KEY,
              TITLE varchar2(40) NOT NULL,
              CONTENT varchar2(40) NOT NULL,
              WRITER varchar2(10)
    );
    
    commit;