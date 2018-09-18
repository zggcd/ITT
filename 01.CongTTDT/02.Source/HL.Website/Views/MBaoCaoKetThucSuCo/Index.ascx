<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HL.Lib.Global.CPLogin.IsLoginOnWeb())
        {
            int langId = ViewPage.CurrentPage.LangID;
            string loginUrl = "/vn/Thanh-vien/Dang-nhap.aspx";
            if (langId == 2)
            {
                loginUrl = "/en/Member/Login.aspx";
            }

            Response.Redirect(loginUrl + "?ReturnPath=" + HttpUtility.ParseQueryString(ViewPage.CurrentURL));
            return;
        }
    }
</script>

<%
    var listItem = ViewBag.Data as List<ModBaoCaoKetThucSuCoEntity>;
    int c2 = listItem != null ? listItem.Count : 0;
    var model = ViewBag.Model as MBaoCaoKetThucSuCoModel;

    int langId = ViewPage.CurrentPage.LangID;
    string themBcktUrl = "/vn/Thanh-vien/Them-bc-ket-thuc-su-co.aspx";
    if (langId == 2)
    {
        themBcktUrl = "/en/Member/Them-bc-ket-thuc-su-co.aspx";
    }
%>

<div class="main_right">
    <div class="box-category mb10">
        <div class="vanban-new">
            <h3 class="title-list-news">
                <span class="title-t1">{RS:Web_BCKetThucHeader}</span>
            </h3>
        </div>
    </div>
    <!--//#box-news-x-->
    <div class="vanban_right">
        <div class="contents">
            <div class="top">

                <div class="button">
                    <input style="margin-left: 10px;" class="btn_action search icon QAcustom" onclick="location.href = '<%=themBcktUrl%>';" type="button" name="" value="{RS:Web_ThemMoiBtn}" />
                </div>

            </div>
            <!--.Main_container-->
        </div>

        <div class="title-t2">{RS:Web_CacBCCuaBan}</div>
        <div class="main_vbtable" style="width: 100%">
            <form method="post" name="frmDsHs">
                <table style="width: 100%;">
                    <thead>
                        <tr>
                            <th class="text-center" style="width: 5%;">#</th>
                            <th class="text-center">{RS:Web_BaoCaoHeadTable}</th>
                            <th class="text-center" style="width: 20%;">{RS:Web_TrangThaiHeadTable}</th>
                            <th class="text-center" style="width: 1%;"></th>
                        </tr>
                    </thead>
                    <tbody id="loadDsTbodyHetHan">
                        <%for (int i = 0; i < c2; i++)
                            {
                                string Url = ViewPage.GetURL(listItem[i].MenuID, listItem[i].Code);
                                string tt = listItem[i].Activity ? "<span style=\"color: forestgreen;\">{RS:Web_DaPheDuyet}</span>" : "<span style=\"color: red;\">{RS:Web_ChuaPheDuyet}</span>";
                        %>
                        <tr>
                            <td style="width: 5%;"><%=(i+1) %></td>
                            <td>
                                <a href="<%=Url %>" style="display: block;"><%= listItem[i].ToChuc_Ten %></a><br />
                                <p>
                                    <span class="date">{RS:Web_MaBaoCao} <%=listItem[i].Code %></span>
                                    <span class="date fr">{RS:Web_NgayThem} <%=string.Format("{0:dd/MM/yyyy}", listItem[i].Published) %></span>
                                </p>
                            </td>
                            <td class="text-center" style="width: 20%;"><%=tt %></td>
                            <td class="text-center" style="width: 1%;">
                                <a href="javascript: delBc('<%=listItem[i].ID %>');" id="btnXoaBc">{RS:Web_XoaBtn}</a>
                                <input class="btn_action search icon QAcustom" name="_hl_action[XoaBaoCao]" id="XoaBaoCao" value="{RS:Web_XoaBtn}" type="submit" style="display: none;" />
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
    function delBc(id) {
        if (id) {
            if (window.confirm('{RS:Web_BanCoChacXoa}')) {
                $('#baoCaoId').val(id);
                $('#XoaBaoCao').click();
            }
        }
    }
</script>
