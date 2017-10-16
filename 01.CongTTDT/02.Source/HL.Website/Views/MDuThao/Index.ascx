<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModDuThaoEntity>;
    int c = listItem != null ? listItem.Count : 0;
    var listItemHetHan = ViewBag.DataHetHan as List<ModDuThaoEntity>;
    int c2 = listItemHetHan != null ? listItemHetHan.Count : 0;
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

    int menuId = ViewPage.CurrentPage.MenuID;
%>

<script>
    $(function () {
        //$("title").html('Tin hoạt động của Bộ');
        $(".breadcrum-x").html("<a href='<%=urlHome%>'>{RS:Web_HOME}</a> / <%=Utils.GetMapPage(ViewPage.CurrentPage, " / ", "") %>");

        $(".breadcrum-x").append("<span class=\"rss-word\">" +
            "<span class=\"rss\">" +
            "<a href=\"/<%=langCode%>/rss.aspx?menuId=<%=menuId%>\" target=\"_blank\"><span class=\"icon-rss\"></span>RSS</a></span></span>");
    });
</script>

<div>
    <script language="JavaScript" type="text/javascript">
        function loadDsTbodyAndPagingGopY(pageId) {
            $('#loadDsTbodyGopY').html("<tr><td colspan='6'><img height='50' width='50' src='style/images/loading.gif' ></td></tr>");

            $.ajax({
                url: '/pages/duthaovanban/loadDanhSachDangLayGopY.aspx?pageId=' + pageId + '&pageSize=5&totalPage=5&totalItem=5',
                type: 'post',
                dataType: 'html',
                data: {
                    "IDLoaiDuThaoVanBan": "81",
                    "UrlPathAndQuery": "/pages/duthaovanban/danhsachduthaovanban.aspx"
                },
                success: (function (html) {
                    var nHtml = html.substring(html.indexOf("<div id=\"content\">") + 20);
                    $('#loadDsTbodyGopY').html(nHtml.substring(0, nHtml.indexOf("</div><!--@@@@@-->")));
                    $('#navigationDangLayGopY').html(html.substring(html.indexOf("<!--@@@@@Navigation-->")));

                })
            });
        }

        function loadDsTbodyAndPagingHetHan(pageId) {
            $('#loadDsTbodyHetHan').html("<tr><td colspan='6'><img height='50' width='50' src='style/images/loading.gif' ></td></tr>");

            $.ajax({
                url: '/pages/duthaovanban/loadDanhSachHetHanGopY.aspx?pageId=' + pageId + '&pageSize=5&totalPage=5&totalItem=395',
                type: 'post',
                dataType: 'html',
                data: {
                    "IDLoaiDuThaoVanBan": "81",
                    "UrlPathAndQuery": "/pages/duthaovanban/danhsachduthaovanban.aspx"
                },
                success: (function (html) {
                    var nHtml = html.substring(html.indexOf("<div id=\"content\">") + 20);
                    $('#loadDsTbodyHetHan').html(nHtml.substring(0, nHtml.indexOf("</div><!--@@@@@-->")));
                    $('#navigationHetHanGopY').html(html.substring(html.indexOf("<!--@@@@@Navigation-->")));

                })
            });
        }

    </script>
    <div class="main_right">
        <div class="box-category mb10">
            <div class="vanban-new">
                <h3 class="title-list-news">
                    <span class="title-t1"><%=ViewPage.CurrentPage.Name %></span>
                </h3>
            </div>
        </div>
        <!--//#box-news-x-->
        <div class="vanban_right">

            <div class="contents">
                <div class="top">
                    <div>
                        <p>
                            Hiện nay, Bộ Thông tin và Truyền thông đang xây dựng một số Dự thảo Văn bản quy phạm pháp luật. Căn cứ Luật ban hành văn bản pháp luật, Bộ Thông tin và Truyền thông xin giới thiệu toàn văn nội dung các Dự thảo Văn bản quy phạm pháp luật dưới đây để lấy ý kiến đóng góp rộng rãi của các cơ quan, tổ chức, doanh nghiệp và đông đảo người dân trong và ngoài nước. Mời bạn đọc nhấn vào các Dự thảo Văn bản quy phạm pháp luật dưới đây để xem nội dung tham gia góp ý. Trân trọng cảm ơn.
                        </p>
                        <p>&nbsp;</p>
                    </div>

                    <div class="title-t2">CÁC DỰ THẢO LẤY Ý KIẾN GÓP Ý</div>
                    <div class="main_vbtable" style="width: 100%">
                        <table style="width: 100%;">
                            <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">Dự thảo</th>
                                    <th class="text-center">Tải về</th>
                                    <th class="text-center">Xem góp ý</th>
                                    <th class="text-center">{RS:Web_GuiGopY}</th>
                                </tr>
                            </thead>
                            <tbody id="loadDsTbodyGopY">
                                <%for (int i = 0; i < c; i++)
                                    {
                                        string Url = ViewPage.GetURLCurrentPage(listItem[i].Code);%>
                                <tr>
                                    <th scope="row" style="width: 1%;"><%=(i+1) %></th>
                                    <td>
                                        <a href="<%=Url %>" style="display: block;"><%= listItem[i].Name %></a><br />
                                        <p>
                                            <span class="date">Ngày bắt đầu <%=string.Format("{0:dd/MM/yyyy}", listItem[i].StartDate) %></span>
                                            <span class="date fr">Ngày hết hạn <%=string.Format("{0:dd/MM/yyyy}", listItem[i].FinishDate) %></span>
                                        </p>
                                    </td>
                                    <td class="text-center" style="width: 10%;">
                                        <%if (!string.IsNullOrEmpty(listItem[i].File))
                                            { %>
                                        <a href="<%=listItem[i].File.Replace("~/", "/") %>"><span class="vb-icon"><span class="fa fa-download" style="float: none; font-size: 20px;"></span></span></a>
                                        <br />
                                        <%} %>
                                    </td>
                                    <td class="text-center" style="width: 15%;"><a href="<%=Url %>">Xem các góp ý</a></td>
                                    <td class="text-center" style="width: 15%;">
                                        <a class="binh-luan" href="/vn/Gop-y-du-thao.aspx?dt=<%=listItem[i].ID %>&replyUrl=/pages/duthaovanban/danhsachduthaovanban.aspx">{RS:Web_GuiGopY}</a></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>

                    <div class="title-t2">CÁC DỰ THẢO ĐÃ HẾT HẠN LẤY Ý KIẾN GÓP Ý</div>
                    <div class="main_vbtable" style="width: 100%">
                        <table style="width: 100%;">
                            <thead>
                                <tr>
                                    <th class="text-center">#</th>
                                    <th class="text-center">Dự thảo</th>
                                    <th class="text-center">Tải về</th>
                                    <th class="text-center">Xem góp ý</th>
                                </tr>
                            </thead>
                            <tbody id="loadDsTbodyHetHan">
                                <%for (int i = 0; i < c2; i++)
                                    {
                                        string Url = ViewPage.GetURLCurrentPage(listItemHetHan[i].Code);%>
                                <tr>
                                    <th scope="row" style="width: 1%;"><%=(i+1) %></th>
                                    <td>
                                        <a href="<%=Url %>" style="display: block;"><%= listItemHetHan[i].Name %></a><br />
                                        <p>
                                            <span class="date">Ngày bắt đầu <%=string.Format("{0:dd/MM/yyyy}", listItemHetHan[i].StartDate) %></span>
                                            <span class="date fr">Ngày hết hạn <%=string.Format("{0:dd/MM/yyyy}", listItemHetHan[i].FinishDate) %></span>
                                        </p>
                                    </td>
                                    <td class="text-center" style="width: 10%;">
                                        <%if (!string.IsNullOrEmpty(listItemHetHan[i].File))
                                            { %>
                                        <a href="<%=listItemHetHan[i].File.Replace("~/", "/") %>"><span class="vb-icon"><span class="fa fa-download" style="float: none; font-size: 20px;"></span></span></a>
                                        <br />
                                        <%} %>
                                    </td>
                                    <td class="text-center" style="width: 30%;"><a href="<%=Url %>">Xem các góp ý</a></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                    <div class="navi-page">
                        <%= GetPagination(model.Page, model.PageSize, model.TotalRecord)%>
                        <%--<span class="navigation" id="navigationHetHanGopY">
                            <ul>
                                <li class='active'><a href="javascript:loadDsTbodyAndPagingHetHan('1')">1 </a></li>
                                <li><a href="javascript:loadDsTbodyAndPagingHetHan('2')">2 </a></li>
                                <li><a href="javascript:loadDsTbodyAndPagingHetHan('3')">3 </a></li>
                                <li><a href="javascript:loadDsTbodyAndPagingHetHan('4')">4 </a></li>
                                <li><a href="javascript:loadDsTbodyAndPagingHetHan('5')">5 </a></li>
                                <li><a href="javascript:loadDsTbodyAndPagingHetHan('2')">Sau</a></li>
                                <li><a href="javascript:loadDsTbodyAndPagingHetHan('79')">Trang cuối</a></li>
                            </ul>
                        </span>--%>
                    </div>
                </div>
                <!--.Main_container-->
            </div>
        </div>
    </div>

</div>
<div class="ms-clear"></div>
