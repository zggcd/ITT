<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModBaoCaoBanDauSuCoModel;
    var entity = ViewBag.Data as ModBaoCaoBanDauSuCoEntity;
%>

<script type="text/javascript" src="/{CPPath}/Content/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
    CKFinder.setupCKEditor(null, '/{CPPath}/Content/ckfinder/');
</script>

<form id="hlForm" name="hlForm" method="post">
<input type="hidden" id="_hl_action" name="_hl_action" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%= GetDefaultAddCommand()%>
        </div>
        <div class="pagetitle icon-48-generic">
            <h2>Bao cao ban dau su co : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
        </div>
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>
<div class="clr"></div>

<%= ShowMessage()%>

<div id="element-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="col width-100">
          <table class="admintable">
            <tr>
                <td class="key">
                    <label>User :</label>
                </td>
                <td>
                     <% List<ModUserEntity> listUser = ModUserService.Instance.CreateQuery().ToList(); %>
                     <select name="UserID" id="UserID" class="text_input">
                         <option value="0">-</option>
                         <%for (int i = 0; listUser != null && i < listUser.Count;i++ ){ %>
                         <option <%if(entity.UserID==listUser[i].ID) {%> selected <%} %> value="<%= listUser[i].ID%>"><%= listUser[i].Name%></option>
                         <%} %>
                    </select>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>User i d1 :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="UserID1" id="UserID1" value="<%=entity.UserID1 %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Chuyên mục :</label>
                </td>
                <td>
                     <select name="MenuID" id="MenuID" class="text_input">
                         <option value="0">Root</option>
                         <%= Utils.ShowDDLMenuByType("BaoCaoBanDauSuCo", model.LangID, entity.MenuID)%> 
                    </select>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Vị trí :</label>
                </td>
                <td>
                    <%= Utils.ShowCheckBoxByConfigkey("Mod.BaoCaoBanDauSuCoState", "ArrState", entity.State)%>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Tên :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Name" id="Name" value="<%=entity.Name %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Mã :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Code" id="Code" value="<%=entity.Code %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>To chuc_ ten :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ToChuc_Ten" id="ToChuc_Ten" value="<%=entity.ToChuc_Ten %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>To chuc_ dia chi :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ToChuc_DiaChi" id="ToChuc_DiaChi" value="<%=entity.ToChuc_DiaChi %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>To chuc_ dien thoai :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ToChuc_DienThoai" id="ToChuc_DienThoai" value="<%=entity.ToChuc_DienThoai %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>To chuc_ email :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ToChuc_Email" id="ToChuc_Email" value="<%=entity.ToChuc_Email %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Nguoi lien he_ ten :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="NguoiLienHe_Ten" id="NguoiLienHe_Ten" value="<%=entity.NguoiLienHe_Ten %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Nguoi lien he_ chuc vu :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="NguoiLienHe_ChucVu" id="NguoiLienHe_ChucVu" value="<%=entity.NguoiLienHe_ChucVu %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Nguoi lien he_ dien thoai :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="NguoiLienHe_DienThoai" id="NguoiLienHe_DienThoai" value="<%=entity.NguoiLienHe_DienThoai %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Nguoi lien he_ email :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="NguoiLienHe_Email" id="NguoiLienHe_Email" value="<%=entity.NguoiLienHe_Email %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Chi tiet_ ten don vi :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ChiTiet_TenDonVi" id="ChiTiet_TenDonVi" value="<%=entity.ChiTiet_TenDonVi %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Chi tiet_ co quan :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ChiTiet_CoQuan" id="ChiTiet_CoQuan" value="<%=entity.ChiTiet_CoQuan %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Chi tiet_ ten he thong :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ChiTiet_TenHeThong" id="ChiTiet_TenHeThong" value="<%=entity.ChiTiet_TenHeThong %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Chi tiet_ phan loai :</label>
                </td>
                <td>
                     <select name="ChiTiet_PhanLoaiID" id="ChiTiet_PhanLoaiID" class="text_input">
                         <option value="0">-</option>
                         <%= Utils.ShowDDLMenuByType2("ChiTiet_PhanLoai", model.LangID, entity.ChiTiet_PhanLoaiID)%> 
                    </select>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Chi tiet_ ten to chuc cung cap :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ChiTiet_TenToChucCungCap" id="ChiTiet_TenToChucCungCap" value="<%=entity.ChiTiet_TenToChucCungCap %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Chi tiet_ ten n c c_ ben ngoai :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ChiTiet_TenNCC_BenNgoai" id="ChiTiet_TenNCC_BenNgoai" value="<%=entity.ChiTiet_TenNCC_BenNgoai %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Chi tiet_ ten n c c :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ChiTiet_TenNCC" id="ChiTiet_TenNCC" value="<%=entity.ChiTiet_TenNCC %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Chi tiet_ mo ta :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ChiTiet_MoTa" id="ChiTiet_MoTa" value="<%=entity.ChiTiet_MoTa %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Chi tiet_ ngay gio phat hien :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ChiTiet_NgayGioPhatHien" id="ChiTiet_NgayGioPhatHien" value="<%=entity.ChiTiet_NgayGioPhatHien %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Hien trang :</label>
                </td>
                <td>
                     <select name="HienTrangID" id="HienTrangID" class="text_input">
                         <option value="0">-</option>
                         <%= Utils.ShowDDLMenuByType2("HienTrang", model.LangID, entity.HienTrangID)%> 
                    </select>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>T t them_ he dieu hanh :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="TTThem_HeDieuHanh" id="TTThem_HeDieuHanh" value="<%=entity.TTThem_HeDieuHanh %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>T t them_ version :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="TTThem_Version" id="TTThem_Version" value="<%=entity.TTThem_Version %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>T t them_ danh sach i p :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="TTThem_DanhSachIP" id="TTThem_DanhSachIP" value="<%=entity.TTThem_DanhSachIP %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>T t them_ danh sach ten mien :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="TTThem_DanhSachTenMien" id="TTThem_DanhSachTenMien" value="<%=entity.TTThem_DanhSachTenMien %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>T t them_ muc dich su dung :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="TTThem_MucDichSuDung" id="TTThem_MucDichSuDung" value="<%=entity.TTThem_MucDichSuDung %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Nội dung :</label>
                </td>
                <td class="content">
                    <textarea class="ckeditor" style="width:100%;height:500px" name="Content" id="Content"><%=entity.Content%></textarea>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Thoi gian thuc hien :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ThoiGianThucHien" id="ThoiGianThucHien" value="<%=entity.ThoiGianThucHien %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Published1 :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Published1" id="Published1" value="<%=entity.Published1 %>" maxlength="255" />
                </td>
            </tr>
            <%if(CPViewPage.UserPermissions.Approve) {%>
            <tr>
                <td class="key">
                    <label>Duyệt :</label>
                </td>
                <td>
                    <input name="Activity" <%= entity.Activity ? "checked" : "" %> type="radio" value='1' /> Có
                    <input name="Activity" <%= !entity.Activity ? "checked" : "" %> type="radio" value='0' /> Không
                </td>
            </tr>
            <%} %>
          </table>
        </div>                
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>

</form>