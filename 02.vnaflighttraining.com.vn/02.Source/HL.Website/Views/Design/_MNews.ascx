<%@ Control Language="C#" AutoEventWireup="true"%>

<script runat="server">
    public HL.Core.Global.Class CurrentObject { get; set; }
    public SysPageEntity CurrentPage { get; set; }
    public SysModuleEntity CurrentModule { get; set; }
    public int LangID { get; set; }

    public string GetCurrentValue(string fieldName)
    {
        string currentValue = string.Empty;

        if (CurrentPage != null)
            currentValue = CurrentPage.Items.GetValue(CurrentModule.Code + "." + fieldName).ToString();

        if (currentValue == string.Empty)
            currentValue = (CurrentObject.GetField(fieldName) == null ? string.Empty : CurrentObject.GetField(fieldName).ToString());

        return currentValue;
    }

    public HL.Core.MVC.PropertyInfo GetPropertyInfo(string fieldName)
    {
        System.Reflection.FieldInfo _FieldInfo = CurrentObject.GetFieldInfo(fieldName);
        object[] attributes = _FieldInfo.GetCustomAttributes(typeof(HL.Core.MVC.PropertyInfo), true);
        if (attributes == null || attributes.GetLength(0) == 0)
            return null;

       return (HL.Core.MVC.PropertyInfo)attributes[0];
    }
</script>


<% 
    var listTemp = HL.Lib.Global.ListItem.List.GetListByText(GetPropertyInfo("State").Value.ToString());
    string configKey = HL.Lib.Global.ListItem.List.FindByName(listTemp, "ConfigKey").Value;
    var listState = HL.Lib.Global.ListItem.List.GetListByText("," + HL.Core.Global.Config.GetValue(configKey).ToString());

    var listTemplate = SysTemplateService.Instance.CreateQuery().OrderByAsc(o => o.Order).ToList();
%>

<div class="col width-100">
  <table class="admintable">

     <tr>
        <td class="key">Mẫu giao diện :</td>
        <td>
            <select id="MNews_TemplateID" name="MNews_TemplateID" style="width:80%;" class="text_input" />
                <%for (int j = 0; listTemplate != null && j < listTemplate.Count; j++)
                {%>
                    <option <%=(GetCurrentValue("TemplateID") == listTemplate[j].ID.ToString() ? "selected" : "") %> value='<%= listTemplate[j].ID%>'><%= listTemplate[j].Name%></option>
                <%}%>
            </select>
            <input type="image" class="hl-icon" onclick="UpdateCustom('MNews_TemplateID','');return false;" src="/{CPPath}/Content/add/img/save-16.gif" />
        </td>
    </tr>

    <tr>
        <td class="key">Vị trí :</td>
        <td>
            <select id="MNews_State" name="MNews_State" style="width:80%;" class="text_input" />
                <%for (int j = 0; j < listState.Count; j++)
                {%>
                    <option <%=(GetCurrentValue("State") == listState[j].Value ? "selected" : "") %> value='<%= listState[j].Value%>'><%= listState[j].Name%></option>
                <%}%>
            </select>
            <input type="image" class="hl-icon" onclick="UpdateCustom('MNews_State','');return false;" src="/{CPPath}/Content/add/img/save-16.gif" />
        </td>
    </tr>

    <tr>
        <td class="key">Số lượng :</td>
        <td>
            <input id="MNews_PageSize" name="MNews_PageSize" type="text" class="text_input" style="width:80%;" value="<%= GetCurrentValue("PageSize") %>" />
            <input type="image" class="hl-icon" onclick="UpdateCustom('MNews_PageSize','');return false;" src="/{CPPath}/Content/add/img/save-16.gif" />
        </td>
    </tr>

  </table>
</div>