<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<%@ page session="false"%>
<c:set var="dbTreeJsp" value="/WEB-INF/views/db/db_treeview.jsp" />
<c:set var="tabJsp" value="/WEB-INF/views/db/tab.jsp" />
<c:set var="tableInfoJsp" value="/WEB-INF/views/db/table_info.jsp" />
<c:url var="tableInfoUrl" value="/db/table/info" />


<title>IOT_SQL</title>
</head>
<script>
	var treeview;
	//e.keyCode에서 e가 브라우저인건 알겠는데 e.이 선언된곳이 어디? 
	//=>function(e) 에서 선언되어있는것. 브라우저에서 우리에게 찍어주는것.
	//sql은 내가 정의해놓은 변수인데 어떻게 .substr(key,value)함수가 나올수 있는것인가?
	//=> Stiring의 substr()함수(문자열을 자르는 함수)가 존제하고 (key,value)가 아니라 (시작점,끝점)이다.
	function onBound() {
		if (!treeview) {
			treeview = $('#treeview').data('kendoTreeView');
		}
	}
	$(document).ready(
			function() {
				$("#query").keydown(
						function(e) {
							var keyCode = e.keyCode || e.which;
							if (keyCode == 120) {
								var sql;
								var sqls;
								if (e.ctrlKey && keyCode == 120 && e.shiftKey) {
									sql = this.value;
									var cursor = this.selectionStart;
									var startSql = sql.substr(0, cursor);
									var startSap = startSql.lastIndexOf(";")
									startSql = startSql.substr(startSap+1);
									
									var endSql = sql.substr(cursor);
									var endSap = endSql.indexOf(";");
									if (endSap == -1) {
										endSap = sql.length;
									}
									endSql = endSql.substr(0, endSap);
									sql = startSql + endSql;
									
								} else if (e.ctrlKey && keyCode == 120) {
									sql = this.value.substr(
											this.selectionStart,
											this.selectionEnd
													- this.selectionStart);
								} else if (keyCode == 120) {
							
									sql = this.value;
									var sqlSap = sql.indexOf(";");
									if(sqlSap == -1){
										sqlSap = sql.length;
									}
									sql=sql.substr(0,sqlSap);
								}
								if (sql) {
									sql = sql.trim();
									sqls = sql.split(";");
									if (sqls.length == 1) {
										var au = new AjaxUtil("db/run/sql");
										var param = {};
										param["sql"] = sql;
										au.param = JSON.stringify(param);
										au.setCallbackSuccess(callbackSql);
										au.send();
										return;
									} else if (sqls) {
										return;
									}
								}

							}
						});
			})

	function callbackSql(result) {
		try{
		      // ID가 rsultGrid 곳을 초기화 시켜줌. 
		      $('#resultGrid').kendoGrid('destroy').empty();

		   }catch(e){
		      
		   }
		   
		   if(result.msg == "S")
		   {
		      var key = result.key;
		      var obj = result[key];
		      var gridData = obj.list;
		      var gridParam = {
		            dataSource : {
		               data : gridData,
		               pageSize : 5
		            },
		            editable : false,
		            sortable : true,
		            pageable : true
		      }
		      $("#sqlLog").append("성공하였습니다." + "</br>");
		      var grid = $("#resultGrid").kendoGrid(gridParam);
		   }
		   else
		   {
		      $("#sqlLog").append("실패하였습니다. 사유 : " + result.error + "</br>");
		   }
		}

	function treeSelect() {
		window.selectedNode = treeview.select();
		var data = treeview.dataItem(window.selectedNode);
		if (data.database && !data.hasChildren) {
			var au = new AjaxUtil("db/table/list");
			var param = {};
			param["database"] = data.database;
			au.param = JSON.stringify(param);
			au.setCallbackSuccess(callbackForTreeItem2);
			au.send();
		} else if (data.tableName) {
			var ki = new KendoItem(treeview, $("#tableInfoGrid"),
					"${tableInfoUrl}", "tableName");
			ki.send();
		}
	}

	function callbackForTreeItem2(result) {
		if (result.error) {
			alert(result.error);
			return;
		}
		for (var i = 0, max = result.tableList.length; i < max; i++) {
			var table = result.tableList[i];
			treeview.append({
				tableName : table.tableName
			}, treeview.select());
		}
	}

	function callbackForTreeItem(result) {
		if (result.error) {
			alert(result.error);
			return;
		}
		for (var i = 0, max = result.databaseList.length; i < max; i++) {
			var database = result.databaseList[i];
			treeview.append({
				database : database.database
			}, treeview.select());
		}
		$("#btnConnect").text("접속해제");
	}
	function toolbarEvent(e) {
		if ($("#btnConnect").text() == "접속해제") {
			treeview.dataSource.read();
			$("#btnConnect").text("접속")
			return;
		}
		var data = treeview.dataItem(window.selectedNode);
		if (data && data.diNum) {
			//$('#treeview>.k-group>.k-item>.k-group').remove();
			//treeview.dataSource.read();
			var au = new AjaxUtil("db/connecte");
			var param = {};
			param["diNum"] = data.diNum;
			au.param = JSON.stringify(param);
			au.setCallbackSuccess(callbackForTreeItem);
			au.send();
		} else {
			alert("접속하실 데이터베이스를 선택해주세요");
		}
	}
</script>
<body>
	<%@ include file="/WEB-INF/views/common/top_menu.jsp"%>
	<kendo:splitter name="vertical" orientation="vertical">
		<kendo:splitter-panes>


			<kendo:splitter-pane id="top-pane" collapsible="false">
				<kendo:splitter-pane-content>
					<kendo:splitter name="horizontal"
						style="height: 100%; width: 100%;">
						<kendo:splitter-panes>
							<kendo:splitter-pane id="left-pane" collapsible="true"
								size="220px">
								<kendo:splitter-pane-content>
									<div class="pane-content">
										<c:import url="${dbTreeJsp}" />
									</div>
								</kendo:splitter-pane-content>
							</kendo:splitter-pane>


							<kendo:splitter-pane id="center-pane" collapsible="false">
								<kendo:splitter-pane-content>
									<kendo:splitter name="vertical1" orientation="vertical"
										style="height: 100%; width: 100%;">
										<kendo:splitter-panes>
											<kendo:splitter-pane id="top-pane" collapsible="false">
												<div class="pane-content">
													<c:import url="${tabJsp}" />
												</div>
											</kendo:splitter-pane>
											<kendo:splitter-pane id="middle-pane" collapsible="true">
												<div class="pane-content">
													<div id="resultGrid" style="width: 100%"></div>
												</div>
											</kendo:splitter-pane>
										</kendo:splitter-panes>
									</kendo:splitter>
								</kendo:splitter-pane-content>
							</kendo:splitter-pane>
						</kendo:splitter-panes>
					</kendo:splitter>
				</kendo:splitter-pane-content>
			</kendo:splitter-pane>


			<kendo:splitter-pane id="middle-pane" collapsible="false"
				size="100px">
				<kendo:splitter-pane-content>
					<div class="pane-content">
							<div id="resultGrid" style="width: 100%"></div>
					</div>
				</kendo:splitter-pane-content>
			</kendo:splitter-pane>


			<kendo:splitter-pane id="bottom-pane" collapsible="false"
				resizable="false" size="20px" scrollable="false">
				<kendo:splitter-pane-content>
					<b>MySql Tool For Web</b>
				</kendo:splitter-pane-content>
			</kendo:splitter-pane>
		</kendo:splitter-panes>
	</kendo:splitter>
</body>
<style>
#vertical {
	height: 580px;
	margin: 0 auto;
}

#middle-pane {
	color: #000;
	background-color: #fff;
}

#bottom-pane {
	color: #000;
	background-color: #fff;
}

#left-pane, #center-pane, #right-pane {
	color: #000;
	background-color: #fff;
}

.pane-content {
	padding: 0 10px;
}

#toolbar {
	border-width: 0 0 1px;
}

.user-image {
	margin: 0 .5em;
}

#example {
	height: 500px;
}

#example .box p {
	padding-bottom: 5px;
}

#content .demo-section {
	margin: 0;
	padding: 10px;
	border-width: 0 0 1px 0;
}

#content .demo-section label {
	display: inline-block;
	width: 40px;
	text-align: right;
	line-height: 2.5em;
	vertical-align: middle;
}

#content .demo-section input {
	width: 80%;
}

.k-button>.k-toolbar-first-visible>.k-toolbar-last-visible {
	color: red;
}

a[class='k-link'], tr {
	text-align: center;
	color: blue;
}
</style>
</html>