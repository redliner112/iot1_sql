<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<br><p /><br><p /><br><p />
<kendo:grid title="그리드" name = "grid" pageable = "true" sortable = "true" scrollable = "treu" height = "400" navigatable = "treu">
	<kendo:grid-editable mode = "incell"/>
	<kendo:grid-toolbar>
		<kendo:grid-toolbarItem name = "create" text = "생성"/>
		<kendo:grid-toolbarItem name = "save" text = "저장"/>
		<kendo:grid-toolbarItem name = "excel" text = "엑셀저장"/>
	</kendo:grid-toolbar>
	<kendo:grid-excel fileName = "상품정보.xlsx" allPages = "true" filterable = "true" proxyURL = "${eUrl}"/>
	<kendo:grid-colmns>
		<kendo:grid-colmn title = "제품번호" field = "giNum"/>
		<kendo:grid-colmn title = "제품이름" field = "giName"/>
		<kendo:grid-colmn title = "제픔정보" field = "giDesc"/>
		<kendo:grid-colmn title = "회사번호" field = "viNum">
			<kendo:grid-colmn-value value = "${vendors}"/>
		</kendo:grid-colmn>
		<kendo:grid-colmn title = "제작날자" field = "giCredat" format = "{0:yyyy-MM-dd}"/>
		<kendo:grid-colmn title = "제작시간" field = "giCretim"/>
		<kendo:grid-colmn command = "destroy" title = "삭제"/>
	</kendo:grid-colmns>
	
</kendo:grid>
</body>
</html>