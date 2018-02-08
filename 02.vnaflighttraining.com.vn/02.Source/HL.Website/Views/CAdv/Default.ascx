<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% var listItem = ViewBag.Data as List<ModAdvEntity>; %>

<%for (int i = 0; listItem != null && i < listItem.Count; i++ )
{ %>
  <%= Utils.GetCodeAdv(listItem[i])%>
<%} %>