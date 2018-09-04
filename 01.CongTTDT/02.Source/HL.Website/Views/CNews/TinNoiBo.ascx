<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.TinNoiBo as List<ModNewsEntity>;
    int c = listItem != null ? listItem.Count : 0;
    string title = ViewBag.Title;
    string url = ViewBag.Url1;
%>


<div class="container mt-15">
    <div class="row-fluid titleContainer">
        <span><%=title %></span>
    </div>
    <div class="row-fluid contentNews">
        <%if (c > 0)
            {
                for (int i = 0; i < c; i++)
                {%>
        <div>
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
        <%} %>
    </div>
</div>
<div class="clear-20"></div>
