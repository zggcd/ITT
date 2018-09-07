<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModHSThanhVienUCSCModel;
    var entity = ViewBag.Data as ModHSThanhVienUCSCEntity;
    var entityDM = ViewBag.DauMoi as ModDauMoiUCSCEntity;

    List<ModHeThongThongTinEntity> currHTTT = ViewBag.HTTT as List<ModHeThongThongTinEntity> ?? new List<ModHeThongThongTinEntity>();
    List<WebMenuEntity> lstCapDo = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "CapDo" && o.ParentID > 0).ToList_Cache();
    int countCapDo = lstCapDo != null ? lstCapDo.Count : 0;
    int countHeThong = 0;

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

    // Danh sach ngan luc
    List<ModNhanLucUCSCEntity> lstNhanLuc = ViewBag.NhanLuc as List<ModNhanLucUCSCEntity> ?? new List<ModNhanLucUCSCEntity>();
    int countNhanLuc = lstNhanLuc != null ? lstNhanLuc.Count : 0;

    // Danh sach tong hop theo LinhVucDaoDao
    List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucLVDT = ViewBag.ListTongHopNhanLucLVDT as List<ModTongHopNhanLucUCSCEntity> ?? ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "LinhVucDaoDao");
    // Danh sach tong hop theo TrinhDoDaoTao
    List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucTDDT = ViewBag.ListTongHopNhanLucTDDT as List<ModTongHopNhanLucUCSCEntity> ?? ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "TrinhDoDaoTao");
    // Danh sach tong hop theo ChungChi
    List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucCC = ViewBag.ListTongHopNhanLucCC as List<ModTongHopNhanLucUCSCEntity> ?? ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "ChungChi");


    // Danh sach tong hop theo nhom chuyen gia QuanLyATTT
    List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomATTT = ViewBag.ListTongHopNhanLucNhomATTT as List<ModTongHopNhanLucUCSCEntity> ?? ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "QuanLyATTT");
    // Danh sach tong hop theo nhom chuyen gia KyThuatPhongThu
    List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTPT = ViewBag.ListTongHopNhanLucNhomKTPT as List<ModTongHopNhanLucUCSCEntity> ?? ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "KyThuatPhongThu");
    // Danh sach tong hop theo nhom chuyen gia KyThuatBaoVe
    List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTBV = ViewBag.ListTongHopNhanLucNhomKTBV as List<ModTongHopNhanLucUCSCEntity> ?? ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "KyThuatBaoVe");
    // Danh sach tong hop theo nhom chuyen gia KyThuatKiemTra
    List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTKT = ViewBag.ListTongHopNhanLucNhomKTKT as List<ModTongHopNhanLucUCSCEntity> ?? ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "KyThuatKiemTra");
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
                    <legend>THÔNG TIN CHUNG VỀ TỔ CHỨC</legend>
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
                <fieldset class="adminform">
                    <legend>THÔNG TIN VỀ SỐ LƯỢNG NHÂN LỰC LIÊN QUAN ĐẾN CNTT, ATTT HOẶC TƯƠNG ĐƯƠNG</legend>

                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                        <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Thông tin về Số lượng nhân lực liên quan đến CNTT, ATTT hoặc tương đương</span></b>
                    </p>
                    <table class="admintable" style="width: 100%">
                        <thead>
                            <tr>
                                <th style="width: 4%;">TT</th>
                                <th>Phân loại</th>
                                <th style="width: 17%;">Số lượng (người)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="tongHopNhanLuc boldTitle">
                                <td>1</td>
                                <td class="tongHopTitle">Số lượng cán bộ theo lĩnh vực đào tạo</td>
                                <td>&nbsp;</td>
                            </tr>
                            <%for (int i = 0; i < lstTongHopNhanLucLVDT.Count; i++)%>
                            <%{ %>
                            <tr class="tongHopNhanLuc tongHopNhanLucLVDT">
                                <td><%= ((char) (65+i)).ToString().ToLower() %>)</td>
                                <td class="tongHopTitle"><%=lstTongHopNhanLucLVDT[i].Name %></td>
                                <td>
                                    <input type="number" name="TongHopNhanLucInput" max="999999" id="" class="textstyle1 input" value="<%= lstTongHopNhanLucLVDT[i].MenuID_Value > 0 ? lstTongHopNhanLucLVDT[i].MenuID_Value.ToString() : "" %>" menu-id="<%= lstTongHopNhanLucLVDT[i].MenuID%>" autocomplete="off">
                                </td>
                            </tr>
                            <%} %>

                            <tr class="tongHopNhanLuc boldTitle">
                                <td>2</td>
                                <td class="tongHopTitle">Số lượng cán bộ phân theo trình độ đào tạo</td>
                                <td>&nbsp;</td>
                            </tr>
                            <%for (int i = 0; i < lstTongHopNhanLucTDDT.Count; i++)%>
                            <%{ %>
                            <tr class="tongHopNhanLuc tongHopNhanLucTDDT">
                                <td><%= ((char) (65+i)).ToString().ToLower() %>)</td>
                                <td class="tongHopTitle"><%=lstTongHopNhanLucTDDT[i].Name %></td>
                                <td>
                                    <input type="number" name="TongHopNhanLucInput" max="999999" id="" class="textstyle1 input" value="<%= lstTongHopNhanLucTDDT[i].MenuID_Value > 0 ? lstTongHopNhanLucTDDT[i].MenuID_Value.ToString() : "" %>" menu-id="<%= lstTongHopNhanLucTDDT[i].MenuID%>" autocomplete="off">
                                </td>
                            </tr>
                            <%} %>

                            <tr class="tongHopNhanLuc boldTitle">
                                <td>3</td>
                                <td class="tongHopTitle">Số lượng cán bộ có chứng chỉ về CNTT, ATTT hoặc tương đương</td>
                                <td>&nbsp;</td>
                            </tr>
                            <%for (int i = 0; i < lstTongHopNhanLucCC.Count; i++)%>
                            <%{ %>
                            <tr class="tongHopNhanLuc tongHopNhanLucCC">
                                <td><%= ((char) (65+i)).ToString().ToLower() %>)</td>
                                <td class="tongHopTitle"><%=lstTongHopNhanLucCC[i].Name %></td>
                                <td>
                                    <input type="number" name="TongHopNhanLucInput" max="999999" id="" class="textstyle1 input" value="<%= lstTongHopNhanLucCC[i].MenuID_Value > 0 ? lstTongHopNhanLucCC[i].MenuID_Value.ToString() : "" %>" menu-id="<%= lstTongHopNhanLucCC[i].MenuID%>" autocomplete="off">
                                </td>
                            </tr>
                            <%} %>
                        </tbody>
                    </table>

                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                        <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Thông tin về Số lượng nhân lực có kinh nghiệm, được đào tạo về ATTT</span></b>
                    </p>
                    <table class="admintable" style="width: 100%">
                        <thead>
                            <tr>
                                <th style="width: 4%;">TT</th>
                                <th>Phân loại</th>
                                <th style="width: 17%;">Số lượng (người)</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="tongHopNhanLuc boldTitle">
                                <td>1</td>
                                <td class="tongHopTitle">Nhóm chuyên gia quản lý ATTT</td>
                                <td>&nbsp;</td>
                            </tr>
                            <%for (int i = 0; i < lstTongHopNhanLucNhomATTT.Count; i++)%>
                            <%{ %>
                            <tr class="tongHopNhanLuc tongHopNhanLucNhomATTT">
                                <td><%= ((char) (65+i)).ToString().ToLower() %>)</td>
                                <td class="tongHopTitle"><%=lstTongHopNhanLucNhomATTT[i].Name %></td>
                                <td>
                                    <input type="number" name="TongHopNhanLucInput" max="999999" id="" class="textstyle1 input" value="<%= lstTongHopNhanLucNhomATTT[i].MenuID_Value > 0 ? lstTongHopNhanLucNhomATTT[i].MenuID_Value.ToString() : "" %>" menu-id="<%= lstTongHopNhanLucNhomATTT[i].MenuID%>" autocomplete="off">
                                </td>
                            </tr>
                            <%} %>

                            <tr class="tongHopNhanLuc boldTitle">
                                <td>2</td>
                                <td class="tongHopTitle">Nhóm chuyên gia kỹ thuật phòng thủ, chống tấn công</td>
                                <td>&nbsp;</td>
                            </tr>
                            <%for (int i = 0; i < lstTongHopNhanLucNhomKTPT.Count; i++)%>
                            <%{ %>
                            <tr class="tongHopNhanLuc tongHopNhanLucNhomKTPT">
                                <td><%= ((char) (65+i)).ToString().ToLower() %>)</td>
                                <td class="tongHopTitle"><%=lstTongHopNhanLucNhomKTPT[i].Name %></td>
                                <td>
                                    <input type="number" name="TongHopNhanLucInput" max="999999" id="" class="textstyle1 input" value="<%= lstTongHopNhanLucNhomKTPT[i].MenuID_Value > 0 ? lstTongHopNhanLucNhomKTPT[i].MenuID_Value.ToString() : "" %>" menu-id="<%= lstTongHopNhanLucNhomKTPT[i].MenuID%>" autocomplete="off">
                                </td>
                            </tr>
                            <%} %>

                            <tr class="tongHopNhanLuc boldTitle">
                                <td>3</td>
                                <td class="tongHopTitle">Nhóm chuyên gia kỹ thuật bảo vệ an toàn hệ thống và ứng dụng</td>
                                <td>&nbsp;</td>
                            </tr>
                            <%for (int i = 0; i < lstTongHopNhanLucNhomKTBV.Count; i++)%>
                            <%{ %>
                            <tr class="tongHopNhanLuc tongHopNhanLucNhomKTBV">
                                <td><%= ((char) (65+i)).ToString().ToLower() %>)</td>
                                <td class="tongHopTitle"><%=lstTongHopNhanLucNhomKTBV[i].Name %></td>
                                <td>
                                    <input type="number" name="TongHopNhanLucInput" max="999999" id="" class="textstyle1 input" value="<%= lstTongHopNhanLucNhomKTBV[i].MenuID_Value > 0 ? lstTongHopNhanLucNhomKTBV[i].MenuID_Value.ToString() : "" %>" menu-id="<%= lstTongHopNhanLucNhomKTBV[i].MenuID%>" autocomplete="off">
                                </td>
                            </tr>
                            <%} %>

                            <tr class="tongHopNhanLuc boldTitle">
                                <td>4</td>
                                <td class="tongHopTitle">Nhóm chuyên gia kỹ thuật kiểm tra, đánh giá ATTT</td>
                                <td>&nbsp;</td>
                            </tr>
                            <%for (int i = 0; i < lstTongHopNhanLucNhomKTKT.Count; i++)%>
                            <%{ %>
                            <tr class="tongHopNhanLuc tongHopNhanLucNhomKTKT">
                                <td><%= ((char) (65+i)).ToString().ToLower() %>)</td>
                                <td class="tongHopTitle"><%=lstTongHopNhanLucNhomKTKT[i].Name %></td>
                                <td>
                                    <input type="number" name="TongHopNhanLucInput" max="999999" id="" class="textstyle1 input" value="<%= lstTongHopNhanLucNhomKTKT[i].MenuID_Value > 0 ? lstTongHopNhanLucNhomKTKT[i].MenuID_Value.ToString() : "" %>" menu-id="<%= lstTongHopNhanLucNhomKTKT[i].MenuID%>" autocomplete="off">
                                </td>
                            </tr>
                            <%} %>
                        </tbody>
                    </table>
                </fieldset>

                <fieldset class="adminform">
                    <legend>THÔNG TIN VỀ NHÂN LỰC, CHUYÊN GIA AN TOÀN THÔNG TIN, CÔNG NGHỆ THÔNG TIN VÀ TƯƠNG ĐƯƠNG</legend>
                    <table class="admintable">
                        <tr>
                            <td>
                                <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" style='border-collapse: collapse; mso-padding-alt: 0in 0in 0in 0in'>
                                    <thead>
                                        <tr>
                                            <th style="width: 3%;">TT</th>
                                            <th style="width: 17%;">Họ và tên</th>
                                            <th style="width: 20%;">Tên trường, cơ sở đào tạo</th>
                                            <th style="width: 25%;">Chuyên ngành đào tạo, bồi dưỡng</th>
                                            <th>Văn bằng, chứng chỉ, trình độ về ATTT, CNTT hoặc tương đương</th>
                                            <th style="width: 8%;">Tháng/năm tốt nghiệp</th>
                                            <th style="width: 1%;">&nbsp;</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <%for (int i = 0; i < countNhanLuc; i++)
                                            {
                                        %>
                                        <tr class="nhanLuc">
                                            <td class='nhanLucTT'><%=i+1 %></td>
                                            <td>
                                                <input autocomplete="off" name="NhanLucName" maxlength="250" id="" class="textstyle1 input" type="text" value="<%=lstNhanLuc[i].Name %>" /></td>
                                            <td>
                                                <input autocomplete="off" name="School" maxlength="250" id="" class="textstyle1 input" type="text" value="<%=lstNhanLuc[i].School %>" /></td>
                                            <td><a href="javascript: void(0)" class="btnDaoTao" data-linhvucdt="<%=lstNhanLuc[i].MenuIDs_LinhVucDT %>" data-trinhdodt="<%=lstNhanLuc[i].MenuIDs_TrinhDoDT %>" data-chungchi="<%=lstNhanLuc[i].MenuIDs_ChungChi %>">+ Chi tiết</a></td>
                                            <td><a href="javascript: void(0)" class="btnChungChi" data-quanlyattt="<%=lstNhanLuc[i].MenuIDs_QuanLyATTT %>" data-kythuatphongthu="<%=lstNhanLuc[i].MenuIDs_KyThuatPhongThu %>" data-kythuatbaove="<%=lstNhanLuc[i].MenuIDs_KyThuatBaoVe %>" data-kythuatkiemtra="<%=lstNhanLuc[i].MenuIDs_KyThuatKiemTra %>">+ Chi tiết</a></td>
                                            <td>
                                                <input autocomplete="off" name="NamTotNghiep" maxlength="250" id="" class="textstyle1 input" type="text" value="<%=lstNhanLuc[i].NamTotNghiep > 0 ? (lstNhanLuc[i].ThangTotNghiep + "/" + lstNhanLuc[i].NamTotNghiep) : "" %>" style="width: 60px;" />
                                            </td>
                                            <td><a href="javascript: void(0)" class="btnRemove">Xóa</a></td>
                                        </tr>
                                        <%}
                                            d = countNhanLuc + 1; %>
                                        <tr class="nhanLuc">
                                            <td class='nhanLucTT' style="width: 3%;"><%=d %></td>
                                            <td>
                                                <input name="NhanLucName" maxlength="250" id="" class="textstyle1 input" type="text" value="" autocomplete="off" /></td>
                                            <td>
                                                <input name="School" maxlength="250" id="" class="textstyle1 input" type="text" value="" /></td>
                                            <td><a href="javascript: void(0)" class="btnDaoTao">+ Chi tiết</a></td>
                                            <td><a href="javascript: void(0)" class="btnChungChi">+ Chi tiết</a></td>
                                            <td>
                                                <input name="NamTotNghiep" maxlength="250" id="" class="textstyle1 input" type="text" value="" style="width: 60px;" />
                                            </td>
                                            <td><a href="javascript: void(0)" class="btnRemove">Xóa</a></td>
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

                <fieldset class="adminform">
                    <legend>Các hệ thống thông tin thuộc phạm vi phụ trách hoặc cung cấp dịch vụ</legend>

                    <table id="TblHTTT" class="thanh-vien" style="width: 100%;" border="1">
                        <thead>
                            <tr>
                                <th width="5%">STT</th>
                                <th width="20%">Cấp</th>
                                <th>Thông tin</th>
                                <th width="5%"></th>
                            </tr>
                        </thead>
                        <tbody>
                            <%  int lnHt = 2;
                                List<ModHeThongThongTinEntity> ht = null;
                                if (currHTTT != null && currHTTT.Count > 0)
                                {
                                    ht = currHTTT;
                                    lnHt = ht.Count;
                                }

                                for (int i = 0; i < lnHt; i++)
                                {
                                    var name = "";
                                    if (lnHt > i && ht != null) name = ht[i].Name;
                                    countHeThong += 1;
                            %>
                            <tr id="Row<%=(i+1) %>">
                                <td><%=(i+1) %>
                                </td>
                                <td>
                                    <select style="width: 100%; height: 80px" onchange="selectCapDo(this, <%=(i+1) %>)">
                                        <%for (int j = 0; j < lstCapDo.Count; j++)
                                            { %>
                                        <option <%if (ht != null && ht[i].MenuID == lstCapDo[j].ID)
                                            { %>selected<%} %>
                                            value="<%=lstCapDo[j].ID %>"><%=lstCapDo[j].Name %></option>
                                        <%} %>
                                    </select>
                                </td>
                                <td>
                                    <textarea id="M<%=(i+1) %>" data-m="<%=ht!=null?ht[i].MenuID:lstCapDo[0].ID %>" name="HTTT<%=(i+1) %>" class="textstyle1" rows="3" style="max-width: 90%; width: 90%; max-height: 300px; font-family: Arial, Helvetica, sans-serif"><%=name %></textarea>
                                </td>
                                <td>
                                    <a href="javascript:fnDel(<%=(i+1) %>)" data-idx="<%=(i+1) %>">Xóa</a>
                                </td>
                            </tr>
                            <%} %>
                        </tbody>
                    </table>
                    <br />
                    <a href="javascript:void(0)" id="btnThem">+ Thêm</a>
                </fieldset>
            </div>

            <%--<div class="width-30 fltrt">
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
                                        <input name="Activity" <%= entity.Activity ? "checked" : "" %> type="radio" value='1' />Có
                                       
                                        <input name="Activity" <%= !entity.Activity ? "checked" : "" %> type="radio" value='0' />Không
                                    </td>
                                </tr>
                                <%} %>
                            </table>
                        </div>
                    </div>
                </div>
            </div>--%>
            <input type="hidden" name="M" value="" id="M" />
            <input type="hidden" name="NhanLuc" value="" id="NhanLuc" />
            <input type="hidden" name="TongHopNhanLucLVDT" value="" id="TongHopNhanLucLVDT" />
            <input type="hidden" name="TongHopNhanLucTDDT" value="" id="TongHopNhanLucTDDT" />
            <input type="hidden" name="TongHopNhanLucCC" value="" id="TongHopNhanLucCC" />
            <input type="hidden" name="TongHopNhanLucNhomATTT" value="" id="TongHopNhanLucNhomATTT" />
            <input type="hidden" name="TongHopNhanLucNhomKTPT" value="" id="TongHopNhanLucNhomKTPT" />
            <input type="hidden" name="TongHopNhanLucNhomKTBV" value="" id="TongHopNhanLucNhomKTBV" />
            <input type="hidden" name="TongHopNhanLucNhomKTKT" value="" id="TongHopNhanLucNhomKTKT" />
            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>


    <!-- ============================= ITT UPDATE BY TUNGNQ START: MODAL ============================= -->
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
                html += "<td class='nhanLucTT' style='width: 3%;'>" + d + "</td>";
                html += "<td>";
                html += "<input autocomplete='off' name='NhanLucName' maxlength='255' id='' class='textstyle1 input' type='text' value='' /></td>";
                html += "<td>";
                html += "<input autocomplete='off' name='School' maxlength='255' id='' class='textstyle1 input' type='text' value='' /></td>";
                html += "<td><a href='javascript: void(0)' class='btnDaoTao dt" + rnd + "'>+ Chi tiết</a></td>";
                html += "<td><a href='javascript: void(0)' class='btnChungChi cc" + rnd + "'>+ Chi tiết</a></td>";
                html += "<td>";
                html += "<input autocomplete='off' name='NamTotNghiep' maxlength='255' id='' class='textstyle1 input' type='text' value='' style='width: 60px;' /></td>";
                html += "<td><a href='javascript: void(0)' class='btnRemove" + rnd + "'>Xóa</a></td>";
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
                $('.btnRemove' + rnd).click(function () {
                    $(this).parent().parent().remove();
                    d--;

                    var elementNhanLucTT = $('.nhanLucTT');
                    for (var i = 0; i < d; i++) {
                        $(elementNhanLucTT[i]).html(i + 1);
                    }
                });
            });

            $('.btnRemove').click(function () {
                $(this).parent().parent().remove();
                d--;

                var elementNhanLucTT = $('.nhanLucTT');
                for (var i = 0; i < d; i++) {
                    $(elementNhanLucTT[i]).html(i + 1);
                }
            });

            // Onchange checkbox gov
            $('.IsGOV').change(function (x) {
                if ($(this).is(':checked')) $(this).val(1);
                else $(this).val(0);
            })
        });
    </script>
    <!-- ============================== ITT UPDATE BY TUNGNQ END: MODAL ============================== -->


    <script type="text/javascript">
        function selectCapDo(obj, ind) {
            $("#M" + ind).attr('data-m', $(obj)[0].value);
        }

        var indexM = <%=countHeThong%> + 1;
        var lstId = [];
        for (var j = 0; j < <%=countHeThong%>; j++) {
            lstId.push(j + 1);
        }

        $('#btnThem').click(function () {
            $("#TblHTTT tbody").append('<tr id="Row' + indexM + '">' +
                '<td>' + indexM +
                '</td>' +
                '<td>' +
                ' <select style="width: 100%; height: 80px" onchange="selectCapDo(this, ' + indexM + ')">' +
            <%for (int j = 0; j < lstCapDo.Count; j++)%>
            <%{ %>
            '<option value="<%=lstCapDo[j].ID %>"><%=lstCapDo[j].Name %></option>' +
            <%} %>
                '</select>' +
                '</td>' +
                '<td>' +
                '<textarea id="M' + indexM + '" data-m="<%=lstCapDo[0].ID %>" name="HTTT' + indexM + '" class="textstyle1" rows="3" style="max-width: 90%; width: 90%; max-height: 300px; font-family: Arial, Helvetica, sans-serif"></textarea>' +
                '</td>' +
                '<td>' +
                '<a href="javascript:fnDel(' + indexM + ')" data-idx="' + indexM + '">Xóa</a>' +
                '</td>' +
                '</tr>');
            lstId.push(indexM);
            indexM++;
        });

        function fnDel(r) {
            $('#Row' + r).remove();
            lstId.splice(lstId.indexOf(r), 1);
        }

        function fnSubmit() {
            var s = '';
            for (var i = 0; i < lstId.length; i++) {
                var m = $('#M' + lstId[i]).attr('data-m');
                s += m + '_';
                s += $('#M' + lstId[i]).val() + '|';
            }
            $('#M').val(s.substr(0, s.length - 1));

            var nhanLucs = '';
            var elementNhanLuc = $('.nhanLuc');
            for (var i = 0; i < elementNhanLuc.length; i++) {
                var nhanLuc = '';
                var name = $(elementNhanLuc[i]).find('input[name=NhanLucName]').val();
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
            $('#NhanLuc').val(nhanLucs);
            /* ===================================================== */
            /* ===================================================== */
            var arrTongHopNhanLuc = [];
            var elementTongHopNhanLucLVDT = $('.tongHopNhanLucLVDT');
            for (var i = 0; i < elementTongHopNhanLucLVDT.length; i++) {
                var tongHopNhanLuc = '';
                var menuId = $(elementTongHopNhanLucLVDT[i]).find('input[name=TongHopNhanLucInput]').attr("menu-id");
                var menuId_Value = $(elementTongHopNhanLucLVDT[i]).find('input[name=TongHopNhanLucInput]').val();

                if (menuId_Value) {
                    arrTongHopNhanLuc.push(menuId + '_' + menuId_Value);
                } else {
                    arrTongHopNhanLuc.push(menuId + '_0');
                }
            }
            $('#TongHopNhanLucLVDT').val(arrTongHopNhanLuc.join("|"));

            arrTongHopNhanLuc = [];
            elementTongHopNhanLucTDDT = $('.tongHopNhanLucTDDT');
            for (var i = 0; i < elementTongHopNhanLucTDDT.length; i++) {
                var tongHopNhanLuc = '';
                var menuId = $(elementTongHopNhanLucTDDT[i]).find('input[name=TongHopNhanLucInput]').attr("menu-id");
                var menuId_Value = $(elementTongHopNhanLucTDDT[i]).find('input[name=TongHopNhanLucInput]').val();

                if (menuId_Value) {
                    arrTongHopNhanLuc.push(menuId + '_' + menuId_Value);
                } else {
                    arrTongHopNhanLuc.push(menuId + '_0');
                }
            }
            $('#TongHopNhanLucTDDT').val(arrTongHopNhanLuc.join("|"));

            arrTongHopNhanLuc = [];
            elementTongHopNhanLucCC = $('.tongHopNhanLucCC');
            for (var i = 0; i < elementTongHopNhanLucCC.length; i++) {
                var tongHopNhanLuc = '';
                var menuId = $(elementTongHopNhanLucCC[i]).find('input[name=TongHopNhanLucInput]').attr("menu-id");
                var menuId_Value = $(elementTongHopNhanLucCC[i]).find('input[name=TongHopNhanLucInput]').val();

                if (menuId_Value) {
                    arrTongHopNhanLuc.push(menuId + '_' + menuId_Value);
                } else {
                    arrTongHopNhanLuc.push(menuId + '_0');
                }
            }
            $('#TongHopNhanLucCC').val(arrTongHopNhanLuc.join("|"));

            arrTongHopNhanLuc = [];
            elementTongHopNhanLucNhomATTT = $('.tongHopNhanLucNhomATTT');
            for (var i = 0; i < elementTongHopNhanLucNhomATTT.length; i++) {
                var tongHopNhanLuc = '';
                var menuId = $(elementTongHopNhanLucNhomATTT[i]).find('input[name=TongHopNhanLucInput]').attr("menu-id");
                var menuId_Value = $(elementTongHopNhanLucNhomATTT[i]).find('input[name=TongHopNhanLucInput]').val();

                if (menuId_Value) {
                    arrTongHopNhanLuc.push(menuId + '_' + menuId_Value);
                } else {
                    arrTongHopNhanLuc.push(menuId + '_0');
                }
            }
            $('#TongHopNhanLucNhomATTT').val(arrTongHopNhanLuc.join("|"));

            arrTongHopNhanLuc = [];
            elementTongHopNhanLucNhomKTPT = $('.tongHopNhanLucNhomKTPT');
            for (var i = 0; i < elementTongHopNhanLucNhomKTPT.length; i++) {
                var tongHopNhanLuc = '';
                var menuId = $(elementTongHopNhanLucNhomKTPT[i]).find('input[name=TongHopNhanLucInput]').attr("menu-id");
                var menuId_Value = $(elementTongHopNhanLucNhomKTPT[i]).find('input[name=TongHopNhanLucInput]').val();

                if (menuId_Value) {
                    arrTongHopNhanLuc.push(menuId + '_' + menuId_Value);
                } else {
                    arrTongHopNhanLuc.push(menuId + '_0');
                }
            }
            $('#TongHopNhanLucNhomKTPT').val(arrTongHopNhanLuc.join("|"));

            arrTongHopNhanLuc = [];
            elementTongHopNhanLucNhomKTBV = $('.tongHopNhanLucNhomKTBV');
            for (var i = 0; i < elementTongHopNhanLucNhomKTBV.length; i++) {
                var tongHopNhanLuc = '';
                var menuId = $(elementTongHopNhanLucNhomKTBV[i]).find('input[name=TongHopNhanLucInput]').attr("menu-id");
                var menuId_Value = $(elementTongHopNhanLucNhomKTBV[i]).find('input[name=TongHopNhanLucInput]').val();

                if (menuId_Value) {
                    arrTongHopNhanLuc.push(menuId + '_' + menuId_Value);
                } else {
                    arrTongHopNhanLuc.push(menuId + '_0');
                }
            }
            $('#TongHopNhanLucNhomKTBV').val(arrTongHopNhanLuc.join("|"));

            arrTongHopNhanLuc = [];
            elementTongHopNhanLucNhomKTKT = $('.tongHopNhanLucNhomKTKT');
            for (var i = 0; i < elementTongHopNhanLucNhomKTKT.length; i++) {
                var tongHopNhanLuc = '';
                var menuId = $(elementTongHopNhanLucNhomKTKT[i]).find('input[name=TongHopNhanLucInput]').attr("menu-id");
                var menuId_Value = $(elementTongHopNhanLucNhomKTKT[i]).find('input[name=TongHopNhanLucInput]').val();

                if (menuId_Value) {
                    arrTongHopNhanLuc.push(menuId + '_' + menuId_Value);
                } else {
                    arrTongHopNhanLuc.push(menuId + '_0');
                }
            }
            $('#TongHopNhanLucNhomKTKT').val(arrTongHopNhanLuc.join("|"));
        }

        fnSubmit();
    </script>

</form>
