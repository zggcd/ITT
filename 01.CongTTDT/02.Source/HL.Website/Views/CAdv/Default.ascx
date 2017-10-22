<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% var listItem = ViewBag.Data as List<ModAdvEntity>; %>

<div class="banner mb10">
    <%for (int i = 0; listItem != null && i < listItem.Count; i++)
        { %>
    <%= Utils.GetCodeAdv(listItem[i])%>
    <%} %>
</div>
