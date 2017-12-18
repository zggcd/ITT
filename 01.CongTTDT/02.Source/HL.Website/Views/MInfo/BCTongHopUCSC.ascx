<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HL.Lib.Global.CPLogin.IsLogin())
        {
            Response.Redirect("/vn/Thanh-vien/Dang-nhap.aspx?ReturnPath=" + HttpUtility.ParseQueryString("/vn/Thanh-vien/Them-bc-ket-thuc-su-co.aspx"));
            return;
        }
    }
</script>

<%
    CPUserEntity entity = ViewBag.Data as CPUserEntity ?? CPLogin.CurrentUser;
    ModBaoCaoTongHopEntity entityBc = ViewBag.BaoCao as ModBaoCaoTongHopEntity ?? new ModBaoCaoTongHopEntity();
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

<div class="main_right">
    <div class="box-category mb10">
        <div class="vanban-new">
            <h3 class="title-list-news">
                <span class="title-t1">BÁO CÁO BAN ĐẦU SỰ CỐ MẠNG</span>
            </h3>
        </div>
    </div>
    <!--//#box-news-x-->
    <div class="vanban_right">
        <div class="contents">
            <div class="top">

                <form method="post" enctype="multipart/form-data">
                    <div class="g-search">
                        <div class="box_content_input">
                            <div class="WordSection1">

                                <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                        <td width="231" valign="top" style='width: 173.4pt; border: none; border-right: solid windowtext 1.0pt; mso-border-right-alt: solid windowtext .5pt; padding: 0in 5.4pt 0in 5.4pt'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'></span>
                                            </p>
                                        </td>
                                        <td width="359" valign="top" style='width: 269.4pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 5.4pt 0in 5.4pt'>
                                            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <a name="chuong_pl_6">
                                                    <b style='mso-bidi-font-weight: normal'>
                                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Mãu số 05</span>
                                                    </b>
                                                </a>
                                                <b style='mso-bidi-font-weight: normal'>
                                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                        <br>
                                                    </span>
                                                </b>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Ban hành kèm theo Thông tư số 20/2017/TT-BTTT ngày 12/9/2017 của Bộ Thông tin và Truyền thông </span>
                                                </i><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'></span>
                                            </p>
                                        </td>
                                    </tr>
                                </table>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
                                </p>

                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM</span>
                                    </b><b style='mso-bidi-font-weight: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                            <br>
                                        </span>
                                    </b><b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Độc lập - Tự do - Hạnh phúc</span>
                                    </b>
                                </p>

                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Kính gửi: <b style='mso-bidi-font-weight: normal'>Trung tâm Ứng cứu khẩn cấp máy tính Việt Nam</b></span>
                                </p>

                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                    <a name="chuong_pl_6_name">
                                        <b style='mso-bidi-font-weight: normal'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>BÁO CÁO TỔNG HỢP [06 THÁNG/ 01 NĂM] VỀ HOẠT ĐỘNG TIẾP NHẬN VÀ XỬ LÝ SỰ CỐ</span>
                                        </b>
                                    </a><span style='mso-bookmark: chuong_pl_6_name'></span><b style='mso-bidi-font-weight: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
                                    </b>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9633; Từ tháng</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>…..</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                /201 ... đến tháng tháng ..../201...<o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Tên cơ quan/tổ chức:</span>
                                    <input name="TenToChuc" maxlength="255" id="TenToChuc" class="textstyle1" type="text" value="<%=entityBc.TenToChuc %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Địa chỉ:</span>
                                    <input name="DiaChi" maxlength="255" id="DiaChi" class="textstyle1" type="text" value="<%=entityBc.DiaChi %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Mã thành viên mạng lưới:</span>
                                    <input name="MaThanhVien" maxlength="255" id="MaThanhVien" class="textstyle1" type="text" value="<%=entityBc.MaThanhVien %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>1. Số lượng sự cố và cách thức xử lý</span>
                                </p>

                                <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"
                                    style='border-collapse: collapse; mso-padding-alt: 0in 0in 0in 0in'>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
                                        <td width="208" style='width: 155.7pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Lo&#7841;i
                            s&#7921; c&#7889;/t&#7845;n công m&#7841;ng<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="42" style='width: 31.85pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>S&#7889;
                            l&#432;&#7907;ng<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="52" style='width: 38.8pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>S&#7889;
                            s&#7921; c&#7889; t&#7921; x&#7917; lý<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="78" style='width: 58.55pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>S</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>&#7889;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                            s&#7921; c&#7889;
                            có s&#7921; h&#7895; tr&#7907; x&#7917; lý t&#7915; các t&#7893; ch&#7913;c
                            khác<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="77" style='width: 58.1pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>S&#7889;
                            s&#7921; c&#7889; có h&#7895; tr&#7907; x&#7917; lý t&#7915; t&#7893; ch&#7913;c
                            n&#432;&#7899;c ngoài<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="76" style='width: 57.2pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>S&#7889;
                            s&#7921; c&#7889; &#273;&#7873; ngh&#7883; VNCERT h&#7895; tr
                                                </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>&#7907;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>lý<o:p></o:p></span>
                                            </p>
                                        </td>
                                        <td width="72" style='width: 53.85pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Thi&#7879;t
                            h&#7841;i &#432;&#7899;c tính<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 1'>
                                        <td width="208" valign="top" style='width: 155.7pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>T&#7915; ch&#7889;i
                            d&#7883;ch v&#7909;<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="42" valign="top" style='width: 31.85pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="52" valign="top" style='width: 38.8pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="78" valign="top" style='width: 58.55pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="77" valign="top" style='width: 58.1pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="76" valign="top" style='width: 57.2pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="72" valign="top" style='width: 53.85pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 2'>
                                        <td width="208" valign="top" style='width: 155.7pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>T</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>&#7845;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>n công gi</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>&#7843;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>m&#7841;o<o:p></o:p></span>
                                            </p>
                                        </td>
                                        <td width="42" valign="top" style='width: 31.85pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="52" valign="top" style='width: 38.8pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="78" valign="top" style='width: 58.55pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="77" valign="top" style='width: 58.1pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="76" valign="top" style='width: 57.2pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="72" valign="top" style='width: 53.85pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 3'>
                                        <td width="208" valign="top" style='width: 155.7pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>T&#7845;n
                            công s&#7917; d&#7909;ng mã &#273;&#7897;c<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="42" valign="top" style='width: 31.85pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="52" valign="top" style='width: 38.8pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="78" valign="top" style='width: 58.55pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="77" valign="top" style='width: 58.1pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="76" valign="top" style='width: 57.2pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="72" valign="top" style='width: 53.85pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 4'>
                                        <td width="208" valign="top" style='width: 155.7pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Truy c&#7853;p
                            trái phép, chi&#7871;m quy&#7873;n &#273;i&#7873;u khi&#7875;n<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="42" valign="top" style='width: 31.85pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="52" valign="top" style='width: 38.8pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="78" valign="top" style='width: 58.55pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="77" valign="top" style='width: 58.1pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="76" valign="top" style='width: 57.2pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="72" valign="top" style='width: 53.85pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 5'>
                                        <td width="208" valign="top" style='width: 155.7pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Thay &#273;</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>&#7893;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>i giao di&#7879;n<o:p></o:p></span>
                                            </p>
                                        </td>
                                        <td width="42" valign="top" style='width: 31.85pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="52" valign="top" style='width: 38.8pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="78" valign="top" style='width: 58.55pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="77" valign="top" style='width: 58.1pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="76" valign="top" style='width: 57.2pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="72" valign="top" style='width: 53.85pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 6'>
                                        <td width="208" valign="top" style='width: 155.7pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Mã hóa ph&#7847;n
                            m&#7873;m, d&#7919; li&#7879;u, thi&#7871;t b&#7883;<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="42" valign="top" style='width: 31.85pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="52" valign="top" style='width: 38.8pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="78" valign="top" style='width: 58.55pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="77" valign="top" style='width: 58.1pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="76" valign="top" style='width: 57.2pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="72" valign="top" style='width: 53.85pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 7'>
                                        <td width="208" valign="top" style='width: 155.7pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Phá ho&#7841;i
                            thông tin, d&#7919; li&#7879;u, ph&#7847;n m&#7873;m<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="42" valign="top" style='width: 31.85pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="52" valign="top" style='width: 38.8pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="78" valign="top" style='width: 58.55pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="77" valign="top" style='width: 58.1pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="76" valign="top" style='width: 57.2pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="72" valign="top" style='width: 53.85pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 8'>
                                        <td width="208" valign="top" style='width: 155.7pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Nghe tr&#7897;m,
                            gián &#273;i&#7879;p, l&#7845;y c&#7855;p thông tin, d&#7919; li&#7879;u<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="42" valign="top" style='width: 31.85pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="52" valign="top" style='width: 38.8pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="78" valign="top" style='width: 58.55pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="77" valign="top" style='width: 58.1pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="76" valign="top" style='width: 57.2pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="72" valign="top" style='width: 53.85pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 9'>
                                        <td width="208" valign="top" style='width: 155.7pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>T&#7845;n
                            công t&#7893;ng h&#7907;p s&#7917; d&#7909;ng k&#7871;t h&#7907;p nhi&#7873;u
                            hình th&#7913;c<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="42" valign="top" style='width: 31.85pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="52" valign="top" style='width: 38.8pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="78" valign="top" style='width: 58.55pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="77" valign="top" style='width: 58.1pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="76" valign="top" style='width: 57.2pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="72" valign="top" style='width: 53.85pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 10'>
                                        <td width="208" valign="top" style='width: 155.7pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Các hình th&#7913;c
                            t&#7845;n công khác<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="42" valign="top" style='width: 31.85pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="52" valign="top" style='width: 38.8pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="78" valign="top" style='width: 58.55pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="77" valign="top" style='width: 58.1pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="76" valign="top" style='width: 57.2pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="72" valign="top" style='width: 53.85pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 11; mso-yfti-lastrow: yes'>
                                        <td width="208" valign="top" style='width: 155.7pt; border: solid windowtext 1.0pt; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <b style='mso-bidi-font-weight: normal'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>T&#7893;ng s&#7889;<o:p></o:p></span>
                                                </b>
                                            </p>
                                        </td>
                                        <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="52" valign="top" style='width: 38.8pt; border: solid windowtext 1.0pt; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="78" valign="top" style='width: 58.55pt; border: solid windowtext 1.0pt; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="77" valign="top" style='width: 58.1pt; border: solid windowtext 1.0pt; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="76" valign="top" style='width: 57.2pt; border: solid windowtext 1.0pt; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="72" valign="top" style='width: 53.85pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                </table>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>2. Danh sách các tổ chức hỗ trợ xử lý sự cố </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <textarea name="ToChucHoTro" maxlength="255" id="ToChucHoTro" class="textstyle1" rows="1" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.ToChucHoTro %></textarea>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>3. Danh sách các tổ chức nước ngoài hỗ trợ xử lý sự cố</span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <textarea name="ToChucNuocNgoaiHoTro" maxlength="255" id="ToChucNuocNgoaiHoTro" class="textstyle1" rows="1" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.ToChucNuocNgoaiHoTro %></textarea>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>4. Đề xuất kiến nghị:</span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <textarea name="DeXuat" maxlength="255" id="DeXuat" class="textstyle1" rows="1" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.DeXuat %></textarea>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                        <o:p>&nbsp;</o:p>
                                    </span>
                                </p>

                                <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"
                                    style='border-collapse: collapse; mso-padding-alt: 0in 5.4pt 0in 5.4pt'>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                        <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'></p>
                                        </td>
                                        <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                                            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>…<span class="GramE">..,</span> ngày …. <span class="GramE">tháng</span>
                                                        …. <span class="GramE">năm</span> ……<br>
                                                    </span>
                                                </i><b style='mso-bidi-font-weight: normal'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>NGƯỜI ĐẠI DIỆN THEO PHÁP LUẬT<br>
                                                    </span>
                                                </b><i style='mso-bidi-font-style: normal'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>(Đóng dấu hoặc sử dụng chữ ký số)</span>
                                                </i>
                                            </p>
                                        </td>
                                    </tr>
                                </table>

                                <p class="MsoNormal"></p>

                            </div>

                            <div class="button">
                                <input type="hidden" name="endCode" value="<%=endCode %>" />
                                <%if (!string.IsNullOrEmpty(endCode))
                                    {%>
                                <input class="btn_action search icon QAcustom" name="_hl_action[UpdateBaoCaoUCSC]" value="Cập nhật" type="submit" />
                                <%}
                                    else
                                    {%>
                                <input class="btn_action search icon QAcustom" name="_hl_action[AddBCTongHopUCSC]" value="Lưu" type="submit" />
                                <%}%>

                                <input style="margin-left: 10px;" onclick="location.href = '/vn/Thanh-vien/DS-bc-tong-hop-su-co.aspx';" type="button" name="" value="Danh sách báo cáo" />
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
