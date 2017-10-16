<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Core.Design.ViewControlDesign"%>

<div id="to_hlid_<%= ViewControlName%>$<%=CphName %>" style="height:10px;width:100%" ondragenter="return dragEnter(event)" ondrop="return dragDrop(event)" 
     ondragover="return dragOver(event)">
</div>

<div class="border-control">
<table id="<%= ViewControlName%>$<%=CphName %>" <%if (!AloneMode){ %>style="cursor: move;" draggable="true" ondragstart="return dragStart(event)"<%} %> class="admintable" style="width: 100%;">
   <tr>
      <td class="key" style="width:100%;text-align:center;" colspan="2"><a onclick="do_display('tbl_<%= ViewControlName%>');" href="javascript:;">
                <%= ViewControlID%> <%if (CurrentModule != null)
                                      { %> - <%= ((SysModuleEntity)CurrentModule).Name %><%}
                                      else if(ErrorMode)
                                      { %> - Không tồn tại <%} %></a></td>
   </tr>
</table>
<table id="tbl_<%= ViewControlName%>" class="admintable" style="width: 100%;display:none;">

   <%
    string LayoutDefine = string.Empty;
    string LayoutValue = string.Empty;

    List<HL.Lib.Global.ListItem.Item> listMenu;

    string keyViewState = "EditControl_MenuID_News_" + LangID;
    if (ViewPageDesign.PageViewState[keyViewState] != null)
    {
        listMenu = ViewPageDesign.PageViewState[keyViewState] as List<HL.Lib.Global.ListItem.Item>;
    }
    else
    {
        listMenu = HL.Lib.Global.ListItem.List.GetList(WebMenuService.Instance, LangID, "News");
        listMenu.Insert(0, new HL.Lib.Global.ListItem.Item(string.Empty, string.Empty));
        ViewPageDesign.PageViewState[keyViewState] = listMenu;
    }
    
               
   %>

   <tr id="tr_<%= ViewControlID%>_MenuID">
        <td class="key" style="font-size:12px;font-weight:normal;width:35%;">Chuyên mục :</td>
        <td>
            <select id="<%= ViewControlID%>_MenuID" name="<%= ViewControlID%>_MenuID" style="width:99%;" class="text_input">
            <%for (int j = 0; j < listMenu.Count; j++)
                { %>
                <option <%if(GetCurrentValue("MenuID")==listMenu[j].Value) {%>selected<%} %> value='<%= listMenu[j].Value%>'><%= listMenu[j].Name%></option>
            <%} %>    
            </select>
        </td>
   </tr>

   <tr id="tr_<%= ViewControlID%>_PageSize">
        <td class="key" style="font-size:12px;font-weight:normal;width:35%;">Số lượng :</td>
        <td>
            <input id="<%= ViewControlID%>_PageSize" name="<%= ViewControlID%>_PageSize" type="text" class="text_input" style="width:80%;" value="<%=GetCurrentValue("PageSize") %>" />
        </td>
   </tr>

  <tr id="tr_<%= ViewControlID%>_Title">
        <td class="key" style="font-size:12px;font-weight:normal;width:35%;">Tiêu đề :</td>
        <td>
            <input id="<%= ViewControlID%>_Title" name="<%= ViewControlID%>_Title" type="text" class="text_input" style="width:80%;" value="<%=GetCurrentValue("Title") %>" />
        </td>
   </tr>

<%if (CurrentModule != null && !string.IsNullOrEmpty(CurrentModule.Layout))
  {
    List<HL.Lib.Global.ListItem.Item> _List = HL.Lib.Global.ListItem.List.GetListByText(CurrentModule.Layout);
    string currentValue = GetCurrentValue("ViewLayout");
    LayoutValue = currentValue;  %>
<tr id="tr_<%= ViewControlID%>_ViewLayout">
    <td class="key" style="font-size: 12px; font-weight: normal; width: 35%;">Cách hiện thị :</td>
    <td>
        <select id="<%= ViewControlID%>_ViewLayout" name="<%= ViewControlID%>_ViewLayout" <%if(LayoutDefine != ""){ %>onchange="layout_change('<%= ViewControlID%>','<%=LayoutDefine %>',this.value)"<%} %> style="width: 99%;" class="text_input">
          <%for (int j = 0; j < _List.Count; j++)
            { %>
            <option <%if(currentValue==_List[j].Value) {%>selected<%} %> value='<%= _List[j].Value%>'><%= _List[j].Name%></option>
          <%} %>   
        </select>
    </td>
</tr>
<%} %>

  <tr> 
      <td align="right" style="padding-top:2px;padding-right:5px;" class="cmd-control" colspan="2">
         <%if (!AloneMode){ %>
           <%if ((PosID & 1) != 1){ %>
          <a href="javascript:cp_update('<%= ViewControlID%>|up');">
             <img alt="Up" src="/{CPPath}/Content/add/img/up-16.gif" />
          </a><%} %>
          <%if ((PosID & 4) != 4){ %>
          <a href="javascript:cp_update('<%= ViewControlID%>|down');">
             <img alt="Down" src="/{CPPath}/Content/add/img/down-16.gif" />
          </a><%} %>
         <%} %>

         <%if (!ReadOnlyMode)
           { %>
           <a href="javascript:cp_update('<%= ViewControlID%>|save');">
              <img alt="Save" src="/{CPPath}/Content/add/img/save-16.gif" />
           </a>
          <%} %>

         <%if (!AloneMode){ %>
           <a onclick="return confirm('Bạn chắc là mình muốn xóa chứ !');" href="javascript:cp_update('<%= ViewControlID%>|delete');">
              <img alt="Delete" src="/{CPPath}/Content/add/img/delete-16.gif" />
           </a>
         <%} %>

      </td>
  </tr>
</table>
</div>

<%if(LayoutDefine != string.Empty){ %>
<script type="text/javascript">
    window.parent.ListOnLoad.push({ pid: '<%= ViewControlID%>', list_param: '<%=LayoutDefine %>', layout: '<%=LayoutValue %>' });
</script>
<%} %>
