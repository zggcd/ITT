<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl"%>

<% 
    var model = ViewBag.Model as SysResourceModel;
    var entity = ViewBag.Data as WebResourceEntity;
    var listLang = SysLangService.Instance.CreateQuery().ToList_Cache();
 %>

<form id="hlForm" name="hlForm" method="post">

<input type="hidden" id="_hl_action" name="_hl_action" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%=GetListCommand("config|Xóa cache,space,apply|Lưu,space,cancel|Đóng")%>
        </div>
         <div class="pagetitle icon-48-langmanager">
            <h2>Tài nguyên : Thêm nhiều</h2>
        </div>
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>
<div class="clr"></div>

<%= ShowMessage()%>

<div id="element-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="col width-100">
          <table class="admintable">
            <tr>
                <td class="key">
                    <label>Loại :</label>
                </td>
                <td>
                    <input name="Type" id="Type_1" type="radio" value="1" onchange="type_change();" /> Thêm hàng loạt
                    <input name="Type" id="Type_2" type="radio" value="2" onchange="type_change();" /> Di chuyển tài nguyên
                </td>
            </tr>
             <tr id="tr_Type_1">
                <td class="key">
                    <label>Thêm hàng loạt :</label>
                </td>
                <td>
                    <input type="checkbox" id="Overwrite1" name="Overwrite1" value="1" /> Ghi đè nội dung cũ ?
                    <br />
                     Tài nguyên hiện tại : 
                    <select name="LangID1" id="LangID1" class="text_input" style="width:120px">
                         <%for(int i=0; listLang != null && i < listLang.Count;i++){ %>
                           <option value="<%=listLang[i].ID%>"><%=listLang[i].Name%></option>
                         <%} %>
                    </select>
                    <br />
                    <textarea class="text_input" style="height:200px;" id="Value1" name="Value1"><%=model.Value1%></textarea>
                    <b>Nhập dạng </b><br />
                    <span style="font-size:11px">Key1=Value1</span> <br />
                    <span style="font-size:11px">Key2=Value2</span> <br />
                </td>
            </tr>
            <tr id="tr_Type_2" style="display:none;">
                <td class="key">
                    <label>Di chuyển tài nguyên :</label>
                </td>
                <td>
                    <input type="checkbox" id="Overwrite2" name="Overwrite2" value="1" /> Ghi đè nội dung cũ ?
                    <br />

                     Từ : 
                    <select name="FLangID2" id="FLangID2" class="text_input" style="width:120px">
                         <%for(int i=0; listLang != null && i < listLang.Count;i++){ %>
                           <option value="<%=listLang[i].ID%>"><%=listLang[i].Name%></option>
                         <%} %>
                    </select>

                     Đến : 
                    <select name="TLangID2" id="TLangID2" class="text_input" style="width:120px">
                         <%for(int i=0; listLang != null && i < listLang.Count;i++){ %>
                           <option value="<%=listLang[i].ID%>"><%=listLang[i].Name%></option>
                         <%} %>
                    </select>
                </td>
            </tr>
            
          </table>
        </div>                
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>

<script type="text/javascript">
    function type_change() {
        var type = 1;
        var list = document.getElementsByName('Type');
        for (var i = 0; i < list.length; i++) {
            if (list[i].checked) {
                type = (i + 1);
                //break;
            }

            document.getElementById('tr_Type_' + (i + 1)).style.display = 'none';
        }

        document.getElementById('tr_Type_' + type).style.display = '';
    }

    document.getElementById('Type_<%=model.Type %>').checked = true;
    document.getElementById('LangID1').value = <%=model.LangID1 %>;
    document.getElementById('Overwrite1').checked = <%=model.Overwrite1 ? "true" : "false" %>;
    document.getElementById('Overwrite2').checked = <%=model.Overwrite2 ? "true" : "false" %>;
    document.getElementById('FLangID2').value = <%=model.FLangID2 %>;
    document.getElementById('TLangID2').value = <%=model.TLangID2 %>;
    document.getElementById('LangID3').value = <%=model.LangID3 %>;
    document.getElementById('FLangID3').value = '<%=model.FLangID3 %>';
    document.getElementById('TLangID3').value = '<%=model.TLangID3 %>';

    type_change();
</script>

</form>