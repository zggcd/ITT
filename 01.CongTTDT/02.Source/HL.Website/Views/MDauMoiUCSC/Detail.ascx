<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModDauMoiUCSCEntity;
    var listOther = ViewBag.Other as List<ModDauMoiUCSCEntity>;
%>

<div class="title"><%= ViewPage.CurrentPage.Name %></div>

<div class="item">
    <p class="item-id">ID : <%= item.ID %></p>
    <p class="item-menuid">Chuyên mục : <%= item.getMenu().Name %></p>
    <p class="item-state">Vị trí : <%= string.Format("{0:#,##0}", item.State) %></p>
    <p class="item-name">Tên : <%= item.Name %></p>
    <p class="item-code">Mã : <%= item.Code %></p>
    <p class="item-chucvu">Chuc vu : <%= item.ChucVu %></p>
    <p class="item-diachi">Dia chi : <%= item.DiaChi %></p>
    <p class="item-dienthoai">Dien thoai : <%= item.DienThoai %></p>
    <p class="item-dienthoaidd">Dien thoai d d : <%= item.DienThoaiDD %></p>
    <p class="item-fax">Fax : <%= item.Fax %></p>
    <p class="item-email">Email : <%= item.Email %></p>
    <p class="item-activity">Duyệt : <%= item.Activity ? "Có" : "Không" %></p>
</div>

<div class="list-other">
<%for(int i = 0; listOther != null && i < listOther.Count; i++)
{
string Url = ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code);%>
    <p class="list-other-name"><a href="<%=Url %>"><%= listOther[i].Name %></a></p>
<%}%>
</div>
