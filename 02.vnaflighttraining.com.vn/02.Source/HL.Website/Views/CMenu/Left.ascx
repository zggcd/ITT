<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
    var c = listItem != null ? listItem.Count : 0;
    var PageExt = HL.Core.Global.Config.GetValue("Sys.PageExt").ToString();
    string langCode = "", url = "";
    if (ViewPage.CurrentLang.ID == 1)
    {
        langCode = "vn";
        url = "/";
    }
    else if (ViewPage.CurrentLang.ID == 2)
    {
        langCode = "en";
        url = "/en/Home.aspx";
    }
    else if (ViewPage.CurrentLang.ID == 3)
    {
        langCode = "cn";
        url = "/cn/Home.aspx";
    }
%>

<%if (c > 0)
    {%>
<div class="portlet-boundary portlet-boundary_NSS_MENU_LEFT_ portlet-static portlet-static-end portlet-borderless portlet-menu-left ">
    <div class="portlet-body">
        <div class="portlet-borderless-container" style="">
            <div class="portlet-body">
                <div id="menuLeft" class="menu-left">
                    <ul>
                        <% for (int i = 0; i < c; i++)
                            {
                                var listChild = SysPageService.Instance.GetByParent_Cache(listItem[i].ID);
                                int c1 = listChild != null ? listChild.Count : 0;
                                string href = ViewPage.GetPageURL(listItem[i]);
                                string url1 = MyClass.GetCusTomPage("HREF", listItem[i].Custom);
                                href = !string.IsNullOrEmpty(url1) ? url1 : href;
                                string clsActive1 = "";
                                if (ViewPage.IsPageActived(listItem[i]))
                                {
                                    clsActive1 = "hasSelect";
                                }
                        %>
                        <li><a class="<%=clsActive1 %>" id="parent10975" href="<%=href %>"><%=listItem[i].Name %></a>
                            <%if (c1 > 0)
                                {%>
                            <ul>
                                <%for (int j = 0; j < c1; j++)
                                    {
                                        var listChild2 = SysPageService.Instance.GetByParent_Cache(listChild[j].ID);
                                        int c2 = listChild2 != null ? listChild2.Count : 0;
                                        string href2 = ViewPage.GetPageURL(listChild[j]);
                                        string url2 = MyClass.GetCusTomPage("HREF", listChild[j].Custom);
                                        href2 = !string.IsNullOrEmpty(url2) ? url2 : href2;
                                        string clsActive2 = "";
                                        if (ViewPage.IsPageActived(listChild[j]))
                                        {
                                            clsActive2 = "hasSelect";
                                        }
                                %>
                                <li><a class="<%=clsActive2 %>" id="parent18681" href="<%=href2 %>"><%=listChild[j].Name %></a>
                                    <%if (c2 > 0)
                                        {%>
                                    <ul>
                                        <%for (int k = 0; k < c2; k++)
                                            {
                                                string href3 = ViewPage.GetPageURL(listChild2[k]);
                                                string url3 = MyClass.GetCusTomPage("HREF", listChild2[k].Custom);
                                                href3 = !string.IsNullOrEmpty(url3) ? url3 : href3;
                                                string clsActive3 = "";
                                                if (ViewPage.IsPageActived(listChild2[k]))
                                                {
                                                    clsActive3 = "hasSelect";
                                                }
                                        %>
                                        <li><a class="<%=clsActive3 %>" id="parent18985" href="<%=href3 %>"><%=listChild2[k].Name %></a></li>
                                        <%} %>
                                    </ul>
                                    <%} %>
                                </li>
                                <%} %>
                            </ul>
                            <%} %>
                        </li>
                        <%} %>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<%} %>
