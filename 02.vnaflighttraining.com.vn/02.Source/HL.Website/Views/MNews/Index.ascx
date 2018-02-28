<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    var model = ViewBag.Model as MNewsModel;

    var c = listItem != null ? listItem.Count : 0;
%>

<%if (c > 0)
    {%>
<section class="portlet">
    <header class="portlet-topper">
        <h1 class="portlet-title"><span class="portlet-title-text"><%=ViewPage.CurrentPage.Name %></span></h1>
    </header>
    <div class="portlet-content">
        <div class=" portlet-content-container" style="">
            <div class="portlet-body">
                <div class="boxlistAll">
                    <ul style="list-style: none; padding: 0; margin: 0;">
                        <%for (int i = 0; i < c; i++)
                            {
                                string href = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
                        %>
                        <li class="lst_shownews">
                            <a href="<%=href %>">
                                <%if (!string.IsNullOrEmpty(listItem[i].File))
                                    {%>
                                <img alt="" class="img-fluid asset-small-image" src="<%=listItem[i].File.Replace("~/", "/") %>">
                                <%} %>
                            </a>
                            <h3 class="asset-shownews-title"><span class="asset-title-pad"><a href="<%=href %>"><%=listItem[i].Name %></a></span></h3>
                            <h3 class="dateupdate">Cập nhật ngày <span class="metadata-entry "><%=string.Format("{0:dd/MM/yyyy}", listItem[i].Published) %></span></h3>
                            <%=listItem[i].Summary %>
                        </li>
                        <%} %>
                    </ul>
                </div>
                <%= GetPagination(model.Page, model.PageSize, model.TotalRecord)%>
            </div>
        </div>
    </div>
</section>
<input type="hidden" value="<%= Utils.GetMapPage(ViewPage.CurrentPage, "", "")%>" id="TpmBreadCrumbs" />
<script>
    $(document).ready(function () {
        $('#AutoGenBreadcrumbs').after($('#TpmBreadCrumbs').val());
    });
</script>
<%} %>

<%--
<div class="container-fluid">
    <nav class="breadcrumb">
        <a class="breadcrumb-item" href="/">{RS:Web_HOME}</a>
        <%= Utils.GetMapPage(ViewPage.CurrentPage, "", "breadcrumb-item")%>
    </nav>

    <ul class="list-unstyled">
        <%for (int i = 0; i < c; i++)
            {
                string Url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code); %>
        <li class="media">
            <%if (!string.IsNullOrEmpty(listItem[i].File))
                { %>
            <img class="d-flex mr-3" src="<%=Utils.GetResizeFile(listItem[i].File, 2, 194, 0)%>" alt="">
            <%} %>
            <div class="media-body">
                <h5 class="mt-0 mb-1"><a href="<%=Url %>" title=""><%=listItem[i].Name%></a></h5>
                <%=listItem[i].Summary%>
            </div>
        </li>
        <%} %>
    </ul>

    <%= GetPagination(model.Page, model.PageSize, model.TotalRecord)%>
</div>--%>
