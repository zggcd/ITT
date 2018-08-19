<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HL.Lib.Global.CPLogin.IsLoginOnWeb())
        {
            Response.Redirect("/vn/Thanh-vien/Dang-nhap.aspx?ReturnPath=" + HttpUtility.ParseQueryString(Request.RawUrl));
            return;
        }
    }
</script>

<%
    CPUserEntity entity = ViewBag.Data as CPUserEntity ?? CPLogin.CurrentUser;
    ModBaoCaoSuCoEntity sc = ViewBag.BCSuCo as ModBaoCaoSuCoEntity ?? new ModBaoCaoSuCoEntity();
    ModBaoCaoBanDauSuCoEntity entityBc = ViewBag.BaoCao as ModBaoCaoBanDauSuCoEntity ?? new ModBaoCaoBanDauSuCoEntity();
    List<ModInfoMagicEntity> currCachThuc = ViewBag.CachThuc as List<ModInfoMagicEntity> ?? new List<ModInfoMagicEntity>();
    List<ModInfoMagicEntity> currThongBao = ViewBag.ThongBao as List<ModInfoMagicEntity> ?? new List<ModInfoMagicEntity>();
    List<ModInfoMagicEntity> currDichVu = ViewBag.DichVu as List<ModInfoMagicEntity> ?? new List<ModInfoMagicEntity>();
    List<ModInfoMagicEntity> currBienPhap = ViewBag.BienPhap as List<ModInfoMagicEntity> ?? new List<ModInfoMagicEntity>();
    List<ModInfoMagicEntity> currThongTinGuiKem = ViewBag.ThongTinGuiKem as List<ModInfoMagicEntity> ?? new List<ModInfoMagicEntity>();

    string strCachThuc = string.Join(",", currCachThuc.Select(o => o.MenuID));
    string strThongBao = string.Join(",", currThongBao.Select(o => o.MenuID));
    string strDichVu = string.Join(",", currDichVu.Select(o => o.MenuID));
    string strBienPhap = string.Join(",", currBienPhap.Select(o => o.MenuID));
    string strThongTinGuiKem = string.Join(",", currThongTinGuiKem.Select(o => o.MenuID));
    int isEdit = ViewBag.IsEdit ?? 0;
    string endCode = ViewBag.EndCode;

    List<WebMenuEntity> lstCapDo = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "CapDo" && o.ParentID > 0).ToList_Cache();
    int countCapDo = lstCapDo != null ? lstCapDo.Count : 0;

    List<WebMenuEntity> lstHienTrang = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "HienTrangSuCo" && o.ParentID > 0).ToList_Cache();
    int countHienTrang = lstHienTrang != null ? lstHienTrang.Count : 0;

    List<WebMenuEntity> lstCachThuc = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "CachThuc" && o.ParentID > 0).OrderByAsc(o => o.IsAddText).ToList_Cache();
    int countCachThuc = lstCachThuc != null ? lstCachThuc.Count : 0;

    List<WebMenuEntity> lstThongBao = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "GuiThongBaoSuCo" && o.ParentID > 0).ToList_Cache();
    int countThongBao = lstThongBao != null ? lstThongBao.Count : 0;

    List<WebMenuEntity> lstDichVu = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "DichVu" && o.ParentID > 0).ToList_Cache();
    int countDichVu = lstDichVu != null ? lstDichVu.Count : 0;

    List<WebMenuEntity> lstBienPhap = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "BienPhapATTT" && o.ParentID > 0).ToList_Cache();
    int countBienPhap = lstBienPhap != null ? lstBienPhap.Count : 0;

    List<WebMenuEntity> lstThongTinGuiKem = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "ThongTinGuiKem" && o.ParentID > 0).ToList_Cache();
    int countThongTinGuiKem = lstThongTinGuiKem != null ? lstThongTinGuiKem.Count : 0;

    WebMenuEntity menu = WebMenuService.Instance.GetByID(sc.MenuID);
%>

<style>
    .textstyle1 {
        border: none !important;
        border-bottom: 1px dotted !important;
        padding: 0 !important;
    }

    .name {
        width: 30% !important;
    }

    .input {
        width: 70% !important;
    }

    .radio_loaitaikhoan td {
        padding-right: 10px;
    }

    .radio_loaitaikhoan input {
        margin: 0 4px 0 0 !important;
    }

    .QAcustom {
        color: white !important;
        float: left;
        background: #015ab4 none repeat scroll 0 0 !important;
    }

    .hidediv {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        background-color: #000;
        -ms-opacity: 0.7;
        opacity: 0.7;
        display: none;
        z-index: 10000;
    }

    .wait {
        padding: 5px;
        background-color: #fff;
        width: 300px;
        border: 1px solid #333;
        position: fixed;
        display: none;
        top: 30%;
        left: 40%;
        z-index: 10001;
        text-align: center;
        line-height: 20px;
        background: #d4d4d4;
        -ms-border-radius: 6px;
        border-radius: 6px;
        -ms-opacity: 0.8;
        opacity: 0.8;
    }

    .Waiting {
        display: inline !important;
    }
</style>

<div class="row-fluid titleContainer">
    <span>BÁO CÁO BAN ĐẦU SỰ CỐ MẠNG</span>
</div>

<div class="contentNews">
    <div class="main_right">
        <%--        <div class="box-category mb10">
            <div class="vanban-new">
                <h3 class="title-list-news">
                    <span class="title-t1">BÁO CÁO BAN ĐẦU SỰ CỐ MẠNG</span>
                </h3>
            </div>
        </div>--%>
        <!--//#box-news-x-->
        <div class="vanban_right">
            <div class="contents">
                <div class="top">

                    <form method="post" enctype="multipart/form-data">
                        <div class="g-search">
                            <div class="box_content_input">
                                <div class="WordSection1">

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                    </p>

                                    <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0"
                                        style='border-collapse: collapse; border: none;'>
                                        <tr>
                                            <td width="231" valign="top" style='width: 173.4pt; border: none; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                                </p>
                                            </td>
                                            <td width="359" valign="top" style='width: 269.4pt; border: solid windowtext 1.0pt; border-left: none; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <a name="chuong_pl_4">
                                                        <b>
                                                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Mẫu số 03</span>
                                                        </b>
                                                    </a><b>
                                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                                            <br>
                                                        </span>
                                                    </b><i>
                                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Ban hành kèm theo Thông tư số 20/2017/TT-BTTT ngày 12/9/2017 của Bộ Thông tin và Truyền thông</span>
                                                    </i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                    </p>

                                    <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                        <a>
                                            <b>
                                                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>BÁO CÁO BAN ĐẦU SỰ CỐ MẠNG</span>
                                            </b>
                                        </a><b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'></span>
                                        </b>
                                    </p>

                                    <div class="clear-20">&nbsp;</div>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>THÔNG TIN VỀ TỔ CHỨC/CÁ NHÂN BÁO CÁO SỰ CỐ</span>
                                        </b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Tên tổ chức/cá nhân báo cáo sự cố (*)</span>
                                        <input name="ToChuc_Ten" maxlength="255" id="ToChuc_Ten" class="textstyle1" type="text" value="<%=sc.Name %>" disabled />
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'> Địa chỉ: (*)</span>
                                        <input name="ToChuc_DiaChi" maxlength="255" id="ToChuc_DiaChi" class="textstyle1" type="text" value="<%=sc.Address %>" disabled />
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'> Điện thoại (*)</span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                            <input name="ToChuc_DienThoai" maxlength="255" id="ToChuc_DienThoai" class="textstyle1" type="text" value="<%=sc.Phone %>" disabled />
                                            Email (*) 
                                    <input name="ToChuc_Email" maxlength="255" id="ToChuc_Email" class="textstyle1" type="text" value="<%=sc.Email %>" disabled />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>NGƯỜI LIÊN HỆ</span>
                                        </b><b>
                                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                        </b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'> Họ và tên (*)</span>
                                        <input name="NguoiLienHe_Ten" maxlength="255" id="NguoiLienHe_Ten" class="textstyle1" type="text" value="<%=entityBc.NguoiLienHe_Ten %>" />
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Chức vụ:</span>
                                        <input name="NguoiLienHe_ChucVu" maxlength="255" id="NguoiLienHe_ChucVu" class="textstyle1" type="text" value="<%=entityBc.NguoiLienHe_ChucVu %>" />
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'> Điện thoại (*)</span>
                                        <input name="NguoiLienHe_DienThoai" maxlength="255" id="NguoiLienHe_DienThoai" class="textstyle1" type="text" value="<%=entityBc.NguoiLienHe_DienThoai %>" />
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Email (*)</span>
                                        <input name="NguoiLienHe_Email" maxlength="255" id="NguoiLienHe_Email" class="textstyle1" type="text" value="<%=entityBc.NguoiLienHe_Email %>" />
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>THÔNG TIN CHI TIẾT VỀ HỆ THỐNG BỊ SỰ CỐ</span>
                                        </b>
                                    </p>

                                    <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0"
                                        style='border-collapse: collapse; border: none;'>
                                        <tr>
                                            <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Tên đơn vị vận hành hệ thống thông tin (*): </span>
                                                </p>
                                            </td>
                                            <td width="378" colspan="5" valign="top" style='width: 283.55pt; border: solid windowtext 1.0pt; border-left: none; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <i>
                                                        <input name="ChiTiet_TenDonVi" maxlength="255" id="ChiTiet_TenDonVi" class="textstyle1" type="text" value="<%=entityBc.ChiTiet_TenDonVi %>" placeholder="Điền tên đơn vị vận hành hoặc được thuê vận hành hệ thống thông tin " />
                                                    </i>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Cơ quan chủ quản:</span>
                                                </p>
                                            </td>
                                            <td width="378" colspan="5" valign="top" style='width: 283.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <i>
                                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                                            <input name="ChiTiet_CoQuan" maxlength="255" id="ChiTiet_CoQuan" class="textstyle1" type="text" value="<%=entityBc.ChiTiet_CoQuan %>" placeholder="Điền tên cơ quan chủ quản" />
                                                        </span>
                                                    </i>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Tên hệ thống bị sự cố</span>
                                                </p>
                                            </td>
                                            <td width="378" colspan="5" valign="top" style='width: 283.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <i>
                                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                                            <input name="ChiTiet_TenHeThong" maxlength="255" id="ChiTiet_TenHeThong" class="textstyle1" type="text" value="<%=entityBc.ChiTiet_TenHeThong %>" placeholder="Điền tên hệ thống bị sự cố và tên miền, địa chỉ ip liên quan" />
                                                        </span>
                                                    </i>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Phân loại cấp độ của hệ thống thông tin (nếu có)</span>
                                                </p>
                                            </td>
                                            <%for (int i = 0; i < countCapDo && i < 5; i++)
                                                {%>
                                            <td width="75" valign="top" style='width: 56.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <input name="ChiTiet_PhanLoaiID" <%= entityBc.ChiTiet_PhanLoaiID == lstCapDo[i].ID ? "checked" : "" %> type="radio" value='<%=lstCapDo[i].ID %>' />
                                                    <%=lstCapDo[i].Name %>
                                                </p>
                                            </td>
                                            <%} %>
                                        </tr>
                                        <tr>
                                            <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Tổ chức cung cấp dịch vụ an toàn thông tin (nếu có):</span>
                                                </p>
                                            </td>
                                            <td width="378" colspan="5" valign="top" style='width: 283.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <i>
                                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                                            <input name="ChiTiet_TenToChucCungCap" maxlength="255" id="ChiTiet_TenToChucCungCap" class="textstyle1" type="text" value="<%=entityBc.ChiTiet_TenToChucCungCap %>" placeholder="Điền tên nhà cung cấp ở đây" />
                                                        </span>
                                                    </i>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Tên nhà cung cấp dịch vụ kết nối bên ngoài (nếu có)</span>
                                                </p>
                                            </td>
                                            <td width="378" colspan="5" valign="top" style='width: 283.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <i>
                                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                                            <input name="ChiTiet_TenNCC_BenNgoai" maxlength="255" id="ChiTiet_TenNCC_BenNgoai" class="textstyle1" type="text" value="<%=entityBc.ChiTiet_TenNCC_BenNgoai %>" placeholder="Điền tên nhà cung cấp ở đây" />
                                                        </span>
                                                    </i>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Điền tên nhà cung cấp ở đây</span>
                                                </p>
                                            </td>
                                            <td width="378" colspan="5" valign="top" style='width: 283.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <i>
                                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                                            <input name="ChiTiet_TenNCC" maxlength="255" id="ChiTiet_TenNCC" class="textstyle1" type="text" value="<%=entityBc.ChiTiet_TenNCC %>" placeholder="Điền thông tin ở đây" />
                                                        </span>
                                                    </i>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'></span>
                                    </p>

                                    <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse; border: none;'>
                                        <tr>
                                            <td width="605" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Mô tả sơ bộ về sự cố (*)</span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="605" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.25pt'>
                                                    <i>
                                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Đề nghị cung cấp một bản tóm tắt ngắn gọn về sự cố, bao gồm đánh giá sơ bộ cuộc tấn công đã xảy ra chưa và bất kỳ các nguy cơ dẫn đến khả năng phá hoại hoặc gián đoạn dịch vụ. Cũng vui lòng xác định mức độ nhạy cảm của thông tin liên quan hoặc những đối tượng bị ảnh hưởng bởi sự cố</span>
                                                    </i>
                                                </p>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.25pt'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                                        <textarea name="ChiTiet_MoTa" maxlength="255" id="ChiTiet_MoTa" class="textstyle1" rows="5" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.ChiTiet_MoTa %></textarea>
                                                    </span>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                    </p>

                                    <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0"
                                        style='border-collapse: collapse; border: none;'>
                                        <tr>
                                            <td valign="top" style='width: 140.8pt; border: solid windowtext 1.0pt; border-right: none; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Ngày phát hiện sự cố (*) (dd/mm/yy)</span>
                                                </p>
                                            </td>
                                            <td style='width: 33.45pt; border-top: solid windowtext 1.0pt; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: none; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <input name="Ngay" maxlength="255" id="" class="textstyle1" type="text" value="<%=string.Format("{0:dd/MM/yyyy}", entityBc.ChiTiet_NgayGioPhatHien) %>" style="width: 80px;" />
                                                </p>
                                            </td>
                                            <td width="52" style='width: 38.7pt; border: solid windowtext 1.0pt; border-left: none; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'></span>
                                                </p>
                                            </td>
                                            <td style='width: 105.2pt; border: solid windowtext 1.0pt; border-left: none; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Thời gian phát hiện (*):</span>
                                                </p>
                                            </td>
                                            <td width="147" style='width: 109.9pt; border: solid windowtext 1.0pt; border-left: none; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                                        <input name="Gio" maxlength="255" id="" class="textstyle1" type="text" value="<%=string.Format("{0:HH}", entityBc.ChiTiet_NgayGioPhatHien) %>" style="width: 20%;" />
                                                    </span>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>giờ
                                                    <input name="Phut" maxlength="255" id="" class="textstyle1" type="text" value="<%=string.Format("{0:mm}", entityBc.ChiTiet_NgayGioPhatHien) %>" style="width: 20%;" />
                                                        phút
                                                    </span>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <b>
                                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>HIỆN TRẠNG SỰ CỐ (*)</span>
                                        </b>
                                    </p>

                                    <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" style='border-collapse: collapse;'>
                                        <tr>
                                            <%for (int i = 0; i < countHienTrang; i++)
                                                {%>
                                            <td width="302" valign="top" style='width: 226.75pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <input name="HienTrangID" <%= entityBc.HienTrangID == lstHienTrang[i].ID ? "checked" : "" %> type="radio" value='<%=lstHienTrang[i].ID %>' /><%=lstHienTrang[i].Name %>
                                                </p>
                                            </td>
                                            <%} %>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>CÁCH THỨC PHÁT HIỆN *</span>
                                        </b><i>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>(Đánh dấu những cách thức được sử dụng để phát hiện sự cố)</span>
                                        </i>
                                    </p>

                                    <%int d = 0;
                                        for (int i = 0; i < countCachThuc; i++)
                                        {
                                            string chk = "", val = "";
                                            if (strCachThuc.IndexOf(lstCachThuc[i].ID.ToString()) > -1)
                                            {
                                                chk = "checked";
                                                var ct = currCachThuc.Where(o => o.MenuID == lstCachThuc[i].ID).SingleOrDefault();
                                                if (ct != null) val = ct.Name;
                                            }
                                            string addText = "0_" + d.ToString();   //0: Chekbox ko them truong text; 1: Checkbox them truong text
                                            if (lstCachThuc[i].IsAddText == true)
                                            {
                                                addText = "1_" + d.ToString();
                                                d++;
                                            }
                                    %>
                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                                            <input name="chkCachThuc" type="checkbox" value="" onchange="setChkStatus(this, '<%=addText + "_" + lstCachThuc[i].ID %>')" <%=chk %> />
                                            <%=lstCachThuc[i].Name %>
                                            <%if (lstCachThuc[i].IsAddText == true)
                                                {%>
                                            <input name="txtCachThuc" maxlength="255" id="" class="textstyle1" type="text" value="<%=val %>" />
                                            <%} %>
                                        </span>
                                    </p>
                                    <%} %>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>ĐÃ GỬI THÔNG BÁO SỰ CỐ CHO *</span>
                                        </b>
                                    </p>

                                    <%d = 0;
                                        for (int i = 0; i < countThongBao; i++)
                                        {
                                            string chk = "", val = "";
                                            if (strThongBao.IndexOf(lstThongBao[i].ID.ToString()) > -1)
                                            {
                                                chk = "checked";
                                                var ct = currThongBao.Where(o => o.MenuID == lstThongBao[i].ID).SingleOrDefault();
                                                if (ct != null) val = ct.Name;
                                            }
                                            string addText = "0_" + d.ToString();   //0: Chekbox ko them truong text; 1: Checkbox them truong text
                                            if (lstThongBao[i].IsAddText == true)
                                            {
                                                addText = "1_" + d.ToString();
                                                d++;
                                            }
                                    %>
                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                                            <input name="chkThongBao" type="checkbox" value="" onchange="setChkStatus(this, '<%=addText + "_" + lstThongBao[i].ID %>')" <%=chk %> />
                                            <%=lstThongBao[i].Name %>
                                            <%if (lstThongBao[i].IsAddText == true)
                                                {%>
                                            <input name="txtThongBao" maxlength="255" id="" class="textstyle1" type="text" value="<%=val %>" />
                                            <%} %>
                                        </span>
                                    </p>
                                    <%} %>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>THÔNG TIN BỔ SUNG VỀ HỆ THỐNG XẢY RA SỰ CỐ </span>
                                        </b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Hệ điều hành</span>
                                        <input name="TTThem_HeDieuHanh" maxlength="255" id="TTThem_HeDieuHanh" class="textstyle1" type="text" value="<%=entityBc.TTThem_HeDieuHanh %>" />
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Version</span>
                                        <input name="TTThem_Version" maxlength="255" id="TTThem_Version" class="textstyle1" type="text" value="<%=entityBc.TTThem_Version %>" />
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Các dịch vụ có trên hệ thống
                <i>(Đánh dấu những dịch vụ được sử dụng trên hệ thống)</i>
                                        </span>
                                    </p>

                                    <%d = 0;
                                        for (int i = 0; i < countDichVu; i++)
                                        {
                                            string chk = "", val = "";
                                            if (strDichVu.IndexOf(lstDichVu[i].ID.ToString()) > -1)
                                            {
                                                chk = "checked";
                                                var ct = currDichVu.Where(o => o.MenuID == lstDichVu[i].ID).SingleOrDefault();
                                                if (ct != null) val = ct.Name;
                                            }
                                            string addText = "0_" + d.ToString();   //0: Chekbox ko them truong text; 1: Checkbox them truong text
                                            if (lstDichVu[i].IsAddText == true)
                                            {
                                                addText = "1_" + d.ToString();
                                                d++;
                                            }
                                    %>
                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                                            <input name="chkDichVu" type="checkbox" value="" onchange="setChkStatus(this, '<%=addText + "_" + lstDichVu[i].ID %>')" <%=chk %> />
                                            <%=lstDichVu[i].Name %>
                                            <%if (lstDichVu[i].IsAddText == true)
                                                {%>
                                            <input name="txtDichVu" maxlength="255" id="" class="textstyle1" type="text" value="<%=val %>" />
                                            <%} %>
                                        </span>
                                    </p>
                                    <%} %>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;
                Các biện pháp an toàn thông tin đã triển khai <i>(Đánh dấu những biện pháp đã triển khai)</i>
                                        </span>
                                    </p>

                                    <%d = 0;
                                        for (int i = 0; i < countBienPhap; i++)
                                        {
                                            string chk = "", val = "";
                                            if (strBienPhap.IndexOf(lstBienPhap[i].ID.ToString()) > -1)
                                            {
                                                chk = "checked";
                                                var ct = currBienPhap.Where(o => o.MenuID == lstBienPhap[i].ID).SingleOrDefault();
                                                if (ct != null) val = ct.Name;
                                            }
                                            string addText = "0_" + d.ToString();   //0: Chekbox ko them truong text; 1: Checkbox them truong text
                                            if (lstBienPhap[i].IsAddText == true)
                                            {
                                                addText = "1_" + d.ToString();
                                                d++;
                                            }
                                    %>
                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                                            <input name="chkBienPhap" type="checkbox" value="" onchange="setChkStatus(this, '<%=addText + "_" + lstBienPhap[i].ID %>')" <%=chk %> />
                                            <%=lstBienPhap[i].Name %>
                                            <%if (lstBienPhap[i].IsAddText == true)
                                                {%>
                                            <input name="txtBienPhap" maxlength="255" id="" class="textstyle1" type="text" value="<%=val %>" />
                                            <%} %>
                                        </span>
                                    </p>
                                    <%} %>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Các địa chỉ IP của hệ thống <i>(Liệt kê địa chỉ IP sử dụng trên Internet, không liệt kê địa chỉ IP nội bộ)</i></span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <i>
                                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                                <textarea name="TTThem_DanhSachIP" maxlength="255" id="TTThem_DanhSachIP" class="textstyle1" rows="3" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.TTThem_DanhSachIP %></textarea>
                                            </span>
                                        </i>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Các tên miền của hệ thống </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <i>
                                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                                <textarea name="TTThem_DanhSachTenMien" maxlength="255" id="TTThem_DanhSachTenMien" class="textstyle1" rows="3" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.TTThem_DanhSachTenMien %></textarea>
                                            </span>
                                        </i>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Mục đích chính sử dụng hệ thống</span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <textarea name="TTThem_MucDichSuDung" maxlength="255" id="TTThem_MucDichSuDung" class="textstyle1" rows="3" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.TTThem_MucDichSuDung %></textarea>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Thông tin gửi kèm</span>
                                    </p>

                                    <%d = 0;
                                        for (int i = 0; i < countThongTinGuiKem; i++)
                                        {
                                            string chk = "", val = "";
                                            if (strThongTinGuiKem.IndexOf(lstThongTinGuiKem[i].ID.ToString()) > -1)
                                            {
                                                chk = "checked";
                                                var ct = currThongTinGuiKem.Where(o => o.MenuID == lstThongTinGuiKem[i].ID).SingleOrDefault();
                                                if (ct != null) val = ct.Name;
                                            }
                                            string addText = "0_" + d.ToString();   //0: Chekbox ko them truong text; 1: Checkbox them truong text
                                            if (lstThongTinGuiKem[i].IsAddText == true)
                                            {
                                                addText = "1_" + d.ToString();
                                                d++;
                                            }
                                    %>
                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                                            <input name="chkThongTinGuiKem" type="checkbox" value="" onchange="setChkStatus(this, '<%=addText + "_" + lstThongTinGuiKem[i].ID %>')" <%=chk %> />
                                            <%=lstThongTinGuiKem[i].Name %>
                                            <%if (lstThongTinGuiKem[i].IsAddText == true)
                                                {%>
                                            <input name="txtThongTinGuiKem" maxlength="255" id="" class="textstyle1" type="text" value="<%=val %>" />
                                            <%} %>
                                        </span>
                                    </p>
                                    <%} %>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Các thông tin cung cấp trong thông báo sự cố này đều phải được giữ bí mật:
                                        <input name="GiuBiMat" <%= entityBc.GiuBiMat ? "checked" : "" %> type="radio" value='1' />
                                            Có
                                    <input name="GiuBiMat" <%= !entityBc.GiuBiMat ? "checked" : "" %> type="radio" value='0' />
                                            Không
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>KIẾN NGHỊ, ĐỀ XUẤT HỖ TRỢ</span>
                                        </b>
                                    </p>

                                    <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse; border: none;'>
                                        <tr>
                                            <td width="590" valign="top" style='width: 6.15in; border: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Mô tả về đề xuất, kiến nghị</span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="590" valign="top" style='width: 6.15in; border: solid windowtext 1.0pt; border-top: none; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 419.85pt'>
                                                    <i>
                                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Đề nghị cung cấp tóm lược về các kiến nghị và đề xuất hỗ trợ ứng cứu (nếu có)</span>
                                                    </i>
                                                </p>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 419.85pt'>
                                                    <textarea name="Content" maxlength="255" id="Content" class="textstyle1" rows="5" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.Content %></textarea>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>THỜI GIAN THỰC HIỆN BÁO CÁO SỰ CỐ</span>
                                        </b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>*:</span>
                                        <input name="ThoiGian" maxlength="255" id="" class="textstyle1" type="text" value="<%=string.Format("{0:dd/MM/yyyy/HH/mm}", entityBc.ThoiGianThucHien) %>" />
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>(ngày/tháng/năm/giờ/phút)</span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                    </p>

                                    <div class="clear-20">&nbsp;</div>
                                    <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"
                                        style='border-collapse: collapse;'>
                                        <tr>
                                            <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                                </p>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                                </p>
                                            </td>
                                            <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <b>
                                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>CÁ NHÂN/NGƯỜI ĐẠI DIỆN THEO PHÁP LUẬT<br>
                                                        </span>
                                                    </b><i>
                                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>(Ký tên, đóng dấu)</span>
                                                    </i><b>
                                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                                    </b>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <i>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Chú thích:</span>
                                        </i><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                                            <i>1. Phần (*) là những thông tin bắt buộc. Các phần còn lại có thể loại bỏ nếu không có thông tin.</i>
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <i>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>2. Sử dụng tiêu đề (subject) bắt đầu bằng "[TBSC]" khi gửi thông báo qua email</span>
                                        </i>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <i>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>3. Tham khảo thêm tại website của VNCERT (www.vncert.gov vn)</span>
                                        </i>
                                    </p>

                                </div>

                                <div class="clear-20">&nbsp;</div>
                                <div class="button">
                                    <input type="hidden" name="endCode" value="<%=endCode %>" />
                                    <%if (menu != null & menu.Code != "KetThuc")
                                        {%>
                                    <%if (isEdit == 1)
                                        {%>
                                    <input class="btn btn-success" name="_hl_action[UpdateBCBanDauUCSC]" value="Cập nhật" type="submit" />
                                    <%}
                                        else
                                        {%>
                                    <input class="btn btn-success" name="_hl_action[AddBCBanDauUCSC]" value="Lưu" type="submit" />
                                    <%}%>
                                    <%}%>

                                    <input class="btn btn-danger" style="margin-left: 10px;" onclick="location.href = '/vn/Bao-cao-su-co/<%=endCode %>.aspx';" type="button" name="" value="Hủy" />
                                </div>

                            </div>
                        </div>
                        <script>
                            $(document).ready(function () {
                                $('input[name=chkCachThuc]').change();
                                $('input[name=chkThongBao]').change();
                                $('input[name=chkDichVu]').change();
                                $('input[name=chkBienPhap]').change();
                                $('input[name=chkThongTinGuiKem]').change();
                            });

                            function setChkStatus(e, suffix) {
                                //if (e.checked) e.value = '1_' + suffix;
                                //else e.value = '0_' + suffix;
                                e.value = suffix;
                            }
                        </script>
                    </form>
                </div>
                <!--.Main_container-->

            </div>
        </div>
    </div>
</div>
