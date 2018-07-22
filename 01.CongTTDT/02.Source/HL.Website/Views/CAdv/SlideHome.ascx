<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<ModAdvEntity>;
    int c = listItem != null ? listItem.Count : 0;
    int i = 0;
%>

<%if (c > 0)
    {%>
<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <%for (i = 0; i < c; i++)
            {%>
        <li data-target="#carousel-example-generic" data-slide-to="<%=i %>" class="<%if (i == 0)
            {%>active<%} %>"></li>
        <%} %>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <%for (i = 0; i < c; i++)
            {%>
        <div class="item <%if (i == 0)
            {%>active<%} %>">
            <img src="<%=listItem[i].File.Replace("~/", "/") %>">
        </div>
        <%} %>
    </div>
    <!-- Controls -->
</div>
<%} %>
