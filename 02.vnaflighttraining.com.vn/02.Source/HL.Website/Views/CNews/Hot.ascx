<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    int c = listItem != null ? listItem.Count : 0;
    string title = ViewBag.Title;
%>

<div class="left-centerFTC portlet-column" id="column-3">
    <div class="portlet-dropzone portlet-column-content" id="layout-column_column-3">
        <div id="p_p_id_101_INSTANCE_vv2yaIMmBgqq_" class="portlet-boundary portlet-boundary_101_ portlet-static portlet-static-end portlet-asset-publisher Pst-left">
            <span id="p_101_INSTANCE_vv2yaIMmBgqq"></span>
            <div class="portlet-body">
                <section class="portlet" id="portlet_101_INSTANCE_vv2yaIMmBgqq">
                    <header class="portlet-topper">
                        <h1 class="portlet-title"><span>
                            <img class="icon" id="rvno" src="/Content/skins/theme/images/spacer.png" alt="<%=title %>" title="<%=title %>" style="background-image: url('/Content/skins/html/icons/_sprite.png'); background-position: 50% -112px; background-repeat: no-repeat; height: 16px; width: 16px;" />
                        </span><span class="portlet-title-text"><%=title %></span> </h1>
                    </header>
                    <div class="portlet-content">
                        <div class=" portlet-content-container" style="">
                            <div class="portlet-body">
                                <div class="boxlistAll">
                                    <div class="boxlistLeft abstracts_s4">
                                        <%if (c > 0)
                                            {%>
                                        <ul>
                                            <%for (int i = 0; i < c; i++)
                                                {
                                                    string href = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);%>
                                            <li class="newsimg">
                                                <a class="asset-small-image" href="<%=href %>">
                                                    <%if (!string.IsNullOrEmpty(listItem[i].File))
                                                        {%>
                                                    <img src="<%=listItem[i].File.Replace("~/", "/") %>" />
                                                    <%} %>
                                                </a>
                                                <h2><a href="<%=href %>"><%=listItem[i].Name %></a></h2>
                                                <%=listItem[i].Summary %>
                                            </li>
                                            <%} %>
                                        </ul>
                                        <%} %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>
