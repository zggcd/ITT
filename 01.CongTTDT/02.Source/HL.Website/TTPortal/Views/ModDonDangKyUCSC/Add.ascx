<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModDonDangKyUCSCModel;
    var entity = ViewBag.Data as ModDonDangKyUCSCEntity;
%>

<script type="text/javascript" src="/{CPPath}/Content/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
    CKFinder.setupCKEditor(null, '/{CPPath}/Content/ckfinder/');
</script>

<form id="hlForm" name="hlForm" method="post">
<input type="hidden" id="_hl_action" name="_hl_action" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%= GetDefaultAddCommand()%>
        </div>
        <div class="pagetitle icon-48-generic">
            <h2>Don dang ky u c s c : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                         <%= Utils.ShowDDLMenuByType("DonDangKyUCSC", model.LangID, entity.MenuID)%> 
                    </select>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Vị trí :</label>
                </td>
                <td>
                    <%= Utils.ShowCheckBoxByConfigkey("Mod.DonDangKyUCSCState", "ArrState", entity.State)%>
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
                    <label>To chuc_ fax :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ToChuc_Fax" id="ToChuc_Fax" value="<%=entity.ToChuc_Fax %>" maxlength="255" />
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
                    <label>Nội dung :</label>
                </td>
                <td class="content">
                    <textarea class="ckeditor" style="width:100%;height:500px" name="Content" id="Content"><%=entity.Content%></textarea>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>He thong thong tin i ds :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="HeThongThongTinIDs" id="HeThongThongTinIDs" value="<%=entity.HeThongThongTinIDs %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Ảnh :</label>
                </td>
                <td>
                    <%= Utils.GetMedia(entity.File, 100, 80)%> <br />
                    <input class="text_input" type="text" name="File" id="File" style="width:80%;" value="<%=entity.File %>" maxlength="255" />
                    <input class="text_input" style="width:17%;" type="button" onclick="ShowFileForm('File');return false;" value="Chọn File" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Thong tin l l_ web :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ThongTinLL_Web" id="ThongTinLL_Web" value="<%=entity.ThongTinLL_Web %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Thong tin l l_ thu d t_ ten :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ThongTinLL_ThuDT_Ten" id="ThongTinLL_ThuDT_Ten" value="<%=entity.ThongTinLL_ThuDT_Ten %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Thong tin l l_ thu d t_ fingerprint :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ThongTinLL_ThuDT_Fingerprint" id="ThongTinLL_ThuDT_Fingerprint" value="<%=entity.ThongTinLL_ThuDT_Fingerprint %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Thong tin l l_ thu d t_ link to public key :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ThongTinLL_ThuDT_LinkToPublicKey" id="ThongTinLL_ThuDT_LinkToPublicKey" value="<%=entity.ThongTinLL_ThuDT_LinkToPublicKey %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Dau moi l l_ trong gio_ ten :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DauMoiLL_TrongGio_Ten" id="DauMoiLL_TrongGio_Ten" value="<%=entity.DauMoiLL_TrongGio_Ten %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Dau moi l l_ trong gio_ dien thoai :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DauMoiLL_TrongGio_DienThoai" id="DauMoiLL_TrongGio_DienThoai" value="<%=entity.DauMoiLL_TrongGio_DienThoai %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Dau moi l l_ trong gio_ dien thoai d d :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DauMoiLL_TrongGio_DienThoaiDD" id="DauMoiLL_TrongGio_DienThoaiDD" value="<%=entity.DauMoiLL_TrongGio_DienThoaiDD %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Dau moi l l_ trong gio_ fax :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DauMoiLL_TrongGio_Fax" id="DauMoiLL_TrongGio_Fax" value="<%=entity.DauMoiLL_TrongGio_Fax %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Dau moi l l_ ngoai gio_ ten :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DauMoiLL_NgoaiGio_Ten" id="DauMoiLL_NgoaiGio_Ten" value="<%=entity.DauMoiLL_NgoaiGio_Ten %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Dau moi l l_ ngoai gio_ dien thoai :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DauMoiLL_NgoaiGio_DienThoai" id="DauMoiLL_NgoaiGio_DienThoai" value="<%=entity.DauMoiLL_NgoaiGio_DienThoai %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Dau moi l l_ ngoai gio_ dien thoai d d :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DauMoiLL_NgoaiGio_DienThoaiDD" id="DauMoiLL_NgoaiGio_DienThoaiDD" value="<%=entity.DauMoiLL_NgoaiGio_DienThoaiDD %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Dau moi l l_ ngoai gio_ fax :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DauMoiLL_NgoaiGio_Fax" id="DauMoiLL_NgoaiGio_Fax" value="<%=entity.DauMoiLL_NgoaiGio_Fax %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Dau moi lanh dao_ ten :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DauMoiLanhDao_Ten" id="DauMoiLanhDao_Ten" value="<%=entity.DauMoiLanhDao_Ten %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Dau moi lanh dao_ dien thoai :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DauMoiLanhDao_DienThoai" id="DauMoiLanhDao_DienThoai" value="<%=entity.DauMoiLanhDao_DienThoai %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Dau moi lanh dao_ dien thoai d d :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DauMoiLanhDao_DienThoaiDD" id="DauMoiLanhDao_DienThoaiDD" value="<%=entity.DauMoiLanhDao_DienThoaiDD %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>D c nhan thu_ ten bo phan :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DCNhanThu_TenBoPhan" id="DCNhanThu_TenBoPhan" value="<%=entity.DCNhanThu_TenBoPhan %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>D c nhan thu_ vi tri :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DCNhanThu_ViTri" id="DCNhanThu_ViTri" value="<%=entity.DCNhanThu_ViTri %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>D c nhan thu_ ten to chuc :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DCNhanThu_TenToChuc" id="DCNhanThu_TenToChuc" value="<%=entity.DCNhanThu_TenToChuc %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>D c nhan thu_ dia chi :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DCNhanThu_DiaChi" id="DCNhanThu_DiaChi" value="<%=entity.DCNhanThu_DiaChi %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>D c nhan thu_ dien thoai :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="DCNhanThu_DienThoai" id="DCNhanThu_DienThoai" value="<%=entity.DCNhanThu_DienThoai %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>L l khac_ yahoo :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="LLKhac_Yahoo" id="LLKhac_Yahoo" value="<%=entity.LLKhac_Yahoo %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>L l khac_ skype :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="LLKhac_Skype" id="LLKhac_Skype" value="<%=entity.LLKhac_Skype %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>L l khac_ google talk :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="LLKhac_GoogleTalk" id="LLKhac_GoogleTalk" value="<%=entity.LLKhac_GoogleTalk %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>L l khac_ hotmail :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="LLKhac_Hotmail" id="LLKhac_Hotmail" value="<%=entity.LLKhac_Hotmail %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>L l khac_ khac :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="LLKhac_Khac" id="LLKhac_Khac" value="<%=entity.LLKhac_Khac %>" maxlength="255" />
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