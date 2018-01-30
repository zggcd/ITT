<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModBaoCaoBanDauSuCoModel;
    var listEntity = ViewBag.Data as List<ModBaoCaoBanDauSuCoEntity>;
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
                <h2>Bao cáo ban đầu sự cố</h2>
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

        var HLController = 'ModBaoCaoBanDauSuCo';

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
                        <%= Utils.ShowDDLMenuByType("BaoCaoBanDauSuCo", model.LangID, model.MenuID)%>
                    </select>
                        Vị trí :
                   <select id="filter_state" onchange="HLRedirect()" class="inputbox" size="1">
                       <option value="0">(Tất cả)</option>
                       <%= Utils.ShowDDLByConfigkey("Mod.BaoCaoBanDauSuCoState", model.State)%>
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
                            <%= GetSortLink("User i d1", "UserID1")%>
                        </th>--%>
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
                            <%= GetSortLink("To chuc_ dia chi", "ToChuc_DiaChi")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("To chuc_ dien thoai", "ToChuc_DienThoai")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("To chuc_ email", "ToChuc_Email")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Nguoi lien he_ ten", "NguoiLienHe_Ten")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Nguoi lien he_ chuc vu", "NguoiLienHe_ChucVu")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Nguoi lien he_ dien thoai", "NguoiLienHe_DienThoai")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Nguoi lien he_ email", "NguoiLienHe_Email")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Chi tiet_ ten don vi", "ChiTiet_TenDonVi")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Chi tiet_ co quan", "ChiTiet_CoQuan")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Chi tiet_ ten he thong", "ChiTiet_TenHeThong")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Chi tiet_ phan loai", "ChiTiet_PhanLoaiID")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Chi tiet_ ten to chuc cung cap", "ChiTiet_TenToChucCungCap")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Chi tiet_ ten n c c_ ben ngoai", "ChiTiet_TenNCC_BenNgoai")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Chi tiet_ ten n c c", "ChiTiet_TenNCC")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Chi tiet_ mo ta", "ChiTiet_MoTa")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Chi tiet_ ngay gio phat hien", "ChiTiet_NgayGioPhatHien")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Hien trang", "HienTrangID")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("T t them_ he dieu hanh", "TTThem_HeDieuHanh")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("T t them_ version", "TTThem_Version")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("T t them_ danh sach i p", "TTThem_DanhSachIP")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("T t them_ danh sach ten mien", "TTThem_DanhSachTenMien")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("T t them_ muc dich su dung", "TTThem_MucDichSuDung")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Thoi gian thuc hien", "ThoiGianThucHien")%>
                        </th>--%>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Xuất bản", "Published")%>
                        </th>
                        <%--<th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Published1", "Published1")%>
                        </th>--%>
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
                            <%= GetName(listEntity[i].getUser1()) %>
                        </td>
                        <%--<td align="center">
                            <%= string.Format("{0:#,##0}", listEntity[i].UserID1)%>
                        </td>--%>
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
                            <%= listEntity[i].ToChuc_DiaChi%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ToChuc_DienThoai%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ToChuc_Email%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].NguoiLienHe_Ten%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].NguoiLienHe_ChucVu%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].NguoiLienHe_DienThoai%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].NguoiLienHe_Email%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ChiTiet_TenDonVi%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ChiTiet_CoQuan%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ChiTiet_TenHeThong%>
                        </td>
                        <td align="center">
                            <%= GetName(listEntity[i].getChiTiet_PhanLoai()) %>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ChiTiet_TenToChucCungCap%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ChiTiet_TenNCC_BenNgoai%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ChiTiet_TenNCC%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ChiTiet_MoTa%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].ChiTiet_NgayGioPhatHien) %>
                        </td>
                        <td align="center">
                            <%= GetName(listEntity[i].getHienTrang()) %>
                        </td>
                        <td align="center">
                            <%= listEntity[i].TTThem_HeDieuHanh%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].TTThem_Version%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].TTThem_DanhSachIP%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].TTThem_DanhSachTenMien%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].TTThem_MucDichSuDung%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].ThoiGianThucHien) %>
                        </td>--%>
                        <td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].Published) %>
                        </td>
                        <%--<td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].Published1) %>
                        </td>--%>
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
