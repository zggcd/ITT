<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModVanBanModel;
    var entity = ViewBag.Data as ModVanBanEntity;
%>

<style>
    .multiselect {
        border: solid 1px #c0c0c0;
        height: 200px;
        overflow: auto;
        display: none;
    }

        .multiselect label {
            display: block;
        }

    .multiselect-on {
        color: #000000;
        background-color: #e0e0e0;
    }
</style>
<script src="/{CPPath}/Content/ckeditor/ckeditor.js"></script>
<script>
    CKFinder.setupCKEditor(null, '/{CPPath}/Content/ckfinder/');
</script>
<link rel="stylesheet" type="text/css" href="/Content/css/jquery.datetimepicker.css" />
<script src="/Content/js/datetime/jquery.js"></script>

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
                <h2>Văn bản : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                        <td class="key">Chuyên mục: </td>
                        <td>
                            <select name="MenuID" id="MenuID" class="text_input">
                                <option value="0">Root</option>
                                <%= Utils.ShowDDLMenuByType("VanBan", model.LangID, entity.MenuID)%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Lĩnh vực :</label>
                        </td>
                        <td>
                            <input class="text_input my-select" type="text" name="MenuIDs" id="MenuIDs" value="<%=Utils.ShowTextByType3("VBLinhVuc", model.LangID, entity.MenuIDs, "MenuIDs") %>" maxlength="255" onclick="fnDropdown(event)" readonly />
                            <div class="text_input multiselect" id="List1">
                                <%= Utils.ShowDDLMenuByType3("VBLinhVuc", model.LangID, entity.MenuIDs, "MenuIDs")%>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Cơ quan ban hành :</label>
                        </td>
                        <td>
                            <select name="MenuID1" id="MenuID1" class="text_input">
                                <option value="0">Root</option>
                                <%= Utils.ShowDDLMenuByType("VBCoQuan", model.LangID, entity.MenuID1)%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Hình thức văn bản :</label>
                        </td>
                        <td>
                            <select name="MenuID2" id="MenuID2" class="text_input">
                                <option value="0">Root</option>
                                <%= Utils.ShowDDLMenuByType("VBHinhThuc", model.LangID, entity.MenuID2)%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <%var canBos = ModUserService.Instance.CreateQuery().Where(o => o.Activity == true).ToList_Cache();
                            int c = canBos != null ? canBos.Count : 0;
                            string cbSelected = "", cbIdSelected = "";
                            if (!string.IsNullOrEmpty(entity.UserIDs))
                            {
                                string[] cbs = entity.UserIDs.Split(';');
                                var lst = ModUserService.Instance.CreateQuery().WhereIn(o => o.ID, entity.UserIDs).ToList();
                                cbSelected = String.Join(";", lst.Select(o => o.Name).ToArray());
                                cbIdSelected = String.Join(";", lst.Select(o => o.ID).ToArray());
                            }%>
                        <td class="key">
                            <label>Người ký duyệt :</label>
                        </td>
                        <td>
                            <input class="text_input my-select" type="text" name="UserIDs" id="UserIDs" value="<%=cbSelected %>" maxlength="255" onclick="fnDropdown(event)" readonly />
                            <div class="text_input multiselect" id="List2">
                                <%for (int i = 0; i < c; i++)
                                    {
                                        string chk = "";
                                        if (cbIdSelected.Contains(canBos[i].ID.ToString()))
                                        {
                                            chk = "checked";
                                        }%>
                                <label>
                                    <input type="checkbox" name="ArrUserIDs" value="<%=canBos[i].ID %>" onclick="fnSetCheck(event, '<%=canBos[i].Name %>', '#UserIDs')" <%=chk %> /><%=canBos[i].Name %></label>
                                <%} %>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Số hiệu :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Name" id="Name" value="<%=entity.Name %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td class="key">
                            <label>Code :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Code" id="Code" value="<%=entity.Code %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Trích yếu nội dung :</label>
                        </td>
                        <td>
                            <textarea class="text_input" style="height: 100px" name="Summary" id="Summary"><%=entity.Summary %></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Chi tiết văn bản :</label>
                        </td>
                        <td class="content">
                            <textarea class="ckeditor" style="width: 100%; height: 500px" name="Content" id="Content"><%=entity.Content%></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Ngày ban hành :</label>
                        </td>
                        <td>
                            <%--<input class="text_input" type="text" name="NgayBanHanh" id="NgayBanHanh" value="<%=entity.NgayBanHanh %>" maxlength="255" />--%>
                            <input class="text_input" style="width: 10%;" type="text" value="<%=(entity.NgayBanHanh > DateTime.MinValue && entity.NgayBanHanh < DateTime.MaxValue) ? string.Format("{0:dd/MM/yyyy}", entity.NgayBanHanh) : "" %>" id="NgayBanHanh" name="NgayBanHanh">
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Ngày có hiệu lực :</label>
                        </td>
                        <td>
                            <input class="text_input" style="width: 10%;" type="text" value="<%=(entity.NgayCoHieuLuc > DateTime.MinValue && entity.NgayCoHieuLuc < DateTime.MaxValue) ? string.Format("{0:dd/MM/yyyy}", entity.NgayCoHieuLuc) : "" %>" id="NgayCoHieuLuc" name="NgayCoHieuLuc">
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Ngày hết hiệu lực :</label>
                        </td>
                        <td>
                            <input class="text_input" style="width: 10%;" type="text" value="<%=(entity.NgayHetHieuLuc > DateTime.MinValue && entity.NgayHetHieuLuc < DateTime.MaxValue) ? string.Format("{0:dd/MM/yyyy}", entity.NgayHetHieuLuc) : "" %>" id="NgayHetHieuLuc" name="NgayHetHieuLuc">
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Files văn bản :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="File" id="File" value="<%=entity.File %>" maxlength="255" style="width: 65%" />
                            <input class="text_input" style="width: 75px;" type="button" onclick="ShowFileForm('File'); return false;" value="Chọn file 1" />
                            <p style="margin: 1px;">&nbsp;</p>
                            <input class="text_input" type="text" name="Files2" id="Files2" value="<%=entity.File1 %>" maxlength="255" style="width: 65%" />
                            <input class="text_input" style="width: 75px;" type="button" onclick="ShowFileForm('File2'); return false;" value="Chọn file 2" />
                            <p style="margin: 1px;">&nbsp;</p>
                            <input class="text_input" type="text" name="Files3" id="Files3" value="<%=entity.File2 %>" maxlength="255" style="width: 65%" />
                            <input class="text_input" style="width: 75px;" type="button" onclick="ShowFileForm('File2'); return false;" value="Chọn file 3" />
                            <p style="margin: 1px;">&nbsp;</p>
                            <input class="text_input" type="text" name="Files4" id="Files4" value="<%=entity.File3 %>" maxlength="255" style="width: 65%" />
                            <input class="text_input" style="width: 75px;" type="button" onclick="ShowFileForm('File3'); return false;" value="Chọn file 4" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Văn bản liên quan :</label>
                        </td>
                        <td>
                            <textarea class="text_input" style="height: 100px" name="Urls" id="Urls"><%=entity.Urls %></textarea>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Ghi chú :</label>
                        </td>
                        <td>
                            <textarea class="text_input" style="height: 100px" name="GhiChu" id="GhiChu"><%=entity.GhiChu %></textarea>
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

    <script src="/Content/js/datetime/jquery.datetimepicker.js"></script>
    <script>
        $('#NgayBanHanh, #NgayCoHieuLuc, #NgayHetHieuLuc').datetimepicker({
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

        function fnSetCheck(e, name, id) {
            var v = $(id).val();
            var v1 = v;
            if (e.target.checked) {
                if (v) v1 = v + ";";
                $(id).val(v1.replace(";;", ";") + name);
            } else {
                v1 = v1.replace(name + ";", "").replace(name, "").replace(";;", ";");
                $(id).val(v1);
            }
        }
    </script>
    <script src="/{CPPath}/Content/ckeditor/ckeditor.js"></script>
    <script>
        CKFinder.setupCKEditor(null, '/{CPPath}/Content/ckfinder/');
    </script>

</form>
