<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<c:url var="readUrl" value = "/goods/list"/>
<!--c:url이라고 쓰면 자동으로 프로젝트 명을 가져간다.(rootpath처럼 똑같이 앞에 써진다는 소리.  -->
<title>Insert title here</title>
</head>
<body>
<script>
</script>
<br><p/><br><p/><br><p/>
${readUrl}
<kendo:grid title="그리드" name = "grid" pageable = "true" sortable = "true" scrollable = "true" height="450">
	<kendo:grid-columns>
		<kendo:grid-column title = "제품번호" field = "giNum"/>
		<kendo:grid-column title = "제품이른" field = "giName"/>
		<kendo:grid-column title = "제품설명" field = "giDesc"/>
		<kendo:grid-column title = "회사번호" field = "viNum"/>
		<kendo:grid-column title = "생산일자" field = "giCredat"/>
		<kendo:grid-column title = "생산시간" field = "giCretim"/>
	</kendo:grid-columns>
	
	<kendo:dataSource pageSize="20" batch="true">
		<kendo:dataSource-transport>
			<kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json"/>
		</kendo:dataSource-transport>
	</kendo:dataSource>
</kendo:grid>
</body>
</html>