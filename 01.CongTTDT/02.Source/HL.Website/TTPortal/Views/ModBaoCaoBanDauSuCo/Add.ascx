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
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="toolbar-list" id="toolbar">
                <%= GetDefaultAddCommand()%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Báo cáo ban đầu sự cố : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
            </div>
            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>
    <div class="clr"></div>

    <%= ShowMessage()%>

    <script type="text/javascript">
        window.addEvent('domready', function () {
            new Accordion($$('div#content-sliders-.pane-sliders > .panel > h3.pane-toggler'), $$('div#content-sliders-.pane-sliders > .panel > div.pane-slider'), { onActive: function (toggler, i) { toggler.addClass('pane-toggler-down'); toggler.removeClass('pane-toggler'); i.addClass('pane-down'); i.removeClass('pane-hide'); Cookie.write('jpanesliders_content-sliders-', $$('div#content-sliders-.pane-sliders > .panel > h3').indexOf(toggler)); }, onBackground: function (toggler, i) { toggler.addClass('pane-toggler'); toggler.removeClass('pane-toggler-down'); i.addClass('pane-hide'); i.removeClass('pane-down'); if ($$('div#content-sliders-.pane-sliders > .panel > h3').length == $$('div#content-sliders-.pane-sliders > .panel > h3.pane-toggler').length) Cookie.write('jpanesliders_content-sliders-', -1); }, duration: 300, opacity: false, alwaysHide: true });
        });
    </script>
    <%if (model.RecordID > 0)
        { %>
    <script type="text/javascript">
        document.switcher = null;
        window.addEvent('domready', function () {
            toggler = document.id('submenu');
            element = document.id('tab-document1');
            if (element) {
                document.switcher = new JSwitcher(toggler, element, { cookieName: "app1" });
            }
        });
    </script>
    <%} %>

    <div id="element-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="col width-100">
                <table class="admintable">
                    <tr>
                        <td class="key">
                            <label>User :</label>
                        </td>
                        <td>
                            <% List<CPUserEntity> listUser = CPUserService.Instance.CreateQuery().ToList(); %>
                            <select name="UserID" id="UserID" class="text_input">
                                <option value="0">-</option>
                                <%for (int i = 0; listUser != null && i < listUser.Count; i++)
                                    { %>
                                <option <%if (entity.UserID == listUser[i].ID)
                                    {%>
                                    selected <%} %> value="<%= listUser[i].ID%>"><%= listUser[i].Name%></option>
                                <%} %>
                            </select>
                        </td>
                    </tr>
                    <%--<tr>
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
                    </tr>--%>
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
                </table>

                <fieldset class="adminform">
                    <legend>THÔNG TIN VỀ TỔ CHỨC/CÁ NHÂN BÁO CÁO SỰ CỐ</legend>
                    <table class="admintable">
                        <tr>
                            <td class="key">
                                <label>Tên tổ chức/cá nhân báo cáo sự cố (*) :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ToChuc_Ten" id="ToChuc_Ten" value="<%=entity.ToChuc_Ten %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Địa chỉ: (*) :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ToChuc_DiaChi" id="ToChuc_DiaChi" value="<%=entity.ToChuc_DiaChi %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Điện thoại (*) :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ToChuc_DienThoai" id="ToChuc_DienThoai" value="<%=entity.ToChuc_DienThoai %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Email (*) :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ToChuc_Email" id="ToChuc_Email" value="<%=entity.ToChuc_Email %>" maxlength="255" />
                            </td>
                        </tr>
                    </table>
                </fieldset>

                <fieldset class="adminform">
                    <legend>NGƯỜI LIÊN HỆ</legend>
                    <table class="admintable">
                        <tr>
                            <td class="key">
                                <label>Họ và tên (*) :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="NguoiLienHe_Ten" id="NguoiLienHe_Ten" value="<%=entity.NguoiLienHe_Ten %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Chức vụ :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="NguoiLienHe_ChucVu" id="NguoiLienHe_ChucVu" value="<%=entity.NguoiLienHe_ChucVu %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Điện thoại (*) :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="NguoiLienHe_DienThoai" id="NguoiLienHe_DienThoai" value="<%=entity.NguoiLienHe_DienThoai %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Email (*) :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="NguoiLienHe_Email" id="NguoiLienHe_Email" value="<%=entity.NguoiLienHe_Email %>" maxlength="255" />
                            </td>
                        </tr>
                    </table>
                </fieldset>

                <fieldset class="adminform">
                    <legend>THÔNG TIN CHI TIẾT VỀ HỆ THỐNG BỊ SỰ CỐ</legend>
                    <table class="admintable">
                        <tr>
                            <td class="key">
                                <label>Tên đơn vị vận hành hệ thống thông tin (*) :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ChiTiet_TenDonVi" id="ChiTiet_TenDonVi" value="<%=entity.ChiTiet_TenDonVi %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Cơ quan chủ quản :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ChiTiet_CoQuan" id="ChiTiet_CoQuan" value="<%=entity.ChiTiet_CoQuan %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Tên hệ thống bị sự cố :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ChiTiet_TenHeThong" id="ChiTiet_TenHeThong" value="<%=entity.ChiTiet_TenHeThong %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Phân loại cấp độ của hệ thống thông tin (nếu có) :</label>
                            </td>
                            <td>
                                <select name="ChiTiet_PhanLoaiID" id="ChiTiet_PhanLoaiID" class="text_input">
                                    <option value="0">-</option>
                                    <%= Utils.ShowDDLMenuByType2("CapDo", model.LangID, entity.ChiTiet_PhanLoaiID)%>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Tổ chức cung cấp dịch vụ an toàn thông tin (nếu có): :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ChiTiet_TenToChucCungCap" id="ChiTiet_TenToChucCungCap" value="<%=entity.ChiTiet_TenToChucCungCap %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Tên nhà cung cấp dịch vụ kết nối bên ngoài (nếu có) :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ChiTiet_TenNCC_BenNgoai" id="ChiTiet_TenNCC_BenNgoai" value="<%=entity.ChiTiet_TenNCC_BenNgoai %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Điền tên nhà cung cấp ở đây :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ChiTiet_TenNCC" id="ChiTiet_TenNCC" value="<%=entity.ChiTiet_TenNCC %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Mô tả sơ bộ về sự cố (*) :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ChiTiet_MoTa" id="ChiTiet_MoTa" value="<%=entity.ChiTiet_MoTa %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Ngày phát hiện sự cố (*) (dd/mm/yy) :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ChiTiet_NgayGioPhatHien" id="ChiTiet_NgayGioPhatHien" value="<%=entity.ChiTiet_NgayGioPhatHien %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Thời gian phát hiện (*) :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="" id="" value="<%=entity.ChiTiet_NgayGioPhatHien %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>HIỆN TRẠNG SỰ CỐ (*) :</label>
                            </td>
                            <td>
                                <select name="HienTrangID" id="HienTrangID" class="text_input">
                                    <option value="0">-</option>
                                    <%= Utils.ShowDDLMenuByType2("HienTrang", model.LangID, entity.HienTrangID)%>
                                </select>
                            </td>
                        </tr>
                    </table>
                </fieldset>

                <fieldset class="adminform">
                    <legend>THÔNG TIN BỔ SUNG VỀ HỆ THỐNG XẢY RA SỰ CỐ</legend>
                    <table class="admintable">
                        <tr>
                            <td class="key">
                                <label>Hệ điều hành :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="TTThem_HeDieuHanh" id="TTThem_HeDieuHanh" value="<%=entity.TTThem_HeDieuHanh %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Version :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="TTThem_Version" id="TTThem_Version" value="<%=entity.TTThem_Version %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Các địa chỉ IP của hệ thống (Liệt kê địa chỉ IP sử dụng trên Internet, không liệt kê địa chỉ IP nội bộ) :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="TTThem_DanhSachIP" id="TTThem_DanhSachIP" value="<%=entity.TTThem_DanhSachIP %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Các tên miền của hệ thống :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="TTThem_DanhSachTenMien" id="TTThem_DanhSachTenMien" value="<%=entity.TTThem_DanhSachTenMien %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Mục đích chính sử dụng hệ thống :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="TTThem_MucDichSuDung" id="TTThem_MucDichSuDung" value="<%=entity.TTThem_MucDichSuDung %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>KIẾN NGHỊ, ĐỀ XUẤT HỖ TRỢ :</label>
                            </td>
                            <td class="content">
                                <textarea class="ckeditor" style="width: 100%; height: 500px" name="Content" id="Content"><%=entity.Content%></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>THỜI GIAN THỰC HIỆN BÁO CÁO SỰ CỐ * :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ThoiGianThucHien" id="ThoiGianThucHien" value="<%=entity.ThoiGianThucHien %>" maxlength="255" />
                            </td>
                        </tr>
                    </table>
                </fieldset>

                <table class="admintable">
                    <%--<tr>
                        <td class="key">
                            <label>Published1 :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Published1" id="Published1" value="<%=entity.Published1 %>" maxlength="255" />
                        </td>
                    </tr>--%>
                    <%if (CPViewPage.UserPermissions.Approve)
                        {%>
                    <tr>
                        <td class="key">
                            <label>Duyệt :</label>
                        </td>
                        <td>
                            <input name="Activity" <%= entity.Activity ? "checked" : "" %> type="radio" value='1' />
                            Có
                    <input name="Activity" <%= !entity.Activity ? "checked" : "" %> type="radio" value='0' />
                            Không
                        </td>
                    </tr>
                    <%} %>
                </table>
            </div>
            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>

</form>
