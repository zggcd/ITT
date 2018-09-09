<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl"%>

<%
    var model = ViewBag.Model as ModImportLogsModel;
    var listEntity = ViewBag.Data as List<ModImportLogsEntity>;
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
            <h2>Import logs</h2>
        </div>
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"> <div class="b"></div></div></div>
</div>
<div class="clr"></div>

<script type="text/javascript">

    var HLController = 'ModImportLogs';

    var HLArrVar = [
                        'filter_menu', 'MenuID',
                        'filter_lang', 'LangID',  
                        'limit', 'PageSize'
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
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">

       <table>
            <tr>
                <td width="100%">
                </td>
                <td nowrap="nowrap">
                   Chuyên mục : 
                    <select id="filter_menu" onchange="HLRedirect()" class="inputbox" size="1">
                         <option value="0">(Tất cả)</option>
                         <%= Utils.ShowDDLMenuByType("ImportLogs", model.LangID, model.MenuID)%> 
                    </select>
                   Ngôn ngữ :<%= ShowDDLLang(model.LangID)%>
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
                        <%= GetSortLink("Chuyên mục", "MenuID")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("File name", "FileName")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Messages", "Messages")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Error rows", "ErrorRows")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Xuất bản", "Publish")%>
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
                       <%= GetName(listEntity[i].getMenu()) %>
                    </td>
                    <td align="center">
                       <%= listEntity[i].FileName%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].Messages%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].ErrorRows%>
                    </td>
                    <td align="center">
                       <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].Publish) %>
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
