<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<ModAdvEntity>;
    int c = listItem != null ? listItem.Count : 0;
%>

<%if (c > 0)
    {%>
<ul class="list-link">
    <%for (int i = 0; listItem != null && i < listItem.Count; i++)
        { %>
    <%= Utils.GetCodeAdv(listItem[i])%>
    <%} %>
</ul>
<%} %>
