<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<% 
    var model = ViewBag.Model as ModNewsModel;
    var listEntity = ViewBag.Data as List<ModNewsEntity>;
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

                <%if (CPViewPage.UserPermissions.Approve)
                    { %>
                <%=GetListCommand("new|Thêm,edit|Sửa,space,publish|Duyệt,unpublish|Bỏ duyệt,space,delete|Xóa,copy|Sao chép,space,config|Xóa cache") %>
                <%}
                    else if (CPViewPage.UserPermissions.Approve1)
                    {%>
                <%=GetListCommand("new|Thêm,edit|Sửa,space,publish1|Duyệt,unpublish1|Bỏ duyệt,space,delete|Xóa,copy|Sao chép,space,config|Xóa cache") %>
                <%}
                    else
                    {%>
                <%=GetListCommand("new|Thêm,edit|Sửa,space,delete|Xóa,copy|Sao chép,space,config|Xóa cache") %>
                <%} %>
            </div>
            <div class="pagetitle icon-48-article">
                <h2>Bài viết</h2>
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

        var HLController = 'ModNews';

        var HLArrVar = [
            'filter_menu', 'MenuID',
            'filter_state', 'State',
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
                        <input type="text" value="<%= model.SearchText %>" id="filter_search" class="text_area" onchange="HLRedirect();return false;" />
                        <button onclick="HLRedirect();return false;">Tìm kiếm</button>
                    </td>
                    <td nowrap="nowrap">Chuyên mục : 
                    <select id="filter_menu" onchange="HLRedirect()" class="inputbox" size="1">
                        <option value="0">(Tất cả)</option>
                        <%= Utils.ShowDDLMenuByType("News", model.LangID, model.MenuID)%>
                    </select>
                        Vị trí :
                   <select id="filter_state" onchange="HLRedirect()" class="inputbox" size="1">
                       <option value="0">(Tất cả)</option>
                       <%= Utils.ShowDDLByConfigkey("Mod.NewsState", model.State)%>
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
                        <th style="width: 40px" nowrap="nowrap">
                            <%= GetSortLink("Ảnh", "File")%>
                        </th>
                        <th class="title">
                            <%= GetSortLink("Tiêu đề", "Name")%>
                        </th>
                        <th nowrap="nowrap">
                            <%= GetSortLink("Chuyên mục", "MenuID")%>
                        </th>
                        <th nowrap="nowrap">
                            <%= GetSortLink("Người biên tập", "UserID")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Xuất bản", "Published")%>
                        </th>
                        <%if (CPViewPage.UserPermissions.Approve1)
                            { %>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Duyệt", "Activity1")%>
                        </th>
                        <%} %>
                        <%if (CPViewPage.UserPermissions.Approve)
                            { %>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Duyệt", "Activity")%>
                        </th>
                        <%} %>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Sắp xếp", "Order")%>
                            <a href="javascript:hl_exec_cmd('saveorder')" class="saveorder" title="Lưu sắp xếp"></a>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("ID", "ID")%>
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
                            <%= Utils.GetMedia(listEntity[i].File, 40, 40)%>
                        </td>
                        <td>
                            <a href="javascript:HLRedirect('Add', <%= listEntity[i].ID %>)"><%= listEntity[i].Name%></a>
                            <p class="smallsub">(<span>Mã</span>: <%= listEntity[i].Code%>)</p>
                        </td>
                        <td align="center">
                            <%= GetName(listEntity[i].getMenu()) %>
                        </td>
                        <td align="center">
                            <%= GetName(listEntity[i].getMenu()) %>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:dd-MM-yyyy HH:mm}", listEntity[i].Published) %>
                        </td>
                        <%if (CPViewPage.UserPermissions.Approve1)
                            { %>
                        <td align="center">
                            <%if (!listEntity[i].Activity1)
                                { %><a class="jgrid" href="javascript:void(0);" onclick="hl_exec_cmd('[activity1][<%= listEntity[i].ID %>]')"><%}
    else
    {%><a class="jgrid" href="javascript:void(0);" onclick="hl_exec_cmd('[unactivity1][<%= listEntity[i].ID %>]')"><%}%>
                                    <span class="jgrid">
                                        <span class="state <%= listEntity[i].Activity1 ? "publish" : "unpublish" %>"></span>
                                    </span>
                                    </a>
                        </td>
                        <%} %>
                        <%if (CPViewPage.UserPermissions.Approve)
                            { %>
                        <td align="center">
                            <%= GetPublish(listEntity[i].ID, listEntity[i].Activity)%>
                        </td>
                        <%} %>
                        <td class="order">
                            <%= GetOrder(listEntity[i].ID, listEntity[i].Order)%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ID%>
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
