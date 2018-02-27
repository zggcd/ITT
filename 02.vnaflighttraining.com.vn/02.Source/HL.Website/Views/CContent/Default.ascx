<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    var item = ViewBag.Data as ModNewsEntity;
    string title = ViewBag.Title;
%>

<h2><%=title %></h2>
<%=item.Summary %> <a href="<%=ViewPage.GetURL(item.MenuID, item.Code) %>">Chi tiết </a>