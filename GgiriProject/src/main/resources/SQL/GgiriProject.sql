// 끼리 멤버 테이블

create table ggirimember(
memberNum number(20) primary key,
name varchar2(100) not null,
id varchar2(100),
pwd varchar2(30),
birth varchar2(8),
gender varchar2(3),
email varchar2(30),
tel varchar2(13),
addr varchar2(100),
logtime date default sysdate
);




// 프리랜서 테이블

create Table ggiriFree_insert(
freeNum number(20),
name varchar2(30) ,
id varchar2(100) PRIMARY key,
introduce varchar2(30) not null,
job varchar2(20),
skill varchar2(500),
project_period number(30) not null,
place_of_work varchar2(100) not null,
URL_NAME VARCHAR2(50),
insertdate date default sysdate,
CONSTRAINT ggiri_test FOREIGN KEY(freeNum) REFERENCES ggirimember(memberNum) ON DELETE CASCADE
);




-- 프로젝트 테이블

create table ggiriProject(
memberNum NUMBER(20),
projectNum NUMBER(20) primary key,  -- 프로젝트 번호
title VARCHAR2(200),                -- 제목
project VARCHAR2(50),               -- 진행 상태
content VARCHAR2(2000),             -- 내용
prodate DATE DEFAULT SYSDATE,       -- 시간
proHit NUMBER(10) DEFAULT 0,        -- 조회수
id VARCHAR2(100) NOT NULL,          -- 아이디
skill VARCHAR2(50),                 -- 스킬
CONSTRAINT ggiri_project FOREIGN KEY(memberNum) REFERENCES ggirimember(memberNum) ON DELETE CASCADE
);




//완성된 프로젝트 테이블

create table ggiriComplete(
memberNum NUMBER(20),
completeNum NUMBER(20) primary key,
title VARCHAR2(300),
content VARCHAR2(3000),
skill VARCHAR2(500),
members VARCHAR2(100),
tag VARCHAR2(300),
comdate DATE,
comHit NUMBER(10) DEFAULT 0,
id VARCHAR2(100) NOT NULL,
CONSTRAINT ggiri_complete FOREIGN KEY(memberNum) REFERENCES ggiriMember(memberNum) ON DELETE CASCADE
);




// 댓글 테이블

CREATE TABLE ggiriReply (
memberNum NUMBER(20),
no NUMBER(10) primary key,          -- 댓글 번호
bno NUMBER(10) not null,         -- 게시물 번호
id VARCHAR2(100) not null,       -- 회원ID
content VARCHAR2(1000),          -- 내용
wdate DATE DEFAULT SYSDATE,      -- 작성일
CONSTRAINT fk_rep1 FOREIGN KEY(bno) REFERENCES ggiriProject(projectNum) ON DELETE CASCADE,
CONSTRAINT fk_rep2 FOREIGN KEY(memberNum) REFERENCES ggiriMember(memberNum) ON DELETE CASCADE
);




// 좋아요 테이블

CREATE TABLE heart(
project_no number(20), -- 좋아요를 누를 해당 게시판 넘버 
memberNum number(20) , -- 해당 좋아요 누르는 아이디
like_check NUMBER DEFAULT 1, -- 좋아요 = 1 / 취소 = null
CONSTRAINT heart_no foreign key(project_no) references ggiriproject(projectNum) on delete cascade,
CONSTRAINT heart_id FOREIGN KEY(memberNum) REFERENCES ggiriMember(memberNum) ON DELETE CASCADE
);

// 끼리 멤버 테이블 시퀀스 >> 
CREATE SEQUENCE ggiriMember_seq NOCACHE NOCYCLE;
// 프리랜서 테이블 시퀀스 >> 
CREATE SEQUENCE ggiriFree_seq NOCACHE NOCYCLE;
// 프로젝트 테이블 시퀀스 >> 
CREATE SEQUENCE ggiriProject_seq NOCACHE NOCYCLE;
// 완성된 프로젝트 테이블 시퀀스 >> 
CREATE SEQUENCE ggiriComplete_seq NOCACHE NOCYCLE;
// 댓글 테이블 시퀀스 >> 
CREATE SEQUENCE reply_seq NOCACHE NOCYCLE;

commit;











