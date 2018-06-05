<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>
<%
    var entity = ViewBag.Data as ModFileExcelEntity ?? new ModFileExcelEntity();
%>
<script type="text/javascript" src="/{CPPath}/Content/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
    CKFinder.setupCKEditor(null, '/{CPPath}/Content/ckfinder/');
</script>
<script type="text/javascript">
    function importexcel() {
        var file = document.getElementById("File").value;
        window.location.href = '<%=CPViewPage.Request.RawUrl.Replace("Import.aspx","ImportData.aspx") %>' + '?file=' + file;
    }
    function closet() {
        window.location.href = '<%=CPViewPage.Request.RawUrl.Replace("Import.aspx","Index.aspx") %>';
    }
</script>
<style>
    div.toolbar {
        float: right;
        padding: 0;
        text-align: right;
    }

        div.toolbar ul {
            margin: 0;
            padding: 0;
        }

        div.toolbar li {
            color: #666666;
            float: left;
            height: 48px;
            list-style: none outside none;
            padding: 1px 1px 3px 4px;
            text-align: center;
        }

        div.toolbar a {
            border: 1px solid #F4F4F4;
            cursor: pointer;
            display: block;
            float: left;
            padding: 1px 5px;
            white-space: nowrap;
        }

        div.toolbar span {
            display: block;
            float: none;
            height: 32px;
            margin: 0 auto;
            width: 32px;
        }
</style>
<form id="hlForm" name="hlForm" method="post">

    <div id="toolbar-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="toolbar-list" id="toolbar">
                <ul style="float: left; padding-right: 15px;">
                    <li id="toolbar-apply" class="button"><a class="toolbar" href="javascript:void(0);" onclick="importexcel();"><span
                        title="In Excel" class="icon-32-excel"></span>Nhập dữ liệu</a></li>

                    <li id="toolbar-cancel" class="button"><a class="toolbar" onclick="closet();"
                        href="javascript:void(0);"><span title="Đóng" class="icon-32-cancel" onclick="closet();"></span>Đóng</a></li>
                </ul>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Nhập dữ liệu từ excel</h2>
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
                            <label>
                                File Excel :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="File" id="File" value="<%=entity.File%>" style="width: 80%;" maxlength="255" />
                            <input class="text_input" style="width: 17%;" type="button" onclick="ShowFileForm('File'); return false;"
                                value="Chọn File" />
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
