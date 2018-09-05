<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModThongBaoSuCoModel;
    var entity = ViewBag.Data as ModThongBaoSuCoEntity;
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
                <%= GetListCommand("apply|Lưu,save|Lưu  &amp; đóng,space,cancel|Đóng")%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Thông báo sự cố : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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

    <%= ShowMessage()%>

    <div id="submenu-box">
        <div class="t">
            <div class="t">
                <div class="t">
                </div>
            </div>
        </div>
        <div class="m">
            <div class="submenu-box">
                <div class="submenu-pad">
                    <ul id="submenu" class="configuration">
                        <li><a id="General" class="active">THÔNG TIN CHUNG</a></li>
                        <li><a id="tab1">CHI TIẾT THÔNG BÁO</a></li>
                    </ul>
                    <div class="clr">
                    </div>
                </div>
            </div>
            <div class="clr">
            </div>
            <div class="clr">
            </div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b">
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        window.addEvent('domready', function () { new Accordion($$('div#content-sliders-.pane-sliders > .panel > h3.pane-toggler'), $$('div#content-sliders-.pane-sliders > .panel > div.pane-slider'), { onActive: function (toggler, i) { toggler.addClass('pane-toggler-down'); toggler.removeClass('pane-toggler'); i.addClass('pane-down'); i.removeClass('pane-hide'); Cookie.write('jpanesliders_content-sliders-', $$('div#content-sliders-.pane-sliders > .panel > h3').indexOf(toggler)); }, onBackground: function (toggler, i) { toggler.addClass('pane-toggler'); toggler.removeClass('pane-toggler-down'); i.addClass('pane-hide'); i.removeClass('pane-down'); if ($$('div#content-sliders-.pane-sliders > .panel > h3').length == $$('div#content-sliders-.pane-sliders > .panel > h3.pane-toggler').length) Cookie.write('jpanesliders_content-sliders-', -1); }, duration: 300, opacity: false, alwaysHide: true }); });
    </script>

    <div id="element-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div id="tab-document1" class="col width-100">
            <div id="page-General" class="tab">
                <div class="m">
                    <div class="col width-100">
                        <table class="admintable">
                            <tr>
                                <td class="key">
                                    <label>Người tạo :</label>
                                </td>
                                <td>
                                    <% List<CPUserEntity> listUser = CPUserService.Instance.CreateQuery().ToList(); %>
                                    <select name="UserID" id="UserID" class="text_input">
                                        <option value="0">-</option>
                                        <%for (int i = 0; listUser != null && i < listUser.Count; i++)
                                            { %>
                                        <option <%if (entity.UserID == listUser[i].ID)
                                            {%>
                                            selected <%} %> value="<%= listUser[i].ID%>"><%= listUser[i].LoginName%></option>
                                        <%} %>
                                    </select>
                                </td>
                            </tr>
                            <%--<tr>
                                <td class="key">
                                    <label>Trạng thái :</label>
                                </td>
                                <td>
                                    <select name="MenuID" id="MenuID" class="text_input">
                                        <%= Utils.ShowDDLMenuByType2("ThongBaoSuCo", model.LangID, entity.MenuID, true)%>
                                    </select>
                                </td>
                            </tr>--%>
                            <tr>
                                <td class="key">
                                    <label>Tên tổ chức/cá nhân thông báo (*) :</label>
                                </td>
                                <td>
                                    <input class="text_input" type="text" name="ToChuc_Ten" id="ToChuc_Ten" value="<%=entity.ToChuc_Ten %>" maxlength="250" autocomplete="off"/>
                                </td>
                            </tr>
                            <tr>
                                <td class="key">
                                    <label>Địa chỉ tổ chức/cá nhân thông báo (*) :</label>
                                </td>
                                <td>
                                    <input class="text_input" type="text" name="ToChuc_DiaChi" id="ToChuc_DiaChi" value="<%=entity.ToChuc_DiaChi %>" maxlength="250" autocomplete="off" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key">
                                    <label>Ngày tạo :</label>
                                </td>
                                <td>
                                    <input class="text_input" type="text" name="Published" id="Published" value="<%=entity.CreatedDate %>" maxlength="255" disabled/>
                                </td>
                            </tr>
                            <tr>
                                <td class="key">
                                    <label>Duyệt :</label>
                                </td>
                                <td>
                                    <input id="Activate" name="Activity" type="radio" value="1" <%= entity.Activity ? "checked": ""%>> Có
                                    <input id="Deactivate" name="Activity" type="radio" value="0" <%= !entity.Activity ? "checked": ""%>> Không
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="clr"></div>
                </div>
                <div class="clr"></div>
            </div>
            <div id="page-tab1" class="tab">
                <div class="m">
                    <div class="col width-100">
                        <table class="admintable">
                            <tr>
                                <td class="key">
                                    <label>Tên hệ thống bị sự cố (*) :</label>
                                </td>
                                <td>
                                    <input class="text_input" type="text" name="ChiTiet_TenHeThong" id="ChiTiet_TenHeThong" value="<%=entity.ChiTiet_TenHeThong %>" maxlength="250" autocomplete="off" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key">
                                    <label>Địa chỉ của đơn vị/cá nhân vận hành (*) :</label>
                                </td>
                                <td>
                                    <input class="text_input" type="text" name="ChiTiet_TenDonVi" id="ChiTiet_TenDonVi" value="<%=entity.ChiTiet_TenDonVi %>" maxlength="250" autocomplete="off" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key">
                                    <label>Tên cơ quan chủ quản hệ thống bị sự cố (*) :</label>
                                </td>
                                <td>
                                    <input class="text_input" type="text" name="ChiTiet_CoQuan" id="ChiTiet_CoQuan" value="<%=entity.ChiTiet_CoQuan %>" maxlength="250" autocomplete="off" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key">
                                    <label>Mô tả sơ bộ về sự cố (*) :</label>
                                </td>
                                <td>
                                    <textarea class="text_input" name="ChiTiet_MoTa" id="ChiTiet_MoTa" rows="5" maxlength="1000"><%=entity.ChiTiet_MoTa %></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="key">
                                    <label>Ngày phát hiện sự cố (*) (dd/mm/yy) :</label>
                                </td>
                                <td>
                                    <input class="text_input" type="text" name="Ngay" id="Ngay" value="<%=string.Format("{0:dd/MM/yyyy}", entity.ChiTiet_NgayGioPhatHien) %>" maxlength="10" autocomplete="off" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key">
                                    <label>Thời gian phát hiện (*) (HH:mm) :</label>
                                </td>
                                <td>
                                    <input class="text_input" type="text" name="GioPhut" id="GioPhut" value="<%=string.Format("{0:HH:mm}", entity.ChiTiet_NgayGioPhatHien) %>" maxlength="5" autocomplete="off" />
                                </td>
                            </tr>
                            <tr>
                                <td class="key">
                                    <label>Kết quả xử lý sự cố đề xuất (*) :</label>
                                </td>
                                <td>
                                    <textarea class="text_input" name="ChiTiet_KienNghi" id="ChiTiet_KienNghi" rows="5" maxlength="1000"><%=entity.ChiTiet_KienNghi %></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td class="key">
                                    <label>Kiến nghị và các thông tin liên quan khác :</label>
                                </td>
                                <td>
                                    <textarea class="text_input" name="ChiTiet_KetQua" id="ChiTiet_KetQua" rows="5" maxlength="1000"><%=entity.ChiTiet_KetQua %></textarea>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="clr"></div>
                </div>
                <div class="clr"></div>
            </div>
            <div class="b">
                <div class="b">
                    <div class="b"></div>
                </div>
            </div>
        </div>
    </div>
</form>
