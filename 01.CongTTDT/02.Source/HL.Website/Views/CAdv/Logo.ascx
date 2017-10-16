<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<ModAdvEntity>;
    var item = new ModAdvEntity();
    if (listItem != null)
    {
        item = listItem[0];
    }
    %>

<div id="banner_header">
    <div class="img-banner">
        <a href='<%=item.URL %>'>
            <%if (!string.IsNullOrEmpty(item.File))
                {%>
            <img alt='<%=item.Name %>' title='<%=item.Name %>' src='<%=item.File.Replace("~/", "/") %>' />
            <%} %>
        </a>
    </div>
</div>