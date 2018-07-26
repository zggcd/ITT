<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var listItem = ViewBag.Data as List<SysPageEntity>;
    int i = 0;
    int c = listItem != null ? listItem.Count : 0;
%>

<%if (c > 0)
    { %>
<div class="container">
    <div class="row-fluid">
        <nav class="navbar navbar-default" role="navigation">
            <div class="container-fluid p-0">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse navbar-ex1-collapse p-0">
                    <ul class="nav navbar-nav">
                        <%for (i = 0; i < c; i++)
                            {
                                var listChildItem = SysPageService.Instance.GetByParent_Cache(listItem[i].ID);
                                int c1 = listChildItem != null ? listChildItem.Count : 0;
                                int j = 0;
                                string cls = "";
                                if (c1 > 0) cls = "dropdown";
                                string href = ViewPage.GetPageURL(listItem[i]);
                                string type = MyClass.GetCusTomPage("TYPE", listItem[i].Custom);
                                string target = "";
                                if (type == "HTTP")
                                {
                                    href = listItem[i].Code;
                                    target = "_blank";
                                };%>
                        <%if (c1 > 0)
                            {%>
                        <li class="<%=cls %>">
                            <a href="javscript: void(0)" class="dropdown-toggle" data-toggle="dropdown"><%=listItem[i].Name %> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <%for (j = 0; j < c1; j++)
                                    {
                                        string href1 = ViewPage.GetPageURL(listChildItem[j]);
                                        string type1 = MyClass.GetCusTomPage("TYPE", listChildItem[j].Custom);
                                        string target1 = "";
                                        if (type1 == "HTTP")
                                        {
                                            href1 = listChildItem[j].Code;
                                            target1 = "_blank";
                                        }%>
                                <li><a href="<%=href1 %>" target="<%=target1 %>"><%=listChildItem[j].Name %></a></li>
                                <%} %>
                            </ul>
                        </li>
                        <%}
                            else
                            {%>
                        <li><a href="<%=href %>"><%=listItem[i].Name %></a></li>
                        <%} %>
                        <%} %>
                    </ul>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="/vn/Dashboard.aspx">Mạng lưới</a></li>
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
        </nav>
    </div>
</div>
<%} %>
