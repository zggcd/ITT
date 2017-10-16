<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModNewsEntity>;
    var model = ViewBag.Model as MNewsModel;
    int c = listItem != null ? listItem.Count : 0;
    List<HL.Lib.Global.ListItem.Item> listStatus = HL.Lib.Global.ListItem.List.GetListByConfigkey("Mod.NewsState");
    int c1 = listStatus != null ? listStatus.Count : 0;

    string langCode = "", urlHome = "/";
    if (ViewPage.CurrentLang.ID == 1)
    {
        langCode = "vn";
    }
    else if (ViewPage.CurrentLang.ID == 2)
    {
        langCode = "en";
        urlHome = "/en/Home.aspx";
    }
    else if (ViewPage.CurrentLang.ID == 3)
    {
        langCode = "cn";
        urlHome = "/cn/Home.aspx";
    }

    int menuId = ViewPage.CurrentPage.MenuID;
%>

<script>
    $(function () {
        //$("title").html('Tin hoạt động của Bộ');
        $(".breadcrum-x").html("<a href='<%=urlHome%>'>{RS:Web_HOME}</a> / <%=Utils.GetMapPage(ViewPage.CurrentPage, " / ", "") %>");

        $(".breadcrum-x").append("<span class=\"rss-word\">" +
            "<span class=\"rss\">" +
            "<a href=\"/<%=langCode%>/rss.aspx?menuId=<%=menuId%>\" target=\"_blank\"><span class=\"icon-rss\"></span>RSS</a></span></span>");
    });
</script>
<div>
    <div class="box-category mb10">
        <div class="vanban-new">
            <h3 class="title-list-news">
                <span class="title-t1"><%=ViewPage.CurrentPage.Name %></span>
            </h3>
        </div>
    </div>
    <%for (int i = 0; i < c; i++)
        {
            string Url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code); %>
    <!--//#box-news-x-->
    <div class="box-news-xx">
        <%if (!string.IsNullOrEmpty(listItem[i].File))
            { %>
        <a class="image" href="<%=Url %>">
            <span class="rollx"></span>
            <img class="img-news-xx slickHoverPlus" src="<%=listItem[i].File.Replace("~/", "/") %>" alt="<%=listItem[i].Name %>" />
        </a>
        <%} %>

        <h2 class="h2-title-xx">
            <a href="<%=Url %>" title="<%=listItem[i].Name %>"><%=listItem[i].Name %>
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
        </h2>
        <div class="hot-news-tol">
            <span class="span-date">(<%=string.Format("{0:dd/MM/yyyy}", listItem[i].Published) %>)</span>
        </div>
        <div class="hot-news-sapo-x">
            <p style="text-align: justify;"><%=listItem[i].Summary %></p>
            <div>
                <strong>
                    <br />
                </strong>
            </div>
        </div>
    </div>
    <%} %>

    <div class="navi-page ">
        <%if (c > 0)
            {%>
        <div class="date-word">
            <button class="date" style="margin-top: 0px;">
                <span class="icon-date"></span>
                Xem theo ngày
            </button>
            <div style="position: relative">
                <div id="txtdate" style="position: absolute; bottom: 0px; display: none;"></div>
            </div>
            <link href="/Content2/style/datetimepicker/jquery-ui.css" type="text/css" media="all" rel="stylesheet" />
            <script src="/Content2/style/datetimepicker/jquery-ui.min.js"></script>
            <script>
                $(function () {
                    $.datepicker.regional['custom'] = {
                        dateFormat: 'dd/mm/yy',
                        monthNames: ['Tháng một', 'Tháng hai', 'Tháng ba', 'Tháng tư', 'Tháng năm', 'Tháng sáu', 'Tháng bảy',
                            'Tháng tám', 'Tháng chín', 'Tháng mười', 'Tháng mười một', 'Tháng mười hai'],
                        monthNamesShort: ['Th 1', 'Th 2', 'Th 3', 'Th 4', 'Th 5', 'Th 6', 'Th 7',
                            'Th 8', 'Th 9', 'Th 10', 'Th 11', 'Th 12'],
                        dayNames: ['Chủ nhật', 'Thứ hai', 'Thứ ba', 'Thứ tư', 'Thứ năm', 'Thứ sáu', 'Thứ bảy'],
                        dayNamesShort: ['Chủ nhật', 'Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7'],
                        dayNamesMin: ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7']

                    };
                    $.datepicker.setDefaults($.datepicker.regional['custom']);

                    $("#txtdate").datepicker({
                        onSelect: function (dateText, inst) {
                            var date = $(this).val();
                            $("#ctl00_ctl45_g_e7bb8831_2f0f_42f1_bccf_e2e2f6fb128c_ctl00_hfDate").val(date);
                            //location.href = location.pathname+ "?chuyenmucid=91&date=" + date;
                            $("#txtdate").toggle("slow", function () { });
                            document.getElementById('ctl00_ctl45_g_e7bb8831_2f0f_42f1_bccf_e2e2f6fb128c_ctl00_btnSubmit').click();
                        }
                    });
                    $("button.date").click(function (e) {
                        e.preventDefault();
                        $("#txtdate").toggle("slow", function () {
                        });
                    });
                });
                $(document).ready(function () {
                    $(window).resize(fixnav);
                    fixnav();
                });
                function fixnav() {
                    var la = $(".navi-page li.active");
                    switch (la.html()) {
                        case "1":
                            $(".navi-page li.liinner").eq(5).nextAll().css("display", "none");
                            break;
                        case "2":
                            $(".navi-page li.liinner").eq(4).nextAll().css("display", "none");
                            break;
                        default:
                            break;
                    }
                    while ($(".navi-page").height() > 79) { }
                }
            </script>
        </div>
        <%= GetPagination(model.Page, model.PageSize, model.TotalRecord)%>
        <%} %>
    </div>
</div>
<div class="ms-clear"></div>
