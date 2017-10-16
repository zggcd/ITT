<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModGopYModel;
    var listEntity = ViewBag.Data as List<ModGopYEntity>;
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
                <%=GetListCommand("publish|Duyệt,unpublish|Bỏ duyệt,space,delete|Xóa,space,config|Xóa cache")%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Góp ý</h2>
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

        var HLController = 'ModGopY';

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
                    <td nowrap="nowrap"></td>
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
                            <%= GetSortLink("Dự thảo", "DuThaoID")%>
                        </th>
                        <th class="title">
                            <%= GetSortLink("Họ tên", "Name")%>
                        </th>
                        <%--<th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Địa chỉ", "Address")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Điện thoại", "Phone")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Di động", "Mobile")%>
                    </th>--%>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Email", "Email")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Tiêu đề", "Title")%>
                        </th>
                        <%--<th style="width:40px" nowrap="nowrap">
                        <%= GetSortLink("File đính kèm", "File")%>
                    </th>--%>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("IP", "IP")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Ngày gửi", "Published")%>
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
                        <td width="15%">
                            <%= GetName(listEntity[i].getDuThao()) %>
                        </td>
                        <td width="10%">
                            <%= listEntity[i].Name%>
                        </td>
                        <%--<td align="center">
                       <%= listEntity[i].Address%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].Phone%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].Mobile%>
                    </td>--%>
                        <td align="center" width="5%">
                            <%= listEntity[i].Email%>
                        </td>
                        <td width="30%">
                            <a href="javascript:HLRedirect('Add', <%= listEntity[i].ID %>)"><%= listEntity[i].Title%></a>
                            <%if (!string.IsNullOrEmpty(listEntity[i].Files))
                                {%>
                            <br /><i>(File đính kèm: <%=listEntity[i].Files %>)</i>
                            <%} %>
                        </td>
                        <%--<td align="center">
                       <%= Utils.GetMedia(listEntity[i].Files, 40, 40)%>
                    </td>--%>
                        <td align="center" width="5%">
                            <%= listEntity[i].IP%>
                        </td>
                        <td align="center" width="5%">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].Published) %>
                        </td>
                        <td class="order" width="1%">
                            <%= GetOrder(listEntity[i].ID, listEntity[i].Order)%>
                        </td>
                        <td align="center" width="1%">
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
