<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%CPUserEntity entity = ViewBag.DataRes as CPUserEntity ?? new CPUserEntity(); %>

<style type="text/css">
    a.dn-btn {
        /*background: url("/Content/image/dk-btn.png") no-repeat scroll 0 0 rgba(0, 0, 0, 0);*/
        color: #9e4300;
        font-size: 1.3em;
        font-weight: bold;
        padding: 7px 0px;
        float: left;
        text-decoration: none;
        text-transform: uppercase;
        border: none;
    }

        a.dn-btn:hover, a.dn-btn:active, a.dn-btn:visited, a.dn-btn:focus {
            text-decoration: none;
        }

    .hidediv {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        /*height: 100%;*/
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

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<div class="row dk-banner">
    <a href="/" title="">
        <img src="/Content/image/dk-logo.png" alt="" /></a>
</div>
<div class="row dk-title">
    <div class="col-xs-12">
    </div>
</div>
<form method="post" action="{ActionForm}" name="fbpizarro">
    <div class="row">
        <div class="col-xs-5 dk-left">
            <p>
                Tên để thảo luận:
            </p>
        </div>
        <div class="col-xs-7 dk-right">
            <input type="text" id="LoginName" name="LoginName" value="<%=entity.LoginName %>" />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 dk-left">
            <p>
                Họ tên:
            </p>
        </div>
        <div class="col-xs-7 dk-right">
            <input type="text" id="Name" name="Name" value="<%=entity.Name %>" />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 dk-left">
            <p>
                Tỉnh/Thành phố:
            </p>
        </div>
        <div class="col-xs-7 dk-right">
            <select id="CityID" name="CityID">
                <%=Utils.ShowDDLMenuByType3("City",1,entity.CityID) %>
            </select>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 dk-left">
            <p>
                Email liên lạc hiện tại:
            </p>
        </div>
        <div class="col-xs-7 dk-right">
            <input type="text" id="Email" name="Email" value="<%=entity.Email %>" />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 dk-left">
            <p>
                Năm sinh và giới tính:
            </p>
        </div>
        <div class="col-xs-7 dk-right">
            <select id="Year" name="Year" style="width: 30%;">
                <option value="0">--Chọn năm sinh--</option>
                <%for (int i = 1950; i < DateTime.Now.Year - 10; i++)
                  { %>
                <option value="<%=i %>" <%if (entity.Year == i)
                                          { %>
                    selected<%} %>><%=i %></option>
                <%} %>
            </select>
            <div class="dk-radio">
                <input type="radio" <%if (entity.Sex)
                                      { %>
                    checked<%} %> id="Sex1" name="Sex" value="1" /><span>Nam</span>
                <input type="radio" <%if (!entity.Sex)
                                      { %>
                    checked<%} %> id="Sex0" name="Sex" value="0" /><span>Nữ</span>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 dk-left">
            <p>
                Điện thoại:
            </p>
        </div>
        <div class="col-xs-7 dk-right">
            <input onkeypress="return pkeypress(event);" type="text" id="Phone" name="Phone" value="<%=entity.Phone %>" />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 dk-left">
            <p>
                Lý do tham gia diễn đàn:
            </p>
        </div>
        <div class="col-xs-7 dk-right">
            <textarea id="Note" name="Note" rows="3" style="height: auto;"><%=entity.Note %></textarea>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 dk-left">
            <p>
                Mật khẩu:
            </p>
        </div>
        <div class="col-xs-7 dk-right">
            <input type="password" id="Password" name="Password" value="<%=entity.Password %>" />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 dk-left">
            <p>
                Gõ lại mật khẩu:
            </p>
        </div>
        <div class="col-xs-7 dk-right">
            <input type="password" id="RePassword" name="RePassword" />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 dk-left">
            <p>
                Nhập mã bảo vệ:
            </p>
        </div>
        <div class="col-xs-7 dk-right">
            <input type="text" id="ValidCode" name="ValidCode" value="" style="width: 20%;" />
            <%--<img class="sec_img" title="Click để thay hình khác" style="height: 30px;" src="/Tools/Security.aspx" name="imgValidCode" id="imgValidCode" alt="ValidCode" />--%>

            <label name="safeCode " id="safeCode" style="float: left;font-size: 18px;font-style: italic;letter-spacing: 3px;line-height: 30px;margin-left: 10px;">
                <%=Utils.GetRandString()%>
            </label>
            <a id="changeimg" href="javascript:;" onclick="refreshSafeCode();">
                <img src="/Content/image/dk-refresh.png" /></a>


            <%--<a id="changeimg" href="javascript:;" onclick="ChangeImage();">
                <img src="/Content/image/dk-refresh.png" /></a>--%>
        </div>
    </div>


    <div class="row">
        <div class="col-xs-5 dk-left">
        </div>
        <div class="col-xs-7 dk-right">
            <input type="checkbox" id="Agree" name="Agree" value="1" /><span>Chấp nhận nội quy của diễn đàn</span><br />
            <a href="http://goldonline.vn/Ban-Quan-Tri/Thong-bao-Admin/Noi-quy-dien-dan.aspx" title="" target="_blank"><span class="dk-note">Nội quy diễn đàn</span></a>
            <%--<a href="" title=""><span class="dk-note">Xem lại thông tin</span></a>--%>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 dk-left">
        </div>
        <div class="col-xs-7 dk-right">
            <input type="submit" id="dk" name="_hl_action[RegisterPOST]" value="Đăng ký" style="display: none;" />
            <script type="text/javascript">

                function check() {
                    var tentl = $('#LoginName').val();
                    var hoten = $('#Name').val();
                    var tinhthanh = $('#CityID').val();
                    var email = $('#Email').val();
                    var namsinh = $('#Year option:checked').val();
                    var gioitinh = $('#Sex1:checked').val() == 1 ? 1 : 0;
                    var dienthoai = $('#Phone').val();
                    var lydo = $('#Note').val();
                    var mk = $('#Password').val();
                    var golaimk = $('#RePassword').val();
                    //var mabaove = $('#ValidCode').val();
                    var chapnhannoiquy = $('#Agree:checked').val() == 1 ? 1 : 0;
                    //var sVY = getCookie('Confirm_Ran');
                    //alert(sVY);
                    var mabaove = document.getElementById("safeCode").innerHTML;
                    var sVY = document.getElementById("ValidCode").value;
                    checkdk(tentl, hoten, tinhthanh, email, namsinh, gioitinh, dienthoai, lydo, mk, golaimk, mabaove, chapnhannoiquy, sVY);
                }
            </script>
            <a class="dn-btn" href="javascript:;" onclick="check();">Đăng ký</a>
        </div>
    </div>
</form>
<div class="clear25">
</div>
<div class="hidediv"></div>
<div class="wait" style="display: none;" id="Waiting">
    <img src="/Content/image/loading.gif" style="height: 20px;" />
    <p style="color: red; font-style: italic; font-weight: normal; font-size: 11px;">Đang kiểm tra thông tin, vui lòng chờ giây lát...</p>
</div>
<script src="/Content/js/AjaxRequest.js"></script>
<script src="/Content/js/Function.js"></script>
