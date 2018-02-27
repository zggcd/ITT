<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% var listItem = ViewBag.Data as List<ModAdvEntity>;
    int c = listItem != null ? listItem.Count : 0;%>

<div class="row">
    <div class="col">
        <div class="d-none d-md-block TopsFTC portlet-column" id="column-6">
            <div class="portlet-dropzone portlet-column-content" id="layout-column_column-6">
                <div class="portlet-boundary portlet-boundary_101_ portlet-static portlet-static-end portlet-borderless portlet-asset-publisher ">
                    <div class="portlet-body">
                        <div class="portlet-borderless-container" style="">
                            <div class="portlet-body">
                                <div class="boxlistAll">
                                    <div id="slider" class="owl-carousel owl-theme" style="border: 3px solid #fff;">
                                        <%for (int i = 0; i < c; i++)
                                            { %>
                                        <div class="item">
                                            <img src="<%=listItem[i].File.Replace("~/", "/") %>">
                                        </div>
                                        <%} %>
                                    </div>
                                    <div class="subscribe"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
