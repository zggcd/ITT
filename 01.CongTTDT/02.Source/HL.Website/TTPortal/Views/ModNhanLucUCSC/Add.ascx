<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModNhanLucUCSCModel;
    var entity = ViewBag.Data as ModNhanLucUCSCEntity;
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
            <h2>Nhan luc u c s c : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                    <label>Don dang ky u c s c :</label>
                </td>
                <td>
                     <% List<ModDonDangKyUCSCEntity> listDonDangKyUCSC = ModDonDangKyUCSCService.Instance.CreateQuery().ToList(); %>
                     <select name="DonDangKyUCSCID" id="DonDangKyUCSCID" class="text_input">
                         <option value="0">-</option>
                         <%for (int i = 0; listDonDangKyUCSC != null && i < listDonDangKyUCSC.Count;i++ ){ %>
                         <option <%if(entity.DonDangKyUCSCID==listDonDangKyUCSC[i].ID) {%> selected <%} %> value="<%= listDonDangKyUCSC[i].ID%>"><%= listDonDangKyUCSC[i].Name%></option>
                         <%} %>
                    </select>
                </td>
            </tr>
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
                    <label>School :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="School" id="School" value="<%=entity.School %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Menu i ds_ linh vuc d t :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="MenuIDs_LinhVucDT" id="MenuIDs_LinhVucDT" value="<%=entity.MenuIDs_LinhVucDT %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Menu i ds_ trinh do d t :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="MenuIDs_TrinhDoDT" id="MenuIDs_TrinhDoDT" value="<%=entity.MenuIDs_TrinhDoDT %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Menu i ds_ chung chi :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="MenuIDs_ChungChi" id="MenuIDs_ChungChi" value="<%=entity.MenuIDs_ChungChi %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Menu i ds_ quan ly a t t t :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="MenuIDs_QuanLyATTT" id="MenuIDs_QuanLyATTT" value="<%=entity.MenuIDs_QuanLyATTT %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Menu i ds_ ky thuat phong thu :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="MenuIDs_KyThuatPhongThu" id="MenuIDs_KyThuatPhongThu" value="<%=entity.MenuIDs_KyThuatPhongThu %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Menu i ds_ ky thuat bao ve :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="MenuIDs_KyThuatBaoVe" id="MenuIDs_KyThuatBaoVe" value="<%=entity.MenuIDs_KyThuatBaoVe %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Menu i ds_ ky thuat kiem tra :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="MenuIDs_KyThuatKiemTra" id="MenuIDs_KyThuatKiemTra" value="<%=entity.MenuIDs_KyThuatKiemTra %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Thang tot nghiep :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ThangTotNghiep" id="ThangTotNghiep" value="<%=entity.ThangTotNghiep %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Nam tot nghiep :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="NamTotNghiep" id="NamTotNghiep" value="<%=entity.NamTotNghiep %>" maxlength="255" />
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