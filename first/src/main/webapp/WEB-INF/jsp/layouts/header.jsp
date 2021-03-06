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
	
    //로그인 세션 가져오기
	if(session.getAttribute("loginDTO") != null){
		loginDTO = (LoginDTO)session.getAttribute("loginDTO");
		System.out.println("로그인됨 :: " + loginDTO.getMbrName());
	}
	
    //메뉴 클릭 
	String path[] = (request.getAttribute("javax.servlet.forward.servlet_path")+"").split("/");
	String path2[] = path[1].split("\\.");
	String menu = path2[0]; 
	System.out.println(menu);

%>

<script type="text/javascript">
	
	
	
	$(document).ready(function() {    
		
		console.log("header :: ${contextPath}");
		console.log("헤더 :: ${menu}");
		
		
		$("#<%=menu%>").attr('class','active');
		
		if("<%=menu%>"=="" || "<%=menu%>"=="main"){
			$("#index").attr('class','active');
		}

	});
	
	

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
	      <ul class="nav navbar-nav headerList">
	        <li id="index"><a href="${contextPath}">Home</a></li>
	        <li id="board"><a href="${contextPath}/board/boardListPage.do">게시판</a></li>
	        <li><a href="#">Page 2</a></li> 
	        <li><a href="#">Page 3</a></li> 
	      </ul>
	      <ul class="nav navbar-nav navbar-right">
	      	<c:if test="${empty loginDTO.mbrName}"> 
		        <li><a href="${contextPath}/member/joinPage.do"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
		        <li><a href="${contextPath}/member/loginPage.do"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
	        </c:if>
	        <c:if test="${!empty loginDTO.mbrName }">
	        	<li><p class="navbar-text"> 안녕하세요  ${loginDTO.mbrName} 님!</p></li>
	        	<li><a href="${contextPath}/member/logOut.do"><span class="glyphicon glyphicon-log-in"></span> LogOut</a></li>
	        </c:if>
	      </ul>
	    </div>
	  </div>
	</nav>
	
	
	
	
	
</body>
</html>