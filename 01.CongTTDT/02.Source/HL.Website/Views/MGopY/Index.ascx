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

<div class="row-fluid titleContainer">
    <span><%=ViewPage.CurrentPage.Name %></span>
</div>
<div class="row-fluid contentNews">
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
                </div>
            </div>
            <div class="frm_input no1">
                <span class="name">{RS:Web_FB_Email}:<span style="color: red">*</span></span>
                <div class="input">
                    <input type="email" class="validate[required,custom[email]]" name="Email" id="Email" value="<%=item.Email %>" placeholder="{RS:Web_FB_Email}" maxlength="255">
                </div>
            </div>
            <div class="frm_input no1">
                <span class="name">{RS:Web_FB_Title}:<span style="color: red">*</span></span>
                <div class="input">
                    <input type="text" class="validate[required]" name="Title" id="Title" value="<%=item.Title %>" placeholder="{RS:Web_FB_Title}">
                </div>
            </div>
            <div class="frm_input no1">
                <span class="name">{RS:Web_FB_Content}:<span style="color: red" id="hdf_InstanceNameFCKNoiDung">*</span></span>
                <div class="textarea" style="clear: both;">
                    <div>
                        <textarea class="form-control ckeditor" name="Content" id="Content" rows="3" placeholder="{RS:Web_FB_Content}"><%=item.Content %></textarea>
                    </div>
                </div>
            </div>

            <div class="frm_input no1">
                <span class="name" style="text-align: left;">File đính kèm:</span>
                <input type="file" class="form-control" id="txtFiles" name="" multiple style="display: none;" />
                <span id="btnSelectFiles" class="btn btn-info">Chọn files</span> <span class="required">(Chọn tối đa 3 files và tổng kích thước <= 20MB)</span><br />
                <output id="listFile"></output>
                <input type="hidden" name="Files" id="Files" value="" />
            </div>

            <div class="frm_input no1">
                <span class="name">Captcha:<span style="color: red">*</span></span>
                <div class="input" style="width: 50%">
                    <script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>
                    <div class="g-recaptcha" data-sitekey="6LcbFC4UAAAAAJxOD2Yjs104Uy7Kit31oaS4INFW"></div>
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
<div class="main_right">
    <!--//#box-news-x-->
    <div class="vanban_right">

        <div class="contents">
            <div class="top">
                <!--tim kiem form-->
                <div class="g-search">
                </div>
            </div>
            <!--.Main_container-->
        </div>
    </div>
</div>

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
