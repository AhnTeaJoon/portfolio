
package com.ggiri.root.project.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/*
<<<<<<< HEAD
-- 댓글 테이블
CREATE TABLE ggiriReply (
memberNum NUMBER(20),
no NUMBER(10) primary key,          -- 댓글 번호
bno NUMBER(10) not null,         -- 게시물 번호
=======
CREATE TABLE reply (
no NUMBER(10) not null,          -- 댓글 번호
bno NUMBER(10) primary key,      -- 게시물 번호
>>>>>>> branch 'main' of https://github.com/Jh1227/junho.git
id VARCHAR2(100) not null,       -- 회원ID
content VARCHAR2(1000),          -- 내용
wdate DATE DEFAULT SYSDATE,      -- 작성일
CONSTRAINT fk_test1 FOREIGN KEY(bno) REFERENCES ggiriProject(projectNum) ON DELETE CASCADE,
CONSTRAINT fk_test2 FOREIGN KEY(id) REFERENCES ggiriMember(id) ON DELETE CASCADE
);
*/

public class ProjectRepDTO {
	
	private int memberNum;  // 회원 번호
	private int no; 		// 댓글 번호
	private int bno; 		// 게시물 번호
	private String id; 		// 회원ID
	private String content; // 내용
	private String wdate; 	// 작성일
	
	
	
	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getNo() {
		return no;
	}
	
	public void setNo(int no) {
		this.no = no;
	}
	
	public int getBno() {
		return bno;
	}
	
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}
	
	public String getWdate() {
		return wdate;
	}
	
	public void setWdate(Timestamp wdate) {
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		this.wdate = format.format(wdate);
	}
	
	
	
	
	
	
	
	
}
