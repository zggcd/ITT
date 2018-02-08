<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var page = ViewPage.CurrentPage;
    var listItem = SysPageService.Instance.GetByParent_Cache(ViewPage.CurrentPage.ID);
    if (listItem == null || listItem.Count == 0)
    {
        page = SysPageService.Instance.GetByID_Cache(ViewPage.CurrentPage.ParentID);
        
        if (page.ParentID != 0)
            listItem = SysPageService.Instance.GetByParent_Cache(ViewPage.CurrentPage.ParentID);
        else
            page = ViewPage.CurrentPage;

    }
%>

<%if(page != null){ %>
<ul id="sub-menu"><%for (int i = 0; listItem != null && i < listItem.Count; i++ )
    {%>
        <li><a <%if(ViewPage.IsPageActived(listItem[i], 0)){ %> class="current" <%} %> href="<%=ViewPage.GetPageURL(listItem[i]) %>"><%=listItem[i].Name%></a></li>
    <%} %>
</ul>
<%} %>