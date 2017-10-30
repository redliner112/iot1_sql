<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ include file="/WEB-INF/views/common/common.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Deployed Resources -> webapp -> resources에 있는 파일들 참조. -->

<!-- js -->
<script src="<c:url value='/resources/js/jquery.min.js' />"></script>
<script
	src="<c:url value="/resources/js/jquery-ui-1.9.2.custom.js?version=${pVar}"/>"></script>
<script
	src="<c:url value="/resources/js/jquery.fileupload.js?version=${pVar}"/>"></script>
<script
	src="<c:url value="/resources/js/jquery.iframe-transport.js?version=${pVar}"/>"></script>
<script
	src="<c:url value="/resources/ui/btsp3.7.7/js/bootstrap.min.js?version=${pVar}"/>"></script>
<script
	src="<c:url value="/resources/ui/btsp3.7.7/js/bootstrap-table.js?version=${pVar}"/>"></script>
<script
	src="<c:url value="/resources/ui/btsp3.7.7/js/bootstrap-table.js?version=${pVar}"/>"></script>

<!--  css -->
<link rel="stylesheet"
	href="<c:url value="/resources/ui/btsp3.7.7/css/bootstrap-theme.min.css?version=${pVar}"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/ui/btsp3.7.7/css/bootstrap.min.css?version=${pVar}"/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/ui/btsp3.7.7/css/bootstrap-table.css?version=${pVar}"/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/bootstrap.min.css?version=${pVar}'/>" />
<link rel="stylesheet"
	href="<c:url value='/resources/css/dashboard.css?version=${pVar}'/>" />
<link rel="stylesheet"
	href="<c:url value="/resources/css/tableList.css?version=${pVar}"/>" />

<script>
	//페이지 이동
	var pageMove = function(p_page, p_colName, p_param){
		var page = p_page;
		var colName = p_colName;
		var param = p_param;
		if(colName!=null && param!=null){
			location.href = "${rootPath}/" + page + "?" + colName + "=" + param;
			return;
		}
		location.href = "${rootPath}/" + page;
	}
	//
	$(document).ready(
			function() {
				var nowUrl = "${nowUrl}";
				var obj = $("a[href='" + nowUrl + "']").parent().attr("class",
						"active");
			})

	//로그인 Ajax
	var AjaxUtilLogin = function(url, params, type, dataType) {
		if (!url) {
			alert("url정보가 없습니다.");
			return null;
		}
		this.url = "${rootPath}/" + url;

		var generateJSON = function(params) {
			if (!params)
				return "";
			var paramArr = params.split(",");
			var data = {};
			for (var i = 0, max = paramArr.length; i < max; i++) {
				var key = paramArr[i]
				if ($("#" + key).length > 1) {
					throw new JSException("동일 ID값이 존재함.");
				} else if ($("#" + key).length == 0) {
					throw new JSException(key + "에 해당하는 ID가 존재하지 않음.");
				}
				data[key] = $("#" + key).val();
			}
			return JSON.stringify(data);
		}
		this.type = type ? type : "POST";
		this.dataType = dataType ? dataType : "json";
		this.param = generateJSON(params);
		this.callbackSuccess = function(json) {
			var url = json.url;
			var msg = json.msg;
			if (msg) {
				alert(msg);
			}
			if (url) {
				pageMove(url);
			}
		}

		this.setCallbackSuccess = function(callback) {
			this.callbackSuccess = callback;
		}

		this.send = function() {
			$.ajax({
				type : this.type,
				url : this.url,
				dataType : this.dataType,
				beforeSend : function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
					xhr.setRequestHeader("Content-Type","application/json;charset=utf-8");
					xhr.setRequestHeader("AJAX", true);
				},
				data : this.param,
				success : this.callbackSuccess,
				error : function(xhr, status, e) {
					if (xhr.responseJSON) {
						var obj = xhr.responseJSON;
						alert(obj.msg);
						pageMove(obj.url);
						alert(obj.url);
					} else {
						alert("에러 : " + e);
					}
				},
				complete : function(e) {
				}
			});
		}
	}
	//버튼 생성 함수
	function makeBtnStr(insertUrl, excelUrl) {
		var btnStr = "";
		btnStr += "<div class='newButton'>";

		if (insertUrl) {
			btnStr += " <input type = 'button' class='btn btn-primary' value='신규' onclick='pageMove(\""
					+ insertUrl + "\")'/>";
		}

		if (excelUrl) {
			btnStr += " <input type = 'button' value='excel 파일' onclick='test(\""
					+ excelUrl + "\")'/>";
		}

		btnStr += "</div>";
		return btnStr;
	}

	//리스트 Ajax
	var AjaxUtilList = function(url, tableId, params, insertUrl, excelUrl, updateUrl, 
			type, dataType) {
		if (!url) {
			alert("url정보가 없습니다.");
			return null;
		}
		this.url = "${rootPath}/" + url;
		var generateJSON = function(params) {
			if (!params)
				return "";
			var paramArr = params.split(",");
			var data = {};
			for (var i = 0, max = paramArr.length; i < max; i++) {
				var key = paramArr[i]
				if ($("#" + key).length > 1) {
					throw new JSException("동일 ID값이 존재함.");
				} else if ($("#" + key).length == 0) {
					throw new JSException(key + "에 해당하는 ID가 존재하지 않음.");
				}
				data[key] = $("#" + key).val();
			}
			return JSON.stringify(data);
		}
		this.type = type ? type : "POST";
		this.dataType = dataType ? dataType : "json";
		this.param = generateJSON(params);
		this.tableId = tableId;
		this.callbackSuccess = function(json) {
			var btnStr = makeBtnStr(insertUrl, excelUrl);
			if (btnStr != "") {
				var tableObj = document.getElementById(this.tableId);
				tableObj.insertAdjacentHTML("beforebegin", btnStr);
			}

			var theadObj = $("#" + this.tableId + " thead");
			var colInfos = new Array();

			theadObj.find('tr').each(function(key, val) {
				$(this).find('th').each(function(key, val) {
					colInfos[colInfos.length] = val.getAttribute("data-field");

				});
			});
			if (colInfos.length == 0) {
				alert("너 이샠히들 컬럼 정보 잘못짰어!!")
				return;
			}

			var tbodyStr = "";
			for (var i = 0, max = json.length; i < max; i++) {

				var row = json[i];

				tbodyStr += "<tr>";
				for (var j = 0, jMax = colInfos.length; j < jMax; j++) {
					tbodyStr += "<td>";
					var colName = colInfos[j];
					if (colName == "checkbox") {
						tbodyStr += "<input type='checkbox'>";
					} else if (updateUrl!=null && colName == colInfos[1]) {
						var url = updateUrl;
						tbodyStr += "<a onclick='pageMove(\"" + url +  "\",\"" + colName + "\",\"" + row[colName] + "\")'>" + row[colName] + "</a>";
						
					} else if (colName == "button") {
						tbodyStr += "<input type='button'>";
					} else {
						tbodyStr += row[colName];
					}
					tbodyStr += "</td>";
				}
				tbodyStr += "</tr>";
			}

			var tbodyObj = $("#" + this.tableId + " tbody");
			tbodyObj.html(tbodyStr);
		}

		this.setCallbackSuccess = function(callback) {
			this.callbackSuccess = callback;
		}

		this.send = function() {
			$.ajax({
				type : this.type,
				url : this.url,
				dataType : this.dataType,
				beforeSend : function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
					xhr.setRequestHeader("Content-Type",
							"application/json;charset=utf-8");
					xhr.setRequestHeader("AJAX", true);
				},
				data : this.param,
				success : this.callbackSuccess,
				error : function(xhr, status, e) {
					if (xhr.responseJSON) {
						var obj = xhr.responseJSON;
						alert(obj.url);
						alert(obj.msg);
						pageMove(obj.url);
					} else {
						alert("에러 : " + e);
					}
				},
				complete : function(e) {
				},
				tableId : this.tableId,
				insertUrl : insertUrl,
				excelUrl : excelUrl
			});
		}
	}
	
	
//updatelist AJAX 테스트

var AjaxUtilUpdateList = function(url, tableId, params, type, dataType) {
		if (!url) {
			alert("url정보가 없습니다.");
			return null;
		}
		this.url = "${rootPath}/" + url;
		var generateJSON = function(params) {
			if (!params)
				return "";
			var paramArr = params.split(",");
			var data = {};
			for (var i = 0, max = paramArr.length; i < max; i++) {
				var key = paramArr[i]
				if ($("#" + key).length > 1) {
					throw new JSException("동일 ID값이 존재함.");
				} else if ($("#" + key).length == 0) {
					throw new JSException(key + "에 해당하는 ID가 존재하지 않음.");
				}
				data[key] = $("#" + key).val();
			}
			return JSON.stringify(data);
		}
		this.type = type ? type : "POST";
		this.dataType = dataType ? dataType : "json";
		this.param = generateJSON(params);
		this.tableId = tableId;
		this.callbackSuccess = function(json) {

			var theadObj = $("#" + this.tableId + " thead");
			var colInfos = new Array();

			theadObj.find('tr').each(function(key, val) {
				$(this).find('th').each(function(key, val) {
					colInfos[colInfos.length] = val.getAttribute("data-field");

				});
			});
			if (colInfos.length == 0) {
				alert("너 이샠히들 컬럼 정보 잘못짰어!!")
				return;
			}

			var tbodyStr = "";
			for (var i = 0, max = json.length; i < max; i++) {

				var row = json[i];

				tbodyStr += "<tr>";
				for (var j = 0, jMax = colInfos.length; j < jMax; j++) {
					tbodyStr += "<td class= 'col-md-2'>";
					var colName = colInfos[j];
					if (colName == "checkbox") {
						tbodyStr += "<input type='checkbox'>";
					}else {
						tbodyStr += "<input type='text' class='form-control' value=" + row[colName] +">";
					}
					tbodyStr += "</td>";
				}
				tbodyStr += "</tr>";
			}

			var tbodyObj = $("#" + this.tableId + " tbody");
			tbodyObj.html(tbodyStr);
		}

		this.setCallbackSuccess = function(callback) {
			this.callbackSuccess = callback;
		}

		this.send = function() {
			$.ajax({
				type : this.type,
				url : this.url,
				dataType : this.dataType,
				beforeSend : function(xhr) {
					xhr.setRequestHeader("Accept", "application/json");
					xhr.setRequestHeader("Content-Type",
							"application/json;charset=utf-8");
					xhr.setRequestHeader("AJAX", true);
				},
				data : this.param,
				success : this.callbackSuccess,
				error : function(xhr, status, e) {
					if (xhr.responseJSON) {
						var obj = xhr.responseJSON;
						alert(obj.url);
						alert(obj.msg);
						pageMove(obj.url);
					} else {
						alert("에러 : " + e);
					}
				},
				complete : function(e) {
				},
				tableId : this.tableId,
			});
		}
	}
</script>