<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModImportLogsEntity;
    var listOther = ViewBag.Other as List<ModImportLogsEntity>;
%>

<div class="title"><%= ViewPage.CurrentPage.Name %></div>

<div class="item">
    <p class="item-id">ID : <%= item.ID %></p>
    <p class="item-menuid">Chuyên mục : <%= item.getMenu().Name %></p>
    <p class="item-filename">File name : <%= item.FileName %></p>
    <p class="item-messages">Messages : <%= item.Messages %></p>
    <p class="item-errorrows">Error rows : <%= item.ErrorRows %></p>
    <p class="item-publish">Xuất bản : <%= string.Format("{0:dd/MM/yyyy HH:mm}", item.Publish) %></p>
</div>

<div class="list-other">
<%for(int i = 0; listOther != null && i < listOther.Count; i++)
{
string Url = ViewPage.GetURL(listOther[i].MenuID, listOther[i].ID);%>
<%}%>
</div>
