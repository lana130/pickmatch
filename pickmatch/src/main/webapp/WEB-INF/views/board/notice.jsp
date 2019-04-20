<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/_bootswatch.scss" />
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/_variables.scss" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>

	section{
		width : 80%;
		margin : 0 auto 50px auto;
	}
	#team-freeboard-table{
		color:black;
		width:800px;
		border-collapse: collapse;
		margin: auto;
	}
	#team-freeboard-table tr,td{
		text-align:center;
		width:800px;
		height:20px;
		
	}
	
	#team-freeboard-table tr,th{
		text-align:center;
		width:800px;
		height:20px;
	
	}
	#team-freeboard-table-id{
		
		width:150px;
	
	}
	#team-freeboard-table-title{
		
		width:450px;

	}
		#team-freeboard-table-date{
		
		width:200px;

	}

	#freeboard-write{
		margin-right: 15px;
	}
</style>

<section>
<br><br><br>
<div>
	<h1 style="text-align: center;">공지사항</h1>
</div>
<br><br>

<div id="team-freeboard">
	<table id="team-freeboard-table" class="table table-striped table-hover">
		<tr id="team-freeboard">
			<th id="team-freeboard-table-id">아이디</th>
			<th id="team-freeboard-table-title">제목</th>
			<th id="team-freeboard-table-date">날짜</th>
			
		</tr>
		<c:forEach items="${list }" var="b">
		<tr>
			<td id="team-freeboard-table-id">${b.memberId }</td>
			<td id="team-freeboard-table-title"><a href="${path}/board/noticeView.do?noticeNo=${b.noticeNo}">${b.noticeTitle }</a></td>
			<td id="team-freeboard-table-date"><fmt:formatDate type="date" value="${b.noticeDate }"/> <fmt:formatDate type="time" value="${b.noticeDate }"/></td>
		</tr>
		</c:forEach>	
	</table>
</div>	

<div class="pagecontainer" style="margin-top: 50px;">
     	${pageBar }
</div>

<div id="freeboard-write" align="right">
	<input type="button" value="글쓰기" id="btn-add" class="btn btn-primary" onclick="fn_write();"/>
</div>

<script>
	function fn_write(){
		location.href="${path}/board/noticeForm.do";
	}
</script>


</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>

