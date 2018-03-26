<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModNewsEntity;
    var listOther = ViewBag.Other as List<ModNewsEntity>;
    int c = listOther != null ? listOther.Count : 0;
    int i = 0;

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
    <div>
        <%--<script src='https://www.google.com/recaptcha/api.js?hl=vi'></script>--%>
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
            function cancel() {
                $('form').unbind('submit');
            };
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

                                <%--<a href="javascript:void(0)" onclick="OpenPopupPlayMedia()">
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
                                </a>--%>
                            </span>
                            <%--<div style="float: right; clear: both">
                                <span id="share_article"></span>
                            </div>--%>
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
                        <%--<span id="share_article_bottom"></span>--%>
                        <span class="fr">
                            <%--<span class="detail-icon">ĐÁNH GIÁ BÀI VIẾT(  <span id="danhgiabv"><span id="ctl00_ctl45_g_c007c575_29a1_4736_adc6_c8c55b88d781_ctl00_lbSoLuong">3</span></span>)</span>--%>
                            <span id="tuongphan">
                                <a id="tangtuongphan" style="cursor: pointer; font: bold 12px arial;" href="javascript:;">
                                    <img style="width: 16px; height: 16px;" title="Tăng tương phản" src="/Content2/style/images/tangtuongphan.png" />
                                </a>
                                <a id="giamtuongphan" style="cursor: pointer; font: bold 12px arial;" href="javascript:;">
                                    <img style="width: 16px; height: 16px;" title="Giảm tương phản" src="/Content2/style/images/giamtuongphan.png" />
                                </a>
                            </span>
                            <%--<span id="rattingdanhgia">
                                <input name='star1' type='radio' class='star' value='1' /><input name='star1' type='radio' class='star' checked="checked" value='2' /><input name='star1' type='radio' class='star' value='3' /><input name='star1' type='radio' class='star' value='4' /><input name='star1' type='radio' class='star' value='5' />
                            </span>--%>
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
                                <input type="submit" name="" value="Gửi bình luận" onclick="" id="" class="btn_action search" style="color: white; font-size: 100%; font-family: inherit; margin-left: 0;" />
                            </div>
                        </div>
                    </div>
                </div>

                <!--Gui binh luan-->
                <style>
                    .box-leavecomment {
                        margin-top: 4px;
                        background-color: #f6f6f6;
                    }

                    .box-comment, .box-comment * {
                        moz-box-sizing: border-box;
                        -webkit-box-sizing: border-box;
                        box-sizing: border-box;
                        font-family: helvetica,tahoma,'lucida grande',sans-serif;
                    }

                    .clearfix, .list > li {
                        zoom: 1;
                    }

                    .box-comment .list-comments {
                        padding: 10px 10px 0;
                        border: solid 1px #eee;
                        background-color: #fdfdfd;
                    }

                    .comment-bar {
                        border: solid #eee;
                        border-width: 1px 1px 0 3px;
                        padding: 0 10px;
                        border-left-color: green;
                        position: relative;
                    }

                    .box-comment .form {
                        width: 100%;
                        padding: 0;
                        border: 1px solid #e5e5e5;
                        box-shadow: 0 2px 0 #f7f7f7;
                    }

                        .box-comment .form > .inner {
                            display: block;
                            float: none;
                            width: 100%;
                            padding: 10px;
                            line-height: 15px;
                        }

                        .box-comment .form textarea {
                            width: 100%;
                            height: 60px;
                            border: 1px solid #dadada;
                            border-radius: 3px;
                            padding: 5px 5px;
                            display: inline-block;
                            font-family: Arial,Helvetica,sans-serif;
                            font-size: 13.3333330154419px;
                        }

                        .box-comment .form .action {
                            margin-top: 5px;
                            position: relative;
                        }

                        .box-comment .form .btnSend {
                            float: right;
                            display: inline-block;
                            background: #6d84b4;
                            border-color: #3b5998;
                            font-size: 11.5px;
                            font-family: Tahoma;
                            width: 105px;
                            height: 28px;
                            text-align: center;
                            padding-top: 5px;
                            padding-bottom: 8px;
                            border-width: 1px;
                            border-style: solid;
                            border-radius: 2px;
                            color: #fff;
                            font-weight: bold;
                            display: block;
                            cursor: pointer;
                        }

                        .box-comment .form .action .comment-count {
                            position: absolute;
                            left: 0;
                            bottom: -10px;
                            border-bottom: 3px solid #ff9d08;
                            font-weight: bold;
                            line-height: 16px;
                            padding: 0 10px 8px 0;
                            font-size: 14px;
                        }

                    .box-comment .dantri-label {
                        position: absolute;
                        background: transparent;
                        background-size: 100%;
                        color: transparent;
                        width: 79px;
                        height: 28px;
                        bottom: -1px;
                        left: 7px;
                    }

                    .comment-acc, .comment-acc a {
                        color: #3b7cbd;
                    }

                    .comment-acc {
                        float: right;
                    }

                        .comment-acc a {
                            line-height: 36px;
                            display: inline-block;
                        }

                    .comments > li:first-child {
                        border-top: 0;
                    }

                    .clearfix:before, .clearfix:after, .list > li:before, .list > li:after {
                        content: "\0020";
                        display: block;
                        height: 0;
                        overflow: hidden;
                    }

                    .comments > li {
                        position: relative;
                        padding-left: 46px;
                        margin-bottom: 12px;
                        padding-top: 10px;
                        border-top: solid 1px #eee;
                    }

                    .comments .cmt-avatar {
                        position: absolute;
                        top: 14px;
                        left: 0;
                        width: 38px;
                        height: 38px;
                        background: #ECECEC;
                        vertical-align: middle;
                        text-align: center;
                        font-size: 24px;
                        line-height: 20px;
                        vertical-align: middle;
                        color: #FFF;
                        font-family: HelveticaNeue-Light,'Helvetica Neue Light','Helvetica Neue',Helvetica,Arial,sans-serif;
                        text-transform: uppercase;
                        border-radius: 50%;
                    }

                    .comments .cmt-content {
                        font-size: 14px;
                        line-height: 22px;
                        color: #1b1f22;
                    }

                    .comments .cmt-author {
                        display: block;
                        font-weight: bold;
                        color: #009EE5;
                        padding-right: 5px;
                        text-transform: capitalize;
                        margin-bottom: 2px;
                    }

                    .comments .date {
                        color: #A3B0B9;
                        font-weight: normal;
                        font-size: 11px;
                        text-transform: lowercase;
                    }

                    .comments .action {
                        margin-top: 5px;
                        white-space: nowrap;
                        line-height: 19px;
                    }

                        .comments .action .btn {
                            display: inline-block;
                            cursor: pointer;
                            position: relative;
                        }

                    .comments .act-item {
                        position: relative;
                        color: #38aee3;
                    }

                    .comments .action .sprt {
                        display: inline-block;
                        padding: 0 5px;
                    }

                    .comments .action * {
                        float: left;
                    }

                    .comments .action .act-item.likecount {
                        padding-left: 18px;
                    }

                    .comments .action .ico-like {
                        background-position: 0 -54px;
                        width: 15px;
                        height: 15px;
                    }

                    .comments .view-subcmt {
                        position: relative;
                        padding-left: 15px;
                        margin-top: 4px;
                        color: #1a7900;
                        display: block;
                    }

                    .toggle .default-text {
                        display: none;
                    }

                    .comments .ico-viewsubcmt, .comments .ico-slideup {
                        position: absolute;
                        top: 3px;
                        left: 0;
                    }

                    .comments .ico-viewsubcmt {
                        background-position: 0 -76px;
                        width: 11px;
                        height: 8px;
                    }

                    .ico-login-as-fb, .ico-login-as-google, .comments .action .ico-like, .comments .ico-viewsubcmt, .comments .ico-slideup {
                        background-image: url(/images/sprite-comment.png);
                        background-repeat: no-repeat;
                        display: inline-block;
                    }

                    .toggle .toggle-text {
                        display: block;
                    }

                    .comments .ico-slideup {
                        background-position: 0 -69px;
                        width: 9px;
                        height: 6px;
                    }

                    .comments.sub {
                        border-left: 2px solid #dcdee3;
                        padding: 0 0 0 10px;
                        margin-left: 3px;
                    }

                        .comments.sub > li {
                            padding-left: 36px;
                        }

                        .comments.sub .cmt-avatar {
                            width: 30px;
                            height: 30px;
                            font-size: 16px;
                            line-height: 11px;
                        }
                </style>
                <div class="clearfix box-comment">

                    <div class="clearfix box-comment box-leavecomment" data-type="box-comment" data-parentid="0">
                        <div class="comment-bar clearfix">
                            <p class="dantri-label fl">Bình luận</sup></p>
                            <div class="comment-acc user-action fr"><a data-type="button-login" onclick="login(this);">Đăng nhập</a> | <a data-type="button-register" onclick="register(this);">Đăng ký</a><a class="help" onclick="showHelp(this);"><img src="https://dantricdn.com/web_images/comment-helper-sz18.png" width="18" height="18"></a></div>
                            <div class="comment-acc user-info fr"><b data-type="user-name"></b>&nbsp;|&nbsp;<a onclick="javascript:logout();">Thoát</a> </div>
                        </div>
                        <div class="form" data-type="comment-form" data-parentid="0">
                            <div class="inner">
                                <textarea data-type="comment-content" placeholder="Nội dung bình luận"></textarea>
                                <div class="action clearfix"><a class="btnSend" data-type="button-send" onclick="doComment(this);">Gửi bình luận</a> <span id="spanCommentCount" class="comment-count">6 bình luận</span> </div>
                            </div>
                        </div>
                    </div>
                    <script type="text/javascript">
                        $(document).ready(function () {
                            var div = generateBoxComment(0);
                            $('#divComment').replaceWith(div);
                            checkSession();
                            initEventsForListCommentStream();
                        });
                    </script>
                    <div class="list-comments">
                        <ul class="comments" data-type="list-commentstream" data-parentid="0" data-template="tplListCommentParent">
                            <li id="comment-8abde4d0-2985-11e8-b379-0b4c6c57d133" data-type="comment-item" data-isprocessed="1" data-isparent="1" data-id="8abde4d0-2985-11e8-b379-0b4c6c57d133" data-parentid="null" data-liked="0">
                                <img class="cmt-avatar" data-type="user-avatar" src="https://static.dantricdn.com/images/no-avatar.png">
                                <div class="cmt-content"><a class="cmt-author">Nguyễn quang Trung<span class="date"> · 08:50 ngày 17/03</span></a>Với dân thường chúng tôi hạnh phúc giờ đây chỉ là ước  mong nhỏ nhoi thôi là có công ăn việc làm, cuộc sống đảm bảo, xã hội bình an, không ốm đau bệnh tật. Vậy thôi . Còn mong muốn thì nhiều lắm.                    </div>
                                <div class="action clearfix" data-type="comment-nav" data-id="8abde4d0-2985-11e8-b379-0b4c6c57d133"><a class="btn act-item" data-type="button-like">Thích</a><span class="sprt">·</span>                        <a data-type="button-reply" class="btn act-item">Trả lời</a>            <span class="sprt">·</span>                        <a data-type="button-share" class="btn act-item" onclick="share(this,'8abde4d0-2985-11e8-b379-0b4c6c57d133');">Chia sẻ</a><span class="sprt" data-group="liked" style="display: none;">·</span>                        <span class="act-item likecount" data-group="liked" style="display: none;"><i class="ico-like"></i><span data-type="liked">1</span></span>                    </div>
                                <a class="view-subcmt toggle" data-start="0" data-rows="1"><span class="default-text"><i class="ico-viewsubcmt"></i>1 trả lời</span><span class="toggle-text"><i class="ico-slideup"></i>Ẩn 1 trả lời</span></a>
                                <div style="display: none !important;" type="text/json" id="replies-8abde4d0-2985-11e8-b379-0b4c6c57d133"></div>
                                <ul class="comments sub" data-template="tplListCommentChild" data-type="list-comment">
                                    <li id="comment-bdae9000-2995-11e8-b379-0b4c6c57d133" data-type="comment-item" data-isprocessed="1" data-id="bdae9000-2995-11e8-b379-0b4c6c57d133" data-parentid="null" data-liked="0">
                                        <img class="cmt-avatar" data-type="user-avatar" src="https://static.dantricdn.com/images/no-avatar.png">
                                        <div class="cmt-content"><a class="cmt-author">Nguyễn Hiền<span class="date"> · 10:46 ngày 17/03</span></a>Những điều " ước mong nhỏ nhoi " của bạn và gia đình bạn đã có chưa ? .                    </div>
                                        <div class="action clearfix" data-type="comment-nav" data-id="bdae9000-2995-11e8-b379-0b4c6c57d133"><a class="btn act-item" data-type="button-like">Thích</a><span class="sprt">·</span>                        <a data-type="button-reply" class="btn act-item">Trả lời</a><span class="sprt">·</span>                        <a data-type="button-share" class="btn act-item" onclick="share(this,'bdae9000-2995-11e8-b379-0b4c6c57d133');">Chia sẻ</a><span class="sprt" data-group="liked" style="display: none;">·</span>                        <span class="act-item likecount" data-group="liked" style="display: none;"><i class="ico-like"></i><span data-type="liked">0</span></span>                    </div>
                                    </li>
                                    <li class="comment-placeholder" data-generated="1" data-type="comment-reply-placeholder" style="display: none;">
                                        <img class="cmt-avatar" data-type="user-avatar" src="https://static.dantricdn.com/images/no-avatar.png" data-userid="null"><div class="clearfix box-comment box-leavecomment" data-type="box-comment" data-parentid="8abde4d0-2985-11e8-b379-0b4c6c57d133">
                                            <div class="comment-bar clearfix">
                                                <p class="dantri-label fl">DÂN TRÍ <sup class="sub">ID</sup></p>
                                                <div class="comment-acc user-action fr"><a data-type="button-login" onclick="login(this);">Đăng nhập</a> | <a data-type="button-register" onclick="register(this);">Đăng ký</a><a class="help" onclick="showHelp(this);"><img src="https://dantricdn.com/web_images/comment-helper-sz18.png" width="18" height="18"></a></div>
                                                <div class="comment-acc user-info fr"><b data-type="user-name"></b>&nbsp;|&nbsp;<a onclick="javascript:logout();">Thoát</a> </div>
                                            </div>
                                            <div class="form" data-type="comment-form" data-parentid="0">
                                                <div class="inner">
                                                    <textarea data-type="comment-content" placeholder="Nội dung bình luận"></textarea>
                                                    <div class="action clearfix"><a class="btnSend" data-type="button-send" onclick="doComment(this);">Gửi bình luận</a> <span id="spanCommentCount" class="comment-count">56 bình luận</span> </div>
                                                </div>
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--//#Gui binh luan-->

                <div class="tin-khac">
                    <a href="javascript: void(0)">
                        <p>TIN KHÁC</p>
                    </a>
                    <div id="dsldvNews">
                        <%if (c > 0)
                            {%>
                        <ul>
                            <%for (i = 0; i < c; i++)
                                {
                                    string url = ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code);%>
                            <li>
                                <a href="<%=url %>" class="shape" title="<%=listOther[i].Name %>"><%=listOther[i].Name %></a><small>- <%=string.Format("{0:dd/MM/yyyy}", listOther[i].Published) %></small>
                            </li>
                            <%} %>
                        </ul>
                        <%} %>
                    </div>
                </div>
                <!--//#box-tinmoi-->

                <div class="navi-page">
                    <div class="tinmoidate">
                        <div class="date-word">
                            <button class="date" style="margin-top: 0px;">
                                <span class="icon-date"></span>
                                Xem theo ngày
                            </button>
                            <div style="position: relative">
                                <div id="txtdate" style="position: absolute; bottom: 0px; display: none;"></div>
                            </div>
                        </div>
                    </div>
                    <div class="navigation">
                        <div id="pagenews">
                            <ul></ul>
                        </div>
                    </div>
                </div>
                <!--//#navi-page-->
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

                //loadratting();
                //$('.star-rating').click(function () {
                //    var x = document.cookie;
                //    if (x.indexOf("ComputerRatting135772") > -1) { }
                //    else {
                //        var valradio = "";
                //        var cbc = $('input[name=star1]:radio');
                //        for (var i = 0; i < cbc.length; i++) {
                //            if (cbc[i].checked == true) {
                //                valradio = cbc[i].value;
                //            }
                //        }
                //        fillratting(valradio);
                //        $('#danhgiabv').html("");

                //        $.ajax({
                //            url: '/Pages/TinTuc/ratting.aspx',
                //            type: 'post',
                //            dataType: 'html',
                //            data: {
                //                "IDTinTuc": 135772,
                //                "Rate": valradio,
                //            },
                //            success: (function (html) {
                //                var nHtml = html.substring(html.indexOf("<span id=\"content\">"));

                //                $('#danhgiabv').html(nHtml.substring(0, nHtml.indexOf("<div id=\"end\">")));
                //            })
                //        });
                //    }
                //    document.cookie = "ComputerRatting135772";
                //});
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
        <input type="hidden" name="" id="" />
        <input type="submit" name="" value="xemtheongay" onclick="cancel();" id="" class="hidden" />

    </div>
    <div class="ms-clear"></div>
</div>

<%--<div class="container-fluid">
    <nav class="breadcrumb">
        <a class="breadcrumb-item" href="/">{RS:Web_HOME}</a>
        <%= Utils.GetMapPage(ViewPage.CurrentPage, "", "breadcrumb-item")%>
    </nav>

    <h4><a href="#"><%=item.Name%></a></h4>
    <%if (!string.IsNullOrEmpty(item.File))
        { %><a href="#"><img src="<%=Utils.GetResizeFile(item.File, 2, 194, 0)%>" alt="" /></a><%} %>
    <p><%=item.Summary%></p>
    <p>&nbsp;</p>
    <p><%=item.Content%></p>
    <p>
        Tags : 
       <% if (!string.IsNullOrEmpty(item.Tags))
           {
               string[] ArrTag = item.Tags.Split(',');
               for (int i = 0; i < ArrTag.Length; i++)
               {
                   ArrTag[i] = ArrTag[i].Trim();
                   if (i > 0)
                   { %> , <%} %>
        <a href="<%= ViewPage.GetURL("Tag", Data.GetCode(ArrTag[i])) %>" title="<%= ArrTag[i] %>"><%= ArrTag[i]%></a>
        <%}
            } %>
    </p>
</div>

<ul>
    <%for (int i = 0; listOther != null && i < listOther.Count; i++)
        {
            string Url = ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code);
    %>
    <li><a href="<%=Url %>"><%=listOther[i].Name%> </a></li>
    <%} %>
</ul>--%>
