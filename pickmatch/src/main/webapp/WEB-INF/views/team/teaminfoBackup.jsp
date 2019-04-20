<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/_bootswatch.scss" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/_variables.scss" />
  
     <jsp:include page="/WEB-INF/views/common/header.jsp"/>
<section>

<div id="myteam"  style="margin-top: 50px; margin-bottom: 300px;">
<div id="team" style="margin-right: 20px;">
	<table id="team-info"  >
	<tr id="team-info-img">
	<c:if test="${empty list[0].teamEmblem }">
		<td colspan="2"><img src="${path }/resources/upload/team-logo/기본팀로고.png" style="width:400px;height:300px;"> </td>
	</c:if>
	<c:if test="${!empty list[0].teamEmblem }">
		<td colspan="2"><img src="${path }/resources/upload/team-logo/${list[0].teamEmblem}"  style="width:400px;height:300px;"> </td>
	</c:if>
	</tr>
	<tr id="team-name">
		<td colspan="2" style="font-size: 30px; background-color: rgba(0,0,0,0.05);">${list[0].teamName }</td>
	</tr>
		<tr>
			<td id="team-location">지역 :${list[0].teamLocation }</td>
			<td id="team-exercise">경기장 : ${list[0].teamField }</td>
		</tr>
		<tr style="background-color: rgba(0,0,0,0.05);">
			<td id="team-uh">팀유형 : ${list[0].teamType }</td>
			<td id="team-uniform">유니폼: ${list[0].teamColor }</td>
		</tr>
		<tr>
			<td id="team-membercount">팀원수 : ${memberCount }</td>
			<td id="team-open">팀 개설일 : ${list[0].openingDate }</td>
		</tr>
		<tr style="background-color: rgba(0,0,0,0.05);">
			<td id="team-introduce" colspan="2">팀소개 : ${list[0].teamContent }</td>
		</tr>
	
	</table>
	
	<c:if test="${loggedMember.teamName==null }">
		<button id="teamJoin" class="btn btn-primary" onclick="teamjoin_btn()" style="width:300px; height:50px; margin-left: 50px; margin-top: 30px;">팀 가입 신청</button>
		<button id="teamCancel" class="btn btn-primary" onclick="teamCancel_btn()" style="width:300px; height:50px; margin-left: 50px; margin-top: 30px;">팀 신청 취소</button>
	</c:if>
	<c:if test="${loggedMember.teamName==teamName&&(loggedMember.authority=='매니저'||loggedMember.authority=='팀원') }">
		<button id="teamleave" value="${loggedMember.memberId }" onclick="teamleave()" class="btn btn-primary" onclick="teamleave_btn()" style="width:300px; height:50px; margin-left: 50px; margin-top: 30px;">팀 탈되</button>
	</c:if>
	<c:if test="${loggedMember.teamName==teamName&&loggedMember.authority=='팀장' }">
		<button id="teambreakup" value="${loggedMember.teamName }" onclick="teambreakup()" class="btn btn-primary" onclick="teambreakup()"  style="width:300px; height:50px; margin-left: 50px; margin-top: 30px;">팀 해체</button>
	</c:if>
	
</div>	


<div id="member">

<h2 align="center" style="margin-top: 20px;">팀 멤버 정보</h2>
<div id="ex">
<div id="team-member" style="overflow-y:scroll; width:600px; height:400px;">
	<table id="member-info" class="table table-striped table-hover">
		<tr id="member-info-int">
			<th id="member-info-int-no">no</th>
			<th id="member-info-int-name">id</th>
			<th id="member-info-int-position">position</th>
			<th id="member-info-int-goalcount">goalcount</th>
			<th id="member-info-int-management">management</th>
			<th id="member-info-int-value">value</th>
		</tr>
		<c:forEach  items="${result }" var="i">
		<tr>
			<td>${i.no }</td>
			<c:if test="${i.status=='K' }">
			<td>${i.memberName }</td>
			</c:if>
			<c:if test="${i.status=='Y'}">
			<td>${i.memberId }</td>
			</c:if>
			<td>${i.position }</td>
			<td>${i.goalCount }</td>
			<td>${i.authority }</td>
			<td id="member-info-int-management">
			
			<c:if test="${loggedMember.teamName==teamName&&loggedMember.authority=='팀장' }">
			<c:if test="${loggedMember.teamName==teamName&&i.authority=='팀원'}">
				<button id="level-up" value="${i.memberId }" onclick="level_up()" class="btn btn-outline-success" style="display: inline-block; width:110px; height: 35px;">매니저부여</button>
			</c:if>
			<c:if test="${loggedMember.teamName==teamName&&i.authority=='매니저' }">
				<button id="team-leader" value="${i.memberId }" onclick="team_leader()" class="btn btn-outline-success" style="display: inline-block; width:110px; height: 35px;">팀장위임</button>
				<button id="level-down" value="${i.memberId }" onclick="level_down()" class="btn btn-outline-success" style="display: inline-block; width:110px; height: 35px;">팀원으로</button>
			</c:if>
			</c:if>
			<c:if test="${loggedMember.teamName==teamName&&loggedMember.authority=='팀장'}">
			<c:if test="${loggedMember.teamName==teamName&&i.authority=='팀원'||i.authority=='매니저'}">
				<button id="team-bye" value="${i.memberId }" onclick="team_bye()" class="btn btn-outline-success" style="display: inline-block; width:110px; height: 35px;">추방</button>
			</c:if>
			</c:if>
			<c:if test="${loggedMember.teamName==teamName&&loggedMember.authority=='매니저' }">
			<c:if test="${loggedMember.teamName==teamName&&i.authority=='팀원' }">
				<button id="team-bye" value="${i.memberId }" onclick="team_bye()" class="btn btn-outline-success" style="display: inline-block; width:110px; height: 35px;">추방</button>
			</c:if>
			</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	</div>
	
	

<div id="match-container" align="center">
	<c:if test="${loggedMember.authority=='팀장'||loggedMember.authority=='매니저' }">
	<button class="btn btn-primary" onclick="matchenroll_btn()">매치등록</button>
	</c:if>
	<button class="btn btn-primary" onclick="match_check()" style="margin-left: 60px;">매치검색</button>
</div>
<script>
	function matchenroll_btn(){
		location.href="${path}/match/enrollForm";
	}
	function match_check(){
		location.href="${path}/match/matchList.do";
	}
	
	//팀원 추방
	function team_bye(){
		var a=event.target.value;
		var b="${loggedMember.teamName}";
		console.log(b);
		location.href="${path}/team/team_bye.do?memberId="+a+"&&teamName=${loggedMember.teamName}";	 
		
	}
	
	//매니저를 팀원으로
	function level_down(){
		
		var a=event.target.value;
		var b="${loggedMember.teamName}"
		console.log(b);
		location.href="${path}/team/team_leveldown.do?memberId="+a+"&&teamName=${loggedMember.teamName}"; 
	}
	
	//팀원을 매니저로
	function level_up(){
		var a=event.target.value;
		var b="${loggedMember.teamName}"
		console.log(b);
		location.href="${path}/team/team_levelup.do?memberId="+a+"&&teamName=${loggedMember.teamName}"; 
	}
	
	//팀장위임
	function team_leader(){
		var a=event.target.value;
		var b="${loggedMember.teamName}"
		console.log(b);
		location.href="${path}/team/team_leader.do?memberId="+a+"&&teamName=${loggedMember.teamName}"; 
	}
	
	function teamleave(){
		var a = event.target.value;
		location.href="${path}/team/teamleave.do?memberId="+a;
		console.log(a);
	}
	
	//팀해체
	function teambreakup(){
		var a = event.target.value;
		location.href="${path}/team/teambreakup?teamName="+a;
		console.log(a);
	}

</script>
	
</div>
<br><br><br>

<c:if test="${loggedMember.teamName==teamName }">
<h2 align="center">팀 가입 신청현황</h2>

<div id="team-application" style="overflow-y:scroll; width:600px; height:400px;">

	<table id="team-application-table" class="table table-striped table-hover">
		<tr>
			<th id="team-application-table-no">no</th>
			<th id="team-application-table-name">id</th>
			<th id="team-application-table-position">position</th>
			<th id="team-application-table-date">date</th>
			<c:if test="${loggedMember.teamName==teamName&&(loggedMember.authority=='팀장'||loggedMember.authority=='매니저')}">
			<th id="team-application-table-others">비고</th>
			</c:if>
		</tr>
		<c:forEach  items="${memberrequest }" var="j" varStatus="k">
		<tr>
			<td>${k.count }</td>
			<td>${j.memberId }</td>
			<td>${j.position }</td>
			<td><fmt:formatDate type="date" dateStyle="short" value="${j.requestDate }"/></td>
			
			<c:if test="${loggedMember.teamName==teamName&&(loggedMember.authority=='팀장'||loggedMember.authority=='매니저')}">
			<td> 
				<button class="btn btn-outline-success ok_btn" value="${j.memberId }">가입</button>
				<button class="btn btn-outline-success no_btn" value="${j.memberId }">거절</button>
			</td>
			</c:if>
		</tr>
		</c:forEach>
	</table>

</div>
</c:if>
</div>
<script>
		
	
		$(".ok_btn").click(function(){
			/* console.log($(this).val());  */
			location.href="${path}/teamOk.do?teamName=${loggedMember.teamName}&&memberId="+$(this).val(); 
			
		}) 
		
		$(".no_btn").click(function(){
			/* console.log($(this).val());  */
			location.href="${path}/teamNo.do?teamName=${loggedMember.teamName}&&memberId="+$(this).val(); 
			
		}) 
		
		
		$("#teamCancel").hide();	
		$("#teamJoin").hide();
		
		$(function(){
			$.ajax({
				url:"${path}/memberrequestck.do",
				data: {memberId:"${loggedMember.memberId}",teamName:"${teamName}"},
				success:function(data)
				{
					console.log(data);
					if(data.flag){
						$("#teamJoin").hide();
						$("#teamCancel").show();
					}
					else{
						$("#teamJoin").show();
						$("#teamCancel").hide();
					}
				}
			})
		})
		
		
		
		function teamjoin_btn(){
			var member={memberId:"${loggedMember.memberId}",teamName:"${teamName}",position:"${loggedMember.position}"}
			
			$.ajax({
				url:"${path}/teamJoin.do",
				type:"post",
				data:member,
				success:function(data){
					console.log(data);
					if(data.flag)
					{
						$("#teamJoin").hide();
						$("#teamCancel").show();
						alert("가입신청이 완료되었습니다");
					}
				}
			})
		}
		
		function teamCancel_btn(){
			
			var member={memberId:"${loggedMember.memberId}",teamName:"${teamName}"}
			$.ajax({
				url:"${path}/teamCancel.do",
				type:"post",
				data:member,
				success:function(data){
					if(data.flag)
					{
						$("#teamJoin").show();
						$("#teamCancel").hide();
						alert("팀가입신청을 취소하였습니다!")
					}
				}
			})
		}
		
	

</script>



</div>
</section>


<style>
	.ok_btn{
		width:70px;
		height:30px;
	}
	
	.no_btn{
		width:70px;
		height:30px;
	}

 
	
		
	#team{
		color:black;
		width:400px;
		height:775px;
		/* border:1px solid black; */
		display:inline-block;
	
	}
	#team-info{
	
		color:black;
		width:400px;
		height:700px;
		border-collapse: collapse;
	
	}
	

	#team-info-img{
		
		color:black;
		width:200px; 
		height:300px;
		display:block;
		margin-bottom: 20px;
	
	}
	#team-name{
	
	text-align:center;
		width:200px;
		height:80px;
		/* border:1px solid black; */
	}
	
 	#team-location{
		text-align:center;
		width:200px;
		height:60px;
		/* border:1px solid black; */
	
	}
	#team-exercise{
		text-align:center;
		width:200px;
		height:60px;
		/* border:1px solid black; */
	
	} 
		#team-uh{
		text-align:center;
		width:200px;
		height:60px;
		/* border:1px solid black; */
	
	} 
		#team-age{
		text-align:center;
		width:200px;
		height:60px;
		/* border:1px solid black; */
	
	} 
		#team-style{
		text-align:center;
		width:200px;
		height:60px;
		/* border:1px solid black; */
	
	} 
		#team-uniform{
		text-align:center;
		width:200px;
		height:60px;
		/* border:1px solid black; */
	
	}
		#team-membercount{
		text-align:center;
		width:200px;
		height:60px;
		/* border:1px solid black; */
	
	} 
		#team-open{
		text-align:center;
		width:200px;
		height:60px;
		/* border:1px solid black; */
	
	}  
		#team-introduce{
		text-align:center;
		width:200px;
		height:150px;
		/* border:1px solid black; */
	
	} 
	
	#member{
		color:black;
		width:600px;
		height:775px;
		/* border:1px solid black; */
		display:inline-block;
		position: absolute;
	
	}
	#member-info-int-name{
		width:300px;
	}
	
	#member-info-int{
		text-align:center;
		height:30px;
		color:black;
		width:600px;
		border-collapse: collapse;
		
	}

	#member-info-int tr,th{
		text-align:center;
		width:200px;
		height:60px;
	
	}
	
	#member-info-int tr,td{
		text-align:center;
		width:200px;
		height:30px;
		
	}
	
	#membercollect{
	
		color:black;
		width:600px;
		border:1px solid black;
		display:block;
	
	}
	#team-application-table tr,th{
		text-align:center;
		width:200px;
		height:60px;
	
	}
	#team-application-table tr,td{
		text-align:center;
		width:200px;
		height:35px;
	}
	#member-join{
		width: 70px;
		height:30px;
		

	}
	#member-cancle{
		width: 70px;
		height:30px;
	}
	#team-application-table-btn{
		width:400px;
	}
	
	#member-info-int-management{
		 width:150px; 
	}


	
</style>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>