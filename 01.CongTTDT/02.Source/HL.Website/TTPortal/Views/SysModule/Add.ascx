<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl"%>

<% 
    var model = ViewBag.Model as SysModuleModel;
    var entity = ViewBag.Data as SysModuleEntity;
 %>

<form id="hlForm" name="hlForm" method="post">

<input type="hidden" id="_hl_action" name="_hl_action" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
       <div class="toolbar-list" id="toolbar">
            <%=GetDefaultAddCommand()%>
        </div>
        <div class="pagetitle icon-48-plugin">
            <h2>Chức năng : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                    <label>Tên chức năng :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Name" value="<%=entity.Name %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Mã :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Code" value="<%=entity.Code %>" maxlength="255" />
                </td>
            </tr>
             <tr>
                <td class="key">
                    <label>Layout :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Layout" value="<%=entity.Layout %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Type Name :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="TypeName" value="<%=entity.TypeName %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Assembly Name :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="AssemblyName" value="<%=entity.AssemblyName %>" maxlength="255" />
                </td>
            </tr>
             <tr>
                <td class="key">
                    <label>Loại :</label>
                </td>
                <td>
                    <select class="text_input" name="Type">
                       <option <%if(entity.Type=="MODULE") {%>selected<%} %> value='MODULE'> MODULE</option>
                       <option <%if(entity.Type=="CONTROL") {%>selected<%} %> value='CONTROL'> CONTROL</option>
                    </select>
                </td>
            </tr>
          </table>

        </div>                
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>

</form>