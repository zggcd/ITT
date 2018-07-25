<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<ModAdvEntity>;
    int c = listItem != null ? listItem.Count : 0;
    string title = ViewBag.Title as string;
    int i = 0;
%>

<div class="mt-15">
    <div class="row-fluid titleContainer">
        <span><%=title %></span>
    </div>
    <div class="row-fluid contentNews">
        <div class="sameCate">
            <%if (c > 0)
                {%>
            <ul class="list-unstyled">
                <%for (i = 0; i < c; i++)
                    {%>
                <li><a href="<%=listItem[i].URL %>">- <%=listItem[i].Name %></a></li>
                <%} %>
            </ul>
            <%} %>
        </div>
    </div>
</div>
