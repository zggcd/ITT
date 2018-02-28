<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%var item = ViewBag.Login as CPUserEntity ?? new CPUserEntity(); %>

<style type="text/css">
    .hidediv {
        position: fixed;
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

<section class="portlet" id="portlet_58">
    <header class="portlet-topper">
        <h1 class="portlet-title"><span>
            <img class="icon" id="tbsm" src="/Content/skins/theme/images/spacer.png" alt="Đăng nhập" title="Đăng nhập" style="background-image: url('/Content/skins/html/icons/_sprite.png'); background-position: 50% -592px; background-repeat: no-repeat; height: 16px; width: 16px;" />
        </span><span class="portlet-title-text">Đăng nhập</span> </h1>
        <menu class="portlet-topper-toolbar" id="portlet-topper-toolbar_58" type="toolbar"></menu>
    </header>
    <div class="portlet-content">
        <div class=" portlet-content-container" style="">
            <div class="portlet-body">
                <%if (!HL.Lib.Global.CPLogin.IsLogin())
                    {%>
                <form action="{ActionForm}" class="aui-form " method="post">
                    <div class="BoxLogin">
                        <span class="aui-field aui-field-text">
                            <span class="aui-field-content">
                                <label class="aui-field-label" for="LoginName">Người dùng </label>
                                <span class='aui-field-element '>
                                    <input class="aui-field-input aui-field-input-text" id="LoginName" name="LoginName" placeholder="Đăng nhập" type="text" value="<%=item.LoginName %>" />
                                </span>
                            </span>
                        </span>
                        <span class="aui-field aui-field-text">
                            <span class="aui-field-content">
                                <label class="aui-field-label" for="Password">Mật khẩu </label>
                                <span class='aui-field-element '>
                                    <input class="aui-field-input aui-field-input-text" id="Password" name="Password" placeholder="Mật khẩu" type="password" value="<%=item.Password %>" />
                                </span>
                            </span>
                        </span>
                        <span class="aui-field aui-field-choice">
                            <span class="aui-field-content">
                                <span class='aui-field-element aui-field-label-right'>
                                    <input class="aui-field-input aui-field-input-choice" id="_58_rememberMeCheckbox" name="_58_rememberMeCheckbox" onclick="" type="checkbox" value="true" />
                                </span>
                                <label class="aui-field-label" for="_58_rememberMeCheckbox">Duy trì đăng nhập </label>
                            </span>
                        </span>
                        <div class="aui-button-holder ">
                            <span class="aui-button aui-button-submit">
                                <span class="aui-button-content">
                                    <input id="dn" class="dn-btn" name="_hl_action[LoginPOST]" value="Đăng nhập" type="submit" style="display: none;">
                                    <input class="aui-button-input aui-button-input-submit" type='button' value="Đăng nhập" onclick="checkdn($('#LoginName').val(), $('#Password').val());" />
                                </span>
                            </span>
                        </div>
                    </div>
                </form>
                <%}
                    else
                    {%>
                <p>
                    Đăng nhập thành công!
            <br />
                    <a href="javascript: dx();" rel="nofollow">Đăng xuất</a>
                    <%--<br />
                    <a href="/vn/Thanh-vien/Doi-mat-khau.aspx" title="Đổi mật khẩu">Đổi mật khẩu</a>
                    <br />
                    <a href="/vn/Thanh-vien/Thong-tin-ca-nhan.aspx" title="Thay đổi thông tin cá nhân">Thay đổi thông tin cá nhân</a>--%>
                </p>
                <%}%>
            </div>
        </div>
    </div>
</section>

<div class="hidediv"></div>
<div class="wait" style="display: none;" id="Waiting">
    <img src="/Content/imgs/loading.gif" style="height: 20px;" />
    <p style="color: red; font-style: italic; font-weight: normal; font-size: 11px;">Đang kiểm tra đăng nhập, vui lòng chờ giây lát...</p>
</div>

<script src="/Content/js/jquery.min-1.12.4.js"></script>
<script src="/Content/js/AjaxRequest.js"></script>
<script src="/Content/js/Function.js"></script>
