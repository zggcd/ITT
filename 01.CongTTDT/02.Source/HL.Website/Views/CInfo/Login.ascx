<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%var item = ViewBag.Login as CPUserEntity ?? new CPUserEntity();

    int langId = ViewPage.CurrentPage.LangID;
    string quenmkUrl = "/vn/Thanh-vien/Quen-mat-khau.aspx"
        , doimkUrl = "/vn/Thanh-vien/Doi-mat-khau.aspx"
        , thongtinUrl = "/vn/Thanh-vien/Thong-tin-ca-nhan.aspx"
        , hsucscUrl = "/vn/Thanh-vien/Ho-so-ung-cuu-su-co.aspx"
        , dsucscUrl = "/vn/Thanh-vien/DS-dang-ky-ung-cuu-su-co.aspx"
        , dsbcbdUrl = "/vn/Thanh-vien/DS-bc-ban-dau-su-co.aspx"
        , dsbcktUrl = "/vn/Thanh-vien/DS-bc-ket-thuc-su-co.aspx"
        , dsbcthUrl = "/vn/Thanh-vien/DS-bc-tong-hop-su-co.aspx"
        , dvUrl = "/vn/Thanh-vien/Dich-vu-canh-bao-su-co.aspx";
    if (langId == 2)
    {
        quenmkUrl = "/en/Member/Forget-password.aspx";
        doimkUrl = "/en/Member/Change-password.aspx";
        thongtinUrl = "/en/Member/Info.aspx";
        hsucscUrl = "/en/Member/Ho-so-ung-cuu-su-co.aspx";
        dsucscUrl = "/en/Member/DS-dang-ky-ung-cuu-su-co.aspx";
        dsbcbdUrl = "/en/Member/DS-bc-ban-dau-su-co.aspx";
        dsbcktUrl = "/en/Member/DS-bc-ket-thuc-su-co.aspx";
        dsbcthUrl = "/en/Member/DS-bc-tong-hop-su-co.aspx";
        dvUrl = "/en/Member/Dich-vu-canh-bao-su-co.aspx";
    }
%>

<style type="text/css">
    .btnButtonLogin {
        float: right;
        padding: 5px 10px 5px;
        background-color: #248aef !important;
        font-size: 12px;
        font-weight: bold;
        color: #FFF !important;
        margin-bottom: 0px;
        margin-right: 5px;
    }


    .hidediv {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
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
        /*height: 150px;*/
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

<div class="thong_ke">
    <div class="main">
        <div class="title">
            {RS:Web_Login}
        </div>
        <div class="content" style="margin: 0px">
            <%if (!HL.Lib.Global.CPLogin.IsLoginOnWeb())
                {%>
            <%--<form method="post" id="" name="" action="{ActionForm}">--%>
            <p class="text1">
                {RS:Web_LoginName} 
            </p>
            <p>
                <input id="LoginName" name="LoginName" value="<%=item.LoginName %>" class="com-input" type="text">
            </p>
            <p class="text1">{RS:Web_Password}</p>
            <p>
                <input value="<%=item.Password %>" id="Password" name="Password" class="com-input" type="password">
            </p>
            <span>
                <a href="<%=quenmkUrl %>" style="color: #444">{RS:Web_QuenMatKhau}</a>
            </span>
            <span class="button">
                <input id="dn" class="dn-btn" name="_hl_action[LoginPOST]" value="{RS:Web_Login}" type="submit" style="display: none;">
                <input name="" value="{RS:Web_Login}" id="" class="btn_action search icon btnButtonLogin" type="button" onclick="checkdn($('#LoginName').val(), $('#Password').val());">
            </span>
            <%--</form>--%>
            <%}
                else
                {%>
            {RS:Web_DangNhapThanhCong}
            <br />
            <a href="javascript: dx();" rel="nofollow">{RS:Web_DangXuat}</a>
            <br />
            <a href="<%=doimkUrl %>" title="{RS:Web_DoiMatKhau}">{RS:Web_DoiMatKhau}</a>
            <br />
            <a href="<%=thongtinUrl %>" title="{RS:Web_DoiThongTinCaNhan}">{RS:Web_DoiThongTinCaNhan}</a>
            <br />
            <br />
            <u><b>{RS:Web_DieuPhoiUCSC}</b></u>
            <ul>
                <li><a href="<%=hsucscUrl %>">{RS:Web_HSUCSC}</a></li>
                <li><a href="<%=dsucscUrl %>">{RS:Web_DangKyMangLuoi}</a></li>
                <li><a href="<%=dsbcbdUrl %>">{RS:Web_BCBanDau}</a></li>
                <li><a href="<%=dsbcktUrl %>">{RS:Web_BCKetThuc}</a></li>
                <li><a href="<%=dsbcthUrl %>">{RS:Web_BCTongHop}</a></li>
                <li><a href="<%=dvUrl %>">{RS:Web_DVCanhBao}</a></li>
            </ul>
            <%}%>
        </div>
    </div>
</div>

<div class="hidediv"></div>
<div class="wait" style="display: none;" id="Waiting">
    <img src="/Content/imgs/loading.gif" style="height: 20px;" />
    <p style="color: red; font-style: italic; font-weight: normal; font-size: 11px;">{RS:Web_DangKiemTraDN}</p>
</div>
<script src="/Content/js/AjaxRequest.js"></script>
<script src="/Content/js/Function.js"></script>
