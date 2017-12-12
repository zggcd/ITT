<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModHSThanhVienUCSCEntity;
    var listOther = ViewBag.Other as List<ModHSThanhVienUCSCEntity>;
%>

<div class="title"><%= ViewPage.CurrentPage.Name %></div>

<div class="item">
    <p class="item-id">ID : <%= item.ID %></p>
    <p class="item-userid">User : <%= item.getUser().Name %></p>
    <p class="item-menuid">Chuyên mục : <%= item.getMenu().Name %></p>
    <p class="item-state">Vị trí : <%= string.Format("{0:#,##0}", item.State) %></p>
    <p class="item-name">Tên : <%= item.Name %></p>
    <p class="item-code">Mã : <%= item.Code %></p>
    <p class="item-tochuc_ten">To chuc_ ten : <%= item.ToChuc_Ten %></p>
    <p class="item-tochuc_tencoquan">To chuc_ ten co quan : <%= item.ToChuc_TenCoQuan %></p>
    <p class="item-tochuc_diachi">To chuc_ dia chi : <%= item.ToChuc_DiaChi %></p>
    <p class="item-tochuc_dienthoai">To chuc_ dien thoai : <%= item.ToChuc_DienThoai %></p>
    <p class="item-tochuc_fax">To chuc_ fax : <%= item.ToChuc_Fax %></p>
    <p class="item-tochuc_email">To chuc_ email : <%= item.ToChuc_Email %></p>
    <p class="item-tochuc_web">To chuc_ web : <%= item.ToChuc_Web %></p>
    <p class="item-tochuc_lanhdao">To chuc_ lanh dao : <%= item.ToChuc_LanhDao %></p>
    <p class="item-tochuc_chucvu">To chuc_ chuc vu : <%= item.ToChuc_ChucVu %></p>
    <p class="item-tttn_diachi">T t t n_ dia chi : <%= item.TTTN_DiaChi %></p>
    <p class="item-tttn_dienthoai">T t t n_ dien thoai : <%= item.TTTN_DienThoai %></p>
    <p class="item-tttn_dienthoaidd">T t t n_ dien thoai d d : <%= item.TTTN_DienThoaiDD %></p>
    <p class="item-tttn_fax">T t t n_ fax : <%= item.TTTN_Fax %></p>
    <p class="item-tttn_email">T t t n_ email : <%= item.TTTN_Email %></p>
    <p class="item-hethongthongtinids">He thong thong tin i ds : <%= item.HeThongThongTinIDs %></p>
    <p class="item-content">Nội dung : <%= item.Content %></p>
    <p class="item-file">Ảnh : <%= item.File %></p>
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
