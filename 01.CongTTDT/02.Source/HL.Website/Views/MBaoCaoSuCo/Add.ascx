<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HL.Lib.Global.CPLogin.IsLoginOnWeb())
        {
            int langId = ViewPage.CurrentPage.LangID;
            string loginUrl = "/vn/Thanh-vien/Dang-nhap.aspx"
                , thembcUrl = "/vn/Bao-cao-su-co/Them-bao-cao.aspx";
            if (langId == 2)
            {
                loginUrl = "/en/Member/Login.aspx";
                thembcUrl = "/en/Bao-cao-su-co/Them-bao-cao.aspx";
            }
            Response.Redirect(loginUrl + "?ReturnPath=" + HttpUtility.ParseQueryString(thembcUrl));
            return;
        }
        int userId = HL.Lib.Global.CPLogin.UserID;
        var dk = ModDonDangKyUCSCService.Instance.CreateQuery().Where(o => o.UserID == userId).ToSingle();
        var endCode = ViewBag.EndCode;
        //if (string.IsNullOrEmpty(endCode))
        //{
        //    Response.Redirect("/vn/Thanh-vien/DS-dang-ky-ung-cuu-su-co.aspx");
        //    return;
        //}
    }
</script>

<% 
    var item = ViewBag.Data as ModBaoCaoSuCoEntity;
    var endCode = ViewBag.EndCode as string;
    string prefix = string.Empty;
    string bcBanDauUrl = "#", bcTongHopUrl = "#", bcKetThucUrl = "#", bcDienBienUrl = "#", bcPhuongAnUrl = "#", bcHoTroPhoiHopUrl = "#";
    if (!string.IsNullOrEmpty(endCode))
    {
        int langId = ViewPage.CurrentPage.LangID;

        prefix = endCode + "-";
        bcBanDauUrl = "/vn/Bao-cao-su-co/" + prefix + "bc-ban-dau-su-co.aspx";
        bcTongHopUrl = "/vn/Bao-cao-su-co/" + prefix + "bc-tong-hop-su-co.aspx";
        bcKetThucUrl = "/vn/Bao-cao-su-co/" + prefix + "bc-ket-thuc-su-co.aspx";

        bcDienBienUrl = "/vn/Bao-cao-su-co/" + prefix + "bc-dien-bien-su-co.aspx";
        bcPhuongAnUrl = "/vn/Bao-cao-su-co/" + prefix + "bc-phuong-an-su-co.aspx";
        bcHoTroPhoiHopUrl = "/vn/Bao-cao-su-co/" + prefix + "bc-ho-tro-phoi-hop-su-co.aspx";

        string bcscUrl = "/vn/Bao-cao-su-co.aspx";

        if (langId == 2)
        {
            bcBanDauUrl = "/en/Bao-cao-su-co/" + prefix + "bc-ban-dau-su-co.aspx";
            bcTongHopUrl = "/en/Bao-cao-su-co/" + prefix + "bc-tong-hop-su-co.aspx";
            bcKetThucUrl = "/en/Bao-cao-su-co/" + prefix + "bc-ket-thuc-su-co.aspx";

            bcDienBienUrl = "/en/Bao-cao-su-co/" + prefix + "bc-dien-bien-su-co.aspx";
            bcPhuongAnUrl = "/en/Bao-cao-su-co/" + prefix + "bc-phuong-an-su-co.aspx";
            bcHoTroPhoiHopUrl = "/en/Bao-cao-su-co/" + prefix + "bc-ho-tro-phoi-hop-su-co.aspx";
            bcscUrl = "/en/Bao-cao-su-co.aspx";
        }
    }

    WebMenuEntity menu = WebMenuService.Instance.GetByID(item.MenuID);
    if (menu == null) menu = new WebMenuEntity();

    var dk = ModDonDangKyUCSCService.Instance.CreateQuery().Where(o => o.UserID == CPLogin.CurrentUserOnWeb.ID && o.Activity == true).ToSingle();
    var hs = ModHSThanhVienUCSCService.Instance.CreateQuery().Where(o => o.UserID == CPLogin.CurrentUserOnWeb.ID && o.Activity == true).ToSingle();

    bool isUCSC = (dk != null || hs != null);
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

    table.thanh-vien th {
        text-align: center;
    }

    table.thanh-vien th,
    table.thanh-vien td {
        border: 1px solid #000;
        border-collapse: collapse;
        text-align: center;
    }

        table.thanh-vien td input,
        table.thanh-vien td select {
            width: 90% !important;
        }
</style>

<div class="row-fluid titleContainer">
    <span>{RS:Web_BCSuCoHeader}</span>
</div>
<div class="contentNews">
    <div class="main_right">
        <%--        <div class="box-category mb10">
            <div class="vanban-new">
                <h3 class="title-list-news">
                    <span class="title-t1">BÁO CÁO SỰ CỐ MẠNG</span>
                </h3>
            </div>
        </div>--%>
        <!--//#box-news-x-->
        <div class="vanban_right">
            <div class="contents">
                <div class="top">

                    <form method="post" enctype="multipart/form-data">
                        <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; {RS:Form_TenSuCo}</span>
                            <input name="Title" maxlength="250" id="Title" class="textstyle1" type="text" value="<%=item.Title %>" autocomplete="off" />
                        </p>

                        <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; {RS:Form_TenToChuc}</span>
                            <input name="Name" maxlength="250" id="Name" class="textstyle1" type="text" value="<%= isUCSC ? (dk == null ? hs.ToChuc_Ten : dk.ToChuc_Ten) : item.Name %>" autocomplete="off" />
                        </p>

                        <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'> {RS:Form_DiaChi}</span>
                            <input name="Address" maxlength="500" id="Address" class="textstyle1" type="text" value="<%= isUCSC ? (dk == null ? hs.ToChuc_DiaChi : dk.ToChuc_DiaChi) : item.Address %>" autocomplete="off" />
                        </p>

                        <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'> {RS:Form_DienThoai}</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                <input name="Phone" maxlength="15" id="Phone" class="textstyle1" type="text" value="<%= isUCSC ? (dk == null ? hs.ToChuc_DienThoai : dk.ToChuc_DienThoai) : item.Phone %>" autocomplete="off" />
                                Email (*) 
                                   
                                <input name="Email" maxlength="250" id="Email" class="textstyle1" type="text" value="<%= isUCSC ? (dk == null ? hs.ToChuc_Email : dk.ToChuc_Email) : item.Email %>" autocomplete="off" />
                            </span>
                        </p>

                        <div class="col-xs-20">&nbsp;</div>

                        <input type="hidden" name="endCode" value="<%=endCode %>" />

                        <input class="btn btn-danger" style="margin-left: 10px;" onclick="location.href = '<%=bcscUrl%>';" type="button" name="" value="<< {RS:Form_DSBaoCao}" />
                        <%if (menu != null & menu.Code != "KetThuc")
                            {%>
                        <%if (!string.IsNullOrEmpty(endCode))
                            {%>
                        <input class="btn btn-success" name="_hl_action[Update]" value="{RS:Form_CapNhatBtn}" type="submit" />
                        <%}
                            else
                            {%>
                        <input class="btn btn-success" name="_hl_action[Add]" value="{RS:Form_LuuBtn}" type="submit" />
                        <%}%>
                        <%} %>

                        <div class="clear-10">&nbsp;</div>
                        <%if (!string.IsNullOrEmpty(prefix))
                            {%>
                        <input type="button" class="btn btn-warning" value="{RS:Form_BCBanDauBtn}" onclick="location.href = '<%=bcBanDauUrl%>';" />
                        <input type="button" class="btn btn-warning" value="{RS:Form_DienBienSuCoBtn}" onclick="location.href = '<%=bcDienBienUrl%>';" />
                        <input type="button" class="btn btn-warning" value="{RS:Form_PhuongAnUngCuuBtn}" onclick="location.href = '<%=bcPhuongAnUrl%>';" />
                        <input type="button" class="btn btn-warning" value="{RS:Form_DeNghiHoTroBtn}" onclick="location.href = '<%=bcHoTroPhoiHopUrl%>';" />
                        <%--<input type="button" class="btn btn-warning" value="Báo cáo tổng hợp" onclick="location.href = '<%=bcTongHopUrl%>';" />--%>
                        <input type="button" class="btn btn-warning" value="{RS:Form_BCKetThucBtn}" onclick="location.href = '<%=bcKetThucUrl%>';" />
                        <%} %>
                    </form>

                </div>
                <!--.Main_container-->

            </div>
        </div>
    </div>
</div>

<%--<div class="main_right">
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
                </form>
            </div>
            <!--.Main_container-->

        </div>
    </div>
</div>--%>
