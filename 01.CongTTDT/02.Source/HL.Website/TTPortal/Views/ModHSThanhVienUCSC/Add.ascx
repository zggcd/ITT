<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModHSThanhVienUCSCModel;
    var entity = ViewBag.Data as ModHSThanhVienUCSCEntity;
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
                <h2>Hồ sơ thành viên ứng cứu sự cố : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
            </div>

            <div class="width-70 fltlft">
                <fieldset class="adminform">
                    <legend>THÔNG TIN CHUNG VỀ TỎ CHỨC</legend>
                    <table class="admintable">
                        <tr>
                            <td class="key">
                                <label>Tên tổ chức :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ToChuc_Ten" id="ToChuc_Ten" value="<%=entity.ToChuc_Ten %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Tên cơ quan chủ quản :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ToChuc_TenCoQuan" id="ToChuc_TenCoQuan" value="<%=entity.ToChuc_TenCoQuan %>" maxlength="255" />
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
                                <label>Fax :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ToChuc_Fax" id="ToChuc_Fax" value="<%=entity.ToChuc_Fax %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Email :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ToChuc_Email" id="ToChuc_Email" value="<%=entity.ToChuc_Email %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Website :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ToChuc_Web" id="ToChuc_Web" value="<%=entity.ToChuc_Web %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Lãnh đạo phụ trách an toàn thông tin :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ToChuc_LanhDao" id="ToChuc_LanhDao" value="<%=entity.ToChuc_LanhDao %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Chức vụ :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ToChuc_ChucVu" id="ToChuc_ChucVu" value="<%=entity.ToChuc_ChucVu %>" maxlength="255" />
                            </td>
                        </tr>

                    </table>
                </fieldset>

                <fieldset class="adminform">
                    <legend>THÔNG TIN TIẾP NHẬN THÔNG BÁO SỰ CỐ</legend>
                    <table class="admintable">
                        <tr>
                            <td class="key">
                                <label>Địa chỉ :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="TTTN_DiaChi" id="TTTN_DiaChi" value="<%=entity.TTTN_DiaChi %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Số điện thoại cố định :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="TTTN_DienThoai" id="TTTN_DienThoai" value="<%=entity.TTTN_DienThoai %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Số điện thoại di động :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="TTTN_DienThoaiDD" id="TTTN_DienThoaiDD" value="<%=entity.TTTN_DienThoaiDD %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Số Fax :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="TTTN_Fax" id="TTTN_Fax" value="<%=entity.TTTN_Fax %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Email :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="TTTN_Email" id="TTTN_Email" value="<%=entity.TTTN_Email %>" maxlength="255" />
                            </td>
                        </tr>
                    </table>
                </fieldset>

                <table class="admintable">
                    <tr>
                        <td colspan="2" align="center" style="text-align: center" class="key">Giới thiệu về hoạt động của tổ chức
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="content">
                            <textarea class="ckeditor" style="width: 100%; height: 500px" name="Content" id="Content"><%=entity.Content%></textarea>
                        </td>
                    </tr>
                </table>
            </div>

            <div class="width-30 fltrt">
                <div id="content-sliders-" class="pane-sliders">

                    <div class="panel">
                        <h3 class="pane-toggler title" id="publishing-details">
                            <a href="javascript:void(0);"><span>THÔNG TIN THÊM</span></a></h3>
                        <div class="pane-slider content">
                            <table class="admintable">
                                <tr>
                                    <td align="center" style="text-align: center" class="key">Hệ thống thông tin
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input class="text_input" type="text" name="HeThongThongTinIDs" id="HeThongThongTinIDs" value="<%=entity.HeThongThongTinIDs %>" maxlength="255" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="text-align: center" class="key">Thông tin về Danh sách nhân lực, chuyên gia an toàn thông tin, công nghệ thông tin và tương đương
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%if (!string.IsNullOrEmpty(entity.File))
                                            { %>
                                        <%= Utils.GetMedia(entity.File, 100, 80, string.Empty, true, "id='img_view'")%><%}
                                        else
                                        { %>
                                        <img id="img_view" width="100" height="80" />
                                        <%} %>
                                        <br />
                                        <input class="text_input" type="text" name="File" id="File" style="width: 65%" value="<%=entity.File %>" />
                                        <input class="text_input" style="width: 75px;" type="button" onclick="ShowFileForm('File'); return false;" value="Chọn file" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="text-align: center" class="key">Chuyên mục
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="MenuID" id="MenuID" class="text_input">
                                            <option value="0">Root</option>
                                            <%= Utils.ShowDDLMenuByType("HSThanhVienUCSC", model.LangID, entity.MenuID)%>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="center" style="text-align: center" class="key">Vị trí
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%= Utils.ShowCheckBoxByConfigkey("Mod.HSThanhVienUCSCState", "ArrState", entity.State)%>
                                    </td>
                                </tr>

                                <%if (CPViewPage.UserPermissions.Approve)
                                    {%>
                                <tr>
                                    <td align="center" style="text-align: center" class="key">Duyệt
                                    </td>
                                </tr>
                                <tr>
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
                    </div>
                </div>
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
