<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%CPUserEntity entity = ViewBag.Data as CPUserEntity ?? CPLogin.CurrentUser; %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HL.Lib.Global.CPLogin.IsLoginOnWeb())
        {
            Response.Redirect("/vn/Thanh-vien/Dang-nhap.aspx?ReturnPath=" + HttpUtility.ParseQueryString("/vn/Thanh-vien/Thong-tin-ca-nhan.aspx"));
            return;
        }
    }
</script>

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
    <span>Thông tin cá nhân</span>
</div>
<div class="contentNews">
    <div class="row">
        <div class="col-md-3">&nbsp;</div>
        <div class="col-md-6">
            <form method="post" action="{ActionForm}" name="" enctype="multipart/form-data">
                <div class="form-group">
                    <label for="LoginName">Tên truy cập: <span style="color: red">*</span></label>
                    <input type="text" class="form-control" id="LoginName" name="LoginName" placeholder="Tên truy cập" value="<%=entity.LoginName %>" readonly>
                </div>
                <div class="form-group">
                    <label for="Password">Họ tên: <span style="color: red">*</span></label>
                    <input type="text" class="form-control" id="Name" name="Name" placeholder="Họ tên" value="<%=entity.Name %>">
                </div>
                <div class="form-group">
                    <label for="Password">Email: <span style="color: red">*</span></label>
                    <input type="text" class="form-control" id="Email" name="Email" placeholder="Email" value="<%=entity.Email %>">
                </div>
                <div class="form-group">
                    <label for="Password">Họ tên: <span style="color: red">*</span></label>
                    <input type="text" class="form-control" id="Phone" name="Phone" placeholder="Số điện thoại" onkeypress="return pkeypress(event);" value="<%=entity.Phone %>">
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

                <div class="clear-25">&nbsp;</div>

                <input class="btn btn-success" name="_hl_action[ChangeInfoPOST]" value="Cập nhật thông tin" type="submit" />
                <input class="btn btn-danger" style="margin-left: 10px;" onclick="location.href = '/vn/Thanh-vien/Doi-mat-khau.aspx';" type="button" name="" value="Đổi mật khẩu" />
                <input type="hidden" name="File" value="<%=entity.File %>" />
            </form>
        </div>
        <div class="col-md-3">&nbsp;</div>
    </div>
</div>

<div class="clear-20">&nbsp;</div>
<div class="row-fluid titleContainer">
    <span>Thông tin thành viên con</span>
</div>
<div class="contentNews">
    <a href="" class="btn-addMem">Thêm mới thành viên</a>
    <table class="table table-bordered mt-15">
        <thead>
            <tr>
                <th class="text-center">Tên thành viên</th>
                <th width="15%">Website</th>
                <th width="15%">Email</th>
                <th width="15%">Số điện thoại</th>
                <th></th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td>Tổng công ty Dầu Việt Nam. Cơ quan chủ quản tập đoàn Dầu khí Việt Nam</td>
                <td>pvoil.com.vn</td>
                <td>contact@pvoil.com.vn</td>
                <td>(84 - 28) 39106990</td>
                <td><a href="#" data-toggle="toggle" data-placement="top" title="Chi tiết"><i class="fa fa-file-text-o"></i></a></td>
            </tr>
            <tr>
                <td>Tổng công ty Dầu Việt Nam. Cơ quan chủ quản tập đoàn Dầu khí Việt Nam</td>
                <td>pvoil.com.vn</td>
                <td>contact@pvoil.com.vn</td>
                <td>(84 - 28) 39106990</td>
                <td><a href="#" data-toggle="tooltip" data-placement="top" title="Chi tiết"><i class="fa fa-file-text-o"></i></a></td>
            </tr>
            <tr>
                <td>Tổng công ty Dầu Việt Nam. Cơ quan chủ quản tập đoàn Dầu khí Việt Nam</td>
                <td>pvoil.com.vn</td>
                <td>contact@pvoil.com.vn</td>
                <td>(84 - 28) 39106990</td>
                <td><a href="#" data-toggle="tooltip" data-placement="top" title="Chi tiết"><i class="fa fa-file-text-o"></i></a></td>
            </tr>
            <tr>
                <td>Tổng công ty Dầu Việt Nam. Cơ quan chủ quản tập đoàn Dầu khí Việt Nam</td>
                <td>pvoil.com.vn</td>
                <td>contact@pvoil.com.vn</td>
                <td>(84 - 28) 39106990</td>
                <td><a href="#" data-toggle="tooltip" data-placement="top" title="Chi tiết"><i class="fa fa-file-text-o"></i></a></td>
            </tr>
        </tbody>
    </table>
</div>
