<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl"%>

<script runat="server">
   
    List<SysTemplateEntity> listTemplate = null;
    List<SysModuleEntity> listModule = null;
    List<HL.Lib.Global.ListItem.Item> listParent = null;
    SysPageModel model = null;
    SysPageEntity entity = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        model = ViewBag.Model as SysPageModel;
        entity = ViewBag.Data as SysPageEntity;

        listParent = HL.Lib.Global.ListItem.List.GetList(SysPageService.Instance, model.LangID);
        
        listTemplate = SysTemplateService.Instance.CreateQuery()
                            .Where(o => o.LangID == model.LangID)
                            .OrderByAsc(o => o.Order)
                            .ToList();

        listModule = SysModuleService.Instance.CreateQuery()
                            .Where(o => o.Type == "MODULE")
                            .OrderByAsc(o => o.Order)
                            .ToList();
        
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
    <div class="t"><div class="t"><div class="t"></div></div></div>
    <div class="m">
        <div class="toolbar-list" id="toolbar">
            <%=GetDefaultAddCommand()%>
        </div>
        <div class="pagetitle icon-48-menu">
            <h2>Trang : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
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
                <ul id="submenu" class="configuration page">
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
                    <label>Tên trang :</label>
                </td>
                <td>
                    <input class="text_input" type="text" id="Name" name="Name" value="<%=entity.Name %>" maxlength="255" />
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
                    <label>Mã thiết kế:</label>
                </td>
                <td>
                    <textarea class="text_input" style="height:150px;" name="Custom" id="custom"><%=entity.Custom %></textarea>
                    <%if (model.ParentID > 0)
                      {%>
                    <textarea class="text_input" style="height:50px;" name="set_custom" id="set_custom"></textarea>
                    <table width="99%">
                        <tr>
                            <td width="100%">
                                <input name="rSetCustom" onclick="GetCustom(this.value)" type="radio" value="Title" checked="checked" />Tiêu đề
                                <input name="rSetCustom" onclick="GetCustom(this.value)" type="radio" value="Keywords" />Từ khóa
                                <input name="rSetCustom" onclick="GetCustom(this.value)" type="radio" value="Description" />Diễn giải
                            </td>
                            <td>
                               <input type="button" class="text_input" style="width:100px;" onclick="SetCustom(); return false;" value="Cập nhật" />
                            </td>
                        </tr>
                    </table>
                    <%} %>
                </td>
            </tr>
            <tr>
                <td class="key">
                    <label>Html Icon (bên trái):</label>
                </td>
                <td>
                    <input class="text_input" type="text" name="HtmlIcon" value="<%=entity.HtmlIcon %>" maxlength="255" />
                </td>
            </tr>
            <%if (model.ParentID > 0)
              {%>
             <tr>
                <td class="key">
                    <label>Mãu giao diện :</label>
                </td>
                <td>
                    <select class="text_input" name="TemplateID">
                        <option value="0"></option>
                        <%for (int i = 0; listTemplate != null && i < listTemplate.Count; i++)
                          { %>
                            <option <%if(entity.TemplateID==listTemplate[i].ID) {%>selected<%} %> value='<%= listTemplate[i].ID%>'>&nbsp; <%= listTemplate[i].Name%></option>
                        <%} %> 
                    </select>
                </td>
            </tr>
             <tr>
                <td class="key">
                    <label>Chức năng :</label>
                </td>
                <td>
                    <select class="text_input" name="ModuleID" onchange="page_control_change(this.value)">
                         <option value="0"></option>
                        <%for (int i = 0; listModule != null && i < listModule.Count; i++)
                          { %>
                            <option <%if(entity.ModuleID==listModule[i].ID) {%>selected<%} %> value='<%= listModule[i].ID%>'>&nbsp; <%= listModule[i].Name%></option>
                        <%} %> 
                    </select>
                    <div id="control_param"></div>
                </td>
            </tr>
             <tr>
                <td class="key">
                    <label>Liên kết chuyên mục :</label>
                </td>
                <td>
                   <div id="list_menu"></div>
                </td>
            </tr>
             <tr>
                <td class="key">
                    <label>Trang cha :</label>
                </td>
                <td>
                    <select class="text_input" name="ParentID">
                         <option value="0">Root</option>
                        <%for (int i = 0; listParent != null && i < listParent.Count; i++)
                          { %>
                            <option <%if(entity.ParentID.ToString()==listParent[i].Value) {%>selected<%} %> value='<%= listParent[i].Value%>'>&nbsp; <%= listParent[i].Name%></option>
                        <%} %>   
                    </select>
                </td>
            </tr> 
            <%} %>
            <tr>
                <td class="key">
                    <label>Duyệt :</label>
                </td>
                <td>
                    <input name="Activity" <%= entity.Activity ? "checked" : "" %> type="radio" value='1' /> Có
                    <input name="Activity" <%= !entity.Activity ? "checked" : "" %> type="radio" value='0' /> Không
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
                     sLink = '/{CPPath}/Ajax/PageGetCustom/<%= entity.ID %>.aspx?rnd=' + ranNum;
                     AjaxRequest.get(
	                        {
	                            'url': sLink
	                        , 'onSuccess': function (req) {
	                            with (req.responseXML.getElementsByTagName('Item').item(0)) {
	                                var content = getNodeValue(getElementsByTagName('Html'));
	                                document.getElementById("custom").innerHTML = content;
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
            <iframe id="frame_design" name="frame_design" src="/{CPPath}/Design/EditPage.aspx?id=<%= model.RecordID %>" onload="get_content_design()" style="height:0; width:0; border-width:0;"></iframe> 
          </div>

         <%--<div id="page-Preview"></div>--%>

          <%} %>


        </div>                
        <div class="clr"></div>
    </div>
    <div class="b"><div class="b"><div class="b"></div></div></div>
</div>

<script type="text/javascript">
    function menu_change(name)
    {
       var txtPageName = document.getElementById('Name');
       if(txtPageName.value == '')
       {
           var i = name.indexOf('---- ');
           if (i > -1) 
             txtPageName.value = name.substr(i + 5);
       }
    }

    function page_control_change(control_id) { 
     var ranNum = Math.floor(Math.random() * 999999);
     sLink = '/{CPPath}/Ajax/PageGetControl.aspx/LangID/<%= model.LangID %>/PageID/<%=entity.ID %>/ModuleID/'+control_id+'?rnd=' + ranNum;	
     AjaxRequest.get(
	        {
	        'url':sLink
	        ,'onSuccess':function(req){	 
              with(req.responseXML.getElementsByTagName('Item').item(0))
			    {
                    var js = getNodeValue(getElementsByTagName('JS'));
			        var content = getNodeValue(getElementsByTagName('Html'));
                    var list_menu = getNodeValue(getElementsByTagName('Params'));
                    list_menu = '<select onchange="menu_change(this.options[this.selectedIndex].text)" class="text_input" name="MenuID"><option value="0">Root</option>' + list_menu + '</select>';

			        document.getElementById("control_param").innerHTML = content;
                    document.getElementById("list_menu").innerHTML = list_menu;

                    if(js != '') 
                       eval(js);
    		    }
	        }
	        ,'onError':function(req){}
	        }
        )
    }

    <%if(entity.ModuleID > 0){ %>page_control_change(<%= entity.ModuleID %>);<%} %>

    GetCustom('Title');

</script>

</form>