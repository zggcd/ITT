<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModHSThanhVienUCSCModel;
    var entity = ViewBag.Data as ModHSThanhVienUCSCEntity;
    var entityDM = ViewBag.DauMoi as ModDauMoiUCSCEntity;

    List<ModHeThongThongTinEntity> currHTTT = ViewBag.HTTT as List<ModHeThongThongTinEntity> ?? new List<ModHeThongThongTinEntity>();
    List<WebMenuEntity> lstCapDo = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "CapDo" && o.ParentID > 0).ToList_Cache();
    int countCapDo = lstCapDo != null ? lstCapDo.Count : 0;
%>

<script type="text/javascript" src="/{CPPath}/Content/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
    CKFinder.setupCKEditor(null, '/{CPPath}/Content/ckfinder/');
</script>

<form id="hlForm" name="hlForm" method="post" onsubmit="fnSubmit()">
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
                                    selected <%} %> value="<%= listUser[i].ID%>"><%= listUser[i].LoginName%></option>
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

                <fieldset class="adminform">
                    <legend>ĐẦU MỐI ỨNG CỨU SỰ CỐ</legend>
                    <table class="admintable">
                        <tr>
                            <td class="key">
                                <label>Họ và tên :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="Name1" id="Name1" value="<%=entityDM.Name %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Chức vụ :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ChucVu" id="ChucVu" value="<%=entityDM.ChucVu %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Địa chỉ liên hệ :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DiaChi" id="DiaChi" value="<%=entityDM.DiaChi %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Số điện thoại cố định :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DienThoai" id="DienThoai" value="<%=entityDM.DienThoai %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Số điện thoại di động :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DienThoaiDD" id="DienThoaiDD" value="<%=entityDM.DienThoaiDD %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Số Fax :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="Fax" id="Fax" value="<%=entityDM.Fax %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Email :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="Email" id="Email" value="<%=entityDM.Email %>" maxlength="255" />
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
                    <tr>
                        <td class="key">
                            <label>Tên các hệ thống thông tin thuộc phạm vi phụ trách hoặc cung cấp dịch vụ :</label>
                        </td>
                        <td>
                            <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" style='border-collapse: collapse; mso-padding-alt: 0in 0in 0in 0in'>
                                <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                    <%int lvl = 2;
                                        if (currHTTT != null && currHTTT.Count > 0) lvl = currHTTT.GroupBy(o => o.MenuID).Select(o => o.Count()).Max();
                                        for (int i = 0; i < countCapDo; i++)
                                        {%>
                                    <td width="121" valign="top" style='width: 90.65pt; padding: 0in 0in 0in 0in' data-m="<%=lstCapDo[i].ID %>" id="M<%=i %>">
                                        <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>&#9642;</span>
                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'><%=lstCapDo[i].Name %>:</span>
                                        </p>
                                        <%int lnHt = 0;
                                            List<ModHeThongThongTinEntity> ht = null;
                                            if (currHTTT != null && currHTTT.Count > 0)
                                            {
                                                ht = currHTTT.Where(o => o.MenuID == lstCapDo[i].ID).ToList();
                                                lnHt = ht.Count;
                                            }
                                            for (int j = 0; j < lvl; j++)
                                            {
                                                var val = "";
                                                if (lnHt > j && ht != null) val = ht[j].Name;
                                        %>
                                        <p class="MsoNormal Del<%=j+1 %>" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                <input name="" maxlength="255" id="" class="textstyle1 input" type="text" value="<%=val %>" style="width: 100%;" /></span>
                                        </p>
                                        <%} %>
                                        <output class="Out"></output>
                                    </td>
                                    <%} %>
                                    <td width="121" valign="top" style='width: 90.65pt; padding: 0in 0in 0in 0in'>
                                        <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'></span>
                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>&nbsp;</span>
                                        </p>
                                        <%for (int j = 0; j < lvl; j++)
                                            {%>
                                        <p class="MsoNormal Del<%=j+1 %>" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                <a href="javascript:fnDel(<%=j+1 %>)" data-idx="<%=j+1 %>">Xóa</a>
                                            </span>
                                        </p>
                                        <%} %>
                                        <output class="Out1"></output>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                <a href="javascript:void(0)" id="btnThem">+ Thêm</a>
                                            </span>
                                        </p>
                                    </td>
                                </tr>
                            </table>
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
            <input type="hidden" name="M" value="" id="M" />

            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>

    <script>
        $('#btnThem').click(function () {
            var ranNum = Math.floor(Math.random() * 999999).toString();
            var html = '<p class="MsoNormal Del' + ranNum + '" style="margin-top: 6.0pt; tab-stops: dotted 420.0pt"><input name="" maxlength="255" id="" class="textstyle1 input" type="text" value="" style="width: 100%;" /></span></p>';
            var html1 = '<p class="MsoNormal Del' + ranNum + '" style="margin-top: 6.0pt; tab-stops: dotted 420.0pt"><a href="javascript:fnDel(' + ranNum + ')">Xóa</a></span></p>';
            $('.Out').before(html);
            $('.Out1').before(html1);
        });

        function fnDel(r) {
            $('.Del' + r).remove();
        }

        function fnSubmit() {
            var ln = <%=countCapDo%>;
            var s = '';
            for (var i = 0; i < ln; i++) {
                var m = $('#M' + i).attr('data-m');
                s += m + '_';
                var n = $('#M' + i).find('input[type=text]');
                var ln1 = n.length;
                for (var j = 0; j < ln1; j++) {
                    s += $(n[j]).val() + ',';
                }
                s += ';';
            }
            $('#M').val(s);
        }

        fnSubmit();
    </script>

</form>
