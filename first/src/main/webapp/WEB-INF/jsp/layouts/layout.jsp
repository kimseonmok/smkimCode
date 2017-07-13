<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<html>
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>  

<%
	String contextPath = "${contextPath}";
%>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="${contextPath}/resources/js/jquery-3.2.1.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="${contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>

<!-- 공통 스크립트 -->
<script src="${contextPath}/resources/js/common.js"></script>

<!-- 공통 스타일시트 -->
<link rel="stylesheet" href="${contextPath}/resources/css/custom.css">

<script type="text/javascript">
	console.log("layout :: ${contextPath}");

</script>

</head>
<body>
	<div class="header">
		<tiles:insertAttribute name="header" />
	</div>
	<div class="container">
		<tiles:insertAttribute name="main" />
	</div>
	<div class="footer">
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>
