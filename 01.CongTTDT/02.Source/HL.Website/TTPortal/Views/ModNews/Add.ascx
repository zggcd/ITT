<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<% 
    var model = ViewBag.Model as ModNewsModel;
    var entity = ViewBag.Data as ModNewsEntity;
    string roleCode = ViewBag.RoleCode as string;
%>

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
                <%--<%= GetDefaultAddCommand()%>--%>
                <%if (roleCode == "GD" || roleCode == "Admin")
                    {%>
                <%=GetListCommand("apply|Lưu,save|Lưu  &amp; đóng,save-new|Lưu &amp; thêm,space,cancel|Đóng") %>
                <%}
                    else if (roleCode == "TP")
                    {%>
                <%if (entity.Activity == true)
                    {%>
                <%=GetListCommand("cancel|Đóng") %>
                <%}
                    else
                    {%>
                <%=GetListCommand("apply|Lưu,save|Lưu  &amp; đóng,save-new|Lưu &amp; thêm,space,cancel|Đóng") %>
                <%}%>

                <%}
                    else if (roleCode == "NV")
                    {%>
                <%if (entity.Activity1 == true || entity.Activity == true)
                    {%>
                <%=GetListCommand("cancel|Đóng") %>
                <%}
                    else
                    {%>
                <%=GetListCommand("apply|Lưu,save|Lưu  &amp; đóng,save-new|Lưu &amp; thêm,space,cancel|Đóng") %>
                <%}%>
                <%}%>
            </div>
            <div class="pagetitle icon-48-article">
                <h2>Bài viết  : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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

    <script type="text/javascript">
        window.addEvent('domready', function () {
            new Accordion($$('div#content-sliders-.pane-sliders > .panel > h3.pane-toggler'), $$('div#content-sliders-.pane-sliders > .panel > div.pane-slider'), { onActive: function (toggler, i) { toggler.addClass('pane-toggler-down'); toggler.removeClass('pane-toggler'); i.addClass('pane-down'); i.removeClass('pane-hide'); Cookie.write('jpanesliders_content-sliders-', $$('div#content-sliders-.pane-sliders > .panel > h3').indexOf(toggler)); }, onBackground: function (toggler, i) { toggler.addClass('pane-toggler'); toggler.removeClass('pane-toggler-down'); i.addClass('pane-hide'); i.removeClass('pane-down'); if ($$('div#content-sliders-.pane-sliders > .panel > h3').length == $$('div#content-sliders-.pane-sliders > .panel > h3.pane-toggler').length) Cookie.write('jpanesliders_content-sliders-', -1); }, duration: 300, opacity: false, alwaysHide: true });
        });
    </script>
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

    <div id="element-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">

            <div class="width-70 fltlft">
                <fieldset class="adminform">
                    <legend>THÔNG TIN CHUNG</legend>
                    <table class="admintable">
                        <tr>
                            <td class="key">
                                <label>Tiêu đề :<span class="red">*</span></label>
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

                        <tr>
                            <td class="key">
                                <label>Tóm tắt :</label>
                            </td>
                            <td>
                                <textarea style="height: 100px; width: 98%" name="Summary"><%=entity.Summary%></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center" style="text-align: center" class="key">NỘI DUNG
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="content">
                                <textarea class="ckeditor" style="width: 100%; height: 500px" name="Content" id="Content"><%=entity.Content%></textarea>
                            </td>
                        </tr>

                    </table>
                </fieldset>
            </div>

            <div class="width-30 fltrt">
                <div id="content-sliders-" class="pane-sliders">

                    <div class="panel">
                        <h3 class="pane-toggler title" id="publishing-details">
                            <a href="javascript:void(0);"><span>THUỘC TÍNH</span></a></h3>
                        <div class="pane-slider content">
                            <table class="admintable">
                                <tr>
                                    <td align="center" style="text-align: center" class="key">Hình minh họa - File tải về (Tài liệu)
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%if (!string.IsNullOrEmpty(entity.File))
                                            { %>
                                        <%= Utils.GetMedia(entity.File, 100, 80, string.Empty, true, "id='img_view'")%><%}
                                        else
                                        { %>
                                        <img id="img_view" width="100" height="80" />
                                        <%} %>
                                        <br />
                                        <input class="text_input" type="text" name="File" id="File" style="width: 65%" value="<%=entity.File %>" />
                                        <input class="text_input" style="width: 75px;" type="button" onclick="ShowFileForm('File'); return false;" value="Chọn ảnh" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="text-align: center" class="key">Chuyên mục <span class="red">*</span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="MenuID" id="MenuID" class="text_input">
                                            <option value="0">Root</option>
                                            <%= Utils.ShowDDLMenuByType("News", model.LangID, entity.MenuID)%>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="center" style="text-align: center" class="key">Loại thành viên <span class="red"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <select name="LoaiThanhVienID" id="LoaiThanhVienID" class="text_input">
                                            <option value="0">Root</option>
                                            <%= Utils.ShowDDLMenuByType("LoaiThanhVien", model.LangID, entity.LoaiThanhVienID)%>
                                        </select>
                                    </td>
                                </tr>

                                <tr>
                                    <td align="center" style="text-align: center" class="key">Tin cảnh báo <span class="red"></span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input name="WarnNews" type="checkbox" <%if (entity.WarnNews == true)
                                            {%>checked value="1"<%} else {%>value="0"<%} %>
                                            onclick="fnWarnNews(this)">
                                        Là tin cảnh báo

                                        <div id="ListUser" <%if (entity.WarnNews != true)
                                            {%>style="display: none;"
                                            <%} %>>
                                            <br />
                                            <br />
                                            <span>Chọn thành viên xem tin cảnh báo:</span>
                                            <% List<CPUserEntity> listUser = CPUserService.Instance.CreateQuery().Where(o => o.Activity == true).ToList();
                                                string[] loginNames = listUser != null ? listUser.Select(o => o.LoginName).ToArray() : null;
                                                string loginName = loginNames != null ? string.Join(";", loginNames) : "";
                                                int userCount = listUser != null ? listUser.Count : 0;
                                                int userChecked = string.IsNullOrEmpty(entity.WarnUserIDs) ? 0 : entity.WarnUserIDs.Split(';').Length;
                                                %>
                                            <input class="text_input my-select" type="text" name="WarnUserIDs" id="WarnUserIDs" value="<%=Utils.ShowTextByUserID(entity.WarnUserIDs) %>" maxlength="255" onclick="fnDropdown(event)" readonly />
                                            <div class="text_input multiselect" id="List1" <%if (string.IsNullOrEmpty(entity.WarnUserIDs))
                                                {%>style="display: none;"
                                                <%} %>>
                                                <label>
                                                    <input type="checkbox" id="chkAll" onclick="fnSetCheckAll(this)" <%if (userCount == userChecked)
                                                        {%>checked<%} %>>Tất cả</label><br />
                                                <%for (int i = 0; i < userCount; i++)
                                                    {
                                                        string sChecked = "";
                                                        string temp = ";" + entity.WarnUserIDs + ";";
                                                        if (entity.WarnUserIDs != null && temp.Contains(";" + listUser[i].ID.ToString() + ";"))
                                                        {
                                                            sChecked = "checked";
                                                        }%>
                                                <label style="display: block; width: 45%; float: left;">
                                                    <input name="ArrWarnUserIDs" value="<%=listUser[i].ID %>" onclick="fnSetCheck(event, '<%=listUser[i].LoginName %>', '#WarnUserIDs')" type="checkbox" <%=sChecked %> /><%=listUser[i].LoginName %></label>
                                                <%} %>
                                            </div>
                                        </div>
                                    </td>
                                </tr>

                                <%--<tr>
                                    <td align="center" style="text-align: center" class="key">Chọn file Audio đọc nội dung
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input class="text_input" type="text" name="Audio" id="Audio" style="width: 65%" value="<%=entity.Audio %>" />
                                        <input class="text_input" style="width: 30%;" type="button" onclick="ShowFileForm('Audio'); return false;" value="Chọn file Audio" />
                                    </td>
                                </tr>--%>

                                <tr>
                                    <td align="center" style="text-align: center" class="key">Lượt xem
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input class="text_input" type="text" name="View" id="View" style="" value="<%=entity.View %>" />
                                    </td>
                                </tr>

                                <tr>
                                    <td align="center" style="text-align: center" class="key">Vị trí
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <%= Utils.ShowCheckBoxByConfigkey("Mod.NewsState", "ArrState", entity.State)%>
                                    </td>
                                </tr>

                                <%if (CPViewPage.UserPermissions.Approve)
                                    {%>
                                <tr>
                                    <td align="center" style="text-align: center" class="key">Duyệt
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input name="Activity" <%= entity.Activity == true ? "checked" : "" %> type="radio" value='1' />
                                        Có
                                    <input name="Activity" <%= !entity.Activity == false ? "checked" : "" %> type="radio" value='0' />
                                        Không
                                    </td>
                                </tr>
                                <%} %>
                            </table>
                        </div>
                    </div>

                    <div class="panel">
                        <h3 class="pane-toggler title" id="basic-options">
                            <a href="javascript:void(0);"><span>THÔNG TIN THÊM</span></a></h3>
                        <div class="pane-slider content">
                            <textarea class="text_input" style="height: 100px;" name="Custom" id="custom"><%=entity.Custom%></textarea>
                            <textarea class="text_input" style="height: 50px;" name="set_custom" id="set_custom"></textarea>
                            <table width="99%">
                                <tr>
                                    <td width="100%">
                                        <input name="rSetCustom" onclick="GetCustom(this.value)" type="radio" value="IsName" checked="checked" />Hiện tiêu đề (0/1)
                                    <br />
                                        <input name="rSetCustom" onclick="GetCustom(this.value)" type="radio" value="IsSummary" />Hiện tóm tắt (0/1)
                                    <br />
                                        <%--<input name="rSetCustom" onclick="GetCustom(this.value)" type="radio" value="AllowComment" />Cho phép gửi phản hồi (0/1)--%>
                                        <input name="rSetCustom" onclick="GetCustom(this.value)" type="radio" value="Keywords" />Từ khóa
                                    <br />
                                        <input name="rSetCustom" onclick="GetCustom(this.value)" type="radio" value="Description" />Diễn giải
                                    </td>
                                    <td>
                                        <input type="button" class="text_input" style="width: 100px;" onclick="SetCustom(); return false;" value="Cập nhật" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="panel">
                        <h3 class="pane-toggler title" id="tags-options">
                            <a href="javascript:void(0);"><span>TAGS</span></a></h3>
                        <div class="pane-slider content" style="min-height: 400px;">

                            <input type="hidden" name="Tags" id="Tags" value="<%=entity.Tags %>" />

                            <table width="100%">
                                <tr>
                                    <td width="100%">
                                        <input class="text_input" type="text" name="add_tag" id="add_tag" style="width: 60%; float: left" value="" />
                                        <input class="text_input" style="margin-left: 5px; width: 30%; float: left" type="button" onclick="tag_add(); return false;" value="Thêm Tag" />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100%">
                                        <div id="list_tag">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="100%">
                                        <b>Chọn tag gần đây</b> :
                                 <% 
                                     var listTag = ModTagService.Instance.CreateQuery().Take(20).ToList();
                                     for (int i = 0; listTag != null && i < listTag.Count; i++)
                                     {
                                 %>
                                        <a href="javascript:tag_add_v2('<%=listTag[i].Name %>');"><%=listTag[i].Name %></a>
                                        <%if (i != listTag.Count - 1)
                                            { %>,<%} %>
                                        <%} %>
                                    </td>
                                </tr>
                            </table>

                            <script type="text/javascript">

                                var arrTags = new Array();

                            <% for (int i = 0; entity.Tags != null && i < entity.Tags.Split(',').Length; i++)
                                { %>
                                arrTags.push('<%=entity.Tags.Split(',')[i] %>');
                            <%} %>

                                tag_display();

                                function tag_add() {
                                    var tag = document.getElementById('add_tag');

                                    for (var i = 0; i < arrTags.length; i++) {
                                        if (arrTags[i] == tag.value) {
                                            alert('Tag đã tồn tại!');
                                            return;
                                        }
                                    }

                                    arrTags.push(tag.value);
                                    tag_display();

                                    tag.value = '';
                                }

                                function tag_add_v2(tagName) {

                                    for (var i = 0; i < arrTags.length; i++) {
                                        if (arrTags[i] == tagName) {
                                            alert('Tag đã tồn tại!');
                                            return;
                                        }
                                    }

                                    arrTags.push(tagName);
                                    tag_display();
                                }

                                function tag_display() {

                                    var list_tag = document.getElementById('list_tag');
                                    var s = '';
                                    var v = '';
                                    for (var i = 0; i < arrTags.length; i++) {
                                        v += (v == '' ? '' : ',') + arrTags[i];
                                        s += '<a href="javascript:tag_delete(' + i + ');"><img src="/TTPortal/Content/add/img/xit.gif" /></a> ' + arrTags[i] + '<br />';
                                    }
                                    list_tag.innerHTML = s;

                                    document.getElementById('Tags').value = v;
                                }

                                function tag_delete(index) {
                                    if (confirm('Bạn chắc muốn xóa không ?')) {
                                        arrTags.splice(index, 1);
                                        tag_display();
                                    }
                                }

                            </script>

                        </div>
                    </div>
                </div>
            </div>

            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>

    <script>
        jQuery.fn.multiselect = function () {
            $(this).each(function () {
                var checkboxes = $(this).find("input:checkbox");
                checkboxes.each(function () {
                    var checkbox = $(this);
                    // Highlight pre-selected checkboxes
                    if (checkbox.prop("checked"))
                        checkbox.parent().addClass("multiselect-on");

                    // Highlight checkboxes that the user selects
                    checkbox.click(function () {
                        if (checkbox.prop("checked"))
                            checkbox.parent().addClass("multiselect-on");
                        else
                            checkbox.parent().removeClass("multiselect-on");
                    });
                });
            });
        };

        $(function () {
            $(".multiselect").multiselect();
        });

        function fnDropdown(event) {
            $(event.target).next().slideToggle();
        }

        function fnWarnNews(e) {
            var isChecked = $(e).is(':checked');
            var status = 'none', val = 0;
            if (isChecked == true) {
                status = 'block';
                val = 1;
            }
            $('#ListUser').css('display', status);
            $(e).val(val);
        }

        function fnSetCheckAll(e) {
            var loginName = '<%=loginName%>';
            var isChecked = $(e).is(':checked');
            $('input[name="ArrWarnUserIDs"]').prop('checked', isChecked);

            if (isChecked == true) {
                $('#WarnUserIDs').val(loginName);
            } else {
                $('#WarnUserIDs').val('');
            }
        }

        function fnSetCheck(e, name, id) {
            var v = $(id).val();
            var v1 = v;
            if (e.target.checked) {
                if (v) v1 = v + ";";
                $(id).val(v1.replace(";;", ";") + name);
            } else {
                v1 = v1.replace(name + ";", "").replace(name, "").replace(";;", ";");
                v1 = v1.replace(/^[\;]+|[\;]+$/g, "");
                $(id).val(v1);
            }

            // Check to set tick all
            //debugger;
            var userCount = <%=userCount%>;
            var userChecked = $('#WarnUserIDs').val().split(';').length;
            if (userCount == userChecked) {
                $('#chkAll').prop('checked', true);
            } else {
                $('#chkAll').prop('checked', false);
            }
        }
    </script>

    <script type="text/javascript" src="/{CPPath}/Content/ckeditor/ckeditor.js"></script>
    <script type="text/javascript">
        CKFinder.setupCKEditor(null, '/{CPPath}/Content/ckfinder/');

        function refreshPage(arg) {
            arg = '~' + arg;
            document.getElementById(name_control).value = arg;
            if (document.getElementById("img_view"))
                document.getElementById("img_view").src = arg.replace('~/', '/{ApplicationPath}');
        }

        GetCustom('IsName');

    </script>

</form>
