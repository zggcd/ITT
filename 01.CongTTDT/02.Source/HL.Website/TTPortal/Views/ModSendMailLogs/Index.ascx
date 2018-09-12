<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl"%>

<%
    var model = ViewBag.Model as ModSendMailLogsModel;
    var listEntity = ViewBag.Data as List<ModSendMailLogsEntity>;
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
            <h2>Send mail logs</h2>
        </div>
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"> <div class="b"></div></div></div>
</div>
<div class="clr"></div>

<script type="text/javascript">

    var HLController = 'ModSendMailLogs';

    var HLArrVar = [ 
                        'limit', 'PageSize'
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
                        <%= GetSortLink("Dich vu canh bao", "DichVuCanhBaoID")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Incident i ds", "IncidentIDs")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Email from", "EmailFrom")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Email to", "EmailTo")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Email cc", "EmailCc")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Email bcc", "EmailBcc")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Attach file path", "AttachFilePath")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Subject", "Subject")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Body", "Body")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Xuất bản", "Publish")%>
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
                       <%= GetName(listEntity[i].getDichVuCanhBao()) %>
                    </td>
                    <td align="center">
                       <%= listEntity[i].IncidentIDs%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].EmailFrom%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].EmailTo%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].EmailCc%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].EmailBcc%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].AttachFilePath%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].Subject%>
                    </td>
                    <td align="center">
                       <%= listEntity[i].Body%>
                    </td>
                    <td align="center">
                       <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].Publish) %>
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
