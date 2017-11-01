<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%var model = ViewBag.ResetPass as PasswordModel ?? new PasswordModel(); %>
<div class="container dk-container">
    <div class="row dk-banner">
        <a href="" title="">
            <img src="/Content/image/dk-logo.png" alt=""></a>
    </div>
    <div class="row qmk-title">
    </div>
    <form method="post">
    <div class="row dn-main">
        <div class="col-xs-12" style="text-align: center !important">
            <p>
                Email liên lạc hiện tại:</p>
            <input id="" name="Email" value="<%=model.Email %>" type="text">
        </div>
    </div>
    <div class="row dn-main">
        <div class="col-xs-12" style="padding-top: 20px; line-height: 35px;">
            <input class="dn-btn" name="_hl_action[RePassPOST]" value="Reset mật khẩu" type="submit"><br>
        </div>
    </div>
    </form>
    <div class="clear25">
    </div>
</div>
