<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModBaoCaoTongHopModel;
    var entity = ViewBag.Data as ModBaoCaoTongHopEntity;
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
                <h2>Báo cáo tổng hợp : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                            <label>User :</label>
                        </td>
                        <td>
                            <% List<CPUserEntity> listUser = CPUserService.Instance.CreateQuery().ToList(); %>
                            <select name="UserID" id="UserID" class="text_input">
                                <option value="0">-</option>
                                <%for (int i = 0; listUser != null && i < listUser.Count; i++)
                                    { %>
                                <option <%if (entity.UserID == listUser[i].ID)
                                    {%>
                                    selected <%} %> value="<%= listUser[i].ID%>"><%= listUser[i].Name%></option>
                                <%} %>
                            </select>
                        </td>
                    </tr>
                    <%--<tr>
                        <td class="key">
                            <label>User i d1 :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="UserID1" id="UserID1" value="<%=entity.UserID1 %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Chuyên mục :</label>
                        </td>
                        <td>
                            <select name="MenuID" id="MenuID" class="text_input">
                                <option value="0">Root</option>
                                <%= Utils.ShowDDLMenuByType("BaoCaoTongHop", model.LangID, entity.MenuID)%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Vị trí :</label>
                        </td>
                        <td>
                            <%= Utils.ShowCheckBoxByConfigkey("Mod.BaoCaoTongHopState", "ArrState", entity.State)%>
                        </td>
                    </tr>--%>
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
                            <label>Từ tháng :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="TuNgay" id="TuNgay" value="<%=entity.TuNgay %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Đến tháng :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="DenNgay" id="DenNgay" value="<%=entity.DenNgay %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Tên cơ quan/tổ chức :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="TenToChuc" id="TenToChuc" value="<%=entity.TenToChuc %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Địa chỉ :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="DiaChi" id="DiaChi" value="<%=entity.DiaChi %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Mã thành viên mạng lưới :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="MaThanhVien" id="MaThanhVien" value="<%=entity.MaThanhVien %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Danh sách các tổ chức hỗ trợ xử lý sự cố :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="ToChucHoTro" id="ToChucHoTro" value="<%=entity.DSToChucHoTro %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Danh sách các tổ chức nước ngoài hỗ trợ xử lý sự cố :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="ToChucNuocNgoaiHoTro" id="ToChucNuocNgoaiHoTro" value="<%=entity.DSToChucNuocNgoaiHoTro %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Đề xuất kiến nghị :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="DeXuat" id="DeXuat" value="<%=entity.DeXuat %>" maxlength="255" />
                        </td>
                    </tr>
                    <%--<tr>
                        <td class="key">
                            <label>Published1 :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Published1" id="Published1" value="<%=entity.Published1 %>" maxlength="255" />
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
