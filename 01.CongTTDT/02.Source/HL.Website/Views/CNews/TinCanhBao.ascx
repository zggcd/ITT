<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.TinCanhBao as List<ModNewsEntity>;
    int c = listItem != null ? listItem.Count : 0;
    string title = ViewBag.Title;
    string url = ViewBag.Url1;
    int langId = ViewPage.CurrentPage.LangID;
    string tinCanhBaoUrl =  "/vn/Tin-canh-bao.aspx";
    if (langId == 2) tinCanhBaoUrl = "/en/Incident-Warning-and-Coordination/Incident-Warning.aspx";
%>


<div class="container mt-15">
    <div class="row-fluid titleContainer warning-news">
        <span><%=title %></span>
        <a class="pull-right" href="<%=tinCanhBaoUrl %>">{RS:Web_XemThem}</a>
    </div>
    <div class="row-fluid contentNews">
        <%if (c > 0)
            {
                for (int i = 0; i < c; i++)
                {%>
        <div>
            <a href="<%=ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code) %>" class="title"><%=listItem[i].Name %></a>
        </div>
        <%if (!string.IsNullOrEmpty(listItem[i].File))
            {%>
        <div class="img-blog">
            <img src="<%=listItem[i].File.Replace("~/", "/") %>" alt="">
        </div>
        <%} %>
        <div class="des-blog">
            <%if (listItem[i].Summary.Length > 800)
                {%><%=Utils.getSubString(listItem[i].Summary, 800) %><%}
                                                                         else
                                                                         {%><%=listItem[i].Summary %><%} %>
        </div>

        <div class="clear-20"></div>
        <%} %>
        <%} %>
    </div>
</div>
<div class="clear-20"></div>

<%--<div class="container mt-15">
    <div class="row-fluid titleContainer warning-news">
        <span>TIN TỨC CẢNH BÁO</span>
        <a class="pull-right" href="/vn/Tin-tuc-canh-bao.aspx">Xem thêm...</a>
    </div>
    <div class="row-fluid contentNews">
        <div>
            <a href="#" class="title">DIỄN TẬP TRONG NƯỚC KHU VỰC MIỀN TRUNG, TÂY NGUYÊN NĂM 2018</a>
        </div>
        <div class="img-blog">
            <img src="/Content1/images/demo.jpg" alt="">
        </div>
        <div class="des-blog">
            <p>[vncert.gov.vn] Ngày 29/6/2018 tại Công ty Phát triển Công viên Phần mềm Quang Trung, thành phố Đà Nẵng, Trung tâm Ứng cứu khẩn cấp máy tính Việt Nam (VNCERT) chủ trì, phối hợp với Sở Thông tin và Truyền thông thành phố Đà Nẵng , Tập đoàn Bưu chính Viễn thông Việt Nam (VNPT) tổ chức Hội thảo - Diễn tập Ứng cứu sự cố an toàn thông tin mạng khu vực miền Trung và Tây Nguyên năm 2018. Đây là lần đầu tiên một hoạt động diễn tập an toàn thông tin, an ninh mạng quy mô được tổ chức tại khu vực miền Trung và Tây Nguyên nhằm tăng cường kỹ năng phối hợp, xử lý sự cố, đảm bảo an toàn thông tin mạng cho đội ngũ...</p>
        </div>
        <div>
            <a href="#" class="title">DIỄN TẬP TRONG NƯỚC KHU VỰC MIỀN TRUNG, TÂY NGUYÊN NĂM 2018</a>
        </div>
        <div class="img-blog">
            <img src="/Content1/images/demo.jpg" alt="">
        </div>
        <div class="des-blog">
            <p>[vncert.gov.vn] Ngày 29/6/2018 tại Công ty Phát triển Công viên Phần mềm Quang Trung, thành phố Đà Nẵng, Trung tâm Ứng cứu khẩn cấp máy tính Việt Nam (VNCERT) chủ trì, phối hợp với Sở Thông tin và Truyền thông thành phố Đà Nẵng , Tập đoàn Bưu chính Viễn thông Việt Nam (VNPT) tổ chức Hội thảo - Diễn tập Ứng cứu sự cố an toàn thông tin mạng khu vực miền Trung và Tây Nguyên năm 2018. Đây là lần đầu tiên một hoạt động diễn tập an toàn thông tin, an ninh mạng quy mô được tổ chức tại khu vực miền Trung và Tây Nguyên nhằm tăng cường kỹ năng phối hợp, xử lý sự cố, đảm bảo an toàn thông tin mạng cho đội ngũ...</p>
        </div>
    </div>
</div>--%>
