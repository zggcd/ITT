<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as FormBaoCaoTongHopModel;
    var listEntity = ViewBag.Data as List<ModBaoCaoTongHopEntity>;
    int c = listEntity != null ? listEntity.Count : 0;
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
                <%if (c == 0)
                    {%>
                <%=GetListCommand("new|Thêm,edit|Sửa,space,delete|Xóa") %>
                <%}
                else
                {%>
                <%=GetListCommand("edit|Sửa,space,delete|Xóa") %>
                <%}%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Báo cáo tổng hợp</h2>
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

        var HLController = 'FormBaoCaoTongHop';

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
            '<%= model.BaoCaoSuCoID %>', 'BaoCaoSuCoID',
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
                            <%= GetSortLink("Người tạo", "UserID")%>
                        </th>
                        <th nowrap="nowrap">
                            <%= GetSortLink("Mã", "Code")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Ngày tạo", "Published")%>
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
                        <td align="center">
                            <a href="javascript:HLRedirect('Add', <%= listEntity[i].ID %>)"><%= listEntity[i].Code%></a>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].Published) %>
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
