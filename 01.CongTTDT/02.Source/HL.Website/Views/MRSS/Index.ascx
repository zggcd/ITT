﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModRSSEntity>;
    var model = ViewBag.Model as MRSSModel;
    int c = listItem != null ? listItem.Count : 0;

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
    <span><%=ViewPage.CurrentPage.Name %></span>
</div>
<div class="row-fluid contentNews">
    <%for (int i = 0; i < c; i++)
        {%>
    <div class="titleCate">
        <a href="<%=ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code) %>" class="title"><%=listItem[i].Name %></a>
    </div>
    <%if (!string.IsNullOrEmpty(listItem[i].File))
        {%>
    <div class="img-blog">
        <img src="<%=listItem[i].File.Replace("~/", "/") %>" alt="">
    </div>
    <%} %>
    <div class="des-blog">
        <%if (listItem[i].Summary.Length > 800)
            {%><%=Utils.getSubString(listItem[i].Summary, 800) %><%}
                                                                      else
                                                                      {%><%=listItem[i].Summary %><%} %>
    </div>
    <div class="clear-20"></div>
    <%} %>
</div>

<%--<div class="navigation">
  <%= GetPagination(model.Page, model.PageSize, model.TotalRecord)%>
</div>--%>
