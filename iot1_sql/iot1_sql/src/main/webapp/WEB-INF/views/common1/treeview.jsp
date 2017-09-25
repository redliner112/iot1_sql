<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="kendo" uri="http://www.kendoui.com/jsp/tags"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="demo-section k-content">
    <kendo:treeView name="treeview">
        <kendo:treeView-items>
        
                    <kendo:treeView-item text="about" spriteCssClass="folder" expanded="true" >
                    	 <kendo:treeView-items>
                            <kendo:treeView-item text="logo.png" spriteCssClass="image" />
                            <kendo:treeView-item text="body-back.png" spriteCssClass="image" />
                            <kendo:treeView-item text="my-photo.jpg" spriteCssClass="image" />
                        </kendo:treeView-items>
                    </kendo:treeView-item>
                    
            
            
             <kendo:treeView-item text="My Web Site1" spriteCssClass="folder" expanded="true">
                <kendo:treeView-items>
                    <kendo:treeView-item text="images" spriteCssClass="folder" expanded="true">
                        <kendo:treeView-items>
                            <kendo:treeView-item text="logo.png" spriteCssClass="image" />
                            <kendo:treeView-item text="body-back.png" spriteCssClass="image" />
                            <kendo:treeView-item text="my-photo.jpg" spriteCssClass="image" />
                        </kendo:treeView-items>
                    </kendo:treeView-item>
                    <kendo:treeView-item text="resources" spriteCssClass="folder" expanded="false">
                        <kendo:treeView-items>
                            <kendo:treeView-item text="pdf" spriteCssClass="folder" expanded="false">
                                
                            </kendo:treeView-item>
                            <kendo:treeView-item text="zip" spriteCssClass="folder" />
                        </kendo:treeView-items>
                    </kendo:treeView-item>
                   
                </kendo:treeView-items>
            </kendo:treeView-item>
            
            
        </kendo:treeView-items>
    </kendo:treeView>
</div>
    