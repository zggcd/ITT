<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModIncidentModel;
    var listEntity = ViewBag.Data as List<ModIncidentEntity>;
%>

<link rel="stylesheet" type="text/css" href="/Content/css/jquery.datetimepicker.css" />
<script src="/Content/js/datetime/jquery.js"></script>

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
                        <a class="toolbar" href="<%=CPViewPage.Request.RawUrl.Replace("Index.aspx","Export.aspx") %>">
                            <span title="Xuất Excel" class="icon-32-fileexport"></span>Xuất File</a>
                    </li>
                </ul>
                <%=GetDefaultListCommand()%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Quản lý sự cố</h2>
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

    <style>
        .gr {
            padding-left: 10px;
        }
    </style>

    <script type="text/javascript">
        var HLController = 'ModIncident';

        var HLArrVar = [
            'filter_state', 'State',
            'filter_menu', 'MenuID',
            'filter_lang', 'LangID',
            'limit', 'PageSize',

            'filter_isp', 'ISPState',
            'filter_domain', 'DomainState',
            'filter_virus', 'VirusState',
            'filter_member', 'MemberID',
            'filter_from', 'From',
            'filter_to', 'To'
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
                    <td width="100%">
                        <%--<span>Lọc:</span>
                        <input type="text" id="filter_search" value="<%= model.SearchText %>" class="text_area" onchange="HLRedirect();return false;" />
                        <button onclick="HLRedirect();return false;">Tìm kiếm</button>--%>
                        <p>
                            <span>Từ ngày:</span>
                            <input type="text" id="filter_from" name="From" value="<%=string.Format("{0:dd-MM-yyyy}",  model.From) %>" class="text_area" />
                            <span>Đến ngày:</span>
                            <input type="text" id="filter_to" name="To" value="<%=string.Format("{0:dd-MM-yyyy}",  model.To) %>" class="text_area" />

                            <span class="gr">Thành viên:</span>
                            <select id="filter_member" onchange="HLRedirect()" class="inputbox" size="1">
                                <option value="0">(Tất cả)</option>
                            </select>
                        </p>

                        <p>
                            <span>ISP bị tấn công:</span>
                            <select id="filter_isp" onchange="HLRedirect()" class="inputbox" size="1">
                                <option value="0">(Tất cả)</option>
                                <%= Utils.ShowDDLByConfigkey("Mod.CommonState", model.ISPState)%>
                            </select>

                            <span class="gr">Domain bị tấn công:</span>
                            <select id="filter_domain" onchange="HLRedirect()" class="inputbox" size="1">
                                <option value="0">(Tất cả)</option>
                                <%= Utils.ShowDDLByConfigkey("Mod.CommonState", model.DomainState)%>
                            </select>

                            <span class="gr">Virus xuất hiện:</span>
                            <select id="filter_virus" onchange="HLRedirect()" class="inputbox" size="1">
                                <option value="0">(Tất cả)</option>
                                <%= Utils.ShowDDLByConfigkey("Mod.CommonState", model.VirusState)%>
                            </select>
                        </p>
                    </td>
                    <td nowrap="nowrap">
                        <span>Loại sự cố:</span>
                        <select id="filter_menu" onchange="HLRedirect()" class="inputbox" size="1">
                            <option value="0">(Tất cả)</option>
                            <%= Utils.ShowDDLMenuByType2("Incident", model.LangID, model.MenuID)%>
                        </select>
                        <%--Vị trí :
                       <select id="filter_state" onchange="HLRedirect()" class="inputbox" size="1">
                           <option value="0">(Tất cả)</option>
                           <%= Utils.ShowDDLByConfigkey("Mod.IncidentState", model.State)%>
                       </select>--%>
                        <span>Ngôn ngữ:</span><%= ShowDDLLang(model.LangID)%>
                    </td>
                </tr>
                <tr>
                    <td width="100%">
                        <button onclick="HLRedirect();return false;">Tìm kiếm</button>
                    </td>
                </tr>
            </table>

            <table class="adminlist" cellspacing="1">
                <thead>
                    <tr>
                        <th width="1%">#</th>
                        <th width="1%">
                            <input type="checkbox" name="toggle" value="" onclick="checkAll(<%= model.PageSize %>);" />
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("PID", "ID")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("Loại sự cố", "MenuID")%>
                        </th>
                        <th width="10%" nowrap="nowrap">
                            <%= GetSortLink("Domain/URL", "Path")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("IP", "IP")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("ISP", "ISP")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("Thời gian", "AttackOn")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Tồn tại", "Resolve")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <span>Gửi mail</span>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Lần gửi", "EmailNo")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Duyệt", "Activity")%>
                        </th>

                        <%--<th class="title">
                            <%= GetSortLink("Tên", "Name")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Mã", "Code")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Path", "Url")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Fake destination", "FakeDestination")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Source", "Source")%>
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
                            <%= GetName(listEntity[i].getMenu()) %>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Path%>
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
                        <td align="center">
                            <%= GetPublish(listEntity[i].ID, listEntity[i].Resolve)%>
                        </td>
                        <td align="center">
                            <a href="javascript:HLRedirect('SendMail', <%= listEntity[i].ID %>)" title="Gửi email cảnh báo tới đơn vị bị sự cố">
                                <img src="/{CPPath}/Content/add/img/email.png" />
                            </a>
                        </td>
                        <td align="right">
                            <%= string.Format("{0:#,##0}", listEntity[i].EmailNo)%>
                        </td>
                        <td align="center">
                            <%= GetPublish(listEntity[i].ID, listEntity[i].Activity)%>
                        </td>

                        <%--<td>
                            <a href="javascript:HLRedirect('Add', <%= listEntity[i].ID %>)"><%= listEntity[i].Name%></a>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Code%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Url%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].FakeDestination%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Source%>
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

<script src="/Content/js/datetime/jquery.datetimepicker.js"></script>
<script type="text/javascript">
    $('#filter_from, #filter_to').datetimepicker({
        onGenerate: function (ct) {
            $(this).find('.xdsoft_date')
                .toggleClass('xdsoft_disabled');
        },
        minDate: '-2-01-1970',
        maxDate: '+2-01-1970',
        timepicker: false,
        format: 'd-m-Y',
        formatDate: 'Y-m-d',
    });
</script>
