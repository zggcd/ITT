﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModHSThanhVienUCSCModel;
    var listEntity = ViewBag.Data as List<ModHSThanhVienUCSCEntity>;
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
                <ul style="float: left; padding-right: 15px;">
                    <li id="toolbar-apply" class="button">
                        <a class="toolbar" href="javascript: void(0)" onclick="hl_exec_cmd('Export')">
                            <span title="Xuất Excel" class="icon-32-fileexport"></span>Xuất File</a>
                    </li>
                    <li id="toolbar-print" class="button">
                        <a class="toolbar" href="javascript: void(0)" onclick="javascript:if(document.hlForm.boxchecked.value>0){fnPrint()}">
                            <span title="In" class="icon-32-fileexport"></span>In</a>
                    </li>
                </ul>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Hồ sơ thành viên ứng cứu sự cố</h2>
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

        var HLController = 'ModHSThanhVienUCSC';

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
                        <%= Utils.ShowDDLMenuByType("HSThanhVienUCSC", model.LangID, model.MenuID)%>
                    </select>
                        Vị trí :
                   <select id="filter_state" onchange="HLRedirect()" class="inputbox" size="1">
                       <option value="0">(Tất cả)</option>
                       <%= Utils.ShowDDLByConfigkey("Mod.HSThanhVienUCSCState", model.State)%>
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
                        <th width="15%" nowrap="nowrap">
                            <%= GetSortLink("User", "UserID")%>
                        </th>
                        <%--<th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Chuyên mục", "MenuID")%>
                        </th>--%>
                        <th class="title">
                            <%= GetSortLink("Tên", "Name")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Mã", "Code")%>
                        </th>
                        <%--<th width="1%" nowrap="nowrap">
                            <%= GetSortLink("To chuc_ ten", "ToChuc_Ten")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("To chuc_ ten co quan", "ToChuc_TenCoQuan")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("To chuc_ dia chi", "ToChuc_DiaChi")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("To chuc_ dien thoai", "ToChuc_DienThoai")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("To chuc_ fax", "ToChuc_Fax")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("To chuc_ email", "ToChuc_Email")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("To chuc_ web", "ToChuc_Web")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("To chuc_ lanh dao", "ToChuc_LanhDao")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("To chuc_ chuc vu", "ToChuc_ChucVu")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("T t t n_ dia chi", "TTTN_DiaChi")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("T t t n_ dien thoai", "TTTN_DienThoai")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("T t t n_ dien thoai d d", "TTTN_DienThoaiDD")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("T t t n_ fax", "TTTN_Fax")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("T t t n_ email", "TTTN_Email")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("He thong thong tin i ds", "HeThongThongTinIDs")%>
                        </th>
                        <th style="width: 40px" nowrap="nowrap">
                            <%= GetSortLink("Ảnh", "File")%>
                        </th>--%>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Xuất bản", "Published")%>
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
                        {
                            var user = CPUserService.Instance.GetByID(listEntity[i].UserID);
                            string loginName = user != null ? user.LoginName : "";
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
                            <%--<%= GetName(listEntity[i].getUser1()) %>--%>
                            <%=loginName %>
                        </td>
                        <%--<td align="center">
                            <%= GetName(listEntity[i].getMenu()) %>
                        </td>--%>
                        <td>
                            <a href="javascript:HLRedirect('Add', <%= listEntity[i].ID %>)"><%= listEntity[i].Name%></a>
                        </td>
                        <td align="center">
                            <%= listEntity[i].Code%>
                        </td>
                        <%--<td align="center">
                            <%= listEntity[i].ToChuc_Ten%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ToChuc_TenCoQuan%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ToChuc_DiaChi%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ToChuc_DienThoai%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ToChuc_Fax%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ToChuc_Email%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ToChuc_Web%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ToChuc_LanhDao%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ToChuc_ChucVu%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].TTTN_DiaChi%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].TTTN_DienThoai%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].TTTN_DienThoaiDD%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].TTTN_Fax%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].TTTN_Email%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].HeThongThongTinIDs%>
                        </td>
                        <td align="center">
                            <%= Utils.GetMedia(listEntity[i].File, 40, 40)%>
                        </td>--%>
                        <td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].Published) %>
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

    <script>
        function fnPrint() {
            var cmd_param = '';
            var list_cid = document.getElementsByName('cid');
            for (var i = 0; i < list_cid.length; i++) {
                if (list_cid[i].checked) {
                    cmd_param = list_cid[i].value;
                    break;
                }
            }
            //HLRedirect('Print', cmd_param, 'RecordID');
            open("/TTPortal/Views/Preview/PrintHSThanhVien.aspx?RecordID=" + cmd_param, "_blank");
        }
    </script>

</form>
