﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%var model = ViewBag.ChangePass as PasswordModel ?? new PasswordModel(); %>

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
                <span class="title-t1">Đổi mật khẩu</span>
            </h3>
        </div>
    </div>
    <!--//#box-news-x-->
    <div class="vanban_right">
        <div class="contents">
            <div class="top">
                <!--tim kiem form-->
                <form method="post" action="{ActionForm}" name="">
                    <div class="g-search">
                        <div class="box_content_input">
                            <div class="frm_input no1">
                                <span class="name">Mật khẩu hiện tại:</span>
                                <div class="input">
                                    <input name="PassCur" maxlength="255" id="PassCur" class="" type="password" value="<%=model.PassCur %>">
                                </div>
                            </div>
                            <div class="frm_input no1">
                                <span class="name">Mật khẩu mới:<span style="color: red">*</span></span>
                                <div class="input">
                                    <input name="PassNew" maxlength="255" id="PassNew" class="" type="password" value="<%=model.PassNew %>">
                                </div>
                            </div>
                            <div class="frm_input no1">
                                <span class="name">Nhập lại khẩu mới:<span style="color: red">*</span></span>
                                <div class="input">
                                    <input name="RePass" maxlength="255" id="RePass" class="" type="password" value="<%=model.RePass %>">
                                </div>
                            </div>

                            <div class="button">
                                <input class="btn_action search icon QAcustom" name="_hl_action[ChangePassPOST]" value="Đổi mật khẩu" type="submit" /><br />
                            </div>

                        </div>
                    </div>
                </form>
            </div>
            <!--.Main_container-->

        </div>
    </div>
</div>
