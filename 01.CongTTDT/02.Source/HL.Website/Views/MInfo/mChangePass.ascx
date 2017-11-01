<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%var model = ViewBag.ChangePass as PasswordModel ?? new PasswordModel(); %>

<p class="col-xs-12 name-title-nav">
    <a href="/" title="">
        <img style="display: inline;" class="img-responsive" src="/mContent/image/icon-home2.png" /></a>
    Thay đổi mật khẩu
                <a href="javascript:;" onclick="javascript:window.history.back(-1);" title="">
                    <img class="img-responsive" src="/mContent/image/icon-back.png" /></a>
</p>
<div style="clear: both;"></div>
<div class="clear20"></div>

<form method="post">
    <div class="col-xs-12 form-dk">
        <p><strong>Mật khẩu hiện tại</strong></p>
        <input id="PassCur" name="PassCur" value="<%=model.PassCur %>" type="password" />
    </div>

    <div class="clear20"></div>
    <div class="col-xs-12 form-dk">
        <p><strong>Mật khẩu mới</strong></p>
        <input id="PassNew" name="PassNew" value="<%=model.PassNew %>" type="password" />
    </div>

    <div class="clear20"></div>
    <div class="col-xs-12 form-dk">
        <p><strong>Nhập lại mật khẩu mới</strong></p>
        <input id="RePass" name="RePass" value="<%=model.RePass %>" type="password" />
    </div>
    <div class="clear20"></div>
    <div class="col-xs-12 form-dk link-dk" style="text-align: center;">
        <input class="dn-btn" name="_hl_action[ChangePassPOST]" value="Đổi mật khẩu" type="submit" /><br />
    </div>

    <div class="clear20"></div>

</form>

