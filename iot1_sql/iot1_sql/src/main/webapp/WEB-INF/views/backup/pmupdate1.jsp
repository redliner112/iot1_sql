<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/topmenu.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>


<script>
$(document).ready(function(){

	var aul = new AjaxUtilList("purchase/pmlist","pmTable","clientNo","puchase/insert", "/puchase/excel","purchase/pmupdate");
	aul.send();
})

</script>

<title>구매 수정</title>
</head>
<body>

<div class="container">


  
	<h1>구매 수정</h1>
	<div class="tableUpdate" id="pmuTable">
    <table class="table table-bordered" >
      <tbody>
        <tr>
          <th class="col-md-2">일자</th>
          <th class="col-md-2">거래처</th>
        </tr>
        <tr>
          <th class="col-md-2">담당자</th>
          <th class="col-md-2">출하창고</th>
        </tr>
      </tbody>
    </table>
  </div>
	<table class="tableList" id="pmTable"> 
		<thead>
			<tr>
				<th data-field="checkbox"></th>
				<th data-field="purchaseNo">구매번호</th>
				<th data-field="orderDate">발주요청일자</th>
				<th data-field="clientNo">거래처명</th>
				<th data-field="itemNo">품목번호</th>
				<th data-field="deliveryDate">입고일자/납품일자</th>
				<th data-field="imcNo">품목&회사</th>
				<th data-field="managerNo">담당자</th>
				<th data-field="warehouseNo">입고진행창고</th>
				<th data-field="projectNo">프로젝트</th>
				<th data-field="purchaseStatus">종결여부</th>
				<th data-field="createUser">입력자</th>
				<th data-field="createDate">입력일자</th>
				<th data-field="modifiedUser">수정자</th>
				<th data-field="modifiedData">수정일자</th>
			</tr>
		</thead>
		<tbody/>
	<input type="hidden" id="clientNo">
	</table>
</div>
</body>
</html>



