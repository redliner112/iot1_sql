<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<c:url var="readUrl" value = "/goods/list"/>
<c:url var="createUrl" value = "/goods/create"/>
<c:url var="updateUrl" value = "/goods/update"/>
<c:url var="deleteUrl" value = "/goods/delete"/>
<c:url var="eUrl" value="/goods/excel" />
<c:url var="vendorComboUrl" value = "/vendor/combo"/>

<c:url var="vendorReadUrl" value = "/vendor/list"/>

<title>Insert title here</title>
</head>
<body>
<!--  -->
<!--vendor의 value가 없을때 comboUrl로 이동하게 하는함수.  -->
	<script>
	$(document).ready(function(){
		if(!"${vendors}"){
			location.href="${vendorComboUrl}";
		}
	})
	
	</script>
	<br>
	<p />
	<br>
	<p />
	<br>
	<p />
	<!--  한컬럼의 설정 값들-->
	<kendo:grid title="그리드" name="grid" pageable="true" sortable="true" scrollable="true" height="400" navigatable="true">
		<!-- incell inline popup으로 나뉘는데 incell은 하나씩 inline은 한줄씩 popup은 팝업창으로 뜬수 수정 삭제 가능하다. -->
		<kendo:grid-editable mode="incell"/>
		<!--  툴바별로 name으로 명령어가 있을것임. 찾아보기 요망.-->
		<kendo:grid-toolbar>
			<kendo:grid-toolbarItem name="create" text="생성"/>
			<kendo:grid-toolbarItem name="save" text="저장"/>
			<kendo:grid-toolbarItem name="excel" text="엑셀저장"/>
		</kendo:grid-toolbar>
		<kendo:grid-excel fileName="상품정보.xlsx" allPages="true" filterable="true" proxyURL="${eUrl}" />
		<!--  각컬럼의 읽어들이는 값들을 field로 정의 DB의 컬럼명과 1:1맵핑된다.-->
		<kendo:grid-columns>
			<kendo:grid-column title="제품번호" field="giNum" />
			<kendo:grid-column title="제품이름" field="giName"/>
			<kendo:grid-column title="제품설명" field="giDesc"/>
			<kendo:grid-column title="회사번호" field="viNum">
            	<kendo:grid-column-values value="${vendors}"/>
			</kendo:grid-column>
			<kendo:grid-column title="생산일자" field="giCredat" format="{0:yyyy-MM-dd}"/>
			<kendo:grid-column title="생산시간" field="giCretim"/>
            <kendo:grid-column command="destroy" title="삭제" />        
		</kendo:grid-columns>
	<!-- 각각의 버튼을 클릭시에 어느 url로 보낼것이며 dataType과 type, conctentType을 어떻게보낼것인지를 정해놓음.   -->
		<kendo:dataSource pageSize="20" batch="true">
			<kendo:dataSource-transport>
				<kendo:dataSource-transport-read url="${readUrl}" dataType="json" type="POST" contentType="application/json" />
				<kendo:dataSource-transport-create url="${createUrl}" dataType="json" type="POST" contentType="application/json">
				<script>
					function handle_url(e){
						alert(e);
					}
				</script>
				</kendo:dataSource-transport-create>
				<kendo:dataSource-transport-destroy url="${deleteUrl}" dataType="json" type="POST"  contentType="application/json" />
				<kendo:dataSource-transport-update url="${updateUrl}" dataType="json" type="POST" contentType="application/json" />
			<!-- data를 json으로 변환해서 주고받기위한 파라메터맵.-->
				<kendo:dataSource-transport-parameterMap>
                	<script>
                	function parameterMap(options,type) { 
                		if(type==="read"){
                			return JSON.stringify(options);
                		} else {
                			var str = JSON.stringify(options.models);
                			alert(str);
                			return str;
                		}
                	}
                	</script>
                </kendo:dataSource-transport-parameterMap>
			</kendo:dataSource-transport>
			<!--insert할떄 name에 주기위한것들. .-->
			<kendo:dataSource-schema>
				<kendo:dataSource-schema-model id="giNum">
					<kendo:dataSource-schema-model-fields>
						<kendo:dataSource-schema-model-field name="giNum" type="number" editable="false"/>
						<kendo:dataSource-schema-model-field name="giName" type="string">
							<kendo:dataSource-schema-model-field-validation required="true"/>
						</kendo:dataSource-schema-model-field>
						<kendo:dataSource-schema-model-field name="viNum" defaultValue="1" >
							<kendo:dataSource-schema-model-field-validation required="true" min="1"/>
						</kendo:dataSource-schema-model-field>
						<kendo:dataSource-schema-model-field name="giCredat" editable="true" type="date" >
						</kendo:dataSource-schema-model-field>
						<kendo:dataSource-schema-model-field name="giCretim" editable="false">
						</kendo:dataSource-schema-model-field>
					</kendo:dataSource-schema-model-fields>
				</kendo:dataSource-schema-model>
			</kendo:dataSource-schema>
		</kendo:dataSource>
</kendo:grid>



<kendo:grid title="그리드1" name="grid1" pageable="true" sortable="true" scrollable="true" height="400" navigatable="true">
		<kendo:grid-editable mode="incell"/>
		<kendo:grid-toolbar>
			<kendo:grid-toolbarItem name="create" text="생성"/>
			<kendo:grid-toolbarItem name="save" text="저장"/>
			<kendo:grid-toolbarItem name="excel" text="엑셀저장"/>
		</kendo:grid-toolbar>
		<kendo:grid-excel fileName="상품정보.xlsx" allPages="true" filterable="true" proxyURL="${eUrl}" />

		<kendo:grid-columns>
			<kendo:grid-column title="번호" field="viNum" />
			<kendo:grid-column title="회사이름" field="viName"/>
			<kendo:grid-column title="제품설명" field="viDesc"/>
			<kendo:grid-column title="회사주소" field="viAddress"/>
			<kendo:grid-column title="전화번호" field="viPhone"/>
			<kendo:grid-column title="생산일자" field="vicredat" format="{0:yyyy-MM-dd}"/>
			<kendo:grid-column title="생산시간" field="vicretim"/>
            <kendo:grid-column command="destroy" title="삭제" />        
		</kendo:grid-columns>
		
		<kendo:dataSource pageSize="20" batch="true">
			<kendo:dataSource-transport>
				<kendo:dataSource-transport-read url="${vendorReadUrl}" dataType="json" type="POST" contentType="application/json" />
			</kendo:dataSource-transport>
			
					<kendo:dataSource-schema>
				<kendo:dataSource-schema-model id="viNum">
					<kendo:dataSource-schema-model-fields>
						<kendo:dataSource-schema-model-field name="viNum" type="number" />
						<kendo:dataSource-schema-model-field name="viName" type="String" />
						<kendo:dataSource-schema-model-field name="viDesc" type="String" />
						<kendo:dataSource-schema-model-field name="viAddress" type="String" />
						<kendo:dataSource-schema-model-field name="viPhone" type="number" />
						<kendo:dataSource-schema-model-field name="viCredat" type="data" />
						<kendo:dataSource-schema-model-field name="viCretim" type="data" />
					
					</kendo:dataSource-schema-model-fields>
				</kendo:dataSource-schema-model>
			</kendo:dataSource-schema>
		</kendo:dataSource>
</kendo:grid>
	

	
</body>
</html>