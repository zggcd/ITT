<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%var model = ViewBag.ChangePass as PasswordModel ?? new PasswordModel(); %>

<div class="row dk-banner">
    <a href="/" title="">
        <img src="/Content/image/dk-logo.png" alt=""></a>
</div>
<div class="row qmk-title">
</div>
<form method="post">
    <div class="row dn-main">
        <div class="col-xs-12" style="text-align: center !important">
            <p>
                Mật khẩu hiện tại:
            </p>
            <input id="PassCur" name="PassCur" value="<%=model.PassCur %>" type="password" />
        </div>
        <div class="col-xs-12" style="text-align: center !important">
            <p>
                Mật khẩu mới:
            </p>
            <input id="PassNew" name="PassNew" value="<%=model.PassNew %>" type="password" />
        </div>
        <div class="col-xs-12" style="text-align: center !important">
            <p>
                Nhập lại mật khẩu mới:
            </p>
            <input id="RePass" name="RePass" value="<%=model.RePass %>" type="password" />
        </div>
    </div>
    <div class="row dn-main">
        <div class="col-xs-12" style="padding-top: 20px; line-height: 35px;">
            <input class="dn-btn" name="_hl_action[ChangePassPOST]" value="Đổi mật khẩu" type="submit" /><br />
        </div>
    </div>
</form>
<div class="clear25">
</div>
