<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
    var c = listItem != null ? listItem.Count : 0;
    var PageExt = HL.Core.Global.Config.GetValue("Sys.PageExt").ToString();
    string langCode = "";
    if (ViewPage.CurrentLang.ID == 1)
    {
        langCode = "vn";
    }
    else if (ViewPage.CurrentLang.ID == 2)
    {
        langCode = "en";
    }
    else if (ViewPage.CurrentLang.ID == 3)
    {
        langCode = "cn";
    }
%>

<nav class="navbar navbar-toggleable-md navbar-inverse bg-primary">
    <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <a class="navbar-brand" href="/">TINHTINH.COM</a>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <%for (int i = 0; i < c; i++)
                {
                    var listChildItem = SysPageService.Instance.GetByParent_Cache(listItem[i].ID);
                    var countChild = listChildItem != null ? listChildItem.Count : 0;

                    var cls = "";
                    cls += ViewPage.IsPageActived(listItem[i], 0) ? " active" : "";
                    cls += countChild > 0 ? " dropdown" : "";
                    var href = ViewPage.GetPageURL(listItem[i]);
            %>
            <li class="nav-item <%=cls %>">
                <%if (countChild > 0)
                    {%>
                <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="<%=href %>" role="button" aria-haspopup="true" aria-expanded="false"><%=listItem[i].Name%></a>
                <div class="dropdown-menu">
                    <%for (int j = 0; j < countChild; j++)
                        {
                            var listChildItem1 = SysPageService.Instance.GetByParent_Cache(listChildItem[j].ID);%>
                    <a class="dropdown-item" href="<%=ViewPage.GetPageURL(listChildItem[j]) %>"><%=listChildItem[j].Name%></a>
                    <%} %>
                </div>
                <%}
                    else
                    {%>
                <a class="nav-link" href="<%=href %>"><%=listItem[i].Name%></a>
                <%}%>
            </li>
            <%} %>
        </ul>
        <form action="/<%=langCode %>/Tim-kiem<%=PageExt %>" method="get" class="form-inline my-2 my-lg-0">
            <input class="form-control mr-sm-2" type="text" placeholder="{RS:Web_SearchPlaceHolder}" id="keyword" name="keyword" onclick="this.value = '';" />
            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">{RS:Web_Search}</button>
        </form>
    </div>
</nav>
