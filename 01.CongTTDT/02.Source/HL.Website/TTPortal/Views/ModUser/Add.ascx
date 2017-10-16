<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModUserModel;
    var entity = ViewBag.Data as ModUserEntity;
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
                <%= GetDefaultAddCommand()%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>User : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                            <label>Tên :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Name" id="Name" value="<%=entity.Name %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Mã :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Code" id="Code" value="<%=entity.Code %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Chức vụ :</label>
                        </td>
                        <td>
                            <select name="MenuID" id="MenuID" class="text_input">
                                <option value="0">Root</option>
                                <%= Utils.ShowDDLMenuByType("ChucVu", model.LangID, entity.MenuID)%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Cơ quan :</label>
                        </td>
                        <td>
                            <% List<ModCoQuanEntity> listCoQuan = ModCoQuanService.Instance.CreateQuery().ToList(); %>
                            <select name="CoQuanID" id="CoQuanID" class="text_input">
                                <option value="0">-</option>
                                <%for (int i = 0; listCoQuan != null && i < listCoQuan.Count; i++)
                                    { %>
                                <option <%if (entity.CoQuanID == listCoQuan[i].ID)
                                    {%> selected <%} %> value="<%= listCoQuan[i].ID%>"><%= listCoQuan[i].Name%></option>
                                <%} %>
                            </select>
                        </td>
                    </tr>
                    <tr>
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
                            <label>Email :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Email" id="Email" value="<%=entity.Email %>" maxlength="255" />
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
