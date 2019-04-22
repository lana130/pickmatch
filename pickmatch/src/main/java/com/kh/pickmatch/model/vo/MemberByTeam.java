﻿package com.kh.pickmatch.model.vo;

import java.io.Serializable;
import java.sql.Date;

public class MemberByTeam implements Serializable{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -2595431962416789635L;
	private String memberId;
	private String teamName;
	private String authority;
	private Date enrollDate;
	private Date exitDate;
	private int goalCount;
	private String position;
	private int no;
	private String status;
	private String memberName;
	
	
	
	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	public MemberByTeam() {}

	public MemberByTeam(String memberId, String teamName, String authority, Date enrollDate, Date exitDate,
			int goalCount) {
		super();
		this.memberId = memberId;
		this.teamName = teamName;
		this.authority = authority;
		this.enrollDate = enrollDate;
		this.exitDate = exitDate;
		this.goalCount = goalCount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getTeamName() {
		return teamName;
	}

	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public Date getExitDate() {
		return exitDate;
	}

	public void setExitDate(Date exitDate) {
		this.exitDate = exitDate;
	}

	public int getGoalCount() {
		return goalCount;
	}

	public void setGoalCount(int goalCount) {
		this.goalCount = goalCount;
	}

	@Override
	public String toString() {
		return "MemberByTeam [memberId=" + memberId + ", teamName=" + teamName + ", authority=" + authority
				+ ", enrollDate=" + enrollDate + ", exitDate=" + exitDate + ", goalCount=" + goalCount + "]";
	}
	
}
