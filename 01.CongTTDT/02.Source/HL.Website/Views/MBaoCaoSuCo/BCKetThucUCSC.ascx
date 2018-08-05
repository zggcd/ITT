<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HL.Lib.Global.CPLogin.IsLogin())
        {
            Response.Redirect("/vn/Thanh-vien/Dang-nhap.aspx?ReturnPath=" + HttpUtility.ParseQueryString(Request.RawUrl));
            return;
        }
    }
</script>

<%
    CPUserEntity entity = ViewBag.Data as CPUserEntity ?? CPLogin.CurrentUser;
    ModBaoCaoSuCoEntity sc = ViewBag.BCSuCo as ModBaoCaoSuCoEntity ?? new ModBaoCaoSuCoEntity();
    ModBaoCaoKetThucSuCoEntity entityBc = ViewBag.BaoCao as ModBaoCaoKetThucSuCoEntity ?? new ModBaoCaoKetThucSuCoEntity();
    ModBaoCaoBanDauSuCoEntity entityBcBanDau = ViewBag.BCBanDau as ModBaoCaoBanDauSuCoEntity ?? new ModBaoCaoBanDauSuCoEntity();
    string endCode = ViewBag.EndCode;
    int isEdit = ViewBag.IsEdit ?? 0;

    List<WebMenuEntity> lstCapDo = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "CapDo" && o.ParentID > 0).ToList_Cache();
    int countCapDo = lstCapDo != null ? lstCapDo.Count : 0;

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
        <%--    <div class="box-category mb10">
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
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
                                    </p>

                                    <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0"
                                        style='border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
                                        <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                            <td width="231" valign="top" style='width: 173.4pt; border: none; border-right: solid windowtext 1.0pt; mso-border-right-alt: solid windowtext .5pt; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'></span>
                                                </p>
                                            </td>
                                            <td width="359" valign="top" style='width: 269.4pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <a name="chuong_pl_4">
                                                        <b style='mso-bidi-font-weight: normal'>
                                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Mẫu số 04</span>
                                                        </b>
                                                    </a><b style='mso-bidi-font-weight: normal'>
                                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                            <br>
                                                        </span>
                                                    </b><i style='mso-bidi-font-style: normal'>
                                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Ban hành kèm theo Thông tư số   /2017/TT-BTTT ngày …/…/2017 của Bộ Thông tin và Truyền thông</span>
                                                    </i><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'></span>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
                                    </p>

                                    <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                        <a name="chuong_pl_4_name">
                                            <b style='mso-bidi-font-weight: normal'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>BÁO CÁO KẾT THÚC ỨNG PHÓ SỰ CỐ</span>
                                            </b>
                                        </a><b style='mso-bidi-font-weight: normal'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'></span>
                                        </b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <b style='mso-bidi-font-weight: normal'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>THÔNG TIN VỀ TỔ CHỨC/CÁ NHÂN BÁO CÁO SỰ CỐ</span>
                                        </b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; Tên tổ chức/cá nhân báo cáo sự cố (*)</span>
                                        <input name="ToChuc_Ten" maxlength="255" id="ToChuc_Ten" class="textstyle1" type="text" value="<%=sc.Name %>" disabled />
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'> Địa chỉ: (*)</span>
                                        <input name="ToChuc_DiaChi" maxlength="255" id="ToChuc_DiaChi" class="textstyle1" type="text" value="<%=sc.Address %>" disabled />
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'> Điện thoại (*)</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                            <input name="ToChuc_DienThoai" maxlength="255" id="ToChuc_DienThoai" class="textstyle1" type="text" value="<%=sc.Phone %>" disabled />
                                            Email (*) 
                                    <input name="ToChuc_Email" maxlength="255" id="ToChuc_Email" class="textstyle1" type="text" value="<%=sc.Email %>" disabled />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <b style='mso-bidi-font-weight: normal'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>KÝ HIỆU BÁO CÁO BAN ĐẦU SỰ CỐ</span>
                                        </b>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>: Số ký hiệu</span>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                            <input style="width: 15%;" name="SoKyHieu" maxlength="255" id="SoKyHieu" class="textstyle1" type="text" value="<%=entityBcBanDau.Code %>" disabled />
                                        </span>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Ngày báo cáo:</span>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                            <input style="width: 10%;" name="NgayBaoCao" maxlength="255" id="NgayBaoCao" class="textstyle1" type="text" value="<%=string.Format("{0:dd/MM/yyyy}", entityBcBanDau.Published) %>" disabled />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <b style='mso-bidi-font-weight: normal'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>THÔNG TIN CHI TIẾT VỀ HỆ THỐNG BỊ SỰ CỐ</span>
                                        </b>
                                    </p>

                                    <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0"
                                        style='border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 0in 0in 0in; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
                                        <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
                                            <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>Tên đơn vị vận hành hệ thống thông tin (*): </span>
                                                </p>
                                            </td>
                                            <td width="378" colspan="5" valign="top" style='width: 283.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <i style='mso-bidi-font-style: normal'>
                                                        <input name="ChiTiet_TenDonVi" maxlength="255" id="ChiTiet_TenDonVi" class="textstyle1" type="text" value="<%=entityBc.ChiTiet_TenDonVi %>" placeholder="Điền tên đơn vị vận hành hoặc được thuê vận hành hệ thống thông tin " />
                                                    </i>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr style='mso-yfti-irow: 1'>
                                            <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>Cơ quan chủ quản:</span>
                                                </p>
                                            </td>
                                            <td width="378" colspan="5" valign="top" style='width: 283.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <i style='mso-bidi-font-style: normal'>
                                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>
                                                            <input name="ChiTiet_CoQuan" maxlength="255" id="ChiTiet_CoQuan" class="textstyle1" type="text" value="<%=entityBc.ChiTiet_CoQuan %>" placeholder="Điền tên cơ quan chủ quản" />
                                                        </span>
                                                    </i>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr style='mso-yfti-irow: 2'>
                                            <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>Tên hệ thống bị sự cố</span>
                                                </p>
                                            </td>
                                            <td width="378" colspan="5" valign="top" style='width: 283.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <i style='mso-bidi-font-style: normal'>
                                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>
                                                            <input name="ChiTiet_TenHeThong" maxlength="255" id="ChiTiet_TenHeThong" class="textstyle1" type="text" value="<%=entityBc.ChiTiet_TenHeThong %>" placeholder="Điền tên hệ thống bị sự cố và tên miền, địa chỉ ip liên quan" />
                                                        </span>
                                                    </i>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr style='mso-yfti-irow: 3'>
                                            <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>Phân loại cấp độ của hệ thống thông tin (nếu có)</span>
                                                </p>
                                            </td>
                                            <%for (int i = 0; i < countCapDo && i < 5; i++)
                                                {%>
                                            <td width="75" valign="top" style='width: 56.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <input name="ChiTiet_PhanLoaiID" <%= entityBc.ChiTiet_PhanLoaiID == lstCapDo[i].ID ? "checked" : "" %> type="radio" value='<%=lstCapDo[i].ID %>' />
                                                    <%=lstCapDo[i].Name %>
                                                </p>
                                            </td>
                                            <%} %>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'></span>
                                    </p>

                                    <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 0in 0in 0in; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
                                        <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
                                            <td width="605" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Tên/Mô tả về sự cố</span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr style='mso-yfti-irow: 1; mso-yfti-lastrow: yes'>
                                            <td width="605" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.25pt'>
                                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                        <textarea name="Summary" maxlength="255" id="Summary" class="textstyle1" rows="3" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.Summary %></textarea>
                                                    </span>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
                                    </p>

                                    <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0"
                                        style='border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 0in 0in 0in; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
                                        <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                            <td valign="top" style='width: 140.8pt; border: solid windowtext 1.0pt; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Ngày phát hiện sự cố (*) (dd/mm/yy)</span>
                                                </p>
                                            </td>
                                            <td style='width: 33.45pt; border-top: solid windowtext 1.0pt; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <input name="Ngay" maxlength="255" id="" class="textstyle1" type="text" value="<%=string.Format("{0:dd/MM/yyyy}", entityBc.NgayGioPhatHien) %>" style="width: 80px;" />
                                                </p>
                                            </td>
                                            <td width="52" style='width: 38.7pt; border: solid windowtext 1.0pt; border-left: none; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'></span>
                                                </p>
                                            </td>
                                            <td style='width: 105.2pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Thời gian phát hiện (*):</span>
                                                </p>
                                            </td>
                                            <td width="147" style='width: 109.9pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                                        <input name="Gio" maxlength="255" id="" class="textstyle1" type="text" value="<%=string.Format("{0:HH}", entityBc.NgayGioPhatHien) %>" style="width: 20%;" />
                                                    </span>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>giờ
                                                    <input name="Phut" maxlength="255" id="" class="textstyle1" type="text" value="<%=string.Format("{0:mm}", entityBc.NgayGioPhatHien) %>" style="width: 20%;" />
                                                        phút
                                                    </span>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'></span>
                                    </p>

                                    <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 0in 0in 0in; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
                                        <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
                                            <td width="605" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Kết quả xử lý sự cố</span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr style='mso-yfti-irow: 1; mso-yfti-lastrow: yes'>
                                            <td width="605" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.25pt'>
                                                    <i style='mso-bidi-font-style: normal'>
                                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>Cung cấp, tóm tắt tổng quát về những gì đã xảy ra và cách thức giải quyết, đề xuất giải pháp ứng cứu ứng sự cố nhằm xử lý nhanh sự cố, giảm nhẹ rủi ro và thiệt hại đối với sự cố tương tự trong tương lai...</span>
                                                    </i>
                                                </p>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.25pt'>
                                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                        <textarea name="KetQua" maxlength="255" id="KetQua" class="textstyle1" rows="3" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.KetQua %></textarea>
                                                    </span>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'></span>
                                    </p>

                                    <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 0in 0in 0in; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
                                        <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
                                            <td width="605" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Các tài liệu đính kèm</span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr style='mso-yfti-irow: 1; mso-yfti-lastrow: yes'>
                                            <td width="605" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; border-top: none; mso-border-top-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.25pt'>
                                                    <i style='mso-bidi-font-style: normal'>
                                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>Liệt kê các tài liệu liên quan (báo cáo diễn biến sự cố; phương án xử lý, log file…..)</span>
                                                    </i>
                                                </p>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.25pt'>
                                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                        <textarea name="Files" maxlength="255" id="Files" class="textstyle1" rows="3" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.Files %></textarea>
                                                    </span>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
                                    </p>

                                    <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"
                                        style='border-collapse: collapse; mso-padding-alt: 0in 5.4pt 0in 5.4pt'>
                                        <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                            <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'></span>
                                                </p>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'></span>
                                                </p>
                                            </td>
                                            <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <b style='mso-bidi-font-weight: normal'>
                                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>CÁ NHÂN/NGƯỜI ĐẠI DIỆN THEO PHÁP LUẬT<br>
                                                        </span>
                                                    </b>
                                                    <i style='mso-bidi-font-style: normal'>
                                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>(Ký tên, đóng dấu)</span>
                                                    </i>
                                                    <b style='mso-bidi-font-weight: normal'>
                                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'></span>
                                                    </b>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal"><span lang="VI"></span></p>

                                </div>

                                <div class="button">
                                    <input type="hidden" name="endCode" value="<%=endCode %>" />
                                    <%if (menu != null & menu.Code != "KetThuc")
                                        {%>
                                    <%if (isEdit == 1)
                                        {%>
                                    <input class="btn btn-success" name="_hl_action[UpdateBCKetThucUCSC]" value="Cập nhật" type="submit" />
                                    <%}
                                        else
                                        {%>
                                    <input class="btn btn-success" name="_hl_action[AddBCKetThucUCSC]" value="Lưu" type="submit" />
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
