﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModBaoCaoSuCoModel;
    var listEntity = ViewBag.Data as List<ModBaoCaoSuCoEntity>;
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
                <%=GetListCommand("new|Thêm,edit|Sửa,space,delete|Xóa,space,config|Xóa cache") %>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Báo cáo sự cố</h2>
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

        var HLController = 'ModBaoCaoSuCo';

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
                    <td nowrap="nowrap">Trạng thái : 
                    <select id="filter_menu" onchange="HLRedirect()" class="inputbox" size="1">
                        <option value="0">(Tất cả)</option>
                        <%= Utils.ShowDDLMenuByType("BaoCaoSuCo", model.LangID, model.MenuID)%>
                    </select>
                        <%--Vị trí :
                   <select id="filter_state" onchange="HLRedirect()" class="inputbox" size="1">
                       <option value="0">(Tất cả)</option>
                       <%= Utils.ShowDDLByConfigkey("Mod.BaoCaoSuCoState", model.State)%>
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
                        <th width="8%" nowrap="nowrap">
                            <%= GetSortLink("Tên báo cáo", "Title")%>
                        </th>
                        <th width="8%" nowrap="nowrap">
                            <%= GetSortLink("Người báo cáo", "UserID")%>
                        </th>
                        <%--<th width="1%" nowrap="nowrap">
                            <%= GetSortLink("User i d1", "UserID1")%>
                        </th>--%>
                        <th width="4%" nowrap="nowrap">
                            <%= GetSortLink("Trạng thái", "MenuID")%>
                        </th>
                        <th class="title">
                            <%= GetSortLink("Tổ chức", "Name")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Mã", "Code")%>
                        </th>
                        <th width="12%" nowrap="nowrap">
                            <%= GetSortLink("Địa chỉ", "Address")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Điện thoại", "Phone")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Email", "Email")%>
                        </th>
                        <th width="6%" nowrap="nowrap">
                            <span>Báo cáo đang có</span>
                        </th>
                        <th width="7%" nowrap="nowrap">
                            <%= GetSortLink("Ngày tạo", "Published")%>
                        </th>
                        <%--<th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Published1", "Published1")%>
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
                            <%= listEntity[i].Title%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].getThanhVien().LoginName %>
                        </td>
                        <%--<td align="center">
                            <%= string.Format("{0:#,##0}", listEntity[i].UserID1)%>
                        </td>--%>
                        <td align="center">
                            <%= GetName(listEntity[i].getMenu()) %>
                        </td>
                        <td>
                            <a href="javascript:HLRedirect('Add', <%= listEntity[i].ID %>)"><%= listEntity[i].Name%></a>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Code%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Address%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Phone%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Email%>
                        </td>
                        <td align="center">
                            <%
                                var bcBanDau = ModBaoCaoBanDauSuCoService.Instance.CreateQuery().Where(o => o.BaoCaoSuCoID == listEntity[i].ID).ToSingle();
                                var bcTongHop = ModBaoCaoTongHopService.Instance.CreateQuery().Where(o => o.BaoCaoSuCoID == listEntity[i].ID).ToSingle();
                                var bcKetThuc = ModBaoCaoKetThucSuCoService.Instance.CreateQuery().Where(o => o.BaoCaoSuCoID == listEntity[i].ID).ToSingle();
                                %>
                            <%if (bcBanDau != null)
                                {%>Báo cáo ban đầu<br /><%} %>
                            <%if (bcTongHop != null)
                                {%>Báo cáo tổng hợp<br /><%} %>
                            <%if (bcKetThuc != null)
                                {%>Báo cáo kết thúc<br /><%} %>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].Published) %>
                        </td>
                        <%--<td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].Published1) %>
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
