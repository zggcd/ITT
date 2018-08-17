<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModDichVuCanhBaoModel;
    var entity = ViewBag.Data as ModDichVuCanhBaoEntity;
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
                <h2>Dịch vụ cảnh báo : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                    <%--                    <tr>
                        <td class="key">
                            <label>Don dang ky u c s c :</label>
                        </td>
                        <td>
                            <% List<ModDonDangKyUCSCEntity> listDonDangKyUCSC = ModDonDangKyUCSCService.Instance.CreateQuery().ToList(); %>
                            <select name="DonDangKyUCSCID" id="DonDangKyUCSCID" class="text_input">
                                <option value="0">-</option>
                                <%for (int i = 0; listDonDangKyUCSC != null && i < listDonDangKyUCSC.Count; i++)
                                    { %>
                                <option <%if (entity.DonDangKyUCSCID == listDonDangKyUCSC[i].ID)
                                    {%> selected <%} %> value="<%= listDonDangKyUCSC[i].ID%>"><%= listDonDangKyUCSC[i].Name%></option>
                                <%} %>
                            </select>
                        </td>
                    </tr>--%>
                    <%--                    <tr>
                        <td class="key">
                            <label>User :</label>
                        </td>
                        <td>
                            <% List<ModUserEntity> listUser = ModUserService.Instance.CreateQuery().ToList(); %>
                            <select name="UserID" id="UserID" class="text_input">
                                <option value="0">-</option>
                                <%for (int i = 0; listUser != null && i < listUser.Count; i++)
                                    { %>
                                <option <%if (entity.UserID == listUser[i].ID)
                                    {%> selected <%} %> value="<%= listUser[i].ID%>"><%= listUser[i].Name%></option>
                                <%} %>
                            </select>
                        </td>
                    </tr>--%>
                    <%--<tr>
                        <td class="key">
                            <label>User i d1 :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="UserID1" id="UserID1" value="<%=entity.UserID1 %>" maxlength="255" />
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="key">
                            <label>Nhận báo cáo theo :</label>
                        </td>
                        <td>
                            <select name="MenuID" id="MenuID" class="text_input">
                                <%= Utils.ShowDDLMenuByType("DichVuCanhBao", model.LangID, entity.MenuID)%>
                            </select>
                        </td>
                    </tr>
                    <%--<tr>
                        <td class="key">
                            <label>Vị trí :</label>
                        </td>
                        <td>
                            <%= Utils.ShowCheckBoxByConfigkey("Mod.DichVuCanhBaoState", "ArrState", entity.State)%>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="key">
                            <label>Tên đơn vị đăng ký :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Name" id="Name" value="<%=entity.Name %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td class="key">
                            <label>Mã :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Code" id="Code" value="<%=entity.Code %>" maxlength="255" />
                        </td>
                    </tr>

                    <tr>
                        <td class="key">
                            <label>Danh sách mail gửi :</label>
                        </td>
                        <td>
                            <textarea style="height: 100px; width: 98%" name="ToEmails"><%=entity.ToEmails%></textarea>
                        </td>
                    </tr>

                    <tr>
                        <td class="key">
                            <label>Danh sách mail Cc :</label>
                        </td>
                        <td>
                            <textarea style="height: 100px; width: 98%" name="CcEmails"><%=entity.CcEmails%></textarea>
                        </td>
                    </tr>

                    <tr>
                        <td class="key">
                            <label>Danh sách IP :</label>
                        </td>
                        <td>
                            <textarea style="height: 100px; width: 98%" name="IPs"><%=entity.IPs%></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Thời gian nhận cảnh báo :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Time" id="Time" value="<%=entity.Time %>" maxlength="255" />
                        </td>
                    </tr>
<%--                    <tr>
                        <td class="key">
                            <label>Ngày tạo :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Published" id="Published" value="<%=entity.Published %>" maxlength="255" />
                        </td>
                    </tr>--%>
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
