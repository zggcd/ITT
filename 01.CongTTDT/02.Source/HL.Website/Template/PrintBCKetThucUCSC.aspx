<%@ Page Language="C#" AutoEventWireup="true" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HL.Lib.Global.CPLogin.IsLoginOnWeb())
        {
            int langId = HL.Core.Global.Convert.ToInt(Request.QueryString["langId"], 0);
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

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Preview</title>
    <meta name="author" content="lehoanganhhd@gmail.com" />
    <meta name="generator" content="HLv3.0.Min" />

    <style>
        table.thanh-vien {
            border-collapse: collapse;
        }

            table.thanh-vien th {
                text-align: center;
            }

            table.thanh-vien th,
            table.thanh-vien td {
                border: 1px solid #000;
                border-collapse: collapse;
                text-align: center;
                padding: 5px;
            }

                table.thanh-vien td input,
                table.thanh-vien td select {
                    width: 90%;
                }
    </style>
</head>
<body>
    <form id="hlForm" runat="server">

        <%
            int recordId = HL.Core.Web.HttpQueryString.GetValue("RecordID").ToInt();
            ModBaoCaoKetThucSuCoEntity entityBc = ModBaoCaoKetThucSuCoService.Instance.GetByID(recordId);
            if (entityBc == null) return;

            ModBaoCaoSuCoEntity sc = ModBaoCaoSuCoService.Instance.CreateQuery().Where(o => o.ID == entityBc.BaoCaoSuCoID).ToSingle();
            if (sc == null) return;

            ModBaoCaoBanDauSuCoEntity entityBcBanDau = ModBaoCaoBanDauSuCoService.Instance.CreateQuery().Where(o => o.BaoCaoSuCoID == sc.ID).ToSingle();
            if (entityBcBanDau == null) return;

            List<WebMenuEntity> lstCapDo = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "CapDo" && o.ParentID > 0).ToList_Cache();
            int countCapDo = lstCapDo != null ? lstCapDo.Count : 0;
        %>

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
                <span><%=sc.Name %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'> Địa chỉ: (*)</span>
                <span><%=sc.Address %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'> Điện thoại (*)</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                    <span><%=sc.Phone %></span>
                </span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                    Email (*) <span><%=sc.Email %></span>
                </span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                <b style='mso-bidi-font-weight: normal'>
                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>KÝ HIỆU BÁO CÁO BAN ĐẦU SỰ CỐ</span>
                </b>
                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>: Số ký hiệu</span>
                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                    <%=entityBcBanDau.Code %>
                </span>
                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Ngày báo cáo:</span>
                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                    <%=string.Format("{0:dd/MM/yyyy}", entityBcBanDau.Published) %>
                </span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <b style='mso-bidi-font-weight: normal'>
                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>THÔNG TIN CHI TIẾT VỀ HỆ THỐNG BỊ SỰ CỐ</span>
                </b>
            </p>

            <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0"
                style='width: 100%; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 0in 0in 0in; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
                <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
                    <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>Tên đơn vị vận hành hệ thống thông tin (*): </span>
                        </p>
                    </td>
                    <td width="378" colspan="5" valign="top" style='width: 283.55pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <i style='mso-bidi-font-style: normal'>
                                <span><%=entityBc.ChiTiet_TenDonVi %></span>
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
                                    <%=entityBc.ChiTiet_CoQuan %>
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
                                    <%=entityBc.ChiTiet_TenHeThong %>
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
                            <input name="ChiTiet_PhanLoaiID" <%= entityBc.ChiTiet_PhanLoaiID == lstCapDo[i].ID ? "checked" : "" %> type="radio" value='<%=lstCapDo[i].ID %>' disabled />
                            <%=lstCapDo[i].Name %>
                        </p>
                    </td>
                    <%} %>
                </tr>
            </table>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'></span>
            </p>

            <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style='width: 100%; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 0in 0in 0in; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
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
                                <%=entityBc.Summary %>
                            </span>
                        </p>
                    </td>
                </tr>
            </table>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
            </p>

            <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0"
                style='width: 100%; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 0in 0in 0in; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
                <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                    <td valign="top" style='width: 140.8pt; border: solid windowtext 1.0pt; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Ngày phát hiện sự cố (*) (dd/mm/yy)</span>
                        </p>
                    </td>
                    <td style='width: 33.45pt; border-top: solid windowtext 1.0pt; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-bottom-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                            <span><%=string.Format("{0:dd/MM/yyyy}", entityBc.NgayGioPhatHien) %>
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
                                <%=string.Format("{0:HH}", entityBc.NgayGioPhatHien) %>
                            </span>
                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>giờ
                                                    <%=string.Format("{0:mm}", entityBc.NgayGioPhatHien) %>
                                phút
                            </span>
                        </p>
                    </td>
                </tr>
            </table>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'></span>
            </p>

            <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style='width: 100%; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 0in 0in 0in; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
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
                                <%=entityBc.KetQua %>
                            </span>
                        </p>
                    </td>
                </tr>
            </table>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'></span>
            </p>

            <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style='width: 100%; border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 0in 0in 0in; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
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
                                <%=entityBc.Files %>
                            </span>
                        </p>
                    </td>
                </tr>
            </table>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
            </p>

            <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"
                style='width: 100%; border-collapse: collapse; mso-padding-alt: 0in 5.4pt 0in 5.4pt'>
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

    </form>

    <script src="/Content/js/jquery.min-1.12.4.js"></script>
    <script>
        $(document).ready(function () {
            window.print();
        });
    </script>
</body>
</html>
