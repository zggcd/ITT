<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var detail = ViewBag.Detail as ModNewsEntity;
    var title = ViewBag.Title ?? "";
%>

<div class="w3-container w3-light-grey" style="padding: 128px 16px" id="contact">
    <h3 class="w3-center"><%=title %></h3>
    <div class="w3-center w3-large"><%=detail.Content %></div>
    <div class="w3-row-padding" style="margin-top: 64px">
        <div class="w3-half">
            <p><i class="fa fa-map-marker fa-fw w3-xxlarge w3-margin-right"></i>{RS:Contact_Locate}</p>
            <p><i class="fa fa-phone fa-fw w3-xxlarge w3-margin-right"></i>Di động: <a href="tel:{RS:Contact_Phone}">{RS:Contact_Phone}</a></p>
            <p><i class="fa fa-envelope fa-fw w3-xxlarge w3-margin-right"></i>Email: {RS:Contact_Email}</p>
        </div>
        <div class="w3-half">
            <div class="alert warning" id="alert" style="display: none;">
                <span class="closebtn" id="closeAlert">&times;</span>
                <span id="lblWarning"></span>
            </div>
            <p>
                <input class="w3-input w3-border" type="text" placeholder="{RS:Web_FB_Name}" id="Name">
            </p>
            <p>
                <input class="w3-input w3-border" type="text" placeholder="{RS:Web_FB_Email}" id="Email">
            </p>
            <p>
                <input class="w3-input w3-border" type="text" placeholder="{RS:Web_FB_Phone}" id="Phone">
            </p>
            <p>
                <input class="w3-input w3-border" type="text" placeholder="{RS:Web_FB_Title}" id="Title">
            </p>
            <p>
                <textarea class="w3-input w3-border" rows="3" placeholder="{RS:Web_FB_Content}" id="Content" style="min-width: 100%; max-width: 100%; max-height: 300px; min-height: 50px;"></textarea>
            </p>
            <p>
                <button class="w3-button w3-black" type="button" id="btnGuiLienHe">
                    <i class="fa fa-paper-plane"></i>&nbsp;{RS:Web_FB_Submit}
                </button>
            </p>
            <!-- Add Google Maps -->
            <%--<div id="googleMap" class="w3-greyscale-max" style="width: 100%; height: 510px;"></div>--%>
        </div>
    </div>
</div>
