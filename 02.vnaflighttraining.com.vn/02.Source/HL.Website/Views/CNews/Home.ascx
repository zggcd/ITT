<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModNewsEntity>;
%>

<div class="box_new_l">
    <div class="title">
        <h2><%=ViewBag.Title%></h2>
    </div>
    <%for (int i = 0; listItem != null && i < listItem.Count && i < 1;i++ )
    {
        string Url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
        %>
    <div class="box-fix">
        <div class="kgs_title">
            <a href="<%=Url %>"><%=listItem[i].Name%></a>
        </div>
        <div>
            <%if (!string.IsNullOrEmpty(listItem[i].File))
              { %>
              <img class="stdo_img_new" src="<%=Utils.GetResizeFile(listItem[i].File, 2, 90, 80)%>" />
            <%} %>
        </div>
        <div class="stdo_content">
            <%=listItem[i].Summary%>
        </div>
    </div><%} %>
    <div class="list_box_new_l">
        <ul><%for (int i = 1; listItem != null && i < listItem.Count;i++ ){
        string Url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
        %>
            <li class="icon_c"><a href="<%=Url %>"><%=listItem[i].Name%></a></li><%} %>
        </ul>
    </div>
</div>