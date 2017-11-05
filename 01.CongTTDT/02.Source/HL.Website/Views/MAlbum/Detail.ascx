<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModAlbumEntity;
    var listOther = ViewBag.Other as List<ModAlbumEntity>;
    int c1 = listOther != null ? listOther.Count : 0;

    var listAlbumDetail = ViewBag.AlbumDetail as List<ModAlbumDetailEntity>;
    int c2 = listAlbumDetail != null ? listAlbumDetail.Count : 0;
%>
<%--<script type="text/javascript" src="/Content2/style/js/arrow79.js"></script>--%>
<link rel="stylesheet" href="/Content2/style/css/flexslider.css" type="text/css" media="screen">

<!-- Modernizr -->
<%--<script type="text/javascript" src="/Content2/style/js/modernizr.js"></script>--%>

<script>
    //$(function () {
    //    $(document).attr("title", "Hội nghị xúc tiến đầu tư quốc tế ngành TT&TT Việt Nam năm 2017");
    //    $("title").html("Hội nghị xúc tiến đầu tư quốc tế ngành TT&TT Việt Nam năm 2017");
    //    $(".breadcrum-x").html("<a href='/pages/trangchu.aspx'>MIC </a>");
    //});
    function opensendtofriend() {
        window.open('/pages/tintuc/sendtofriend.aspx', 'name', 'height=500,width=950');
    }
    function loadNews(pageIdNews) {
        $('.content').html("<tr><td colspan='6'><img height='50' width='50' src='/Content2/style/images/loading.gif' ></td></tr>");
        $.ajax({
            url: '/Pages/album/loadds.aspx?pageId=' + pageIdNews + '&pageSize=8&totalPage=5&totalItem=65',
            type: 'post',
            dataType: 'html',
            data: {
                "IDChuyenMuc": '22',
                "NgayThang": $("#ctl00_PlaceHolderMain_g_8adc0502_6c2a_4e56_aa59_438075644cab_ctl00_hdDate").val(),
                "IDAlbum": '349',

            },
            success: (function (html) {

                var nHtml = html.substring(html.indexOf("<div id=\"content\">"));

                $('.content').html(nHtml.substring(0, nHtml.indexOf("<div id=\"end\">")));
                $('#pagenews').html(nHtml.substring(nHtml.indexOf("<div id=\"end\">"), nHtml.indexOf("<div id=\"endpage\">")));
                var b = {};

                $("div.item").each(function () {
                    var a = $(this).attr("class").split(' ')[1];

                    $("." + a + " a.title_ab").each(function (index) {
                        var c = parseFloat($(this).css("height"));

                        var i = index % 4;
                        if (b[a + "" + i]) {
                            if (b[a + "" + i] < c) {
                                b[a + "" + i] = c;
                            }
                            $("." + a + " a.title_ab").css("height", b[a + "" + i]);

                        } else {
                            b[a + "" + i] = c;

                        }
                    });

                });
            })
        });
    }

</script>

<div class="main_right">
    <div class="box-category mb10">
        <div class="vanban-new">
            <h3 class="title-list-news">
                <span class="title-t1">ALBUM ẢNH CHI TIẾT</span>
            </h3>
        </div>
    </div>
    <!--//#box-news-x-->
    <div class="news_content">
        <div class="title_news">
            <h1>
                <span id=""><%=item.Name %></span>
            </h1>
            <span style="color: red" id="sendsuccess"></span>
        </div>
    </div>

    <div style="clear: both;">
        <div class="date-detail">
            <span><span id=""><%=string.Format("{0:dd/MM/yyyy}", item.Published) %></span></span>
            <span class="fr">
                <a href="javascript:void(0)" onclick="opensendtofriend()">
                    <img alt="" src="/Content2/img/icon-gui.jpg">
                </a>
            </span>
        </div>
        <div class="news_detail">
            <p style="font-weight: bold; font-size: 15px;"><span id=""></span></p>
            <p style="text-align: justify;">&nbsp;</p>
            <div id="divArticleDescription">
                <div style="text-align: justify;"><%=item.Content %></div>
            </div>
            &nbsp;<p></p>
        </div>
        <div id="container" class="cf">
            <div id="main" role="main">
                <section class="slider">
                    <div id="slider" class="flexslider">
                        <%if (c2 > 0)
                            {%>
                        <ul class="slides">
                            <%for (int i = 0; i < c2; i++)
                                {%>
                            <li>
                                <%if (!string.IsNullOrEmpty(listAlbumDetail[i].File))
                                    {%>
                                <img src='<%=listAlbumDetail[i].File.Replace("~/", "/") %>' />
                                <%} %>
                                <%=listAlbumDetail[i].Name %>
                            </li>
                            <%} %>
                        </ul>
                        <%} %>
                    </div>
                    <div id="carousel" class="flexslider">
                        <%if (c2 > 0)
                            {%>
                        <ul class="slides">
                            <%for (int i = 0; i < c2; i++)
                                {%>
                            <li>
                                <%if (!string.IsNullOrEmpty(listAlbumDetail[i].File))
                                    {%>
                                <img src='<%=listAlbumDetail[i].File.Replace("~/", "/") %>' />
                                <%} %>
                            </li>
                            <%} %>
                        </ul>
                        <%} %>
                    </div>
                </section>
            </div>
        </div>

        <%--<p style="clear: both" align="right"><strong style="font-style: italic; padding-right: 25px;">Xuân Lộc</strong></p>--%>
        <%if (c1 > 0)
            {%>
        <div class="tin-khac mt20">
            <p>Các album khác </p>
        </div>
        <div class="container_album">
            <div class="content">
                <%for (int i = 0; i < c1; i++)
                    {
                        string cls = "itemimg0";
                        if (i > 3) cls = "itemimg1";
                        var albumDetail = ModAlbumDetailService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.AlbumID == listOther[i].ID)
                            .ToSingle_Cache();
                        if (albumDetail != null)
                        {
                %>
                <div class='item <%=cls %>'>
                    <div class='img_content'>
                        <%if (!string.IsNullOrEmpty(albumDetail.File))
                            {%>
                        <a href='<%=ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code) %>'>
                            <img alt='' src='<%=albumDetail.File.Replace("~/", "/") %>' /></a>
                        <%} %>
                    </div>
                    <a class='title_ab' href='<%=ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code) %>'><%=listOther[i].Name %></a>
                </div>
                <%}
                    } %>
            </div>
            <div class="navi-page">
                <input type="hidden" name="ctl00$PlaceHolderMain$g_8adc0502_6c2a_4e56_aa59_438075644cab$ctl00$hdDate" id="ctl00_PlaceHolderMain_g_8adc0502_6c2a_4e56_aa59_438075644cab_ctl00_hdDate" />
                <div class="navigation">
                    <div id="pagenews">
                        <ul>
                            <li class='active'><a href="javascript:loadNews('1')">1 </a></li>
                            <li><a href="javascript:loadNews('2')">2 </a></li>
                            <li><a href="javascript:loadNews('3')">3 </a></li>
                            <li><a href="javascript:loadNews('4')">4 </a></li>
                            <li><a href="javascript:loadNews('5')">5 </a></li>
                            <li><a href="javascript:loadNews('6')">...</a></li>
                            <li><a href="javascript:loadNews('2')">sau&gt;&gt;</a></li>
                            <li><a href="javascript:loadNews('9')">Trang cuối</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <%} %>
        <!--//#box-news-x-->
    </div>
</div>
<script>
    $(document).ready(function () {
        var b = {};

        $("div.item").each(function () {
            var a = $(this).attr("class").split(' ')[1];

            $("." + a + " a.title_ab").each(function (index) {
                var c = parseFloat($(this).css("height"));

                var i = index % 4;
                if (b[a + "" + i]) {
                    if (b[a + "" + i] < c) {
                        b[a + "" + i] = c;
                    }
                    $("." + a + " a.title_ab").css("height", b[a + "" + i]);

                } else {
                    b[a + "" + i] = c;

                }
            });

        });

        //$(".es-carousel-wrapper").owlCarousel({

        //       autoPlay: 3000, //Set AutoPlay to 3 seconds

        //       items: 5,
        //       itemsDesktop: [1199, 5],
        //       itemsDesktopSmall: [980, 4],
        //       itemsTablet: [768, 3],
        //       itemsMobile: [479, 1],
        //       responsive: true,
        //       responsiveRefreshRate: 200,
        //       responsiveBaseWidth: window,
        //       pagination: false,
        //       paginationNumbers: false,
        //       navigation: true,
        //       navigationText: ["prev", "next"],
        //   });

    });
</script>
<script defer="" src="/Content2/style/js/jquery.flexslider.js"></script>

<script>
    //$(function () {
    //    SyntaxHighlighter.all();
    //});
    $(window).load(function () {
        $('#carousel').flexslider({
            animation: "slide",
            controlNav: false,
            animationLoop: false,
            slideshow: true,
            itemWidth: 205,
            itemMargin: -15,
            asNavFor: '#slider'
        });

        $('#slider').flexslider({
            animation: "slide",
            controlNav: false,
            animationLoop: false,
            slideshow: true,
            sync: "#carousel",
            start: function (slider) {
                $('body').removeClass('loading');
            }
        });
    });
</script>
