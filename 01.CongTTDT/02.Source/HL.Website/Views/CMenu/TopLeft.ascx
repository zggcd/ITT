<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
    var c = listItem != null ? listItem.Count : 0;
    var PageExt = HL.Core.Global.Config.GetValue("Sys.PageExt").ToString();
    string langCode = "", urlHome = "/";
    if (ViewPage.CurrentLang.ID == 1)
    {
        langCode = "vn";
    }
    else if (ViewPage.CurrentLang.ID == 2)
    {
        langCode = "en";
        urlHome = "/en/Home.aspx";
    }
    else if (ViewPage.CurrentLang.ID == 3)
    {
        langCode = "cn";
        urlHome = "/cn/Home.aspx";
    }
%>

<ul class="menu-left fl">
    <li><a href="<%=urlHome %>"><span class="fa fa-home"></span></a></li>
    <%for (int i = 0; i < c; i++)
        {
            var href = ViewPage.GetPageURL(listItem[i]);
            string type = MyClass.GetCusTomPage("TYPE", listItem[i].Custom);
            string target = "";
            if (type == "HTTP")
            {
                href = listItem[i].Code;
                target = "_blank";
            }
    %>
    <li><a href="<%=href %>" title="<%=listItem[i].Name %>" target="<%=target %>"><%=listItem[i].Name %></a></li>
    <%} %>
</ul>
