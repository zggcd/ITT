<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
    int i = 0;
    int c = listItem != null ? listItem.Count : 0;
%>

<%if (c > 0)
    { %>
<div id="MSOZoneCell_WebPartctl00_ctl45_g_d0331ab2_a151_4dc9_9b4f_e83bd0a41587" class="s4-wpcell-plain ms-webpartzone-cell ms-webpart-cell-vertical ms-fullWidth ">
    <div class="ms-webpart-chrome ms-webpart-chrome-vertical ms-webpart-chrome-fullWidth ">
        <div webpartid="c733f88f-c370-4973-be80-7c522745fdec" haspers="false" id="WebPartctl00_ctl45_g_d0331ab2_a151_4dc9_9b4f_e83bd0a41587" width="100%" class="ms-WPBody " allowdelete="false" allowexport="false" style="">
            <div id="ctl00_ctl45_g_d0331ab2_a151_4dc9_9b4f_e83bd0a41587">
                <ul class="menu-top">
                    <%for (i = 0; i < c; i++)
                        {
                            var listChildItem = SysPageService.Instance.GetByParent_Cache(listItem[i].ID);
                            int c1 = listChildItem != null ? listChildItem.Count : 0;
                            int j = 0;
                            string cls = "";
                            cls += ViewPage.IsPageActived(listItem[i], 0) ? " active" : "";
                            string href = ViewPage.GetPageURL(listItem[i]);%>
                    <li class="<%=cls %>"><span class='menu_parent' style='color: white; cursor: pointer'><%=listItem[i].Name %></span><span class='icon'><span class='fa fa-angle-right'></span></span>
                        <%if (c1 > 0)
                            {%>
                        <ul class='menu-dropdown'>
                            <%for (j = 0; j < c1; j++)
                                {
                                    string cls1 = "";
                                    cls1 += ViewPage.IsPageActived(listItem[i], 0) ? " active" : "";
                                    string href1 = ViewPage.GetPageURL(listChildItem[j]);%>
                            <li class="<%=cls1 %>"><a href='<%=href1 %>' title="<%=listChildItem[j].Name %>" style=''><%=listChildItem[j].Name %></a></li>
                            <%} %>
                        </ul>
                        <%} %>
                    </li>
                    <%} %>
                </ul>
            </div>
            <div class="ms-clear"></div>
        </div>
    </div>
    <div class="ms-PartSpacingVertical"></div>
</div>
<%} %>