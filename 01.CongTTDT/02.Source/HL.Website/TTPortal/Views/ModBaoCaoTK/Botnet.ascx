﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModIncidentModel;
    var all = ViewBag.All as List<ModIncidentEntity>;
    var listEntity = ViewBag.Data as List<ModIncidentEntity>;
    var c0 = listEntity != null ? listEntity.Count : 0;
%>

<link rel="stylesheet" type="text/css" href="/Content/css/jquery.datetimepicker.css" />
<script src="/Content/js/datetime/jquery.js"></script>

<form id="hlForm" name="hlForm" method="post">

    <input type="hidden" id="_hl_action" name="_hl_action" />
    <input type="hidden" id="boxchecked" name="boxchecked" value="0" />

    <input type="hidden" id="Menu" name="Menu" value="<%=model.Menu %>" />
    <input type="hidden" id="MenuID" name="MenuID" value="<%=model.MenuID %>" />

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
                        <a class="toolbar" href="javascript: void(0)" onclick="hl_exec_cmd('Export')">
                            <span title="Xuất Excel" class="icon-32-fileexport"></span>Xuất File</a>
                    </li>
                </ul>
                <%=GetListCommand("cancel|Đóng")%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Báo cáo thống kê sự cố: <%=model.Menu %></h2>
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
        var HLController = 'ModBaoCaoTK';

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
                            <select id="filter_member" onchange="HLRedirect('Botnet')" class="inputbox" size="1">
                                <option value="0">(Tất cả)</option>
                            </select>
                        </p>

                        <p>
                            <span>ISP bị tấn công:</span>
                            <select id="filter_isp" onchange="HLRedirect('Botnet')" class="inputbox" size="1">
                                <option value="0">(Tất cả)</option>
                                <%= Utils.ShowDDLByConfigkey("Mod.CommonState", model.ISPState)%>
                            </select>
                        </p>
                    </td>
                    <td nowrap="nowrap">
                        <span>Ngôn ngữ:</span><%= ShowDDLLang(model.LangID)%>
                    </td>
                </tr>
                <tr>
                    <td width="100%">
                        <button onclick="HLRedirect('Botnet');return false;">Tìm kiếm</button>
                    </td>
                </tr>
            </table>

            <table class="adminlist" cellspacing="1">
                <thead>
                    <tr>
                        <th width="1%">#</th>
                        <th width="5%" nowrap="nowrap">
                            <%--<%= GetSortLink("Loại sự cố", "MenuID")%>--%>
                            <span>Loại sự cố</span>
                        </th>
                        <th width="10%" nowrap="nowrap">
                            <%--<%= GetSortLink("Domain/URL", "Path")%>--%>
                            <span>ISP</span>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <span>Tần suất</span>
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
                    <%int c = 0;
                        for (int i = 0; listEntity != null && i < listEntity.Count; i++)
                        {
                            c = 0;
                            var listChild = all != null ? all.Where(o => o.ISP == listEntity[i].ISP).ToList() : null;
                            if (listChild != null) c = listChild.Count;
                    %>
                    <%if (c > 0)
                        {%>
                    <tr class="row<%= i%2 %> openchild" id="p_<%=i %>">
                        <td align="center">
                            <%= i + 1%>
                        </td>
                        <td align="center">
                            <%= GetName(listChild[0].getMenu()) %>
                        </td>
                        <td align="center">
                            <%if (c > 0)
                                {%>
                            <span style="float: left; font-weight: bold; color: blue;">&or;</span>
                            <%} %>
                            <%= listEntity[i].ISP%>
                        </td>
                        <td align="center"><%= string.Format("{0:#,##0}", listEntity[i].ChildNum)%></td>
                    </tr>
                    <tr class="row<%= i%2 %>" id="c_<%=i %>" style="display: none;" data-child="<%=listEntity[i].ID %>">
                        <td colspan="12">
                            <table class="adminlist" cellspacing="1" style="border: 1px solid blue;">
                                <thead>
                                    <tr>
                                        <th width="1%">#</th>
                                        <th width="1%" nowrap="nowrap">
                                            <span>PID</span>
                                        </th>
                                        <th width="5%" nowrap="nowrap">
                                            <span>Loại sự cố</span>
                                        </th>
                                        <th width="10%" nowrap="nowrap">
                                            <span>Domain/URL</span>
                                        </th>
                                        <th width="5%" nowrap="nowrap">
                                            <span>IP</span>
                                        </th>
                                        <th width="5%" nowrap="nowrap">
                                            <span>Tên Virus</span>
                                        </th>
                                        <th width="5%" nowrap="nowrap">
                                            <span>Thời gian</span>
                                        </th>
                                        <th width="1%" nowrap="nowrap">
                                            <span>Tồn tại</span>
                                        </th>
                                        <th width="1%" nowrap="nowrap">
                                            <span>Lần gửi</span>
                                        </th>
                                    </tr>
                                </thead>

                                <%for (int j = 0; listChild != null && j < listChild.Count; j++)
                                    {
                                %>
                                <tr class="row<%= i%2 %>">
                                    <td align="center">
                                        <%= j + 1%>
                                    </td>
                                    <td align="center">
                                        <%= listChild[j].ID%>
                                    </td>
                                    <td align="center">
                                        <%= GetName(listChild[j].getMenu()) %>
                                    </td>
                                    <td align="center">
                                        <%= listChild[j].Path%>
                                    </td>
                                    <td align="center">
                                        <%= listChild[j].IP%>
                                    </td>
                                    <td align="center">
                                        <%= listChild[j].MalwareName%>
                                    </td>
                                    <td align="center">
                                        <%= string.Format("{0:dd/MM/yyyy HH:mm}", listChild[j].AttackOn) %>
                                    </td>
                                    <td align="center">
                                        <%if (listChild[j].Resolve)
                                            {%><span style="color: red;">Còn</span><%}
                                        else
                                        {%><span style="color: green;">Hết</span><%} %>
                                    </td>
                                    <%--<td align="center">
                                        <a href="javascript:HLRedirect('SendMail', <%= listChild[j].ID %>)" title="Gửi email cảnh báo tới đơn vị bị sự cố">
                                            <img src="/{CPPath}/Content/add/img/email.png" />
                                        </a>
                                    </td>--%>
                                    <td align="right">
                                        <%= string.Format("{0:#,##0}", listChild[j].EmailNo)%>
                                    </td>
                                </tr>
                                <%} %>
                            </table>
                        </td>
                    </tr>
                    <%} %>
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
    $(document).ready(function () {
        $('.openchild').click(function () {
            var child = $(this).next()[0];
            var isShow = child.style.display;
            if (isShow && isShow == 'none') {
                child.style.display = 'table-row';
            } else if (isShow == 'table-row') {
                child.style.display = 'none';
            }
        });
    });

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
