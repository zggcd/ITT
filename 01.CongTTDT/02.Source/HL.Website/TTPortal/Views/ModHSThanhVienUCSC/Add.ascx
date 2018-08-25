<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModHSThanhVienUCSCModel;
    var entity = ViewBag.Data as ModHSThanhVienUCSCEntity;
    var entityDM = ViewBag.DauMoi as ModDauMoiUCSCEntity;

    List<ModHeThongThongTinEntity> currHTTT = ViewBag.HTTT as List<ModHeThongThongTinEntity> ?? new List<ModHeThongThongTinEntity>();
    List<WebMenuEntity> lstCapDo = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "CapDo" && o.ParentID > 0).ToList_Cache();
    int countCapDo = lstCapDo != null ? lstCapDo.Count : 0;

    List<ModNhanLucUCSCEntity> lstNhanLuc = ViewBag.NhanLuc as List<ModNhanLucUCSCEntity> ?? new List<ModNhanLucUCSCEntity>();
    //List<WebMenuEntity> lstNhanLuc = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "NhanLuc" && o.ParentID > 0).ToList_Cache();
    int countNhanLuc = lstNhanLuc != null ? lstNhanLuc.Count : 0;

    List<WebMenuEntity> lstDaoTao = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "LinhVucDaoDao" && o.ParentID > 0).ToList_Cache();
    int countDaoTao = lstDaoTao != null ? lstDaoTao.Count : 0;

    List<WebMenuEntity> lstTrinhDoDaoTao = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "TrinhDoDaoTao" && o.ParentID > 0).ToList_Cache();
    int countTrinhDoDaoTao = lstTrinhDoDaoTao != null ? lstTrinhDoDaoTao.Count : 0;

    List<WebMenuEntity> lstChungChi = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "ChungChi" && o.ParentID > 0).ToList_Cache();
    int countChungChi = lstChungChi != null ? lstChungChi.Count : 0;

    List<WebMenuEntity> lstQuanLyATTT = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "QuanLyATTT" && o.ParentID > 0).ToList_Cache();
    int countQuanLyATTT = lstQuanLyATTT != null ? lstQuanLyATTT.Count : 0;

    List<WebMenuEntity> lstKyThuatPhongThu = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "KyThuatPhongThu" && o.ParentID > 0).ToList_Cache();
    int countKyThuatPhongThu = lstKyThuatPhongThu != null ? lstKyThuatPhongThu.Count : 0;

    List<WebMenuEntity> lstKyThuatBaoVe = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "KyThuatBaoVe" && o.ParentID > 0).ToList_Cache();
    int countKyThuatBaoVe = lstKyThuatBaoVe != null ? lstKyThuatBaoVe.Count : 0;

    List<WebMenuEntity> lstKyThuatKiemTra = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "KyThuatKiemTra" && o.ParentID > 0).ToList_Cache();
    int countKyThuatKiemTra = lstKyThuatKiemTra != null ? lstKyThuatKiemTra.Count : 0;

    int d = 0;
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
                    <tr>
                        <td class="key">
                            <label>Thông tin về Danh sách nhân lực, chuyên gia an toàn thông tin, công nghệ thông tin và tương đương :</label>
                        </td>
                        <td>

                            <table class="thanh-vien">
                                <thead>
                                    <tr>
                                        <th>TT</th>
                                        <th>Họ và tên</th>
                                        <th>Tên trường, cơ sở đào tạo</th>
                                        <th>Chuyên ngành đào tạo, bồi dưỡng</th>
                                        <th>Văn bằng, chứng chỉ, trình độ về ATTT, CNTT hoặc tương đương</th>
                                        <th>Tháng/năm tốt nghiệp</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (int i = 0; i < countNhanLuc; i++)
                                        {
                                    %>
                                    <tr class="nhanLuc">
                                        <td style="width: 3%;"><%=i+1 %></td>
                                        <td style="width: 20%;">
                                            <input name="NameNhanLuc" maxlength="255" id="" class="textstyle1 input" type="text" value="<%=lstNhanLuc[i].Name %>" /></td>
                                        <td style="width: 20%;">
                                            <input name="School" maxlength="255" id="" class="textstyle1 input" type="text" value="<%=lstNhanLuc[i].School %>" /></td>
                                        <td style="width: 10%;"><a href="javascript: void(0)" class="btnDaoTao" data-linhvucdt="<%=lstNhanLuc[i].MenuIDs_LinhVucDT %>" data-trinhdodt="<%=lstNhanLuc[i].MenuIDs_TrinhDoDT %>" data-chungchi="<%=lstNhanLuc[i].MenuIDs_ChungChi %>">+ Chi tiết</a></td>
                                        <td style="width: 13%;"><a href="javascript: void(0)" class="btnChungChi" data-quanlyattt="<%=lstNhanLuc[i].MenuIDs_QuanLyATTT %>" data-kythuatphongthu="<%=lstNhanLuc[i].MenuIDs_KyThuatPhongThu %>" data-kythuatbaove="<%=lstNhanLuc[i].MenuIDs_KyThuatBaoVe %>" data-kythuatkiemtra="<%=lstNhanLuc[i].MenuIDs_KyThuatKiemTra %>">+ Chi tiết</a></td>
                                        <td style="width: 1%;">
                                            <input name="NamTotNghiep" maxlength="255" id="" class="textstyle1 input" type="text" value="<%=lstNhanLuc[i].NamTotNghiep %>" style="width: 60px;" /></td>
                                        <td style="width: 1%;"><a href="javascript: void(0)" class="btnRemove">Xóa</a></td>
                                    </tr>
                                    <%}
                                        d = countNhanLuc + 1; %>
                                    <tr class="nhanLuc">
                                        <td style="width: 3%;"><%=d %></td>
                                        <td style="width: 20%;">
                                            <input name="NameNhanLuc" maxlength="255" id="" class="textstyle1 input" type="text" value="" /></td>
                                        <td style="width: 20%;">
                                            <input name="School" maxlength="255" id="" class="textstyle1 input" type="text" value="" /></td>
                                        <td style="width: 10%;"><a href="javascript: void(0)" class="btnDaoTao">+ Chi tiết</a></td>
                                        <td style="width: 13%;"><a href="javascript: void(0)" class="btnChungChi">+ Chi tiết</a></td>
                                        <td style="width: 1%;">
                                            <input name="NamTotNghiep" maxlength="255" id="" class="textstyle1 input" type="text" value="" style="width: 60px;" /></td>
                                        <td style="width: 1%;"><a href="javascript: void(0)" class="btnRemove">Xóa</a></td>
                                    </tr>
                                    <tr id="append"></tr>
                                    <tr>
                                        <td colspan="7" class="text-center"><a href="javascript: void(0)" id="btnAppend">+ Thêm</a></td>
                                    </tr>
                                </tbody>
                                <tfoot></tfoot>
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
                                <%--                                <tr>
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
                                </tr>--%>
                                <%--                                <tr>
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
                                </tr>--%>

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
            <input type="hidden" name="NhanLuc" value="" id="NhanLuc" />

            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>

    <!-- Modal -->
    <style type="text/css">
        .my-modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: rgb(0,0,0); /* Fallback color */
            background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
        }

        /* Modal Content/Box */
        .modal-content {
            background-color: #fefefe;
            margin: 15% auto; /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
        }

        /* The Close Button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
    </style>

    <div id="DaoTaoModal" class="my-modal">

        <!-- Modal content -->
        <div class="modal-content">
            <span class="close">&times;</span>
            <table class="thanh-vien">
                <thead>
                    <tr>
                        <th>TT</th>
                        <th>Phân loại</th>
                        <th>&nbsp;</th>
                    </tr>
                </thead>
                <tbody>
                    <tr style="text-align: left; font-weight: bold;">
                        <td style="width: 3%;">I</td>
                        <td style="width: 20%;">Lĩnh vực đào tạo</td>
                        <td style="width: 20%;">&nbsp;</td>
                    </tr>
                    <%for (int i = 0; i < countDaoTao; i++)
                        {%>
                    <tr style="text-align: left !important;">
                        <td style="width: 3%;"><%=i+1 %></td>
                        <td style="width: 20%;"><%=lstDaoTao[i].Name %></td>
                        <td style="width: 20%;">
                            <input type="checkbox" name="" id="DT<%=lstDaoTao[i].ID %>" class="arrDaoTao" value="<%=lstDaoTao[i].ID %>" /></td>
                    </tr>
                    <%} %>

                    <tr style="text-align: left; font-weight: bold;">
                        <td style="width: 3%;">II</td>
                        <td style="width: 20%;">Trình độ đào tạo</td>
                        <td style="width: 20%;">&nbsp;</td>
                    </tr>
                    <%for (int i = 0; i < countTrinhDoDaoTao; i++)
                        {%>
                    <tr style="text-align: left !important;">
                        <td style="width: 3%;"><%=i+1 %></td>
                        <td style="width: 20%;"><%=lstTrinhDoDaoTao[i].Name %></td>
                        <td style="width: 20%;">
                            <input type="checkbox" name="" id="DT<%=lstTrinhDoDaoTao[i].ID %>" class="arrTrinhDoDaoTao" value="<%=lstTrinhDoDaoTao[i].ID %>" /></td>
                    </tr>
                    <%} %>

                    <tr style="text-align: left; font-weight: bold;">
                        <td style="width: 3%;">III</td>
                        <td style="width: 20%;">Chứng chỉ về CNTT, ATTT hoặc tương đương</td>
                        <td style="width: 20%;">&nbsp;</td>
                    </tr>
                    <%for (int i = 0; i < countChungChi; i++)
                        {%>
                    <tr style="text-align: left !important;">
                        <td style="width: 3%;"><%=i+1 %></td>
                        <td style="width: 20%;"><%=lstChungChi[i].Name %></td>
                        <td style="width: 20%;">
                            <input type="checkbox" name="" id="DT<%=lstChungChi[i].ID %>" class="arrChungChi" value="<%=lstChungChi[i].ID %>" /></td>
                    </tr>
                    <%} %>
                </tbody>
                <tfoot></tfoot>
            </table>

            <%--<a href="javascript: void(0)" id="btnAddDaoTao">Lưu lại</a>--%>
        </div>

    </div>

    <div id="KinhNghiemDaoTaoModal" class="my-modal">

        <!-- Modal content -->
        <div class="modal-content">
            <span class="close">&times;</span>
            <table class="thanh-vien">
                <thead>
                    <tr>
                        <th>TT</th>
                        <th>Phân loại</th>
                        <th>&nbsp;</th>
                    </tr>
                </thead>
                <tbody>
                    <tr style="text-align: left; font-weight: bold;">
                        <td style="width: 3%;">I</td>
                        <td style="width: 20%;">Chuyên gia quản lý ATTT</td>
                        <td style="width: 20%;">&nbsp;</td>
                    </tr>
                    <%for (int i = 0; i < countQuanLyATTT; i++)
                        {%>
                    <tr style="text-align: left !important;">
                        <td style="width: 3%;"><%=i+1 %></td>
                        <td style="width: 20%;"><%=lstQuanLyATTT[i].Name %></td>
                        <td style="width: 20%;">
                            <input type="checkbox" name="" id="KN<%=lstQuanLyATTT[i].ID %>" class="arrQuanLyATTT" value="<%=lstQuanLyATTT[i].ID %>" /></td>
                    </tr>
                    <%} %>

                    <tr style="text-align: left; font-weight: bold;">
                        <td style="width: 3%;">II</td>
                        <td style="width: 20%;">Chuyên gia kỹ thuật phòng thủ, chống tấn công</td>
                        <td style="width: 20%;">&nbsp;</td>
                    </tr>
                    <%for (int i = 0; i < countKyThuatPhongThu; i++)
                        {%>
                    <tr style="text-align: left !important;">
                        <td style="width: 3%;"><%=i+1 %></td>
                        <td style="width: 20%;"><%=lstKyThuatPhongThu[i].Name %></td>
                        <td style="width: 20%;">
                            <input type="checkbox" name="" id="KN<%=lstKyThuatPhongThu[i].ID %>" class="arrKyThuatPhongThu" value="<%=lstKyThuatPhongThu[i].ID %>" /></td>
                    </tr>
                    <%} %>

                    <tr style="text-align: left; font-weight: bold;">
                        <td style="width: 3%;">III</td>
                        <td style="width: 20%;">Chuyên gia kỹ thuật bảo vệ an toàn hệ thống và ứng dụng</td>
                        <td style="width: 20%;">&nbsp;</td>
                    </tr>
                    <%for (int i = 0; i < countKyThuatBaoVe; i++)
                        {%>
                    <tr style="text-align: left !important;">
                        <td style="width: 3%;"><%=i+1 %></td>
                        <td style="width: 20%;"><%=lstKyThuatBaoVe[i].Name %></td>
                        <td style="width: 20%;">
                            <input type="checkbox" name="" id="KN<%=lstKyThuatBaoVe[i].ID %>" class="arrKyThuatBaoVe" value="<%=lstKyThuatBaoVe[i].ID %>" /></td>
                    </tr>
                    <%} %>

                    <tr style="text-align: left; font-weight: bold;">
                        <td style="width: 3%;">IV</td>
                        <td style="width: 20%;">Chuyên gia kỹ thuật kiểm tra, đánh giá ATTT</td>
                        <td style="width: 20%;">&nbsp;</td>
                    </tr>
                    <%for (int i = 0; i < countKyThuatKiemTra; i++)
                        {%>
                    <tr style="text-align: left !important;">
                        <td style="width: 3%;"><%=i+1 %></td>
                        <td style="width: 20%;"><%=lstKyThuatKiemTra[i].Name %></td>
                        <td style="width: 20%;">
                            <input type="checkbox" name="" id="KN<%=lstKyThuatKiemTra[i].ID %>" class="arrKyThuatKiemTra" value="<%=lstKyThuatKiemTra[i].ID %>" /></td>
                    </tr>
                    <%} %>
                </tbody>
                <tfoot></tfoot>
            </table>
        </div>

    </div>
    <script>
        $(document).ready(function () {
            // Bien luu element hien tai
            var currentElement,
                currLinhVucDT, currTrinhDoDT, currChungChi,
                currQuanLyATTT, currKyThuatPhongThu, currKyThuatKiemTra, currKyThuatBaoVe;

            // Get the modal
            var modal = document.getElementById('DaoTaoModal');
            var modal2 = document.getElementById('KinhNghiemDaoTaoModal');

            //// Get the button that opens the modal
            //var btn = document.getElementById("btnDaoTao");
            //var btn2 = document.getElementById("btnChungChi");

            // Get the <span> element that closes the modal
            var span = document.getElementsByClassName("close")[0];
            var span2 = document.getElementsByClassName("close")[1];

            //// When the user clicks on the button, open the modal
            //btn.onclick = function () {
            //    modal.style.display = "block";
            //}
            //btn2.onclick = function () {
            //    modal2.style.display = "block";
            //}
            $('.btnDaoTao').click(function () {
                currentElement = this;
                modal.style.display = "block";
                $('#DaoTaoModal input[type=checkbox]').prop('checked', false);

                // Linh vuc dao tao
                currLinhVucDT = $(currentElement).attr('data-linhvucdt');
                if (currLinhVucDT) {
                    var tmp = currLinhVucDT.split(',');
                    for (var i = 0; i < tmp.length; i++) {
                        $('#DT' + tmp[i]).prop('checked', true);
                    }
                }

                // Trinh do dao tao
                currTrinhDoDT = $(currentElement).attr('data-trinhdodt');
                if (currTrinhDoDT) {
                    var tmp = currTrinhDoDT.split(',');
                    for (var i = 0; i < tmp.length; i++) {
                        $('#DT' + tmp[i]).prop('checked', true);
                    }
                }

                // Chung chi
                currChungChi = $(currentElement).attr('data-chungchi');
                if (currChungChi) {
                    var tmp = currChungChi.split(',');
                    for (var i = 0; i < tmp.length; i++) {
                        $('#DT' + tmp[i]).prop('checked', true);
                    }
                }
            });
            $('.btnChungChi').click(function () {
                currentElement = this;
                modal2.style.display = "block";
                $('#KinhNghiemDaoTaoModal input[type=checkbox]').prop('checked', false);

                // Quan ly ATTT
                currQuanLyATTT = $(currentElement).attr('data-quanlyattt');
                if (currQuanLyATTT) {
                    var tmp = currQuanLyATTT.split(',');
                    for (var i = 0; i < tmp.length; i++) {
                        $('#KN' + tmp[i]).prop('checked', true);
                    }
                }

                // Ky thuat phong thu
                currKyThuatPhongThu = $(currentElement).attr('data-kythuatphongthu');
                if (currKyThuatPhongThu) {
                    var tmp = currKyThuatPhongThu.split(',');
                    for (var i = 0; i < tmp.length; i++) {
                        $('#KN' + tmp[i]).prop('checked', true);
                    }
                }

                // Ky thuat kiem tra
                currKyThuatKiemTra = $(currentElement).attr('data-kythuatkiemtra');
                if (currKyThuatKiemTra) {
                    var tmp = currKyThuatKiemTra.split(',');
                    for (var i = 0; i < tmp.length; i++) {
                        $('#KN' + tmp[i]).prop('checked', true);
                    }
                }

                // Ky thuat bao ve
                currKyThuatBaoVe = $(currentElement).attr('data-kythuatbaove');
                if (currKyThuatBaoVe) {
                    var tmp = currKyThuatBaoVe.split(',');
                    for (var i = 0; i < tmp.length; i++) {
                        $('#KN' + tmp[i]).prop('checked', true);
                    }
                }
            });

            // When the user clicks on <span> (x), close the modal
            function fnSpanOnclick() {
                modal.style.display = "none";
                //var arrDaoTao = $('.arrDaoTao').is(':checked');
                $(currentElement).attr("data-linhvucdt", getValues('.arrDaoTao'));
                $(currentElement).attr("data-trinhdodt", getValues('.arrTrinhDoDaoTao'));
                $(currentElement).attr("data-chungchi", getValues('.arrChungChi'));
            };
            span.onclick = fnSpanOnclick;

            span2.onclick = function () {
                modal2.style.display = "none";
                $(currentElement).attr("data-quanlyattt", getValues('.arrQuanLyATTT'));
                $(currentElement).attr("data-kythuatphongthu", getValues('.arrKyThuatPhongThu'));
                $(currentElement).attr("data-kythuatbaove", getValues('.arrKyThuatBaoVe'));
                $(currentElement).attr("data-kythuatkiemtra", getValues('.arrKyThuatKiemTra'));
            }

            // When the user clicks anywhere outside of the modal, close it
            window.onclick = function (event) {
                if (event.target == modal) {
                    modal.style.display = "none";
                    $(currentElement).attr("data-linhvucdt", getValues('.arrDaoTao'));
                    $(currentElement).attr("data-trinhdodt", getValues('.arrTrinhDoDaoTao'));
                    $(currentElement).attr("data-chungchi", getValues('.arrChungChi'));
                }
                if (event.target == modal2) {
                    modal2.style.display = "none";
                    $(currentElement).attr("data-quanlyattt", getValues('.arrQuanLyATTT'));
                    $(currentElement).attr("data-kythuatphongthu", getValues('.arrKyThuatPhongThu'));
                    $(currentElement).attr("data-kythuatbaove", getValues('.arrKyThuatBaoVe'));
                    $(currentElement).attr("data-kythuatkiemtra", getValues('.arrKyThuatKiemTra'));
                }
            }

            function getValues(e) {
                var values = $(e).map(function () {
                    if ($(this).is(':checked'))
                        return $(this).val();
                }).toArray().join(',');
                return values;
            }

            //var d = 1;
            var d = <%=d%>;
            $('#btnAppend').click(function () {
                d++;
                var rnd = Math.floor(Math.random() * 999999);
                var html = "<tr class='nhanLuc'>";
                html += "<td style='width: 3%;'>" + d + "</td>";
                html += "<td style='width: 20%;'>";
                html += "<input name='NameNhanLuc' maxlength='255' id='' class='textstyle1 input' type='text' value='' /></td>";
                html += "<td style='width: 20%;'>";
                html += "<input name='School' maxlength='255' id='' class='textstyle1 input' type='text' value='' /></td>";
                html += "<td style='width: 10%;'><a href='javascript: void(0)' class='btnDaoTao dt" + rnd + "'>+ Chi tiết</a></td>";
                html += "<td style='width: 13%;'><a href='javascript: void(0)' class='btnChungChi cc" + rnd + "'>+ Chi tiết</a></td>";
                html += "<td style='width: 1%;'>";
                html += "<input name='NamTotNghiep' maxlength='255' id='' class='textstyle1 input' type='text' value='' style='width: 60px;' /></td>";
                html += "<td style='width: 1%;'><a href='javascript: void(0)' class='btnRemove" + rnd + "'>Xóa</a></td>";
                html += "</tr>";
                $('#append').before(html);

                $('.dt' + rnd).click(function () {
                    currentElement = this;
                    modal.style.display = "block";
                    $('#DaoTaoModal input[type=checkbox]').prop('checked', false);

                    // Linh vuc dao tao
                    currLinhVucDT = $(currentElement).attr('data-linhvucdt');
                    if (currLinhVucDT) {
                        var tmp = currLinhVucDT.split(',');
                        for (var i = 0; i < tmp.length; i++) {
                            $('#DT' + tmp[i]).prop('checked', true);
                        }
                    }

                    // Trinh do dao tao
                    currTrinhDoDT = $(currentElement).attr('data-trinhdodt');
                    if (currTrinhDoDT) {
                        var tmp = currTrinhDoDT.split(',');
                        for (var i = 0; i < tmp.length; i++) {
                            $('#DT' + tmp[i]).prop('checked', true);
                        }
                    }

                    // Chung chi
                    currChungChi = $(currentElement).attr('data-chungchi');
                    if (currChungChi) {
                        var tmp = currChungChi.split(',');
                        for (var i = 0; i < tmp.length; i++) {
                            $('#DT' + tmp[i]).prop('checked', true);
                        }
                    }
                });
                $('.cc' + rnd).click(function () {
                    currentElement = this;
                    modal2.style.display = "block";
                    $('#KinhNghiemDaoTaoModal input[type=checkbox]').prop('checked', false);

                    // Quan ly ATTT
                    currQuanLyATTT = $(currentElement).attr('data-quanlyattt');
                    if (currQuanLyATTT) {
                        var tmp = currQuanLyATTT.split(',');
                        for (var i = 0; i < tmp.length; i++) {
                            $('#KN' + tmp[i]).prop('checked', true);
                        }
                    }

                    // Ky thuat phong thu
                    currKyThuatPhongThu = $(currentElement).attr('data-kythuatphongthu');
                    if (currKyThuatPhongThu) {
                        var tmp = currKyThuatPhongThu.split(',');
                        for (var i = 0; i < tmp.length; i++) {
                            $('#KN' + tmp[i]).prop('checked', true);
                        }
                    }

                    // Ky thuat kiem tra
                    currKyThuatKiemTra = $(currentElement).attr('data-kythuatkiemtra');
                    if (currKyThuatKiemTra) {
                        var tmp = currKyThuatKiemTra.split(',');
                        for (var i = 0; i < tmp.length; i++) {
                            $('#KN' + tmp[i]).prop('checked', true);
                        }
                    }

                    // Ky thuat bao ve
                    currKyThuatBaoVe = $(currentElement).attr('data-kythuatbaove');
                    if (currKyThuatBaoVe) {
                        var tmp = currKyThuatBaoVe.split(',');
                        for (var i = 0; i < tmp.length; i++) {
                            $('#KN' + tmp[i]).prop('checked', true);
                        }
                    }
                });
                $('.btnRemove' + rnd).click(function () { $(this).parent().parent().remove(); d--; });
            });

            $('.btnRemove').click(function () {
                $(this).parent().parent().remove();
                d--;
            });

            // Onchange checkbox gov
            $('#IsGOV').change(function (x) {
                if ($(this).is(':checked')) $(this).val(1);
                else $(this).val(0);
            })
        });
    </script>
    <!-- End Modal -->

    <script>
        $('#btnThem').click(function () {
            var ranNum = Math.floor(Math.random() * 999999).toString();
            var html = '<p class="MsoNormal Del' + ranNum + '" style="margin-top: 6.0pt;"><input name="" maxlength="255" id="" class="textstyle1 input" type="text" value="" /></span></p>';
            var html1 = '<p class="MsoNormal Del' + ranNum + '" style="margin-top: 6.0pt;"><a href="javascript:fnDel(' + ranNum + ')">Xóa</a></span></p>';
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

            var nhanLucs = '';
            var elementNhanLuc = $('.nhanLuc');
            //console.log(elementNhanLuc);
            for (var i = 0; i < elementNhanLuc.length; i++) {
                var nhanLuc = '';
                var name = $(elementNhanLuc[i]).find('input[name=NameNhanLuc]').val();
                var school = $(elementNhanLuc[i]).find('input[name=School]').val();
                var linhvucdt = $(elementNhanLuc[i]).find('a[class*="btnDaoTao"]').attr('data-linhvucdt');
                var trinhdodt = $(elementNhanLuc[i]).find('a[class*="btnDaoTao"]').attr('data-trinhdodt');
                var chungchi = $(elementNhanLuc[i]).find('a[class*="btnDaoTao"]').attr('data-chungchi');
                var quanlyattt = $(elementNhanLuc[i]).find('a[class*="btnChungChi"]').attr('data-quanlyattt');
                var kythuatphongthu = $(elementNhanLuc[i]).find('a[class*="btnChungChi"]').attr('data-kythuatphongthu');
                var kythuatbaove = $(elementNhanLuc[i]).find('a[class*="btnChungChi"]').attr('data-kythuatbaove');
                var kythuatkiemtra = $(elementNhanLuc[i]).find('a[class*="btnChungChi"]').attr('data-kythuatkiemtra');
                var namTN = $(elementNhanLuc[i]).find('input[name=NamTotNghiep]').val();

                if (name) {
                    if (!school) school = '';
                    if (!linhvucdt) linhvucdt = '';
                    if (!trinhdodt) trinhdodt = '';
                    if (!chungchi) chungchi = '';
                    if (!quanlyattt) quanlyattt = '';
                    if (!kythuatphongthu) kythuatphongthu = '';
                    if (!kythuatbaove) kythuatbaove = '';
                    if (!kythuatkiemtra) kythuatkiemtra = '';
                    nhanLuc = name + '_' + school + '_' + linhvucdt + '_' + trinhdodt + '_' + chungchi + '_' + quanlyattt + '_' + kythuatphongthu + '_' + kythuatbaove + '_' + kythuatkiemtra + '_' + namTN;
                    nhanLucs += nhanLuc + '|';
                }
            }
            //console.log(nhanLucs);
            $('#NhanLuc').val(nhanLucs);
        }
    </script>

</form>
