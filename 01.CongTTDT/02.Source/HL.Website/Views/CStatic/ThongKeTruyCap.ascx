<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    int online = ViewBag.Online;
    int truyCapNgay = ViewBag.TruyCapNgay;
    int truyCapThang = ViewBag.TruyCapThang;
    int truyCapNam = ViewBag.TruyCapNam;
    int truyCapTong = ViewBag.TruyCapTong;
%>

<div class="main-box">
    <p class="title-box">Thống kê truy cập</p>
    <div style="padding: 0 10px;">
        <p>
            <span>Đang online: <span style="float: right; font-weight: bold;"><%=string.Format("{0: ##,###}", online) %></span></span><br />
            <span>Hôm nay: <span style="float: right; font-weight: bold;"><%=string.Format("{0: ##,###}", truyCapNgay) %></span></span><br />
            <span>Trong tháng: <span style="float: right; font-weight: bold;"><%=string.Format("{0: ##,###}", truyCapThang) %></span></span><br />
            <span>Tổng: <span style="float: right; font-weight: bold;"><%=string.Format("{0: ##,###}", truyCapTong) %></span></span>
        </p>
        <div class="clear-20"></div>
    </div>
</div>
