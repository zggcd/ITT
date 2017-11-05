<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl"%>

<%
    var model = ViewBag.Model as ModConfigSendMailModel;
    var listEntity = ViewBag.Data as List<ModConfigSendMailEntity>;
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
            <h2>Cấu hình Email</h2>
        </div>
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"> <div class="b"></div></div></div>
</div>
<div class="clr"></div>

<script type="text/javascript">

    var HLController = 'ModConfigSendMail';

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
        '20', 'PageSize',
        '1', 'LangID'
    ];
</script>

<%= ShowMessage()%>

<div id="element-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">

       <table>
           <tr>
                    <td width="100%" colspan="2">
                        <del class="container">
                            <%= GetPagination(model.PageIndex, model.PageSize, model.TotalRecord)%>
                        </del>
                        <%--<span style="line-height: 20px;"><b>(Tổng số tin: <i style="color: red;" id="CountTotal"><%=ViewBag.CountTotal %></i>, Tin theo chuyên mục: <i style="color: red;"><%= string.Format("{0:#,##0}", model.TotalRecord) %></i>)</b></span>--%>
                    </td>
                </tr>
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
                    <th nowrap="nowrap">
                        <%= GetSortLink("Loại Email", "MailType")%>
                    </th>
                    <th nowrap="nowrap">
                        <%= GetSortLink("Email gửi", "SmtpUser")%>
                    </th>
                    <th nowrap="nowrap">
                        <%= GetSortLink("Email nhận", "ToMail")%>
                    </th>
                    <%--<th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Mật khẩu", "SmtpPass")%>
                    </th>--%>
                    <%--<th width="10%" nowrap="nowrap">
                        <%= GetSortLink("Server", "SmtpServer")%>
                    </th>
                    <th width="5%" nowrap="nowrap">
                        <%= GetSortLink("Cổng", "SmtpPort")%>
                    </th>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Smtp ssl", "SmtpSSL")%>
                    </th>--%>
                    <th width="1%" nowrap="nowrap">
                        <%= GetSortLink("Duyệt", "Activity")%>
                    </th>
                </tr>
            </thead>
            <%--<tfoot>
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
                    <td align="left">
                        <%= i + 1%>
                    </td>
                    <td align="left">
                        <%= GetCheckbox(listEntity[i].ID, i)%>
                    </td>
                    <td align="left">
                       <%= string.Format("{0:#,##0}", listEntity[i].ID)%>
                    </td>
                    <td align="left">
                       <%= listEntity[i].MailType > 0 ? WebMenuService.Instance.GetByID(listEntity[i].MailType).Name : "Tất cả"%>
                    </td>
                    <td align="left">
                       <a href="javascript:HLRedirect('Add', <%= listEntity[i].ID %>)"><%= listEntity[i].SmtpUser%></a>
                    </td>
                    <td align="left">
                       <%= listEntity[i].ToMail%>
                    </td>
                    <%--<td align="center">
                       <%= listEntity[i].SmtpPass%>
                    </td>--%>
                     <%--<td align="left">
                       <%= listEntity[i].SmtpServer%>
                    </td>
                   <td align="left">
                       <%= string.Format("{0:#,##0}", listEntity[i].SmtpPort)%>
                    </td>
                    <td align="center">
                       <a class="jgrid" href="javascript:void(0);" onclick="hl_exec_cmd('[smtpsslgx][<%= listEntity[i].ID %>,<%= !listEntity[i].SmtpSSL %>]')">
                          <span class="jgrid">
                             <span class="state <%= listEntity[i].SmtpSSL ? "publish" : "unpublish" %>"></span>
                          </span>
                       </a>
                    </td>--%>
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
