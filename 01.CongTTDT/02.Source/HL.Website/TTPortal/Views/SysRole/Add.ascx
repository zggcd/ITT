<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<script runat="server">

    List<CPAccessEntity> listUserAccess = null;
    List<CPModuleEntity> listCPModule = null;
    SysRoleModel model = null;
    CPRoleEntity entity = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        model = ViewBag.Model as SysRoleModel;
        entity = ViewBag.Data as CPRoleEntity;
        listCPModule = ViewBag.CPModule as List<CPModuleEntity>;

        if (model.RecordID > 0)
        {
            listUserAccess = CPAccessService.Instance.CreateQuery()
                                 .Where(o => o.Type == "CP.MODULE" && o.RoleID == model.RecordID)
                                 .ToList();
        }
    }

    int GetAccess(int moduleID)
    {
        if (listUserAccess == null)
            return 0;

        CPAccessEntity obj = listUserAccess.Find(o => o.RefID == moduleID);

        return obj == null ? 0 : obj.Value;
    }
</script>

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
                <%=GetDefaultAddCommand()%>
            </div>
            <div class="pagetitle icon-48-groups">
                <h2>Nhóm người sử dụng : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                            <label>Tên nhóm người sử dụng :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Name" value="<%=entity.Name %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Mã nhóm người sử dụng :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Code" value="<%=entity.Code %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Quyền :</label>
                        </td>
                        <td>
                            <table class="adminlist" style="width: 99%;" cellspacing="1">
                                <thead>
                                    <tr>
                                        <th width="5">#
                                        </th>
                                        <th width="50">Sơ duyệt
                                    <br />
                                            <input onclick="javascript: hl_checkAll(document.forms[0], 'ArrApprove1', this.checked);" type="checkbox" />
                                        </th>
                                        <th width="50">Duyệt
                                    <br />
                                            <input onclick="javascript: hl_checkAll(document.forms[0], 'ArrApprove', this.checked);" type="checkbox" />
                                        </th>
                                        <th width="50">Xóa
                                    <br />
                                            <input onclick="javascript: hl_checkAll(document.forms[0], 'ArrDelete', this.checked);" type="checkbox" />
                                        </th>
                                        <th width="50">Sửa
                                    <br />
                                            <input onclick="javascript: hl_checkAll(document.forms[0], 'ArrEdit', this.checked);" type="checkbox" />
                                        </th>
                                        <th width="50">Thêm
                                    <br />
                                            <input onclick="javascript: hl_checkAll(document.forms[0], 'ArrAdd', this.checked);" type="checkbox" />
                                        </th>
                                        <th width="50">Truy cập<br />
                                            <input onclick="javascript: hl_checkAll(document.forms[0], 'ArrView', this.checked);" type="checkbox" />
                                        </th>
                                        <th class="title">Tên chức năng
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (int i = 0; listCPModule != null && i < listCPModule.Count; i++)
                                        { %>
                                    <tr class="row<%= i%2 %>">
                                        <td>
                                            <%= i + 1%>
                                        </td>
                                        <td align="center">
                                            <input name="ArrApprove1" value="<%= listCPModule[i].ID%>" <%if ((GetAccess(listCPModule[i].ID) & 32) == 32)
                                                { %>checked="checked"
                                                <%} %> <%if ((listCPModule[i].Access & 32) != 32)
                                                { %>disabled="disabled"
                                                <%} %> type="checkbox" />
                                        </td>
                                        <td align="center">
                                            <input name="ArrApprove" value="<%= listCPModule[i].ID%>" <%if ((GetAccess(listCPModule[i].ID) & 16) == 16)
                                                { %>checked="checked"
                                                <%} %> <%if ((listCPModule[i].Access & 16) != 16)
                                                { %>disabled="disabled"
                                                <%} %> type="checkbox" />
                                        </td>
                                        <td align="center">
                                            <input name="ArrDelete" value="<%= listCPModule[i].ID%>" <%if ((GetAccess(listCPModule[i].ID) & 8) == 8)
                                                { %>checked="checked"
                                                <%} %> <%if ((listCPModule[i].Access & 8) != 8)
                                                { %>disabled="disabled"
                                                <%} %> type="checkbox" />
                                        </td>
                                        <td align="center">
                                            <input name="ArrEdit" value="<%= listCPModule[i].ID%>" <%if ((GetAccess(listCPModule[i].ID) & 4) == 4)
                                                { %>checked="checked"
                                                <%} %> <%if ((listCPModule[i].Access & 4) != 4)
                                                { %>disabled="disabled"
                                                <%} %> type="checkbox" />
                                        </td>
                                        <td align="center">
                                            <input name="ArrAdd" value="<%= listCPModule[i].ID%>" <%if ((GetAccess(listCPModule[i].ID) & 2) == 2)
                                                { %>checked="checked"
                                                <%} %> <%if ((listCPModule[i].Access & 2) != 2)
                                                { %>disabled="disabled"
                                                <%} %> type="checkbox" />
                                        </td>
                                        <td align="center">
                                            <input name="ArrView" value="<%= listCPModule[i].ID%>" <%if ((GetAccess(listCPModule[i].ID) & 1) == 1)
                                                { %>checked="checked"
                                                <%} %> <%if ((listCPModule[i].Access & 1) != 1)
                                                { %>disabled="disabled"
                                                <%} %> type="checkbox" />
                                        </td>
                                        <td>
                                            <%= listCPModule[i].Name%>
                                        </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Quyền chuyên mục :</label>
                        </td>
                        <td id="ListMenu">
                            <%--<span>
                                <input type="checkbox" value="0" />Root</span><br />--%>
                            <p><b><u>Chuyên mục Tiếng Việt:</u></b></p>
                            <%= Utils.ShowDDLMenuByTypeWithCheckbox("News", 1, entity.MenuIDs)%>
                            <br />
                            <p><b><u>Chuyên mục Tiếng Anh:</u></b></p>
                            <%= Utils.ShowDDLMenuByTypeWithCheckbox("News", 2, entity.MenuIDs)%>
                        </td>
                    </tr>
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
    <%--<input type="hidden" id="MenuIDs" name="ListMenuID" value="70" />
    <a href="#" id="merge_button">click</a>
    <script>
        $("#merge_button").click(function (event) {
            event.preventDefault();
            var searchIDs = $("#ListMenu input:checkbox:checked").map(function () {
                return $(this).val();
            }).get();
            console.log(searchIDs);
        });
    </script>--%>

</form>
