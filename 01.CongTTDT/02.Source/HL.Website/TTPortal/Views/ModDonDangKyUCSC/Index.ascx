<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModDonDangKyUCSCModel;
    var listEntity = ViewBag.Data as List<ModDonDangKyUCSCEntity>;
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
                <h2>Đơn đăng ký ứng cứu sự cố</h2>
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

        var HLController = 'ModDonDangKyUCSC';

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
                        <%= Utils.ShowDDLMenuByType("DonDangKyUCSC", model.LangID, model.MenuID)%>
                    </select>
                        Vị trí :
                   <select id="filter_state" onchange="HLRedirect()" class="inputbox" size="1">
                       <option value="0">(Tất cả)</option>
                       <%= Utils.ShowDDLByConfigkey("Mod.DonDangKyUCSCState", model.State)%>
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
                            <%= GetSortLink("To chuc_ fax", "ToChuc_Fax")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("To chuc_ email", "ToChuc_Email")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("He thong thong tin i ds", "HeThongThongTinIDs")%>
                        </th>
                        <th style="width: 40px" nowrap="nowrap">
                            <%= GetSortLink("Ảnh", "File")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Thong tin l l_ web", "ThongTinLL_Web")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Thong tin l l_ thu d t_ ten", "ThongTinLL_ThuDT_Ten")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Thong tin l l_ thu d t_ fingerprint", "ThongTinLL_ThuDT_Fingerprint")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Thong tin l l_ thu d t_ link to public key", "ThongTinLL_ThuDT_LinkToPublicKey")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Dau moi l l_ trong gio_ ten", "DauMoiLL_TrongGio_Ten")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Dau moi l l_ trong gio_ dien thoai", "DauMoiLL_TrongGio_DienThoai")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Dau moi l l_ trong gio_ dien thoai d d", "DauMoiLL_TrongGio_DienThoaiDD")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Dau moi l l_ trong gio_ fax", "DauMoiLL_TrongGio_Fax")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Dau moi l l_ ngoai gio_ ten", "DauMoiLL_NgoaiGio_Ten")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Dau moi l l_ ngoai gio_ dien thoai", "DauMoiLL_NgoaiGio_DienThoai")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Dau moi l l_ ngoai gio_ dien thoai d d", "DauMoiLL_NgoaiGio_DienThoaiDD")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Dau moi l l_ ngoai gio_ fax", "DauMoiLL_NgoaiGio_Fax")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Dau moi lanh dao_ ten", "DauMoiLanhDao_Ten")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Dau moi lanh dao_ dien thoai", "DauMoiLanhDao_DienThoai")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Dau moi lanh dao_ dien thoai d d", "DauMoiLanhDao_DienThoaiDD")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("D c nhan thu_ ten bo phan", "DCNhanThu_TenBoPhan")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("D c nhan thu_ vi tri", "DCNhanThu_ViTri")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("D c nhan thu_ ten to chuc", "DCNhanThu_TenToChuc")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("D c nhan thu_ dia chi", "DCNhanThu_DiaChi")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("D c nhan thu_ dien thoai", "DCNhanThu_DienThoai")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("L l khac_ yahoo", "LLKhac_Yahoo")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("L l khac_ skype", "LLKhac_Skype")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("L l khac_ google talk", "LLKhac_GoogleTalk")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("L l khac_ hotmail", "LLKhac_Hotmail")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("L l khac_ khac", "LLKhac_Khac")%>
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
                            <%= listEntity[i].ToChuc_Fax%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ToChuc_Email%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].HeThongThongTinIDs%>
                        </td>
                        <td align="center">
                            <%= Utils.GetMedia(listEntity[i].File, 40, 40)%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ThongTinLL_Web%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ThongTinLL_ThuDT_Ten%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ThongTinLL_ThuDT_Fingerprint%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ThongTinLL_ThuDT_LinkToPublicKey%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].DauMoiLL_TrongGio_Ten%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].DauMoiLL_TrongGio_DienThoai%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].DauMoiLL_TrongGio_DienThoaiDD%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].DauMoiLL_TrongGio_Fax%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].DauMoiLL_NgoaiGio_Ten%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].DauMoiLL_NgoaiGio_DienThoai%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].DauMoiLL_NgoaiGio_DienThoaiDD%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].DauMoiLL_NgoaiGio_Fax%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].DauMoiLanhDao_Ten%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].DauMoiLanhDao_DienThoai%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].DauMoiLanhDao_DienThoaiDD%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].DCNhanThu_TenBoPhan%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].DCNhanThu_ViTri%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].DCNhanThu_TenToChuc%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].DCNhanThu_DiaChi%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].DCNhanThu_DienThoai%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].LLKhac_Yahoo%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].LLKhac_Skype%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].LLKhac_GoogleTalk%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].LLKhac_Hotmail%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].LLKhac_Khac%>
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
