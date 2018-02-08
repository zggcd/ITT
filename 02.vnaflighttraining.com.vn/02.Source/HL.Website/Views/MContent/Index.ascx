<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModNewsEntity;
%>

<div class="container-fluid">
    <nav class="breadcrumb">
        <a class="breadcrumb-item" href="/">{RS:Web_HOME}</a>
        <%= Utils.GetMapPage(ViewPage.CurrentPage, "", "breadcrumb-item")%>
    </nav>

    <%if (item != null)
        { %>

    <%=item.Content%>

    <p>
        Tags : 
       <% if (!string.IsNullOrEmpty(item.Tags))
           {
               string[] ArrTag = item.Tags.Split(',');%>
        <%for (int i = 0; i < ArrTag.Length; i++)
            {
                ArrTag[i] = ArrTag[i].Trim();%>
        <%if (i > 0)
            { %> , <%} %>
        <a href="<%= ViewPage.GetURL("Tag", Data.GetCode(ArrTag[i])) %>" title="<%= ArrTag[i] %>"><%= ArrTag[i]%></a>
        <%} %>
        <%} %>
    </p>

    <%} %>
</div>
