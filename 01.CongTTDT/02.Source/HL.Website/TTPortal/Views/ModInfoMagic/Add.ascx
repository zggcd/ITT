<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModInfoMagicModel;
    var entity = ViewBag.Data as ModInfoMagicEntity;
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
            <h2>Info magic : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                    <label>Bao cao ban dau su co :</label>
                </td>
                <td>
                     <% List<ModBaoCaoBanDauSuCoEntity> listBaoCaoBanDauSuCo = ModBaoCaoBanDauSuCoService.Instance.CreateQuery().ToList(); %>
                     <select name="BaoCaoBanDauSuCoID" id="BaoCaoBanDauSuCoID" class="text_input">
                         <option value="0">-</option>
                         <%for (int i = 0; listBaoCaoBanDauSuCo != null && i < listBaoCaoBanDauSuCo.Count;i++ ){ %>
                         <option <%if(entity.BaoCaoBanDauSuCoID==listBaoCaoBanDauSuCo[i].ID) {%> selected <%} %> value="<%= listBaoCaoBanDauSuCo[i].ID%>"><%= listBaoCaoBanDauSuCo[i].Name%></option>
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
                         <%= Utils.ShowDDLMenuByType("InfoMagic", model.LangID, entity.MenuID)%> 
                    </select>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Vị trí :</label>
                </td>
                <td>
                    <%= Utils.ShowCheckBoxByConfigkey("Mod.InfoMagicState", "ArrState", entity.State)%>
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