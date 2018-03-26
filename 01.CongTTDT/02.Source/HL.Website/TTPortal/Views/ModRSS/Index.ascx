<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModRSSModel;
    var listEntity = ViewBag.Data as List<ModRSSEntity>;
    ViewBag.CountTotal = "<img src='/Content/Image/loading.gif' style='height:15px;' />";
    ViewBag.CountByMenuID = "<img src='/Content/Image/loading.gif' style='height:15px;' />";

%>

<style type="text/css">
    .pagination {
        float: left;
    }

    .hide {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background-color: #000;
        -ms-opacity: 0.7;
        opacity: 0.7;
        display: none;
        z-index: 10000;
    }

    .wait {
        padding: 10px;
        background-color: #fff;
        width: 300px;
        /*height: 150px;*/
        border: 1px solid #333;
        position: fixed;
        display: none;
        top: 30%;
        left: 40%;
        z-index: 10001;
        text-align: center;
        line-height: 30px;
        background: #d4d4d4;
        -ms-border-radius: 6px;
        border-radius: 6px;
        -ms-opacity: 0.8;
        opacity: 0.8;
    }

    .Waiting {
        display: inline !important;
    }
</style>

<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
<script src="//code.jquery.com/ui/1.11.2/jquery-ui.js"></script>
<script>
    $(function () {
        $("#from_date").datepicker({ dateFormat: "dd/mm/yy" });
        $("#to_date").datepicker({ dateFormat: "dd/mm/yy" });
    });
</script>
<script src="/mContent/js/Function.js"></script>
<script src="/Content/js/Function.js"></script>
<script type="text/javascript">
    $(document).ready(function() {
        //alert('test');
        getTotal('RSS');
        getCountByMenuID('RSS', '<%=model.MenuID%>');
    });
</script>

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
                <%=GetListCommand("edit|Sửa,space,publish|Duyệt,unpublish|Bỏ duyệt,space,delete|Xóa,space,config|Xóa cache")%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Tin RSS</h2>
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

        var HLController = 'ModRSS';

        var HLArrVar = [
            'filter_state', 'State',
            'filter_menu', 'MenuID',
            'filter_lang', 'LangID',
            'limit', 'PageSize',
            'filter_tt', 'Activity'
        ];


        var HLArrVar_QS = [
            'filter_search', 'SearchText',
            'from_date', 'FromDate',
            'to_date', 'ToDate'
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
                    <td width="100%" colspan="2">
                        <del class="container">
                            <%= GetPagination(model.PageIndex, model.PageSize, model.TotalRecord)%>
                        </del>
                        <%--<span style="line-height: 20px;"><b>(Tổng số tin: <i style="color: red;" id="CountTotal"><%=ViewBag.CountTotal %></i>, Tin theo chuyên mục: <i style="color: red;" id="CountByMenuID"><%=ViewBag.CountByMenuID %></i>)</b></span>--%>
                    </td>
                </tr>
                <tr>
                    <td width="100%">Lọc:
                        <input style="width: 25%; line-height: 20px;" type="text" id="filter_search" value="<%= model.SearchText %>" class="text_area" onchange="HLRedirect();return false;" />
                        Từ:
                        <input style="width: 7%; line-height: 20px;" id="from_date" type="text" name="FromDate" value="<%=model.FromDate %>" maxlength="10" />
                        Đến:
                        <input style="width: 7%; line-height: 20px;" id="to_date" type="text" name="ToDate" value="<%=model.ToDate %>" maxlength="10" />

                        <button onclick="HLRedirect();return false;" style="line-height: 22px;">Tìm kiếm</button>
                    </td>
                    <td nowrap="nowrap">Chuyên mục :
                        <select id="filter_menu" onchange="HLRedirect()" class="inputbox" size="1">
                            <option value="0">(Tất cả)</option>
                            <%= Utils.ShowDDLMenuByType2("RSS", model.LangID, model.MenuID)%>
                        </select>
                        Vị trí :
                   <select id="filter_state" onchange="HLRedirect()" class="inputbox" size="1">
                       <option value="0">(Tất cả)</option>
                       <%= Utils.ShowDDLByConfigkey("Mod.RSSState", model.State)%>
                   </select>

                        Trạng thái : 
                        <select id="filter_tt" onchange="HLRedirect()" class="inputbox" size="1">
                            <option value="0">(Tất cả)</option>
                            <%= Utils.ShowDDLActivity(model.Activity)%>
                        </select>
                        <%--                        Vị trí :
                   <select id="filter_state" onchange="HLRedirect()" class="inputbox" size="1">
                         <option value="0">(Tất cả)</option>
                         <%= Utils.ShowDDLByConfigkey("Mod.ThaoLuanState", model.State)%>
                    </select>--%>
                        <%--Ngôn ngữ :<%= ShowDDLLang(model.LangID)%>--%>
                    </td>
                </tr>

                <%--                <tr>
                    <td width="100%"></td>
                    <td nowrap="nowrap">Chuyên mục : 
                    <select id="filter_menu" onchange="HLRedirect()" class="inputbox" size="1">
                        <option value="0">(Tất cả)</option>
                        <%= Utils.ShowDDLMenuByType("RSS", model.LangID, model.MenuID)%>
                    </select>
                        Vị trí :
                   <select id="filter_state" onchange="HLRedirect()" class="inputbox" size="1">
                       <option value="0">(Tất cả)</option>
                       <%= Utils.ShowDDLByConfigkey("Mod.RSSState", model.State)%>
                   </select>
                        Ngôn ngữ :<%= ShowDDLLang(model.LangID)%>
                    </td>
                </tr>--%>
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
                        <th nowrap="nowrap">
                            <%= GetSortLink("Tiêu đề", "Title")%>
                        </th>
                        <th nowrap="nowrap">
                            <%= GetSortLink("Đường dẫn", "Url")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Nguồn", "Nguon")%>
                        </th>
                        <th width="10%" nowrap="nowrap">
                            <%= GetSortLink("Chuyên mục", "MenuID")%>
                        </th>
                        <%--<th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Lượt xem", "View")%>
                        </th>--%>
                        <%--<th style="width: 40px" nowrap="nowrap">
                            <%= GetSortLink("Ảnh", "File")%>
                        </th>--%>
                        <th width="10%" nowrap="nowrap">
                            <%= GetSortLink("Ngày đăng", "Published")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Duyệt", "Activity")%>
                        </th>
                    </tr>
                </thead>
                <%--                <tfoot>
                    <tr>
                        <td colspan="15">
                            <del class="container">
                                <%= GetPagination(model.PageIndex, model.PageSize, model.TotalRecord)%>
                            </del>
                        </td>
                    </tr>
                </tfoot>--%>
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
                        <td align="left">
                            <%= listEntity[i].ID%>
                        </td>
                        <td align="left">
                            <a href="javascript:HLRedirect('Add', <%= listEntity[i].ID %>)"><%= listEntity[i].Name%></a>
                        </td>
                        <td align="left">
                            <a href="<%= listEntity[i].Url%>" target="_blank"><%= listEntity[i].Url%></a>
                        </td>
                        <td align="left">
                            <%= listEntity[i].Nguon%>
                        </td>
                        <td align="left">
                            <%--<%= GetName(listEntity[i].getMenu()) %>--%>
                            <select onchange="updateMenuID('RSS', <%=listEntity[i].ID %>, this.value);" class="inputbox" size="1" style="border: none; background-color: transparent;">
                                <%= Utils.ShowDDLMenuByType2("RSS", model.LangID, listEntity[i].MenuID)%>
                            </select>
                        </td>
                        <%--<td align="right">
                            <%= string.Format("{0:#,##0}", listEntity[i].View)%>
                        </td>--%>
                        <%--<td align="center">
                            <%= Utils.GetMedia(listEntity[i].File, 40, 40)%>
                        </td>--%>
                        <td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].Published) %>
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

    <div class="hide"></div>
    <div class="wait" style="display: none;" id="Waiting">
        <img src="/Content/image/loading.gif" />
        <p style="color: red; font-style: italic; font-weight: bold; font-size: 13px;">Đang cập nhật dữ liệu, vui lòng chờ giây lát...</p>
    </div>
</form>
