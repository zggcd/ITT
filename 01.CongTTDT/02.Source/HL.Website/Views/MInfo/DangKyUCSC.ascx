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
    ModDonDangKyUCSCEntity entityDk = ViewBag.DangKy as ModDonDangKyUCSCEntity ?? new ModDonDangKyUCSCEntity();
    string endCode = ViewBag.EndCode;
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
                <span class="title-t1">ĐƠN XIN ĐĂNG KÝ THAM GIA MẠNG LƯỚI ỨNG CỨU SỰ CỐ</span>
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
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="359" valign="top" style='width: 269.4pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 5.4pt 0in 5.4pt'>
                                            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <a name="chuong_pl_3">
                                                    <b style='mso-bidi-font-weight: normal'>
                                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Mẫu số 02<br>
                                                        </span>
                                                    </b>
                                                </a><i style='mso-bidi-font-style: normal'>
                                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Ban hành kèm theo Thông tư số 20/2017/TT-BTTT ngày 12/9/2017 của Bộ Thông tin và Truyền thông</span>
                                                </i>
                                            </p>
                                        </td>
                                    </tr>
                                </table>

                                <p class="MsoNormal" style='margin-top: 6.0pt'></p>

                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VỆT NAM</span>
                                    </b><b style='mso-bidi-font-weight: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                            <br>
                                        </span>
                                    </b><b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI"
                                            style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Độc lập - Tự do - Hạnh phúc</span>
                                    </b><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                        <br>
                                        ---------------------<o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                    <a name="chuong_pl_3_name">
                                        <b style='mso-bidi-font-weight: normal'>
                                            <span lang="VI"
                                                style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>ĐƠN XIN ĐĂNG KÝ THAM GIA MẠNG LƯỚI ỨNG CỨU SỰ CỐ</span>
                                        </b>
                                    </a><span style='mso-bookmark: chuong_pl_3_name'></span><b style='mso-bidi-font-weight: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                            <br>
                                        </span>
                                    </b><i style='mso-bidi-font-style: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>(Áp dụng cho tổ chức, doanh nghiệp và cá nhân tự nguyện tham gia mạng lưới ứng cứu sự cố mạng)</span></i>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>I. Thông tin chung về tổ chức</span>
                                    </b>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>1. Tên tổ chức:</span>
                                    <input name="ToChuc_Ten" maxlength="255" id="ToChuc_Ten" class="textstyle1" type="text" value="<%=entityDk.ToChuc_Ten %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>2. Địa chỉ: </span>
                                    <input name="ToChuc_DiaChi" maxlength="255" id="ToChuc_DiaChi" class="textstyle1" type="text" value="<%=entityDk.ToChuc_DiaChi %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>3. Điện thoại:</span>
                                    <input name="ToChuc_DienThoai" maxlength="255" id="ToChuc_DienThoai" class="textstyle1" type="text" value="<%=entityDk.ToChuc_DienThoai %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>4. Fax:</span>
                                    <input name="ToChuc_Fax" maxlength="255" id="ToChuc_Fax" class="textstyle1" type="text" value="<%=entityDk.ToChuc_Fax %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>5. Email:</span>
                                    <input name="ToChuc_Email" maxlength="255" id="ToChuc_Email" class="textstyle1" type="text" value="<%=entityDk.ToChuc_Email %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>II. Giới thiệu về hoạt động của tổ chức</span>
                                    </b>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>1. Giới thiệu chung về hoạt động của tổ chức</span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <i style='mso-bidi-font-style: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>(Cung cấp cho Cơ quan điều ph ố i quốc gia các thông tin ngắn gọn giới thiệu về các lĩnh vực hoạt động của tổ chức, về năng lực ứng cứu sự cố của tổ ch ứ c như nhân sự, công ngh ệ, kinh nghiệm, đối tượng phục vụ,...)</span>
                                    </i>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                        <textarea name="Content" maxlength="255" id="Content" class="textstyle1" rows="1" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityDk.Content %></textarea>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>2. Tên các hệ thống thông tin thuộc phụ trách quản lý hoặc hỗ trợ ứng cứu (cấp độ phê duyệt hoặc dự kiến tương đương):</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                    </span>
                                </p>

                                <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"
                                    style='border-collapse: collapse; mso-padding-alt: 0in 0in 0in 0in'>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                        <td width="121" valign="top" style='width: 90.65pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>&#9642;</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                            C&#7845;p
                            1:<o:p></o:p>
                                                </span>
                                            </p>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>1.<o:p></o:p></span>
                                            </p>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>2.<o:p></o:p></span>
                                            </p>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>….<o:p></o:p></span>
                                            </p>
                                        </td>
                                        <td width="121" valign="top" style='width: 90.7pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>&#9642;</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                            C&#7845;p
                            2:<o:p></o:p>
                                                </span>
                                            </p>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>1.<o:p></o:p></span>
                                            </p>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>2.<o:p></o:p></span>
                                            </p>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>….<o:p></o:p></span>
                                            </p>
                                        </td>
                                        <td width="121" valign="top" style='width: 90.7pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>&#9642;</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                            C&#7845;p
                            3:<o:p></o:p>
                                                </span>
                                            </p>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>1.<o:p></o:p></span>
                                            </p>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>2.<o:p></o:p></span>
                                            </p>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>….<o:p></o:p></span>
                                            </p>
                                        </td>
                                        <td width="121" valign="top" style='width: 90.7pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>&#9642;</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                            C&#7845;p
                            4:<o:p></o:p>
                                                </span>
                                            </p>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>1.<o:p></o:p></span>
                                            </p>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>2.<o:p></o:p></span>
                                            </p>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>….<o:p></o:p></span>
                                            </p>
                                        </td>
                                        <td width="121" valign="top" style='width: 90.8pt; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>&#9642;</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                            C&#7845;p
                            5:<o:p></o:p>
                                                </span>
                                            </p>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>1.<o:p></o:p></span>
                                            </p>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>2.<o:p></o:p></span>
                                            </p>
                                            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>….<o:p></o:p></span>
                                            </p>
                                        </td>
                                    </tr>
                                </table>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>3. Thông tin về nhân lực, chuyên gia an toàn thông tin, công nghệ thông tin và tương đương</span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <i style='mso-bidi-font-style: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>(Cung cấp thông tin về nhân lực, an toàn thông tin, công nghệ thông tin thuộc đơn vị mình theo bảng kèm theo Biểu mẫu 01 của Thông tư này)</span>
                                    </i>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>III. Thông tin trao đổi, liên lạc trong mạng lưới</span>
                                    </b>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>1. Địa chỉ Website:
                                        <input name="ThongTinLL_Web" maxlength="255" id="ThongTinLL_Web" class="textstyle1" type="text" value="<%=entityDk.ThongTinLL_Web %>" />
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>2. Địa chỉ thư điện tử của đơn vị<sup>(1)</sup>:</span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>PGP/GPG Public Key cho địa chỉ thư điện tử PoC của tổ chức:<sup>(2)</sup></span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>a) Tên (User ID):</span>
                                    <input name="ThongTinLL_ThuDT_Ten" maxlength="255" id="ThongTinLL_ThuDT_Ten" class="textstyle1" type="text" value="<%=entityDk.ThongTinLL_ThuDT_Ten %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>b) Fingerprint:
                                    <input name="ThongTinLL_ThuDT_Fingerprint" maxlength="255" id="ThongTinLL_ThuDT_Fingerprint" class="textstyle1" type="text" value="<%=entityDk.ThongTinLL_ThuDT_Fingerprint %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>c) Liên kết đến Public key của tổ chức<sup>(3)</sup>:</span>
                                    <input name="ThongTinLL_ThuDT_LinkToPublicKey" maxlength="255" id="ThongTinLL_ThuDT_LinkToPublicKey" class="textstyle1" type="text" value="<%=entityDk.ThongTinLL_ThuDT_LinkToPublicKey %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <i style='mso-bidi-font-style: normal'>
                                        <sup>
                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>(1)</span>
                                        </sup>
                                    </i><i style='mso-bidi-font-style: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'></span>
                                    </i><i style='mso-bidi-font-style: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>Địa chỉ thư điện tử được sử dụng làm đầu mối trao đổi thông tin với Mạng lưới ứng cứu sự cố khuy ế n nghị không nên sử dụng địa chỉ thư điện tử cá nhân, nên sử dụng tên đại diện cho tổ chức.</span>
                                    </i>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <i style='mso-bidi-font-style: normal'>
                                        <sup>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>(2)</span>
                                        </sup>
                                    </i><i style='mso-bidi-font-style: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Nếu tổ chức chưa có thì có thể bỏ trống hoặc yêu cầu VNCERT hướng dẫn tạo.</span>
                                    </i>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <i style='mso-bidi-font-style: normal'>
                                        <sup>
                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>(3)</span>
                                        </sup>
                                    </i><i style='mso-bidi-font-style: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
                                    </i><i style='mso-bidi-font-style: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Tổ chức có thể gửi Public Key về VNCERT qua thư điện tử (csirts@vncert.vn)</span>
                                    </i>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>3. Đầu mối liên lạc trong giờ làm việc</span>
                                    </b>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>a) Tên bộ phận/người giải quyết:</span>
                                    <input name="DauMoiLL_TrongGio_Ten" maxlength="255" id="DauMoiLL_TrongGio_Ten" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_TrongGio_Ten %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>b) Điện thoại cố định:</span>
                                    <input name="DauMoiLL_TrongGio_DienThoai" maxlength="255" id="DauMoiLL_TrongGio_DienThoai" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_TrongGio_DienThoai %>" />
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>c) Điện thoại di động:</span>
                                    <input name="DauMoiLL_TrongGio_DienThoaiDD" maxlength="255" id="DauMoiLL_TrongGio_DienThoaiDD" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_TrongGio_DienThoaiDD %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>d) Số Fax:</span>
                                    <input name="DauMoiLL_TrongGio_Fax" maxlength="255" id="DauMoiLL_TrongGio_Fax" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_TrongGio_Fax %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>4. Đầu mối liên lạc ngoài giờ làm việc</span>
                                    </b>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>a) Tên bộ phận/người giải quyết:</span>
                                    <input name="DauMoiLL_NgoaiGio_Ten" maxlength="255" id="DauMoiLL_NgoaiGio_Ten" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_NgoaiGio_Ten %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>b) Điện thoại cố định:</span>
                                    <input name="DauMoiLL_NgoaiGio_DienThoai" maxlength="255" id="DauMoiLL_NgoaiGio_DienThoai" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_NgoaiGio_DienThoai %>" />
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>c) Điện thoại di động:</span>
                                    <input name="DauMoiLL_NgoaiGio_DienThoaiDD" maxlength="255" id="DauMoiLL_NgoaiGio_DienThoaiDD" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_NgoaiGio_DienThoaiDD %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>d) Số Fax:</span>
                                    <input name="DauMoiLL_NgoaiGio_Fax" maxlength="255" id="DauMoiLL_NgoaiGio_Fax" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_NgoaiGio_Fax %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>5. Đầu mối lãnh đạo phụ trách về an toàn thông tin của tổ chức <i style='mso-bidi-font-style: normal'><sup>(4)</sup></i></span>
                                    </b>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>a) Tên bộ phận/người giải quyết:</span>
                                    <input name="DauMoiLanhDao_Ten" maxlength="255" id="DauMoiLanhDao_Ten" class="textstyle1" type="text" value="<%=entityDk.DauMoiLanhDao_Ten %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>b) Điện thoại cố định:</span>
                                    <input name="DauMoiLanhDao_DienThoai" maxlength="255" id="DauMoiLanhDao_DienThoai" class="textstyle1" type="text" value="<%=entityDk.DauMoiLanhDao_DienThoai %>" />
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>c) Điện thoại di động:</span>
                                    <input name="DauMoiLanhDao_DienThoaiDD" maxlength="255" id="DauMoiLanhDao_DienThoaiDD" class="textstyle1" type="text" value="<%=entityDk.DauMoiLanhDao_DienThoaiDD %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <i style='mso-bidi-font-style: normal'>
                                        <sup>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>(4)</span>
                                        </sup>
                                    </i>
                                    <i style='mso-bidi-font-style: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Đầu mối Lãnh đạo phụ trách về an toàn thông tin của tổ chức sẽ chỉ được sử dụng khi không liên lạc được với các đầu mối khác hoặc trong các tình huống sự cố có t í nh chất nghiêm trọng</span>
                                    </i>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>6. Địa chỉ nhận thư và công văn qua đường bưu điện:</span>
                                    </b>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>a) Tên bộ phận/người nhận:</span>
                                    <input name="DCNhanThu_TenBoPhan" maxlength="255" id="DCNhanThu_TenBoPhan" class="textstyle1" type="text" value="<%=entityDk.DCNhanThu_TenBoPhan %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>b) Vị trí, chức vụ:</span>
                                    <input name="DCNhanThu_ViTri" maxlength="255" id="DCNhanThu_ViTri" class="textstyle1" type="text" value="<%=entityDk.DCNhanThu_ViTri %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>c) Tên tổ chức:</span>
                                    <input name="DCNhanThu_TenToChuc" maxlength="255" id="DCNhanThu_TenToChuc" class="textstyle1" type="text" value="<%=entityDk.DCNhanThu_TenToChuc %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>d) Địa chỉ liên hệ:</span>
                                    <input name="DCNhanThu_DiaChi" maxlength="255" id="DCNhanThu_DiaChi" class="textstyle1" type="text" value="<%=entityDk.DCNhanThu_DiaChi %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>đ) Điện thoại:</span>
                                    <input name="DCNhanThu_DienThoai" maxlength="255" id="DCNhanThu_DienThoai" class="textstyle1" type="text" value="<%=entityDk.DCNhanThu_DienThoai %>" />
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>7. Phương tiện liên lạc khác</span>
                                    </b>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'><i style='mso-bidi-font-style: normal'><sup>(5)</sup></i></span>
                                </p>

                                <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"
                                    style='border-collapse: collapse; mso-padding-alt: 0in 0in 0in 0in'>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
                                        <td width="605" colspan="2" valign="bottom" style='width: 454.05pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Cách thức liên lạc khác qua hệ thống nhắn tin tức thời</span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 1'>
                                        <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>a) Yahoo ID:</span>
                                            </p>
                                        </td>
                                        <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <input name="LLKhac_Yahoo" maxlength="255" id="LLKhac_Yahoo" class="textstyle1" type="text" value="<%=entityDk.LLKhac_Yahoo %>" />
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 2'>
                                        <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>b) Skype:</span>
                                            </p>
                                        </td>
                                        <td width="398" valign="top" style="width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in">
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <input name="LLKhac_Skype" maxlength="255" id="LLKhac_Skype" class="textstyle1" type="text" value="<%=entityDk.LLKhac_Skype %>" />
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 3'>
                                        <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>c) Google Talk:</span>
                                            </p>
                                        </td>
                                        <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <input name="LLKhac_GoogleTalk" maxlength="255" id="LLKhac_GoogleTalk" class="textstyle1" type="text" value="<%=entityDk.LLKhac_GoogleTalk %>" />
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 4'>
                                        <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>d) Hotmail:</span>
                                            </p>
                                        </td>
                                        <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <input name="LLKhac_Hotmail" maxlength="255" id="LLKhac_Hotmail" class="textstyle1" type="text" value="<%=entityDk.LLKhac_Hotmail %>" />
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 5'>
                                        <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>đ) Khác:</span>
                                            </p>
                                        </td>
                                        <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <input name="LLKhac_Khac" maxlength="255" id="LLKhac_Khac" class="textstyle1" type="text" value="<%=entityDk.LLKhac_Khac %>" />
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 6; mso-yfti-lastrow: yes'>
                                        <td width="605" colspan="2" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <sup>
                                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>(5)</span>
                                                    </sup>
                                                </i><span style="font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: 'Arial','sans-serif';">
                                                    <i style="mso-bidi-font-style: normal">
                                                        <span lang="VI">Thông tin không bắt buộc </span>
                                                    </i>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                </table>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <i style='mso-bidi-font-style: normal'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Chúng tôi cam kết tuân thủ các trách nhiệm, quyền hạn của thành viên mạng lưới, các quy định về hoạt động điều phối ứng cứu sự cố theo quy định pháp luật và hướng dẫn của Cơ quan điều phối quốc gia ban hành.</span>
                                        </i>
                                    </b><b style='mso-bidi-font-weight: normal'>
                                        <i style='mso-bidi-font-style: normal'>
                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
                                        </i>
                                    </b>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <i style='mso-bidi-font-style: normal'>
                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
                                        </i>
                                    </b>
                                </p>

                                <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"
                                    style='border-collapse: collapse; mso-padding-alt: 0in 5.4pt 0in 5.4pt'>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                        <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'></span>
                                            </p>
                                        </td>
                                        <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                                            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>….., ngày …. tháng …. năm 20……<br>
                                                    </span>
                                                </i><b style='mso-bidi-font-weight: normal'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>NGƯỜI ĐẠI DIỆN THEO PHÁP LUẬT<br>
                                                    </span>
                                                </b><i style='mso-bidi-font-style: normal'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>(Ký tên và đóng dấu)</span>
                                                </i><b style='mso-bidi-font-weight: normal'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'></span>
                                                </b>
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
                                <input class="btn_action search icon QAcustom" name="_hl_action[UpdateDangKyUCSC]" value="Cập nhật" type="submit" />
                                <%}
                                    else
                                    {%>
                                <input class="btn_action search icon QAcustom" name="_hl_action[AddDangKyUCSC]" value="Lưu" type="submit" />
                                <%}%>

                                <input style="margin-left: 10px;" onclick="location.href = '/vn/Thanh-vien/DS-dang-ky-ung-cuu-su-co.aspx';" type="button" name="" value="Danh sách đăng ký" />
                            </div>

                        </div>
                    </div>
                </form>
            </div>
            <!--.Main_container-->

        </div>
    </div>
</div>
