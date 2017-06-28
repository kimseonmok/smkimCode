<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
//======================================================
//  web app path 초기화 : /wiseda
//======================================================
var tmppath = '<c:url value="/" />';
var containerPath = tmppath.substr(0, tmppath.lastIndexOf("/"));
// alert (containerPath);
</script>


<script type="text/javascript" src='<c:url value="/js/jquery/jquery-1.9.1.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/jquery/jquery-ui-1.9.2.custom.js"/>'></script>

<script type="text/javascript" src='<c:url value="/js/common.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/request.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/multifileupload.js"/>'></script>
<script type="text/javascript" src='<c:url value="/js/documentready.js"/>'></script>

