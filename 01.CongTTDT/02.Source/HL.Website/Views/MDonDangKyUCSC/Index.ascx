<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HL.Lib.Global.CPLogin.IsLoginOnWeb())
        {
            Response.Redirect("/vn/Thanh-vien/Dang-nhap.aspx?ReturnPath=" + HttpUtility.ParseQueryString(ViewPage.CurrentURL));
            return;
        }
    }
</script>

<%--<link rel="stylesheet" href="/Content2/style/css/genaral.css" />
<link rel="stylesheet" href="/Content2/style/css/color-blue.css" />
<link rel="stylesheet" href="/Content2/style/css/common.css" />--%>
<%--<script src="/Content2/style/js/jquery.min.1.11.3.js"></script>
<script src="/Content2/style/js/common.js"></script>
<script src="/Content2/style/js/arrow79.js"></script>--%>
<%--<link rel="stylesheet" type="text/css" href="/Content2/_layouts/15/1033/styles/Themable/corev15.css?rev=OqAycmyMLoQIDkAlzHdMhQ%3D%3D" />
<link rel="stylesheet" type="text/css" href="/Content2/style/css/slide.css" />
<link href="/Content2/style/css/common-color-blue.css" rel="stylesheet" />
<link href="/Content2/style/css/corev15.css" rel="stylesheet" />
<script src="/Content2/_layouts/15/init.js"></script>
<link href="/Content/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<link href="/Content/css/style.css" rel="stylesheet" />--%>

<%
    var listItem = ViewBag.Data as List<ModDonDangKyUCSCEntity>;
    int c2 = listItem != null ? listItem.Count : 0;
    var model = ViewBag.Model as MDonDangKyUCSCModel;
%>

<div class="row-fluid titleContainer">
    <span>ĐĂNG KÝ THAM GIA MẠNG LƯỚI ỨNG CỨU SỰ CỐ</span>
</div>

<div class="contentNews">
    <div class="vanban_right">
        <div class="contents">
            <div class="top">
                <%if (c2 == 0)
                    { %>
                <div class="button pull-right" style="margin-bottom: 10px;">
                    <input style="margin-left: 10px;" class="btn btn-success" onclick="javascript: location.href = '/vn/Thanh-vien/Dang-ky-ung-cuu-su-co.aspx';" type="button" name="" value="Đăng ký" />
                </div>
                <%} %>
            </div>
            <!--.Main_container-->
        </div>

        <div class="title-t2">CÁC HỒ SƠ CỦA BẠN</div>
        <div class="main_vbtable" style="width: 100%">
            <form method="post" name="frmDsHs">
                <table style="width: 100%;" class="table-bordered">
                    <thead>
                        <tr>
                            <th class="text-center" style="width: 5%;">#</th>
                            <th class="text-center">Hồ sơ</th>
                            <th class="text-center" style="width: 20%;">Trạng thái</th>
                            <th class="text-center" style="width: 1%;"></th>
                        </tr>
                    </thead>
                    <tbody id="loadDsTbodyHetHan">
                        <%for (int i = 0; i < c2; i++)
                            {
                                //string Url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
                                string Url = "/vn/Thanh-vien/DS-dang-ky-ung-cuu-su-co/" + listItem[i].Code + ".aspx";
                                string tt = listItem[i].Activity ? "<span style=\"color: forestgreen;\">Đã phê duyệt</span>" : "<span style=\"color: red;\">Chưa phê duyệt</span>";
                        %>
                        <tr>
                            <td style="width: 5%; text-align: center;"><%=(i+1) %></td>
                            <td>
                                <a href="<%=Url %>" style="display: block;"><%= listItem[i].ToChuc_Ten %></a><br />
                                <p>
                                    <span class="date">Mã đăng ký: <%=listItem[i].Code %></span>
                                    <span class="date fr">Ngày thêm: <%=string.Format("{0:dd/MM/yyyy}", listItem[i].Published) %></span>
                                </p>
                            </td>
                            <td class="text-center" style="width: 20%;"><%=tt %></td>
                            <td class="text-center" style="width: 1%; padding: 0 5px;">
                                <%if (listItem[i].Activity == false)
                                    {%>
                                <a href="javascript: delDk('<%=listItem[i].ID %>');" id="btnXoaHs">Xóa</a>
                                <input class="btn_action search icon QAcustom" name="_hl_action[XoaDangKy]" id="XoaDangKy" value="Xóa" type="submit" style="display: none;" />
                                <%} %>
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                <input type="hidden" name="dangKyId" id="dangKyId" value="0" />
            </form>
        </div>
        <div class="navi-page">
            <%= GetPagination(model.Page, model.PageSize, model.TotalRecord)%>
        </div>
    </div>
</div>

<%--<div class="main_right">
    <div class="box-category mb10">
        <div class="vanban-new">
            <h3 class="title-list-news">
                <span class="title-t1">ĐƠN XIN ĐĂNG KÝ THAM GIA MẠNG LƯỚI ỨNG CỨU SỰ CỐ</span>
            </h3>
        </div>
    </div>
    <!--//#box-news-x-->
    <div class="vanban_right">
        <div class="contents">
            <div class="top">
                <%if (c2 == 0)
                    { %>
                <div class="button">
                    <input style="margin-left: 10px;" class="btn_action search icon QAcustom" onclick="location.href = '/vn/Thanh-vien/Dang-ky-ung-cuu-su-co.aspx';" type="button" name="" value="Thêm mới" />
                </div>
                <%} %>
            </div>
            <!--.Main_container-->
        </div>

        <div class="title-t2"><%=ViewPage.Title.ToUpper() %></div>
        <div class="main_vbtable" style="width: 100%">
            <form method="post" name="frmDsHs">
                <table style="width: 100%;">
                    <thead>
                        <tr>
                            <th class="text-center" style="width: 5%;">#</th>
                            <th class="text-center">Đăng ký</th>
                            <th class="text-center" style="width: 20%;">Trạng thái</th>
                            <th class="text-center" style="width: 1%;"></th>
                        </tr>
                    </thead>
                    <tbody id="loadDsTbodyHetHan">
                        <%for (int i = 0; i < c2; i++)
                            {
                                string Url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
                                string tt = listItem[i].Activity ? "<span style=\"color: forestgreen;\">Đã phê duyệt</span>" : "<span style=\"color: red;\">Chưa phê duyệt</span>";
                        %>
                        <tr>
                            <td style="width: 5%;"><%=(i+1) %></td>
                            <td>
                                <a href="<%=Url %>" style="display: block;"><%= listItem[i].ToChuc_Ten %></a><br />
                                <p>
                                    <span class="date">Mã đăng ký: <%=listItem[i].Code %></span>
                                    <span class="date fr">Ngày thêm: <%=string.Format("{0:dd/MM/yyyy}", listItem[i].Published) %></span>
                                </p>
                            </td>
                            <td class="text-center" style="width: 20%;"><%=tt %></td>
                            <td class="text-center" style="width: 1%;">
                                <a href="javascript: delDk('<%=listItem[i].ID %>');" id="btnXoaHs">Xóa</a>
                                <input class="btn_action search icon QAcustom" name="_hl_action[XoaDangKy]" id="XoaDangKy" value="Xóa" type="submit" style="display: none;" />
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                <input type="hidden" name="dangKyId" id="dangKyId" value="0" />
            </form>
        </div>
        <div class="navi-page">
            <%= GetPagination(model.Page, model.PageSize, model.TotalRecord)%>
        </div>
    </div>
</div>--%>

<script>
    function delDk(id) {
        if (id) {
            if (window.confirm('Bạn có chắc muốn xóa bản đăng ký này?')) {
                $('#dangKyId').val(id);
                $('#XoaDangKy').click();
            }
        }
    }
</script>
