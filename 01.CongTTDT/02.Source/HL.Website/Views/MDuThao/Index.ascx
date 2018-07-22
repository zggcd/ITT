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

<style>
    table.tbl {
        width: 100%;
    }

        table.tbl th, table.tbl td {
            border: 1px solid;
            padding: 5px;
        }
</style>

<div class="row-fluid titleContainer">
    <span><%=ViewPage.CurrentPage.Name %></span>
</div>
<div class="row-fluid contentNews">
    <div>
        <p>
            Hiện nay, Bộ Thông tin và Truyền thông đang xây dựng một số Dự thảo Văn bản quy phạm pháp luật. Căn cứ Luật ban hành văn bản pháp luật, Bộ Thông tin và Truyền thông xin giới thiệu toàn văn nội dung các Dự thảo Văn bản quy phạm pháp luật dưới đây để lấy ý kiến đóng góp rộng rãi của các cơ quan, tổ chức, doanh nghiệp và đông đảo người dân trong và ngoài nước. Mời bạn đọc nhấn vào các Dự thảo Văn bản quy phạm pháp luật dưới đây để xem nội dung tham gia góp ý. Trân trọng cảm ơn.
        </p>
        <p>&nbsp;</p>
    </div>

    <div class="title-t2">CÁC DỰ THẢO LẤY Ý KIẾN GÓP Ý</div>
    <div>
        <table class="tbl">
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
                    <td style="width: 1%;"><%=(i+1) %></td>
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

    <br /><br />
    <div class="title-t2">CÁC DỰ THẢO ĐÃ HẾT HẠN LẤY Ý KIẾN GÓP Ý</div>
    <div>
        <table class="tbl">
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
                    <td style="width: 1%;"><%=(i+1) %></td>
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
    </div>
</div>
