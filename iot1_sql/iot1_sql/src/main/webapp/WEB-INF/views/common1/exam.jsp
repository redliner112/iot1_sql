<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:set var="Treeview" value="/WEB-INF/views/topmenu/treeview.jsp" />

<title>IOT_SQL</title>
</head>

<body>
	<%@ include file="/WEB-INF/views/common1/topmenu.jsp"%>
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
										<c:import url="${Treeview}" />
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
			</kendo:splitter-panes>
	</kendo:splitter>
</body>
<style>
   *{margin:0; padding:0; border:none;}
   #tabstrip-parent,
    #tabstrip {
      height: 100%;
      margin: 0;
      padding: 0;
      border-width: 0;
    }
   body{font-family: 'Jeju Gothic', serif;}
   
   .container{
      width:100%;
      height:52px;
      background-color:#333;
      border-bottom:2px solid #3f9d8f;
   }      
   
    #vertical {
       position:relative;
       width:100%;
        height: 893px;       
        top:30px;
    }
    .k-splitbar{
        background-color:#3f9d8f;
        border-color:#3f9d8f;
    }
    #middle-pane { 
        color: #000; background-color: #fff; 
    }

    #bottom-pane { 
        color: #000; background-color: #fff; 
    }
    #left-pane{
       width:233px;
    }
    #left-pane .pane-content {
       width:100%; 
       border:none;
    }
    #toolbar {
        width:100%;
        background-color:#3f9d8f;
    }
    .k-button.k-state-active:hover, .k-button:active:hover{
       background-color:#42372e;
       box-shadow:inset 0 0 3px 1px #3b2f2a;
    }
    .k-button:focus:active:not(.k-state-disabled):not([disabled]){
       background-color:#42372e;
       box-shadow:inset 0 0 3px 1px #3b2f2a;
       
    }
    .k-state-selected.k-state-focused{
       background-color:#3f9d8f;
       box-shadow:inset 0 0 3px 1px #3d8b97;
       -webkit-box-shadow:inset 0 0 3px 1px #3d8b97;
       
    } 
    .k-state-selected{
       background-color:#3f9d8f;
       box-shadow:0 0 3px 1px  #3d8b97;
       -webkit-box-shadow:0 0 3px 1px #3d8b97;
    }
    .k-header.k-state-focused{
       background-color:#3d8b97;
       color:#fff;
    }
    .k-header .k-sorted .k-state-focused{
       border-color:#3d8b97;
    }    
    #btnConnect{
       position:relative;
       margin:6px 0 0 8px;
    } 
    
   
    .k-state-selected{
       border-color:#3d8b97;
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
    .k-grid-content{
       overflow:auto;
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
   #bottom-pane.k-pane{      
      background:#3f9d8f;         
      color:#fff;
      text-align:center;      
      border:none;
      font-size:12px;
      line-height:20px;
   }      
   .k-splitter .k-scrollable{
      overflow:hidden;
   }   
   #tabStrip > ul >li:last-child span{
      background:url("${imgUrl}pen.png")no-repeat center;
      text-indent:-9999px;
   }
   @media screen and (min-width: 768px){
      .navbar-nav{float:left;}
   }
   .k-tabstrip>.k-content{
      padding:0;
   }
   #tabStrip{
      background:#3f9d8f;      
      background-image:none,-webkit-gradient(linear,left top,left bottom,from(rgba(255,255,255,.6)),to(rgba(255,255,255,0)));
      background-image:none,linear-gradient(to bottom,rgba(255,255,255,.6) 0,rgba(255,255,255,0) 100%);
   }
   .k-grid-header th.k-header{
      background:#3f9d8f;      
   }
   
   #tabStrip-1{
      height:90%;
   }
   #tabStrip-2{
      height:90%;
   }
   .pane-content{
      height:100%;
   }
   .k-tabstrip-wrapper{
      height:100%;
   }
   .k-grid-content{
      overflow-x: auto;
         overflow-y: scroll;
   }
   .k-tabstrip>.k-content{
      overflow:hidden;
   }
   .weather{
      position:relative;
      width:100%;
      height:100%;
   }
   #tableInfoGrid{
      height:100%;
   }
   #btnRun{
      position:absolute;
      left:5px;      
      top:7px;
   }
   #queryToolbar{
      position:relative;
   }
   #query{
      position:absolute;
      left:0;   
      margin:10px;      
      width:98%;
      height:80%;
   }
   
   
</style>
</html>