<%@page import="smkim.member.dto.LoginDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>  

<%
	LoginDTO loginDTO = new LoginDTO();
	
	if(session.getAttribute("loginDTO") != null){
		loginDTO = (LoginDTO)session.getAttribute("loginDTO");
		System.out.println("로그인됨 :: " + loginDTO.getMbrName());
	}
	

%>

<script type="text/javascript">
	console.log("header :: ${contextPath}");
	
	
	

</script>


</head>
<body>
	<nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span> 
	      </button>
	      <a class="navbar-brand" href="#">WebSiteName</a>
	    </div>
	    <div class="collapse navbar-collapse" id="myNavbar">
	      <ul class="nav navbar-nav">
	        <li class="active"><a href="${contextPath}">Home</a></li>
	        <li><a href="${contextPath}/board/boardListPage.do">게시판</a></li>
	        <li><a href="#">Page 2</a></li> 
	        <li><a href="#">Page 3</a></li> 
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	      	<c:if test="${empty loginDTO.mbrName}">
		        <li><a href="${contextPath}/member/joinPage.do"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
		        <li><a href="${contextPath}/member/loginPage.do"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	        </c:if>
	        <c:if test="${!empty loginDTO.mbrName }">
	        	<p class="navbar-text">안녕하세요  ${loginDTO.mbrName} 님!</p>
	        </c:if>
	      </ul>
	    </div>
	  </div>
	</nav>
	
	
	
	<!-- Modal -->
	<div id="commonModal" class="modal fade" role="dialog">
	  <div class="modal-dialog modal-sm">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">알림</h4>
	      </div>
	      <div class="modal-body">
	        <p id="modalText">Some text in the modal.</p>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	      </div>
	    </div>
	
	  </div>
	</div>
	
	<button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#commonModal" style="display:none;" id="modalBnt">Open Modal</button>
	
	
</body>
</html>