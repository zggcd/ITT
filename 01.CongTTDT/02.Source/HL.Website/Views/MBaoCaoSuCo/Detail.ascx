<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModDonDangKyUCSCEntity;
    var listOther = ViewBag.Other as List<ModDonDangKyUCSCEntity>;
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
    <p class="item-tochuc_fax">To chuc_ fax : <%= item.ToChuc_Fax %></p>
    <p class="item-tochuc_email">To chuc_ email : <%= item.ToChuc_Email %></p>
    <p class="item-content">Nội dung : <%= item.Content %></p>
    <p class="item-hethongthongtinids">He thong thong tin i ds : <%= item.HeThongThongTinIDs %></p>
    <p class="item-file">Ảnh : <%= item.File %></p>
    <p class="item-thongtinll_web">Thong tin l l_ web : <%= item.ThongTinLL_Web %></p>
    <p class="item-thongtinll_thudt_ten">Thong tin l l_ thu d t_ ten : <%= item.ThongTinLL_ThuDT_Ten %></p>
    <p class="item-thongtinll_thudt_fingerprint">Thong tin l l_ thu d t_ fingerprint : <%= item.ThongTinLL_ThuDT_Fingerprint %></p>
    <p class="item-thongtinll_thudt_linktopublickey">Thong tin l l_ thu d t_ link to public key : <%= item.ThongTinLL_ThuDT_LinkToPublicKey %></p>
    <p class="item-daumoill_tronggio_ten">Dau moi l l_ trong gio_ ten : <%= item.DauMoiLL_TrongGio_Ten %></p>
    <p class="item-daumoill_tronggio_dienthoai">Dau moi l l_ trong gio_ dien thoai : <%= item.DauMoiLL_TrongGio_DienThoai %></p>
    <p class="item-daumoill_tronggio_dienthoaidd">Dau moi l l_ trong gio_ dien thoai d d : <%= item.DauMoiLL_TrongGio_DienThoaiDD %></p>
    <p class="item-daumoill_tronggio_fax">Dau moi l l_ trong gio_ fax : <%= item.DauMoiLL_TrongGio_Fax %></p>
    <p class="item-daumoill_ngoaigio_ten">Dau moi l l_ ngoai gio_ ten : <%= item.DauMoiLL_NgoaiGio_Ten %></p>
    <p class="item-daumoill_ngoaigio_dienthoai">Dau moi l l_ ngoai gio_ dien thoai : <%= item.DauMoiLL_NgoaiGio_DienThoai %></p>
    <p class="item-daumoill_ngoaigio_dienthoaidd">Dau moi l l_ ngoai gio_ dien thoai d d : <%= item.DauMoiLL_NgoaiGio_DienThoaiDD %></p>
    <p class="item-daumoill_ngoaigio_fax">Dau moi l l_ ngoai gio_ fax : <%= item.DauMoiLL_NgoaiGio_Fax %></p>
    <p class="item-daumoilanhdao_ten">Dau moi lanh dao_ ten : <%= item.DauMoiLanhDao_Ten %></p>
    <p class="item-daumoilanhdao_dienthoai">Dau moi lanh dao_ dien thoai : <%= item.DauMoiLanhDao_DienThoai %></p>
    <p class="item-daumoilanhdao_dienthoaidd">Dau moi lanh dao_ dien thoai d d : <%= item.DauMoiLanhDao_DienThoaiDD %></p>
    <p class="item-dcnhanthu_tenbophan">D c nhan thu_ ten bo phan : <%= item.DCNhanThu_TenBoPhan %></p>
    <p class="item-dcnhanthu_vitri">D c nhan thu_ vi tri : <%= item.DCNhanThu_ViTri %></p>
    <p class="item-dcnhanthu_tentochuc">D c nhan thu_ ten to chuc : <%= item.DCNhanThu_TenToChuc %></p>
    <p class="item-dcnhanthu_diachi">D c nhan thu_ dia chi : <%= item.DCNhanThu_DiaChi %></p>
    <p class="item-dcnhanthu_dienthoai">D c nhan thu_ dien thoai : <%= item.DCNhanThu_DienThoai %></p>
    <p class="item-llkhac_yahoo">L l khac_ yahoo : <%= item.LLKhac_Yahoo %></p>
    <p class="item-llkhac_skype">L l khac_ skype : <%= item.LLKhac_Skype %></p>
    <p class="item-llkhac_googletalk">L l khac_ google talk : <%= item.LLKhac_GoogleTalk %></p>
    <p class="item-llkhac_hotmail">L l khac_ hotmail : <%= item.LLKhac_Hotmail %></p>
    <p class="item-llkhac_khac">L l khac_ khac : <%= item.LLKhac_Khac %></p>
    <p class="item-published1">Published1 : <%= string.Format("{0:dd/MM/yyyy HH:mm}", item.Published1) %></p>
    <p class="item-activity">Duyệt : <%= item.Activity ? "Có" : "Không" %></p>
</div>

<div class="list-other">
<%for(int i = 0; listOther != null && i < listOther.Count; i++)
{
string Url = ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code);%>
    <p class="list-other-name"><a href="<%=Url %>"><%= listOther[i].Name %></a></p>
    <p class="list-other-img"><a href="<%=Url %>">
                    <%if (!string.IsNullOrEmpty(listOther[i].File))
                      { %><img src="<%= Utils.GetResizeFile(listOther[i].File, 2, 100, 100)%>" alt="<%= listOther[i].Name %>" /><%} %></a></p>
<%}%>
</div>
