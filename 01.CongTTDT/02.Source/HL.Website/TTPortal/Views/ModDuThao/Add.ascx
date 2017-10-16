<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModDuThaoModel;
    var entity = ViewBag.Data as ModDuThaoEntity;
%>

<script type="text/javascript" src="/{CPPath}/Content/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
    CKFinder.setupCKEditor(null, '/{CPPath}/Content/ckfinder/');
</script>

<link rel="stylesheet" type="text/css" href="/Content/datetime/jquery.datetimepicker.css" />

<form id="hlForm" name="hlForm" method="post">
    <input type="hidden" id="_hl_action" name="_hl_action" />

    <div id="toolbar-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="toolbar-list" id="toolbar">
                <%= GetDefaultAddCommand()%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Dự thảo : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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

    <%= ShowMessage()%>

    <div id="element-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="col width-100">
                <table class="admintable">
                    <tr>
                        <td class="key">
                            <label>Tên :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Name" id="Name" value="<%=entity.Name %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Mã :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Code" id="Code" value="<%=entity.Code %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Nội dung :</label>
                        </td>
                        <td class="content">
                            <textarea class="ckeditor" style="width: 100%; height: 500px" name="Content" id="Content"><%=entity.Content%></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>File :</label>
                        </td>
                        <td>
                            <%--<%= Utils.GetMedia(entity.File, 100, 80)%> <br />--%>
                            <input class="text_input" type="text" name="File" id="File" style="width: 80%;" value="<%=entity.File %>" maxlength="255" />
                            <input class="text_input" style="width: 17%;" type="button" onclick="ShowFileForm('File'); return false;" value="Chọn File" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Ngày bắt đầu :</label>
                        </td>
                        <td>
                            <input class="text_input appendedInputDate" type="text" name="StartDate" id="StartDate" value="<%=string.Format("{0:dd/MM/yyyy}", entity.StartDate) %>" maxlength="255" placeholder="dd/MM/yyyy" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Ngày kết thúc :</label>
                        </td>
                        <td>
                            <input class="text_input appendedInputDate" type="text" name="FinishDate" id="FinishDate" value="<%=string.Format("{0:dd/MM/yyyy}", entity.FinishDate) %>" maxlength="255" placeholder="dd/MM/yyyy" />
                        </td>
                    </tr>
                    <%if (CPViewPage.UserPermissions.Approve)
                        {%>
                    <tr>
                        <td class="key">
                            <label>Duyệt :</label>
                        </td>
                        <td>
                            <input name="Activity" <%= entity.Activity ? "checked" : "" %> type="radio" value='1' />
                            Có
                    <input name="Activity" <%= !entity.Activity ? "checked" : "" %> type="radio" value='0' />
                            Không
                        </td>
                    </tr>
                    <%} %>
                </table>
            </div>
            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>

</form>

<script src="/Content/datetime/jquery.datetimepicker.js"></script>
<script type="text/javascript">
    $('.appendedInputDate').datetimepicker({
        onGenerate: function (ct) {
            $(this).find('.xdsoft_date')
                .toggleClass('xdsoft_disabled');
        },
        minDate: '-2/01/1970',
        maxDate: '+2/01/1970',
        timepicker: false,
        format: 'd/m/Y',
        formatDate: 'Y/m/d',
    });
</script>
