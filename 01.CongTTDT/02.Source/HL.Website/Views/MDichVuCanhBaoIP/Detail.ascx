<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModDichVuCanhBaoIPEntity;
    var listOther = ViewBag.Other as List<ModDichVuCanhBaoIPEntity>;
%>

<div class="title"><%= ViewPage.CurrentPage.Name %></div>

<div class="item">
    <p class="item-id">ID : <%= item.ID %></p>
    <p class="item-dichvucanhbaoid">Dich vu canh bao : <%= item.getDichVuCanhBao().Name %></p>
    <p class="item-userid">User : <%= item.getUser().Name %></p>
    <p class="item-userid1">User i d1 : <%= string.Format("{0:#,##0}", item.UserID1) %></p>
    <p class="item-menuid">Chuyên mục : <%= item.getMenu().Name %></p>
    <p class="item-name">Tên : <%= item.Name %></p>
    <p class="item-published1">Published1 : <%= string.Format("{0:dd/MM/yyyy HH:mm}", item.Published1) %></p>
    <p class="item-activity">Duyệt : <%= item.Activity ? "Có" : "Không" %></p>
</div>

<div class="list-other">
<%for(int i = 0; listOther != null && i < listOther.Count; i++)
{
string Url = ViewPage.GetURL(listOther[i].MenuID, listOther[i].ID);%>
    <p class="list-other-name"><a href="<%=Url %>"><%= listOther[i].Name %></a></p>
<%}%>
</div>
