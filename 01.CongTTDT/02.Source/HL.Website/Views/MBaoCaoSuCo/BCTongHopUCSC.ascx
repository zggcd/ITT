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
    ModBaoCaoTongHopEntity entityBc = ViewBag.BaoCao as ModBaoCaoTongHopEntity ?? new ModBaoCaoTongHopEntity();
    List<ModSoLuongSuCoEntity> currSuCo = ViewBag.SuCo as List<ModSoLuongSuCoEntity> ?? new List<ModSoLuongSuCoEntity>();

    string strSuCo = string.Join(",", currSuCo.Select(o => o.MenuID));
    string endCode = ViewBag.EndCode;
    int isEdit = ViewBag.IsEdit ?? 0;

    List<WebMenuEntity> lstLoaiSuCo = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "LoaiSuCo" && o.ParentID > 0).ToList_Cache();
    int countLoaiSuCo = lstLoaiSuCo != null ? lstLoaiSuCo.Count : 0;

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
    <span>BÁO CÁO TỔNG HỢP VỀ HOẠT ĐỘNG TIẾP NHẬN VÀ XỬ LÝ SỰ CỐ</span>
</div>

<div class="contentNews">
    <div class="main_right">
        <%--<div class="box-category mb10">
            <div class="vanban-new">
                <h3 class="title-list-news">
                    <span class="title-t1">BÁO CÁO TỔNG HỢP VỀ HOẠT ĐỘNG TIẾP NHẬN VÀ XỬ LÝ SỰ CỐ</span>
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
                                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Mãu số 05</span></b>
                                                    </a>
                                                    <b style='mso-bidi-font-weight: normal'>
                                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                            <br>
                                                        </span></b>
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
                                        </b>
                                        <b style='mso-bidi-font-weight: normal'>
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
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9633; Từ tháng</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                            <input name="TuNgay" maxlength="255" id="" class="textstyle1" type="text" value="<%=string.Format("{0:MM/yyyy}", entityBc.TuNgay) %>" style="width: 15%; text-align: center;" />
                                        </span>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>đến tháng 
                                        <input name="DenNgay" maxlength="255" id="" class="textstyle1" type="text" value="<%=string.Format("{0:MM/yyyy}", entityBc.DenNgay) %>" style="width: 15%; text-align: center;" />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Tên cơ quan/tổ chức:</span>
                                        <input name="TenToChuc" maxlength="255" id="TenToChuc" class="textstyle1" type="text" value="<%=sc.Name %>" disabled />
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Địa chỉ:</span>
                                        <input name="DiaChi" maxlength="255" id="DiaChi" class="textstyle1" type="text" value="<%=sc.Address %>" disabled />
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
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Loại sự cố/tấn công mạng</span>
                                                </p>
                                            </td>
                                            <td width="42" style='width: 31.85pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Số lượng</span>
                                                </p>
                                            </td>
                                            <td width="52" style='width: 38.8pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Số sự cố tự xử lý</span>
                                                </p>
                                            </td>
                                            <td width="78" style='width: 58.55pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>S</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>&#7889;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Số sự cố có sự hỗ trợ xử lý từ các tổ chức khác</span>
                                                </p>
                                            </td>
                                            <td width="77" style='width: 58.1pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Số sự cố có hỗ trợ xử lý từ tổ chức nước ngoài</span>
                                                </p>
                                            </td>
                                            <td width="76" style='width: 57.2pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Số sự cố đề nghị VNCERT hỗ trợ xử lý</span>
                                                </p>
                                            </td>
                                            <td width="72" style='width: 53.85pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Thiệt hại ước tính</span>
                                                </p>
                                            </td>
                                        </tr>

                                        <%for (int i = 0; i < countLoaiSuCo; i++)
                                            {
                                                var row = currSuCo.Where(o => o.MenuID == lstLoaiSuCo[i].ID).FirstOrDefault();
                                                if (row == null) row = new ModSoLuongSuCoEntity();
                                        %>
                                        <tr>
                                            <td>
                                                <input type="hidden" name="MN" value="<%=lstLoaiSuCo[i].ID %>" />
                                            </td>
                                        </tr>
                                        <tr style='mso-yfti-irow: 1'>
                                            <td width="208" valign="top" style='width: 155.7pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'><%=lstLoaiSuCo[i].Name %></span>
                                                </p>
                                            </td>
                                            <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; text-align: center;'>
                                                    <input name="SoLuong" maxlength="255" id="" class="textstyle1" type="text" value="<%=row.SoLuong > 0 ? string.Format("{0:##,###}", row.SoLuong) : "0" %>" style="width: 50%; text-align: center;" />
                                                </p>
                                            </td>
                                            <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; text-align: center;'>
                                                    <input name="TuXuLy" maxlength="255" id="" class="textstyle1" type="text" value="<%=row.TuXuLy > 0 ? string.Format("{0:##,###}", row.TuXuLy) : "0" %>" style="width: 50%; text-align: center;" />
                                                </p>
                                            </td>
                                            <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; text-align: center;'>
                                                    <input name="ToChucHoTro" maxlength="255" id="" class="textstyle1" type="text" value="<%=row.ToChucHoTro > 0 ? string.Format("{0:##,###}", row.ToChucHoTro) : "0" %>" style="width: 50%; text-align: center;" />
                                                </p>
                                            </td>
                                            <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; text-align: center;'>
                                                    <input name="ToChucNuocNgoaiHoTro" maxlength="255" id="" class="textstyle1" type="text" value="<%=row.ToChucNuocNgoaiHoTro > 0 ? string.Format("{0:##,###}", row.ToChucNuocNgoaiHoTro) : "0" %>" style="width: 50%; text-align: center;" />
                                                </p>
                                            </td>
                                            <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; text-align: center;'>
                                                    <input name="DeNghi" maxlength="255" id="" class="textstyle1" type="text" value="<%=row.DeNghi > 0 ? string.Format("{0:##,###}", row.DeNghi) : "0" %>" style="width: 50%; text-align: center;" />
                                                </p>
                                            </td>
                                            <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; text-align: center;'>
                                                    <input name="ThietHaiUocTinh" maxlength="255" id="" class="textstyle1" type="text" value="<%=row.ThietHaiUocTinh > 0 ? string.Format("{0:##,###}", row.ThietHaiUocTinh) : "0" %>" style="width: 50%; text-align: center;" />
                                                </p>
                                            </td>
                                        </tr>
                                        <%} %>

                                        <tr style='mso-yfti-irow: 1'>
                                            <td width="208" valign="top" style='width: 155.7pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'><b>Tổng cộng</b></span>
                                                </p>
                                            </td>
                                            <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p id="T1" class="MsoNormal" style='margin-top: 6.0pt; text-align: center; font-weight: bold;'>
                                                    <%=currSuCo.Sum(o => o.SoLuong) %>
                                                </p>
                                            </td>
                                            <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p id="T2" class="MsoNormal" style='margin-top: 6.0pt; text-align: center; font-weight: bold;'>
                                                    <%=currSuCo.Sum(o => o.TuXuLy) %>
                                                </p>
                                            </td>
                                            <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p id="T3" class="MsoNormal" style='margin-top: 6.0pt; text-align: center; font-weight: bold;'>
                                                    <%=currSuCo.Sum(o => o.ToChucHoTro) %>
                                                </p>
                                            </td>
                                            <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p id="T4" class="MsoNormal" style='margin-top: 6.0pt; text-align: center; font-weight: bold;'>
                                                    <%=currSuCo.Sum(o => o.ToChucNuocNgoaiHoTro) %>
                                                </p>
                                            </td>
                                            <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p id="T5" class="MsoNormal" style='margin-top: 6.0pt; text-align: center; font-weight: bold;'>
                                                    <%=currSuCo.Sum(o => o.DeNghi) %>
                                                </p>
                                            </td>
                                            <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p id="T6" class="MsoNormal" style='margin-top: 6.0pt; text-align: center; font-weight: bold;'>
                                                    <%=currSuCo.Sum(o => o.ThietHaiUocTinh) %>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>2. Danh sách các tổ chức hỗ trợ xử lý sự cố </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <textarea name="DSToChucHoTro" maxlength="255" id="DSToChucHoTro" class="textstyle1" rows="3" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.DSToChucHoTro %></textarea>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>3. Danh sách các tổ chức nước ngoài hỗ trợ xử lý sự cố</span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <textarea name="DSToChucNuocNgoaiHoTro" maxlength="255" id="DSToChucNuocNgoaiHoTro" class="textstyle1" rows="3" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.DSToChucNuocNgoaiHoTro %></textarea>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>4. Đề xuất kiến nghị:</span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <textarea name="DeXuat" maxlength="255" id="DeXuat" class="textstyle1" rows="3" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityBc.DeXuat %></textarea>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
                                    </p>

                                    <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" style='border-collapse: collapse; mso-padding-alt: 0in 5.4pt 0in 5.4pt'>
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
                                    <%if (menu != null & menu.Code != "KetThuc")
                                        {%>
                                    <%if (isEdit == 1)
                                        {%>
                                    <input class="btn btn-success" name="_hl_action[UpdateBCTongHopUCSC]" value="Cập nhật" type="submit" />
                                    <%}
                                        else
                                        {%>
                                    <input class="btn btn-success" name="_hl_action[AddBCTongHopUCSC]" value="Lưu" type="submit" />
                                    <%}%>
                                    <%}%>

                                    <input class="btn btn-danger" style="margin-left: 10px;" onclick="location.href = '/vn/Bao-cao-su-co/<%=endCode %>.aspx';" type="button" name="" value="Đóng" />
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

<script>
    $('input[name=SoLuong]').change(function () {
        var n = 0;
        $('input[name=SoLuong]').map(function () {
            n += $(this).val() * 1;
        })
        $('#T1').html(n);
    });
    $('input[name=TuXuLy]').change(function () {
        var n = 0;
        $('input[name=TuXuLy]').map(function () {
            n += $(this).val() * 1;
        })
        $('#T2').html(n);
    });
    $('input[name=ToChucHoTro]').change(function () {
        var n = 0;
        $('input[name=ToChucHoTro]').map(function () {
            n += $(this).val() * 1;
        })
        $('#T3').html(n);
    });
    $('input[name=ToChucNuocNgoaiHoTro]').change(function () {
        var n = 0;
        $('input[name=ToChucNuocNgoaiHoTro]').map(function () {
            n += $(this).val() * 1;
        })
        $('#T4').html(n);
    });
    $('input[name=DeNghi]').change(function () {
        var n = 0;
        $('input[name=DeNghi]').map(function () {
            n += $(this).val() * 1;
        })
        $('#T5').html(n);
    });
    $('input[name=ThietHaiUocTinh]').change(function () {
        var n = 0;
        $('input[name=ThietHaiUocTinh]').map(function () {
            n += $(this).val() * 1;
        })
        $('#T6').html(n);
    });
</script>
