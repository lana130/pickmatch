<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
  
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<section id="team-notice-update">

 <form name="noticeupdate" action="${pageContext.request.contextPath}/team/whiteNotice" method="post" onsubmit="return validate();">


<div id="updateNotice-container">
  <div class="form-group form-group-sm">
    <label for="memberId" style=" margin-top: 50px;">작성자</label>
    <input type="text" class="form-control" id="memberId" value="${teamNotice.memberId }"  style="width:300px; margin-left: 3px;" readonly >
  </div>
    <div class="form-group form-group-sm">
    <label for="noticetitle">제목</label>
    <input type="text" class="form-control" id="noticetitle" name="noticeTitle" value="${teamNotice.noticeTitle }"  style="width:600px;" >
  </div>
	<input type="hidden" value="${teamNotice.noticeNo }" name="noticeNo">

  <div class="form-group">
  	<label style="display:inline-block;">내용</label>
  	<textarea rows=10px  class="form-control" id="title-area" name="noticeContent">${teamNotice.noticeContent }</textarea>
  </div>
  
  
  <div align="right">
  	<input type="submit" class="btn btn-outline-success" id="white_btn" value="수정">
	<input type="button" class="btn btn-outline-success" value="취소" onclick="cancel_btn()"> 
  </div>
    
</div>

</form>
</section>


<script>
 	function cancel_btn(){
 		location.href="${path}/teamnotice.do";
	} 

</script>


<style>
	#updateNotice-container{
		margin:0 auto;
		width:600px;
	}
	
	#title-area{
		width:600px; 
		
	}

</style>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>