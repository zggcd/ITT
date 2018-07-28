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
                    {
                        string href = listItem[i].URL;
                        string down = string.Empty;
                        if (!string.IsNullOrEmpty(listItem[i].LinkFile))
                        {
                            href = listItem[i].LinkFile.Replace("~/", "/");
                                down = "download";
                        }%>
                <li><a href="<%=href %>" <%=down %>>- <%=listItem[i].Name %></a></li>
                <%} %>
            </ul>
            <%} %>
        </div>
    </div>
</div>
