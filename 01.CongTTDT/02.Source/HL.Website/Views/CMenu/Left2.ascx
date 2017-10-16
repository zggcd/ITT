<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
    int c = listItem != null ? listItem.Count : 0;
    int i = 0, j = 0, c1 = 0;
    var linhVucs = ViewBag.LinhVuc as List<WebMenuEntity>;
    var coQuans = ViewBag.CoQuan as List<WebMenuEntity>;
    var hinhThucs = ViewBag.HinhThuc as List<WebMenuEntity>;
    int HiddenChid = ViewBag.HiddenChid;
%>

<%if (c > 0)
    { %>
<%--<link rel="stylesheet" type="text/css" href="/Content2/style/css/vanban.css" media="screen">--%>
<div class="vanban_left">
    <%if (c > 0)
        {%>
    <ul>
        <%
            for (i = 0; i < c; i++)
            {
                string clsActive = "";
                string url = ViewPage.GetPageURL(listItem[i]);
                if (ViewPage.IsPageActived(listItem[i]))
                {
                    clsActive = "selected";
                }%>
        <li class="<%=clsActive %>">
            <a href="<%=url %>"><%=listItem[i].Name %></a>
            <%if (!string.IsNullOrEmpty(clsActive) && HiddenChid == 0)
                {%>

            <ul>
                <%if (linhVucs != null)
                    {
                        c1 = linhVucs.Count;%>
                <li class="g-sb-tt">Lĩnh vực</li>
                <%for (j = 0; j < c1; j++)
                    {%>
                <li><a href="?LV=<%=linhVucs[j].ID %>"><span class="vb-icon"><span class="fa fa-angle-right"></span></span><span class="vb-text"><%=linhVucs[j].Name %></span></a></li>
                <%} %>
                <%} %>

                <%if (coQuans != null)
                    {
                        c1 = coQuans.Count;%>
                <li class="g-sb-tt">Cơ quan ban hành</li>
                <%for (j = 0; j < c1; j++)
                    {%>
                <li><a href="?CQ=<%=coQuans[j].ID %>"><span class="vb-icon"><span class="fa fa-angle-right"></span></span><span class="vb-text"><%=coQuans[j].Name %></span></a></li>
                <%} %>
                <%} %>

                <%if (hinhThucs != null)
                    {
                        c1 = hinhThucs.Count;%>
                <li class="g-sb-tt">Hình thức văn bản</li>
                <%for (j = 0; j < c1; j++)
                    {%>
                <li><a href="?HT=<%=hinhThucs[j].ID %>"><span class="vb-icon"><span class="fa fa-angle-right"></span></span><span class="vb-text"><%=hinhThucs[j].Name %></span></a></li>
                <%} %>
                <%} %>
            </ul>
            <%} %>
        </li>
        <%} %>
    </ul>
    <script>
        $('.vanban_left ul li').click(function () {
            if ($(this).hasClass('selected')) {
                $(this).removeClass('selected');
            } else {
                $(".selected").removeClass('selected');
                $(this).addClass('selected');
            }
        });
    </script>
    <%} %>
</div>
<%} %>