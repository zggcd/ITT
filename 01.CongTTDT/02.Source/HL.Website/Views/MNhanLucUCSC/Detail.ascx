<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModNhanLucUCSCEntity;
    var listOther = ViewBag.Other as List<ModNhanLucUCSCEntity>;
%>

<div class="title"><%= ViewPage.CurrentPage.Name %></div>

<div class="item">
    <p class="item-id">ID : <%= item.ID %></p>
    <p class="item-dondangkyucscid">Don dang ky u c s c : <%= item.getDonDangKyUCSC().Name %></p>
    <p class="item-name">Tên : <%= item.Name %></p>
    <p class="item-school">School : <%= item.School %></p>
    <p class="item-menuids_linhvucdt">Menu i ds_ linh vuc d t : <%= item.MenuIDs_LinhVucDT %></p>
    <p class="item-menuids_trinhdodt">Menu i ds_ trinh do d t : <%= item.MenuIDs_TrinhDoDT %></p>
    <p class="item-menuids_chungchi">Menu i ds_ chung chi : <%= item.MenuIDs_ChungChi %></p>
    <p class="item-menuids_quanlyattt">Menu i ds_ quan ly a t t t : <%= item.MenuIDs_QuanLyATTT %></p>
    <p class="item-menuids_kythuatphongthu">Menu i ds_ ky thuat phong thu : <%= item.MenuIDs_KyThuatPhongThu %></p>
    <p class="item-menuids_kythuatbaove">Menu i ds_ ky thuat bao ve : <%= item.MenuIDs_KyThuatBaoVe %></p>
    <p class="item-menuids_kythuatkiemtra">Menu i ds_ ky thuat kiem tra : <%= item.MenuIDs_KyThuatKiemTra %></p>
    <p class="item-thangtotnghiep">Thang tot nghiep : <%= string.Format("{0:#,##0}", item.ThangTotNghiep) %></p>
    <p class="item-namtotnghiep">Nam tot nghiep : <%= string.Format("{0:#,##0}", item.NamTotNghiep) %></p>
    <p class="item-activity">Duyệt : <%= item.Activity ? "Có" : "Không" %></p>
</div>

<div class="list-other">
<%for(int i = 0; listOther != null && i < listOther.Count; i++)
{
string Url = ViewPage.GetURLCurrentPage(listOther[i].ID.ToString());%>
    <p class="list-other-name"><a href="<%=Url %>"><%= listOther[i].Name %></a></p>
<%}%>
</div>
