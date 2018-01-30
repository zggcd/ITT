<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModDonDangKyUCSCModel;
    var entity = ViewBag.Data as ModDonDangKyUCSCEntity;

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
                <h2>Đơn đăng ký tham gia mạng lưới UCSC : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                                <%= Utils.ShowDDLMenuByType("DonDangKyUCSC", model.LangID, entity.MenuID)%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Vị trí :</label>
                        </td>
                        <td>
                            <%= Utils.ShowCheckBoxByConfigkey("Mod.DonDangKyUCSCState", "ArrState", entity.State)%>
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
                    </table>
                </fieldset>

                <fieldset class="adminform">
                    <legend>GIỚI THIỆU VỀ HOẠT ĐỘNG CỦA TỔ CHỨC</legend>
                    <table class="admintable">
                        <tr>
                            <td class="key">
                                <label>Giới thiệu chung về hoạt động của tổ chức :</label>
                            </td>
                            <td class="content">
                                <textarea class="ckeditor" style="width: 100%; height: 500px" name="Content" id="Content"><%=entity.Content%></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Tên các hệ thống thông tin thuộc phụ trách quản lý hoặc hỗ trợ ứng cứu (cấp độ phê duyệt hoặc dự kiến tương đương) :</label>
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
                                                    <input name="" maxlength="255" id="" class="textstyle1 input" type="text" value="<%=val %>" /></span>
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
                        <tr>
                            <td class="key">
                                <label>Thông tin về nhân lực, chuyên gia an toàn thông tin, công nghệ thông tin và tương đương :</label>
                            </td>
                            <td>
                                <%= Utils.GetMedia(entity.File, 100, 80)%>
                                <br />
                                <input class="text_input" type="text" name="File" id="File" style="width: 80%;" value="<%=entity.File %>" maxlength="255" />
                                <input class="text_input" style="width: 17%;" type="button" onclick="ShowFileForm('File'); return false;" value="Chọn File" />
                            </td>
                        </tr>
                    </table>
                </fieldset>

                <fieldset class="adminform">
                    <legend>Thông tin trao đổi, liên lạc trong mạng lưới</legend>
                    <table class="admintable">
                        <tr>
                            <td class="key">
                                <label>Địa chỉ Website :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ThongTinLL_Web" id="ThongTinLL_Web" value="<%=entity.ThongTinLL_Web %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Địa chỉ thư điện tử của đơn vị - Tên :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ThongTinLL_ThuDT_Ten" id="ThongTinLL_ThuDT_Ten" value="<%=entity.ThongTinLL_ThuDT_Ten %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Địa chỉ thư điện tử của đơn vị - Fingerprint :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ThongTinLL_ThuDT_Fingerprint" id="ThongTinLL_ThuDT_Fingerprint" value="<%=entity.ThongTinLL_ThuDT_Fingerprint %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Địa chỉ thư điện tử của đơn vị - Public key :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="ThongTinLL_ThuDT_LinkToPublicKey" id="ThongTinLL_ThuDT_LinkToPublicKey" value="<%=entity.ThongTinLL_ThuDT_LinkToPublicKey %>" maxlength="255" />
                            </td>
                        </tr>
                    </table>
                </fieldset>

                <fieldset class="adminform">
                    <legend>Đầu mối liên lạc trong giờ làm việc</legend>
                    <table class="admintable">
                        <tr>
                            <td class="key">
                                <label>Tên bộ phận/người giải quyết :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DauMoiLL_TrongGio_Ten" id="DauMoiLL_TrongGio_Ten" value="<%=entity.DauMoiLL_TrongGio_Ten %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Điện thoại cố định :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DauMoiLL_TrongGio_DienThoai" id="DauMoiLL_TrongGio_DienThoai" value="<%=entity.DauMoiLL_TrongGio_DienThoai %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Điện thoại di động :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DauMoiLL_TrongGio_DienThoaiDD" id="DauMoiLL_TrongGio_DienThoaiDD" value="<%=entity.DauMoiLL_TrongGio_DienThoaiDD %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Số Fax :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DauMoiLL_TrongGio_Fax" id="DauMoiLL_TrongGio_Fax" value="<%=entity.DauMoiLL_TrongGio_Fax %>" maxlength="255" />
                            </td>
                        </tr>
                    </table>
                </fieldset>

                <fieldset class="adminform">
                    <legend>Đầu mối liên lạc ngoài giờ làm việc</legend>
                    <table class="admintable">
                        <tr>
                            <td class="key">
                                <label>Tên bộ phận/người giải quyết :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DauMoiLL_NgoaiGio_Ten" id="DauMoiLL_NgoaiGio_Ten" value="<%=entity.DauMoiLL_NgoaiGio_Ten %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Điện thoại cố định :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DauMoiLL_NgoaiGio_DienThoai" id="DauMoiLL_NgoaiGio_DienThoai" value="<%=entity.DauMoiLL_NgoaiGio_DienThoai %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Điện thoại di động :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DauMoiLL_NgoaiGio_DienThoaiDD" id="DauMoiLL_NgoaiGio_DienThoaiDD" value="<%=entity.DauMoiLL_NgoaiGio_DienThoaiDD %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Số Fax :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DauMoiLL_NgoaiGio_Fax" id="DauMoiLL_NgoaiGio_Fax" value="<%=entity.DauMoiLL_NgoaiGio_Fax %>" maxlength="255" />
                            </td>
                        </tr>
                    </table>
                </fieldset>

                <fieldset class="adminform">
                    <legend>Đầu mối lãnh đạo phụ trách về an toàn thông tin của tổ chức</legend>
                    <table class="admintable">
                        <tr>
                            <td class="key">
                                <label>Tên bộ phận/người giải quyết :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DauMoiLanhDao_Ten" id="DauMoiLanhDao_Ten" value="<%=entity.DauMoiLanhDao_Ten %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Điện thoại cố định :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DauMoiLanhDao_DienThoai" id="DauMoiLanhDao_DienThoai" value="<%=entity.DauMoiLanhDao_DienThoai %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Điện thoại di động :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DauMoiLanhDao_DienThoaiDD" id="DauMoiLanhDao_DienThoaiDD" value="<%=entity.DauMoiLanhDao_DienThoaiDD %>" maxlength="255" />
                            </td>
                        </tr>
                    </table>
                </fieldset>

                <fieldset class="adminform">
                    <legend>Địa chỉ nhận thư và công văn qua đường bưu điện</legend>
                    <table class="admintable">
                        <tr>
                            <td class="key">
                                <label>Tên bộ phận/người nhận :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DCNhanThu_TenBoPhan" id="DCNhanThu_TenBoPhan" value="<%=entity.DCNhanThu_TenBoPhan %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Vị trí, chức vụ :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DCNhanThu_ViTri" id="DCNhanThu_ViTri" value="<%=entity.DCNhanThu_ViTri %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Tên tổ chức :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DCNhanThu_TenToChuc" id="DCNhanThu_TenToChuc" value="<%=entity.DCNhanThu_TenToChuc %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Địa chỉ liên hệ :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DCNhanThu_DiaChi" id="DCNhanThu_DiaChi" value="<%=entity.DCNhanThu_DiaChi %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Điện thoại :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="DCNhanThu_DienThoai" id="DCNhanThu_DienThoai" value="<%=entity.DCNhanThu_DienThoai %>" maxlength="255" />
                            </td>
                        </tr>
                    </table>
                </fieldset>

                <fieldset class="adminform">
                    <legend>Phương tiện liên lạc khác</legend>
                    <table class="admintable">
                        <tr>
                            <td class="key">
                                <label>Yahoo ID :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="LLKhac_Yahoo" id="LLKhac_Yahoo" value="<%=entity.LLKhac_Yahoo %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Skype :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="LLKhac_Skype" id="LLKhac_Skype" value="<%=entity.LLKhac_Skype %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Google Talk :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="LLKhac_GoogleTalk" id="LLKhac_GoogleTalk" value="<%=entity.LLKhac_GoogleTalk %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Hotmail :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="LLKhac_Hotmail" id="LLKhac_Hotmail" value="<%=entity.LLKhac_Hotmail %>" maxlength="255" />
                            </td>
                        </tr>
                        <tr>
                            <td class="key">
                                <label>Khác :</label>
                            </td>
                            <td>
                                <input class="text_input" type="text" name="LLKhac_Khac" id="LLKhac_Khac" value="<%=entity.LLKhac_Khac %>" maxlength="255" />
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
            var html = '<p class="MsoNormal Del' + ranNum + '" style="margin-top: 6.0pt; tab-stops: dotted 420.0pt"><input name="" maxlength="255" id="" class="textstyle1 input" type="text" value="" /></span></p>';
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
