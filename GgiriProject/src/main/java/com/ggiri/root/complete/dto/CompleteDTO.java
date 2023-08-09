
package com.ggiri.root.complete.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/*
create table ggiriComplete(
completeNum NUMBER(10) PRIMARY KEY,
title VARCHAR2(300),
content VARCHAR2(3000),
skill VARCHAR2(500),
members VARCHAR2(100),
tag VARCHAR2(300),
comdate DATE,
comHit NUMBER(10) DEFAULT 0,
id VARCHAR2(20) NOT NULL
);
*/


public class CompleteDTO {
	
	private int memberNum;
	private int completeNum;
	private int projectNum;
	private String title;
	private String content;
	private String skill;
	private String members;
	private String tag;
	private String comdate;
	private int comHit;
	private String id;
		
	
	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getCompleteNum() {
		return completeNum;
	}

	public void setCompleteNum(int completeNum) {
		this.completeNum = completeNum;
	}
	
	public int getProjectNum() {
		return projectNum;
	}

	public void setProjectNum(int projectNum) {
		this.projectNum = projectNum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSkill() {
		return skill;
	}

	public void setSkill(String skill) {
		this.skill = skill;
	}

	public String getMembers() {
		return members;
	}

	public void setMembers(String members) {
		this.members = members;
	}

	public String getTag() {
		return tag;
	}

	public void setTag(String tag) {
		this.tag = tag;
	}

	public String getComdate() {
		return comdate;
	}

	public void setComdate(Timestamp comdate) {
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");
		this.comdate = format.format(comdate);
	}

	public int getComHit() {
		return comHit;
	}

	public void setComHit(int comHit) {
		this.comHit = comHit;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	
	
	
	
	
	
}
