<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%var item = ViewBag.Login as CPUserEntity ?? new CPUserEntity(); %>

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
            Đăng nhập
        </div>
        <div class="content" style="margin: 0px">
            <%if (!HL.Lib.Global.CPLogin.IsLogin())
                {%>
            <form method="post" id="" name="" action="{ActionForm}">
                <p class="text1">
                    Tên truy nhập 
                </p>
                <p>
                    <input id="LoginName" name="LoginName" value="<%=item.LoginName %>" class="com-input" type="text">
                </p>
                <p class="text1">Mật khẩu</p>
                <p>
                    <input value="<%=item.Password %>" id="Password" name="Password" class="com-input" type="password">
                </p>
                <span>
                    <a href="/vn/Thanh-vien/Quen-mat-khau.aspx" style="color: #444">Quên mật khẩu</a>
                </span>
                <span class="button">
                    <input id="dn" class="dn-btn" name="_hl_action[LoginPOST]" value="Đăng nhập" type="submit" style="display: none;">
                    <input name="" value="Đăng nhập" id="" class="btn_action search icon btnButtonLogin" type="button" onclick="checkdn($('#LoginName').val(), $('#Password').val());">
                </span>
            </form>
            <%}
            else
            {%>
            Đăng nhập thành công!
            <br />
            <a href="javascript: dx();" rel="nofollow">Đăng xuất</a>
            <br />
            <a href="/vn/Thanh-vien/Doi-mat-khau.aspx" title="Đổi mật khẩu">Đổi mật khẩu</a>
            <br />
            <a href="/vn/Thanh-vien/Thong-tin-ca-nhan.aspx" title="Thay đổi thông tin cá nhân">Thay đổi thông tin cá nhân</a>
            <br /><br />
            <u><b>Điều phối, ứng cứu sự cố ATTT mạng:</b></u>
            <ul>
                <li><a href="/vn/Thanh-vien/Ho-so-ung-cuu-su-co.aspx">1. DS Hồ sơ UCSC</a></li>
                <li><a href="/vn/Thanh-vien/DS-dang-ky-ung-cuu-su-co.aspx">2. DS Đăng ký tham gia mạng lưới UCSC</a></li>
                <li><a href="/vn/Thanh-vien/DS-bc-ban-dau-su-co.aspx">3. DS Báo cáo ban đầu sự cố mạng</a></li>
                <li><a href="/vn/Thanh-vien/DS-bc-ket-thuc-su-co.aspx">4. DS Báo cáo kết thúc ứng phó sự cố</a></li>
                <li><a href="/vn/Thanh-vien/DS-bc-tong-hop-su-co.aspx">5. DS Báo cáo tổng hợp</a></li>
            </ul>
            <%}%>
        </div>
    </div>
</div>

<div class="hidediv"></div>
<div class="wait" style="display: none;" id="Waiting">
    <img src="/Content/imgs/loading.gif" style="height: 20px;" />
    <p style="color: red; font-style: italic; font-weight: normal; font-size: 11px;">Đang kiểm tra đăng nhập, vui lòng chờ giây lát...</p>
</div>
<script src="/Content/js/AjaxRequest.js"></script>
<script src="/Content/js/Function.js"></script>
