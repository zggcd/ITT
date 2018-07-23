<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    var listItem1 = ViewBag.Data as List<ModNewsEntity>;
    int c1 = listItem1 != null ? listItem1.Count : 0;
    string title = ViewBag.Title;
    string url1 = ViewBag.Url1;

    var listItem2 = ViewBag.Data2 as List<ModNewsEntity>;
    int c2 = listItem2 != null ? listItem2.Count : 0;
    string title2 = ViewBag.Title2;
    string url2 = ViewBag.Url2;
%>

<div class="container">
    <div class="row-fluid">
        <div class="col-xs-12 col-sm-6 half p-0 mt-15">
            <div class="row-fluid titleContainer">
                <span><%=title %></span>
            </div>
            <%if (c1 > 0)
                {%>
            <div class="row-fluid contentNews">
                <%
                    for (int i = 0; i < c1; i++)
                    {%>
                <div>
                    <a href="<%=ViewPage.GetURL(listItem1[i].MenuID, listItem1[i].Code) %>" class="title"><%=listItem1[i].Name %></a>
                </div>
                <%if (!string.IsNullOrEmpty(listItem1[i].File))
                    {%>
                <div class="img-blog">
                    <img src="<%=listItem1[i].File.Replace("~/", "/") %>" alt="">
                </div>
                <%} %>
                <div class="des-blog">
                    <%if (listItem1[i].Summary.Length > 230)
                        {%><%=Utils.getSubString(listItem1[i].Summary, 230) %><%}
                    else
                    {%><%=listItem1[i].Summary %><%} %>
                </div>
                <div class="clear-20"></div>
                <%}%>
            </div>
            <%} %>
        </div>
        <div class="col-xs-12 col-sm-6 half p-0 mt-15">
            <div class="row-fluid titleContainer">
                <span><%=title2 %></span>
            </div>
            <%if (c2 > 0)
                {%>
            <div class="row-fluid contentNews">
                <%
                    for (int i = 0; i < c2; i++)
                    {%>
                <div>
                    <a href="<%=ViewPage.GetURL(listItem2[i].MenuID, listItem2[i].Code) %>" class="title"><%=listItem2[i].Name %></a>
                </div>
                <%if (!string.IsNullOrEmpty(listItem2[i].File))
                    {%>
                <div class="img-blog">
                    <img src="<%=listItem2[i].File.Replace("~/", "/") %>" alt="">
                </div>
                <%} %>
                <div class="des-blog">
                    <%if (listItem2[i].Summary.Length > 230)
                        {%><%=Utils.getSubString(listItem2[i].Summary, 230) %><%}
                    else
                    {%><%=listItem2[i].Summary %><%} %>
                </div>
                <div class="clear-20"></div>
                <%}%>
            </div>
            <%} %>
        </div>
    </div>
</div>
<div class="clear-20"></div>
