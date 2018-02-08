<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl"%>

<form id="hlForm" name="hlForm" method="post">

<input type="hidden" id="_hl_action" name="_hl_action" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%=GetListCommand("apply|Lưu,save|Lưu  &amp; đóng,space,cancel|Đóng")%>
            <div class="clr"></div>
        </div>
        <div class="pagetitle icon-48-generic">
           <h2>Thay đổi thông tin</h2> 
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
                    <label>Họ và Tên :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Name" value="<%=CPViewPage.CurrentUser.Name %>" maxlength="100" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Địa chỉ :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Address" value="<%=CPViewPage.CurrentUser.Address %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Điện thoại :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Phone" value="<%=CPViewPage.CurrentUser.Phone %>" maxlength="50" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Địa chỉ email :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Email" value="<%=CPViewPage.CurrentUser.Email %>" maxlength="100" />
                </td>
            </tr>
          </table>
        </div>                
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>
</form>
