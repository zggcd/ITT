<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModCommentModel;
    var entity = ViewBag.Data as ModCommentEntity;
%>

<script type="text/javascript" src="/{CPPath}/Content/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
    CKFinder.setupCKEditor(null, '/{CPPath}/Content/ckfinder/');
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
                <%= GetDefaultAddCommand()%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Bình luận : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                            <label>Tin tức :</label>
                        </td>
                        <td>
                            <% List<ModNewsEntity> listNews = ModNewsService.Instance.CreateQuery().ToList(); %>
                            <select name="NewsID" id="NewsID" class="text_input">
                                <option value="0">-</option>
                                <%for (int i = 0; listNews != null && i < listNews.Count; i++)
                                    { %>
                                <option <%if (entity.NewsID == listNews[i].ID)
                                    {%> selected <%} %> value="<%= listNews[i].ID%>"><%= listNews[i].Name%></option>
                                <%} %>
                            </select>
                        </td>
                    </tr>
                    <%--<tr>
                        <td class="key">
                            <label>Chuyên mục :</label>
                        </td>
                        <td>
                            <select name="MenuID" id="MenuID" class="text_input">
                                <option value="0">Root</option>
                                <%= Utils.ShowDDLMenuByType("Comment", model.LangID, entity.MenuID)%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Vị trí :</label>
                        </td>
                        <td>
                            <%= Utils.ShowCheckBoxByConfigkey("Mod.CommentState", "ArrState", entity.State)%>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="key">
                            <label>Họ tên :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="HoTen" id="HoTen" value="<%=entity.HoTen %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Tiêu đề :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Name" id="Name" value="<%=entity.Name %>" maxlength="255" />
                        </td>
                    </tr>
                    <%--<tr>
                        <td class="key">
                            <label>Mã :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Code" id="Code" value="<%=entity.Code %>" maxlength="255" />
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="key">
                            <label>Email :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Email" id="Email" value="<%=entity.Email %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Điện thoại :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="PhoneNum" id="PhoneNum" value="<%=entity.PhoneNum %>" maxlength="255" />
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
                    <%--<tr>
                        <td class="key">
                            <label>Create user :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="CreateUser" id="CreateUser" value="<%=entity.CreateUser %>" maxlength="255" />
                        </td>
                    </tr>--%>
                    <%--<%if (CPViewPage.UserPermissions.Approve)
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
                    <%} %>--%>
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
