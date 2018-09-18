<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

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

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HL.Lib.Global.CPLogin.IsLoginOnWeb())
        {
            int langId = ViewPage.CurrentPage.LangID;
            string loginUrl = "/vn/Thanh-vien/Dang-nhap.aspx";
            if (langId == 2)
            {
                loginUrl = "/en/Member/Login.aspx";
            }

            Response.Redirect(loginUrl + "?ReturnPath=" + HttpUtility.ParseQueryString(Request.RawUrl));
            return;
        }
    }
</script>

<%
    CPUserEntity entity = ViewBag.Data as CPUserEntity ?? CPLogin.CurrentUser;
    ModThongBaoSuCoEntity entityTB = ViewBag.ThongBaoUCSC as ModThongBaoSuCoEntity ?? new ModThongBaoSuCoEntity();
    var endCode = ViewBag.EndCode ?? "";
    int isEdit = ViewBag.IsEdit ?? 0;

    int langId = ViewPage.CurrentPage.LangID;
    string bcscUrl = "/vn/Bao-cao-su-co.aspx";
    if (langId == 2)
    {
        bcscUrl = "/en/Bao-cao-su-co.aspx";
    }
%>

<div class="row-fluid titleContainer">
    <span>{RS:Form_BCThongBaoSuCoHeader}</span>
</div>

<div class="contentNews">
    <div class="main_right">
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

                                    <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                        <a style="cursor: context-menu; text-decoration: none">
                                            <b>
                                                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>{RS:Form_BCThongBaoSuCoHeader}</span>
                                            </b>
                                        </a>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'></span>
                                        </b>
                                    </p>

                                    <div class="clear-20">&nbsp;</div>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>THÔNG TIN VỀ TỔ CHỨC/CÁ NHÂN THÔNG BÁO SỰ CỐ</span>
                                        </b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Tên tổ chức/cá nhân thông báo sự cố (*)</span>
                                        <input name="ToChuc_Ten" maxlength="250" id="ToChuc_Ten" class="textstyle1" type="text" value="<%=entityTB.ToChuc_Ten%>" />
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'> Địa chỉ: (*)</span>
                                        <input name="ToChuc_DiaChi" maxlength="250" id="ToChuc_DiaChi" class="textstyle1" type="text" value="<%=entityTB.ToChuc_DiaChi %>" />
                                    </p>

                                    <div class="clear-20">&nbsp;</div>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>THÔNG TIN CHI TIẾT VỀ HỆ THỐNG BỊ SỰ CỐ</span>
                                        </b>
                                    </p>

                                    <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse; border: none;'>
                                        <tr>
                                            <td valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Tên hoặc tên miền, địa chỉ IP của hệ thống thông tin bị sự cố (*): </span>
                                                </p>
                                            </td>
                                            <td colspan="5" valign="top" style='width: 283.55pt; border: solid windowtext 1.0pt; border-left: none; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <i>
                                                        <input name="ChiTiet_TenHeThong" maxlength="250" id="ChiTiet_TenHeThong" class="textstyle1" type="text" value="<%=entityTB.ChiTiet_TenHeThong %>" placeholder="Điền tên hoặc tên miền, địa chỉ IP của hệ thống thông tin bị sự cố" />
                                                    </i>
                                                </p>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Tên địa chỉ của đơn vị, cá nhân vận hành (*): </span>
                                                </p>
                                            </td>
                                            <td colspan="5" valign="top" style='width: 283.55pt; border: solid windowtext 1.0pt; border-left: none; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <i>
                                                        <input name="ChiTiet_TenDonVi" maxlength="250" id="ChiTiet_TenDonVi" class="textstyle1" type="text" value="<%=entityTB.ChiTiet_TenDonVi %>" placeholder="Điền tên địa chỉ của đơn vị, cá nhân vận hành " />
                                                    </i>
                                                </p>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Tên cơ quan chủ quản hệ thống thông tin bị sự cố (nếu biết): </span>
                                                </p>
                                            </td>
                                            <td colspan="5" valign="top" style='width: 283.55pt; border: solid windowtext 1.0pt; border-left: none; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <i>
                                                        <input name="ChiTiet_CoQuan" maxlength="250" id="ChiTiet_CoQuan" class="textstyle1" type="text" value="<%=entityTB.ChiTiet_CoQuan %>" placeholder="Điền tên cơ quan chủ quản hệ thống thông tin bị sự cố" />
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
                                                        <textarea name="ChiTiet_MoTa" maxlength="1000" id="ChiTiet_MoTa" class="textstyle1" rows="5" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityTB.ChiTiet_MoTa %></textarea>
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
                                                    <input name="Ngay" maxlength="250" id="" class="textstyle1" type="text" value="<%=string.Format("{0:dd/MM/yyyy}", entityTB.ChiTiet_NgayGioPhatHien) %>" style="width: 80px;" />
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
                                                        <input name="Gio" maxlength="250" id="" class="textstyle1" type="text" value="<%=string.Format("{0:HH}", entityTB.ChiTiet_NgayGioPhatHien) %>" style="width: 20%;" />
                                                    </span>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>giờ
                                                   
                                                        <input name="Phut" maxlength="250" id="" class="textstyle1" type="text" value="<%=string.Format("{0:mm}", entityTB.ChiTiet_NgayGioPhatHien) %>" style="width: 20%;" />
                                                        phút
                                                    </span>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                    </p>

                                    <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse; border: none;'>
                                        <tr>
                                            <td width="605" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Kết quả xử lý sự cố đề xuất (*)</span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="605" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.25pt'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                                        <textarea name="ChiTiet_KetQua" maxlength="1000" id="ChiTiet_KetQua" class="textstyle1" rows="5" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityTB.ChiTiet_KetQua %></textarea>
                                                    </span>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                    </p>

                                    <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse; border: none;'>
                                        <tr>
                                            <td width="605" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Kiến nghị và các thông tin liên quan khác (nếu có)</span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td width="605" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.25pt'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                                        <textarea name="ChiTiet_KienNghi" maxlength="1000" id="ChiTiet_KienNghi" class="textstyle1" rows="5" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityTB.ChiTiet_KienNghi %></textarea>
                                                    </span>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <div class="clear-20">&nbsp;</div>

                                </div>

                                <div class="button">
                                    <input type="hidden" name="endCode" value="<%=endCode %>" />
                                    <input type="hidden" name="baoCaoDBId" id="baoCaoDBId" value="0">
                                    <%if (isEdit == 1)
                                        {%>
                                    <input class="btn btn-success" name="_hl_action[UpdateThongBaoUCSC]" value="{RS:Form_CapNhatBtn}" type="submit" />
                                    <%}
                                        else
                                        {%>
                                   <input class="btn btn-success" name="_hl_action[AddThongBaoUCSC]" value="{RS:Form_LuuBtn}" type="submit" />
                                    <%}%>
                                    
                                    <input class="btn btn-danger" style="margin-left: 10px;" onclick="location.href = '<%=bcscUrl%>';" type="button" name="" value="{RS:Form_DongBtn}" />
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <!--.Main_container-->
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    function del(id, encode) {
        if (id && encode) {
            if (window.confirm('{RS:Web_BanCoChacXoaDeNghi}')) {
                $('#baoCaoDBId').val(id);
                $('#DeleteBCHoTroPhoiHop').click();
            } else {
                $('#baoCaoDBId').val(0);
            }
        } else {
            $('#baoCaoDBId').val(0);
        }
    }
</script>
