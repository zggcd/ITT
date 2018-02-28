<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModNewsEntity;
    var listOther = ViewBag.Other as List<ModNewsEntity>;
    int c = listOther != null ? listOther.Count : 0;
%>

<section class="portlet" id="portlet_101_INSTANCE_EYvL74oDMB5x">
    <header class="portlet-topper">
        <h1 class="portlet-title"><span class="portlet-title-text"><%=ViewPage.CurrentPage.Name %></span></h1>
    </header>
    <div class="portlet-content">
        <div class=" portlet-content-container" style="">
            <div class="portlet-body">
                <div>
                    <div class="fullContent">
                        <div class="taglib-header ">
                            <h1 class="header-title"><span><%=item.Name %></span></h1>
                        </div>
                        <div class="asset-full-content default-asset-publisher show-asset-title">
                            <div class="asset-content">
                                <style>
                                    #_101_INSTANCE_p1FZ1JGHupOq_noiDung {
                                        display: block !important;
                                        visibility: inherit !important;
                                    }
                                </style>
                                <div class="journal-content-article">
                                    <%=item.Content %>
                                </div>
                                <%if (c > 0) {%>
                                <div class="assetmore">
                                    <h2>Tin khác</h2>
                                    <ul class="listNoimg">
                                        <%for (int i = 0; i < c; i++)
                                            {%>
                                        <li><a href="<%=ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code) %>"><%=listOther[i].Name %></a> </li>
                                        <%} %>
                                    </ul>
                                </div>
                                <%} %>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<input type="hidden" value="<%= Utils.GetMapPage(ViewPage.CurrentPage, "", "")%>" id="TpmBreadCrumbs" />
<script>
    $(document).ready(function () {
        $('#AutoGenBreadcrumbs').after($('#TpmBreadCrumbs').val());
    });
</script>

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
