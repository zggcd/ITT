<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModHeThongThongTinModel;
    var entity = ViewBag.Data as ModHeThongThongTinEntity;
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
            <h2>He thong thong tin : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                    <label>Dau moi u c s c :</label>
                </td>
                <td>
                     <% List<ModDauMoiUCSCEntity> listDauMoiUCSC = ModDauMoiUCSCService.Instance.CreateQuery().ToList(); %>
                     <select name="DauMoiUCSCID" id="DauMoiUCSCID" class="text_input">
                         <option value="0">-</option>
                         <%for (int i = 0; listDauMoiUCSC != null && i < listDauMoiUCSC.Count;i++ ){ %>
                         <option <%if(entity.DauMoiUCSCID==listDauMoiUCSC[i].ID) {%> selected <%} %> value="<%= listDauMoiUCSC[i].ID%>"><%= listDauMoiUCSC[i].Name%></option>
                         <%} %>
                    </select>
                </td>
            </tr>
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
                    <label>Chuyên mục :</label>
                </td>
                <td>
                     <select name="MenuID" id="MenuID" class="text_input">
                         <option value="0">Root</option>
                         <%= Utils.ShowDDLMenuByType("HeThongThongTin", model.LangID, entity.MenuID)%> 
                    </select>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Vị trí :</label>
                </td>
                <td>
                    <%= Utils.ShowCheckBoxByConfigkey("Mod.HeThongThongTinState", "ArrState", entity.State)%>
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
                    <label>Mã :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Code" id="Code" value="<%=entity.Code %>" maxlength="255" />
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