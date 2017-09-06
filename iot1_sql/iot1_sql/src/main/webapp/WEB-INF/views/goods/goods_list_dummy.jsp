<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<title>Insert title here</title>
</head>
<body>
<script>
function callback(results){
	alert(results.length);
	//callback(results) 에서 가져온걸 alert(result.length)라고 써서 읽지를 못했다. 
	var result = "";
	
		result +="<table border='1'>";
		result +="<tr>";
		result +="<td>번호</td>";
		result +="<td>이름</td>";
		result +="<td>제품정보</td>";
		result +="<td>회사정보</td>";
		result +="<td>날자</td>";
		result +="<td>생산시간</td>";
		result +="</tr>";
		for(var i=0,max=results.length;i<max;i++){
			var goods = results[i];
			result +="<tr>";
			result +="<td>"+ goods.giNum+"</td>";
			result +="<td>"+ goods.giName+"</td>";
			result +="<td>"+ goods.giDesc+"</td>";
			result +="<td>"+ goods.viNum+"</td>";
			result +="<td>"+ goods.giCredat+"</td>";
			result +="<td>"+ goods.giCretim+"</td>";
			result +="</tr>";
		}
		result +="</table>";
		$("#r_div").html(result);
		//범위 밖에써서 읽지를 못하고 undifind떴다.
	}

$(document).ready(function(){
	$("input[type = 'button']").click(function(){
		var au = new AjaxUtil("goods/list");
		au.setCallbackSuccess(callback)	;
		au.send();
	})
})
</script>
<br><p/><br><p/><br><p/><br><p/>
<form action = "${rootPath}/goods/list" method = "post">
<input type = "button" value = "전송">
<div id = "r_div"></div>
</form>
</body>
</html>