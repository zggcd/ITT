<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModIncidentModel;
    var listEntity = ViewBag.Data as List<ModIncidentEntity>;
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
                        <a class="toolbar" href="<%=CPViewPage.Request.RawUrl.Replace("Index.aspx","Export.aspx") %>">
                            <span title="In Excel" class="icon-32-excel"></span>Xuất Excel</a>
                    </li>

                    <li id="toolbar-apply" class="button"><a class="toolbar" href="<%=CPViewPage.Request.RawUrl.Replace("Index.aspx","Import.aspx") %>"><span
                        title="In Excel" class="icon-32-excel"></span>Nhập Excel</a></li>
                </ul>
                <%=GetDefaultListCommand()%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Incident</h2>
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

        var HLController = 'ModIncident';

        var HLArrVar = [
            'filter_state', 'State',
            'filter_menu', 'MenuID',
            'filter_lang', 'LangID',
            'limit', 'PageSize'
        ];


        var HLArrVar_QS = [
            'filter_search', 'SearchText'
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
                    <td width="100%">Lọc:
                        <input type="text" id="filter_search" value="<%= model.SearchText %>" class="text_area" onchange="HLRedirect();return false;" />
                        <button onclick="HLRedirect();return false;">Tìm kiếm</button>
                    </td>
                    <td nowrap="nowrap">Chuyên mục : 
                    <select id="filter_menu" onchange="HLRedirect()" class="inputbox" size="1">
                        <option value="0">(Tất cả)</option>
                        <%= Utils.ShowDDLMenuByType("Incident", model.LangID, model.MenuID)%>
                    </select>
                        Vị trí :
                   <select id="filter_state" onchange="HLRedirect()" class="inputbox" size="1">
                       <option value="0">(Tất cả)</option>
                       <%= Utils.ShowDDLByConfigkey("Mod.IncidentState", model.State)%>
                   </select>
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
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Domain/URL", "Url")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("IP", "IP")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("ISP", "ISP")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Thời gian", "AttackOn")%>
                        </th>

                        <%--<th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Chuyên mục", "MenuID")%>
                        </th>
                        <th class="title">
                            <%= GetSortLink("Tên", "Name")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Mã", "Code")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Path", "Path")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Fake destination", "FakeDestination")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Source", "Source")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Email no", "EmailNo")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Attacker", "Attacker")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Malware name", "MalwareName")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Attacker i p", "AttackerIP")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Network name", "NetworkName")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Local i p", "LocalIP")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Local t c p port", "LocalTCPPort")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Timestamp", "Timestamp")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("A s n", "ASN")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Geo", "Geo")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Loại", "Type")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Http agent", "HttpAgent")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Src port", "SrcPort")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Host name", "HostName")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Destinationport", "Destinationport")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Protocol", "Protocol")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Server name", "ServerName")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Server", "Server")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Header", "Header")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Tag", "Tag")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Region", "Region")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Tỉnh thành", "City")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Sector", "Sector")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Xuất bản", "Published")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Thứ tự", "Order")%>
                            <a href="javascript:hl_exec_cmd('saveorder')" class="saveorder" title="Lưu sắp xếp"></a>
                        </th>--%>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Duyệt", "Activity")%>
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
                        <td align="center">
                            <%= listEntity[i].Url%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].IP%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ISP%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].AttackOn) %>
                        </td>

                        <%--<td align="center">
                            <%= GetName(listEntity[i].getMenu()) %>
                        </td>
                        <td>
                            <a href="javascript:HLRedirect('Add', <%= listEntity[i].ID %>)"><%= listEntity[i].Name%></a>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Code%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Path%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].FakeDestination%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Source%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:#,##0}", listEntity[i].EmailNo)%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Attacker%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].MalwareName%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].AttackerIP%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].NetworkName%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].LocalIP%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:#,##0}", listEntity[i].LocalTCPPort)%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].Timestamp) %>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ASN%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Geo%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:#,##0}", listEntity[i].Type)%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].HttpAgent%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:#,##0}", listEntity[i].SrcPort)%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].HostName%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:#,##0}", listEntity[i].Destinationport)%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:#,##0}", listEntity[i].Protocol)%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ServerName%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Server%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Header%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Tag%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Region%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].City%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Sector%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].Published) %>
                        </td>
                        <td class="order">
                            <%= GetOrder(listEntity[i].ID, listEntity[i].Order)%>
                        </td>--%>
                        <td align="center">
                            <%= GetPublish(listEntity[i].ID, listEntity[i].Activity)%>
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
