<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%CPUserEntity entity = ViewBag.DataRes as CPUserEntity ?? new CPUserEntity(); %>

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
                <span class="title-t1">Đăng ký tài khoản</span>
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
                                <span class="name">Họ tên:</span>
                                <div class="input">
                                    <input name="Name" maxlength="255" id="Name" class="" type="text" value="<%=entity.Name %>">
                                </div>
                            </div>
                            <div class="frm_input no1">
                                <span class="name">Tên truy cập:<span style="color: red">*</span></span>
                                <div class="input">
                                    <input name="LoginName" maxlength="255" id="LoginName" class="" type="text" value="<%=entity.LoginName %>">
                                </div>
                            </div>
                            <div class="frm_input no1">
                                <span class="name">Mật khẩu:<span style="color: red">*</span></span>
                                <div class="input">
                                    <input name="Password" maxlength="255" id="Password" class="" type="password" value="<%=entity.Password %>">
                                </div>
                            </div>
                            <div class="frm_input no1">
                                <span class="name">Xác nhận mật khẩu:<span style="color: red">*</span></span>
                                <div class="input" style="margin-top: 8px">
                                    <input name="RePassword" maxlength="255" id="RePassword" class="DeepSearch textBox" type="password">
                                </div>
                            </div>
                            <div class="frm_input no1">
                                <span class="name">Email:<span style="color: red">*</span></span>
                                <div class="input">
                                    <input name="Email" maxlength="255" id="Email" class="" type="text" value="<%=entity.Email %>">
                                </div>
                            </div>
                            <div class="frm_input no1">
                                <span class="name">Địa chỉ:<span style="color: red">*</span></span>
                                <div class="input">
                                    <input name="" maxlength="255" id="" class="" type="text">
                                </div>
                            </div>
                            <div class="frm_input no1">
                                <span class="name">Điện thoại:<span style="color: red">*</span></span>
                                <div class="input">
                                    <input onkeypress="return pkeypress(event);" name="Phone" maxlength="11" id="Phone" class="" type="text" value="<%=entity.Phone %>">
                                </div>
                            </div>

                            <%--<div class="">
                                <span class="name" style="font-weight: bold">Loại tài khoản :<span style="color: red">*</span></span>
                                <div class="input" style="float: left; margin-top: 10px">
                                    <table id="" class="radio_loaitaikhoan">
                                        <tbody>
                                            <tr>
                                                <td><input id="" name="rblLoaiTaiKhoan" value="CaNhan" checked="checked" type="radio"><label for="">Cá nhân</label></td>
                                                <td><input id="" name="rblLoaiTaiKhoan" value="ToChuc" type="radio"><label for="">Tổ chức</label></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                            <div class="frm_input no1" id="thongtinnguoilienhe" style="display: none">
                                <fieldset style="border: 1px solid #c6c6c6; padding: 5px;">
                                    <legend style="margin-right: 5px; margin-left: 30px; width: 180px"><strong>Thông tin người liên hệ</strong></legend>
                                    <div class="frm_input no1" style="margin-top: 20px;">
                                        <span class="name">Họ và tên:<span style="color: red">*</span></span>
                                        <div class="input">
                                            <input name="" id="" class="" type="text">
                                        </div>
                                    </div>
                                    <div class="frm_input no1" style="margin-top: 20px;">
                                        <span class="name">Số CMT (hoặc Hộ chiếu):<span style="color: red">*</span></span>
                                        <div class="input">
                                            <input name="" id="" class="" type="text">
                                        </div>
                                    </div>
                                    <div class="frm_input no1" style="margin-top: 20px;">
                                        <span class="name">Email:<span style="color: red">*</span></span>
                                        <div class="input">
                                            <input name="" id="" class="" type="text">
                                        </div>
                                    </div>
                                    <div class="frm_input no1" style="margin-top: 20px;">
                                        <span class="name">Địa chỉ:<span style="color: red">*</span></span>
                                        <div class="input">
                                            <input name="" id="" class="" type="text">
                                        </div>
                                    </div>
                                    <div class="frm_input no1" style="margin-top: 20px;">
                                        <span class="name">Số điện thoại:<span style="color: red">*</span></span>
                                        <div class="input">
                                            <input name="" id="" class="" type="text">
                                        </div>
                                    </div>
                                </fieldset>
                            </div>
                            <div class="frm_input no1">
                                <fieldset style="border: 1px solid #c6c6c6; padding: 5px;">
                                    <legend style="margin-right: 5px; margin-left: 30px; width: 230px;"><strong>Thông tin dịch vụ công sử dụng</strong></legend>
                                    <div id="coquanchuquan_1" class="coquanchuquan">
                                        <div class="frm_input no1" style="margin-top: 20px;">
                                            <span class="name">Cơ quan thực hiện:<span style="color: red">*</span></span>
                                            <div class="input">
                                                <select id="ddlCoQuan_1" class="ddlCoQuan" onchange="loadDVC3(this);">
                                                    <option value="0"></option>

                                                    <option value="82">Vụ Bưu chính</option>

                                                    <option value="84">Cục Viễn thông</option>

                                                    <option value="85">Trung tâm Internet Việt Nam</option>

                                                    <option value="88">Cục Tần số vô tuyến điện</option>

                                                    <option value="98">Vụ CNTT</option>

                                                    <option value="91">Cục Báo chí</option>

                                                    <option value="94">Cục Xuất bản, in và phát hành</option>

                                                    <option value="90">Cục Phát thanh, truyền hình và thông tin điện tử</option>

                                                </select>
                                                <span class="btn-plus" id="1" onclick="deleteCoQuanChuQuan(this);" style="padding-left: 12px; color: #0072c6; cursor: pointer">Xóa</span>
                                            </div>
                                        </div>
                                        <div class="frm_input no1" style="margin-top: 20px;">
                                            <span class="name">Các dịch vụ công mức 3:<span style="color: red">*</span></span>
                                            <div class="input" id="dsdichvucong3_1">
                                            </div>
                                        </div>
                                    </div>

                                    <div id="coquanchuquan_empty" class="coquanchuquan" style="display: none">
                                        <div class="frm_input no1" style="margin-top: 20px;">
                                            <span class="name">Cơ quan thực hiện:<span style="color: red">*</span></span>
                                            <div class="input">
                                                <select id="ddlCoQuan_empty" class="ddlCoQuan" onchange="loadDVC3(this);">
                                                    <option value="0"></option>

                                                    <option value="82">Vụ Bưu chính</option>

                                                    <option value="84">Cục Viễn thông</option>

                                                    <option value="85">Trung tâm Internet Việt Nam</option>

                                                    <option value="88">Cục Tần số vô tuyến điện</option>

                                                    <option value="98">Vụ CNTT</option>

                                                    <option value="91">Cục Báo chí</option>

                                                    <option value="94">Cục Xuất bản, in và phát hành</option>

                                                    <option value="90">Cục Phát thanh, truyền hình và thông tin điện tử</option>

                                                </select>
                                                <span class="btn-plus" id="1" onclick="deleteCoQuanChuQuan(this);" style="padding-left: 12px; color: #0072c6; cursor: pointer">Xóa</span>
                                            </div>
                                        </div>
                                        <div class="frm_input no1" style="margin-top: 20px;">
                                            <span class="name">Các dịch vụ công mức 3:<span style="color: red">*</span></span>
                                            <div class="input" id="dsdichvucong3_empty">
                                            </div>
                                        </div>
                                    </div>
                                    <div>
                                        <a style="padding-top: 10px; float: left; font-size: 17px;" href="#" id="btnPlus" class="btn-plus"><strong>Thêm</strong></a>
                                    </div>
                                </fieldset>
                            </div>--%>

                            <div class="frm_input no1">
                                <div class="frm_input no3">

                                    <span class="name">Captcha:<span style="color: red;">*</span></span>
                                    <div class="input" style="width: 70%">
                                        <%--<div class="g-recaptcha" data-sitekey="6LepqR0TAAAAABFTzAhzqTtwmpRVkQX0qlaD0rBp">
                                            <div style="width: 304px; height: 78px;">
                                                <div>
                                                    <iframe src="https://www.google.com/recaptcha/api2/anchor?k=6LepqR0TAAAAABFTzAhzqTtwmpRVkQX0qlaD0rBp&amp;co=aHR0cHM6Ly9kdmMubWljLmdvdi52bjo0NDM.&amp;hl=vi&amp;v=r20171031153338&amp;size=normal&amp;cb=a3pedug0cr63" role="presentation" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox" width="304" height="78" frameborder="0"></iframe>
                                                </div>
                                                <textarea id="g-recaptcha-response" name="g-recaptcha-response" class="g-recaptcha-response" style="width: 250px; height: 40px; border: 1px solid #c1c1c1; margin: 10px 25px; padding: 0px; resize: none; display: none;"></textarea>
                                            </div>
                                        </div>
                                        <span style="color: red">(Tích chọn để xác nhận bạn là bạn đọc, không phải là người máy tự động)</span>--%>

                                        <input type="text" id="ValidCode" name="ValidCode" value="" style="width: 20%;" />
                                        <label name="safeCode " id="safeCode" style="float: left; font-size: 18px; font-style: italic; letter-spacing: 3px; line-height: 30px; margin-left: 10px;">
                                            <%=Utils.GetRandString()%>
                                        </label>
                                        <a id="changeimg" href="javascript:;" onclick="refreshSafeCode();">
                                            <img src="/Content/imgs/dk-refresh.png" /></a>
                                    </div>
                                </div>
                            </div>

                            <div class="button">
                                <input name="_hl_action[RegisterPOST]" value="Đăng ký tài khoản" id="dk" class="btn_action search icon QAcustom" type="submit" style="display: none;">
                                <%--<a class="btn_action search icon QAcustom" href="javascript:;" onclick="check();">Đăng ký tài khoản</a>--%>
                                <input class="btn_action search icon QAcustom" onclick="check();" value="Đăng ký tài khoản" type="button" />
                            </div>

                        </div>
                    </div>
                </form>
            </div>
            <!--.Main_container-->

        </div>
    </div>
</div>
<script>
    function setFormSubmitToFalse() {
        setTimeout(function () { _spFormOnSubmitCalled = false; }, 300);
        return true;
    }
    var i = 1;
    jQuery(document).ready(function () {
        //jQuery('form').validationEngine({ promptPosition: "topRight" });
        $("#btnPlus").click(function () {
            i++;
            var newElement = $('#coquanchuquan_empty').clone();
            newElement.attr("id", "coquanchuquan_" + i);
            newElement.attr("style", "");
            newElement.find('select').each(function () {
                this.id = this.id.replace('ddlCoQuan_empty', 'ddlCoQuan_' + i);
            });
            newElement.find('div#dsdichvucong3_empty').each(function () {
                this.id = this.id.replace('dsdichvucong3_empty', 'dsdichvucong3_' + i);
            });

            $('#coquanchuquan_empty').before(newElement);

            return false;
        });
        //$('#ctl00_ctl45_g_66d67cd6_1199_4fd7_bfaa_654f443aa166_ctl00_txtTenDangKy').focus();
        //if (false) {
        //    $("input[id*='LoginName']").keyup(function (e) {
        //        if ($(this).val().indexOf("mic_") != 0) {
        //            $(this).val("mic_");
        //        }
        //    });
        //}
        //// loadDVC3();
        //var isShowDDLDonViDangKy = true;
        //if (isShowDDLDonViDangKy) {
        //    $("#containerDonViDangKySearch").css("visibility", "visible");
        //} else {
        //    $("#containerDonViDangKySearch").css("visibility", "hidden");
        //}

        //var flagExistedItem = false;
        //if (flagExistedItem) {
        //    $('#LoginName').validationEngine('showPrompt', 'Đã tồn tại', null, null, true);
        //} else {
        //    $('#LoginName').validationEngine('hide');
        //}
        $(".radio_loaitaikhoan input[type=radio]").click(function () {
            if (this.value == 'CaNhan') {
                $("#thongtinnguoilienhe").hide();
            } else {
                $("#thongtinnguoilienhe").show();
            }
        });

    });
    function deleteCoQuanChuQuan(el) {
        $(el).parent().parent().parent().remove();
    }
    function loadDVC3(el) {
        var coquanId = el.options[el.selectedIndex].value;
        $('#dsdichvucong3').html("<tr><td colspan='6'><img height='50' width='50' src='/style/images/loading.gif' ></td></tr>");
        $.ajax({
            url: '/Pages/dichvucongmuc3/loaddsdvcmuc3theocoquan.aspx?coquanId=' + coquanId,
            type: 'post',
            dataType: 'html',
            data: {},
            success: (function (html) {
                var nHtml = html.substring(html.indexOf("<div id=\"content\">") + 18);
                $('#dsdichvucong3_' + el.id.substring(10)).html(nHtml.substring(0, nHtml.indexOf("</div><!--@@@@@-->")));

            })
        });
    }

    function insertData_DVC() {
        var dataCQCQ = "#"; var dataDVC = "#";
        var count = $('.coquanchuquan').length;
        $('.coquanchuquan').each(function (index, value) {
            var stt = $(this).attr('id').substring(14);
            if (stt.indexOf('empty') == -1) {
                var cqId = $("#ddlCoQuan_" + stt).val();
                if (cqId != 0) {
                    var dsdvc = ";";
                    var childs = $("#dsdichvucong3_" + stt).find('input');
                    for (var i = 0; i < childs.length; i++) {
                        if (childs[i].checked == true) {
                            dsdvc += childs[i].value + ";";
                        }
                    }
                    if (dsdvc.length > 1) {
                        dataCQCQ += cqId + "#";
                        dataDVC += dsdvc + "#";
                    }
                }
            }
        });
        $('input[id*="DSCoQuanChuQuan_Hidden"]').val(dataCQCQ);
        $('input[id*="DSDichVuCong_Hidden"]').val(dataDVC);

        if (dataCQCQ.length < 2) {
            alert('Bạn phải chọn ít nhất 1 cơ quan thực hiện và các dịch vụ công tương ứng');
            return false;
        } else {
            setFormSubmitToFalse();
            if (checkPassword('LoginName') == false) {
                alert('Tên truy cập của bạn không được gõ tiếng việt hoặc có khoảng trắng');
                return false;
            }
            else if (checkPassword('txtMatKhau') == false) {
                alert('Mật khẩu của bạn không được gõ tiếng việt hoặc có khoảng trắng');
                return false;
            }
            return true;
        }
    }

    function checkPassword(idtb) {
        var patt = new RegExp("^([A-Z]|[a-z]|[0-9]|_|@|-|[\.])*$");
        // this allows to use i18 for the error msgs
        if (!patt.test($("#" + idtb).val())) {
            return false;
        }
        return true;
    }

    function check() {
        var tentl = $('#LoginName').val();
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

<div class="hidediv"></div>
<div class="wait" style="display: none;" id="Waiting">
    <img src="/Content/imgs/loading.gif" style="height: 20px;" />
    <p style="color: red; font-style: italic; font-weight: normal; font-size: 11px;">Đang kiểm tra thông tin, vui lòng chờ giây lát...</p>
</div>
<script src="/Content/js/AjaxRequest.js"></script>
<script src="/Content/js/Function.js"></script>
