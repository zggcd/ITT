<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModBaoCaoKetThucSuCoEntity;
    var listOther = ViewBag.Other as List<ModBaoCaoKetThucSuCoEntity>;
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
    <p class="item-tochuc_ten">To chuc_ ten : <%= item.ToChuc_Ten %></p>
    <p class="item-tochuc_diachi">To chuc_ dia chi : <%= item.ToChuc_DiaChi %></p>
    <p class="item-tochuc_dienthoai">To chuc_ dien thoai : <%= item.ToChuc_DienThoai %></p>
    <p class="item-tochuc_email">To chuc_ email : <%= item.ToChuc_Email %></p>
    <p class="item-sokyhieu">So ky hieu : <%= item.SoKyHieu %></p>
    <p class="item-ngaybaocao">Ngay bao cao : <%= string.Format("{0:dd/MM/yyyy HH:mm}", item.NgayBaoCao) %></p>
    <p class="item-chitiet_tendonvi">Chi tiet_ ten don vi : <%= item.ChiTiet_TenDonVi %></p>
    <p class="item-chitiet_coquan">Chi tiet_ co quan : <%= item.ChiTiet_CoQuan %></p>
    <p class="item-chitiet_tenhethong">Chi tiet_ ten he thong : <%= item.ChiTiet_TenHeThong %></p>
    <p class="item-chitiet_phanloaiid">Chi tiet_ phan loai : <%= item.getChiTiet_PhanLoai().Name %></p>
    <p class="item-summary">Tóm tắt : <%= item.Summary %></p>
    <p class="item-ngaygiophathien">Ngay gio phat hien : <%= string.Format("{0:dd/MM/yyyy HH:mm}", item.NgayGioPhatHien) %></p>
    <p class="item-ketqua">Ket qua : <%= item.KetQua %></p>
    <p class="item-files">Files : <%= item.Files %></p>
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
