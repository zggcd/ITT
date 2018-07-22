<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModDuThaoEntity;
    var listOther = ViewBag.Other as List<ModDuThaoEntity>;
    var listGopY = ViewBag.GopY as List<ModGopYEntity>;
    var c = listGopY != null ? listGopY.Count : 0;
    var model = ViewBag.Model as MDuThaoModel;

    string langCode = "", urlHome = "/";
    if (ViewPage.CurrentLang.ID == 1)
    {
        langCode = "vn";
    }
    else if (ViewPage.CurrentLang.ID == 2)
    {
        langCode = "en";
        urlHome = "/en/Home.aspx";
    }
    else if (ViewPage.CurrentLang.ID == 3)
    {
        langCode = "cn";
        urlHome = "/cn/Home.aspx";
    }

    string linkGopY = "/" + langCode + "/Gop-y-du-thao.aspx?dt=" + item.ID;
%>

<script>
    jQuery(document).ready(function () {
        $("#hrButton").focus();
    });

    var flagToanVan = 1;

    function toggleXemToanVan() {
        if (flagToanVan == 0) {
            $("#divXemToanVan").css("display", "block");
            $("#a_xemtoanvan").text("Đóng xem toàn văn");
            flagToanVan = 1;
        } else {
            $("#divXemToanVan").css("display", "none");
            $("#a_xemtoanvan").text("Xem toàn văn");
            flagToanVan = 0;
        }
    }

</script>

<div class="row-fluid titleContainer">
    <span><%=item.Name %></span>
</div>
<div class="row-fluid contentNews">
    <%if (item.FinishDate >= DateTime.Now)
        {%>
    <span class="button">
        <input type="button" id="hrButton" class="g-b-search" onclick="window.location = '<%=linkGopY%>'" value="{RS:Web_GuiGopY}" />
    </span>
    <%} %>
    <div class="thong_ke">
        <div class="main mb10">
            <div class="title">
                Các ý kiến đóng góp
            </div>
            <%for (int i = 0; i < c; i++)
                {
                    string cls = "";
                    if (i % 2 != 0) cls = "bg-color";
                    TimeSpan ts = DateTime.Now - listGopY[i].Published;
                    int numDate = (int)(ts.TotalDays);%>
            <div class="content <%=cls %>">
                <div><strong style="padding-left: 10px;">Người gửi: <%=listGopY[i].Name %></strong></div>
                <div><strong style="padding-left: 10px;">Email: <%=listGopY[i].Email %></strong></div>
                <div class="text-com">
                    <%=listGopY[i].Content %>
                    <br />
                    <%if (!string.IsNullOrEmpty(listGopY[i].Files))
                        {%>
                    <span class="vb-icon" style="float: right">tải file đính kèm
                                        <a href="<%=listGopY[i].Files.Replace("~/", "/") %>" download><span class="fa fa-download" style="float: none; font-size: 20px;"></span></a>
                    </span>
                    <%} %>
                    <%if (numDate == 0)
                        {%>
                    <span style="color: #898989;">- Hôm nay</span>
                    <%}
                        else
                        {
                            string dv = "ngày";
                            int r = numDate;
                            int t = numDate / 30;
                            if (t > 0)
                            {
                                r = t;
                                dv = "tháng";
                            }%>
                    <span style="color: #898989;">- <%=r %> <%=dv %> trước</span>
                    <%} %>
                </div>
            </div>
            <%} %>
        </div>
        <!--.Main_container-->
        <div class="navi-page">
            <%= GetPagination("/vn/Van-ban-quan-ly/Lay-y-kien-nhan-dan-ve-Du-thao-VBQPPL/Du-thao-Thong-tu-huong-dan-chi-tiet-quan-ly-xuat-ban-va-phat-hanh-xuat-ban-pham-dien-tu.aspx", model.Page, model.PageSize, model.TotalRecord)%>
        </div>
        <!--//#navi-page-->
    </div>
    <br />
    <div>
        <span><a style="display: block; float: left; text-transform: uppercase; color: #015ab4;" id="a_xemtoanvan" href="javascript:toggleXemToanVan()">Đóng xem toàn văn</a></span>
    </div>
    <div id="divXemToanVan" class="news-detail" style="display: block">
        <div style="text-align: justify;">&nbsp;</div>
        <div style="text-align: justify;">&nbsp;</div>
        <div>
            <%= item.Content %>
        </div>
        <div>
            <br />
            <a href="<%=item.File.Replace("~/", "/") %>" title="" style="font-weight: bold;">Toàn văn Dự thảo đề án được tải về tại đây.</a><br />
        </div>
    </div>
</div>
