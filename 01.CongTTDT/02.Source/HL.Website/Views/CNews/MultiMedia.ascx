﻿<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    List<HL.Lib.Global.ListItem.Item> listStatus = HL.Lib.Global.ListItem.List.GetListByConfigkey("Mod.NewsState");
    int c0 = listStatus != null ? listStatus.Count : 0;

    var listItem = ViewBag.Data as List<ModNewsEntity>;
    int c = listItem != null ? listItem.Count : 0;
    string title = ViewBag.Title;
    string url = ViewBag.Url1;

    var listVideo = ViewBag.Video as List<ModVideoEntity>;
    int c1 = listVideo != null ? listVideo.Count : 0;

    var listAlbum = ViewBag.Album as List<ModAlbumEntity>;
    int c2 = listAlbum != null ? listAlbum.Count : 0;
%>

<style>
    .content-category.w100.fl ul li {
        word-break: normal !important;
    }
</style>

<div class="box-category mb10">
    <div class="list-category left news-video">
        <div class="ms-webpart-zone ms-fullWidth">
            <script>
                var sttvideo = 0;
                function playVid() {
                    var vid = document.getElementById("myVideo");
                    var source = document.createElement('controls');
                    document.getElementById("myVideo").setAttribute("controls", "");
                    document.getElementById("main-video").style.display = "none";
                    document.getElementById("pre-video").style.display = "none";
                    document.getElementById("play-video").style.display = "none";
                    if (sttvideo == 0) {
                        vid.play();
                        sttvideo = 1;
                    }
                    else {
                        vid.pause();
                        sttvideo = 0;
                    }

                }

            </script>

            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#video">Tin video</a></li>
                <li><a data-toggle="tab" href="#images">Tin ảnh</a></li>
            </ul>

            <div class="tab-content">
                <div id="video" class="tab-pane fade in active">
                    <%if (c1 > 0)
                        {%>
                    <div class='hot-news'>
                        <div class='img-top' onclick='playVid()'>
                            <video id='myVideo' width='100%' poster='<%=listVideo[0].File.Replace("~/", "/") %>'>
                                <source src='<%=listVideo[0].File1.Replace("~/", "/") %>' type='video/mp4' />
                                Your browser does not support the video tag.
                            </video>
                            <div class='overlay-time' id='main-video'>
                                <span class='fa fa-play-circle-o'></span><%=listVideo[0].Time %>
                            </div>
                            <div class='overlay-time' id='play-video'>
                                <span class='fa fa-play-circle-o fa-2x'></span>
                            </div>
                            <div id='pre-video'>
                                <span class='fa-play-circle-o fa fa-3x'></span>
                            </div>
                        </div>
                        <a href='<%=ViewPage.GetURL(listVideo[0].MenuID, listVideo[0].Code) %>'>
                            <p class='desc title-t2'><%=listVideo[0].Name %></p>
                        </a>

                    </div>
                    <%if (c1 > 1)
                        {%>
                    <ul class='list-news'>
                        <%for (int i = 0; i < c1; i++)
                            {
                                string url1 = ViewPage.GetURL(listVideo[i].MenuID, listVideo[i].Code);
                        %>
                        <li>
                            <a href='<%=url1 %>'>
                                <div class='img'>
                                    <%if (!string.IsNullOrEmpty(listVideo[i].File))
                                        {%>
                                    <img src='<%=listVideo[i].File.Replace("~/", "/") %>' alt='<%=listVideo[i].Name %>' style='height: 100%' />
                                    <%} %>
                                    <div class='overlay-time'>
                                        <span class='fa fa-play-circle-o'></span>1:47
                                    </div>
                                </div>
                                <p class='desc'><%=listVideo[i].Name %></p>
                            </a>
                        </li>
                        <%} %>
                    </ul>
                    <%} %>
                    <%} %>
                </div>
                <div id="images" class="tab-pane fade">
                    <%if (c2 > 0)
                        {
                            var albumDetail = ModAlbumDetailService.Instance.CreateQuery()
                                .Where(o => o.Activity == true && o.AlbumID == listAlbum[0].ID)
                                .ToSingle_Cache();
                    %>
                    <div class='hot-news'>
                        <a href='<%=ViewPage.GetURL(listAlbum[0].MenuID, listAlbum[0].Code) %>'>
                            <div class='img'>
                                <%if (albumDetail != null && !string.IsNullOrEmpty(albumDetail.File))
                                    {%>
                                <img src='<%=albumDetail.File.Replace("~/", "/") %>' alt='<%=listAlbum[0].Name %>' />
                                <%} %>
                            </div>
                            <p class='desc title-t2'><%=listAlbum[0].Name %></p>
                        </a>
                    </div>
                    <%if (c2 > 1)
                        {%>
                    <ul class='list-news'>
                        <%for (int i = 1; i < c2; i++)
                            {
                                albumDetail = ModAlbumDetailService.Instance.CreateQuery()
                                .Where(o => o.Activity == true && o.AlbumID == listAlbum[i].ID)
                                .ToSingle_Cache();
                        %>
                        <li>
                            <a href='<%=ViewPage.GetURL(listAlbum[i].MenuID, listAlbum[i].Code) %>'>
                                <div class='img'>
                                    <%if (albumDetail != null && !string.IsNullOrEmpty(albumDetail.File))
                                        {%>
                                    <img src='<%=albumDetail.File.Replace("~/", "/") %>' alt='<%=listAlbum[i].Name %>' />
                                    <%} %>
                                </div>
                                <p class='desc'><%=listAlbum[i].Name %></p>
                            </a>
                        </li>
                        <%} %>
                    </ul>
                    <%} %>
                    <%} %>
                </div>
            </div>
        </div>
    </div>
    <div class="list-category right">
        <div class="ms-webpart-zone ms-fullWidth">

            <h3 class="title-list-news">
                <span class="title-t1">
                    <a href="<%=url %>"><%=title %></a>
                </span>
            </h3>
            <div class="content-category w100 fl">
                <%if (c > 0)
                    {
                        string url0 = ViewPage.GetURL(listItem[0].MenuID, listItem[0].Code);
                %>
                <ul class="thamchieu chuyenmuc12">
                    <li class="first-news">
                        <a href="<%=url0 %>" class="img">
                            <%if (!string.IsNullOrEmpty(listItem[0].File))
                                {%>
                            <img src="<%=listItem[0].File.Replace("~/", "/") %>" alt="<%=listItem[0].Name %>" />
                            <%} %>
                        </a>
                        <h4 class="title-news title-t2">
                            <a href="<%=url0 %>">
                                <%=listItem[0].Name %>
                                <%bool flag = false;
                                    for (int j = 0; j < c0; j++)
                                    {
                                        if ((listItem[0].State & HL.Core.Global.Convert.ToInt(listStatus[j].Value)) == HL.Core.Global.Convert.ToInt(listStatus[j].Value))
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
                        </h4>
                    </li>

                    <%if (c > 1)
                        {
                            for (int i = 1; i < c; i++)
                            {
                                string _url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);%>
                    <li>
                        <a href="<%=_url %>" class="shape">
                            <%=listItem[i].Name %>
                            <%flag = false;
                                for (int j = 0; j < c0; j++)
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
                    </li>
                    <%}
                        } %>
                </ul>
                <%} %>
            </div>
        </div>
    </div>
</div>

<script>
                if (typeof getheightli === "undefined") {
                    var heightli = {};
                    var getheightli = function (thamchieu, index) {
                        $("ul." + thamchieu + " li").each(function (i) {
                            var ii = i % 6;
                            if (heightli[thamchieu + "" + ii]) {
                                heightli[thamchieu + "" + ii] = heightli[thamchieu + "" + ii] < parseFloat($(this).css("height")) ? parseFloat($(this).css("height")) : heightli[thamchieu + "" + ii];
                            } else {
                                heightli[thamchieu + "" + ii] = parseFloat($(this).css("height"));
                            }
                        });
                        return heightli[thamchieu + "" + (index % 6)];
                    }
                }
                $(document).ready(function () {

                    $("ul.thamchieu").each(function () {
                        var a = $(this).attr("class").split(' ')[1];
                        $("." + a + " li").each(function (index) {
                            $(this).css("height", getheightli(a, index));
                        });
                    });
                });
</script>
