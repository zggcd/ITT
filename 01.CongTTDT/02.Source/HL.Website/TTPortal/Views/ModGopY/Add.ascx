<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModGopYModel;
    var entity = ViewBag.Data as ModGopYEntity;
%>

<script type="text/javascript" src="/{CPPath}/Content/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
    CKFinder.setupCKEditor(null, '/{CPPath}/Content/ckfinder/');
</script>

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
                <h2>Góp ý : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                            <label>Dự thảo :</label>
                        </td>
                        <td>
                            <% List<ModDuThaoEntity> listDuThao = ModDuThaoService.Instance.CreateQuery().ToList(); %>
                            <select name="DuThaoID" id="DuThaoID" class="text_input">
                                <option value="0">-</option>
                                <%for (int i = 0; listDuThao != null && i < listDuThao.Count; i++)
                                    { %>
                                <option <%if (entity.DuThaoID == listDuThao[i].ID)
                                    {%>
                                    selected <%} %> value="<%= listDuThao[i].ID%>"><%= listDuThao[i].Name%></option>
                                <%} %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Họ tên :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Name" id="Name" value="<%=entity.Name %>" maxlength="255" />
                        </td>
                    </tr>
                    <%--<tr>
                        <td class="key">
                            <label>Địa chỉ :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Address" id="Address" value="<%=entity.Address %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Điện thoại :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Phone" id="Phone" value="<%=entity.Phone %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Di động :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Mobile" id="Mobile" value="<%=entity.Mobile %>" maxlength="255" />
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="key">
                            <label>Email :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Email" id="Email" value="<%=entity.Email %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Tiêu đề :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Title" id="Title" value="<%=entity.Title %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Nội dung :</label>
                        </td>
                        <td class="content">
                            <textarea class="ckeditor" style="width: 100%; height: 500px" name="Content" id="Content"><%=entity.Content%></textarea>
                        </td>
                    </tr>
                    <%--<tr>
                        <td class="key">
                            <label>File đính kèm :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="File" id="File" style="width: 80%;" value="<%=entity.File %>" maxlength="255" />
                            <input class="text_input" style="width: 17%;" type="button" onclick="ShowFileForm('File'); return false;" value="Chọn File" />
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="key">
                            <label>IP :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="IP" id="IP" value="<%=entity.IP %>" maxlength="255" />
                        </td>
                    </tr>
                    <%if (CPViewPage.UserPermissions.Approve)
                        {%>
                    <tr>
                        <td class="key">
                            <label>Duyệt :</label>
                        </td>
                        <td>
                            <input name="Activity" <%= entity.Activity ? "checked" : "" %> type="radio" value='1' />
                            Có
                    <input name="Activity" <%= !entity.Activity ? "checked" : "" %> type="radio" value='0' />
                            Không
                        </td>
                    </tr>
                    <%} %>
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

</form>
