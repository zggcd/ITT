<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModBaoCaoTongHopEntity;
    var listOther = ViewBag.Other as List<ModBaoCaoTongHopEntity>;
%>

<div class="title"><%= ViewPage.CurrentPage.Name %></div>

<div class="item">
    <p class="item-id">ID : <%= item.ID %></p>
    <p class="item-userid">User : <%= item.getUser().Name %></p>
    <p class="item-userid1">User i d1 : <%= string.Format("{0:#,##0}", item.UserID1) %></p>
    <p class="item-menuid">Chuyên mục : <%= item.getMenu().Name %></p>
    <p class="item-state">Vị trí : <%= string.Format("{0:#,##0}", item.State) %></p>
    <p class="item-name">Tên : <%= item.Name %></p>
    <p class="item-code">Mã : <%= item.Code %></p>
    <p class="item-tungay">Tu ngay : <%= string.Format("{0:dd/MM/yyyy HH:mm}", item.TuNgay) %></p>
    <p class="item-denngay">Den ngay : <%= string.Format("{0:dd/MM/yyyy HH:mm}", item.DenNgay) %></p>
    <p class="item-tentochuc">Ten to chuc : <%= item.TenToChuc %></p>
    <p class="item-diachi">Dia chi : <%= item.DiaChi %></p>
    <p class="item-mathanhvien">Ma thanh vien : <%= item.MaThanhVien %></p>
    <p class="item-tochuchotro">To chuc ho tro : <%= item.ToChucHoTro %></p>
    <p class="item-tochucnuocngoaihotro">To chuc nuoc ngoai ho tro : <%= item.ToChucNuocNgoaiHoTro %></p>
    <p class="item-dexuat">De xuat : <%= item.DeXuat %></p>
    <p class="item-published1">Published1 : <%= string.Format("{0:dd/MM/yyyy HH:mm}", item.Published1) %></p>
    <p class="item-activity">Duyệt : <%= item.Activity ? "Có" : "Không" %></p>
</div>

<div class="list-other">
<%for(int i = 0; listOther != null && i < listOther.Count; i++)
{
string Url = ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code);%>
    <p class="list-other-name"><a href="<%=Url %>"><%= listOther[i].Name %></a></p>
<%}%>
</div>
