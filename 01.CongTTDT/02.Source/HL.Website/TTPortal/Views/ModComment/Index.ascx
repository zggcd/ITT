<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModCommentModel;
    var listEntity = ViewBag.Data as List<ModCommentEntity>;
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
                <%=GetListCommand("new|Thêm,edit|Sửa,space,delete|Xóa,space,config|Xóa cache")%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Bình luận</h2>
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

        var HLController = 'ModComment';

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
                        <%--Chuyên mục : 
                    <select id="filter_menu" onchange="HLRedirect()" class="inputbox" size="1">
                        <option value="0">(Tất cả)</option>
                        <%= Utils.ShowDDLMenuByType("Comment", model.LangID, model.MenuID)%>
                    </select>
                        Vị trí :
                   <select id="filter_state" onchange="HLRedirect()" class="inputbox" size="1">
                       <option value="0">(Tất cả)</option>
                       <%= Utils.ShowDDLByConfigkey("Mod.CommentState", model.State)%>
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
                        <th width="30%" nowrap="nowrap">
                            <%= GetSortLink("Tin tức", "NewsID")%>
                        </th>
                        <%--<th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Chuyên mục", "MenuID")%>
                        </th>--%>
                        <th width="10%" class="title">
                            <%= GetSortLink("Người gửi", "HoTen")%>
                        </th>
                        <th class="title">
                            <%= GetSortLink("Tiêu đề", "Name")%>
                        </th>
                        <%--<th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Mã", "Code")%>
                        </th>--%>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Email", "Email")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Điện thoại", "PhoneNum")%>
                        </th>
                        <%--<th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Create user", "CreateUser")%>
                        </th>--%>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Xuất bản", "Published")%>
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
                            <%= GetName(listEntity[i].getNews()) %>
                        </td>
                        <%--<td align="center">
                            <%= GetName(listEntity[i].getMenu()) %>
                        </td>--%>
                        <td align="center">
                            <%= listEntity[i].HoTen%>
                        </td>
                        <td>
                            <a href="javascript:HLRedirect('Add', <%= listEntity[i].ID %>)"><%= listEntity[i].Name%></a>
                        </td>
                        <%--<td align="center">
                            <%= listEntity[i].Code%>
                        </td>--%>
                        <td align="center">
                            <%= listEntity[i].Email%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].PhoneNum%>
                        </td>
                        <%-- <td align="center">
                            <%= string.Format("{0:#,##0}", listEntity[i].CreateUser)%>
                        </td>--%>
                        <td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].Published) %>
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
