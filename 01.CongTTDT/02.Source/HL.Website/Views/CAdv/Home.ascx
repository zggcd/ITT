<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% var listItem = ViewBag.Data as List<ModAdvEntity>; %>

<div id="home">
<%for (int i = 0; listItem != null && i < listItem.Count; i++ )
{ %><div class="home-box">
        <h6><a href="<%=listItem[i].URL%>"><%=listItem[i].Name%></a></h6>
        <p class="home-link"><%= Utils.GetCodeAdv(listItem[i])%></p></div>
<%} %></div>