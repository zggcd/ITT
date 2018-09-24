<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModCVEModel;
    var listEntity = ViewBag.Data as List<ModCVEEntity>;
%>

<form id="hlForm" name="hlForm" method="post">

    <input type="hidden" id="_hl_action" name="_hl_action" />
    <input type="hidden" id="boxchecked" name="boxchecked" value="0" />

    <div id="toolbar-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="toolbar-list" id="toolbar">
                <ul style="float: left; padding-right: 15px;">
                    <li id="toolbar-apply" class="button">
                        <a class="toolbar" href="<%=CPViewPage.Request.RawUrl.Replace("Index.aspx","Import.aspx") %>"><span
                            title="Nhập Excel" class="icon-32-fileimport"></span>Nhập File</a>
                    </li>
                </ul>
                <%=GetDefaultListCommand()%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>CVE</h2>
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

    <script type="text/javascript">

        var HLController = 'ModCVE';

        var HLArrVar = [
            'filter_state', 'State',
            'filter_menu', 'MenuID',
            'filter_lang', 'LangID',
            'limit', 'PageSize'
        ];


        var HLArrQT = [
                      '<%= model.PageIndex + 1 %>', 'PageIndex', 
                      '<%= model.Sort %>', 'Sort'
        ];

        var HLArrDefault =
            [
                '1', 'PageIndex',
                '1', 'LangID',
                '20', 'PageSize'
            ];
    </script>

    <%= ShowMessage()%>

    <div id="element-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">

            <table>
                <tr>
                    <td width="100%"></td>
                    <td nowrap="nowrap">
                        <%--Chuyên mục : 
                    <select id="filter_menu" onchange="HLRedirect()" class="inputbox" size="1">
                        <option value="0">(Tất cả)</option>
                        <%= Utils.ShowDDLMenuByType("CVE", model.LangID, model.MenuID)%>
                    </select>--%>
                        <%--Vị trí :
                   <select id="filter_state" onchange="HLRedirect()" class="inputbox" size="1">
                       <option value="0">(Tất cả)</option>
                       <%= Utils.ShowDDLByConfigkey("Mod.CVEState", model.State)%>
                   </select>--%>
                        Ngôn ngữ :<%= ShowDDLLang(model.LangID)%>
                    </td>
                </tr>
            </table>

            <table class="adminlist" cellspacing="1">
                <thead>
                    <tr>
                        <th width="1%">#
                        </th>
                        <th width="1%">
                            <input type="checkbox" name="toggle" value="" onclick="checkAll(<%= model.PageSize %>);" />
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("ID", "ID")%>
                        </th>
                        <%--<th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Chuyên mục", "MenuID")%>
                        </th>--%>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Vulnerability type", "VulnerabilityType")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Product", "Product")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Score", "Score")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Gained access level", "GainedAccessLevel")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Xuất bản", "Published")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Ngày sửa", "Updated")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Thứ tự", "Order")%>
                            <a href="javascript:hl_exec_cmd('saveorder')" class="saveorder" title="Lưu sắp xếp"></a>
                        </th>
                        <%--<th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Resolve", "Resolve")%>
                        </th>--%>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Duyệt", "Activity")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <span>Gửi mail</span>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Lần gửi", "EmailNo")%>
                        </th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <td colspan="15">
                            <del class="container">
                                <%= GetPagination(model.PageIndex, model.PageSize, model.TotalRecord)%>
                            </del>
                        </td>
                    </tr>
                </tfoot>
                <tbody>
                    <%for (int i = 0; listEntity != null && i < listEntity.Count; i++)
                        { %>
                    <tr class="row<%= i%2 %>">
                        <td align="center">
                            <%= i + 1%>
                        </td>
                        <td align="center">
                            <%= GetCheckbox(listEntity[i].ID, i)%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ID%>
                        </td>
                        <%--<td align="center">
                            <%= GetName(listEntity[i].getMenu()) %>
                        </td>--%>
                        <td align="center">
                            <%= listEntity[i].VulnerabilityType%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Product%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Score%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].GainedAccessLevel%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].Published) %>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].Updated) %>
                        </td>
                        <td class="order">
                            <%= GetOrder(listEntity[i].ID, listEntity[i].Order)%>
                        </td>
                        <%--<td align="center">
                            <a class="jgrid" href="javascript:void(0);" onclick="hl_exec_cmd('[resolvegx][<%= listEntity[i].ID %>,<%= !listEntity[i].Resolve %>]')">
                                <span class="jgrid">
                                    <span class="state <%= listEntity[i].Resolve ? "publish" : "unpublish" %>"></span>
                                </span>
                            </a>
                        </td>--%>
                        <td align="center">
                            <%= GetPublish(listEntity[i].ID, listEntity[i].Activity)%>
                        </td>
                        <td align="center">
                            <a href="javascript:HLRedirect('SendMail', <%= listEntity[i].ID %>)" title="Gửi email các CVE phù hợp">
                                <img src="/{CPPath}/Content/add/img/email.png" />
                            </a>
                        </td>
                        <td align="right">
                            <%= string.Format("{0:#,##0}", listEntity[i].EmailNo)%>
                        </td>
                    </tr>
                    <%} %>
                </tbody>
            </table>

            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>

</form>
