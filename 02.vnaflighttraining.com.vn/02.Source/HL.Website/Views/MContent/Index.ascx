<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModNewsEntity;
%>

<%if (item != null)
    {%>
<section class="portlet">
    <header class="portlet-topper">
        <h1 class="portlet-title"><span class="portlet-title-text"><%=ViewPage.CurrentPage.Name %></span> </h1>
    </header>
    <div class="portlet-content">
        <div class=" portlet-content-container" style="">
            <div class="portlet-body">
                <div class="journal-content-article">
                    <%=item.Content %>
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
<%} %>
