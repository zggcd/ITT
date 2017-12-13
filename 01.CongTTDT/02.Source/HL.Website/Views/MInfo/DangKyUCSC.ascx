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
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>a)
                Tên b&#7897; ph&#7853;n/ng&#432;&#7901;i gi&#7843;i quy&#7871;t:
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'><span style='mso-tab-count: 1 dotted'>......................................................................................... </span>
                                        <o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>b)
                &#272;i&#7879;n tho&#7841;i c&#7889; &#273;&#7883;nh:
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>…………………………………..</span><span lang="VI"
                                        style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                c)
                &#272;i&#7879;n tho&#7841;i di &#273;&#7897;ng:
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'><span style='mso-tab-count: 1 dotted'>............................ </span>
                                        <o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>d)
                S&#7889; Fax:
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                        <span style='mso-tab-count: 1 dotted'>..........................................................................................................................</span><o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>5. &#272;&#7847;u m&#7889;i
                    lãnh &#273;&#7841;o ph&#7909; trách v&#7873; an toàn thông tin c&#7911;a t&#7893;
                    ch&#7913;c
                                        </span>
                                    </b><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'><i style='mso-bidi-font-style: normal'><sup>(4)</sup></i></span><i style='mso-bidi-font-style: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                            <o:p></o:p>
                                        </span>
                                    </i>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>a)
                Tên b&#7897; ph&#7853;n/ng&#432;&#7901;i gi&#7843;i quy&#7871;t:
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'><span style='mso-tab-count: 1 dotted'>......................................................................................... </span>
                                        <o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>b)
                &#272;i&#7879;n tho&#7841;i c&#7889; &#273;&#7883;nh:
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>…………………………………..</span><span lang="VI"
                                        style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                c)
                &#272;i&#7879;n tho&#7841;i di &#273;&#7897;ng:
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'><span style='mso-tab-count: 1 dotted'>............................ </span>
                                        <o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <i style='mso-bidi-font-style: normal'>
                                        <sup>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>(4)</span>
                                        </sup>
                                    </i><i style='mso-bidi-font-style: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#272;&#7847;u m&#7889;i
                    Lãnh &#273;&#7841;o ph&#7909; trách v&#7873; an toàn thông tin c&#7911;a t&#7893;
                    ch&#7913;c s&#7869; ch&#7881; &#273;&#432;&#7907;c s&#7917; d&#7909;ng khi
                    không liên l&#7841;c &#273;&#432;&#7907;c v&#7899;i các &#273;&#7847;u m&#7889;i
                    khác ho&#7863;c trong các tình hu&#7889;ng s&#7921; c&#7889; có t
                                        </span>
                                    </i><i style='mso-bidi-font-style: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>í</span>
                                    </i><i style='mso-bidi-font-style: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>nh ch&#7845;t nghiêm
                    tr&#7885;ng<o:p></o:p>
                                        </span>
                                    </i>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>6. &#272;&#7883;a ch&#7881; nh&#7853;n th&#432;
                    và công v&#259;n qua &#273;&#432;&#7901;ng b&#432;u &#273;i&#7879;n:<o:p></o:p>
                                        </span>
                                    </b>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>a)
                Tên b&#7897; ph&#7853;n/ng&#432;&#7901;i nh&#7853;n:
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'><span style='mso-tab-count: 1 dotted'>................................................................................................. </span>
                                        <o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>b)
                V&#7883; trí, ch&#7913;c v&#7909;:
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'><span style='mso-tab-count: 1 dotted'>................................................................................................................ </span>
                                        <o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>c)
                Tên t&#7893; ch&#7913;c:
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                        <span style='mso-tab-count: 1 dotted'>.....................................................................................................................</span><o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>d)
                &#272;&#7883;a ch&#7881; liên h&#7879;:
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'><span style='mso-tab-count: 1 dotted'>................................................................................................................. </span>
                                        <o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#273;)
                &#272;i&#7879;n tho&#7841;i:
                                    </span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                        <span style='mso-tab-count: 1 dotted'>......................................................................................................................</span><o:p></o:p>
                                    </span>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>7. Ph&#432;&#417;ng ti&#7879;n liên l&#7841;c
                    khác
                                        </span>
                                    </b><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'><i style='mso-bidi-font-style: normal'><sup>(5)</sup></i><o:p></o:p></span>
                                </p>

                                <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"
                                    style='border-collapse: collapse; mso-padding-alt: 0in 0in 0in 0in'>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
                                        <td width="605" colspan="2" valign="bottom" style='width: 454.05pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Cách
                            th&#7913;c liên l&#7841;c khác qua h&#7879; th&#7889;ng nh&#7855;n tin t&#7913;c
                            th&#7901;i<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 1'>
                                        <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>a) Yahoo ID:<o:p></o:p></span>
                                            </p>
                                        </td>
                                        <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 2'>
                                        <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>s</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>b) Skype:<o:p></o:p></span>
                                            </p>
                                        </td>
                                        <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 3'>
                                        <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>c) Google
                            Talk:<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 4'>
                                        <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>d)</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>H</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>otmail:<o:p></o:p></span>
                                            </p>
                                        </td>
                                        <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 5'>
                                        <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#273;)
                            Khác:<o:p></o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <o:p>&nbsp;</o:p>
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
                                                </i><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <i style='mso-bidi-font-style: normal'>
                                                        <span lang="VI">Thông tin không b&#7855;t
                                    bu&#7897;c
                                                        </span>
                                                    </i><span lang="VI">
                                                        <o:p></o:p>
                                                    </span>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                </table>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <i style='mso-bidi-font-style: normal'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Chúng tôi cam
                        k&#7871;t tuân th&#7911; các trách nhi&#7879;m, quy&#7873;n h&#7841;n c&#7911;a
                        thành viên m&#7841;ng l&#432;&#7899;i, các quy &#273;&#7883;nh v&#7873; ho&#7841;t
                        &#273;&#7897;ng &#273;i&#7873;u ph
                                            </span>
                                        </i>
                                    </b><b style='mso-bidi-font-weight: normal'>
                                        <i style='mso-bidi-font-style: normal'>
                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>&#7889;</span>
                                        </i>
                                    </b><b style='mso-bidi-font-weight: normal'>
                                        <i style='mso-bidi-font-style: normal'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>i &#7913;ng c&#7913;u
                        s&#7921; c
                                            </span>
                                        </i>
                                    </b><b style='mso-bidi-font-weight: normal'>
                                        <i style='mso-bidi-font-style: normal'>
                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>&#7889;</span>
                                        </i>
                                    </b><b style='mso-bidi-font-weight: normal'>
                                        <i style='mso-bidi-font-style: normal'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>theo quy &#273;&#7883;nh pháp lu&#7853;t và h&#432;&#7899;ng d&#7851;n c&#7911;a
                        C&#417; quan &#273;i&#7873;u ph
                                            </span>
                                        </i>
                                    </b><b style='mso-bidi-font-weight: normal'>
                                        <i style='mso-bidi-font-style: normal'>
                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>&#7889;</span>
                                        </i>
                                    </b><b style='mso-bidi-font-weight: normal'>
                                        <i style='mso-bidi-font-style: normal'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>i qu&#7889;c gia ban
                        hành.
                                            </span>
                                        </i>
                                    </b><b style='mso-bidi-font-weight: normal'>
                                        <i style='mso-bidi-font-style: normal'>
                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                                <o:p></o:p>
                                            </span>
                                        </i>
                                    </b>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <i style='mso-bidi-font-style: normal'>
                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                                <o:p>&nbsp;</o:p>
                                            </span>
                                        </i>
                                    </b>
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
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>….., ngày …. tháng …. n&#259;m 20……<br>
                                                    </span>
                                                </i><b style='mso-bidi-font-weight: normal'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>NG&#431;&#7900;I &#272;&#7840;I DI&#7878;N THEO PHÁP
                                LU&#7852;T<br>
                                                    </span>
                                                </b><i style='mso-bidi-font-style: normal'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>(Ký tên và &#273;óng d&#7845;u)</span>
                                                </i><b style='mso-bidi-font-weight: normal'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                        <o:p></o:p>
                                                    </span>
                                                </b>
                                            </p>
                                        </td>
                                    </tr>
                                </table>

                                <p class="MsoNormal">
                                    <span lang="VI">
                                        <o:p>&nbsp;</o:p>
                                    </span>
                                </p>

                            </div>

                            <div class="button">
                                <input type="hidden" name="endCode" value="<%=endCode %>" />
                                <%if (!string.IsNullOrEmpty(endCode))
                                    {%>
                                <input class="btn_action search icon QAcustom" name="_hl_action[UpdateHoSoUCSC]" value="Cập nhật" type="submit" />
                                <%}
                                    else
                                    {%>
                                <input class="btn_action search icon QAcustom" name="_hl_action[AddHoSoUCSC]" value="Lưu" type="submit" />
                                <%}%>

                                <input style="margin-left: 10px;" onclick="location.href = '/vn/Thanh-vien/Dang-ky-ung-cuu-su-co.aspx';" type="button" name="" value="Danh sách hồ sơ" />
                            </div>

                        </div>
                    </div>
                </form>
            </div>
            <!--.Main_container-->

        </div>
    </div>
</div>
