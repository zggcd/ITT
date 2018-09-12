<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModSendMailLogsModel;
    var entity = ViewBag.Data as ModSendMailLogsEntity;
%>

<form id="hlForm" name="hlForm" method="post">
<input type="hidden" id="_hl_action" name="_hl_action" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%= GetDefaultAddCommand()%>
        </div>
        <div class="pagetitle icon-48-generic">
            <h2>Send mail logs : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
        </div>
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>
<div class="clr"></div>

<%= ShowMessage()%>

<div id="element-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="col width-100">
          <table class="admintable">
            <tr>
                <td class="key">
                    <label>Dich vu canh bao :</label>
                </td>
                <td>
                     <% List<ModDichVuCanhBaoEntity> listDichVuCanhBao = ModDichVuCanhBaoService.Instance.CreateQuery().ToList(); %>
                     <select name="DichVuCanhBaoID" id="DichVuCanhBaoID" class="text_input">
                         <option value="0">-</option>
                         <%for (int i = 0; listDichVuCanhBao != null && i < listDichVuCanhBao.Count;i++ ){ %>
                         <option <%if(entity.DichVuCanhBaoID==listDichVuCanhBao[i].ID) {%> selected <%} %> value="<%= listDichVuCanhBao[i].ID%>"><%= listDichVuCanhBao[i].Name%></option>
                         <%} %>
                    </select>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Incident i ds :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="IncidentIDs" id="IncidentIDs" value="<%=entity.IncidentIDs %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Email from :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="EmailFrom" id="EmailFrom" value="<%=entity.EmailFrom %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Email to :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="EmailTo" id="EmailTo" value="<%=entity.EmailTo %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Email cc :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="EmailCc" id="EmailCc" value="<%=entity.EmailCc %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Email bcc :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="EmailBcc" id="EmailBcc" value="<%=entity.EmailBcc %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Attach file path :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="AttachFilePath" id="AttachFilePath" value="<%=entity.AttachFilePath %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Subject :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Subject" id="Subject" value="<%=entity.Subject %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Body :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Body" id="Body" value="<%=entity.Body %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Xuất bản :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Publish" id="Publish" value="<%=entity.Publish %>" maxlength="255" />
                </td>
            </tr>
            <%if(CPViewPage.UserPermissions.Approve) {%>
            <tr>
                <td class="key">
                    <label>Duyệt :</label>
                </td>
                <td>
                    <input name="Activity" <%= entity.Activity ? "checked" : "" %> type="radio" value='1' /> Có
                    <input name="Activity" <%= !entity.Activity ? "checked" : "" %> type="radio" value='0' /> Không
                </td>
            </tr>
            <%} %>
          </table>
        </div>                
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>

</form>