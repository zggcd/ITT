<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%var item = ViewBag.Login as CPUserEntity ?? new CPUserEntity(); %>

<style type="text/css">
    a.dn-btn {
        background: url("/Content/image/dk-btn.png") no-repeat scroll 0 0 rgba(0, 0, 0, 0);
        color: #9e4300;
        font-size: 1.3em;
        font-weight: bold;
        padding: 10px 45px;
        text-decoration: none;
        text-transform: uppercase;
        border: none;
    }

        a.dn-btn:hover, a.dn-btn:active, a.dn-btn:visited, a.dn-btn:focus {
            text-decoration: none;
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

<div class="row dk-banner">
    <a href="/" title="">
        <img src="/Content/image/dk-logo.png" alt=""></a>
</div>
<div class="row dn-title">
</div>
<form method="post" id="fbpizarro" name="fbpizarro" action="{ActionForm}">
    <div class="row dn-main">
        <div class="col-xs-12" style="text-align: center !important">
            <p>
                Email liên lạc hiện tại:
            </p>
            <input id="Email" name="Email" value="<%=item.Email %>" type="text" />
        </div>
    </div>
    <div class="row dn-main">
        <div class="col-xs-12">
            <p>
                Mật khẩu:
            </p>
            <input value="<%=item.Password %>" id="Password" name="Password" type="password" />
        </div>
    </div>
    <div class="row dn-main">
        <div class="col-xs-12" style="padding-top: 20px; line-height: 35px;">
            <input value="1" name="save" type="checkbox" style="float: none; margin-right: 5px;"><span style="color: #005f87; font-style: italic; margin-top: 20px;">Duy trì trạng thái đăng nhập</span><br>
            <input id="dn" class="dn-btn" name="_hl_action[LoginPOST]" value="Đăng nhập" type="submit" style="display: none;">
            <a class="dn-btn" href="javascript:;" onclick="checkdn($('#Email').val(), $('#Password').val());">Đăng nhập</a><br>
            <a href="/Thanh-vien/Dang-ky.aspx" title="đăng kí"><span class="dn-note">Đăng ký thành
                viên</span></a> <a href="/Thanh-vien/Quen-mat-khau.aspx" title="Quên mật khẩu"><span
                    class="dn-note">Quên mật khẩu</span></a>

        </div>
    </div>
</form>
<div class="clear25">
</div>

<div class="hidediv"></div>
<div class="wait" style="display: none;" id="Waiting">
    <img src="/Content/image/loading.gif" style="height: 20px;" />
    <p style="color: red; font-style: italic; font-weight: normal; font-size: 11px;">Đang kiểm tra đăng nhập, vui lòng chờ giây lát...</p>
</div>
<script src="/Content/js/AjaxRequest.js"></script>
<script src="/Content/js/Function.js"></script>
