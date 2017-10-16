<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl"%>

<%
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    var model = ViewBag.Model as MTagModel;
%>

<p class="link">
   <a href="/"><span>{RS:Web_HOME}</span></a><span>></span> 
   <%= Utils.GetMapPage(ViewPage.CurrentPage, "<span>></span>")%>
</p>

 <%for (int i = 0; listItem != null && i < listItem.Count; i++ )
  {string Url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code); %>
<div class="news-flash">
    <h4><a href="<%=Url %>"><%=listItem[i].Name%></a></h4>
    <%if (!string.IsNullOrEmpty(listItem[i].File))
    { %><a href="<%=Url %>"><img src="<%=Utils.GetResizeFile(listItem[i].File, 2, 194, 0)%>" alt="" /></a><%} %>
    <p><%=listItem[i].Summary%></p>
</div>
<p class="clear_10"></p>
<%} %>

<p id="page">
  <%= GetPagination(model.Page, model.PageSize, model.TotalRecord)%>
</p>
