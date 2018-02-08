<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModTagModel;
    var entity = ViewBag.Data as ModTagEntity;
%>

<form id="hlForm" name="hlForm" method="post">
<input type="hidden" id="_hl_action" name="_hl_action" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%= GetDefaultAddCommand()%>
        </div>
        <div class="pagetitle icon-48-article">
            <h2>Tags : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                    <input class="text_input" type="text" name="Name" id="Name" value="<%=entity.Name %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Tiêu đề :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Title" id="Title" value="<%=entity.Title %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Từ khóa :</label>
                </td>
                <td>
                    <textarea class="ckeditor" style="height:100px;width:98%" name="Keywords"><%=entity.Keywords%></textarea>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Diễn giải :</label>
                </td>
                <td>
                    <textarea class="ckeditor" style="height:100px;width:98%" name="Description"><%=entity.Description%></textarea>
                </td>
            </tr>
          </table>
        </div>                
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>

</form>