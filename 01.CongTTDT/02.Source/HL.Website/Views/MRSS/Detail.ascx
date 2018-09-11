<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModRSSEntity;
    var listOther = ViewBag.Other as List<ModRSSEntity>;
    int c = listOther != null ? listOther.Count : 0;
    int i = 0;

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

    int menuId = ViewPage.CurrentPage.MenuID;
%>

<div class="row-fluid titleContainer">
    <span><%=item.Name %></span>
    <span class="pull-right"><%=string.Format("{0:dd/MM/yyyy HH:mm:ss}", item.Published) %></span>
</div>
<div class="row-fluid contentNews">
    <div>
        <%=item.Content %>
        <hr>
    </div>

    <%if (c > 0)
        {%>
    <div class="sameCate">
        <p>Bài cùng chuyên mục:</p>
        <ul class="list-unstyled">
            <%for (i = 0; i < c; i++)
                {%>
            <li><a href="<%=ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code) %>">- <%=listOther[i].Name %></a> (<%=string.Format("{0:dd/MM/yyyy}", listOther[i].Published) %>)</li>
            <%} %>
        </ul>
    </div>
    <%} %>
</div>
