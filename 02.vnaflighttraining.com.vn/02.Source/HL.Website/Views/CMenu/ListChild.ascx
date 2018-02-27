<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var page = ViewBag.Page as SysPageEntity;
    var listItem = ViewBag.Data as List<SysPageEntity>;
    int c = listItem != null ? listItem.Count : 0;
%>

<div class="right-centerFTC portlet-column" id="column-4">
    <div class="portlet-dropzone portlet-column-content" id="layout-column_column-4">
        <div class="portlet-boundary portlet-boundary_56_ portlet-static portlet-static-end portlet-journal-content ">
            <div class="portlet-body">
                <section class="portlet">
                    <header class="portlet-topper">
                        <h1 class="portlet-title"><span>
                            <img class="icon" id="rjus" src="/Content/skins/theme/images/spacer.png" alt="Dịch vụ huấn luyện" title="Dịch vụ huấn luyện" style="background-image: url('/Content/skins/html/icons/_sprite.png'); background-position: 50% -496px; background-repeat: no-repeat; height: 16px; width: 16px;" />
                        </span><span class="portlet-title-text"><%=page.Name %></span> </h1>
                    </header>
                    <div class="portlet-content">
                        <div class=" portlet-content-container" style="">
                            <div class="portlet-body">
                                <div class="journal-content-article" id="article_10168_10194_21607_1.8">
                                    <%if (c > 0)
                                    {%>
                                    <ul class="lstDichVu">
                                        <%for (int i = 0; i < c; i++)
                                            {%>
                                        <li><a href="<%=ViewPage.GetPageURL(listItem[i]) %>"><%=listItem[i].Name %></a></li>
                                        <%} %>
                                    </ul>
                                    <%} %>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
            </div>
        </div>
    </div>
</div>


<%--<%if (page != null)
    { %>
<div id="current-menu">
    <span></span>
    <p><%=page.Name%></p>
    <ul>
        <%for (int i = 0; listItem != null && i < listItem.Count; i++)
            {%>
        <li <%if (i == listItem.Count - 1)
            { %> class="last" <%} %>><a <%if (ViewPage.IsPageActived(listItem[i], 0))
                                                                  { %> class="current" <%} %> href="<%=ViewPage.GetPageURL(listItem[i]) %>"><%=listItem[i].Name%></a></li>
        <%} %>
    </ul>
</div>
<%} %>--%>