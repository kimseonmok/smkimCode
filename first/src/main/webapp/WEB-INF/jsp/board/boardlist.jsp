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
		
		var formObj = $("#mainFrm");
		
		var pageSize = formObj.find("input[name=pageSize]").val();
		var pageNum = formObj.find("input[name=pageNum]").val();
		var totalCnt=data.listCnt;
		formObj.find("input[name=totalCnt]").val(totalCnt);
		
		console.log("pageSize : "+pageSize + "pageNum : " + pageNum);
		
		var tbodyAppend = "";
		
		for(var i=0;i<data.list.length;i++){
			tbodyAppend+="<tr onclick=\"goDetail('"+data.list[i].brdNum+"');\">";
			tbodyAppend+="  <td>"+data.list[i].rk+"</td>";
			tbodyAppend+="  <td>"+data.list[i].brdTit+"</td>";
			tbodyAppend+="  <td>"+data.list[i].mbrName+"</td>";
			tbodyAppend+="  <td>"+data.list[i].brdWriteDate+"</td>";
			tbodyAppend+="</tr>";
		}
		
		var paging = "";
		paging +="<ul class='pagination '>";
		paging +="<li><a href='#'><span class='glyphicon glyphicon-chevron-left'></span></a></li>";
		for(var i=1;i<=totalCnt/pageSize+1;i++){ 
			paging +="<li><a  onClick=\"pageMove('"+i+"');\" href='#'>"+i+"</a></li>";
		} 
		paging +="<li><a href='#'><span class='glyphicon glyphicon-chevron-right'></span></a></li>";
		paging +="</ul>";
		
		
		var paging_mobile = "";
		paging_mobile += "<div class='btn-group btn-group-justified'>";
		paging_mobile += "<a href='#' class='btn btn-primary'>이전</button>";
		paging_mobile += "<a href='#' class='btn btn-primary'>다음</button>";
		paging_mobile += "</div>";
		
		  
		  
		
		
		
		
		$("#paging_mobile").empty().append(paging_mobile);
		$("#paging").empty().append(paging);
		$("#tbody").empty().append(tbodyAppend);
		
	} 
	
	function goDetail(brdNum){
		location.href="${contextPath}/board/boardDetailPage.do?brdNum="+brdNum;
	}
	
	function pageMove(pageNum){
		var formObj = $("#mainFrm");
		formObj.find("input[name=pageNum]").val(pageNum);
		doAction('search');
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
			<input type="hidden" name="totalCnt" value=""/>
			
		 
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
		     
				    
			
		    </table>
		    
		    <div class="alignRight"><button class="btn btn-default" type="button" id="btnWrite" onclick="doAction('write');">글쓰기</button></div>
			<div id="paging" class="paging"></div>
			<div id="paging_mobile" class="paging_mobile"></div>
			
		</form>
	</div>
		
		
</body>
</html>