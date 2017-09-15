<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="/WEB-INF/exam.tld" prefix="ex1" %>
<%@ page session="false" %>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<html>
<head>
	<title>Home</title>
</head> 
<script>
$(document).ready(function(){
	$("#btn").click(function(){
		var list = [
				{col1:"data1-1", col2:"data2-1"},
				{col1:"data1-2", col2:"data2-2"},
				{col1:"data1-3", col2:"data2-3"},
				{col1:"data1-4", col2:"data2-4"},
				{col1:"data1-5", col2:"data2-5"}
			];
		var gridParam = {
		  		dataSource: {
		    	      data: list ,
		    	      pageSize: 2
		    	    },
		    	    editable: false,
		    	    sortable: true,
		    	    pageable:true
		  	}
	  	var grid = $("#test").kendoGrid(gridParam);
	})
})
</script>
<body>
<input type="button" id="btn" value="그리드 생성"/>
<div id="test"></div>
</body>
</html>
