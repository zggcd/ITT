<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
    var c = listItem != null ? listItem.Count : 0;
    var PageExt = HL.Core.Global.Config.GetValue("Sys.PageExt").ToString();
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
%>

<ul class="menu-right fr">
    <%--<li><a href="<%=urlHome %>"><span class="fa fa-home"></span></a></li>--%>
    <%for (int i = 0; i < c; i++)
        {
            var href = ViewPage.GetPageURL(listItem[i]);%>
    <li><a href="<%=href %>" title="<%=listItem[i].Name %>"><%=listItem[i].HtmlIcon %><%=listItem[i].Name %></a></li>
    <%} %>

    <li class="share-hover">
        <a href="javascript: void(0)"><span class="mic-icon"><span class="fa fa-share"></span></span>Chia sẻ </a>
        <span id="share"></span>
    </li>
    <%if (langCode == "vn")
        {%>
    <li><a href="/en/Home.aspx"><span class="mic-icon"><span class="fa fa-home"></span></span>English  </a></li>
    <%}
        else if (langCode == "en")
        {%>
    <li><a href="/"><span class="mic-icon"><span class="fa fa-home"></span></span>Tiếng Việt  </a></li>
    <%}%>
</ul>

<script>
    $("#share").socialButtonsShare({
        socialNetworks: ["facebook", "googleplus", "linkedin", "twitter", "pinterest", "wordpress", "gmail"],
        url: window.location.href,
        text: "",
        sharelabel: false,
        verticalAlign: true
    }
        , {
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
            pinterest: {
                title: "Chia sẻ trang trên Pinterest"
            },
            wordpress: {
                title: "Chia sẻ trang trên WordPress"
            }
        });

</script>
