<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModVanBanModel;
    var listEntity = ViewBag.Data as List<ModVanBanEntity>;
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
                <%=GetDefaultListCommand()%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Văn bản</h2>
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

    <script>
        var HLController = 'ModVanBan';
        var HLArrVar = [
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
                        <%= Utils.ShowDDLMenuByType("VanBan", model.LangID, model.MenuID)%>
                    </select>
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
                        <th width="10%" nowrap="nowrap">
                            <%= GetSortLink("Chuyên mục", "MenuID")%>
                        </th>
                        <th width="10%" nowrap="nowrap">
                            <%= GetSortLink("Cơ quan ban hành", "MenuID1")%>
                        </th>
                        <th width="10%" nowrap="nowrap">
                            <%= GetSortLink("Hình thức văn bản", "MenuID2")%>
                        </th>
                        <th class="title">
                            <%= GetSortLink("Số hiệu", "Name")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("Ngày ban hành", "NgayBanHanh")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("Ngày có hiệu lực", "NgayCoHieuLuc")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("Ngày hết hiệu lực", "NgayHetHieuLuc")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Thứ tự", "Order")%>
                            <a href="javascript:hl_exec_cmd('saveorder')" class="saveorder" title="Lưu sắp xếp"></a>
                        </th>
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
                            <%= GetName(listEntity[i].getMenu()) %>
                        </td>
                        <td align="center">
                            <%= GetName(listEntity[i].getMenu1()) %>
                        </td>
                        <td align="center">
                            <%= GetName(listEntity[i].getMenu2()) %>
                        </td>
                        <td>
                            <a href="javascript:HLRedirect('Add', <%= listEntity[i].ID %>)"><%= listEntity[i].Name%></a>
                        </td>
                        <td align="center">
                            <%= (listEntity[i].NgayBanHanh > DateTime.MinValue && listEntity[i].NgayBanHanh < DateTime.MaxValue) ? string.Format("{0:dd/MM/yyyy}", listEntity[i].NgayBanHanh) : "" %>
                        </td>
                        <td align="center">
                            <%= (listEntity[i].NgayCoHieuLuc > DateTime.MinValue && listEntity[i].NgayCoHieuLuc < DateTime.MaxValue) ? string.Format("{0:dd/MM/yyyy}", listEntity[i].NgayCoHieuLuc) : "" %>
                        </td>
                        <td align="center">
                            <%= (listEntity[i].NgayHetHieuLuc > DateTime.MinValue && listEntity[i].NgayHetHieuLuc < DateTime.MaxValue) ? string.Format("{0:dd/MM/yyyy}", listEntity[i].NgayHetHieuLuc) : "" %>
                        </td>
                        <td class="order">
                            <%= GetOrder(listEntity[i].ID, listEntity[i].Order)%>
                        </td>
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
