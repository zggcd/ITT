<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%var model = ViewBag.ResetPass as PasswordModel ?? new PasswordModel(); %>

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

<div class="row-fluid titleContainer">
    <span>Lấy lại mật khẩu</span>
</div>
<div class="contentNews">
    <div class="row">
        <div class="col-md-3">&nbsp;</div>
        <div class="col-md-6">
            <form method="post" action="{ActionForm}" name="">
                <div class="form-group">
                    <label for="Email">Email liên lạc hiện tại: <span style="color: red">*</span></label>
                    <input type="text" class="form-control" id="Email" name="Email" placeholder="Email hiện tại" value="<%=model.Email %>">
                </div>

                <input class="btn btn-success" name="_hl_action[RePassPOST]" value="Reset mật khẩu" type="submit" />

            </form>
        </div>
        <div class="col-md-3">&nbsp;</div>
    </div>
</div>
