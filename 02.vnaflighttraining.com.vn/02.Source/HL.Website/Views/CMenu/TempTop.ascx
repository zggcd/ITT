<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
    var c = listItem != null ? listItem.Count : 0;
    int i;
    var PageExt = HL.Core.Global.Config.GetValue("Sys.PageExt").ToString();
    var homePage = "/template" + PageExt;
%>

<!-- Navbar (sit on top) -->
<div class="w3-top">
    <div class="w3-bar w3-teal w3-card-2" id="myNavbar">
        <a href="<%=homePage %>" class="w3-bar-item w3-button w3-wide w3-hover-amber" style="font-weight: bold;">TINHTINH.COM
                    <%--<img src="/Content/imgs/logo-tinhtinh.png" alt="TINHTINH.COM" style="width: 200px;" />--%>
        </a>
        <!-- Right-sided navbar links -->
        <div class="w3-right w3-hide-small">
            <%if (c > 1)
                {
                    for (i = 1; i < c; i++)
                    {
                        var name = listItem[i].Name;
                        if (listItem[i].Code.Contains("#type"))
                        {
                            name = "<i class=\"fa fa-user\"></i>&nbsp;" + listItem[i].Name + "</a>";
                        }
                        if (listItem[i].Code.Contains("#pricing"))
                        {
                            name = "<i class=\"fa fa-usd\"></i>&nbsp;" + listItem[i].Name + "</a>";
                        }
                        if (listItem[i].Code.Contains("#contact"))
                        {
                            name = "<i class=\"fa fa-envelope\"></i>&nbsp;" + listItem[i].Name + "</a>";
                        }
            %>
            <a href="<%=homePage + "/" + listItem[i].Code %>" class="w3-bar-item w3-button w3-hover-amber"><%=name %></a>
            <%}%>
            <%} %>
            <%--<a href="#about" class="w3-bar-item w3-button w3-hover-amber">VỀ CHÚNG TÔI</a>
            <a href="#type" class="w3-bar-item w3-button w3-hover-amber"><i class="fa fa-user"></i>&nbsp;THỂ LOẠI WEB</a>
            <a href="#pricing" class="w3-bar-item w3-button w3-hover-amber"><i class="fa fa-usd"></i>&nbsp;BẢNG GIÁ</a>
            <a href="#contact" class="w3-bar-item w3-button w3-hover-amber"><i class="fa fa-envelope"></i>&nbsp;LIÊN HỆ</a>--%>
        </div>
        <!-- Hide right-floated links on small screens and replace them with a menu icon -->

        <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
            <i class="fa fa-bars"></i>
        </a>
    </div>
</div>

<!-- Sidebar on small screens when clicking the menu icon -->
<nav class="w3-sidebar w3-bar-block w3-black w3-card-2 w3-animate-left w3-hide-medium w3-hide-large" style="display: none" id="mySidebar">
    <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-large w3-padding-16">Đóng ×</a>
    <%if (c > 1)
        {
            for (i = 1; i < c; i++)
            {
                var name = listItem[i].Name;
                if (listItem[i].Code.Contains("#type"))
                {
                    name = "<i class=\"fa fa-user\"></i>&nbsp;" + listItem[i].Name + "</a>";
                }
                if (listItem[i].Code.Contains("#pricing"))
                {
                    name = "<i class=\"fa fa-usd\"></i>&nbsp;" + listItem[i].Name + "</a>";
                }
                if (listItem[i].Code.Contains("#contact"))
                {
                    name = "<i class=\"fa fa-envelope\"></i>&nbsp;" + listItem[i].Name + "</a>";
                }
    %>
    <a href="<%=homePage + "/" + listItem[i].Code %>" onclick="w3_close()" class="w3-bar-item w3-button"><%=name %></a>
    <%}%>
    <%} %>
    <%--<a href="#about" onclick="w3_close()" class="w3-bar-item w3-button">VỀ CHÚNG TÔI</a>
    <a href="#type" onclick="w3_close()" class="w3-bar-item w3-button">THỂ LOẠI WEB</a>
    <a href="#pricing" onclick="w3_close()" class="w3-bar-item w3-button">BẢNG GIÁ</a>
    <a href="#contact" onclick="w3_close()" class="w3-bar-item w3-button">LIÊN HỆ</a>--%>
</nav>
