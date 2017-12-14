<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModBaoCaoBanDauSuCoEntity;
    var listOther = ViewBag.Other as List<ModBaoCaoBanDauSuCoEntity>;
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
    <p class="item-nguoilienhe_ten">Nguoi lien he_ ten : <%= item.NguoiLienHe_Ten %></p>
    <p class="item-nguoilienhe_chucvu">Nguoi lien he_ chuc vu : <%= item.NguoiLienHe_ChucVu %></p>
    <p class="item-nguoilienhe_dienthoai">Nguoi lien he_ dien thoai : <%= item.NguoiLienHe_DienThoai %></p>
    <p class="item-nguoilienhe_email">Nguoi lien he_ email : <%= item.NguoiLienHe_Email %></p>
    <p class="item-chitiet_tendonvi">Chi tiet_ ten don vi : <%= item.ChiTiet_TenDonVi %></p>
    <p class="item-chitiet_coquan">Chi tiet_ co quan : <%= item.ChiTiet_CoQuan %></p>
    <p class="item-chitiet_tenhethong">Chi tiet_ ten he thong : <%= item.ChiTiet_TenHeThong %></p>
    <p class="item-chitiet_phanloaiid">Chi tiet_ phan loai : <%= item.getChiTiet_PhanLoai().Name %></p>
    <p class="item-chitiet_tentochuccungcap">Chi tiet_ ten to chuc cung cap : <%= item.ChiTiet_TenToChucCungCap %></p>
    <p class="item-chitiet_tenncc_benngoai">Chi tiet_ ten n c c_ ben ngoai : <%= item.ChiTiet_TenNCC_BenNgoai %></p>
    <p class="item-chitiet_tenncc">Chi tiet_ ten n c c : <%= item.ChiTiet_TenNCC %></p>
    <p class="item-chitiet_mota">Chi tiet_ mo ta : <%= item.ChiTiet_MoTa %></p>
    <p class="item-chitiet_ngaygiophathien">Chi tiet_ ngay gio phat hien : <%= string.Format("{0:dd/MM/yyyy HH:mm}", item.ChiTiet_NgayGioPhatHien) %></p>
    <p class="item-hientrangid">Hien trang : <%= item.getHienTrang().Name %></p>
    <p class="item-ttthem_hedieuhanh">T t them_ he dieu hanh : <%= item.TTThem_HeDieuHanh %></p>
    <p class="item-ttthem_version">T t them_ version : <%= item.TTThem_Version %></p>
    <p class="item-ttthem_danhsachip">T t them_ danh sach i p : <%= item.TTThem_DanhSachIP %></p>
    <p class="item-ttthem_danhsachtenmien">T t them_ danh sach ten mien : <%= item.TTThem_DanhSachTenMien %></p>
    <p class="item-ttthem_mucdichsudung">T t them_ muc dich su dung : <%= item.TTThem_MucDichSuDung %></p>
    <p class="item-content">Nội dung : <%= item.Content %></p>
    <p class="item-thoigianthuchien">Thoi gian thuc hien : <%= string.Format("{0:dd/MM/yyyy HH:mm}", item.ThoiGianThucHien) %></p>
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
