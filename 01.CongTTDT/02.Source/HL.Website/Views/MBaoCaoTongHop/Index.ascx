<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HL.Lib.Global.CPLogin.IsLogin())
        {
            Response.Redirect("/vn/Thanh-vien/Dang-nhap.aspx?ReturnPath=" + HttpUtility.ParseQueryString(ViewPage.CurrentURL));
            return;
        }
    }
</script>

<%
    var listItem = ViewBag.Data as List<ModBaoCaoTongHopEntity>;
    int c2 = listItem != null ? listItem.Count : 0;
    var model = ViewBag.Model as MBaoCaoTongHopModel;
%>

<div class="main_right">
    <div class="box-category mb10">
        <div class="vanban-new">
            <h3 class="title-list-news">
                <span class="title-t1">BÁO CÁO TỔNG HỢP VỀ HOẠT ĐỘNG TIẾP NHẬN VÀ XỬ LÝ SỰ CỐ</span>
            </h3>
        </div>
    </div>
    <!--//#box-news-x-->
    <div class="vanban_right">
        <div class="contents">
            <div class="top">

                <div class="button">
                    <input style="margin-left: 10px;" class="btn_action search icon QAcustom" onclick="location.href = '/vn/Thanh-vien/Them-bc-tong-hop-su-co.aspx';" type="button" name="" value="Thêm mới" />
                </div>

            </div>
            <!--.Main_container-->
        </div>

        <div class="title-t2">CÁC BÁO CÁO CỦA BẠN</div>
        <div class="main_vbtable" style="width: 100%">
            <form method="post" name="frmDsHs">
                <table style="width: 100%;">
                    <thead>
                        <tr>
                            <th class="text-center" style="width: 5%;">#</th>
                            <th class="text-center">Báo cáo</th>
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
                                <a href="<%=Url %>" style="display: block;"><%= listItem[i].Name %></a><br />
                                <p>
                                    <span class="date">Mã báo cáo: <%=listItem[i].Code %></span>
                                    <span class="date fr">Ngày thêm: <%=string.Format("{0:dd/MM/yyyy}", listItem[i].Published) %></span>
                                </p>
                            </td>
                            <td class="text-center" style="width: 20%;"><%=tt %></td>
                            <td class="text-center" style="width: 1%;">
                                <a href="javascript: delBc('<%=listItem[i].ID %>');" id="btnXoaBc">Xóa</a>
                                <input class="btn_action search icon QAcustom" name="_hl_action[XoaBaoCao]" id="XoaBaoCao" value="Xóa" type="submit" style="display: none;" />
                            </td>
                        </tr>
                        <%}%>
                    </tbody>
                </table>
                <input type="hidden" name="baoCaoId" id="baoCaoId" value="0" />
            </form>
        </div>
        <div class="navi-page">
            <%= GetPagination(model.Page, model.PageSize, model.TotalRecord)%>
        </div>
    </div>
</div>

<script>
    function delHs(id) {
        if (id) {
            if (window.confirm('Bạn có chắc muốn xóa báo cáo này?')) {
                $('#baoCaoId').val(id);
                $('#XoaBaoCao').click();
            }
        }
    }
</script>
