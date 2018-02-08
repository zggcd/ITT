<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModNewsEntity;
%>

<h1 class="w3-center"><%=item.Name%></h1>
<div class="w3-center w3-large"><%=item.Summary%></div>
<div class="w3-row-padding" style="margin-top: 64px">
    <%=item.Content%>
</div>

<%--<p class="link">
    <a href="/"><span>{RS:Web_HOME}</span></a><span>></span>
    <%= Utils.GetMapPage(ViewPage.CurrentPage, "<span>></span>")%>
</p>
<div id="details">
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
<p class="clear_20"></p>--%>
