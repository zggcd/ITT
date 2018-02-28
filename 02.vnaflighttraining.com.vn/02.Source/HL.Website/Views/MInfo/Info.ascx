<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%CPUserEntity entity = ViewBag.Data as CPUserEntity ?? CPLogin.CurrentUser; %>

<style>
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
</style>

<div class="main_right">
    <div class="box-category mb10">
        <div class="vanban-new">
            <h3 class="title-list-news">
                <span class="title-t1">Thông tin cá nhân</span>
            </h3>
        </div>
    </div>
    <!--//#box-news-x-->
    <div class="vanban_right">
        <div class="contents">
            <div class="top">
                <!--tim kiem form-->
                <form method="post" enctype="multipart/form-data">
                    <div class="g-search">
                        <div class="box_content_input">
                            <div class="frm_input no1">
                                <span class="name">Tên truy cập:</span>
                                <div class="input">
                                    <input name="LoginName" maxlength="255" id="LoginName" class="" type="text" value="<%=entity.LoginName %>">
                                </div>
                            </div>
                            <div class="frm_input no1">
                                <span class="name">Họ tên:</span>
                                <div class="input">
                                    <input name="Name" maxlength="255" id="Name" class="" type="text" value="<%=entity.Name %>">
                                </div>
                            </div>
                            <div class="frm_input no1">
                                <span class="name">Email:</span>
                                <div class="input">
                                    <input name="Email" maxlength="255" id="Email" class="" type="text" value="<%=entity.Email %>">
                                </div>
                            </div>
                            <div class="frm_input no1">
                                <span class="name">Điện thoại:</span>
                                <div class="input">
                                    <input onkeypress="return pkeypress(event);" type="text" id="" name="Phone" value="<%=entity.Phone %>" />
                                </div>
                            </div>
                            <div class="frm_input no1">
                                <span class="name">Cập nhật avatar:</span>
                                <div class="input">
                                    <%if (!string.IsNullOrEmpty(entity.File))
                                        { %>
                                    <img src="<%=entity.File.Replace("~/","/") %>" width="60" />
                                    <br />
                                    <%} %>
                                    <input type="file" id="Avatar" name="Avatar" />
                                </div>
                            </div>

                            <div class="button">
                                <input class="btn_action search icon QAcustom" name="_hl_action[ChangeInfoPOST]" value="Cập nhật thông tin" type="submit" />

                                <input style="margin-left: 10px;" onclick="location.href = '/vn/Thanh-vien/Doi-mat-khau.aspx';" type="button" name="" value="Đổi mật khẩu" />
                                <input type="hidden" name="File" value="<%=entity.File %>" />
                            </div>

                        </div>
                    </div>
                </form>
            </div>
            <!--.Main_container-->

        </div>
    </div>
</div>
