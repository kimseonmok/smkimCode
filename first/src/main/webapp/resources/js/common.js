// ================================================
// ajax 처리 후 콜백함수...
// ================================================
function ajaxCall(url, param, callback) {
		 $.ajax({           
	   url: url,                 
	   async: false,                    
	   type: "POST",           
	   data: param,                                    
	   dataType: 'json', 
	   beforeSend : function(xhr) {// ajax 호출시 사용자 인증정보가 잇는지 확인
				xhr.setRequestHeader("AJAX", "true");                  
			},
	   success: callback,                             
	   error:function(request,textStatus){
	  	 if(request.status == 9999){                
	  		 $("form").eq(0).attr("action",getContextPath+"/main.do").submit();
	  	 }else{
//	  		alert("다시 시도하여 주시기 바랍니다.");
	  		 console.log(request);
	  		 alert('에러발생...' + textStatus);
	  	 }
	   }
	});
}


/* 팝업으로 열기 */
function OpenWindow(target, wName, wWidth, wHeight, wScroll){
	
  var xpos = ( screen.width -  wWidth  ) / 2; 
  var ypos = ( screen.height - wHeight )  / 2;  
  
  //윈도우 이름이 틀리면 새창으로 팝업이 열리고, 같으면 이름이 같이 창이 Replace된다.
  if (wName == null) wName = "";
	  
  popupWindow = window.open(target,wName,'toolbar=no,status=no,top='+ ypos +',left='+ xpos +',width=' + wWidth + ',height=' + wHeight +',directories=no,scrollbars=yes,location=no,resizable=yes,border=0,menubar=no,status=yes');
  popupWindow.focus();
  return popupWindow;
}

/* 모달 팝업으로 열기 */
function OpenModal(target, wName, wWidth, wHeight, wScroll){
	
	var xpos = ( screen.width -  wWidth  ) / 2; 
	var ypos = ( screen.height - wHeight )  / 2;  
	
	//윈도우 이름이 틀리면 새창으로 팝업이 열리고, 같으면 이름이 같이 창이 Replace된다.
	if (wName == null) wName = "";
	
	popupWindow = window.open(target,wName,'top='+ ypos +',left='+ xpos +',width=' + wWidth + ',height=' + wHeight +',directories=no,scrollbars=yes,location=no,resizable=yes,border=0,menubar=no,status=no,toolbar=no,modal=yes');
	return popupWindow;
}