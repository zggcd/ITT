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

<div class="col d-none d-lg-block">
    <nav class="sort-pages modify-pages" id="navigation">
        <ul>
            <li class="selected"><a href="<%=url %>"><span>{RS:Web_Home}</span></a> </li>
            <%for (int i = 1; i < c; i++)
                {
                    var listChildItem = SysPageService.Instance.GetByParent_Cache(listItem[i].ID);
                    var countChild = listChildItem != null ? listChildItem.Count : 0;
                    var href = ViewPage.GetPageURL(listItem[i]);
                    var url2 = MyClass.GetCusTomPage("HREF", listItem[i].Custom);
                    href = !string.IsNullOrEmpty(url2) ? url2 : href;
            %>
            <li><a href="<%=href %>"><span><%=listItem[i].Name %></span></a>
                <%if (countChild > 0)
                    {%>
                <ul class="child-menu">
                    <%for (int j = 0; j < countChild; j++)
                        {%>
                    <li><a href="<%=ViewPage.GetPageURL(listChildItem[j]) %>"><%=listChildItem[j].Name %></a> </li>
                    <%} %>
                </ul>
                <%} %>
            </li>
            <%} %>
        </ul>
    </nav>
</div>

<!-- Menu mobile -->
<div id="mySidenav" class="sidenav">
    <a href="javascript: void(0)" class="closebtn" onclick="closeNav()">ĐÓNG X</a>
    <% if (listItem != null)
        { %>
    <ul class="col-xs-12 text-center format-col" id="sidenav">
        <% for (int i = 0; i < c; i++)
            {
                //var href = ViewPage.GetPageURL(listItem[i]);
                var lstMenuLevel2 = SysPageService.Instance.GetByParent_Cache(listItem[i].ID);
                int c2 = lstMenuLevel2 != null ? lstMenuLevel2.Count : 0;
        %>
        <li>
            <% if (c2 > 0)
                { %>
            <a href="javascript: void(0)" title="" onclick="toggleChild('c_<%=i %>')"><%= listItem[i].Name %></a>
            <ul id="c_<%=i %>">
                <% for (int j = 0; j < c2; j++)
                    {
                        var url2 = ViewPage.GetPageURL(lstMenuLevel2[j]);
                        var href = MyClass.GetCusTomPage("HREF", lstMenuLevel2[j].Custom);
                        url2 = !string.IsNullOrEmpty(href) ? href : url2;
                %>
                <li>
                    <a href="<%= url2 %>" title=""><%= lstMenuLevel2[j].Name %></a>
                </li>
                <% } %>
            </ul>
            <% }
                else
                {%>
            <a href="<%=ViewPage.GetPageURL(listItem[i]) %>" title=""><%= listItem[i].Name %></a>
            <%}%>
        </li>
        <% } %>
    </ul>
    <% } %>
</div>

<script>
    /*===========================*/
    /* Dung cho menu mobile      */
    /*===========================*/
    /* Set the width of the side navigation to 100% */
    function openNav(x) {
        document.getElementById("mySidenav").style.width = "100%";
        x.classList.toggle("change");
    }

    /* Set the width of the side navigation to 0 */
    function closeNav() {
        document.getElementById("mySidenav").style.width = "0";
        var x = document.getElementsByClassName("icon-nav")[0];
        x.classList.toggle("change");
    }

    function toggleChild(itemId, itemClass) {
        $('#sidenav ul:not([id="' + itemId + '"])').hide(500);
        $('#' + itemId).toggle(500);
    }
</script>
