<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<ModAdvEntity>;
    var item = new ModAdvEntity();
    if (listItem != null)
    {
        item = listItem[0];
    }
%>

<%if (!string.IsNullOrEmpty(item.File))
    {%>
<a href="<%=item.URL %>">
    <img alt='<%=item.Name %>' title='<%=item.Name %>' src='<%=item.File.Replace("~/", "/") %>' class="img-responsive" style="width: 100%" />
</a>
<%} %>