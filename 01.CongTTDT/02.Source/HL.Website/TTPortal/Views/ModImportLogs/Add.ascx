<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModImportLogsModel;
    var entity = ViewBag.Data as ModImportLogsEntity;
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
            <h2>Import logs : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                    <label>Chuyên mục :</label>
                </td>
                <td>
                     <select name="MenuID" id="MenuID" class="text_input">
                         <option value="0">Root</option>
                         <%= Utils.ShowDDLMenuByType("ImportLogs", model.LangID, entity.MenuID)%> 
                    </select>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>File name :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="FileName" id="FileName" value="<%=entity.FileName %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Messages :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Messages" id="Messages" value="<%=entity.Messages %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Error rows :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ErrorRows" id="ErrorRows" value="<%=entity.ErrorRows %>" maxlength="255" />
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
          </table>
        </div>                
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>

</form>