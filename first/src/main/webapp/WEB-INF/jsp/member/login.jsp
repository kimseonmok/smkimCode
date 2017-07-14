<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<c:set var="contextPath" value="<%= request.getContextPath()%>"></c:set>  
<title>로그인</title>

<script type="text/javascript">
	function doAction(action){
		
		var formObj = $("#mainFrm");
		
		var param="";
		var url="";
		
		switch(action){
			case 'login':
				param = formObj.serialize();
				url="${contextPath}/member/login.do"
				validation(formObj);
				ajaxCall(url, param, callbackLogin);
				
				break;
		
			default:
				break;
		
		}
		
	}
	
	function callbackLogin(data){
		if(data.flag){
			location.href="${contextPath}/";
		}else{
			$("#modalText").empty().text("아이디나 비밀번호가 일치하지 않습니다.");
			$("#modalBnt").trigger('click');
		}
		
	}
	
	
	function validation(formObj){

		var mbrId = formObj.find("input[name=mbrId]").val(); 
		var mbrPwd = formObj.find("input[name=mbrPwd]").val(); 
		
		if(mbrId==""){
			$("#modalText").empty().text("아이디를 입력해 주세요");
			$("#modalBnt").trigger('click');
		}else if(mbrPwd==""){
			$("#modalText").empty().text("비밀번호를 입력해 주세요");
			$("#modalBnt").trigger('click');
		}else{
			return true;
		}
		
		
		return false;
	}


</script>



</head>
<body>
	
	<div class="loginForm">
		<form name="mainFrm" id="mainFrm" >
			<h2>로그인</h2>
	
			<div class="form-group">
				<label for="usr">아이디:</label>
				<input type="text" class="form-control" id="usr" name="mbrId" value="smkim91">
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호:</label>
				<input type="password" class="form-control" id="pwd" name="mbrPwd" value="1234">
			</div>
			<div class="checkbox">
		        <label><input type="checkbox">아이디를 기억합니다</label>
		    </div>
		    <button type="button" class="btn btn-primary btn-block" onclick="doAction('login');">로그인</button>
	    </form>
	</div>

</body>
</html>