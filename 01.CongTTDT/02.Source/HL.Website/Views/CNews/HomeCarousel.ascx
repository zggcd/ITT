<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    int c = listItem != null ? listItem.Count : 0;
    List<HL.Lib.Global.ListItem.Item> listStatus = HL.Lib.Global.ListItem.List.GetListByConfigkey("Mod.NewsState");
    int c1 = listStatus != null ? listStatus.Count : 0;
%>

<script src="/Content2/style/js/owl.carousel.min.js"></script>
<div class="news-list">
    <div class="ol-slide-news slider-news-hot">
        <%for (int i = 0; i < c; i++)
            {
                string url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
        %>
        <div class="item">
            <a class="img" href="<%=url %>">
                <%if (!string.IsNullOrEmpty(listItem[i].File))
                    {%>
                <img src="<%=listItem[i].File.Replace("~/", "/") %>" alt="logo" />
                <%} %>
            </a>
            <a class="desc" href="<%=url %>"><%=listItem[i].Name %>
                <%bool flag = false;
                    for (int j = 0; j < c1; j++)
                    {
                        if ((listItem[i].State & HL.Core.Global.Convert.ToInt(listStatus[j].Value)) == HL.Core.Global.Convert.ToInt(listStatus[j].Value))
                        {
                            flag = true;
                            break;
                        }
                    }
                    if (flag == true)
                    {%>
                <img src='/Content2/style/images/new_icon.gif' style='width: 35px; height: 20px; float: none; margin: 0px' />
                <%}%>
            </a>
        </div>
        <%} %>
    </div>
</div>
<script>
    $(document).ready(function () {
        $(".slider-news-hot").owlCarousel({
            autoPlay: 3000, //Set AutoPlay to 3 seconds
            items: 5,
            itemsDesktop: [1199, 5],
            itemsDesktopSmall: [980, 4],
            itemsTablet: [768, 3],
            itemsMobile: [479, 2],
            responsive: true,
            responsiveRefreshRate: 200,
            responsiveBaseWidth: window,
            pagination: false,
            paginationNumbers: false,
            navigation: true,
            navigationText: ["prev", "next"],
        });
    });
</script>
