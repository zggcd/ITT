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
            Response.Redirect("/vn/Thanh-vien/Dang-nhap.aspx?ReturnPath=" + HttpUtility.ParseQueryString(Request.RawUrl));
            return;
        }
    }
</script>

<%
    CPUserEntity entity = ViewBag.Data as CPUserEntity ?? CPLogin.CurrentUser;
    ModBaoCaoSuCoEntity sc = ViewBag.BCSuCo as ModBaoCaoSuCoEntity ?? new ModBaoCaoSuCoEntity();
    ModBaoCaoPhuongAnSuCoEntity entityBc = ViewBag.BaoCao as ModBaoCaoPhuongAnSuCoEntity ?? new ModBaoCaoPhuongAnSuCoEntity();
    List<ModBaoCaoPhuongAnSuCoEntity> lstBCPhuongAn = ViewBag.ListBaoCao as List<ModBaoCaoPhuongAnSuCoEntity> ?? new List<ModBaoCaoPhuongAnSuCoEntity>();

    string endCode = ViewBag.EndCode;
%>

<div class="row-fluid titleContainer">
    <span>BÁO CÁO PHƯƠNG ÁN ỨNG CỨU SỰ CỐ MẠNG</span>
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
                                                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>BÁO CÁO PHƯƠNG ÁN ỨNG CỨU SỰ CỐ MẠNG</span>
                                            </b>
                                        </a>
                                        <b>
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


                                    <div class="clear-20">&nbsp;</div>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>THÔNG TIN PHƯƠNG ÁN ỨNG CỨU SỰ CỐ</span>
                                        </b>
                                    </p>

                                    <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse; border: none;'>
                                        <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
                                            <td valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Thời gian</span>
                                                </p>
                                            </td>
                                            <td colspan="5" valign="top" style='width: 425.55pt; border: solid windowtext 1.0pt; border-left: none; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Mô tả diễn biến sự cố</span>
                                                </p>
                                            </td>
                                            <td colspan="5" valign="top" style='width: 25.55pt; border: solid windowtext 1.0pt; border-left: none; padding: 0in 0in 0in 0in'></td>
                                        </tr>

                                        <%for (int i = 0; i < lstBCPhuongAn.Count; i++) %>
                                        <%{%>
                                        <tr>
                                            <td valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; text-align: center'>
                                                    <%=string.Format("{0:dd/MM/yyyy}", lstBCPhuongAn[i].ChiTiet_NgayTao) %> lúc <%=string.Format("{0:HH}", lstBCPhuongAn[i].ChiTiet_NgayTao) %> giờ <%=string.Format("{0:mm}", lstBCPhuongAn[i].ChiTiet_NgayTao) %> phút
                                                </p>
                                            </td>
                                            <td colspan="5" valign="top" style='width: 425.55pt; border: solid windowtext 1.0pt; border-left: none; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt; margin-left: 6.0pt'>
                                                    <%= lstBCPhuongAn[i].ChiTiet_MoTa %>
                                                </p>
                                            </td>
                                            <td colspan="5" valign="top" class="text-center" style='width: 25.55pt; border: solid windowtext 1.0pt; border-left: none; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <a href="javascript: del('<%=lstBCPhuongAn[i].ID %>', '<%=endCode%>');">Xóa</a>
                                                    <input class="btn_action search icon QAcustom" name="_hl_action[DeleteBCPhuongAnUCSC]" id="DeleteBCPhuongAn" value="Xóa" type="submit" style="display: none;">
                                                </p>
                                            </td>
                                        </tr> 
                                        <%} %>
                                    </table>

                                    <div class="clear-20">&nbsp;</div>
                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Thêm mới phương án ứng cứu sự cố</span>
                                    </p>
                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <i>
                                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                                <textarea name="ChiTiet_MoTa" maxlength="255" id="ChiTiet_MoTa" class="textstyle1" rows="3" style="max-width: 90%; width: 90%; max-height: 300px;"></textarea>
                                            </span>
                                        </i>
                                    </p>
                                </div>

                                <div class="button">
                                    <input type="hidden" name="baoCaoDBId" id="baoCaoDBId" value="0">
                                    <input type="hidden" name="endCode" value="<%=endCode %>" />
                                    <input class="btn btn-success" name="_hl_action[AddBCPhuongAnUCSC]" value="Thêm mới" type="submit" />
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

<script type="text/javascript">
    function del(id, encode) {
        if (id && encode) {
            if (window.confirm('Bạn có chắc muốn xóa thông tin phương án ứng cứu sự cố này?')) {
                $('#baoCaoDBId').val(id);
                $('#DeleteBCPhuongAn').click();
            } else {
                $('#baoCaoDBId').val(0);
            }
        } else {
            $('#baoCaoDBId').val(0);
        }
    }
</script>
