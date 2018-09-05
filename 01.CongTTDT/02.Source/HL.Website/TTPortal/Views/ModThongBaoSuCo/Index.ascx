<%@  Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModThongBaoSuCoModel;
    var listEntity = ViewBag.Data as List<ModThongBaoSuCoEntity>;
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
                <%=GetListCommand("edit|Sửa,space,delete|Xóa,space,publish|Duyệt,unpublish|Bỏ duyệt,space,config|Xóa cache") %>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Thông báo sự cố</h2>
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

        var HLController = 'ModThongBaoSuCo';

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
                    <td nowrap="nowrap">
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
                            <%= GetSortLink("Người thông báo", "UserID")%>
                        </th>
                        <th width="8%" nowrap="nowrap">
                            <%= GetSortLink("Tên tổ chức/cá nhân thông báo", "ToChuc_Ten")%>
                        </th>
                        <%-- <th width="4%" nowrap="nowrap">
                            <%= GetSortLink("Trạng thái", "MenuID")%>
                        </th>--%>
                        <th class="title">
                            <%= GetSortLink("Tên hệ thống bị sự cố", "ChiTiet_TenHeThong")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Mã", "Code")%>
                        </th>
                        <th width="12%" nowrap="nowrap">
                            <%= GetSortLink("Địa chỉ đơn vị/cá nhân vận hành", "ChiTiet_TenDonVi")%>
                        </th>
                        <th width="12%" nowrap="nowrap">
                            <%= GetSortLink("Cơ quan chủ quản hệ thống", "ChiTiet_CoQuan")%>
                        </th>
                        <th width="7%" nowrap="nowrap">
                            <%= GetSortLink("Ngày tạo", "CreatedDate")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Duyệt", "Activity")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Thứ tự", "Order")%>
                            <a href="javascript:hl_exec_cmd('saveorder')" class="saveorder" title="Lưu sắp xếp"></a>
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
                            <%= listEntity[i].getThanhVien().LoginName %>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ToChuc_Ten %>
                        </td>
                        <%-- <td align="center">
                            <%= GetName(listEntity[i].getMenu()) %>
                        </td>--%>
                        <td>
                            <a href="javascript:HLRedirect('Add', <%= listEntity[i].ID %>)"><%= listEntity[i].ChiTiet_TenHeThong%></a>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Code %>
                        </td>
                        <td>
                            <%= listEntity[i].ChiTiet_TenDonVi %>
                        </td>
                        <td>
                            <%= listEntity[i].ChiTiet_CoQuan %>
                        </td>
                        <td>
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].CreatedDate) %>
                        </td>
                        <td align="center">
                            <%= GetPublish(listEntity[i].ID, listEntity[i].Activity)%>
                        </td>
                        <td class="order">
                            <%= GetOrder(listEntity[i].ID, listEntity[i].Order)%>
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
