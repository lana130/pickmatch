﻿package com.kh.pickmatch.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.pickmatch.model.vo.FreeBoard;
import com.kh.pickmatch.model.vo.FreeBoardAttachment;
import com.kh.pickmatch.model.vo.Match;
import com.kh.pickmatch.model.vo.Member;
import com.kh.pickmatch.model.vo.MemberByTeam;
import com.kh.pickmatch.model.vo.MemberRequest;
import com.kh.pickmatch.model.vo.Mercenary;
import com.kh.pickmatch.model.vo.MoneyHistory;
import com.kh.pickmatch.model.vo.Team;
import com.kh.pickmatch.model.vo.TeamBoard;
import com.kh.pickmatch.model.vo.TeamBoardAttachment;
import com.kh.pickmatch.model.vo.TeamNotice;
import com.kh.pickmatch.model.vo.TeamOperationAccount;


@Repository
public class TeamDaoImpl implements TeamDao {

	private Logger logger = LoggerFactory.getLogger(TeamDaoImpl.class);
	
	@Autowired
	SqlSessionTemplate session;
	
	@Override
	public List<Map<String, String>> selectTMemberList(Map<String, String> map) {
		return session.selectList("team.selectTMemberList", map);
	}

	@Override
	public String selectTeamOne(String memberId) {
		return session.selectOne("team.selectTeamOne", memberId);
	}

	@Override
	public TeamOperationAccount selectAccountOne(String teamName) {
		return session.selectOne("team.selectAccountOne", teamName);
	}

	@Override
	public List<Map<String, Object>> selectMoneyHistoryList(String teamName) {
		return session.selectList("team.selectMoneyHistoryList", teamName);
	}

	@Override
	public int updateTeamAccount(TeamOperationAccount toAccount) {
		return session.update("team.updateTeamAccount", toAccount);
	}

	@Override
	public int insertTeamAccount(TeamOperationAccount toAccount) {
		return session.insert("team.insertTeamAccount", toAccount);
	}

	@Override
	public int insertMHistory(MoneyHistory mHistory) {
		return session.insert("team.insertMHistory", mHistory);
	}




	
	
	//도원
	
	


	@Override
	public List<TeamNotice> selectListN(int cPage, int numPerPage, String teamName) {
		// TODO Auto-generated method stub
		return session.selectList("team.selectListN", teamName, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}


	

	@Override
	public int teambreakup(String teamName) {
		// TODO Auto-generated method stub
		return session.update("team.teambreakup", teamName);
	}

	@Override
	public int teamleave(String memberId) {
		// TODO Auto-generated method stub
		return session.delete("team.teamleave", memberId);
	}

	@Override
	public String authority(String memberId) {
		// TODO Auto-generated method stub
		return session.selectOne("team.authority", memberId);
	}

	@Override
	public int leaderchange(String beforeleader) {
		// TODO Auto-generated method stub
		return session.update("team.leaderchange",beforeleader);
	}

	@Override
	public String leadercheck(String teamName) {
		// TODO Auto-generated method stub
		return session.selectOne("team.leadercheck", teamName);
	}

	@Override
	public int teamleader(String memberId) {
		// TODO Auto-generated method stub
		return session.update("team.teamleader", memberId);
	}

	@Override
	public int levelup(String memberId) {
		// TODO Auto-generated method stub
		return session.update("team.levelup", memberId);
	}

	@Override
	public int leveldown(String memberId) {
		// TODO Auto-generated method stub
		return session.update("team.leveldown", memberId);
	}

	@Override
	public int teambye(String memberId) {
		// TODO Auto-generated method stub
		return session.delete("team.teambye", memberId);
	}

	@Override
	public int deleteTeamBoard(int boardNo) {
		// TODO Auto-generated method stub
		return session.delete("team.deleteTeamBoard", boardNo);
	}

	@Override
	public int updateTeamBoard(String boardTitle, String boardContent, int boardNo) {
		// TODO Auto-generated method stub
		
		TeamBoard teamboard = new TeamBoard();
		teamboard.setBoardTitle(boardTitle);
		teamboard.setBoardContent(boardContent);
		teamboard.setBoardNo(boardNo);
		
		return session.update("team.updateTeamBoard", teamboard);
	}

	@Override
	public int insertFreeBoard(TeamBoard fb) {
		// TODO Auto-generated method stub
		logger.debug("에러에러"+fb);
		TeamBoard teamboard = new TeamBoard();

		return session.insert("team.insertFreeBoard",fb);
	}

	@Override
	public int insertFreeAttachment(TeamBoardAttachment a) {
		// TODO Auto-generated method stub
		return session.insert("team.insertFreeAttachment",a);
	}

	@Override
	public MemberRequest memberRequestCk(String memberId, String teamName) {
		// TODO Auto-generated method stub
		
		Member member = new Member();
		member.setMemberId(memberId);
		member.setTeamName(teamName);
		return session.selectOne("team.memberRequestCk", member);
	}

	@Override
	public int teamJoin(String memberId,String teamName, String position) {
		// TODO Auto-generated method stub
		
		Member member = new Member();
		member.setTeamName(teamName);
		member.setMemberId(memberId);
		member.setPosition(position);
		return session.insert("team.teamJoin", member);
	}

	@Override
	public int teamNo(String memberId, String teamName) {
		// TODO Auto-generated method stub
		MemberByTeam mbt = new MemberByTeam();
		mbt.setTeamName(teamName);
		mbt.setMemberId(memberId);
		return session.delete("team.teamNo",mbt);
	}

	@Override
	public int teamOk(String memberId, String teamName) {
		// TODO Auto-generated method stub
		
		MemberByTeam mbt = new MemberByTeam();
		mbt.setTeamName(teamName);
		mbt.setMemberId(memberId);
		return session.insert("team.teamOk",mbt);
	}

	@Override
	public List<MemberRequest> MemberRequest(String teamName) {
		// TODO Auto-generated method stub
		return session.selectList("team.MemberRequest", teamName);
	}

	@Override
	public List<MemberByTeam> TeamMember(String teamName) {
		// TODO Auto-generated method stub
		return session.selectList("team.TeamMember",teamName);
	}

	@Override
	public int memberCount(String teamName) {
		// TODO Auto-generated method stub
		return session.selectOne("team.memberCount", teamName);
	}

	@Override
	public int memberByTeam(MemberByTeam mbt) {
		// TODO Auto-generated method stub
		return session.insert("team.memberByTeam", mbt);
	}

	@Override
	public List<Team> TeamView(String teamName) {
		// TODO Auto-generated method stub
		return session.selectList("team.TeamView",teamName);
	}

	@Override
	public Team TeamSearch(String search) {
		// TODO Auto-generated method stub
		return session.selectOne("team.TeamSearch",search);
	}

	@Override
	public Mercenary MercenarySearch(String search) {
		// TODO Auto-generated method stub
		//logger.debug("서치::::::"+search);
		return session.selectOne("team.MercenarySearch",search);
	}

	@Override
	public List<Mercenary> mercenaryranking(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("team.selectmercenaryranking", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectCountM() {
		// TODO Auto-generated method stub
		return session.selectOne("team.selectCountM");
	}

	@Override
	public int selectCountT() {
		// TODO Auto-generated method stub
		return session.selectOne("team.selectCountT");
	}

	@Override
	public List<Team> selectTeamRanking(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return session.selectList("team.selectTeamRanking", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public Team selectTeamCheck(String teamname) {
		// TODO Auto-generated method stub
		return session.selectOne("team.selectTeamCheck", teamname);
	}

	@Override
	public int insertTeam(Team team) {
		// TODO Auto-generated method stub
		return session.insert("team.InsertTeam", team);
	}

	@Override
	public int updateNotice(String noticeTitle, String noticeContent, int noticeNo) {
		// TODO Auto-generated method stub
		
		TeamNotice notice = new TeamNotice();
		notice.setNoticeContent(noticeContent);
		notice.setNoticeTitle(noticeTitle);
		notice.setNoticeNo(noticeNo);
		return session.update("team.updateNotice", notice);
	}

	@Override
	public TeamNotice selectOne(int noticeNo) {
		// TODO Auto-generated method stub
		return session.selectOne("team.selectOne", noticeNo);
	}

	@Override
	public int deleteNotice(int noticeNo) {
		// TODO Auto-generated method stub
		return session.delete("team.deleteNotice", noticeNo);
	}

	@Override
	public int selectCountN(String teamName) {
		// TODO Auto-generated method stub
		return session.selectOne("team.selectCountN",teamName);
	}
	
	@Override
	public Object selectTeamBoard(int boardNo) {
		// TODO Auto-generated method stub
		return session.selectOne("team.selectteamBoard", boardNo);
	}

	@Override
	public Object selectAttachment(int boardNo) {
		// TODO Auto-generated method stub
		return session.selectList("team.selectAttachment", boardNo);
	}

	@Override
	public int selectCount() {
		// TODO Auto-generated method stub
		return session.selectOne("team.selectCount");
	}
	
	@Override
	public List<TeamBoard> selectList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub;
		return session.selectList("team.selectList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public Object selectNoticeView(int noticeNo) {
		// TODO Auto-generated method stub
		return session.selectOne("team.selectNoticeView", noticeNo);
	}

	//팀 공지사항 글쓰기
	@Override
	public int InsertNotice(TeamNotice teamnotice) {
		// TODO Auto-generated method stub
		
		//logger.debug("before teamnotice"+teamnotice);
		String teamname = session.selectOne("team.selectTeamOne",teamnotice.getMemberId());
		teamnotice.setTeamName(teamname);
		//logger.debug("after teamnotice"+teamnotice);
		return session.insert("team.insertNotice",teamnotice);
	}

	
	
	
	
	
	
	
	
	
}