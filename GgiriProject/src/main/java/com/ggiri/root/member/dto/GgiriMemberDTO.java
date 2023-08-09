package com.ggiri.root.member.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

/*
//create table ggirimember(
//memberNum number(20) primary key,
//name varchar2(30) not null,
//id varchar2(30) primary key,
//pwd varchar2(30) not null,
//gender varchar2(3),
//email varchar2(20) not null,
//domain varchar2(20) not null,
//tel varchar2(13),
//addr varchar2(100) not null,
//job varchar2(20),
//skill varchar2(500),
//logtime date default sysdate
//);
*/
public class GgiriMemberDTO {

	private int memberNum;
	private String name;
	private String id;
	private String pwd;
	private String birth;
	private String gender;
	private String email;
	private String tel;
	private String addr;
	private String logtime;
	
	
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	
	public String getLogtime() {
		return logtime;
	}
	public void setLogtime(Timestamp logtime) {
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd HH:mm:ss");
		this.logtime = format.format(logtime);
	}
	
	
	
}
