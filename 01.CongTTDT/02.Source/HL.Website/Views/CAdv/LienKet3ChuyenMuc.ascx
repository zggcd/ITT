<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<ModAdvEntity>;
    int c = listItem != null ? listItem.Count : 0;

    var listItem2 = ViewBag.Data2 as List<ModAdvEntity>;
    int c2 = listItem2 != null ? listItem2.Count : 0;

    var listItem3 = ViewBag.Data3 as List<ModAdvEntity>;
    int c3 = listItem3 != null ? listItem3.Count : 0;

    string title = ViewBag.Title as string;
    string title1 = ViewBag.Title as string;
    string title2 = ViewBag.Title2 as string;
    string title3 = ViewBag.Title3 as string;

    int i = 0;
%>

<div class="mt-15">
    <div class="row-fluid titleContainer">
        <span><%=title %></span>
    </div>
    <div class="row contentNews">
        <div class="col-xs-12 col-sm-4">
            <span class="titleContentNews"><%=title1 %></span>
            <div>
                <%if (c > 0)
                    {%>
                <ul class="pull-left list-unstyled">
                    <%for (i = 0; i < c; i++)
                        {%>
                    <li><a href="<%=listItem[i].URL %>">- <%=listItem[i].Name %></a></li>
                    <%} %>
                </ul>
                <%} %>
            </div>
        </div>
        <div class="col-xs-12 col-sm-4">
            <span class="titleContentNews"><%=title2 %></span>
            <div>
                <%if (c2 > 0)
                    {%>
                <ul class="pull-left list-unstyled">
                    <%for (i = 0; i < c2; i++)
                        {%>
                    <li><a href="<%=listItem2[i].URL %>">- <%=listItem2[i].Name %></a></li>
                    <%} %>
                </ul>
                <%} %>
            </div>
        </div>
        <div class="col-xs-12 col-sm-4">
            <span class="titleContentNews"><%=title3 %></span>
            <div>
                <%if (c3 > 0)
                    {%>
                <ul class="pull-left list-unstyled">
                    <%for (i = 0; i < c3; i++)
                        {%>
                    <li><a href="<%=listItem3[i].URL %>">- <%=listItem3[i].Name %></a></li>
                    <%} %>
                </ul>
                <%} %>
            </div>
        </div>
    </div>
</div>
