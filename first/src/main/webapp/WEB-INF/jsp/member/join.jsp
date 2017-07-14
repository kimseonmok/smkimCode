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
			
			if(event=="goMain"){
	 			location.href="${contextPath}";
			}
			
			
		});
	
		
	});

	function doAction(action){
		
		var formObj = $("#mainFrm");
		
		var param="";
		var url="";
		
		switch(action){
			case 'join':
				//idCheck후 콜백에서 호출
				console.log('join');
				
				param = formObj.serialize();
				url="${contextPath}/member/join.do"
				
				ajaxCall(url, param, callbackJoin);
				
				break;
			case 'idCheck':
				
				if(validation(formObj)){
					return false;
				};
				
				param = formObj.serialize();
				url="${contextPath}/member/idCheck.do";
				
				ajaxCall(url, param, callbackIdCheck);
				
				break;
			default:
				break;
		
		}
		
	}
	
	function callbackJoin(data){
		if(data.flag){
			$("#modalText").empty().text("회원가입이 완료되었습니다");
			$("#modalBnt").trigger('click');
			$("#modalText").attr("event","goMain");
		}else{
			$("#modalText").empty().text("회원가입에 실패했습니다");
			$("#modalBnt").trigger('click');
		}
	}
	
	function callbackIdCheck(data){
		if(!data.flag){
			$("#modalText").empty().text("중복된 아이디가 있습니다");
			$("#modalBnt").trigger('click');
		}else{
			doAction('join');
		}
	}
	
	function validation(formObj){
		
		var mbrId = formObj.find("input[name=mbrId]").val();
		var mbrPwd = formObj.find("input[name=mbrPwd]").val();
		var mbrPwd_check = formObj.find("input[name=mbrPwd_check]").val();
		var mbrName = formObj.find("input[name=mbrName]").val();
		
		
		if(mbrId==""){
			$("#modalText").empty().text("아이디를 입력해 주세요");
		}else if(mbrPwd==""){
			$("#modalText").empty().text("비밀번호를 입력해 주세요");
		}else if(mbrPwd_check==""){
			$("#modalText").empty().text("비밀번호 확인을 입력해 주세요");
		}else if(mbrName==""){
			$("#modalText").empty().text("이름을 입력해 주세요");
		}else if(mbrPwd_check!=mbrPwd){
			$("#modalText").empty().text("비밀번호와 비밀번호 확인이 일치하지 않습니다");
		}else{
			return false;
		}
		
		$("#modalBnt").trigger('click');
		
		return true;
	}


</script>




</head>
<body>
	<div class="joinForm">
		<form name="mainFrm" id="mainFrm" >
	
			<h2>회원가입</h2>
	
			<div class="form-group">
				<label for="usr">아이디:</label>
				<input type="text" class="form-control" id="mbrId" name="mbrId">
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호:</label>
				<input type="password" class="form-control" id="mbrPwd" name="mbrPwd">
			</div>
			<div class="form-group">
				<label for="pwd">비밀번호 확인:</label>
				<input type="password" class="form-control" id="mbrPwd_check" name="mbrPwd_check">
			</div>
			<div class="form-group">
				<label for="name">이름(닉네임):</label>
				<input type="text" class="form-control" id="mbrName" name="mbrName">
			</div>
			<button type="button" class="btn btn-primary btn-block" onclick="doAction('idCheck');">회원가입</button>
		
		</form>
	</div>
	
</body>
</html>