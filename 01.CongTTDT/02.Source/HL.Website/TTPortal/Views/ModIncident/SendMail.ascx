<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var entity = ViewBag.Data as EmailEntity;
%>

<form id="hlForm" name="hlForm" method="post">
    <input type="hidden" id="_hl_action" name="_hl_action" />

    <div id="toolbar-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="toolbar-list" id="toolbar">
                <ul style="float: left; padding-right: 15px;">
                    <li id="toolbar-apply" class="button"><a class="toolbar" href="javascript:void(0);" onclick="fnSendMail();"><span
                        title="Gửi mail" class="icon-32-sendmail"></span>Gửi mail</a></li>

                    <li id="toolbar-cancel" class="button"><a class="toolbar" onclick="closet();"
                        href="javascript:void(0);"><span title="Đóng" class="icon-32-cancel" onclick="closet();"></span>Đóng</a></li>
                </ul>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Gửi email cảnh báo tới đơn vị bị sự cố</h2>
            </div>
            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>
    <div class="clr"></div>

    <%= ShowMessage()%>

    <div id="element-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="col width-100">
                <table class="admintable">
                    <tr>
                        <td class="key">
                            <label>Email tiếp nhận (phân cách bằng dấu phẩy ",") :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="To" id="To" value="<%=entity.To %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Email CC (phân cách bằng dấu phẩy ",") :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Cc" id="Cc" value="<%=entity.Cc %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Tiêu đề :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Subject" id="Subject" value="<%=entity.Subject %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="text-align: center" class="key">NỘI DUNG </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="content">
                            <textarea class="ckeditor" style="width: 100%; height: 500px" name="Body" id="Body"><%=entity.Body%></textarea>
                        </td>
                    </tr>
                </table>
            </div>
            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>

    <script type="text/javascript" src="/{CPPath}/Content/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        CKFinder.setupCKEditor(null, '/{CPPath}/Content/ckfinder/');

        function fnSendMail() {
            document.getElementById('_hl_action').value = 'SendMailExcute';

            if (typeof document.hlForm.onsubmit == "function") {
                document.hlForm.onsubmit();
            }
            document.hlForm.submit();
        }

        function closet() {
            window.location.href = '<%=CPViewPage.Request.RawUrl.Replace("SendMail.aspx","Index.aspx") %>';
        }
    </script>

</form>
