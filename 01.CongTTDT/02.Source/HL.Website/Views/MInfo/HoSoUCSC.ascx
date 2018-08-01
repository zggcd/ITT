<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HL.Lib.Global.CPLogin.IsLogin())
        {
            Response.Redirect("/vn/Thanh-vien/Dang-nhap.aspx?ReturnPath=" + HttpUtility.ParseQueryString("/vn/Thanh-vien/Them-ho-so-ung-cuu-su-co.aspx"));
            return;
        }
    }
</script>

<%
    CPUserEntity entity = ViewBag.Data as CPUserEntity ?? CPLogin.CurrentUser;
    ModHSThanhVienUCSCEntity entityHs = ViewBag.HoSo as ModHSThanhVienUCSCEntity ?? new ModHSThanhVienUCSCEntity();
    ModDauMoiUCSCEntity entityDm = ViewBag.DauMoi as ModDauMoiUCSCEntity ?? new ModDauMoiUCSCEntity();

    List<ModHeThongThongTinEntity> currHTTT = ViewBag.HTTT as List<ModHeThongThongTinEntity> ?? new List<ModHeThongThongTinEntity>();

    string strHTTT = string.Join(",", currHTTT.Select(o => o.MenuID));
    string endCode = ViewBag.EndCode;

    List<WebMenuEntity> lstCapDo = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "CapDo" && o.ParentID > 0).ToList_Cache();
    int countCapDo = lstCapDo != null ? lstCapDo.Count : 0;
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
    <span>BẢN KHAI HỒ SƠ THÀNH VIÊN MẠNG LƯỚI ỨNG CỨU SỰ CỐ</span>
</div>
<div class="contentNews">
    <div class="main_right">
        <div class="box-category mb10">
            <div class="vanban-new">
                <h3 class="title-list-news">
                    <span class="title-t1">BẢN KHAI HỒ SƠ THÀNH VIÊN MẠNG LƯỚI ỨNG CỨU SỰ CỐ</span>
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
                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                            <o:p>&nbsp;</o:p>
                                        </span>
                                    </p>
                                    <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0"
                                        style='border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
                                        <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                            <td width="231" valign="top" style='width: 173.4pt; border: none; border-right: solid windowtext 1.0pt; mso-border-right-alt: solid windowtext .5pt; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                        <o:p>&nbsp;</o:p>
                                                    </span>
                                                </p>
                                            </td>
                                            <td width="359" valign="top" style='width: 269.4pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <a
                                                        name="chuong_pl_2"><b style='mso-bidi-font-weight: normal'><span
                                                            style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Mẫu số 01</span></b></a><b style='mso-bidi-font-weight: normal'><span
                                                                style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'><br>
                                                            </span></b><i style='mso-bidi-font-style: normal'><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Ban hành kèm theo Thông tư số 20/2017/TT-BTTT ngày 12/9/2017 của Bộ trưởng Bộ Thông tin và Truyền thông</span></i><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'><o:p></o:p></span>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                            <o:p>&nbsp;</o:p>
                                        </span>
                                    </p>

                                    <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"
                                        style='border-collapse: collapse; mso-padding-alt: 0in 0in 0in 0in'>
                                        <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                            <td width="306" valign="top" style='width: 229.2pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <b
                                                        style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>TÊN TỔ CHỨC<br>
                                                            ………………………</span></b><b style='mso-bidi-font-weight: normal'><span lang="VI"
                                                                style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'><br>
                                                                -------<o:p></o:p></span></b>
                                                </p>
                                            </td>
                                            <td width="299" valign="top" style='width: 224.35pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <b
                                                        style='mso-bidi-font-weight: normal'><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br>
                                                            Độc lập - Tự do - Hạnh phúc
                                            <br>
                                                            ---------------</span></b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'><o:p></o:p></span>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                            <o:p>&nbsp;</o:p>
                                        </span>
                                    </p>

                                    <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                        <a name="chuong_pl_2_name">
                                            <b style='mso-bidi-font-weight: normal'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>BẢN KHAI HỒ SƠ THÀNH VIÊN MẠNG LƯỚI ỨNG CỨU SỰ CỐ</span>
                                            </b>
                                        </a>
                                        <b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                            <o:p></o:p>
                                        </span></b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <b style='mso-bidi-font-weight: normal'><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>1. Thông tin chung về tổ chức</span></b><b
                                            style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'><o:p></o:p></span></b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;
Tên tổ chức:</span>
                                        <input name="ToChuc_Ten" maxlength="255" id="ToChuc_Ten" class="textstyle1" type="text" value="<%=entityHs.ToChuc_Ten %>" />
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;
Tên cơ quan chủ quản:</span>
                                        <input name="ToChuc_TenCoQuan" maxlength="255" id="ToChuc_TenCoQuan" class="textstyle1" type="text" value="<%=entityHs.ToChuc_TenCoQuan %>" />
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;
Địa chỉ:</span>
                                        <input name="ToChuc_DiaChi" maxlength="255" id="ToChuc_DiaChi" class="textstyle1" type="text" value="<%=entityHs.ToChuc_DiaChi %>" />
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; Điện thoại:</span>
                                        <input name="ToChuc_DienThoai" maxlength="255" id="ToChuc_DienThoai" class="textstyle1" type="text" value="<%=entityHs.ToChuc_DienThoai %>" />
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                                            style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'> Fax: 
                            <input name="ToChuc_Fax" maxlength="255" id="ToChuc_Fax" class="textstyle1" type="text" value="<%=entityHs.ToChuc_Fax %>" />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                                            lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'> </span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Email:</span>
                                        <input name="ToChuc_Email" maxlength="255" id="ToChuc_Email" class="textstyle1" type="text" value="<%=entityHs.ToChuc_Email %>" />
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                                            style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'> Website: 
                            <input name="ToChuc_Web" maxlength="255" id="ToChuc_Web" class="textstyle1" type="text" value="<%=entityHs.ToChuc_Web %>" />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                                            lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'> </span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Lãnh đạo phụ trách an toàn thông tin:</span><span
                                                style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                                <input name="ToChuc_LanhDao" maxlength="255" id="ToChuc_LanhDao" class="textstyle1" type="text" value="<%=entityHs.ToChuc_LanhDao %>" />. Chức vụ: 
                                    <input name="ToChuc_ChucVu" maxlength="255" id="ToChuc_ChucVu" class="textstyle1" type="text" value="<%=entityHs.ToChuc_ChucVu %>" />
                                            </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <b
                                            style='mso-bidi-font-weight: normal'><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>2. Thông tin tiếp nhận thông báo sự cố</span></b><b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'><o:p></o:p></span></b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; Địa chỉ:</span>
                                        <input name="TTTN_DiaChi" maxlength="255" id="TTTN_DiaChi" class="textstyle1" type="text" value="<%=entityHs.TTTN_DiaChi %>" />
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; Số điện thoại cố định:</span>
                                        <input name="TTTN_DienThoai" maxlength="255" id="TTTN_DienThoai" class="textstyle1" type="text" value="<%=entityHs.TTTN_DienThoai %>" />
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; Số điện thoại di động:
                            <input name="TTTN_DienThoaiDD" maxlength="255" id="TTTN_DienThoaiDD" class="textstyle1" type="text" value="<%=entityHs.TTTN_DienThoaiDD %>" />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>Số Fax: 
                            <input name="TTTN_Fax" maxlength="255" id="TTTN_Fax" class="textstyle1" type="text" value="<%=entityHs.TTTN_Fax %>" />
                                        </span>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                                            style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'> Email: 
                            <input name="TTTN_Email" maxlength="255" id="TTTN_Email" class="textstyle1" type="text" value="<%=entityHs.TTTN_Email %>" />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>3. Đầu mối ứng cứu sự cố</span></b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>3.1. Đầu mối ứng cứu sự cố chính</span></b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>Họ và tên: 
                            <input name="Name" maxlength="255" id="Name" class="textstyle1" type="text" value="<%=entityDm.Name %>" />
                                        </span>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>Chức vụ: 
                            <input name="ChucVu" maxlength="255" id="ChucVu" class="textstyle1" type="text" value="<%=entityDm.ChucVu %>" />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span
                                            lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; Địa chỉ liên hệ: 
                            <input name="DiaChi" maxlength="255" id="DiaChi" class="textstyle1" type="text" value="<%=entityDm.DiaChi %>" />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; Số điện thoại cố định:
                            <input name="DienThoai" maxlength="255" id="DienThoai" class="textstyle1" type="text" value="<%=entityDm.DienThoai %>" />
                                        </span>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; Số di động:
                            <input name="DienThoaiDD" maxlength="255" id="DienThoaiDD" class="textstyle1" type="text" value="<%=entityDm.DienThoaiDD %>" />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; Số Fax: 
                            <input name="Fax" maxlength="255" id="Fax" class="textstyle1" type="text" value="<%=entityDm.Fax %>" />
                                        </span>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>Email: 
                            <input name="Email" maxlength="255" id="Email" class="textstyle1" type="text" value="<%=entityDm.Email %>" />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>4. Giới thiệu về hoạt động của tổ chức</span></b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <i style='mso-bidi-font-style: normal'><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>(Cung cấp cho Cơ quan điều phối quốc gia các thông tin về năng lực ứng cứu sự cố của tổ chức như nhân sự, công nghệ, kinh nghiệm, đối tượng phục vụ…)</span></i>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <i style='mso-bidi-font-style: normal'><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                            <textarea name="Content" maxlength="255" id="Content" class="textstyle1" rows="1" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityHs.Content %></textarea>
                                        </span></i>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>5. Tên các hệ thống thông tin thuộc phạm vi phụ trách hoặc cung cấp dịch vụ:</span></b>
                                    </p>

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

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <b style='mso-bidi-font-weight: normal'><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>6. Thông tin về Danh sách nhân lực, chuyên gia an toàn thông tin, công nghệ thông tin và tương đương</span></b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <i style='mso-bidi-font-style: normal'><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>(Cung cấp thông tin về nhân lực an toàn thông tin, công nghệ thông tin thuộc đơn vị hoặc các đơn vị liên quan trong phạm vi mình phụ trách theo mẫu Tổng hợp kèm theo Biểu mẫu 01 này)</span></i>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <b style='mso-bidi-font-weight: normal'><i style='mso-bidi-font-style: normal'><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>Chúng tôi cam kết thông tin khai báo trong hồ sơ là chính xác và tuân thủ trách nhiệm, quyền hạn của thành viên mạng cưới, các quy định về hoạt động điều phối ứng cứu sự cố theo quy định pháp luật và hướng dẫn của Cơ quan điều phối quốc gia ban hành.</span></i></b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <b style='mso-bidi-font-weight: normal'><i style='mso-bidi-font-style: normal'><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                            <o:p>&nbsp;</o:p>
                                        </span></i></b>
                                    </p>

                                    <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"
                                        style='border-collapse: collapse; mso-padding-alt: 0in 5.4pt 0in 5.4pt'>
                                        <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                            <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>
                                                        <o:p>&nbsp;</o:p>
                                                    </span>
                                                </p>
                                            </td>
                                            <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>…., ngày …… tháng ….. <span class="GramE">n&#259;m</span> …….<br>
                                                        <b style='mso-bidi-font-weight: normal'>NGƯỜI ĐẠI DIỆN THEO PHÁP LUẬT<br>
                                                        </b><i style='mso-bidi-font-style: normal'>(Ký tên, đóng dấu hoặc sử dụng chữ ký số)</i></span>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal">
                                        <span lang="VI"></span>
                                    </p>

                                </div>

                                <div class="button">
                                    <input type="hidden" name="endCode" value="<%=endCode %>" />
                                    <%if (!string.IsNullOrEmpty(endCode))
                                        {%>
                                    <input class="btn btn-success" name="_hl_action[UpdateHoSoUCSC]" value="Cập nhật" type="submit" onclick="fnSubmit()" />
                                    <%}
                                        else
                                        {%>
                                    <input class="btn btn-success" name="_hl_action[AddHoSoUCSC]" value="Lưu" type="submit" onclick="fnSubmit()" />
                                    <%}%>

                                    <input class="btn btn-danger" style="margin-left: 10px;" onclick="location.href = '/vn/Thanh-vien/Ho-so-ung-cuu-su-co.aspx';" type="button" name="" value="Danh sách hồ sơ" />
                                    <%--<input type="hidden" name="File" value="<%=entity.File %>" />--%>
                                </div>

                            </div>
                        </div>
                        <input type="hidden" name="M" value="" id="M" />
                    </form>
                </div>
                <!--.Main_container-->

            </div>
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
</script>
