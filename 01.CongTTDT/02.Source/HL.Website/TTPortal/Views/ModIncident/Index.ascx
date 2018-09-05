﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModIncidentModel;
    var listEntity = ViewBag.Data as List<ModIncidentEntity>;
    var c0 = listEntity != null ? listEntity.Count : 0;
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
                        <%--<a class="toolbar" href="<%=CPViewPage.Request.RawUrl.Replace("Index.aspx","Export.aspx") %>">
                            <span title="Xuất Excel" class="icon-32-fileexport"></span>Xuất File</a>--%>
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
                        <span>Lọc:</span>
                        <input type="text" id="filter_search" value="<%= model.SearchText %>" class="text_area" onchange="HLRedirect();return false;" />
                        <button onclick="HLRedirect();return false;">Tìm kiếm</button>
                    </td>
                    <td nowrap="nowrap">
                        <span>Loại sự cố:</span>
                        <select id="filter_menu" onchange="HLRedirect()" class="inputbox" size="1">
                            <%= Utils.ShowDDLMenuByType2("Incident", model.LangID, model.MenuID)%>
                        </select>
                        <%-- Vị trí :
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
                    <%if (model.MenuID == 191 || model.MenuID == 192)
                        {%>
                    <tr>
                        <th width="1%">#</th>
                        <th width="1%">
                            <input type="checkbox" name="toggle" value="" onclick="checkAll(<%= model.PageSize %>);" />
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("PID", "ID")%>
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
                            <%= GetSortLink("Nguồn", "Source")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("Người tấn công", "Attacker")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("Thời gian", "AttackOn")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Đã giải quyết", "Resolve")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <span>Gửi mail</span>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Lần gửi", "EmailNo")%>
                        </th>
                    </tr>
                    <%}
                        else if (model.MenuID == 193)
                        { %>
                    <tr>
                        <th width="1%">#</th>
                        <th width="1%">
                            <input type="checkbox" name="toggle" value="" onclick="checkAll(<%= model.PageSize %>);" />
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("PID", "ID")%>
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
                            <%= GetSortLink("Nguồn", "Source")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("Tên virut", "MalwareName")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("Thời gian", "AttackOn")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Đã giải quyết", "Resolve")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <span>Gửi mail</span>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Lần gửi", "EmailNo")%>
                        </th>
                    </tr>
                    <%}
                        else if (model.MenuID == 194 || model.MenuID == 195)
                        { %>
                    <tr>
                        <th width="1%">#</th>
                        <th width="1%">
                            <input type="checkbox" name="toggle" value="" onclick="checkAll(<%= model.PageSize %>);" />
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("PID", "ID")%>
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
                            <%= GetSortLink("Timestamp", "Timestamp")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("ASN", "ASN")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("Type", "Type")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("HttpAgent", "HttpAgent")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("SrcPort", "SrcPort")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("HostName", "HostName")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("Destinationport", "Destinationport")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("Protocol", "Protocol")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("ServerName", "ServerName")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("Server", "Server")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("Header", "Header")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("Tag", "Tag")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Đã giải quyết", "Resolve")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <span>Gửi mail</span>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Lần gửi", "EmailNo")%>
                        </th>
                    </tr>
                    <%} %>
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
                            var listChild = ModIncidentService.Instance.CreateQuery().Where(o => o.ParentID == listEntity[i].ID).ToList();
                            if (listChild != null) c = listChild.Count;
                    %>
                    <%if (model.MenuID == 191 || model.MenuID == 192)
                        {%>
                    <tr class="row<%= i % 2 %> openchild" id="p_<%=i %>">
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
                            <%if (c > 0)
                                {%>
                            <span style="float: left; font-weight: bold; color: blue;">&or;</span>
                            <%} %>
                            <%= listEntity[i].Path%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].IP%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ISP%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Source%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Attacker%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].AttackOn) %>
                        </td>
                        <td align="center">
                            <%--<%= GetPublish(listEntity[i].ID, listEntity[i].Resolve)%>--%>
                            <%if (!listEntity[i].Resolve)
                                { %><a class="jgrid" href="javascript:void(0);" onclick="hl_exec_cmd('[resolvegx][<%= listEntity[i].ID %>]')"><%} %>
                                    <span class="jgrid">
                                        <span class="state <%= listEntity[i].Resolve ? "publish" : "unpublish" %>"></span>
                                    </span>
                                    <%if (!listEntity[i].Resolve)
                                        { %></a><%} %>
                        </td>
                        <td align="center">
                            <a href="javascript:HLRedirect('SendMail', <%= listEntity[i].ID %>)" title="Gửi email cảnh báo tới đơn vị bị sự cố">
                                <img src="/{CPPath}/Content/add/img/email.png" />
                            </a>
                        </td>
                        <td align="right">
                            <%= string.Format("{0:#,##0}", listEntity[i].EmailNo)%>
                        </td>

                    </tr>
                    <%}
                        else if (model.MenuID == 193)
                        { %>
                    <tr class="row<%= i % 2 %> openchild" id="p_<%=i %>">
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
                            <%if (c > 0)
                                {%>
                            <span style="float: left; font-weight: bold; color: blue;">&or;</span>
                            <%} %>
                            <%= listEntity[i].Path%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].IP%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ISP%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Source%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].MalwareName%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].AttackOn) %>
                        </td>
                        <td align="center">
                            <%--<%= GetPublish(listEntity[i].ID, listEntity[i].Resolve)%>--%>
                            <%if (!listEntity[i].Resolve)
                                { %><a class="jgrid" href="javascript:void(0);" onclick="hl_exec_cmd('[resolvegx][<%= listEntity[i].ID %>]')"><%} %>
                                    <span class="jgrid">
                                        <span class="state <%= listEntity[i].Resolve ? "publish" : "unpublish" %>"></span>
                                    </span>
                                    <%if (!listEntity[i].Resolve)
                                        { %></a><%} %>
                        </td>
                        <td align="center">
                            <a href="javascript:HLRedirect('SendMail', <%= listEntity[i].ID %>)" title="Gửi email cảnh báo tới đơn vị bị sự cố">
                                <img src="/{CPPath}/Content/add/img/email.png" />
                            </a>
                        </td>
                        <td align="right">
                            <%= string.Format("{0:#,##0}", listEntity[i].EmailNo)%>
                        </td>
                    </tr>
                    <%}
                        else if (model.MenuID == 194 || model.MenuID == 195)
                        { %>
                        <tr class="row<%= i % 2 %> openchild" id="p_<%=i %>">
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
                            <%if (c > 0)
                                {%>
                            <span style="float: left; font-weight: bold; color: blue;">&or;</span>
                            <%} %>
                            <%= listEntity[i].Path%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].IP%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ISP%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Timestamp%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ASN%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Type%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].SrcPort%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].HostName%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Destinationport%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Protocol%>
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
                            <%= listEntity[i].Header%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Tag%>
                        </td>
                        <td align="center">
                            <%--<%= GetPublish(listEntity[i].ID, listEntity[i].Resolve)%>--%>
                            <%if (!listEntity[i].Resolve)
                                { %><a class="jgrid" href="javascript:void(0);" onclick="hl_exec_cmd('[resolvegx][<%= listEntity[i].ID %>]')"><%} %>
                                    <span class="jgrid">
                                        <span class="state <%= listEntity[i].Resolve ? "publish" : "unpublish" %>"></span>
                                    </span>
                                    <%if (!listEntity[i].Resolve)
                                        { %></a><%} %>
                        </td>
                        <td align="center">
                            <a href="javascript:HLRedirect('SendMail', <%= listEntity[i].ID %>)" title="Gửi email cảnh báo tới đơn vị bị sự cố">
                                <img src="/{CPPath}/Content/add/img/email.png" />
                            </a>
                        </td>
                        <td align="right">
                            <%= string.Format("{0:#,##0}", listEntity[i].EmailNo)%>
                        </td>
                    </tr>
                    <%} %>
                    <%if (c > 0)
                        {%>
                    <tr class="row<%= i%2 %>" id="c_<%=i %>" style="display: none;" data-child="<%=listEntity[i].ID %>">
                        <td colspan="12">
                            <table class="adminlist" cellspacing="1" style="border: 1px solid blue;">
                                <thead>
                                    <%if (model.MenuID == 191 || model.MenuID == 192)
                                        {%>
                                    <tr>
                                        <th width="1%">#</th>
                                        <th width="1%">
                                            <input type="checkbox" name="toggle" value="" onclick="checkAll(<%= model.PageSize %>);" />
                                        </th>
                                        <th width="1%" nowrap="nowrap">
                                            <%= GetSortLink("PID", "ID")%></th>
                                        <th width="10%" nowrap="nowrap">
                                            <%= GetSortLink("Domain/URL", "Path")%></th>
                                        <th width="5%" nowrap="nowrap">
                                            <%= GetSortLink("IP", "IP")%></th>
                                        <th width="5%" nowrap="nowrap">
                                            <%= GetSortLink("ISP", "ISP")%></th>
                                        <th width="5%" nowrap="nowrap">
                                            <%= GetSortLink("Nguồn", "Source")%>
                                        </th>
                                        <th width="5%" nowrap="nowrap">
                                            <%= GetSortLink("Người tấn công", "Attacker")%>
                                        </th>
                                        <th width="5%" nowrap="nowrap">
                                            <%= GetSortLink("Thời gian", "AttackOn")%>
                                        </th>
                                        <th width="1%" nowrap="nowrap">
                                            <%= GetSortLink("Đã giải quyết", "Resolve")%>
                                        </th>
                                        <th width="1%" nowrap="nowrap">
                                            <span>Gửi mail</span>
                                        </th>
                                        <th width="1%" nowrap="nowrap">
                                            <%= GetSortLink("Lần gửi", "EmailNo")%>
                                        </th>
                                    </tr>
                                    <%}
                                        else if (model.MenuID == 193)
                                        { %>
                                    <tr>
                                        <th width="1%">#</th>
                                        <th width="1%">
                                            <input type="checkbox" name="toggle" value="" onclick="checkAll(<%= model.PageSize %>);" />
                                        </th>
                                        <th width="1%" nowrap="nowrap">
                                            <%= GetSortLink("PID", "ID")%></th>
                                        <th width="10%" nowrap="nowrap">
                                            <%= GetSortLink("Domain/URL", "Path")%></th>
                                        <th width="5%" nowrap="nowrap">
                                            <%= GetSortLink("IP", "IP")%></th>
                                        <th width="5%" nowrap="nowrap">
                                            <%= GetSortLink("ISP", "ISP")%></th>
                                        <th width="5%" nowrap="nowrap">
                                            <%= GetSortLink("Nguồn", "Source")%>
                                        </th>
                                        <th width="5%" nowrap="nowrap">
                                            <%= GetSortLink("Tên virut", "MalwareName")%>
                                        </th>
                                        <th width="5%" nowrap="nowrap">
                                            <%= GetSortLink("Thời gian", "AttackOn")%>
                                        </th>
                                        <th width="1%" nowrap="nowrap">
                                            <%= GetSortLink("Đã giải quyết", "Resolve")%>
                                        </th>
                                        <th width="1%" nowrap="nowrap">
                                            <span>Gửi mail</span>
                                        </th>
                                        <th width="1%" nowrap="nowrap">
                                            <%= GetSortLink("Lần gửi", "EmailNo")%>
                                        </th>
                                    </tr>
                                    <%} %>
                                </thead>

                                <%if (model.MenuID == 191 || model.MenuID == 192)
                                    {%>
                                <%for (int j = 0; listChild != null && j < listChild.Count; j++)
                                    {
                                %>
                                <tr class="row<%= i % 2 %>">
                                    <td align="center">
                                        <%= j + 1%>
                                    </td>
                                    <td align="center">
                                        <%= GetCheckbox(listChild[j].ID, j)%>
                                    </td>
                                    <td align="center">
                                        <%= listChild[j].ID%>
                                    </td>
                                    <td align="center">
                                        <%= listChild[j].Path%>
                                    </td>
                                    <td align="center">
                                        <%= listChild[j].IP%>
                                    </td>
                                    <td align="center">
                                        <%= listChild[j].ISP%>
                                    </td>
                                    <td align="center">
                                        <%= listEntity[i].Source%></td>
                                    <td align="center">
                                        <%= listEntity[i].Attacker%></td>
                                    <td align="center">
                                        <%= string.Format("{0:dd/MM/yyyy HH:mm}", listChild[j].AttackOn) %>
                                    </td>
                                    <td align="center">
                                        <%--<%= GetPublish(listChild[j].ID, listChild[j].Resolve)%>--%>
                                        <%if (!listChild[j].Resolve)
                                            { %><a class="jgrid" href="javascript:void(0);" onclick="hl_exec_cmd('[resolvegx][<%= listChild[j].ID %>]')"><%} %>
                                                <span class="jgrid">
                                                    <span class="state <%= listChild[j].Resolve ? "publish" : "unpublish" %>"></span>
                                                </span>
                                                <%if (!listChild[j].Resolve)
                                                    { %></a><%} %>
                                    </td>
                                    <td align="center">
                                        <%--<a href="javascript:HLRedirect('SendMail', <%= listChild[j].ID %>)" title="Gửi email cảnh báo tới đơn vị bị sự cố">
                                            <img src="/{CPPath}/Content/add/img/email.png" />
                                        </a>--%>
                                    </td>
                                    <td align="right">
                                        <%= string.Format("{0:#,##0}", listChild[j].EmailNo)%>
                                    </td>
                                </tr>
                                <%} %>
                                <%}
                                    else if (model.MenuID == 193)
                                    { %>
                                <%for (int j = 0; listChild != null && j < listChild.Count; j++)
                                    {
                                %>
                                <tr class="row<%= i % 2 %>">
                                    <td align="center">
                                        <%= j + 1%>
                                    </td>
                                    <td align="center">
                                        <%= GetCheckbox(listChild[j].ID, j)%>
                                    </td>
                                    <td align="center">
                                        <%= listChild[j].ID%>
                                    </td>
                                    <td align="center">
                                        <%= listChild[j].Path%>
                                    </td>
                                    <td align="center">
                                        <%= listChild[j].IP%>
                                    </td>
                                    <td align="center">
                                        <%= listChild[j].ISP%>
                                    </td>
                                    <td align="center">
                                        <%= listEntity[i].Source%></td>
                                    <td align="center">
                                        <%= listEntity[i].MalwareName%></td>
                                    <td align="center">
                                        <%= string.Format("{0:dd/MM/yyyy HH:mm}", listChild[j].AttackOn) %>
                                    </td>
                                    <td align="center">
                                        <%--<%= GetPublish(listChild[j].ID, listChild[j].Resolve)%>--%>
                                        <%if (!listChild[j].Resolve)
                                            { %><a class="jgrid" href="javascript:void(0);" onclick="hl_exec_cmd('[resolvegx][<%= listChild[j].ID %>]')"><%} %>
                                                <span class="jgrid">
                                                    <span class="state <%= listChild[j].Resolve ? "publish" : "unpublish" %>"></span>
                                                </span>
                                                <%if (!listChild[j].Resolve)
                                                    { %></a><%} %>
                                    </td>
                                    <td align="center">
                                        <%--<a href="javascript:HLRedirect('SendMail', <%= listChild[j].ID %>)" title="Gửi email cảnh báo tới đơn vị bị sự cố">
                                            <img src="/{CPPath}/Content/add/img/email.png" />
                                        </a>--%>
                                    </td>
                                    <td align="right">
                                        <%= string.Format("{0:#,##0}", listChild[j].EmailNo)%>
                                    </td>
                                </tr>
                                <%} %>
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
