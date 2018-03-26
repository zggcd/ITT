<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<script runat="server">

    List<HL.Lib.Global.ListItem.Item> listParent = null;
    SysMenuModel model = null;
    WebMenuEntity entity = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        model = ViewBag.Model as SysMenuModel;
        entity = ViewBag.Data as WebMenuEntity;

        listParent = HL.Lib.Global.ListItem.List.GetList(WebMenuService.Instance, model.LangID);

        if (model.RecordID > 0)
        {
            //loai bo danh muc con cua danh muc hien tai
            listParent = HL.Lib.Global.ListItem.List.GetListForEdit(listParent, model.RecordID);
        }
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
            <div class="pagetitle icon-48-categories">
                <h2>Chuyên mục : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                            <label>Tên chuyên mục :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Name" value="<%=entity.Name %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Mã :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Code" value="<%=entity.Code %>" maxlength="255" />
                        </td>
                    </tr>
                    <%if (model.ParentID == 0)
                        { %>
                    <tr>
                        <td class="key">
                            <label>Loại :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Type" value="<%=entity.Type %>" maxlength="50" />
                        </td>
                    </tr>
                    <%} %>
                    <%if (entity.Type == "Org")
                      { %>
                    <tr>
                        <td class="key">
                            <label>RSS :</label>
                        </td>
                        <td>
                            <input style="width: 50%;" class="text_input" type="text" name="RSS" value="<%=entity.RSS %>" maxlength="250" />
                            <label style="margin-left: 15px; font-weight: bold;">Chuyên mục :</label>
                            <select style="width: 20%;" name="SourceID" id="SourceID" class="text_input">
                                <option value="0">Root</option>
                                <%= Utils.ShowDDLMenuByType2("RSS", model.LangID, entity.SourceID)%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Mã kỹ thuật :</label>
                        </td>
                        <td>
                            <textarea class="text_input" name="Custom"><%=entity.Custom %></textarea>
                        </td>
                    </tr>
                    <%} %>
                    <tr>
                        <td class="key">
                            <label>Thêm trường dạng text cho tùy chọn này :</label>
                        </td>
                        <td>
                            <input name="IsAddText" <%= entity.IsAddText ? "checked" : "" %> type="radio" value='1' />
                            Có
                    <input name="IsAddText" <%= !entity.IsAddText ? "checked" : "" %> type="radio" value='0' />
                            Không
                        </td>
                    </tr>

                    <tr>
                        <td class="key">
                            <label>Chuyên mục cha :</label>
                        </td>
                        <td>
                            <select class="text_input" name="ParentID">
                                <option value="0">Root</option>
                                <%for (int i = 0; listParent != null && i < listParent.Count; i++)
                                    { %>
                                <option <%if (entity.ParentID.ToString() == listParent[i].Value)
                                    {%>selected<%} %>
                                    value='<%= listParent[i].Value%>'>&nbsp; <%= listParent[i].Name%></option>
                                <%} %>
                            </select>
                        </td>
                    </tr>
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
