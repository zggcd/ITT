<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModConfigSendMailModel;
    var entity = ViewBag.Data as ModConfigSendMailEntity;
%>

<style type="text/css">
    .key{ width: auto !important;}
</style>
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
                <%= GetDefaultAddCommand()%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Cấu hình Email : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                <table class="admintable" style="margin: 0 auto; width: 50%;">
                    <%--           <tr>
                <td class="key">
                    <label>Id :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Id" id="Id" value="<%=entity.Id %>" maxlength="255" />
                </td>
            </tr>--%>
                    <tr>
                        <td class="key">
                            <label>Loại Email :</label>
                        </td>
                        <td>
                            <select id="MailType" name="MailType" class="text_input" style="width: 38%">
                                <%--<option value="0">Tất cả</option>--%>
                                <%=Utils.ShowDDLMenuByType2("MailType", model.LangID, entity.MailType) %>
                            </select>

                            <% var objMenu = WebMenuService.Instance.CreateQuery().Where(o => o.Type == "SmtpServer" && o.Code == entity.SmtpServer).ToSingle();
                               var idMenu = 0;
                               if (objMenu != null)
                               {
                                   idMenu = objMenu.ID;
                               } %>
                            <select class="text_input" id="SmtpServer" name="SmtpServer" style="width: 30%">
                                <option value="0">Chọn loại Email gửi</option>
                                <%=Utils.ShowDDLMenuByType2("SmtpServer", 1, idMenu) %>
                            </select>

                            <label style="margin-left: 10px; font-weight: bold;">Duyệt :</label>
                            <%if (CPViewPage.UserPermissions.Approve)
                              {%>
                            <input name="Activity" <%= entity.Activity ? "checked" : "" %> type="radio" value='1' />
                            Có
                    <input name="Activity" <%= !entity.Activity ? "checked" : "" %> type="radio" value='0' />
                            Không
                    <%} %>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Email gửi :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="SmtpUser" id="SmtpUser" value="<%=entity.SmtpUser %>" maxlength="255" style="width: 36%;" />

                            <%--<label style="margin-left: 10px; font-weight: bold;">Mật khẩu :</label>--%>
                            <input class="text_input" type="password" name="SmtpPass" id="SmtpPass" value="<%=entity.SmtpPass %>" maxlength="255" style="width: 28%;" placeholder="Password" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Email nhận :</label>
                        </td>
                        <td>
                            <textarea class="text_input" name="ToMail" id="ToMail" maxlength="255" rows="3" style="width: 66%; max-width: 70%;max-height: 200px; float: left;"><%=entity.ToMail %></textarea>
                            <span style="clear: both;color: red;display: table-cell;font-style: italic;line-height: 20px;padding: 15px;text-align: center;">(Mỗi Email cách nhau bởi dấu phẩy ',')</span>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td class="key">
                        </td>
                        <td>

                            <label style="margin-left: 10px; font-weight: bold;">Smtp ssl :</label>
                            <input style="" name="SmtpSSL" <%= entity.SmtpSSL ? "checked" : "" %> type="radio" value='1' />
                            <span style="">Có</span>
                    <input style="" name="SmtpSSL" <%= !entity.SmtpSSL ? "checked" : "" %> type="radio" value='0' />
                            <span style="">Không</span>
                            
                            <label style="margin-left: 10px; font-weight: bold;">Cổng :</label>
                            <input style="width: 5%" class="text_input" type="text" name="SmtpPort" id="SmtpPort" value="<%=entity.SmtpPort %>" maxlength="255" />
                            <span style="font-style: italic; color: red;">(Lưu ý: Chọn một trong các giá trị sau: 25, 465 và 587)</span>
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td class="key">
                            <label>
                                Tiêu đề mail phản hồi :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Name" value="<%=entity.Name %>" maxlength="255" />
                        </td>
                    </tr>

                    <tr style="display: none;">
                        <td class="key"><label>Nội dung mail phản hồi :</label>
                        </td>
                        <td class="content">
                            <textarea class="ckeditor" style="width: 100%; height: 500px" name="Content" id="Content"><%=entity.Content%></textarea>
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

        function refreshPage(arg) {
            arg = '~' + arg;
            document.getElementById(name_control).value = arg;
            if (document.getElementById("img_view"))
                document.getElementById("img_view").src = arg.replace('~/', '/{ApplicationPath}');
        }

        GetCustom('IsName');

    </script>
</form>
