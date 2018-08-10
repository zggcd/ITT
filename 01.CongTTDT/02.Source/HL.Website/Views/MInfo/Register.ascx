<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%CPUserEntity entity = ViewBag.DataRes as CPUserEntity ?? new CPUserEntity(); %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HL.Lib.Global.CPLogin.IsLoginOnWeb())
        {
            Response.Redirect("/vn/Thanh-vien/Thong-tin-ca-nhan.aspx");
            return;
        }
    }
</script>

<div class="row-fluid titleContainer">
    <span>Đăng ký tài khoản</span>
</div>
<div class="contentNews">
    <div class="row">
        <div class="col-md-3">&nbsp;</div>
        <div class="col-md-6">
            <form method="post" action="{ActionForm}" name="">
                <div class="form-group">
                    <label for="LoginName">Tên truy cập: <span style="color: red">*</span></label>
                    <input type="text" class="form-control" id="LoginName1" name="LoginName" placeholder="Tên truy cập" value="<%=entity.LoginName %>">
                </div>
                <div class="form-group">
                    <label for="Password">Mật khẩu: <span style="color: red">*</span></label>
                    <input type="password" class="form-control" id="Password" name="Password" placeholder="Mật khẩu" value="<%=entity.Password %>">
                </div>
                <div class="form-group">
                    <label for="RePassword">Xác nhận mật khẩu: <span style="color: red">*</span></label>
                    <input type="password" class="form-control" id="RePassword" name="RePassword" placeholder="Xác nhận mật khẩu">
                </div>
                <div class="form-group">
                    <label for="">Captcha: <span style="color: red">*</span></label>
                    <div class="input" style="width: 70%">
                        <input type="text" id="ValidCode" name="ValidCode" value="" style="width: 20%;" />
                        <label name="safeCode " id="safeCode" style="float: left; font-size: 18px; font-style: italic; letter-spacing: 3px; line-height: 30px; margin-left: 10px;">
                            <%=Utils.GetRandString()%>
                        </label>
                        <a id="changeimg" href="javascript:;" onclick="refreshSafeCode();">
                            <img src="/Content/imgs/dk-refresh.png" /></a>
                    </div>
                </div>

                <input name="_hl_action[RegisterPOST]" value="Đăng ký tài khoản" id="dk" class="btn_action search icon QAcustom" type="submit" style="display: none;">
                <input class="btn btn-success" onclick="check();" value="Đăng ký tài khoản" type="button" />

                <input type="hidden" name="sVY" id="sVY" value="" />
            </form>
        </div>
        <div class="col-md-3">&nbsp;</div>

        <div class="col-md-12">
            <div class="hidediv"></div>
            <div class="wait" style="display: none;" id="Waiting">
                <img src="/Content/imgs/loading.gif" style="height: 20px;" />
                <p style="color: red; font-style: italic; font-weight: normal; font-size: 11px;">Đang kiểm tra thông tin, vui lòng chờ giây lát...</p>
            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function () {
        refreshSafeCode();
    });

    function checkPassword(idtb) {
        var patt = new RegExp("^([A-Z]|[a-z]|[0-9]|_|@|-|[\.])*$");
        // this allows to use i18 for the error msgs
        if (!patt.test($("#" + idtb).val())) {
            return false;
        }
        return true;
    }

    function check() {
        var tentl = $('#LoginName1').val();
        var hoten = $('#Name').val();
        //var tinhthanh = $('#CityID').val();
        var email = $('#Email').val();
        //var namsinh = $('#Year option:checked').val();
        //var gioitinh = $('#Sex1:checked').val() == 1 ? 1 : 0;
        var dienthoai = $('#Phone').val();
        //var lydo = $('#Note').val();
        var mk = $('#Password').val();
        var golaimk = $('#RePassword').val();
        //var chapnhannoiquy = $('#Agree:checked').val() == 1 ? 1 : 0;
        var mabaove = document.getElementById("safeCode").innerHTML;
        var sVY = document.getElementById("ValidCode").value;
        checkdk(tentl, hoten, email, dienthoai, mk, golaimk, mabaove, sVY);
    }
</script>

<script src="/Content/js/AjaxRequest.js"></script>
<script src="/Content/js/Function.js"></script>
