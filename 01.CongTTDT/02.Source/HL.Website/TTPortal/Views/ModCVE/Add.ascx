<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModCVEModel;
    var entity = ViewBag.Data as ModCVEEntity;
%>

<form id="hlForm" name="hlForm" method="post">
    <input type="hidden" id="_hl_action" name="_hl_action" />

    <div id="toolbar-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="toolbar-list" id="toolbar">
                <%= GetDefaultAddCommand()%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>CVE : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
            </div>
            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>
    <div class="clr"></div>

    <%= ShowMessage()%>

    <div id="element-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="col width-100">
                <table class="admintable">
                    <%--            <tr>
                <td class="key">
                    <label>Chuyên mục :</label>
                </td>
                <td>
                     <select name="MenuID" id="MenuID" class="text_input">
                         <option value="0">Root</option>
                         <%= Utils.ShowDDLMenuByType("CVE", model.LangID, entity.MenuID)%> 
                    </select>
                </td>
            </tr>
           <tr>
                <td class="key">
                    <label>Vị trí :</label>
                </td>
                <td>
                    <%= Utils.ShowCheckBoxByConfigkey("Mod.CVEState", "ArrState", entity.State)%>
                </td>
            </tr>--%>
                    <tr>
                        <td class="key">
                            <label>Vulnerability type :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="VulnerabilityType" id="VulnerabilityType" value="<%=entity.VulnerabilityType %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Product :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Product" id="Product" value="<%=entity.Product %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Score :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Score" id="Score" value="<%=entity.Score %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Gained access level :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="GainedAccessLevel" id="GainedAccessLevel" value="<%=entity.GainedAccessLevel %>" maxlength="255" />
                        </td>
                    </tr>
                    <%--<tr>
                        <td class="key">
                            <label>Resolve :</label>
                        </td>
                        <td>
                            <input name="Resolve" <%= entity.Resolve ? "checked" : "" %> type="radio" value='1' />
                            Có
                    <input name="Resolve" <%= !entity.Resolve ? "checked" : "" %> type="radio" value='0' />
                            Không
                        </td>
                    </tr>--%>
                    <%if (CPViewPage.UserPermissions.Approve)
                        {%>
                    <tr>
                        <td class="key">
                            <label>Duyệt :</label>
                        </td>
                        <td>
                            <input name="Activity" <%= entity.Activity ? "checked" : "" %> type="radio" value='1' />
                            Có
                    <input name="Activity" <%= !entity.Activity ? "checked" : "" %> type="radio" value='0' />
                            Không
                        </td>
                    </tr>
                    <%} %>
                </table>
            </div>
            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>

</form>
