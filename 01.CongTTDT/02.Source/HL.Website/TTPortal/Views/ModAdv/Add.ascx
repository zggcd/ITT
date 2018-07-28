<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl"%>

<% 
    var model = ViewBag.Model as ModAdvModel;
    var entity = ViewBag.Data as ModAdvEntity;
 %>

<form id="hlForm" name="hlForm" method="post">
<input type="hidden" id="_hl_action" name="_hl_action" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%= GetDefaultAddCommand()%>
        </div>
        <div class="pagetitle icon-48-mediamanager">
            <h2>Quảng cáo/Liên kết : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                    <label>Tên :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Name" value="<%=entity.Name %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Ảnh/Flash :</label>
                </td>
                <td>
                    <%= Utils.GetMedia(entity.File, 100, 80)%>
                    <br />
                    <input class="text_input" type="text" name="File" id="File" value="<%=entity.File %>" style="width:80%;" maxlength="255" />
                    <input class="text_input" style="width:17%;" type="button" onclick="ShowFileForm('File');return false;" value="Chọn File" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Chiều rộng :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Width" value="<%=entity.Width %>" maxlength="50" />
                </td>
            </tr>
             <tr>
                <td class="key">
                    <label>Chiều cao :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Height" value="<%=entity.Height %>" maxlength="50" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Chèn thêm :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="AddInTag" value="<%=entity.AddInTag %>" maxlength="255" />
                </td>
            </tr>
            <%--<tr>
                <td class="key">
                    <label>Link file :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="LinkFile" id="LinkFile" value="<%=entity.LinkFile %>" style="width:80%;" maxlength="255" />
                    <input class="text_input" style="width:17%;" type="button" onclick="ShowFileForm('LinkFile');return false;" value="Chọn File" />
                </td>
            </tr>--%>
             <tr>
                <td class="key">
                    <label>Link file/URL (Ưu tiên link file) :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="LinkFile" id="LinkFile" value="<%=entity.LinkFile %>" style="width:80%;" maxlength="255" />
                    <input class="text_input" style="width:17%;" type="button" onclick="ShowFileForm('LinkFile');return false;" value="Chọn File" />
                    <div style="clear: both; height: 15px;">&nbsp;</div>
                    <input class="text_input" type="text" name="URL" value="<%=entity.URL %>" maxlength="255" />
                </td>
            </tr>
             <tr>
                <td class="key">
                    <label>Target :</label>
                </td>
                <td>
                    <select class="text_input" name="Target">
                       <option value=''></option>
                       <option <%if(entity.Target=="_blank") {%>selected<%} %> value='_blank'>_blank</option>
                       <option <%if(entity.Target=="_parent") {%>selected<%} %> value='_parent'>_parent</option>
                    </select>
                </td>
            </tr>
             <tr>
                <td class="key">
                    <label>Mã code :</label>
                </td>
                <td>
                    <textarea class="text_input" style="height:150px" name="AdvCode"><%=entity.AdvCode%></textarea>
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Chuyên mục :</label>
                </td>
                <td>
                     <select name="MenuID" id="MenuID" class="text_input">
                         <option value="0">Root</option>
                         <%= Utils.ShowDDLMenuByType("Adv", model.LangID, entity.MenuID)%>
                    </select>
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