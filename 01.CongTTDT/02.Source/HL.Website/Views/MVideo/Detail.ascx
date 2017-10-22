<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModVideoEntity;
    var listOther = ViewBag.Other as List<ModVideoEntity>;
    int c = listOther != null ? listOther.Count : 0;
    var model = ViewBag.Model as MVideoModel;
%>

<script>
    function opensendtofriend() {
        window.open('/pages/tintuc/sendtofriend.aspx', 'name', 'height=500,width=950');

    }
    $(function () {
        $(document).attr("title", "Sơ kết 3 năm thực hiện Chương trình tăng cường tổ chức hoạt động phục vụ sách, báo tại các Điểm BĐ-VHX");
        $(".breadcrum-x").html("<a href='/pages/trangchu.aspx'>MIC </a>");
        tangLuotTruyCap();
    });
    function loadNews(pageIdNews) {
        $('.content').html("<tr><td colspan='6'><img height='50' width='50' src='style/images/loading.gif' ></td></tr>");
        $.ajax({
            url: '/Pages/video/loadds.aspx?pageId=' + pageIdNews + '&pageSize=8&totalPage=5&totalItem=476',
            type: 'post',
            dataType: 'html',
            data: {
                "IDChuyenMuc": '',
                "subSite": '',
                "NgayThang": $("#ctl00_ctl45_g_22f553af_e902_4c80_b50a_f36ef98034f6_ctl00_hdDate").val(),
                "IDVideo": '1672',
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

    function tangLuotTruyCap() {
        $.ajax({
            url: '/Pages/tintuc/tangLuotTruyCap.aspx?videoID=1672',
            type: 'post',
            dataType: 'html',
            data: {
            },
            success: (function (html) {
            })
        });
    }
</script>
<script type="text/javascript" src="style/assets/js/bootstrap.min.js"></script>
<div class="box-category mb10">
    <div class="vanban-new">
        <h3 class="title-list-news">
            <span class="title-t1">Video</span>
        </h3>
        <span style="color: red" id="sendsuccess"></span>
    </div>
</div>
<!--//#box-news-x-->
<div class="news_content">
    <div class="title_news">
        <h1>
            <span><%=item.Name %></span>
        </h1>
    </div>
</div>
<div class="date-detail">
    <span><%=string.Format("{0:dd/MM/yyyy HH:mm}", item.Published) %></span>
    <span class="fr">
        <a href="javascript:void(0)" onclick="opensendtofriend()">
            <img alt="" src="/Content2/img/icon-gui.jpg" />
        </a>
    </span>
</div>
<div id="divArticleDescription" style="font-weight: bold; font-size: 15px; clear: both">
    <%=item.Content %>
</div>
<br />
<video src='<%=item.File1.Replace("~/", "/") %>' poster='<%=item.File.Replace("~/", "/") %>' controls="controls" style='float: left; width: 80%; margin-left: 10%;'></video>
<div style='padding-top: 10px; float: left; margin-left: 80%;'><a href="<%=item.File1.Replace("~/", "/") %>">Tải về</a></div>
<%--<p align="right" style="clear: both"><strong style="font-style: italic; padding-right: 25px;">TTTT</strong></p>--%>
<p align="right" style="clear: both; padding-right: 25px;">Lượt truy cập: <%=string.Format("{0:##,###}", item.View) %></p>

<div class="tin-khac mt20">
    <p>Các video khác </p>
</div>
<div class="container_album">
    <div class="content">
        <%for (int i = 0; i < c; i++)
            {
                string url = ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code);
        %>
        <div class='item itemimg0'>
            <div class='img_content'>
                <a href='<%=url %>'>
                    <%if (!string.IsNullOrEmpty(listOther[i].File))
                        {%>
                    <img alt='<%=listOther[i].Name %>' src='<%=listOther[i].File.Replace("~/", "/") %>' />
                    <%} %>
                </a>
                <div class='icon_video'>
                    <i class='icon'></i>
                </div>
            </div>
            <a class='title_ab' href='<%=url %>'><%=listOther[i].Name %></a>
        </div>
        <%} %>
    </div>
</div>
<!--//#box-news-x-->

<div class="navi-page">
    <%= GetPagination("/vn/Van-ban-quan-ly/Lay-y-kien-nhan-dan-ve-Du-thao-VBQPPL/Du-thao-Thong-tu-huong-dan-chi-tiet-quan-ly-xuat-ban-va-phat-hanh-xuat-ban-pham-dien-tu.aspx", model.Page, model.PageSize, model.TotalRecord)%>
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
    });
</script>
