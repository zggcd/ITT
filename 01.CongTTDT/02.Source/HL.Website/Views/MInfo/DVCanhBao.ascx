<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HL.Lib.Global.CPLogin.IsLoginOnWeb())
        {
            int langId = ViewPage.CurrentPage.LangID;
            string loginUrl = "/vn/Thanh-vien/Dang-nhap.aspx"
                , dvUrl = "/vn/Thanh-vien/Dich-vu-canh-bao-su-co.aspx";
            if (langId == 2)
            {
                loginUrl = "/en/Member/Login.aspx";
                dvUrl = "/en/Member/Dich-vu-canh-bao-su-co.aspx";
            }

            Response.Redirect(loginUrl + "?ReturnPath=" + HttpUtility.ParseQueryString(dvUrl));
            return;
        }
    }
</script>

<%
    ModDichVuCanhBaoEntity entityDv = ViewBag.DichVu as ModDichVuCanhBaoEntity ?? new ModDichVuCanhBaoEntity();
    HL.Lib.Controllers.MAppend append = ViewBag.Append as HL.Lib.Controllers.MAppend ?? new HL.Lib.Controllers.MAppend();

    List<ModDichVuCanhBaoIPEntity> IPs = ViewBag.IPs as List<ModDichVuCanhBaoIPEntity> ?? new List<ModDichVuCanhBaoIPEntity>();
    int c = IPs != null ? IPs.Count : 0;

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
        width: 90% !important;
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
                <span class="title-t1">{RS:Form_DKNhanMailHeader} </span>
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
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>1. Đăng ký các dải IP nhận cảnh báo</span>
                                    </b>
                                </p>
                                <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" style='border-collapse: collapse; mso-padding-alt: 0in 0in 0in 0in' id="MM">
                                    <%int lvl = c > 0 ? c : 2;
                                        for (int i = 0; i < lvl; i++)
                                        {
                                            var val = "";
                                            if (IPs != null && c > 0) val = IPs[i].Name;
                                    %>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                        <td width="363" valign="top" style='padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal Del<%=i+1 %>" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                    <input name="" maxlength="255" id="" class="textstyle1 input" type="text" value="<%=val %>" /></span>
                                            </p>
                                        </td>

                                        <td width="121" valign="top" style='padding: 0in 0in 0in 0in'>
                                            <p class="MsoNormal Del<%=i+1 %>" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                    <a href="javascript:fnDel(<%=i+1 %>)" data-idx="<%=i+1 %>">Xóa</a>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <%} %>
                                    <tr class="Out"></tr>
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

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>2. Thời gian nhận cảnh báo </span>
                                        <input name="ThoiGian" maxlength="255" id="ThoiGian" class="textstyle1" type="text" value="<%=append.ThoiGian %>" />
                                    </b>
                                </p>

                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>3. Nhận báo cáo theo:
                                            <select name="MenuID" id="MenuID" class="text_input">
                                                <%= Utils.ShowDDLMenuByType2("DichVuCanhBao", 1, entityDv.MenuID)%>
                                            </select>
                                        </span>
                                    </b>
                                </p>

                                <p class="MsoNormal">
                                    <span lang="VI"></span>
                                </p>

                            </div>

                            <div class="button">
                                <input type="hidden" name="endCode" value="<%=endCode %>" />
                                <%--<%if (!string.IsNullOrEmpty(endCode))
                                    {%>
                                <input class="btn_action search icon QAcustom" name="_hl_action[UpdateDVCanhBao]" value="Cập nhật" type="submit" onclick="fnSubmit()" />
                                <%}
                                    else
                                    {%>--%>
                                <input class="btn_action search icon QAcustom" name="_hl_action[AddDVCanhBao]" value="{RS:Form_LuuBtn}" type="submit" onclick="fnSubmit()" />
                                <%--<%}%>--%>
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

<script>
    $('#btnThem').click(function () {
        var ranNum = Math.floor(Math.random() * 999999).toString();
        var html = '<tr style="mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes"><td width="363" valign="top" style="padding: 0in 0in 0in 0in" data-m="" id="">';
        html += '<p class="MsoNormal Del' + ranNum + '" style="margin-top: 6.0pt; tab-stops: dotted 420.0pt"><span><input name="" maxlength="255" id="" class="textstyle1 input" type="text" value="" /></span></p>';
        html += '</td><td width="121" valign="top" style="padding: 0in 0in 0in 0in">';
        html += '<p class="MsoNormal Del' + ranNum + '" style="margin-top: 6.0pt; tab-stops: dotted 420.0pt"><span><a href="javascript:fnDel(' + ranNum + ')">Xóa</a></span></p>';
        html += '</td></tr>';
        $('.Out').before(html);
    });

    function fnDel(r) {
        $('.Del' + r).remove();
    }

    function fnSubmit() {
        var s = '';
        var n = $('#MM').find('input[type=text]');
        var ln1 = n.length;
        for (var j = 0; j < ln1; j++) {
            s += $(n[j]).val() + ';';
        }
        $('#M').val(s);
    }
</script>
