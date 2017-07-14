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
		doAction('search');
		
		$("input[name=searchWord]").keydown(function (key) {
	        if(key.keyCode == 13){//키가 13이면 실행 (엔터는 13)
	        	doAction('search');
	        }
	    });
		
	});
	

	function doAction(action){
		
		var formObj = $("#mainFrm");
		
		var param="";
		var url="";
		
		switch(action){
			case 'search':
				
				param = formObj.serialize();
				url = "${contextPath}/board/getBoardList.do";
				
				ajaxCall(url, param, callbackList);
				break;
			case 'write':
				
				url = "${contextPath}/board/boardWritePage.do";
				location.href=url;
				
				break;
				
			default:
				break;
		
		}
		
	}
	
	function callbackList(data){
		
		var tbodyAppend = "";
		
		for(var i=0;i<data.list.length;i++){
			tbodyAppend+="<tr onclick=\"goDetail('"+data.list[i].brdNum+"');\">";
			tbodyAppend+="  <td>"+data.list[i].rk+"</td>";
			tbodyAppend+="  <td>"+data.list[i].brdTit+"</td>";
			tbodyAppend+="  <td>"+data.list[i].mbrName+"</td>";
			tbodyAppend+="  <td>"+data.list[i].brdWriteDate+"</td>";
			tbodyAppend+="</tr>";
		}
		
		$("#tbody").empty().append(tbodyAppend);
		
	}
	
	function goDetail(brdNum){
		location.href="${contextPath}/board/boardDetailPage.do?brdNum="+brdNum;
	}
	
	function validation(formObj){
		
	}


</script>




</head>
<body>

	
 
	<div class="boardListForm">
		<form name="mainFrm" id="mainFrm" onsubmit='return false'>
			<input type="hidden" name="pageSize" value="10"/>
			<input type="hidden" name="pageNum" value="1"/>
			
		 
			<h2>게시판</h2>
		    <p>글쓰기, 댓글, 답글, 파일첨부</p>    
		    
		    
		    <div class="input-group">
				<input type="text" class="form-control" placeholder="제목 + 내용" name="searchWord">
				<div class="input-group-btn">
					<button class="btn btn-default" type="button" onclick="doAction('search');"> 
						검색 
					</button> 
				</div>
				
				
			</div>
		    
		            
		    <table class="table table-striped table-hover table-responsive">   
		      <thead>
		        <tr>
		          <th>번호</th>
		          <th>제목</th>
		          <th>작성자</th>
		          <th>작성날짜</th>
		        </tr>
		      </thead>
		      <tbody id="tbody">
		       
		       
		      </tbody> 
		      <tfoot>
		      	  <tr>
				      <td colspan="4" class="alignRight"><button class="btn btn-default" type="button" id="btnWrite" onclick="doAction('write');">글쓰기</button></td>
			      </tr>
		      </tfoot>
		    </table>
		    
			

		</form>
	</div>
	
</body>
</html>