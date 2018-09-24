<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl"%>

<% 
    var item = ViewBag.Data as ModCVEEntity;
    var listOther = ViewBag.Other as List<ModCVEEntity>;
%>

<div class="title"><%= ViewPage.CurrentPage.Name %></div>

<div class="item">
    <p class="item-id">ID : <%= item.ID %></p>
    <p class="item-menuid">Chuyên mục : <%= item.getMenu().Name %></p>
    <p class="item-state">Vị trí : <%= string.Format("{0:#,##0}", item.State) %></p>
    <p class="item-vulnerabilitytype">Vulnerability type : <%= item.VulnerabilityType %></p>
    <p class="item-product">Product : <%= item.Product %></p>
    <p class="item-score">Score : <%= item.Score %></p>
    <p class="item-gainedaccesslevel">Gained access level : <%= item.GainedAccessLevel %></p>
    <p class="item-resolve">Resolve : <%= item.Resolve ? "Có" : "Không" %></p>
    <p class="item-activity">Duyệt : <%= item.Activity ? "Có" : "Không" %></p>
</div>

<div class="list-other">
<%for(int i = 0; listOther != null && i < listOther.Count; i++)
{
string Url = ViewPage.GetURL(listOther[i].MenuID, listOther[i].ID);%>
<%}%>
</div>
