<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl"%>

<%
    var listItem = ViewBag.Data as List<ModImportLogsEntity>;
    var model = ViewBag.Model as MImportLogsModel;
%>

<div class="title"><%= ViewPage.CurrentPage.Name %></div>

<div class="list">
<%for(int i = 0; listItem != null && i < listItem.Count; i++)
{
string Url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].ID);%>
<%}%>
</div>

<div class="navigation">
  <%= GetPagination(model.Page, model.PageSize, model.TotalRecord)%>
</div>
