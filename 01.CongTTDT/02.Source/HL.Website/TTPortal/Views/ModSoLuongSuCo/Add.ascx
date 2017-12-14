<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModSoLuongSuCoModel;
    var entity = ViewBag.Data as ModSoLuongSuCoEntity;
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
            <h2>So luong su co : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                    <label>User :</label>
                </td>
                <td>
                     <% List<ModUserEntity> listUser = ModUserService.Instance.CreateQuery().ToList(); %>
                     <select name="UserID" id="UserID" class="text_input">
                         <option value="0">-</option>
                         <%for (int i = 0; listUser != null && i < listUser.Count;i++ ){ %>
                         <option <%if(entity.UserID==listUser[i].ID) {%> selected <%} %> value="<%= listUser[i].ID%>"><%= listUser[i].Name%></option>
                         <%} %>
                    </select>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>User i d1 :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="UserID1" id="UserID1" value="<%=entity.UserID1 %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Bao cao tong hop :</label>
                </td>
                <td>
                     <% List<ModBaoCaoTongHopEntity> listBaoCaoTongHop = ModBaoCaoTongHopService.Instance.CreateQuery().ToList(); %>
                     <select name="BaoCaoTongHopID" id="BaoCaoTongHopID" class="text_input">
                         <option value="0">-</option>
                         <%for (int i = 0; listBaoCaoTongHop != null && i < listBaoCaoTongHop.Count;i++ ){ %>
                         <option <%if(entity.BaoCaoTongHopID==listBaoCaoTongHop[i].ID) {%> selected <%} %> value="<%= listBaoCaoTongHop[i].ID%>"><%= listBaoCaoTongHop[i].Name%></option>
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
                         <%= Utils.ShowDDLMenuByType("SoLuongSuCo", model.LangID, entity.MenuID)%> 
                    </select>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Vị trí :</label>
                </td>
                <td>
                    <%= Utils.ShowCheckBoxByConfigkey("Mod.SoLuongSuCoState", "ArrState", entity.State)%>
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
           <tr>
                <td class="key">
                    <label>So luong :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="SoLuong" id="SoLuong" value="<%=entity.SoLuong %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Tu xu ly :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="TuXuLy" id="TuXuLy" value="<%=entity.TuXuLy %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>To chuc ho tro :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ToChucHoTro" id="ToChucHoTro" value="<%=entity.ToChucHoTro %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>To chuc nuoc ngoai ho tro :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ToChucNuocNgoaiHoTro" id="ToChucNuocNgoaiHoTro" value="<%=entity.ToChucNuocNgoaiHoTro %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>De nghi :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DeNghi" id="DeNghi" value="<%=entity.DeNghi %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Thiet hai uoc tinh :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ThietHaiUocTinh" id="ThietHaiUocTinh" value="<%=entity.ThietHaiUocTinh %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Published1 :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Published1" id="Published1" value="<%=entity.Published1 %>" maxlength="255" />
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