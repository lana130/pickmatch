﻿package com.kh.pickmatch.model.vo;

import java.util.Date;

public class MemberRequest {
	
	
	private String memberId;
	private String teamName;
	private Date requestDate;
	private String requestType; 
	private String position;
	private int no;
	

	public MemberRequest() {
		// TODO Auto-generated constructor stub
	}

	public MemberRequest(String memberId, String teamName, Date requestDate, String requestType) {
		super();
		this.memberId = memberId;
		this.teamName = teamName;
		this.requestDate = requestDate;
		this.requestType = requestType;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public Date getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(Date requestDate) {
		this.requestDate = requestDate;
	}

	public String getRequestType() {
		return requestType;
	}

	public void setRequestType(String requestType) {
		this.requestType = requestType;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}

	
	@Override
	public String toString() {
		return "MemberRequest [memberId=" + memberId + ", teamName=" + teamName + ", requestDate=" + requestDate
				+ ", requestType=" + requestType + "]";
	}
	
	
	
	

}
