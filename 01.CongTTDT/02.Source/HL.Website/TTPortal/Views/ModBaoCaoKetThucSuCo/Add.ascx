<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModBaoCaoKetThucSuCoModel;
    var entity = ViewBag.Data as ModBaoCaoKetThucSuCoEntity;
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
            <h2>Bao cao ket thuc su co : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                    <label>Chuyên mục :</label>
                </td>
                <td>
                     <select name="MenuID" id="MenuID" class="text_input">
                         <option value="0">Root</option>
                         <%= Utils.ShowDDLMenuByType("BaoCaoKetThucSuCo", model.LangID, entity.MenuID)%> 
                    </select>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Vị trí :</label>
                </td>
                <td>
                    <%= Utils.ShowCheckBoxByConfigkey("Mod.BaoCaoKetThucSuCoState", "ArrState", entity.State)%>
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
                    <label>To chuc_ ten :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ToChuc_Ten" id="ToChuc_Ten" value="<%=entity.ToChuc_Ten %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>To chuc_ dia chi :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ToChuc_DiaChi" id="ToChuc_DiaChi" value="<%=entity.ToChuc_DiaChi %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>To chuc_ dien thoai :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ToChuc_DienThoai" id="ToChuc_DienThoai" value="<%=entity.ToChuc_DienThoai %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>To chuc_ email :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ToChuc_Email" id="ToChuc_Email" value="<%=entity.ToChuc_Email %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>So ky hieu :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="SoKyHieu" id="SoKyHieu" value="<%=entity.SoKyHieu %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Ngay bao cao :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="NgayBaoCao" id="NgayBaoCao" value="<%=entity.NgayBaoCao %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Chi tiet_ ten don vi :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ChiTiet_TenDonVi" id="ChiTiet_TenDonVi" value="<%=entity.ChiTiet_TenDonVi %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Chi tiet_ co quan :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ChiTiet_CoQuan" id="ChiTiet_CoQuan" value="<%=entity.ChiTiet_CoQuan %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Chi tiet_ ten he thong :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ChiTiet_TenHeThong" id="ChiTiet_TenHeThong" value="<%=entity.ChiTiet_TenHeThong %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Chi tiet_ phan loai :</label>
                </td>
                <td>
                     <select name="ChiTiet_PhanLoaiID" id="ChiTiet_PhanLoaiID" class="text_input">
                         <option value="0">-</option>
                         <%= Utils.ShowDDLMenuByType2("ChiTiet_PhanLoai", model.LangID, entity.ChiTiet_PhanLoaiID)%> 
                    </select>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Tóm tắt :</label>
                </td>
                <td>
                    <textarea class="text_input" style="height:100px" name="Summary" id="Summary" ><%=entity.Summary %></textarea>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Ngay gio phat hien :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="NgayGioPhatHien" id="NgayGioPhatHien" value="<%=entity.NgayGioPhatHien %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Ket qua :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="KetQua" id="KetQua" value="<%=entity.KetQua %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Files :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Files" id="Files" value="<%=entity.Files %>" maxlength="255" />
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