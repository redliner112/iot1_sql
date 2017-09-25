<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div id="megaStore">
<kendo:menu name="Menu">
    <kendo:menu-items>
        <kendo:menu-item text="인사관리">
            <kendo:menu-items>
                <kendo:menu-item text="Furniture">
                </kendo:menu-item>
                <kendo:menu-item text="Decor">
                </kendo:menu-item>               
                <kendo:menu-item text="Storage">
                </kendo:menu-item>
                <kendo:menu-item text="Lights">
                </kendo:menu-item>
            </kendo:menu-items>        
        </kendo:menu-item>
        <kendo:menu-item text="재고관리">
		     <kendo:menu-items>
                <kendo:menu-item text="Furniture"/>
                <kendo:menu-item text="Furniture"/>
                <kendo:menu-item text="Furniture"/>
            </kendo:menu-items>
        </kendo:menu-item>
        <kendo:menu-item text="회계관리">
        	 <kendo:menu-items>
                <kendo:menu-item text="Furniture"/>
                <kendo:menu-item text="Furniture"/>
                <kendo:menu-item text="Furniture"/>
            </kendo:menu-items>
            </kendo:menu-item>
        <kendo:menu-item text="재무관리">
        		 <kendo:menu-items>
                <kendo:menu-item text="Furniture"/>
                <kendo:menu-item text="Furniture"/>
                <kendo:menu-item text="Furniture"/>
            </kendo:menu-items>
            </kendo:menu-item>
		<kendo:menu-item text="마이페이지">
			<kendo:menu-items>
				<kendo:menu-item text="Furniture" />
				<kendo:menu-item text="Furniture" />
				<kendo:menu-item text="Furniture" />
			</kendo:menu-items>
		</kendo:menu-item>
		<kendo:menu-item text="그룹웨어" >
        <kendo:menu-items>
                <kendo:menu-item text="Furniture"/>
                <kendo:menu-item text="Furniture"/>
                <kendo:menu-item text="Furniture"/>
            </kendo:menu-items>
        </kendo:menu-item>
    </kendo:menu-items>
</kendo:menu>
</div>
<style>
    #megaStore {
        width: 1900px;
        margin: 0px auto;
        padding-top: 60px;
    }
    #menu h2 {
        font-size: 1em;
        text-transform: uppercase;
        padding: 5px 10px;
    }
    #template img {
        margin: 5px 20px 0 0;
        float: left;
    }
    #template {
        width: 800px;
    }
    #template ol {
        float: left;
        margin: 0 0 0 30px;
        padding: 10px 10px 0 10px;
    }
    #template:after {
        content: ".";
        display: block;
        height: 0;
        clear: both;
        visibility: hidden;
    }
    #template .k-button {
        float: left;
        clear: left;
        margin: 5px 0 5px 12px;
    }
</style>
