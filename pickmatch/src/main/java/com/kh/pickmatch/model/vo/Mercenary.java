﻿package com.kh.pickmatch.model.vo;

public class Mercenary {
	
	
	private String memberId;
	private String teamName;
	private String status;
	private int playCount;
	private int goalCount;
	private int rank;
	private String introduce;
	private String profile;
	
	
	public Mercenary() {
		// TODO Auto-generated constructor stub
	}

	public Mercenary(String memberId, String teamName, String status, int playCount, int goalCount) {
		super();
		this.memberId = memberId;
		this.teamName = teamName;
		this.status = status;
		this.playCount = playCount;
		this.goalCount = goalCount;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public int getRank() {
		return rank;
	}

	public void setRank(int rank) {
		this.rank = rank;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getPlayCount() {
		return playCount;
	}

	public void setPlayCount(int playCount) {
		this.playCount = playCount;
	}

	public int getGoalCount() {
		return goalCount;
	}

	public void setGoalCount(int goalCount) {
		this.goalCount = goalCount;
	}

	
	public String getProfile() {
		return profile;
	}

	public void setProfile(String profile) {
		this.profile = profile;
	}

	@Override
	public String toString() {
		return "Mercenary [memberId=" + memberId + ", teamName=" + teamName + ", status=" + status + ", playCount="
				+ playCount + ", goalCount=" + goalCount + "]";
	}
	
	
	

}
