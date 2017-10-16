<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModGopYEntity;
    var listOther = ViewBag.Other as List<ModGopYEntity>;
%>

<div class="title"><%= ViewPage.CurrentPage.Name %></div>

<div class="item">
    <p class="item-id">ID : <%= item.ID %></p>
    <p class="item-duthaoid">Du thao : <%= item.getDuThao().Name %></p>
    <p class="item-name">Tên : <%= item.Name %></p>
    <p class="item-address">Địa chỉ : <%= item.Address %></p>
    <p class="item-phone">Điện thoại : <%= item.Phone %></p>
    <p class="item-mobile">Di động : <%= item.Mobile %></p>
    <p class="item-email">Email : <%= item.Email %></p>
    <p class="item-title">Tiêu đề : <%= item.Title %></p>
    <p class="item-content">Nội dung : <%= item.Content %></p>
    <p class="item-file">Ảnh : <%= item.File %></p>
    <p class="item-ip">I p : <%= item.IP %></p>
    <p class="item-activity">Duyệt : <%= item.Activity ? "Có" : "Không" %></p>
</div>

<div class="list-other">
<%for(int i = 0; listOther != null && i < listOther.Count; i++)
{
string Url = ViewPage.GetURLCurrentPage(listOther[i].ID.ToString());%>
    <p class="list-other-name"><a href="<%=Url %>"><%= listOther[i].Name %></a></p>
    <p class="list-other-img"><a href="<%=Url %>">
                    <%if (!string.IsNullOrEmpty(listOther[i].File))
                      { %><img src="<%= Utils.GetResizeFile(listOther[i].File, 2, 100, 100)%>" alt="<%= listOther[i].Name %>" /><%} %></a></p>
<%}%>
</div>
