<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl"%>

<%
    var model = ViewBag.Model as ModNhanLucUCSCModel;
    var listEntity = ViewBag.Data as List<ModNhanLucUCSCEntity>;
%>

<form id="hlForm" name="hlForm" method="post">

<input type="hidden" id="_hl_action" name="_hl_action" />
<input type="hidden" id="boxchecked" name="boxchecked" value="0" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%=GetDefaultListCommand()%>
        </div>
        <div class="pagetitle icon-48-generic">
            <h2>Nhan luc u c s c</h2>
        </div>
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"> <div class="b"></div></div></div>
</div>
<div class="clr"></div>

<script type="text/javascript">

    var HLController = 'ModNhanLucUCSC';

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
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">

       <table>
            <tr>
                <td width="100%">
                     Lọc: <input type="text" id="filter_search" value="<%= model.SearchText %>" class="text_area" onchange="HLRedirect();return false;" />
                    <button onclick="HLRedirect();return false;">Tìm kiếm</button>
                </td>
                <td nowrap="nowrap">
                </td>
            </tr>
        </table>

        <table class="adminlist" cellspacing="1">
            <thead>
                <tr>
                    <th width="1%">
                        #
                    </th>
                    <th width="1%">
                        <input type="checkbox" name="toggle" value="" onclick="checkAll(<%= model.PageSize %>);" />
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("ID", "ID")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Don dang ky u c s c", "DonDangKyUCSCID")%>
                    </th>
                    <th class="title">
                        <%= GetSortLink("Tên", "Name")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("School", "School")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Menu i ds_ linh vuc d t", "MenuIDs_LinhVucDT")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Menu i ds_ trinh do d t", "MenuIDs_TrinhDoDT")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Menu i ds_ chung chi", "MenuIDs_ChungChi")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Menu i ds_ quan ly a t t t", "MenuIDs_QuanLyATTT")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Menu i ds_ ky thuat phong thu", "MenuIDs_KyThuatPhongThu")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Menu i ds_ ky thuat bao ve", "MenuIDs_KyThuatBaoVe")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Menu i ds_ ky thuat kiem tra", "MenuIDs_KyThuatKiemTra")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Thang tot nghiep", "ThangTotNghiep")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Nam tot nghiep", "NamTotNghiep")%>
                    </th>
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
                       <%= GetName(listEntity[i].getDonDangKyUCSC()) %>
                    </td>
                    <td>
                        <a href="javascript:HLRedirect('Add', <%= listEntity[i].ID %>)"><%= listEntity[i].Name%></a>
                    </td>
                    <td align="center">
                       <%= listEntity[i].School%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].MenuIDs_LinhVucDT%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].MenuIDs_TrinhDoDT%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].MenuIDs_ChungChi%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].MenuIDs_QuanLyATTT%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].MenuIDs_KyThuatPhongThu%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].MenuIDs_KyThuatBaoVe%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].MenuIDs_KyThuatKiemTra%>
                    </td>
                    <td align="center">
                       <%= string.Format("{0:#,##0}", listEntity[i].ThangTotNghiep)%>
                    </td>
                    <td align="center">
                       <%= string.Format("{0:#,##0}", listEntity[i].NamTotNghiep)%>
                    </td>
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
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>

</form>
