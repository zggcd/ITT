<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    //var listItem = ViewBag.Data as List<ModGopYEntity>;
    //var model = ViewBag.Model as MGopYModel;
    var item = ViewBag.Data as ModGopYEntity;
    if (item == null)
        item = new ModGopYEntity();

    var detail = ViewBag.Detail as ModNewsEntity;
    item.DuThaoID = HL.Core.Web.HttpQueryString.GetValue("dt").ToInt();
    var _oDuThao = ModDuThaoService.Instance.GetByID(item.DuThaoID);
    item.Title = ViewPage.CurrentPage.Name + ": " + _oDuThao.Name;
%>

<div class="main_right">
    <div class="box-category mb10">
        <div class="vanban-new">
            <h3 class="title-list-news">
                <span class="title-t1"><%=ViewPage.CurrentPage.Name %></span>
            </h3>
        </div>
    </div>
    <!--//#box-news-x-->
    <div class="vanban_right">

        <div class="contents">
            <div class="top">
                <!--tim kiem form-->
                <div class="g-search">

                    <form enctype="multipart/form-data" method="post" name="frmGopY">
                        <div class="alert warning" id="alert" style="display: none;">
                            <span class="closebtn" id="closeAlert">&times;</span>
                            <span id="lblWarning"></span>
                        </div>

                        <input type="hidden" value="<%=item.DuThaoID %>" name="DuThaoID" id="DuThaoID" />
                        <div class="box_content_input">
                            <div class="frm_input no1">
                                <span class="name">Họ và tên:<span style="color: red">*</span></span>
                                <div class="input">
                                    <input type="text" class="validate[required]" name="Name" id="Name" value="<%=item.Name %>" placeholder="Họ và tên" maxlength="255">
                                    <%--<input name="ctl00$ctl45$g_430b6bb5_30e8_489d_b03a_7ae33d9f90cc$ctl00$txtHoVaTen" maxlength="255" id="ctl00_ctl45_g_430b6bb5_30e8_489d_b03a_7ae33d9f90cc_ctl00_txtHoVaTen" class="validate[required]" type="text">--%>
                                </div>
                            </div>
                            <div class="frm_input no1">
                                <span class="name">{RS:Web_FB_Email}:<span style="color: red">*</span></span>
                                <div class="input">
                                    <%--<input name="ctl00$ctl45$g_430b6bb5_30e8_489d_b03a_7ae33d9f90cc$ctl00$txtEmail" maxlength="255" id="ctl00_ctl45_g_430b6bb5_30e8_489d_b03a_7ae33d9f90cc_ctl00_txtEmail" class="validate[required,custom[email]]" type="text">--%>
                                    <input type="email" class="validate[required,custom[email]]" name="Email" id="Email" value="<%=item.Email %>" placeholder="{RS:Web_FB_Email}" maxlength="255">
                                </div>
                            </div>
                            <div class="frm_input no1">
                                <span class="name">{RS:Web_FB_Title}:<span style="color: red">*</span></span>
                                <div class="input">
                                    <%--<input name="ctl00$ctl45$g_430b6bb5_30e8_489d_b03a_7ae33d9f90cc$ctl00$txtTieuDe" value="Góp ý dự thảo: Dự thảo Thông tư hướng dẫn chi tiết quản lý xuất bản và phát hành xuất bản phẩm điện tử" maxlength="255" id="ctl00_ctl45_g_430b6bb5_30e8_489d_b03a_7ae33d9f90cc_ctl00_txtTieuDe" class="validate[required]" type="text">--%>
                                    <input type="text" class="validate[required]" name="Title" id="Title" value="<%=item.Title %>" placeholder="{RS:Web_FB_Title}">
                                </div>
                            </div>
                            <div class="frm_input no1">
                                <span class="name">{RS:Web_FB_Content}:<span style="color: red" id="hdf_InstanceNameFCKNoiDung">*</span></span>
                                <div class="textarea" style="clear: both;">
                                    <div>
                                        <textarea class="form-control ckeditor" name="Content" id="Content" rows="3" placeholder="{RS:Web_FB_Content}"><%=item.Content %></textarea>
                                        <%--<input id="InstanceNameFCKNoiDung" name="ctl00$ctl45$g_430b6bb5_30e8_489d_b03a_7ae33d9f90cc$ctl00$InstanceNameFCKNoiDung" value="" type="hidden"><input id="InstanceNameFCKNoiDung___Config" value="PreventSubmitHandler=true&amp;HtmlEncodeOutput=true" type="hidden"><iframe id="InstanceNameFCKNoiDung___Frame" src="/fckeditor/editor/fckeditor.html?InstanceName=InstanceNameFCKNoiDung&amp;Toolbar=Basic" scrolling="no" __idm_frm__="1515" style="margin: 0px; padding: 0px; border: 0px none; background-color: transparent; background-image: none; width: 100%; height: 200px;" width="100%" height="200px" frameborder="no"></iframe>--%>
                                    </div>
                                </div>
                            </div>

                            <div class="frm_input no1">
                                <span class="name" style="text-align: left;">File đính kèm:</span>
                                <input type="file" class="form-control" id="txtFiles" name="" multiple style="display: none;" />
                                <span id="btnSelectFiles" class="btn btn-info">Chọn files</span> <span class="required">(Chọn tối đa 3 files và tổng kích thước <= 20MB)</span><br />
                                <output id="listFile"></output>
                                <input type="hidden" name="Files" id="Files" value="" />
                                <%--<div class="input" style="width: 50%; margin-top: 8px">
                                <div class="MultiFile-wrap" id="ctl00_ctl45_g_430b6bb5_30e8_489d_b03a_7ae33d9f90cc_ctl00_FileUpload">
                                    <input name="ctl00$ctl451_430b6bb5_30e8_489d_b03a_7ae33d9f90cc$ctl00$FileUpload" id="ctl00_ctl45_g_430b6bb5_30e8_489d_b03a_7ae33d9f90cc_ctl00_FileUpload" class="multi max-3 maxsize-20480 MultiFile-applied" multiple="" value="" type="file"><div class="MultiFile-list" id="ctl00_ctl45_g_430b6bb5_30e8_489d_b03a_7ae33d9f90cc_ctl00_FileUpload_list"></div>
                                </div>
                            </div>--%>
                            </div>

                            <div class="frm_input no1">
                                <span class="name">Captcha:<span style="color: red">*</span></span>
                                <div class="input" style="width: 50%">
                                    <script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>
                                    <div class="g-recaptcha" data-sitekey="6LcbFC4UAAAAAJxOD2Yjs104Uy7Kit31oaS4INFW"></div>
                                    <%--<div class="g-recaptcha" data-sitekey="6LcigRwTAAAAAEocs6rZEZ472hrBctTwmKqPETtj">
                                        <div style="width: 304px; height: 78px;">
                                            <div>
                                                <iframe src="https://www.google.com/recaptcha/api2/anchor?k=6LcigRwTAAAAAEocs6rZEZ472hrBctTwmKqPETtj&amp;co=aHR0cHM6Ly9taWMuZ292LnZuOjQ0Mw..&amp;hl=vi&amp;v=r20171003155951&amp;size=normal&amp;cb=gg38z97014mm" title="tiện ích con mã xác thực lại" scrolling="no" sandbox="allow-forms allow-popups allow-same-origin allow-scripts allow-top-navigation allow-modals allow-popups-to-escape-sandbox" width="304" height="78" frameborder="0"></iframe>
                                            </div>
                                            <textarea id="g-recaptcha-response" name="g-recaptcha-response" class="g-recaptcha-response" style="width: 250px; height: 40px; border: 1px solid #c1c1c1; margin: 10px 25px; padding: 0px; resize: none; display: none;"></textarea>
                                        </div>
                                    </div>--%>
                                    <span style="color: red">(Tích chọn để xác nhận bạn là bạn đọc, không phải là người máy tự động)</span>
                                </div>
                            </div>

                            <div class="button">
                                <input name="" value="{RS:Web_GuiGopY}" onclick="" id="btnGopY" class="btn_action search icon QAcustom" type="button" style="color: #fff !important;">
                                <button name="_hl_action[AddGopY]" type="submit" class="" style="display: none;" id="btnGopY1">{RS:Web_GuiGopY}</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!--.Main_container-->
        </div>
    </div>
</div>


<%--<div class="clear30"></div>
<div class="container">
    <div class="row">
        <div class="col-12">
            <h1 class="title"><%= ViewPage.CurrentPage.Name %></h1>
        </div>
        <div class="col-12">
            <div class="clear30"></div>
            <div class="container">
                <form enctype="multipart/form-data" method="post" name="frmGopY">
                    <div class="alert warning" id="alert" style="display: none;">
                        <span class="closebtn" id="closeAlert">&times;</span>
                        <span id="lblWarning"></span>
                    </div>

                    <input type="hidden" value="<%=item.DuThaoID %>" name="DuThaoID" id="DuThaoID" />
                    <div class="form-group row">
                        <label for="Name" class="col-sm-2 col-form-label">Họ và tên<span class="required">*</span></label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="Name" id="Name" value="<%=item.Name %>" placeholder="Họ và tên">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputEmail3" class="col-sm-2 col-form-label">{RS:Web_FB_Email}<span class="required">*</span></label>
                        <div class="col-sm-10">
                            <input type="email" class="form-control" name="Email" id="Email" value="<%=item.Email %>" placeholder="{RS:Web_FB_Email}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="Title" class="col-sm-2 col-form-label">{RS:Web_FB_Title}<span class="required">*</span></label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" name="Title" id="Title" value="<%=item.Title %>" placeholder="{RS:Web_FB_Title}">
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="Content" class="col-sm-2 col-form-label">{RS:Web_FB_Content}<span class="required">*</span></label>
                        <div class="col-sm-10">
                            <textarea class="form-control ckeditor" name="Content" id="Content" rows="3" placeholder="{RS:Web_FB_Content}"><%=item.Content %></textarea>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputPassword3" class="col-sm-2 col-form-label">File đính kèm</label>
                        <div class="col-sm-10">
                            <input type="file" class="form-control" id="txtFiles" name="" multiple style="display: none;" />
                            <span id="btnSelectFiles" class="btn btn-info">Chọn files</span> <span class="required">(Chọn tối đa 3 files và tổng kích thước <= 20MB)</span><br />
                            <output id="listFile"></output>
                            <input type="hidden" name="Files" id="Files" value="" />
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="inputPassword3" class="col-sm-2 col-form-label">Captcha<span class="required">*</span></label>
                        <div class="col-sm-10">
                            <div class="g-recaptcha" data-sitekey="6LcbFC4UAAAAAJxOD2Yjs104Uy7Kit31oaS4INFW"></div>
                            <span style="color: red;">(Tích chọn để xác nhận bạn là bạn đọc, không phải là người máy tự động)</span>
                        </div>
                    </div>
                    <div class="form-group row">
                        <label for="" class="col-sm-2 col-form-label"></label>
                        <div class="col-sm-10">
                            <a href="javascript: void(0)" title="" class="btn btn-primary" id="btnGopY">{RS:Web_GuiGopY}</a>
                            <button name="_hl_action[AddGopY]" type="submit" class="" style="display: none;" id="btnGopY1">{RS:Web_GuiGopY}</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>--%>

<link href="/Content/css/w3.css" rel="stylesheet" />
<link href="/Content/css/message.css" rel="stylesheet" />
<link href="/Content/css/style.css" rel="stylesheet" />
<script src="/Content/js/javascript.js"></script>
<script src="/Content/js/message.js"></script>
<script src="/Content/js/AjaxRequest.js"></script>
<script src="/Content/js/Function.js"></script>
<script type="text/javascript" src="/Content/ckeditor/ckeditor.js"></script>
<script>
    $(document).ready(function () {
        document.getElementById('txtFiles').addEventListener('change', fnOnchangeFiles, false);
        $("#btnSelectFiles").click(function () {
            $("#txtFiles").trigger("click");
        });

        var btn = document.getElementById("btnGopY");
        if (btn) {
            btn.onclick = function () {
                var duthaoid = <%=item.DuThaoID%>;
                var name = document.getElementById("Name");
                var email = document.getElementById("Email");
                var title = document.getElementById("Title");
                var content = document.getElementById("Content");
                var resultMess = validSendContact(name, email, title, content);
                if (resultMess === "" && isRobot()) {
                    resultMess = 'Tích chọn để xác nhận bạn là bạn đọc, không phải là người máy tự động';
                }
                if (resultMess === "") {
                    var fileCurr = $(".thumb");
                    var sFile = [], nFile = fileCurr.length;
                    for (var i = 0; i < nFile; i++) {
                        sFile += ($(fileCurr[i]).attr('data') + ";" + $(fileCurr[i]).text());
                        if (i < (nFile - 1)) {
                            sFile += '|';
                        }
                    }

                    document.getElementById('Files').value = sFile;

                    //var file = dataURLtoFile(sFile, 'a.pdf');
                    //console.log(file);

                    $('#btnGopY1').click();
                    //fnGuiGopY(duthaoid, name, email, title, content, sFile);
                } else {
                    loadAlert(resultMess);
                }
            };
        }
    });

    function isRobot() {
        var resp = grecaptcha.getResponse();
        if (resp.length == 0) {
            return true;
        } else {
            return false;
        }
    }

    function dataURLtoFile(dataurl, filename) {
        var arr = dataurl.split(','), mime = arr[0].match(/:(.*?);/)[1],
            bstr = atob(arr[1]), n = bstr.length, u8arr = new Uint8Array(n);
        while (n--) {
            u8arr[n] = bstr.charCodeAt(n);
        }
        return new File([u8arr], filename, { type: mime });
    }
</script>
