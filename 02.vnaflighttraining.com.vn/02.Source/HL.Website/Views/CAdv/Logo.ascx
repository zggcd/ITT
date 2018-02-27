<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% var listItem = ViewBag.Data as List<ModAdvEntity>; %>

<%if (listItem != null && listItem.Count > 0)
    {%>
<div id="heading">
    <h1 class="site-title">
        <a class="logo custom-logo" href="<%=listItem[0].URL %>" title="<%=listItem[0].Name %>">
            <img alt="<%=listItem[0].Name %>" src="<%=listItem[0].File.Replace("~/", "/") %>" class="img-fluid" />
        </a>
    </h1>
</div>
<%} %>
