<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%CPUserEntity entity = ViewBag.Data as CPUserEntity ?? new CPUserEntity(); %>

<p class="col-xs-12 name-title-nav">
    <a href="/" title="">
        <img style="display:inline;" class="img-responsive" src="/mContent/image/icon-home2.png" /></a>
    Yêu cầu nhắc lại mật khẩu
                <a href="javascript:;" onclick="javascript:window.history.back(-1);" title="">
                    <img class="img-responsive" src="/mContent/image/icon-back.png" /></a>
</p>
<div style="clear: both;"></div>
<div class="clear20"></div>

<form method="post">
    <div class="col-xs-12 form-dk">
        <p><strong>Email liên lạc</strong></p>
        <input type="text" name="Email" value="<%=entity.Email %>" />
    </div>
    <div class="clear20"></div>
    <div class="col-xs-12 form-dk link-dk" style="text-align: center;">
        <input type="submit" name="_hl_action[RePassPOST]" value="GỬI YÊU CẦU" />
    </div>
</form>
<div class="clear25">
</div>
