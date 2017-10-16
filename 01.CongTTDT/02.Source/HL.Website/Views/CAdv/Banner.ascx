<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>


<% var listItem = ViewBag.Data as List<ModAdvEntity>; %>

<%if(listItem != null){ %> 
<div id="banner-wrapper" class="banner-news">
    <div id="banner">
        <span></span>
    </div>
</div>
<style>
    .banner-news {
	background: #bda990 url(<%= listItem[0].File.Replace("~/","/")%>) no-repeat center center;
}
</style>
<%} %>