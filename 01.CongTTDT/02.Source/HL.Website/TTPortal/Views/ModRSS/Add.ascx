<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModRSSModel;
    var entity = ViewBag.Data as ModRSSEntity;
%>
<style type="text/css">
    #img_view {
        width: auto !important;
        float: right;
        margin-right: 10px;
    }
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
                <%--<%= GetDefaultAddCommand()%>--%>
                <%= GetListCommand("apply|Lưu,save|Lưu  &amp; đóng,space,cancel|Đóng")%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Tin RSS : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                            <label>Chuyên mục :</label>
                        </td>
                        <td>
                            <select name="MenuID" id="MenuID" class="text_input" style="width: 20%;">
                                <option value="0">Root</option>
                                <%= Utils.ShowDDLMenuByType("RSS", model.LangID, entity.MenuID)%>
                            </select>

                            <label style="margin-left: 10px; font-weight: bold;">Nguồn :</label>
                            <input style="width: 20%;" class="text_input" type="text" name="Nguon" id="Nguon" value="<%=entity.Nguon %>" maxlength="255" />

                            <label style="margin-left: 10px; font-weight: bold;">Vị trí :</label>
                            <%= Utils.ShowCheckBoxByConfigkey("Mod.RSSState", "ArrState", entity.State)%>

                            <%if (CPViewPage.UserPermissions.Approve)
                              {%>
                            <label style="margin-left: 10px; font-weight: bold;">Duyệt :</label>
                            <input name="Activity" <%= entity.Activity ? "checked" : "" %> type="radio" value='1' />
                            Có
                    <input name="Activity" <%= !entity.Activity ? "checked" : "" %> type="radio" value='0' />
                            Không
                    <%} %>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Tiêu đề :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Title" id="Title" value="<%=entity.Name %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Đường dẫn :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Url" id="Url" value="<%=entity.Url %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Tóm tắt :</label>
                        </td>
                        <td>
                            <textarea class="text_input" style="height: 60px" name="Summary" id="Summary"><%=entity.Summary %></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">Hình minh họa :</td>
                        <td>
                            <input class="text_input" type="text" name="File" id="File" style="width: 75%" value="<%=entity.File %>" />
                            <input class="text_input" style="width: 75px;" type="button" onclick="ShowFileForm('File'); return false;"
                                value="Chọn file" />
                            <%if (!string.IsNullOrEmpty(entity.File) && (entity.File.Contains(".img") || entity.File.Contains(".png") || entity.File.Contains(".gif") || entity.File.Contains(".jpg")))
                              { %>
                            <%= Utils.GetMedia(entity.File, -1, 50, string.Empty, true, "id='img_view'")%><%}
                              else
                              { %>
                            <img id="img_view" height="50" style="float: right; margin-right: 10px;" />
                            <%} %>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center" style="text-align: center" class="key">NỘI DUNG
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" class="content">
                            <textarea class="ckeditor" style="width: 100%; height: 500px" name="Content" id="Content"><%=entity.Content%></textarea>
                        </td>
                    </tr>
                    <tr>
                    </tr>
                    <%--<tr>
                        <td class="key">
                            <label>Lượt xem :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="View" id="View" value="<%=entity.View %>" maxlength="255" />
                        </td>
                    </tr>--%>
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
            if (name_control == 'File' && document.getElementById("img_view"))
                document.getElementById("img_view").src = arg.replace('~/', '/{ApplicationPath}');
        }

        //GetCustom('IsName');

    </script>
</form>
