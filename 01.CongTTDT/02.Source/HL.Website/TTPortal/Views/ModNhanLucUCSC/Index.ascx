<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModNhanLucUCSCModel;
    var listEntity = ViewBag.Data as List<ModNhanLucUCSCEntity>;

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
                <ul style="float: left; padding-right: 15px;">
                    <li id="toolbar-apply" class="button">
                        <a class="toolbar" href="javascript: void(0)" onclick="hl_exec_cmd('Export')">
                            <span title="Xuất Excel" class="icon-32-fileexport"></span>Xuất File</a>
                    </li>
                </ul>
                <%=GetListCommand("cancel|Đóng")%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Nhân lực</h2>
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

        var HLController = 'ModNhanLucUCSC';

        var HLArrVar = [
            'filter_tv', 'ThanhVienID',
            'filter_trinhdo', 'MenuIDs_TrinhDoDT',
            'filter_chungchi', 'MenuIDs_ChungChi',
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

                    <!-- Chức năng tìm kiếm, thống kê nhân lực theo thành viên, theo trình độ và theo văn bằng chứng chỉ, theo khu vực. Export excel danh sách nhân lực -->
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

                        <span>Trình độ</span>
                        <select id="filter_trinhdo" onchange="HLRedirect()" class="inputbox" size="1">
                            <option value="0">(Tất cả)</option>
                            <%= Utils.ShowDDLMenuByType2("TrinhDoDaoTao", model.LangID, model.MenuIDs_TrinhDoDT)%>
                        </select>

                        <span>Văn bằng chứng chỉ</span>
                        <select id="filter_chungchi" onchange="HLRedirect()" class="inputbox" size="1">
                            <option value="0">(Tất cả)</option>
                            <%= Utils.ShowDDLMenuByType2("ChungChi", model.LangID, model.MenuIDs_ChungChi)%>
                        </select>

                        <span>Ngôn ngữ</span>
                        <%= ShowDDLLang(model.LangID)%>
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
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Đơn đăng ký UCSC", "DonDangKyUCSCID")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Hồ sơ UCSC", "ModHSThanhVienUCSC")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Trình độ", "MenuIDs_TrinhDoDT")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Văn bằng, chứng chỉ", "MenuIDs_ChungChi")%>
                        </th>
                        <th class="title">
                            <%= GetSortLink("Họ tên", "Name")%>
                        </th>
                        <th width="10%" nowrap="nowrap">
                            <%= GetSortLink("Trường", "School")%>
                        </th>
                        <%--<th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Menu i ds_ linh vuc d t", "MenuIDs_LinhVucDT")%>
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
                        </th>--%>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Năm tốt nghiệp", "NamTotNghiep")%>
                        </th>
                        <%--<th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Xuất bản", "Published")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Thứ tự", "Order")%>
                            <a href="javascript:hl_exec_cmd('saveorder')" class="saveorder" title="Lưu sắp xếp"></a>
                        </th>
                        <th width="1%" nowrap="nowrap">
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
                            var lstTd = listEntity[i].getMenuTrinhDo().Select(o => o.Name).ToArray();
                            var lstCc = listEntity[i].getMenuChungChi().Select(o => o.Name).ToArray();
                            string td = "", cc = "";
                            if (lstTd.Length > 0) td = string.Join(",", lstTd);
                            if (lstCc.Length > 0) cc = string.Join(",", lstCc);
                            var donDk = ModDonDangKyUCSCService.Instance.CreateQuery()
                                .Where(o => o.Activity == true && o.ID == listEntity[i].DonDangKyUCSCID)
                                .ToSingle();
                            var hSThanhVien = ModHSThanhVienUCSCService.Instance.CreateQuery()
                                .Where(o => o.Activity == true && o.ID == listEntity[i].HSThanhVienUCSCID)
                                .ToSingle();
                            int idThanhVien = 0;
                            if (donDk != null) idThanhVien = donDk.UserID;
                            else if (hSThanhVien != null) idThanhVien = hSThanhVien.UserID;
                            var thanhVien = CPUserService.Instance.CreateQuery()
                            .Where(o => o.Activity == true)
                            .Where(idThanhVien > 0, o => o.ID == idThanhVien)
                            .ToSingle();
                            //var thanhVien = lstThanhVien.Where(o => o.ID == listEntity[i].HSThanhVienUCSCID || o.ID == listEntity[i].DonDangKyUCSCID).FirstOrDefault();
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
                        <td align="center">
                            <%= GetName(listEntity[i].getDonDangKyUCSC()) %>
                        </td>
                        <td align="center">
                            <%= GetName(listEntity[i].getModHSThanhVienUCSC()) %>
                        </td>
                        <td align="center">
                            <%= td%>
                        </td>
                        <td align="center">
                            <%= cc%>
                        </td>
                        <td>
                            <%--<a href="javascript:HLRedirect('Add', <%= listEntity[i].ID %>)"><%= listEntity[i].Name%></a>--%>
                            <%= listEntity[i].Name%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].School%>
                        </td>
                        <%--<td align="center">
                            <%= listEntity[i].MenuIDs_LinhVucDT%>
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
                        </td>--%>
                        <td align="center">
                            <%= listEntity[i].NamTotNghiep%>
                        </td>
                        <%--<td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].Published) %>
                        </td>
                        <td class="order">
                            <%= GetOrder(listEntity[i].ID, listEntity[i].Order)%>
                        </td>
                        <td align="center">
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
