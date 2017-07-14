<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>  
<title>Insert title here</title>

<script type="text/javascript">


	$(document).ready(function() {    
		
		
		
		$("#commonModal").on('hidden.bs.modal',function(data){
			var event = $("#modalText").attr("event");
			$("#modalText").attr("event","");
			console.log(event);
			
			if(event=="goBoardList"){
	 			location.href="${contextPath}/board/boardListPage.do";
			}
			
			
		});

		
	});
	

	function doAction(action){
		
		var formObj = $("#mainFrm");
		
		var param="";
		var url="";
		
		switch(action){
			case 'save':
				
				param = formObj.serialize();
				url = "${contextPath}/board/insertBoard.do";
				
				ajaxCall(url, param, callbackSave);
				break;
// 			case 'search':
				
// 				url = "${contextPath}/board/boardWritePage.do";
// 				location.href=url;
				
// 				break;
				
			default:
				break;
		
		}
		
	}
	
	function callbackSave(data){
		
		if(data.flag){
			$("#modalText").empty().text("저장되었습니다");
			$("#modalBnt").trigger('click');
			$("#modalText").attr("event","goBoardList");
		}
		
	}
	
	function validation(formObj){
		
	}
	
	
	
</script>

</head>
<body>


	<div class="boardListForm">
		<form name="mainFrm" id="mainFrm" >
		
		 
			<h2>게시글 작성</h2>
		    
		    <div class="form-group">
				<label for="usr">제목:</label>
				<input type="text" class="form-control" id="" name="brdTit">
			</div>
			 <div class="form-group">
				<label for="usr">내용:</label>
				<textArea class="form-control" rows="10" name="brdCont"></textArea>
			</div>
			  <div class="alignCenter"><button class="btn btn-default" type="button" id="btnWrite" onclick="doAction('save');">글쓰기</button></div>
			

		</form>
	</div>

</body>
</html>