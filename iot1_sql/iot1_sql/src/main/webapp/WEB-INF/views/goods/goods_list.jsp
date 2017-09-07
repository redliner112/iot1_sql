<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<c:url var="readUrl" value = "/goods/list"/>
<c:url var="createUrl" value = "/goods/create"/>
<c:url var="updateUrl" value = "/goods/update"/>
<c:url var="deleteUrl" value = "/goods/delete"/>
<c:url var="vendorComboUrl" value = "/vendor/combo"/>

<!--c:url이라고 쓰면 자동으로 프로젝트 명을 가져간다.(rootpath처럼 똑같이 앞에 써진다는 소리.  -->
<title>Insert title here</title>
</head>
<body>
	<script>
	$(document).ready(function(){
		if(!"$(vendors)"){
			location.href="${vendorComboUrl}";
		}
	})
	</script>
<script>
</script>
<br><p/><br><p/><br><p/>
${readUrl}
<!--1컬럼의 정의.-->
<kendo:grid title="그리드" name = "grid" pageable = "true" sortable = "true" scrollable = "true" height="450">
	<kendo:grid-columns>
		<kendo:grid-editable mode="incell"/>
		<kendo:grid-toolbar>
			<kendo:grid-toolbarItem name="create" text="생성"/>
			<kendo:grid-toolbarItem name="save" text="저장"/>
		</kendo:grid-toolbar>
		<kendo:grid-column title = "제품번호" field = "giNum"/>
		<kendo:grid-column title = "제품이른" field = "giName"/>
		<kendo:grid-column title = "제품설명" field = "giDesc"/>
		<kendo:grid-column title = "회사번호" field = "viNum">
			<kendo:grid-column-value value="${vendors}"/>
		</kendo:grid-column>
		<kendo:grid-column title = "생산일자" field = "giCredat" format="{0:yyyyMMdd"/>
		<kendo:grid-column title = "생산시간" field = "giCretim"/>
		<kendo:grid-column command="destroy" title="삭제"/>
	</kendo:grid-columns>
	
	<!-- batch를 true로 해놔야지 리스트 전체를 올릴수있다.>
			<!-- 2데이터 주고받는것. -->
	<kendo:dataSource pageSize="20" batch="true">
		<kendo:dataSource-transport>
			<kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json"/>
			<kendo:dataSource-transport-create url="${createUrl}" dataType ="json" type="POST" contentType= "application/json"/>
			<kendo:dataSource-transport-update url="${updateUrl}" dataType ="json" type="POST" contentType= "application/json"/>
			<kendo:dataSource-transport-delete url="${deleteUrl}" dataType ="json" type="POST" contentType= "application/json"/>
			
			<kendo:dataSource-transport-parameterMap>
				<script>
				function parameterMap(options,type){
					if(type==="read"){<!-- ===type까지 비교하는것.-->
						return JSON.stringify(options);
					}else{
						return JSON.stringify(options.models);
					}
				}
				</script>
			</kendo:dataSource-transport-parameterMap>
		</kendo:dataSource-transport>
		<!-- 3입력한 데이터의 각각의 네임값 -->
		<kendo:dataSource-schema>
			<kendo:dataSource-schema-model id="giNum">
				<kendo:dataSource-schema-model-fields>
					<kendo:dataSource-schema-model-field name="giNum" type="number" editable="false"/>
					<kendo:dataSource-schema-model-field name="giName" type="string">
						<kendo:dataSource-schema-model-field-validation required="true"/><!-- 아무것도 입력안하고 입력을 눌렀을떄 required라고뜨는것. -->
					</kendo:dataSource-schema-model-field>
					
					<kendo:dataSource-schema-model-field name="viNum" defaultValue="1">
						<kendo:dataSource-schema-model-field-validation required="true" min="1"/>
					</kendo:dataSource-schema-model-field>
					
					<kendo:dataSource-schema-model-field name="giCredat" editable="true" type="data">
					</kendo:dataSource-schema-model-field>
					
					<kendo:dataSource-schema-model-field name="giCretim" editable="false">
					</kendo:dataSource-schema-model-field>
					
				</kendo:dataSource-schema-model-fields>
			</kendo:dataSource-schema-model>
		</kendo:dataSource-schema>
	
	</kendo:dataSource>
</kendo:grid>
</body>
</html>