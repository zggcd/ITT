<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModSendMailLogsEntity;
    var listOther = ViewBag.Other as List<ModSendMailLogsEntity>;
%>

<div class="title"><%= ViewPage.CurrentPage.Name %></div>

<div class="item">
    <p class="item-id">ID : <%= item.ID %></p>
    <p class="item-dichvucanhbaoid">Dich vu canh bao : <%= item.getDichVuCanhBao().Name %></p>
    <p class="item-incidentids">Incident i ds : <%= item.IncidentIDs %></p>
    <p class="item-emailfrom">Email from : <%= item.EmailFrom %></p>
    <p class="item-emailto">Email to : <%= item.EmailTo %></p>
    <p class="item-emailcc">Email cc : <%= item.EmailCc %></p>
    <p class="item-emailbcc">Email bcc : <%= item.EmailBcc %></p>
    <p class="item-attachfilepath">Attach file path : <%= item.AttachFilePath %></p>
    <p class="item-subject">Subject : <%= item.Subject %></p>
    <p class="item-body">Body : <%= item.Body %></p>
    <p class="item-publish">Xuất bản : <%= string.Format("{0:dd/MM/yyyy HH:mm}", item.Publish) %></p>
    <p class="item-activity">Duyệt : <%= item.Activity ? "Có" : "Không" %></p>
</div>

<div class="list-other">
<%for(int i = 0; listOther != null && i < listOther.Count; i++)
{
string Url = ViewPage.GetURLCurrentPage(listOther[i].ID.ToString());%>
<%}%>
</div>
