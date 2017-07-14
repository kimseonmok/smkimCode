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
		
	});
	

	function doAction(action){
		
		var formObj = $("#mainFrm");
		
		var param="";
		var url="";
		
		switch(action){
			case 'list':
				location.href="${contextPath}/board/boardListPage.do";
				break;
			case 'update':	
				var brdNum = formObj.find("input[name=brdNum]").val();
				location.href="${contextPath}/board/boardWritePage.do?brdNum="+brdNum;
				break;
			default:
				break;
		
		}
		
	}


</script>
</head>
<body>

	<h2>상세보기</h2>
	<form name="mainFrm" id="mainFrm">
		<input type="hidden" name="brdNum" value="${boardDTO.brdNum }"/>
		<input type="hidden" name="mbrNum" value="${boardDTO.mbrNum }"/>
		<div class="row">
		  <div class="col-sm-12 well brdTit">${boardDTO.brdTit }</div>
		</div>
		<div class="row">
		  <div class="col-sm-6">작성자 | ${boardDTO.mbrName }</div>
		  <div class="col-sm-6">작성일자 | ${boardDTO.brdWriteDate }</div>
		</div>
		
		<div class="row">
		  <div class="col-sm-12 brdCont">${boardDTO.brdCont }</div> 
		</div>
		
		<div class="row">
			<div class="col-sm-12 alignRight">
				<button class="btn btn-default" type="button" id="btnWrite" onclick="doAction('list');">목록</button>
				<button class="btn btn-default" type="button" id="btnWrite" onclick="doAction('update');">수정</button>
			</div>
		</div>
	</form>
</body>
</html>