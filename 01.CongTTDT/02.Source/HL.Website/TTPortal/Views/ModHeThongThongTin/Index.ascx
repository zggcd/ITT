﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModHeThongThongTinModel;
    var listEntity = ViewBag.Data as List<ModHeThongThongTinEntity>;

    var lstDonDk = ModDonDangKyUCSCService.Instance.CreateQuery()
        .Where(o => o.Activity == true)
        .ToList();
    var lstHSThanhVien = ModHSThanhVienUCSCService.Instance.CreateQuery()
        .Where(o => o.Activity == true)
        .ToList();

    string thanhVienIds = "";
    if (lstDonDk != null)
    {
        thanhVienIds += string.Join(",", lstDonDk.Select(o => o.UserID).ToArray());
    }
    if (lstHSThanhVien != null)
    {
        thanhVienIds += string.Join(",", lstHSThanhVien.Select(o => o.UserID).ToArray());
    }

    var lstThanhVien = CPUserService.Instance.CreateQuery()
        .Where(o => o.Activity == true && string.IsNullOrEmpty(thanhVienIds) == false)
        .WhereIn(!string.IsNullOrEmpty(thanhVienIds), o => o.ID, thanhVienIds)
        .ToList();
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
                <%--<%=GetDefaultListCommand()%>--%>
                <ul style="float: left; padding-right: 15px;">
                    <li id="toolbar-apply" class="button">
                        <a class="toolbar" href="javascript: void(0)" onclick="hl_exec_cmd('Export')">
                            <span title="Xuất Excel" class="icon-32-fileexport"></span>Xuất File</a>
                    </li>
                </ul>
                <%=GetListCommand("cancel|Đóng")%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Hệ thống thông tin</h2>
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

        var HLController = 'ModHeThongThongTin';

        var HLArrVar = [
            'filter_tv', 'ThanhVienID',
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
                    <td nowrap="nowrap">
                        <span>Thành viên</span>
                        <select id="filter_tv" onchange="HLRedirect()" class="inputbox" size="1">
                            <option value="0">(Tất cả)</option>
                            <%--<%= Utils.ShowDDLMenuByType("News", model.LangID, model.MenuID)%>--%>
                            <%for (int i = 0; i < lstThanhVien.Count; i++)
                                {%>
                            <option value="<%=lstThanhVien[i].ID %>" <%if (lstThanhVien[i].ID == model.ThanhVienID)
                                {%>selected="selected"
                                <%} %>><%=lstThanhVien[i].LoginName %></option>
                            <%} %>
                        </select>

                        Cấp độ : 
                    <select id="filter_menu" onchange="HLRedirect()" class="inputbox" size="1">
                        <option value="0">(Tất cả)</option>
                        <%= Utils.ShowDDLMenuByType("CapDo", model.LangID, model.MenuID)%>
                    </select>
<%--                        Vị trí :
                   <select id="filter_state" onchange="HLRedirect()" class="inputbox" size="1">
                       <option value="0">(Tất cả)</option>
                       <%= Utils.ShowDDLByConfigkey("Mod.HeThongThongTinState", model.State)%>
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
                        <th width="1%" nowrap="nowrap">
                            <span>Thành viên</span>
                        </th>
                        <%--<th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Don dang ky u c s c", "DonDangKyUCSCID")%>
                        </th>--%>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Cấp độ", "MenuID")%>
                        </th>
                        <th class="title">
                            <%= GetSortLink("Thông tin", "Name")%>
                        </th>
                        <%--<th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Mã", "Code")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Xuất bản", "Published")%>
                        </th>--%>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Thứ tự", "Order")%>
                            <a href="javascript:hl_exec_cmd('saveorder')" class="saveorder" title="Lưu sắp xếp"></a>
                        </th>
                        <%--<th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Duyệt", "Activity")%>
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
                        {
                            var donDk = ModDonDangKyUCSCService.Instance.CreateQuery()
                                .Where(o => o.Activity == true && o.ID == listEntity[i].DonDangKyUCSCID)
                                .ToSingle();
                            var dm = ModDauMoiUCSCService.Instance.CreateQuery()
                                .Where(o => o.Activity == true)
                                .Where(o => o.ID == listEntity[i].DauMoiUCSCID)
                                .ToSingle();
                            int idThanhVien = 0;

                            if (donDk != null) idThanhVien = donDk.UserID;
                            else if (dm != null)
                            {
                                var hSThanhVien = ModHSThanhVienUCSCService.Instance.CreateQuery()
                                    .Where(o => o.Activity == true && o.ID == dm.HSThanhVienUCSCID)
                                    .ToSingle();
                                if (hSThanhVien != null) idThanhVien = hSThanhVien.UserID;
                            }
                            var thanhVien = CPUserService.Instance.CreateQuery()
                                .Where(o => o.Activity == true)
                                .Where(idThanhVien > 0, o => o.ID == idThanhVien)
                                .ToSingle();
                            %>
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
                            <%= thanhVien != null ? thanhVien.LoginName : ""%>
                        </td>
                        <%--<td align="center">
                            <%= GetName(listEntity[i].getDonDangKyUCSC()) %>
                        </td>--%>
                        <td align="center">
                            <%= GetName(listEntity[i].getMenu()) %>
                        </td>
                        <td>
                            <%--<a href="javascript:HLRedirect('Add', <%= listEntity[i].ID %>)"><%= listEntity[i].Name%></a>--%>
                            <%= listEntity[i].Name%>
                        </td>
                        <%--<td align="center">
                            <%= listEntity[i].Code%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].Published) %>
                        </td>--%>
                        <td class="order">
                            <%= GetOrder(listEntity[i].ID, listEntity[i].Order)%>
                        </td>
                        <%--<td align="center">
                            <%= GetPublish(listEntity[i].ID, listEntity[i].Activity)%>
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
