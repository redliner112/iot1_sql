<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ include file="/WEB-INF/views/common/topmenu.jsp"%>
<%@ include file="/WEB-INF/views/common/sidebar.jsp"%>


<script>
$(document).ready(function(){

	var aul = new AjaxUtilUpdateList("purchase/pmupdate","pmuTable","itemName");
	aul.send();
})

</script>

<title>구매 수정</title>
</head>
<body>

<div class="container">
	<h1>구매 수정</h1>
	<table class="tableList" id="pmuTable"> 
		<thead>
        <tr>
          <th data-field="orderDate">구매일자</th>
         <!-- <td>
          <input type='text' class='form-control' value=" 고똥"/> 
          </td>--> 
          <th data-field="clientNo">거래처</th>
        </tr>
        <tr>
          <th data-field="managerNo">담당자</th>
          <th data-field="warehouseNo">입고창고</th>
        </tr>
			<tr>
				<th data-field="checkbox"></th>
				<th data-field="purchaseNo">NO</th>
				<th data-field="itemNo">품목번호</th>
				<th data-field="itemName">품목명</th>
				<th data-field="warehouSingCost">단가</th>
				<th data-field="quantity">수량</th>
				<th data-field="amount">총액</th>
				<th data-field="createUser">입력자</th>
				<th data-field="createDate">입력일자</th>
				<th data-field="modifiedUser">수정자</th>
				<th data-field="modifiedData">수정일자</th>
				
			</tr>
		</thead>
		<tbody/>
	<input type="hidden" id="itemName">
	</table>
</div>
</body>
</html>



