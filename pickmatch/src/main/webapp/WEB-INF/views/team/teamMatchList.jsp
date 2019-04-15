<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
    <jsp:param value="" name="pageTitle"/>
</jsp:include>
<section id="teamMatchList">

	<c:forEach var="list" items="${list}">
		<div style="width: 830px; height: 280px; margin: 50px 100px; display: inline-block;">
			
			<div style="float: left; display: inline-block;">
				<div style="width: 120px; height: 120px; background-color: gray; border-radius: 80px; margin: 10px 55px"></div>
				<div style="width: 230px; font-size: 22px; text-align: center; line-height: 40px; background-color: blue; border-radius: 5px;">${list['teamHome']}</div>
				<div style="width: 80px; line-height: 40px; text-align: center; background-color: white; border-radius: 5px; margin: 10px 75px">
					<c:if test="${list['result'] eq 'Y'}">
						<c:choose>
							<c:when test="${list['homeScore'] > list['awayScore']}">승</c:when>
							<c:when test="${list['homeScore'] eq list['awayScore']}">무</c:when>
							<c:when test="${list['homeScore'] < list['awayScore']}">패</c:when>
						</c:choose>
					</c:if>
					<c:if test="${list['result'] eq 'N'}">
						&nbsp;
					</c:if>
				</div>
			</div>
			
			<div style="float: left; display: inline-block; text-align: center;">
				<div style="font-size: 3em; width: 80px; vertical-align: middel; line-height: 120px; float: left; background-color: white; border-radius: 80px; margin: 10px 40px">${list['homeScore']}</div>
				<div style="width: 40px; vertical-align: middle; line-height: 60px; background-color: white; border-radius: 5px; float: left; margin-top: 40px;">vs</div>
				<div style="vertical-align: middle; font-size: 3em; width: 80px; line-height: 120px; float: left; background-color: white; border-radius: 80px; margin: 10px 40px">${list['awayScore']}</div>
			
			</div>
			
			<div style="float: right; display: inline-block;">
				<div style="width: 120px; height: 120px; background-color: gray; border-radius: 80px; margin: 10px 55px"></div>
				<div style="width: 230px; font-size: 22px; text-align: center; line-height: 40px; background-color: blue; border-radius: 5px;">${list['teamAway']}</div>
				<div style="width: 80px; line-height: 40px; text-align: center; background-color: white; border-radius: 5px; margin: 10px 75px">
				<c:if test="${list['result'] eq 'Y'}">
					<c:choose>
						<c:when test="${list['awayScore'] > list['homeScore']}">승</c:when>
						<c:when test="${list['awayScore'] eq list['homeScore']}">무</c:when>
						<c:when test="${list['awayScore'] < list['homeScore']}">패</c:when>
					</c:choose>
				</c:if>
				<c:if test="${list['result'] eq 'N'}">
					&nbsp;
				</c:if>
				</div>
			</div>
			<div style="float: left; display: inline-block; width: 360px; text-align: center; margin-top: 50px;">
				<c:choose>
					<c:when test="${list['result'] eq 'N'}">
						<button class="btn btn-primary" type="button" onclick="location.href='${path}/team/teamMatchEnroll'">결과입력</button>
					</c:when>
					<c:when test="${list['result'] eq 'Y'}">
						<button class="btn btn-primary" type="button" onclick="location.href='${path}/team/teamMatchEnroll'">상세보기</button>
					</c:when>
				</c:choose>
				
			</div>
		</div>
	</c:forEach>
	${pageBar}
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>