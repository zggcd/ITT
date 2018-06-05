<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModIncidentEntity;
    var listOther = ViewBag.Other as List<ModIncidentEntity>;
%>

<div class="title"><%= ViewPage.CurrentPage.Name %></div>

<div class="item">
    <p class="item-id">ID : <%= item.ID %></p>
    <p class="item-menuid">Chuyên mục : <%= item.getMenu().Name %></p>
    <p class="item-state">Vị trí : <%= string.Format("{0:#,##0}", item.State) %></p>
    <p class="item-name">Tên : <%= item.Name %></p>
    <p class="item-code">Mã : <%= item.Code %></p>
    <p class="item-path">Path : <%= item.Path %></p>
    <p class="item-fakedestination">Fake destination : <%= item.FakeDestination %></p>
    <p class="item-source">Source : <%= item.Source %></p>
    <p class="item-attackon">Attack on : <%= string.Format("{0:dd/MM/yyyy HH:mm}", item.AttackOn) %></p>
    <p class="item-ip">I p : <%= item.IP %></p>
    <p class="item-isp">I s p : <%= item.ISP %></p>
    <p class="item-emailno">Email no : <%= string.Format("{0:#,##0}", item.EmailNo) %></p>
    <p class="item-attacker">Attacker : <%= item.Attacker %></p>
    <p class="item-malwarename">Malware name : <%= item.MalwareName %></p>
    <p class="item-attackerip">Attacker i p : <%= item.AttackerIP %></p>
    <p class="item-networkname">Network name : <%= item.NetworkName %></p>
    <p class="item-localip">Local i p : <%= item.LocalIP %></p>
    <p class="item-localtcpport">Local t c p port : <%= string.Format("{0:#,##0}", item.LocalTCPPort) %></p>
    <p class="item-timestamp">Timestamp : <%= string.Format("{0:dd/MM/yyyy HH:mm}", item.Timestamp) %></p>
    <p class="item-asn">A s n : <%= item.ASN %></p>
    <p class="item-geo">Geo : <%= item.Geo %></p>
    <p class="item-url">URL : <%= item.Url %></p>
    <p class="item-type">Loại : <%= string.Format("{0:#,##0}", item.Type) %></p>
    <p class="item-httpagent">Http agent : <%= item.HttpAgent %></p>
    <p class="item-srcport">Src port : <%= string.Format("{0:#,##0}", item.SrcPort) %></p>
    <p class="item-hostname">Host name : <%= item.HostName %></p>
    <p class="item-destinationport">Destinationport : <%= string.Format("{0:#,##0}", item.Destinationport) %></p>
    <p class="item-protocol">Protocol : <%= string.Format("{0:#,##0}", item.Protocol) %></p>
    <p class="item-servername">Server name : <%= item.ServerName %></p>
    <p class="item-server">Server : <%= item.Server %></p>
    <p class="item-header">Header : <%= item.Header %></p>
    <p class="item-tag">Tag : <%= item.Tag %></p>
    <p class="item-region">Region : <%= item.Region %></p>
    <p class="item-city">Tỉnh thành : <%= item.City %></p>
    <p class="item-sector">Sector : <%= item.Sector %></p>
    <p class="item-activity">Duyệt : <%= item.Activity ? "Có" : "Không" %></p>
</div>

<div class="list-other">
<%for(int i = 0; listOther != null && i < listOther.Count; i++)
{
string Url = ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code);%>
    <p class="list-other-name"><a href="<%=Url %>"><%= listOther[i].Name %></a></p>
<%}%>
</div>
