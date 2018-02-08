<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    var model = ViewBag.Model as MSearchModel;

    var c = listItem != null ? listItem.Count : 0;
%>

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
</div>
