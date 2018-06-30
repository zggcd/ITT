<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModDichVuCanhBaoIPModel;
    var entity = ViewBag.Data as ModDichVuCanhBaoIPEntity;
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
            <h2>Dich vu canh bao i p : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                    <label>Chuyên mục :</label>
                </td>
                <td>
                     <select name="MenuID" id="MenuID" class="text_input">
                         <option value="0">Root</option>
                         <%= Utils.ShowDDLMenuByType("DichVuCanhBaoIP", model.LangID, entity.MenuID)%> 
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