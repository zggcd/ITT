<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl"%>

<script runat="server">
   
    SysTemplateModel model = null;
    SysTemplateEntity entity = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        model = ViewBag.Model as SysTemplateModel;
        entity = ViewBag.Data as SysTemplateEntity;
    }
    
</script>

<form id="hlForm" name="hlForm" method="post">

<input type="hidden" id="_hl_action" name="_hl_action" />

<div id="toolbar-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
       <div class="toolbar-list" id="toolbar">
            <%=GetListCommand("config|Xóa cache,space,apply|Lưu,save|Lưu  &amp; đóng,save-new|Lưu &amp; thêm,space,cancel|Đóng")%>
        </div>
        <div class="pagetitle icon-48-thememanager">
            <h2>Mẫu giao diện : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
        </div>
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>
<div class="clr"></div>

<%= ShowMessage()%>

 <%if (model.RecordID > 0)
   { %>
<div id="submenu-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="submenu-box">
            <div class="submenu-pad">
                <ul id="submenu" class="configuration template">
                    <li><a id="General" class="active">Thông tin chung</a></li>
                    <li><a id="Design">Thiết kế giao diện</a></li>
                   <%-- <li><a id="Preview">Xem trước</a></li>--%>
                </ul>
                <div class="clr"></div>
            </div>
        </div>
        <div class="clr"></div>
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>
<%} %>

<div id="element-box">
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div id="tab-document" class="col width-100">
          <div id="page-General" class="tab">
          <table class="admintable">
            <tr>
                <td class="key">
                    <label>Tên mẫu giao diện :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="Name" value="<%=entity.Name %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>File (.Master) :</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="File" id="File" value="<%=entity.File %>" maxlength="255" />
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Mã thiết kế:</label>
                </td>
                <td>
                    <textarea class="text_input" style="height:350px;<%if (HL.Core.Web.HttpRequest.IE && HL.Core.Web.HttpRequest.BrowserVersion == 6) {%>width:685px;<%} %>" name="Custom" id="Custom"><%=entity.Custom%></textarea>
                </td>
            </tr>
          </table>
          </div>

          <%if (model.RecordID > 0)
            { %>

          <div id="page-Design" class="tab">
             <script type="text/javascript">

                 var ListOnLoad = new Array();
                 var has_update = false;

                 function get_content_design() {
                     var hl_container = window.frames['frame_design'].document.getElementById('hl_container');
                     if (hl_container)
                         document.getElementById('content_design').innerHTML = hl_container.innerHTML;
                     else
                         document.getElementById('content_design').innerHTML = window.frames['frame_design'].document.childNodes[0].innerHTML;

                     if (has_update)
                         custom_update();

                     for (var i = 0; i < ListOnLoad.length; i++) {
                         layout_change(ListOnLoad[i].pid, ListOnLoad[i].list_param, ListOnLoad[i].layout)
                     }
                 }

                 function custom_update() {
                     var ranNum = Math.floor(Math.random() * 999999);
                     sLink = '/{CPPath}/Ajax/TemplateGetCustom/<%= entity.ID %>.aspx?rnd=' + ranNum;
                     AjaxRequest.get(
	                        {
	                            'url': sLink
	                        , 'onSuccess': function (req) {
	                            with (req.responseXML.getElementsByTagName('Item').item(0)) {
	                                var content = getNodeValue(getElementsByTagName('Html'));
	                                document.getElementById("Custom").innerHTML = content;
	                            }
	                        }
	                        , 'onError': function (req) { }
	                        }
                        )
                 }

                 function cp_update(value) {

                     has_update = true;

                     var input = document.createElement('input');
                     input.type = 'hidden';
                     input.name = 'hl_submit';
                     input.value = value;

                     var cp_form = window.frames['frame_design'].document.forms[0];

                     var arr_tag_input = window.frames['frame_design'].document.getElementsByTagName('input');
                     for (var i = 0; i < arr_tag_input.length; i++) {
                         if (document.getElementById(arr_tag_input[i].id))
                             arr_tag_input[i].value = document.getElementById(arr_tag_input[i].id).value;
                     }

                     var arr_tag_select = window.frames['frame_design'].document.getElementsByTagName('select');
                     for (var i = 0; i < arr_tag_select.length; i++) {
                         if (document.getElementById(arr_tag_select[i].id))
                             arr_tag_select[i].value = document.getElementById(arr_tag_select[i].id).value;
                     }

                     cp_form.appendChild(input);
                     cp_form.submit();

                 }

              </script>

              <script type="text/javascript">
                  function dragStart(ev) {
                      ev.dataTransfer.effectAllowed = 'move';
                      ev.dataTransfer.setData("Text", ev.target.getAttribute('id'));
                      ev.dataTransfer.setDragImage(ev.target, 0, 0);
                      return true;
                  }
                  function dragEnter(ev) {
                      event.preventDefault();
                      return true;
                  }
                  function dragOver(ev) {
                      return false;
                  }
                  function dragDrop(ev) {
                      var src = ev.dataTransfer.getData("Text");

                      var id = ev.target.id;

                      if (id != 'to_hlid_' + src)
                         cp_update(id + '$' + src + '|move');

                      //ev.target.appendChild(document.getElementById(src));

                      ev.stopPropagation();
                      return false;
                  }
                  function do_display(id_tbl) {
                      var o = document.getElementById(id_tbl);
                      if (o.style.display == '')
                          o.style.display = 'none';
                      else
                          o.style.display = '';
                  }
              </script>

            <div id="content_design"></div>
            <iframe id="frame_design" name="frame_design" src="/{CPPath}/Design/EditTemplate.aspx?id=<%= model.RecordID %>" onload="get_content_design()" style="height:0; width:0; border-width:0;"></iframe> 
          </div>

         <%--<div id="page-Preview"></div>--%>

          <%} %>

        </div>                
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>

</form>