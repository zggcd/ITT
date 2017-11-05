<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModAlbumModel;
    var entity = ViewBag.Data as ModAlbumEntity;
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
                <h2>Tin Ảnh : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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

    <%if (model.RecordID > 0)
        { %>
    <script type="text/javascript">
        document.switcher = null;
        window.addEvent('domready', function () {
            toggler = document.id('submenu');
            element = document.id('tab-document1');
            if (element) {
                document.switcher = new JSwitcher(toggler, element, { cookieName: "app1" });
            }
        });
    </script>
    <%} %>

    <%= ShowMessage()%>

    <div id="submenu-box">
        <div class="t">
            <div class="t">
                <div class="t">
                </div>
            </div>
        </div>
        <div class="m">
            <div class="submenu-box">
                <div class="submenu-pad">
                    <ul id="submenu" class="configuration">
                        <li><a id="General" class="active">THÔNG TIN CHUNG</a></li>
                        <li><a id="tab1">ẢNH KÈM THEO</a></li>
                    </ul>
                    <div class="clr">
                    </div>
                </div>
            </div>
            <div class="clr">
            </div>
            <div class="clr">
            </div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b">
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        window.addEvent('domready', function () { new Accordion($$('div#content-sliders-.pane-sliders > .panel > h3.pane-toggler'), $$('div#content-sliders-.pane-sliders > .panel > div.pane-slider'), { onActive: function (toggler, i) { toggler.addClass('pane-toggler-down'); toggler.removeClass('pane-toggler'); i.addClass('pane-down'); i.removeClass('pane-hide'); Cookie.write('jpanesliders_content-sliders-', $$('div#content-sliders-.pane-sliders > .panel > h3').indexOf(toggler)); }, onBackground: function (toggler, i) { toggler.addClass('pane-toggler'); toggler.removeClass('pane-toggler-down'); i.addClass('pane-hide'); i.removeClass('pane-down'); if ($$('div#content-sliders-.pane-sliders > .panel > h3').length == $$('div#content-sliders-.pane-sliders > .panel > h3.pane-toggler').length) Cookie.write('jpanesliders_content-sliders-', -1); }, duration: 300, opacity: false, alwaysHide: true }); });
    </script>

    <div id="element-box">
        <div class="t">
            <div class="t">
                <div class="t">
                </div>
            </div>
        </div>
        <div id="tab-document1" class="col width-100">
            <div id="page-General" class="tab">
                <div class="m">
                    <div class="col width-100">
                        <table class="admintable">
                            <tr>
                                <td class="key">
                                    <label>Chuyên mục :</label>
                                </td>
                                <td>
                                    <select name="MenuID" id="MenuID" class="text_input">
                                        <option value="0">Root</option>
                                        <%= Utils.ShowDDLMenuByType("Album", model.LangID, entity.MenuID)%>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="key">
                                    <label>Vị trí :</label>
                                </td>
                                <td>
                                    <%= Utils.ShowCheckBoxByConfigkey("Mod.AlbumState", "ArrState", entity.State)%>
                                </td>
                            </tr>
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
                                    <label>Tóm tắt :</label>
                                </td>
                                <td>
                                    <textarea class="text_input" style="height: 100px" name="Summary" id="Summary"><%=entity.Summary %></textarea>
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
                                    <label>View :</label>
                                </td>
                                <td>
                                    <input class="text_input" type="text" name="View" id="View" value="<%=entity.View %>" maxlength="255" />
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
                <div class="clr"></div>
            </div>
            <%if (model.RecordID > 0)
                { %>
            <div id="page-tab1" class="tab">
                <iframe src="/TTPortal/FormAlbumDetail/Index.aspx/AlbumID/<%=model.RecordID %>" style='position: static; top: 240px; left: 0px; width: 100%; height: 1000px; z-index: 999; overflow: auto;' frameborder='no'></iframe>
            </div>
            <%} %>
            <div class="b">
                <div class="b">
                    <div class="b">
                    </div>
                </div>
            </div>
        </div>
    </div>

</form>
