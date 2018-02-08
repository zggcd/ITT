<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>


<% var listItem = ViewBag.Data as List<ModAdvEntity>; %>

<%if(listItem != null){ %> 
<style>
    #home-wrapper {
	border-bottom: 2px solid #cccccc;
	background: #282735 url(<%= listItem[0].File.Replace("~/","/")%>) no-repeat center center;
	height: 474px;
}
</style>
<%} %>