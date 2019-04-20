<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<style>
	.freeboard-write-header
	{
		margin : 20px auto;
		text-align: center;
		font-size: 37px;
		font-weight: bold;
	}
	
	.freeboard-write-wrapper
	{
		display:flex;
		width : 80%;
		flex-flow: column;
		margin : 30px auto 100px;
	}
	
	.freeboard-write-form
	{
		margin : 20px 0;
	}
	
	.freeboard-content-element
	{
		display: flex;
		flex-flow: row;
	}
	
	.freeboard-content-element > div
	{
		margin : 3px 15px;
	}
	
	.freeboard-content-element > div:nth-of-type(1)
	{
		flex : 1 0 0; 
		align-self: center;
		text-align: right;
		margin-right: 8px;
		
	}
	.freeboard-content-element > div:nth-of-type(2)
	{
		flex : 7 0 0;
	}
	
	.form-control[readonly]
	{
		opacity: 0.8;
		width : 50%;
		margin-left: 0;
	}
	
	.freeboard-attach
	{
		display: flex;
		flex-direction: column;
	}
	

	.attach-file
	{
		display: flex;
		flex-flow: row;
		align-items: center;
	}
	
	.attach-file > div:nth-of-type(1)
	{
		flex : 5 1 0;
	}
	
	.attach-file > div:nth-of-type(2)
	{ 
		text-align : right;
		margin-right: 35px;
		flex : 1 1 0;
	}

	.attah-add
	{
		text-align: right;
		margin-right: 50px;	
	}
	
	.freeboard-btn-box > input:nth-of-type(1)
	{
		margin-left:340px;
	}
	
</style>

<section>
	<div class="freeboard-write-wrapper">
		<div class="freeboard-write-header">
			<span>공지사항 글 수정</span>
		</div>
		<div class="freeboard-write-form">
			<form name="freeboardFrm" action="${pageContext.request.contextPath}/board/noticeUpdateEnd"	method="post" onsubmit="return validate();"	enctype="multipart/form-data">
				<input type="hidden" name="noticeNo" value="${notice.noticeNo }"/>
				<div class="freeboard-write-body">
					<div class="freeboard-write-content">
						<div class="freeboard-content-element">
							<div>작성자</div>
							<div>
								<input type="text" name="memberId" class="form-control"
									value="${notice.memberId }" readonly />
							</div>
						</div>
						<div class="freeboard-content-element">
							<div>제목</div>
							<div>
								<input type="text" name="noticeTitle" class="form-control"
									required="required" value="${notice.noticeTitle }"/>
							</div>
						</div>
						<div class="freeboard-content-element">
							<div>내용</div>
							<div>
								<textarea class="form-control" name="noticeContent"
									required="required" rows="7">${notice.noticeContent }</textarea>
							</div>
						</div>
	<c:if test="${attachmentList != '[]' }">
		<div class="freeboard-attach-download">
			<div>
				첨부파일 수정
			</div>
			<div>
				<c:forEach items="${attachmentList}" var="a" varStatus="vs">
				<div>
			    	<button type="button" class="btn btn-outline-success" onclick="fileDelete('${a.originalFileName}','${a.renamedFileName }');"><%--  첨부파일${vs.count} -  --%>${a.originalFileName }
			        </button>
		   		</div>
		   		</c:forEach>
		   	</div>	
		</div>
	</c:if>
					<div class="freeboard-content-element">
							<div>파일 첨부</div>
							<div class="freeboard-attach"  id="fileDiv">
								<div class="attach-file">
									<div>
										<input type="file" class="form-control form-control-sm" id="file_0" name="upFile">
									</div>
									<div>
										<a href="#this" class="btn btn-primary btn-sm" id="delete" name="delete">삭제</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="attah-add">
					<a href="#this" class="btn btn-primary btn-sm" id="addFile">파일추가</a>
				</div>
				
				<div class="freeboard-btn-box">
					<input type="submit" class="btn btn-warning" value="수정"/> 
					<input type="button" class="btn btn-secondary"  onclick="location.href='${path}/board/notice'" value="취소"/>
				</div>
			</form>
		</div>
	</div>


</section>

<script>
	var attach_count = 1;
	$(document).ready(function(){
		$("#addFile").on("click", function(e){
			e.preventDefault();
			fn_addFile();
		});
		$("a[name='delete']").on("click", function(e){
			e.preventDefault();
			console.log('dele');
			fn_deleteFile($(this));
			console.log($(this));
		});
	});
	
	function fn_addFile(){
		var str = "<div class='attach-file'><div><input type='file' name='upFile' class='form-control form-control-sm' id='file_"+(attach_count++)+"'></div><div><a href='#this' class='btn btn-primary btn-sm' name='delete'>삭제</a></div></div>";
		$("#fileDiv").append(str);

		$("a[name='delete']").on("click",function(e){
			e.preventDefault();
			console.log('dele2');
			fn_deleteFile($(this));
		})
		
	}
	
	function fn_deleteFile(obj){
		obj.parent().parent().remove();
	}
	
	function fileDelete(oName,rName)
	{
		var flag = confirm("정말 삭제하시겠습니까?");		
		
		if(flag==true){
			
			fileDeleteAjax(oName,rName);
		}
		else{
			return false;
		}
	}
	
	function fileDeleteAjax(oName,rName){
		
		oName = encodeURIComponent(oName);
		
		$.ajax({
           	url: '${path}/board/noticeAttachDelete.do?oName='+oName+'&rName='+rName,
           	type: 'get',
           	dataType: 'text',
           	success: data => {
           		
           	}
           });
	});
	
	

 </script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>