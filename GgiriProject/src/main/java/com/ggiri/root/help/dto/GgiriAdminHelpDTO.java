package com.ggiri.root.help.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class GgiriAdminHelpDTO {

	private int adminRepNo;
	private int helpNo;
	private String adminid;
	private String helpMember;
	private String adminRep;
	private String adminRepDate;
	
	
	public int getAdminRepNo() {
		return adminRepNo;
	}
	public void setAdminRepNo(int adminRepNo) {
		this.adminRepNo = adminRepNo;
	}
	public int getHelpNo() {
		return helpNo;
	}
	public void setHelpNo(int helpNo) {
		this.helpNo = helpNo;
	}
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	public String getHelpMember() {
		return helpMember;
	}
	public void setHelpMember(String helpMember) {
		this.helpMember = helpMember;
	}
	public String getAdminRep() {
		return adminRep;
	}
	public void setAdminRep(String adminRep) {
		this.adminRep = adminRep;
	}
	public String getAdminRepDate() {
		return adminRepDate;
	}
	public void setAdminRepDate(Timestamp adminRepDate) {
		SimpleDateFormat format = new SimpleDateFormat("YYYY-MM-dd");
		this.adminRepDate = format.format(adminRepDate);
	}

}
