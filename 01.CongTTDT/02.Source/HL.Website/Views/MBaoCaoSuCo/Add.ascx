<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HL.Lib.Global.CPLogin.IsLogin())
        {
            Response.Redirect("/vn/Thanh-vien/Dang-nhap.aspx?ReturnPath=" + HttpUtility.ParseQueryString("/vn/Bao-cao-su-co/Them-bao-cao.aspx"));
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
        if (!string.IsNullOrEmpty(endCode)) prefix = endCode + "-";
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
    <span>BÁO CÁO SỰ CỐ MẠNG</span>
</div>
<div class="contentNews">
    <div class="main_right">
        <div class="box-category mb10">
            <div class="vanban-new">
                <h3 class="title-list-news">
                    <span class="title-t1">BÁO CÁO SỰ CỐ MẠNG</span>
                </h3>
            </div>
        </div>
        <!--//#box-news-x-->
        <div class="vanban_right">
            <div class="contents">
                <div class="top">

                    <form method="post" enctype="multipart/form-data">

                        <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642; Tên tổ chức/cá nhân báo cáo sự cố (*)</span>
                            <input name="Name" maxlength="255" id="Name" class="textstyle1" type="text" value="<%=item.Name %>" />
                        </p>

                        <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'> Địa chỉ: (*)</span>
                            <input name="Address" maxlength="255" id="Address" class="textstyle1" type="text" value="<%=item.Address %>" />
                        </p>

                        <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'> Điện thoại (*)</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                <input name="Phone" maxlength="255" id="Phone" class="textstyle1" type="text" value="<%=item.Phone %>" />
                                Email (*) 
                                    <input name="Email" maxlength="255" id="Email" class="textstyle1" type="text" value="<%=item.Email %>" />
                            </span>
                        </p>

                        <div class="col-xs-20">&nbsp;</div>

                        <input type="hidden" name="endCode" value="<%=endCode %>" />

                        <input class="btn btn-danger" style="margin-left: 10px;" onclick="location.href = '/vn/Bao-cao-su-co.aspx';" type="button" name="" value="<< Danh sách báo cáo" />
                        <%if (!string.IsNullOrEmpty(endCode))
                            {%>
                        <input class="btn btn-success" name="_hl_action[Update]" value="Cập nhật" type="submit" />
                        <%}
                            else
                            {%>
                        <input class="btn btn-success" name="_hl_action[Add]" value="Lưu" type="submit" />
                        <%}%>

                        <div class="clear-10">&nbsp;</div>
                        <input type="button" class="btn btn-warning" value="Báo cáo ban đầu" onclick="location.href = '/vn/Bao-cao-su-co/<%=prefix%>bc-ban-dau-su-co.aspx';" />
                        <input type="button" class="btn btn-warning" value="Báo cáo tổng hợp" onclick="location.href = '/vn/Bao-cao-su-co/<%=prefix%>bc-tong-hop-su-co.aspx';" />
                        <input type="button" class="btn btn-warning" value="Báo cáo kết thúc" onclick="location.href = '/vn/Bao-cao-su-co/<%=prefix%>bc-ket-thuc-su-co.aspx';" />
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
