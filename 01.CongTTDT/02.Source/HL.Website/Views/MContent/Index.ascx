<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModNewsEntity;

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
        $(".breadcrum-x").html("<a href='<%=urlHome%>'>{RS:Web_HOME}</a> / <%=Utils.GetMapPage2(ViewPage.CurrentPage, " / ", "") %>");

        $(".breadcrum-x").append("<span class=\"rss-word\">" +
            "<span class=\"rss\">" +
            "<a href=\"/<%=langCode%>/rss.aspx?menuId=<%=menuId%>\" target=\"_blank\"><span class=\"icon-rss\"></span>RSS</a></span></span>");
    });
</script>

<div width="100%" class="ms-WPBody " style="">
    <div id="ctl00_ctl45_g_c007c575_29a1_4736_adc6_c8c55b88d781">
        <script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>
        <script>
            function setTraLoiCha(a) {
                window.open('/pages/tintuc/traloi.aspx?IDTinTuc=135772&lang=1&IDCha=' + a, 'name', 'height=500,width=750');
            }
            function fontPlus() {
                var divTemp = document.getElementById('divArticleDescription');
                if (divTemp.style.fontSize == '') divTemp.style.fontSize = '12px';
                var s = divTemp.style.fontSize;
                if ((s.indexOf('px') > -1) && (s.indexOf('px') == (s.length - 2))) s = s.substring(0, s.indexOf('px'));
                divTemp.style.fontSize = (parseFloat(s) + 1) + 'px';
                $('#divArticleDescription > *').css('font-size', (parseFloat(s) + 1) + 'px');
                divTemp = document.getElementById('divArticleContent');
                if (divTemp.style.fontSize == '') divTemp.style.fontSize = '12px';
                s = divTemp.style.fontSize;
                if ((s.indexOf('px') > -1) && (s.indexOf('px') == (s.length - 2))) s = s.substring(0, s.indexOf('px'));
                divTemp.style.fontSize = (parseFloat(s) + 1) + 'px';
                $('#divArticleContent > *').css('font-size', (parseFloat(s) + 1) + 'px');
            }

            function fontMinus() {
                var divTemp = document.getElementById('divArticleDescription');
                if (divTemp.style.fontSize == '') divTemp.style.fontSize = '12px';
                var s = divTemp.style.fontSize;
                if ((s.indexOf('px') > -1) && (s.indexOf('px') == (s.length - 2))) s = s.substring(0, s.indexOf('px'));
                divTemp.style.fontSize = (parseFloat(s) - 1) + 'px';
                $('#divArticleDescription > *').css('font-size', (parseFloat(s) + 1) + 'px');
                divTemp = document.getElementById('divArticleContent');
                if (divTemp.style.fontSize == '') divTemp.style.fontSize = '12px';
                s = divTemp.style.fontSize;
                if ((s.indexOf('px') > -1) && (s.indexOf('px') == (s.length - 2))) s = s.substring(0, s.indexOf('px'));
                divTemp.style.fontSize = (parseFloat(s) - 1) + 'px';
                $('#divArticleContent > *').css('font-size', (parseFloat(s) + 1) + 'px');
            }
            function OpenPopupPlayMedia() {
                var urlParam = window.location.href;
                var url = '/pages/tintuc/TTS.aspx?id_tintuc=135772&url=' + encodeURIComponent(urlParam);
                window.open(url, "TTS", "scrollbars=1,location=0,status=0,toolbar=0,menubar=0,width=220px,height=220px");
            }
            function opensendtofriend() {
                window.open('/pages/tintuc/sendtofriend.aspx?tintucID=135772&lang=1', 'name', 'height=500,width=950');

            }
            function ThongBaoBinhLuan() {
                $('.g-search').toggle('slow');
                $('#alertthanhcong').text('Bình luận của bạn đã được gửi chờ admin duyệt');
                //$('#ctl00_ctl45_g_c007c575_29a1_4736_adc6_c8c55b88d781_ctl00_lbNotify').val("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
            }
            function showTraLoi(idtt) {
                //$(".TraLoiCon_"+idtt).toggle('slow');
                var bbb = $("#TraLoiCon_" + idtt).css("display");
                if (bbb == "none") {
                    $("#TraLoiCon_" + idtt).css("display", "block");
                }
                else {
                    $("#TraLoiCon_" + idtt).css("display", "none");
                }
            }
            function loadNews(pageIdNews) {
                $('#dsldvNews').html("<tr><td colspan='6'><img height='50' width='50' src='/Content2/style/images/loading.gif' ></td></tr>");

                $.ajax({
                    url: '/Pages/tintuc/loadnews.aspx?pageId=' + pageIdNews + '&pageSize=5&totalPage=5&totalItem=5',
                    type: 'post',
                    dataType: 'html',
                    data: {
                        "DateRead": $("#ctl00_ctl45_g_c007c575_29a1_4736_adc6_c8c55b88d781_ctl00_hdDate").val(),
                        "IDTinTuc": '135772',
                        "SubSite": '',
                        "Lang": '1',
                    },
                    success: (function (html) {

                        var nHtml = html.substring(html.indexOf("<div id=\"content\">"));

                        $('#dsldvNews').html(nHtml.substring(0, nHtml.indexOf("<div id=\"end\">")));
                        $('#pagenews').html(nHtml.substring(nHtml.indexOf("<div id=\"end\">"), nHtml.indexOf("<div id=\"endpage\">")));

                    })
                });
            }
            function loadNewsLienQuan(pageIdNews) {
                $('#dsldvNewsLienQuan').html("<tr><td colspan='6'><img height='50' width='50' src='/Content2/style/images/loading.gif' ></td></tr>");

                $.ajax({
                    url: '/Pages/tintuc/loaddstinlienquan.aspx?pageId=' + pageIdNews + '&pageSize=5&totalPage=5&totalItem=5',
                    type: 'post',
                    dataType: 'html',
                    data: {

                        "DateRead": $("#ctl00_ctl45_g_c007c575_29a1_4736_adc6_c8c55b88d781_ctl00_hdDate").val(),
                        "IDTinTuc": '135772',
                        "SubSite": '',
                        "Lang": '1',
                    },
                    success: (function (html) {
                        var nHtml = html.substring(html.indexOf("<div id=\"content\">"));

                        $('#dsldvNewsLienQuan').html(nHtml.substring(0, nHtml.indexOf("<div id=\"end\">")));
                        $('#pagenewslienquan').html(nHtml.substring(nHtml.indexOf("<div id=\"end\">"), nHtml.indexOf("<div id=\"endpage\">")));
                    })
                });
            }
            function loadNewsDongSuKien(pageIdNews) {
                $('#dsldvNewsDongSuKien').html("<tr><td colspan='6'><img height='50' width='50' src='/Content2/style/images/loading.gif' ></td></tr>");

                $.ajax({
                    url: '/Pages/tintuc/loaddstinDongSuKien.aspx?pageId=' + pageIdNews + '&pageSize=5&totalPage=5&totalItem=5',
                    type: 'post',
                    dataType: 'html',
                    data: {

                        "DateRead": $("#ctl00_ctl45_g_c007c575_29a1_4736_adc6_c8c55b88d781_ctl00_hdDate").val(),
                        "IDTinTuc": '135772',
                        "SubSite": '',
                        "Lang": '1',
                    },
                    success: (function (html) {
                        var nHtml = html.substring(html.indexOf("<div id=\"content\">"));

                        $('#dsldvNewsDongSuKien').html(nHtml.substring(0, nHtml.indexOf("<div id=\"end\">")));
                        $('#pagenewsDongSuKien').html(nHtml.substring(nHtml.indexOf("<div id=\"end\">"), nHtml.indexOf("<div id=\"endpage\">")));
                    })
                });
            }

            function loadratting() {
                var x = document.cookie;
                if (x.indexOf("ComputerRatting135772") > -1) {
                    fillratting(2);
                }
            }
            function fillratting(id) {
                console.log(id);
                var redstar = " star-rating-on";
                var rattinghtml = "";
                rattinghtml += "<span class='star-rating-control'>";
                for (var i = 1; i <= 5; i++) {
                    rattinghtml += "<div role='text' aria-label='on' class='star-rating rater-2 star star-rating-applied star-rating-readonly" + redstar + "'><a title='on'>on</a></div>";
                    if (i == id) {
                        redstar = "";
                    }
                }
                rattinghtml += "</span>";
                $('#rattingdanhgia').html(rattinghtml);
            }
            function loadDSLDV(pageId) {
                //getIDChecked();

                $('#dsldv').html("<tr><td colspan='6'><img height='50' width='50' src='/Content2/style/images/loading.gif' ></td></tr>");

                //loadPage(pageId);

                $.ajax({
                    url: '/Pages/tintuc/loadcomment.aspx?pageId=' + pageId + '&pageSize=5&totalPage=5&totalItem=0',
                    type: 'post',
                    dataType: 'html',
                    data: {
                        "IDTinTuc": 135772,
                        "Lang": '1',
                    },
                    success: (function (html) {
                        var nHtml = html.substring(html.indexOf("<div id=\"content\">"));

                        $('#dsldv').html(nHtml.substring(0, nHtml.indexOf("<div id=\"end\">")));
                        $('#pagecomment').html(nHtml.substring(nHtml.indexOf("<div id=\"end\">"), nHtml.indexOf("<div id=\"endpage\">")));
                    })
                });
            }
        </script>

        <link rel="stylesheet" type="text/css" href="/Content2/style/css/news.css" media="screen" />
        <link rel="stylesheet" type="text/css" href="/Content2/style/css/jquery.rating.css" media="screen" />
        <script type="text/javascript" src="/Content2/style/js/jquery.js"></script>
        <script type="text/javascript" src="/Content2/style/js/jquery.rating.js"></script>
        <script type="text/javascript" src="/Content2/style/js/jquery.MetaData.js"></script>
        <script type="text/javascript" src="/Content2/style/js/jquery.rating.pack.js"></script>
        <script type="text/javascript" src="/Content2/style/js/jquery.form.js"></script>

        <link rel="stylesheet" href="/Content2/style/validation/validationEngine.jquery.css" type="text/css" />
        <link rel="stylesheet" href="/Content2/style/validation/template.css" type="text/css" />
        <script src="/Content2/style/js/jquery-1.7.2.min.js" type="text/javascript"></script>

        <script src="/Content2/style/validation/jquery.validationEngine-vi.js" type="text/javascript" charset="utf-8"></script>
        <script src="/Content2/style/validation/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
        <script>
            function setFormSubmitToFalse() {
                setTimeout(function () { _spFormOnSubmitCalled = false; }, 300);
                return true;
            }
            jQuery(document).ready(function () {
                // binds form submission and fields to the validation engine
                jQuery('form').validationEngine({ promptPosition: "bottomRight" });
                $(".news_detail img").each(function () {

                    if ($(this).width() > $(window).width()) {
                        $(this).width('100%');
                        $(this).height('auto');
                    }
                    ;
                });
                tangLuotTruyCap();
            });
            function cancel() {
                $('form').unbind('submit');
            };
            function tangLuotTruyCap() {
                $.ajax({
                    url: '/Pages/tintuc/tangLuotTruyCap.aspx?tintucID=135772',
                    type: 'post',
                    dataType: 'html',
                    data: {
                    },
                    success: (function (html) {

                    })
                });
            }
        </script>

        <div class="main_right">
            <div class="box-category mb10">
                <div class="vanban-new">
                    <h3 class="title-list-news">
                        <span class="title-t1"><%=ViewPage.CurrentPage.Name %></span>
                        <%--<div class="rss-word">
                            <div class="rss">
                                <a target="_blank" href="/Pages/TinTuc/rss.aspx?chuyenmucid=91">
                                    <span class="icon-rss"></span>
                                    RSS
                                </a>
                            </div>
                        </div>--%>
                    </h3>

                </div>
            </div>

            <!--//#box-news-x-->

            <div class="news_content" id="news_content" style="width: 98%; line-height: 1.5em; background-color: rgb(255, 255, 255);">
                <div class="title_news">
                    <h1><%=item.Name %></h1>
                    <span style="color: red" id="sendsuccess"></span>
                    <div>
                        <div class="date-detail noprint">
                            <span><%=string.Format("{0:dd/MM/yyyy HH:mm tt}", item.Published) %></span>
                            <span class="fr">
                                <span class="detail-icon">Xem cỡ chữ <a href="javascript:fontMinus()"><span class="icon_small"><span class="fa fa-font"></span></span></a>
                                    <a href="javascript:fontPlus()">
                                        <span class="icon"><span class="fa fa-font"></span></span>
                                    </a>
                                </span>

                                <a href="javascript:void(0)" onclick="OpenPopupPlayMedia()">
                                    <img alt="" src="/Content2/img/icon-doc.jpg" />
                                </a>
                                <a href="/Pages/ThongTin/114130/Mot-so-tu-viet-tat-tren-Website.html">
                                    <img alt="" src="/Content2/img/icon-viettat.jpg" />
                                </a>

                                <a href="/pages/tintuc/printpage.aspx?tintucID=135772" target="_blank">
                                    <img alt="" src="/Content2/img/icon-intrang.jpg" />
                                </a>
                                <a href="javascript:void(0)" onclick="opensendtofriend()">
                                    <img alt="" src="/Content2/img/icon-gui.jpg" />
                                </a>
                            </span>
                            <input type="hidden" name="ctl00$ctl45$g_c007c575_29a1_4736_adc6_c8c55b88d781$ctl00$hdTraLoiBinhLuan" id="ctl00_ctl45_g_c007c575_29a1_4736_adc6_c8c55b88d781_ctl00_hdTraLoiBinhLuan" value="0" />
                            <div style="float: right; clear: both">
                                <span id="share_article"></span>
                            </div>
                        </div>
                        <div class="news_detail">
                            <div id="divArticleDescription" style="font-weight: bold; font-size: 15px;">
                                <%=item.Summary %>
                                <div>
                                    <strong>
                                        <br />
                                    </strong>
                                </div>
                            </div>
                            <br />
                            <div class="news_detail" id="divArticleContent">
                                <%=item.Content %>
                            </div>
                        </div>
                    </div>
                    <p align="right"><strong style="font-style: italic; padding-right: 25px;"></strong></p>
                    <p align="right" style="font-style: italic; padding-right: 25px;">{RS:View} <%=string.Format("{0:##,###}", item.View.ToString()) %></p>
                    <!--//#box-news-x-->

                    <div class="tien-ich noprint">
                        <span id="share_article_bottom"></span>
                        <span class="fr">
                            <span class="detail-icon">ĐÁNH GIÁ BÀI VIẾT(  <span id="danhgiabv"><span id="ctl00_ctl45_g_c007c575_29a1_4736_adc6_c8c55b88d781_ctl00_lbSoLuong">3</span></span>)</span>
                            <span id="tuongphan">
                                <a id="tangtuongphan" style="cursor: pointer; font: bold 12px arial;" href="javascript:;">
                                    <img style="width: 16px; height: 16px;" title="Tăng tương phản" src="/Content2/style/images/tangtuongphan.png" />
                                </a>
                                <a id="giamtuongphan" style="cursor: pointer; font: bold 12px arial;" href="javascript:;">
                                    <img style="width: 16px; height: 16px;" title="Giảm tương phản" src="/Content2/style/images/giamtuongphan.png" />
                                </a>
                            </span>
                            <span id="rattingdanhgia">
                                <input name='star1' type='radio' class='star' value='1' /><input name='star1' type='radio' class='star' checked="checked" value='2' /><input name='star1' type='radio' class='star' value='3' /><input name='star1' type='radio' class='star' value='4' /><input name='star1' type='radio' class='star' value='5' />
                            </span>
                        </span>
                    </div>
                    <div class="g-search" style="display: none" id="g-search">
                        <div class="box_content_input">
                            <div class="frm_input no1">
                                <span class="name" style="width: 120px">Họ và tên:<span style="color: red">*</span></span>
                                <div class="input" style="width: 70%">
                                    <input name="ctl00$ctl45$g_c007c575_29a1_4736_adc6_c8c55b88d781$ctl00$txtHoVaTen" type="text" maxlength="50" id="ctl00_ctl45_g_c007c575_29a1_4736_adc6_c8c55b88d781_ctl00_txtHoVaTen" class="validate[required] textBox" />
                                </div>
                            </div>
                            <div class="frm_input no1">
                                <span class="name" style="width: 120px">Email:<span style="color: red">*</span></span>
                                <div class="input" style="width: 70%">
                                    <input name="ctl00$ctl45$g_c007c575_29a1_4736_adc6_c8c55b88d781$ctl00$txtEmail" type="text" maxlength="50" id="ctl00_ctl45_g_c007c575_29a1_4736_adc6_c8c55b88d781_ctl00_txtEmail" class="validate[required,custom[email]] textBox" />
                                </div>
                            </div>

                            <div class="frm_input no1">
                                <span class="name" style="width: 120px">Nội dung:<span style="color: red">*</span></span>
                                <div class="input" style="width: 70%">
                                    <textarea name="ctl00$ctl45$g_c007c575_29a1_4736_adc6_c8c55b88d781$ctl00$txtNoiDung" rows="2" cols="20" id="ctl00_ctl45_g_c007c575_29a1_4736_adc6_c8c55b88d781_ctl00_txtNoiDung" class="validate[required] textBox"></textarea>
                                </div>
                            </div>
                            <div class="frm_input no1">
                                <span class="name" style="width: 120px">Mã Captcha:</span>
                                <div class="input" style="width: 70%">
                                    <div class="g-recaptcha" data-sitekey="6LcigRwTAAAAAEocs6rZEZ472hrBctTwmKqPETtj"></div>
                                    <span style="color: red">(Tích chọn để xác nhận bạn là bạn đọc, không phải là người máy tự động)</span>
                                </div>
                            </div>

                            <div class="button" style="padding-left: 120px">
                                <input type="submit" name="ctl00$ctl45$g_c007c575_29a1_4736_adc6_c8c55b88d781$ctl00$btn_Gui" value="Gửi bình luận" onclick="setFormSubmitToFalse(); WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions('ctl00$ctl45$g_c007c575_29a1_4736_adc6_c8c55b88d781$ctl00$btn_Gui & quot;, '', true, '', '', false, false))" id="ctl00_ctl45_g_c007c575_29a1_4736_adc6_c8c55b88d781_ctl00_btn_Gui" class="btn_action search" style="color: white; font-size: 100%; font-family: inherit; margin-left: 0;" /><span id="alertthanhcong" style="color: red"></span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            function setTuongPhan(vltuongphan) {
                if (vltuongphan == 3) {
                    $("#news_content").css("background-color", "#FFF");
                } else {
                    if (vltuongphan == 0) {
                        $("#news_content").css("background-color", "#DCDCDC");

                    } else {
                        if (vltuongphan == 1) {
                            $("#news_content").css("background-color", "#F5F5F5");

                        } else {
                            $("#news_content").css("background-color", "#F8F8FF");

                        }
                    }
                }
            }

            $(document).ready(function () {
                var tuongphan = 3;
                setTuongPhan(tuongphan);
                $("#giamtuongphan").click(function () {
                    if (tuongphan > 0) {
                        tuongphan = tuongphan - 1;
                        //$("#tangtuongphan").css("display", "block");
                        setTuongPhan(tuongphan);
                    }
                });
                $("#tangtuongphan").click(function () {
                    if (tuongphan < 3) {
                        tuongphan = tuongphan + 1;
                        //$("#tangtuongphan").css("display", "block");

                        setTuongPhan(tuongphan);
                    }
                });

                loadratting();
                $('.star-rating').click(function () {
                    var x = document.cookie;
                    if (x.indexOf("ComputerRatting135772") > -1) { }
                    else {
                        var valradio = "";
                        var cbc = $('input[name=star1]:radio');
                        for (var i = 0; i < cbc.length; i++) {
                            if (cbc[i].checked == true) {
                                valradio = cbc[i].value;
                            }
                        }
                        fillratting(valradio);
                        $('#danhgiabv').html("");

                        $.ajax({
                            url: '/Pages/TinTuc/ratting.aspx',
                            type: 'post',
                            dataType: 'html',
                            data: {
                                "IDTinTuc": 135772,
                                "Rate": valradio,
                            },
                            success: (function (html) {
                                var nHtml = html.substring(html.indexOf("<span id=\"content\">"));

                                $('#danhgiabv').html(nHtml.substring(0, nHtml.indexOf("<div id=\"end\">")));
                            })
                        });
                    }
                    document.cookie = "ComputerRatting135772";
                });
            });
        </script>
        <link href="/Content2/style/datetimepicker/jquery-ui.css" type="text/css" media="all" rel="stylesheet" />
        <script src="/Content2/style/datetimepicker/jquery-ui.min.js"></script>
        <script type="text/javascript" src="/Content2/style/js/social-buttons-share.js"></script>
        <script>
            var jqDT = $.noConflict();
            $(function () {
                jqDT("#share_article").socialButtonsShare({
                    socialNetworks: ["facebook", "googleplus", "linkedin", "twitter", "wordpress"],
                    url: window.location.href,
                    text: "",
                    sharelabel: false
                }, {
                        facebook: {
                            title: "Chia sẻ trang trên FB"
                        },
                        twitter: {
                            title: "Chia sẻ trang trên Twitter"
                        },
                        googleplus: {
                            title: "Chia sẻ trang trên Google+"
                        },
                        linkedin: {
                            title: "Chia sẻ trang trên Linkedin"
                        },
                        wordpress: {
                            title: "Chia sẻ trang trên WordPress"
                        }
                    });
                jqDT("#share_article_bottom").socialButtonsShare({
                    socialNetworks: ["facebook", "googleplus", "linkedin", "twitter", "wordpress"],
                    url: window.location.href,
                    text: "",
                    sharelabel: false,

                }, {
                        facebook: {
                            title: "Chia sẻ trang trên FB"
                        },
                        twitter: {
                            title: "Chia sẻ trang trên Twitter"
                        },
                        googleplus: {
                            title: "Chia sẻ trang trên Google+"
                        },
                        linkedin: {
                            title: "Chia sẻ trang trên Linkedin"
                        },
                        wordpress: {
                            title: "Chia sẻ trang trên WordPress"
                        }
                    });
                jqDT.datepicker.regional['custom'] = {
                    dateFormat: 'dd/mm/yy',
                    monthNames: ['Tháng một', 'Tháng hai', 'Tháng ba', 'Tháng tư', 'Tháng năm', 'Tháng sáu', 'Tháng bảy',
                        'Tháng tám', 'Tháng chín', 'Tháng mười', 'Tháng mười một', 'Tháng mười hai'],
                    monthNamesShort: ['Th 1', 'Th 2', 'Th 3', 'Th 4', 'Th 5', 'Th 6', 'Th 7',
                        'Th 8', 'Th 9', 'Th 10', 'Th 11', 'Th 12'],
                    dayNames: ['Chủ nhật', 'Thứ hai', 'Thứ ba', 'Thứ tư', 'Thứ năm', 'Thứ sáu', 'Thứ bảy'],
                    dayNamesShort: ['Chủ nhật', 'Thứ 2', 'Thứ 3', 'Thứ 4', 'Thứ 5', 'Thứ 6', 'Thứ 7'],
                    dayNamesMin: ['CN', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7']

                };

                jqDT.datepicker.setDefaults(jqDT.datepicker.regional['custom']);

                jqDT.datepicker.setDefaults({ dateFormat: 'dd/mm/yy' })
                jqDT("#txtdate").datepicker({
                    onSelect: function (dateText, inst) {
                        var date = jqDT(this).val();

                        $('input[id*="hdDate"]').val(date);
                        //alert(date);

                        jqDT("#txtdate").toggle("slow", function () { });
                        var tcm = 'Tin-hoat-dong-cua-Bo.html';
                        //var lch=window.location.hostname;
                        date = date.replace('/', '-');
                        date = date.replace('/', '-');

                        var cmresult = '' + "/Pages/ChuyenMuc/XemTheoNgay/91/1/";
                        window.location.href = "http://" + $(location).attr('hostname') + cmresult + date + "/" + tcm;

                        //alert(window.location.hostname);
                    }
                });
                jqDT("button.date").click(function (e) {
                    e.preventDefault();
                    jqDT("#txtdate").toggle("slow", function () { });
                });
            });
        </script>
        <input type="hidden" name="ctl00$ctl45$g_c007c575_29a1_4736_adc6_c8c55b88d781$ctl00$hdDate" id="ctl00_ctl45_g_c007c575_29a1_4736_adc6_c8c55b88d781_ctl00_hdDate" />
        <input type="submit" name="ctl00$ctl45$g_c007c575_29a1_4736_adc6_c8c55b88d781$ctl00$btnSubmit" value="xemtheongay" onclick="cancel(); WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions('ctl00$ctl45$g_c007c575_29a1_4736_adc6_c8c55b88d781$ctl00$btnSubmit ', '', true, '', '', false, false))" id="ctl00_ctl45_g_c007c575_29a1_4736_adc6_c8c55b88d781_ctl00_btnSubmit" class="hidden" />

    </div>
    <div class="ms-clear"></div>
</div>

<%--<div class="container-fluid">
    <nav class="breadcrumb">
        <a class="breadcrumb-item" href="/">{RS:Web_HOME}</a>
        <%= Utils.GetMapPage(ViewPage.CurrentPage, "", "breadcrumb-item")%>
    </nav>

    <%if (item != null)
        { %>

    <%=item.Content%>

    <p>
        Tags : 
       <% if (!string.IsNullOrEmpty(item.Tags))
           {
               string[] ArrTag = item.Tags.Split(',');%>
        <%for (int i = 0; i < ArrTag.Length; i++)
            {
                ArrTag[i] = ArrTag[i].Trim();%>
        <%if (i > 0)
            { %> , <%} %>
        <a href="<%= ViewPage.GetURL("Tag", Data.GetCode(ArrTag[i])) %>" title="<%= ArrTag[i] %>"><%= ArrTag[i]%></a>
        <%} %>
        <%} %>
    </p>

    <%} %>
</div>--%>
