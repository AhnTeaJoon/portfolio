package com.ggiri.root.project.dto;

/*-- 좋아요 테이블
CREATE TABLE heart(
project_no number not null, -- 좋아요를 누를 해당 게시판 넘버 
memberNum number(20) not null, -- 해당 좋아요 누르는 아이디
like_check NUMBER DEFAULT 1,
CONSTRAINT heart_no foreign key(project_no) references ggiriproject(projectNum) on delete cascade,
CONSTRAINT heart_id FOREIGN KEY(memberNum) REFERENCES ggiriMember(memberNum) ON DELETE CASCADE
);
*/

public class GgiriBoardLikeDTO {
	
	private int like_no;
	private int projectNum;
	private String id;
	private int like_check;
	private int memberNum;
	
	// 인덱스에 띄울 title
	private String title;
	
	
	
	
	
	
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getLike_no() {
		return like_no;
	}
	public void setLike_no(int like_no) {
		this.like_no = like_no;
	}
	public int getProjectNum() {
		return projectNum;
	}
	public void setProjectNum(int projectNum) {
		this.projectNum = projectNum;
	}
	
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getLike_check() {
		return like_check;
	}
	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}
	
	
	

	
	
	
	
	
}
