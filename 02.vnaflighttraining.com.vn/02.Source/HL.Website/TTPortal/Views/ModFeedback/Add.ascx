<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl"%>

<% 
    var model = ViewBag.Model as ModFeedbackModel;
    var entity = ViewBag.Data as ModFeedbackEntity;
 %>

<form id="hlForm" name="hlForm" method="post">

<input type="hidden" id="_hl_action" name="_hl_action" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%=GetListCommand("cancel|Đóng")%>
        </div>
        <div class="pagetitle icon-48-massmail">
            <h2>Liên hệ : Xem</h2> 
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
                    <label>Họ và tên :</label>
                </td>
                <td>
                    <%=entity.Name %>
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Địa chỉ :</label>
                </td>
                <td>
                    <%=entity.Address %>
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Điện thoại :</label>
                </td>
                <td>
                    <%=entity.Phone %>
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Di động :</label>
                </td>
                <td>
                    <%=entity.Mobile %>
                </td>
            </tr>
             <tr>
                <td class="key">
                    <label>Email :</label>
                </td>
                <td>
                    <%=entity.Email %>
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Tiêu đề :</label>
                </td>
                <td>
                    <%=entity.Title %>
                </td>
            </tr>
             <tr>
                <td class="key">
                    <label>Nội dung :</label>
                </td>
                <td>
                    <%if (!string.IsNullOrEmpty(entity.Content)){ %>
                       <%=entity.Content.Replace("\n","<br />") %>
                    <%} %>
                </td>
            </tr>
             <tr>
                <td class="key">
                    <label>IP :</label>
                </td>
                <td>
                   <%=entity.IP %>
                </td>
            </tr>
             <tr>
                <td class="key">
                    <label>Ngày gửi :</label>
                </td>
                <td>
                   <%=string.Format("{0:dd/MM/yyyy HH:mm}", entity.Created) %>
                </td>
            </tr>
          </table>
        </div>                
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>

</form>