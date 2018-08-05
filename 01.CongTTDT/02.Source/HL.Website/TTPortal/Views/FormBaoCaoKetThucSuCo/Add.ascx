<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as FormBaoCaoKetThucSuCoModel;
    var entity = ViewBag.Data as ModBaoCaoKetThucSuCoEntity;
%>

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
                <%=GetListCommand("apply|Lưu,space,cancel|Đóng") %>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Báo cáo kết thúc sự cố : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                <fieldset class="adminform">
                    <legend>THÔNG TIN VỀ TỔ CHỨC/CÁ NHÂN BÁO CÁO</legend>
                    <table class="admintable">
                        <tr>
                            <td class="key">
                                <label>Người báo cáo :</label>
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
            </tr>--%>
                        <%--<tr>
                <td class="key">
                    <label>Chuyên mục :</label>
                </td>
                <td>
                     <select name="MenuID" id="MenuID" class="text_input">
                         <option value="0">Root</option>
                         <%= Utils.ShowDDLMenuByType("BaoCaoKetThucSuCo", model.LangID, entity.MenuID)%> 
                    </select>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Vị trí :</label>
                </td>
                <td>
                    <%= Utils.ShowCheckBoxByConfigkey("Mod.BaoCaoKetThucSuCoState", "ArrState", entity.State)%>
                </td>
            </tr>--%>
                        <tr>
                            <td class="key">
                                <label>Tên báo cáo :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="Name" id="Name" value="<%=entity.Name %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Mã báo cáo :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="Code" id="Code" value="<%=entity.Code %>" maxlength="255" />
                            </td>
                        </tr>
                        <%--<tr>
                            <td class="key">
                                <label>Tên tổ chức :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ToChuc_Ten" id="ToChuc_Ten" value="<%=entity.ToChuc_Ten %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Địa chỉ :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ToChuc_DiaChi" id="ToChuc_DiaChi" value="<%=entity.ToChuc_DiaChi %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Điện thoại :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ToChuc_DienThoai" id="ToChuc_DienThoai" value="<%=entity.ToChuc_DienThoai %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Email :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ToChuc_Email" id="ToChuc_Email" value="<%=entity.ToChuc_Email %>" maxlength="255" />
                            </td>
                        </tr>--%>
                    </table>
                </fieldset>

                <fieldset class="adminform">
                    <legend>KÝ HIỆU BÁO CÁO BAN ĐẦU SỰ CỐ</legend>
                    <table class="admintable">
                        <tr>
                            <td class="key">
                                <label>Số ký hiệu :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="SoKyHieu" id="SoKyHieu" value="<%=entity.SoKyHieu %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Ngày báo cáo :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="NgayBaoCao" id="NgayBaoCao" value="<%=string.Format("{0:dd/MM/yyyy}", entity.NgayBaoCao) %>" maxlength="255" />
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
                                <label>Phân loại cấp độ của hệ thống thông tin, (nếu có) :</label>
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
                                <label>Tên/Mô tả về sự cố :</label>
                            </td>
                            <td>
                                <textarea class="text_input" style="height: 100px" name="Summary" id="Summary"><%=entity.Summary %></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Ngày phát hiện sự cố (*) (dd/mm/yy) :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="Ngay" id="Ngay" value="<%=string.Format("{0:dd/MM/yyyy}", entity.NgayGioPhatHien) %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Thời gian phát hiện (*) (HH:mm) :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="GioPhut" id="GioPhut" value="<%=string.Format("{0:HH:mm}", entity.NgayGioPhatHien) %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Kết quả xử lý sự cố :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="KetQua" id="KetQua" value="<%=entity.KetQua %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Các tài liệu đính kèm :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="Files" id="Files" value="<%=entity.Files %>" maxlength="255" />
                            </td>
                        </tr>
                        <%--<tr>
                            <td class="key">
                                <label>Published1 :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="Published1" id="Published1" value="<%=entity.Published1 %>" maxlength="255" />
                            </td>
                        </tr>--%>
<%--                        <%if (CPViewPage.UserPermissions.Approve)
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
                        <%} %>--%>
                    </table>
                </fieldset>
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
