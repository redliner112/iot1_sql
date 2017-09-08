<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
</head>
<body>
<script>
$(document).ready(function(){
	$("input[type = 'button']").click(function(){
		var au = new AjaxUtil("vendor/list");
		au.setCallbackSuccess(callback);
		au.send();
	})
})

</script>
<form action = "${rootPath}/vendor/list" method="post">
<input type = "button" value = "전송">
</form>
</body>
</html>