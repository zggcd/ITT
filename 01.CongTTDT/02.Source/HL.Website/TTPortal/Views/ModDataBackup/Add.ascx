<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModDataBackupModel;
    var entity = ViewBag.Data as ModDataBackupEntity;
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
                <%--<%= GetDefaultAddCommand()%>--%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Backup dữ liệu : <%--<%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%>--%></h2>
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

    <%--<%= ShowMessage()%>--%>
    <dl id="system-message">
        <dd class="message message">
            <ul>
                <li>Backup dữ liệu thành công</li>
            </ul>
        </dd>
    </dl>

    <div id="element-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="col width-100">
                <table class="admintable">
                    <%--<tr>
                        <td class="key">
                            <label>URL :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Url" id="Url" value="<%=entity.Url %>" maxlength="255" />
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

</form>
