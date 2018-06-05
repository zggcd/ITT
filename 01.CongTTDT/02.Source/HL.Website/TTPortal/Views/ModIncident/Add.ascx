<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModIncidentModel;
    var entity = ViewBag.Data as ModIncidentEntity;
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
            <h2>Incident : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                    <label>Chuyên mục :</label>
                </td>
                <td>
                     <select name="MenuID" id="MenuID" class="text_input">
                         <option value="0">Root</option>
                         <%= Utils.ShowDDLMenuByType("Incident", model.LangID, entity.MenuID)%> 
                    </select>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Vị trí :</label>
                </td>
                <td>
                    <%= Utils.ShowCheckBoxByConfigkey("Mod.IncidentState", "ArrState", entity.State)%>
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
                    <label>Path :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Path" id="Path" value="<%=entity.Path %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Fake destination :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="FakeDestination" id="FakeDestination" value="<%=entity.FakeDestination %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Source :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Source" id="Source" value="<%=entity.Source %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Attack on :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="AttackOn" id="AttackOn" value="<%=entity.AttackOn %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>I p :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="IP" id="IP" value="<%=entity.IP %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>I s p :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ISP" id="ISP" value="<%=entity.ISP %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Email no :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="EmailNo" id="EmailNo" value="<%=entity.EmailNo %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Attacker :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Attacker" id="Attacker" value="<%=entity.Attacker %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Malware name :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="MalwareName" id="MalwareName" value="<%=entity.MalwareName %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Attacker i p :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="AttackerIP" id="AttackerIP" value="<%=entity.AttackerIP %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Network name :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="NetworkName" id="NetworkName" value="<%=entity.NetworkName %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Local i p :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="LocalIP" id="LocalIP" value="<%=entity.LocalIP %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Local t c p port :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="LocalTCPPort" id="LocalTCPPort" value="<%=entity.LocalTCPPort %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Timestamp :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Timestamp" id="Timestamp" value="<%=entity.Timestamp %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>A s n :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ASN" id="ASN" value="<%=entity.ASN %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Geo :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Geo" id="Geo" value="<%=entity.Geo %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>URL :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Url" id="Url" value="<%=entity.Url %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Loại :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Type" id="Type" value="<%=entity.Type %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Http agent :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="HttpAgent" id="HttpAgent" value="<%=entity.HttpAgent %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Src port :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="SrcPort" id="SrcPort" value="<%=entity.SrcPort %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Host name :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="HostName" id="HostName" value="<%=entity.HostName %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Destinationport :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Destinationport" id="Destinationport" value="<%=entity.Destinationport %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Protocol :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Protocol" id="Protocol" value="<%=entity.Protocol %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Server name :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="ServerName" id="ServerName" value="<%=entity.ServerName %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Server :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Server" id="Server" value="<%=entity.Server %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Header :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Header" id="Header" value="<%=entity.Header %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Tag :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Tag" id="Tag" value="<%=entity.Tag %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Region :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Region" id="Region" value="<%=entity.Region %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Tỉnh thành :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="City" id="City" value="<%=entity.City %>" maxlength="255" />
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Sector :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Sector" id="Sector" value="<%=entity.Sector %>" maxlength="255" />
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