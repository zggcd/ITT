<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    List<HL.Lib.Global.ListItem.Item> listStatus = HL.Lib.Global.ListItem.List.GetListByConfigkey("Mod.NewsState");
    int c0 = listStatus != null ? listStatus.Count : 0;

    var listItem1 = ViewBag.Data as List<ModNewsEntity>;
    int c1 = listItem1 != null ? listItem1.Count : 0;
    string title = ViewBag.Title;
    string url1 = ViewBag.Url1;

    var listItem2 = ViewBag.Data2 as List<ModNewsEntity>;
    int c2 = listItem2 != null ? listItem2.Count : 0;
    string title2 = ViewBag.Title2;
    string url2 = ViewBag.Url2;
%>

<style>
    .content-category.w100.fl ul li {
        word-break: normal !important;
    }
</style>

<div class="box-category mb10">
    <div class="list-category left">
        <div class="ms-webpart-zone ms-fullWidth">
            <h3 class="title-list-news">
                <span class="title-t1">
                    <a href="<%=url1 %>"><%=title %></a>
                </span>
            </h3>
            <div class="content-category w100 fl">
                <%if (c1 > 0)
                    {
                        string url0 = ViewPage.GetURL(listItem1[0].MenuID, listItem1[0].Code);
                %>
                <ul class="thamchieu chuyenmuc12">
                    <li class="first-news">
                        <a href="<%=url0 %>" class="img">
                            <%if (!string.IsNullOrEmpty(listItem1[0].File))
                                {%>
                            <img src="<%=listItem1[0].File.Replace("~/", "/") %>" alt="<%=listItem1[0].Name %>" />
                            <%} %>
                        </a>
                        <h4 class="title-news title-t2">
                            <a href="<%=url0 %>">
                                <%=listItem1[0].Name %>
                                <%bool flag = false;
                                    for (int j = 0; j < c0; j++)
                                    {
                                        if ((listItem1[0].State & HL.Core.Global.Convert.ToInt(listStatus[j].Value)) == HL.Core.Global.Convert.ToInt(listStatus[j].Value))
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

                    <%if (c1 > 1)
                        {
                            for (int i = 1; i < c1; i++)
                            {
                                string url = ViewPage.GetURL(listItem1[i].MenuID, listItem1[i].Code);%>
                    <li>
                        <a href="<%=url %>" class="shape">
                            <%=listItem1[i].Name %>
                            <%flag = false;
                                for (int j = 0; j < c0; j++)
                                {
                                    if ((listItem1[i].State & HL.Core.Global.Convert.ToInt(listStatus[j].Value)) == HL.Core.Global.Convert.ToInt(listStatus[j].Value))
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
    <div class="list-category right">
        <div class="ms-webpart-zone ms-fullWidth">

            <h3 class="title-list-news">
                <span class="title-t1">
                    <a href="<%=url2 %>"><%=title2 %></a>
                </span>
            </h3>
            <div class="content-category w100 fl">
                <%if (c2 > 0)
                    {
                        string url0 = ViewPage.GetURL(listItem2[0].MenuID, listItem2[0].Code);
                %>
                <ul class="thamchieu chuyenmuc12">
                    <li class="first-news">
                        <a href="<%=url0 %>" class="img">
                            <%if (!string.IsNullOrEmpty(listItem2[0].File))
                                {%>
                            <img src="<%=listItem2[0].File.Replace("~/", "/") %>" alt="<%=listItem2[0].Name %>" />
                            <%} %>
                        </a>
                        <h4 class="title-news title-t2">
                            <a href="<%=url0 %>">
                                <%=listItem2[0].Name %>
                                <%bool flag = false;
                                    for (int j = 0; j < c0; j++)
                                    {
                                        if ((listItem2[0].State & HL.Core.Global.Convert.ToInt(listStatus[j].Value)) == HL.Core.Global.Convert.ToInt(listStatus[j].Value))
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

                    <%if (c2 > 1)
                        {
                            for (int i = 1; i < c2; i++)
                            {
                                string url = ViewPage.GetURL(listItem2[i].MenuID, listItem2[i].Code);%>
                    <li>
                        <a href="<%=url %>" class="shape">
                            <%=listItem2[i].Name %>
                            <%flag = false;
                                for (int j = 0; j < c0; j++)
                                {
                                    if ((listItem2[i].State & HL.Core.Global.Convert.ToInt(listStatus[j].Value)) == HL.Core.Global.Convert.ToInt(listStatus[j].Value))
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
