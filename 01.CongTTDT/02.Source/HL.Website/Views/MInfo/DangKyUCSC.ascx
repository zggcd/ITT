<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HL.Lib.Global.CPLogin.IsLoginOnWeb())
        {
            int langId = ViewPage.CurrentPage.LangID;
            string loginUrl = "/vn/Thanh-vien/Dang-nhap.aspx"
                , themHsUrl = "/vn/Thanh-vien/Them-ho-so-ung-cuu-su-co.aspx";
            if (langId == 2)
            {
                loginUrl = "/en/Member/Login.aspx";
                themHsUrl = "/en/Member/Them-ho-so-ung-cuu-su-co.aspx";
            }

            Response.Redirect(loginUrl + "?ReturnPath=" + HttpUtility.ParseQueryString(themHsUrl));
            return;
        }
        //int userId = HL.Lib.Global.CPLogin.UserID;
        //var dk = ModDonDangKyUCSCService.Instance.CreateQuery().Where(o => o.UserID == userId).ToSingle();
        //var endCode = ViewBag.EndCode;
        //if (string.IsNullOrEmpty(endCode))
        //{
        //    Response.Redirect("/vn/Thanh-vien/DS-dang-ky-ung-cuu-su-co.aspx");
        //    return;
        //}
    }
</script>

<%
    CPUserEntity entity = ViewBag.Data as CPUserEntity ?? CPLogin.CurrentUser;
    ModDonDangKyUCSCEntity entityDk = ViewBag.Data as ModDonDangKyUCSCEntity ?? new ModDonDangKyUCSCEntity();

    List<ModHeThongThongTinEntity> currHTTT = ViewBag.HTTT as List<ModHeThongThongTinEntity> ?? new List<ModHeThongThongTinEntity>();

    string strHTTT = string.Join(",", currHTTT.Select(o => o.MenuID));
    string endCode = ViewBag.EndCode;

    List<ModNhanLucUCSCEntity> lstNhanLuc = ViewBag.NhanLuc as List<ModNhanLucUCSCEntity> ?? new List<ModNhanLucUCSCEntity>();
    int countNhanLuc = lstNhanLuc != null ? lstNhanLuc.Count : 0;

    List<WebMenuEntity> lstCapDo = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "CapDo" && o.ParentID > 0).ToList_Cache();
    int countCapDo = lstCapDo != null ? lstCapDo.Count : 0;
    int countHeThong = 0;
    List<WebMenuEntity> lstDaoTao = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "LinhVucDaoDao" && o.ParentID > 0).ToList_Cache();
    int countDaoTao = lstDaoTao != null ? lstDaoTao.Count : 0;

    List<WebMenuEntity> lstTrinhDoDaoTao = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "TrinhDoDaoTao" && o.ParentID > 0).ToList_Cache();
    int countTrinhDoDaoTao = lstTrinhDoDaoTao != null ? lstTrinhDoDaoTao.Count : 0;

    List<WebMenuEntity> lstChungChi = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "ChungChi" && o.ParentID > 0).ToList_Cache();
    int countChungChi = lstChungChi != null ? lstChungChi.Count : 0;

    List<WebMenuEntity> lstQuanLyATTT = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "QuanLyATTT" && o.ParentID > 0).ToList_Cache();
    int countQuanLyATTT = lstQuanLyATTT != null ? lstQuanLyATTT.Count : 0;

    List<WebMenuEntity> lstKyThuatPhongThu = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "KyThuatPhongThu" && o.ParentID > 0).ToList_Cache();
    int countKyThuatPhongThu = lstKyThuatPhongThu != null ? lstKyThuatPhongThu.Count : 0;

    List<WebMenuEntity> lstKyThuatBaoVe = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "KyThuatBaoVe" && o.ParentID > 0).ToList_Cache();
    int countKyThuatBaoVe = lstKyThuatBaoVe != null ? lstKyThuatBaoVe.Count : 0;

    List<WebMenuEntity> lstKyThuatKiemTra = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "KyThuatKiemTra" && o.ParentID > 0).ToList_Cache();
    int countKyThuatKiemTra = lstKyThuatKiemTra != null ? lstKyThuatKiemTra.Count : 0;

    // Danh sach tong hop theo LinhVucDaoDao
    List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucLVDT = ViewBag.ListTongHopNhanLucLVDT as List<ModTongHopNhanLucUCSCEntity> ?? ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "LinhVucDaoDao");
    // Danh sach tong hop theo TrinhDoDaoTao
    List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucTDDT = ViewBag.ListTongHopNhanLucTDDT as List<ModTongHopNhanLucUCSCEntity> ?? ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "TrinhDoDaoTao");
    // Danh sach tong hop theo ChungChi
    List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucCC = ViewBag.ListTongHopNhanLucCC as List<ModTongHopNhanLucUCSCEntity> ?? ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "ChungChi");


    // Danh sach tong hop theo nhom chuyen gia QuanLyATTT
    List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomATTT = ViewBag.ListTongHopNhanLucNhomATTT as List<ModTongHopNhanLucUCSCEntity> ?? ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "QuanLyATTT");
    // Danh sach tong hop theo nhom chuyen gia KyThuatPhongThu
    List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTPT = ViewBag.ListTongHopNhanLucNhomKTPT as List<ModTongHopNhanLucUCSCEntity> ?? ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "KyThuatPhongThu");
    // Danh sach tong hop theo nhom chuyen gia KyThuatBaoVe
    List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTBV = ViewBag.ListTongHopNhanLucNhomKTBV as List<ModTongHopNhanLucUCSCEntity> ?? ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "KyThuatBaoVe");
    // Danh sach tong hop theo nhom chuyen gia KyThuatKiemTra
    List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTKT = ViewBag.ListTongHopNhanLucNhomKTKT as List<ModTongHopNhanLucUCSCEntity> ?? ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "KyThuatKiemTra");

    int d = 0;

    int langId = ViewPage.CurrentPage.LangID;
    string dsUrl = "/vn/Thanh-vien/DS-dang-ky-ung-cuu-su-co.aspx";
    if (langId == 2)
    {
        dsUrl = "/en/Member/DS-dang-ky-ung-cuu-su-co.aspx";
    }
%>

<style>
    .textstyle1 {
        border: none !important;
        border-bottom: 1px dotted !important;
        padding: 0 !important;
        width: 70%;
    }

    .textstyle2 {
        border: none !important;
        border-bottom: 1px dotted !important;
        padding: 0 !important;
        width: 30%;
    }

    .name {
        width: 30% !important;
    }

    /*.input {
        width: 70% !important;
    }*/

    .radio_loaitaikhoan td {
        padding-right: 10px;
    }

    .radio_loaitaikhoan input {
        margin: 0 4px 0 0 !important;
    }

    .QAcustom {
        color: white !important;
        float: left;
        background: #015ab4 none repeat scroll 0 0 !important;
    }

    .hidediv {
        position: absolute;
        top: 0;
        left: 0;
        width: 100%;
        background-color: #000;
        -ms-opacity: 0.7;
        opacity: 0.7;
        display: none;
        z-index: 10000;
    }

    .wait {
        padding: 5px;
        background-color: #fff;
        width: 300px;
        border: 1px solid #333;
        position: fixed;
        display: none;
        top: 30%;
        left: 40%;
        z-index: 10001;
        text-align: center;
        line-height: 20px;
        background: #d4d4d4;
        -ms-border-radius: 6px;
        border-radius: 6px;
        -ms-opacity: 0.8;
        opacity: 0.8;
    }

    .Waiting {
        display: inline !important;
    }

    table.thanh-vien th {
        text-align: center;
    }

    table.thanh-vien th,
    table.thanh-vien td {
        border: 1px solid #000;
        border-collapse: collapse;
        text-align: center;
    }

        table.thanh-vien td input,
        table.thanh-vien td select {
            width: 90% ;
        }
</style>

<div class="row-fluid titleContainer">
    <span>ĐƠN XIN ĐĂNG KÝ THAM GIA MẠNG LƯỚI ỨNG CỨU SỰ CỐ</span>
</div>
<div class="contentNews">
    <div class="main_right">
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

                    <form method="post" enctype="multipart/form-data">
                        <div class="g-search">
                            <div class="box_content_input">
                                <div class="WordSection1">

                                    <table border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse; border: none;'>
                                        <tr>
                                            <td width="231" valign="top" style='width: 173.4pt; border: none; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p style='margin-top: 6.0pt'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                                        <o:p>&nbsp;</o:p>
                                                    </span>
                                                </p>
                                            </td>
                                            <td width="359" valign="top" style='width: 269.4pt; border: solid windowtext 1.0pt; border-left: none; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <a name="chuong_pl_3">
                                                        <b>
                                                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Mẫu số 02<br>
                                                            </span>
                                                        </b>
                                                    </a><i>
                                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Ban hành kèm theo Thông tư số 20/2017/TT-BTTT ngày 12/9/2017 của Bộ Thông tin và Truyền thông</span>
                                                    </i>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p style='margin-top: 6.0pt'></p>

                                    <p align="center" style='margin-top: 6.0pt; text-align: center'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VỆT NAM</span>
                                        </b><b>
                                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                                <br>
                                            </span>
                                        </b><b>
                                            <span lang="VI"
                                                style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Độc lập - Tự do - Hạnh phúc</span>
                                        </b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                            <br>
                                            ---------------------
                                        </span>
                                    </p>

                                    <p align="center" style='margin-top: 6.0pt; text-align: center'>
                                        <a name="chuong_pl_3_name">
                                            <b>
                                                <span lang="VI"
                                                    style='font-size: 10.0pt; font-family: "Arial",sans-serif'>ĐƠN XIN ĐĂNG KÝ THAM GIA MẠNG LƯỚI ỨNG CỨU SỰ CỐ</span>
                                            </b>
                                        </a><b>
                                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                                <br>
                                            </span>
                                        </b><i>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>(Áp dụng cho tổ chức, doanh nghiệp và cá nhân tự nguyện tham gia mạng lưới ứng cứu sự cố mạng)</span></i>
                                    </p>

                                    <p style='margin-top: 6.0pt'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>I. Thông tin chung về tổ chức</span>
                                        </b>
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>1. Tên tổ chức:</span>
                                        <input name="ToChuc_Ten" maxlength="250" id="ToChuc_Ten" class="textstyle1" type="text" value="<%=entityDk.ToChuc_Ten %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>2. Địa chỉ: </span>
                                        <input name="ToChuc_DiaChi" maxlength="250" id="ToChuc_DiaChi" class="textstyle1" type="text" value="<%=entityDk.ToChuc_DiaChi %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>3. Điện thoại:</span>
                                        <input name="ToChuc_DienThoai" maxlength="250" id="ToChuc_DienThoai" class="textstyle1" type="text" value="<%=entityDk.ToChuc_DienThoai %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>4. Fax:</span>
                                        <input name="ToChuc_Fax" maxlength="250" id="ToChuc_Fax" class="textstyle1" type="text" value="<%=entityDk.ToChuc_Fax %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>5. Email:</span>
                                        <input name="ToChuc_Email" maxlength="250" id="ToChuc_Email" class="textstyle1" type="text" value="<%=entityDk.ToChuc_Email %>" />
                                    </p>



                                    <p style='margin-top: 6.0pt'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>II. Giới thiệu về hoạt động của tổ chức</span>
                                        </b>
                                    </p>

                                    <p style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>1. Giới thiệu chung về hoạt động của tổ chức</span>
                                    </p>

                                    <p style='margin-top: 6.0pt'>
                                        <i>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>(Cung cấp cho Cơ quan điều ph ố i quốc gia các thông tin ngắn gọn giới thiệu về các lĩnh vực hoạt động của tổ chức, về năng lực ứng cứu sự cố của tổ ch ứ c như nhân sự, công ngh ệ, kinh nghiệm, đối tượng phục vụ,...)</span>
                                        </i>
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                            <textarea name="Content" rows="5" id="Content" class="textstyle1" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityDk.Content %></textarea>
                                        </span>
                                    </p>

                                    <p style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>2. Tên các hệ thống thông tin thuộc phụ trách quản lý hoặc hỗ trợ ứng cứu (cấp độ phê duyệt hoặc dự kiến tương đương):</span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                        </span>
                                    </p>

                                    <%-- ======================================= START: ITT UPDATE ======================================= --%>
                                    <table id="TblHTTT" class="thanh-vien" style="width: 100%" border="1">
                                        <thead>
                                            <tr>
                                                <th width="5%">STT</th>
                                                <th width="20%">Cấp</th>
                                                <th>Thông tin</th>
                                                <th width="5%"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%  int lnHt = 2;
                                                List<ModHeThongThongTinEntity> ht = null;
                                                if (currHTTT != null && currHTTT.Count > 0)
                                                {
                                                    ht = currHTTT;
                                                    lnHt = ht.Count;
                                                }
                                                for (int i = 0; i < lnHt; i++)
                                                {
                                                    var name = "";
                                                    if (lnHt > i && ht != null) name = ht[i].Name;
                                                    countHeThong += 1;
                                            %>
                                            <tr id="Row<%=(i+1) %>">
                                                <td><%=(i+1) %>
                                                </td>
                                                <td>
                                                    <select style="width: 100%; height: 80px" onchange="selectCapDo(this, <%=(i+1) %>)">
                                                        <%for (int j = 0; j < lstCapDo.Count; j++)
                                                            { %>
                                                        <option <%if (ht != null && ht[i].MenuID == lstCapDo[j].ID)
                                                            { %>selected<%} %>
                                                            value="<%=lstCapDo[j].ID %>"><%=lstCapDo[j].Name %></option>
                                                        <%} %>
                                                    </select>
                                                </td>
                                                <td>
                                                    <textarea id="M<%=(i+1) %>" data-m="<%=ht!=null?ht[i].MenuID:lstCapDo[0].ID %>" name="HTTT<%=(i+1) %>" class="textstyle1" rows="3" style="max-width: 90%; width: 90%; max-height: 300px;"><%=name %></textarea>
                                                </td>
                                                <td>
                                                    <a href="javascript:fnDel(<%=(i+1) %>)" data-idx="<%=(i+1) %>">Xóa</a>
                                                </td>
                                            </tr>
                                            <%} %>
                                        </tbody>
                                    </table>
                                    <br />
                                    <a href="javascript:void(0)" id="btnThem">+ Thêm</a>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>3. Thông tin về Số lượng nhân lực liên quan đến CNTT, ATTT hoặc tương đương</span></b>
                                    </p>
                                    <table class="thanh-vien" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th style="width: 4%;">TT</th>
                                                <th>Phân loại</th>
                                                <th style="width: 17%;">Số lượng (người)</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="tongHopNhanLuc boldTitle">
                                                <td>3.1</td>
                                                <td class="tongHopTitle">Số lượng cán bộ theo lĩnh vực đào tạo</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <%for (int i = 0; i < lstTongHopNhanLucLVDT.Count; i++)%>
                                            <%{ %>
                                            <tr class="tongHopNhanLuc tongHopNhanLucLVDT">
                                                <td><%= ((char) (65+i)).ToString().ToLower() %>)</td>
                                                <td class="tongHopTitle"><%=lstTongHopNhanLucLVDT[i].Name %></td>
                                                <td>
                                                    <input type="number" name="TongHopNhanLucInput" max="999999" id="" class="textstyle1 input" value="<%= lstTongHopNhanLucLVDT[i].MenuID_Value > 0 ? lstTongHopNhanLucLVDT[i].MenuID_Value.ToString() : "" %>" menu-id="<%= lstTongHopNhanLucLVDT[i].MenuID%>" autocomplete="off">
                                                </td>
                                            </tr>
                                            <%} %>

                                            <tr class="tongHopNhanLuc boldTitle">
                                                <td>3.2</td>
                                                <td class="tongHopTitle">Số lượng cán bộ phân theo trình độ đào tạo</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <%for (int i = 0; i < lstTongHopNhanLucTDDT.Count; i++)%>
                                            <%{ %>
                                            <tr class="tongHopNhanLuc tongHopNhanLucTDDT">
                                                <td><%= ((char) (65+i)).ToString().ToLower() %>)</td>
                                                <td class="tongHopTitle"><%=lstTongHopNhanLucTDDT[i].Name %></td>
                                                <td>
                                                    <input type="number" name="TongHopNhanLucInput" max="999999" id="" class="textstyle1 input" value="<%= lstTongHopNhanLucTDDT[i].MenuID_Value > 0 ? lstTongHopNhanLucTDDT[i].MenuID_Value.ToString() : "" %>" menu-id="<%= lstTongHopNhanLucTDDT[i].MenuID%>" autocomplete="off">
                                                </td>
                                            </tr>
                                            <%} %>

                                            <tr class="tongHopNhanLuc boldTitle">
                                                <td>3.3</td>
                                                <td class="tongHopTitle">Số lượng cán bộ có chứng chỉ về CNTT, ATTT hoặc tương đương</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <%for (int i = 0; i < lstTongHopNhanLucCC.Count; i++)%>
                                            <%{ %>
                                            <tr class="tongHopNhanLuc tongHopNhanLucCC">
                                                <td><%= ((char) (65+i)).ToString().ToLower() %>)</td>
                                                <td class="tongHopTitle"><%=lstTongHopNhanLucCC[i].Name %></td>
                                                <td>
                                                    <input type="number" name="TongHopNhanLucInput" max="999999" id="" class="textstyle1 input" value="<%= lstTongHopNhanLucCC[i].MenuID_Value > 0 ? lstTongHopNhanLucCC[i].MenuID_Value.ToString() : "" %>" menu-id="<%= lstTongHopNhanLucCC[i].MenuID%>" autocomplete="off">
                                                </td>
                                            </tr>
                                            <%} %>
                                        </tbody>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>4. Thông tin về Số lượng nhân lực có kinh nghiệm, được đào tạo về ATTT</span></b>
                                    </p>
                                    <table class="thanh-vien" style="width: 100%">
                                        <thead>
                                            <tr>
                                                <th style="width: 4%;">TT</th>
                                                <th>Phân loại</th>
                                                <th style="width: 17%;">Số lượng (người)</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr class="tongHopNhanLuc boldTitle">
                                                <td>4.1</td>
                                                <td class="tongHopTitle">Nhóm chuyên gia quản lý ATTT</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <%for (int i = 0; i < lstTongHopNhanLucNhomATTT.Count; i++)%>
                                            <%{ %>
                                            <tr class="tongHopNhanLuc tongHopNhanLucNhomATTT">
                                                <td><%= ((char) (65+i)).ToString().ToLower() %>)</td>
                                                <td class="tongHopTitle"><%=lstTongHopNhanLucNhomATTT[i].Name %></td>
                                                <td>
                                                    <input type="number" name="TongHopNhanLucInput" max="999999" id="" class="textstyle1 input" value="<%= lstTongHopNhanLucNhomATTT[i].MenuID_Value > 0 ? lstTongHopNhanLucNhomATTT[i].MenuID_Value.ToString() : "" %>" menu-id="<%= lstTongHopNhanLucNhomATTT[i].MenuID%>" autocomplete="off">
                                                </td>
                                            </tr>
                                            <%} %>

                                            <tr class="tongHopNhanLuc boldTitle">
                                                <td>4.2</td>
                                                <td class="tongHopTitle">Nhóm chuyên gia kỹ thuật phòng thủ, chống tấn công</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <%for (int i = 0; i < lstTongHopNhanLucNhomKTPT.Count; i++)%>
                                            <%{ %>
                                            <tr class="tongHopNhanLuc tongHopNhanLucNhomKTPT">
                                                <td><%= ((char) (65+i)).ToString().ToLower() %>)</td>
                                                <td class="tongHopTitle"><%=lstTongHopNhanLucNhomKTPT[i].Name %></td>
                                                <td>
                                                    <input type="number" name="TongHopNhanLucInput" max="999999" id="" class="textstyle1 input" value="<%= lstTongHopNhanLucNhomKTPT[i].MenuID_Value > 0 ? lstTongHopNhanLucNhomKTPT[i].MenuID_Value.ToString() : "" %>" menu-id="<%= lstTongHopNhanLucNhomKTPT[i].MenuID%>" autocomplete="off">
                                                </td>
                                            </tr>
                                            <%} %>

                                            <tr class="tongHopNhanLuc boldTitle">
                                                <td>4.3</td>
                                                <td class="tongHopTitle">Nhóm chuyên gia kỹ thuật bảo vệ an toàn hệ thống và ứng dụng</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <%for (int i = 0; i < lstTongHopNhanLucNhomKTBV.Count; i++)%>
                                            <%{ %>
                                            <tr class="tongHopNhanLuc tongHopNhanLucNhomKTBV">
                                                <td><%= ((char) (65+i)).ToString().ToLower() %>)</td>
                                                <td class="tongHopTitle"><%=lstTongHopNhanLucNhomKTBV[i].Name %></td>
                                                <td>
                                                    <input type="number" name="TongHopNhanLucInput" max="999999" id="" class="textstyle1 input" value="<%= lstTongHopNhanLucNhomKTBV[i].MenuID_Value > 0 ? lstTongHopNhanLucNhomKTBV[i].MenuID_Value.ToString() : "" %>" menu-id="<%= lstTongHopNhanLucNhomKTBV[i].MenuID%>" autocomplete="off">
                                                </td>
                                            </tr>
                                            <%} %>

                                            <tr class="tongHopNhanLuc boldTitle">
                                                <td>4.4</td>
                                                <td class="tongHopTitle">Nhóm chuyên gia kỹ thuật kiểm tra, đánh giá ATTT</td>
                                                <td>&nbsp;</td>
                                            </tr>
                                            <%for (int i = 0; i < lstTongHopNhanLucNhomKTKT.Count; i++)%>
                                            <%{ %>
                                            <tr class="tongHopNhanLuc tongHopNhanLucNhomKTKT">
                                                <td><%= ((char) (65+i)).ToString().ToLower() %>)</td>
                                                <td class="tongHopTitle"><%=lstTongHopNhanLucNhomKTKT[i].Name %></td>
                                                <td>
                                                    <input type="number" name="TongHopNhanLucInput" max="999999" id="" class="textstyle1 input" value="<%= lstTongHopNhanLucNhomKTKT[i].MenuID_Value > 0 ? lstTongHopNhanLucNhomKTKT[i].MenuID_Value.ToString() : "" %>" menu-id="<%= lstTongHopNhanLucNhomKTKT[i].MenuID%>" autocomplete="off">
                                                </td>
                                            </tr>
                                            <%} %>
                                        </tbody>
                                    </table>
                                    <%-- ======================================== END: ITT UPDATE ======================================== --%>
                                    <p style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>5. Thông tin về nhân lực, chuyên gia an toàn thông tin, công nghệ thông tin và tương đương</span>
                                    </p>

                                    <p style='margin-top: 6.0pt'>
                                        <i>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>(Cung cấp thông tin về nhân lực, an toàn thông tin, công nghệ thông tin thuộc đơn vị mình theo bảng kèm theo Biểu mẫu 01 của Thông tư này)</span>
                                        </i>
                                        <br />
                                        <%-- Tam thoi bo di upload file, khi can thi mo comment --%>
                                        <%--<p style="line-height: 0; color: #00455A;">
                                        Upload file
                                    </p>
                                    <input type="file" id="Atack" name="Atack" onchange="AlertFilesize();" />
                                    <script type="text/javascript">
                                        function AlertFilesize() {
                                            var sizeinbytes = document.getElementById('Atack').files[0].size;
                                            var kb = sizeinbytes / 1024;
                                            if (kb > 5 * 1024) {
                                                document.getElementById('Atack').value = "";
                                                alert('Kích thước file phải nhỏ hơn 5MB')
                                            }
                                        }
                                    </script>--%>
                                    </p>
                                    <table class="thanh-vien">
                                        <thead>
                                            <tr>
                                                <th>TT</th>
                                                <th>Họ và tên</th>
                                                <th>Tên trường, cơ sở đào tạo</th>
                                                <th>Chuyên ngành đào tạo, bồi dưỡng</th>
                                                <th>Văn bằng, chứng chỉ, trình độ về ATTT, CNTT hoặc tương đương</th>
                                                <th>Tháng/năm tốt nghiệp</th>
                                                <th>&nbsp;</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%for (int i = 0; i < countNhanLuc; i++)
                                                {
                                            %>
                                            <tr class="nhanLuc">
                                                <td class='nhanLucTT' style="width: 3%;"><%=i+1 %></td>
                                                <td style="width: 20%;">
                                                    <input autocomplete='off' name="Name" maxlength="250" id="" class="textstyle1 input" type="text" value="<%=lstNhanLuc[i].Name %>" /></td>
                                                <td style="width: 20%;">
                                                    <input autocomplete='off' name="School" maxlength="250" id="" class="textstyle1 input" type="text" value="<%=lstNhanLuc[i].School %>" /></td>
                                                <td style="width: 10%;"><a href="javascript: void(0)" class="btnDaoTao" data-linhvucdt="<%=lstNhanLuc[i].MenuIDs_LinhVucDT %>" data-trinhdodt="<%=lstNhanLuc[i].MenuIDs_TrinhDoDT %>" data-chungchi="<%=lstNhanLuc[i].MenuIDs_ChungChi %>">+ Chi tiết</a></td>
                                                <td style="width: 13%;"><a href="javascript: void(0)" class="btnChungChi" data-quanlyattt="<%=lstNhanLuc[i].MenuIDs_QuanLyATTT %>" data-kythuatphongthu="<%=lstNhanLuc[i].MenuIDs_KyThuatPhongThu %>" data-kythuatbaove="<%=lstNhanLuc[i].MenuIDs_KyThuatBaoVe %>" data-kythuatkiemtra="<%=lstNhanLuc[i].MenuIDs_KyThuatKiemTra %>">+ Chi tiết</a></td>
                                                <td style="width: 1%;">
                                                    <input autocomplete='off' name="NamTotNghiep" maxlength="250" id="" class="textstyle1 input" type="text" value="<%=lstNhanLuc[i].NamTotNghiep > 0 ? (lstNhanLuc[i].ThangTotNghiep + "/" + lstNhanLuc[i].NamTotNghiep) : "" %>" style="width: 60px;" /></td>
                                                <td style="width: 1%;"><a href="javascript: void(0)" class="btnRemove">Xóa</a></td>
                                            </tr>
                                            <%}
                                                d = countNhanLuc + 1; %>
                                            <tr class="nhanLuc">
                                                <td class='nhanLucTT' style="width: 3%;"><%=d %></td>
                                                <td style="width: 20%;">
                                                    <input autocomplete='off' name="Name" maxlength="250" id="" class="textstyle1 input" type="text" value="" /></td>
                                                <td style="width: 20%;">
                                                    <input autocomplete='off' name="School" maxlength="250" id="" class="textstyle1 input" type="text" value="" /></td>
                                                <td style="width: 10%;"><a href="javascript: void(0)" class="btnDaoTao">+ Chi tiết</a></td>
                                                <td style="width: 13%;"><a href="javascript: void(0)" class="btnChungChi">+ Chi tiết</a></td>
                                                <td style="width: 1%;">
                                                    <input autocomplete='off' name="NamTotNghiep" maxlength="250" id="" class="textstyle1 input" type="text" value="" style="width: 60px;" /></td>
                                                <td style="width: 1%;"><a href="javascript: void(0)" class="btnRemove">Xóa</a></td>
                                            </tr>
                                            <tr id="append"></tr>
                                            <tr>
                                                <td colspan="7" class="text-center"><a href="javascript: void(0)" id="btnAppend">+ Thêm</a></td>
                                            </tr>
                                        </tbody>
                                        <tfoot></tfoot>
                                    </table>

                                    <p style='margin-top: 6.0pt'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>6. Danh sách dải IP đăng ký (Nhập mỗi IP trên một dòng):</span>
                                    </p>
                                    <p style='margin-top: 6.0pt;'>
                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                            <textarea name="IPs" rows="5" maxlength="1000" id="IPs" class="textstyle1" style="max-width: 90%; width: 50%; max-height: 300px;"><%=entityDk.IPs %></textarea>
                                        </span>
                                    </p>

                                    <p style='margin-top: 6.0pt'>
                                        <b>
                                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>III. Thông tin trao đổi, liên lạc trong mạng lưới</span>
                                        </b>
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>1. Địa chỉ Website:
                                       
                                            <input name="ThongTinLL_Web" maxlength="250" id="ThongTinLL_Web" class="textstyle1" type="text" value="<%=entityDk.ThongTinLL_Web %>" />
                                        </span>
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>2. Địa chỉ thư điện tử của đơn vị<sup>(1)</sup>:</span>
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>PGP/GPG Public Key cho địa chỉ thư điện tử PoC của tổ chức:<sup>(2)</sup></span>
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>a) Tên (User ID):</span>
                                        <input name="ThongTinLL_ThuDT_Ten" maxlength="250" id="ThongTinLL_ThuDT_Ten" class="textstyle1" type="text" value="<%=entityDk.ThongTinLL_ThuDT_Ten %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>b) Fingerprint:
                                   
                                            <input name="ThongTinLL_ThuDT_Fingerprint" maxlength="250" id="ThongTinLL_ThuDT_Fingerprint" class="textstyle1" type="text" value="<%=entityDk.ThongTinLL_ThuDT_Fingerprint %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>c) Liên kết đến Public key của tổ chức<sup>(3)</sup>:</span>
                                        <input name="ThongTinLL_ThuDT_LinkToPublicKey" maxlength="250" id="ThongTinLL_ThuDT_LinkToPublicKey" class="textstyle1" type="text" value="<%=entityDk.ThongTinLL_ThuDT_LinkToPublicKey %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt'>
                                        <i>
                                            <sup>
                                                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>(1)</span>
                                            </sup>
                                        </i><i>
                                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif'></span>
                                        </i><i>
                                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Địa chỉ thư điện tử được sử dụng làm đầu mối trao đổi thông tin với Mạng lưới ứng cứu sự cố khuyến nghị không nên sử dụng địa chỉ thư điện tử cá nhân, nên sử dụng tên đại diện cho tổ chức.</span>
                                        </i>
                                    </p>

                                    <p style='margin-top: 6.0pt'>
                                        <i>
                                            <sup>
                                                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>(2)</span>
                                            </sup>
                                        </i><i>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Nếu tổ chức chưa có thì có thể bỏ trống hoặc yêu cầu VNCERT hướng dẫn tạo.</span>
                                        </i>
                                    </p>

                                    <p style='margin-top: 6.0pt'>
                                        <i>
                                            <sup>
                                                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>(3)</span>
                                            </sup>
                                        </i><i>
                                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                        </i><i>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Tổ chức có thể gửi Public Key về VNCERT qua thư điện tử (csirts@vncert.vn)</span>
                                        </i>
                                    </p>

                                    <p style='margin-top: 6.0pt'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>3. Đầu mối liên lạc trong giờ làm việc</span>
                                        </b>
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>a) Tên bộ phận/người giải quyết:</span>
                                        <input name="DauMoiLL_TrongGio_Ten" maxlength="250" id="DauMoiLL_TrongGio_Ten" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_TrongGio_Ten %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>b) Điện thoại cố định:</span>
                                        <input name="DauMoiLL_TrongGio_DienThoai" maxlength="250" id="DauMoiLL_TrongGio_DienThoai" class="textstyle2" type="text" value="<%=entityDk.DauMoiLL_TrongGio_DienThoai %>" />
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>c) Điện thoại di động:</span>
                                        <input name="DauMoiLL_TrongGio_DienThoaiDD" maxlength="250" id="DauMoiLL_TrongGio_DienThoaiDD" class="textstyle2" type="text" value="<%=entityDk.DauMoiLL_TrongGio_DienThoaiDD %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>d) Số Fax:</span>
                                        <input name="DauMoiLL_TrongGio_Fax" maxlength="250" id="DauMoiLL_TrongGio_Fax" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_TrongGio_Fax %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>4. Đầu mối liên lạc ngoài giờ làm việc</span>
                                        </b>
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>a) Tên bộ phận/người giải quyết:</span>
                                        <input name="DauMoiLL_NgoaiGio_Ten" maxlength="250" id="DauMoiLL_NgoaiGio_Ten" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_NgoaiGio_Ten %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>b) Điện thoại cố định:</span>
                                        <input name="DauMoiLL_NgoaiGio_DienThoai" maxlength="250" id="DauMoiLL_NgoaiGio_DienThoai" class="textstyle2" type="text" value="<%=entityDk.DauMoiLL_NgoaiGio_DienThoai %>" />
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>c) Điện thoại di động:</span>
                                        <input name="DauMoiLL_NgoaiGio_DienThoaiDD" maxlength="250" id="DauMoiLL_NgoaiGio_DienThoaiDD" class="textstyle2" type="text" value="<%=entityDk.DauMoiLL_NgoaiGio_DienThoaiDD %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>d) Số Fax:</span>
                                        <input name="DauMoiLL_NgoaiGio_Fax" maxlength="250" id="DauMoiLL_NgoaiGio_Fax" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_NgoaiGio_Fax %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>5. Đầu mối lãnh đạo phụ trách về an toàn thông tin của tổ chức <i><sup>(4)</sup></i></span>
                                        </b>
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>a) Tên bộ phận/người giải quyết:</span>
                                        <input name="DauMoiLanhDao_Ten" maxlength="250" id="DauMoiLanhDao_Ten" class="textstyle1" type="text" value="<%=entityDk.DauMoiLanhDao_Ten %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>b) Điện thoại cố định:</span>
                                        <input name="DauMoiLanhDao_DienThoai" maxlength="250" id="DauMoiLanhDao_DienThoai" class="textstyle1" type="text" value="<%=entityDk.DauMoiLanhDao_DienThoai %>" />
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>c) Điện thoại di động:</span>
                                        <input name="DauMoiLanhDao_DienThoaiDD" maxlength="250" id="DauMoiLanhDao_DienThoaiDD" class="textstyle1" type="text" value="<%=entityDk.DauMoiLanhDao_DienThoaiDD %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt'>
                                        <i>
                                            <sup>
                                                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>(4)</span>
                                            </sup>
                                        </i>
                                        <i>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Đầu mối Lãnh đạo phụ trách về an toàn thông tin của tổ chức sẽ chỉ được sử dụng khi không liên lạc được với các đầu mối khác hoặc trong các tình huống sự cố có tính chất nghiêm trọng</span>
                                        </i>
                                    </p>

                                    <p style='margin-top: 6.0pt'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>6. Địa chỉ nhận thư và công văn qua đường bưu điện:</span>
                                        </b>
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>a) Tên bộ phận/người nhận:</span>
                                        <input name="DCNhanThu_TenBoPhan" maxlength="250" id="DCNhanThu_TenBoPhan" class="textstyle1" type="text" value="<%=entityDk.DCNhanThu_TenBoPhan %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>b) Vị trí, chức vụ:</span>
                                        <input name="DCNhanThu_ViTri" maxlength="250" id="DCNhanThu_ViTri" class="textstyle1" type="text" value="<%=entityDk.DCNhanThu_ViTri %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>c) Tên tổ chức:</span>
                                        <input name="DCNhanThu_TenToChuc" maxlength="250" id="DCNhanThu_TenToChuc" class="textstyle1" type="text" value="<%=entityDk.DCNhanThu_TenToChuc %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>d) Địa chỉ liên hệ:</span>
                                        <input name="DCNhanThu_DiaChi" maxlength="250" id="DCNhanThu_DiaChi" class="textstyle1" type="text" value="<%=entityDk.DCNhanThu_DiaChi %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>đ) Điện thoại:</span>
                                        <input name="DCNhanThu_DienThoai" maxlength="250" id="DCNhanThu_DienThoai" class="textstyle1" type="text" value="<%=entityDk.DCNhanThu_DienThoai %>" />
                                    </p>

                                    <p style='margin-top: 6.0pt'>
                                        <b>
                                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>7. Phương tiện liên lạc khác</span>
                                        </b>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'><i><sup>(5)</sup></i></span>
                                    </p>

                                    <table border="0" cellspacing="0" cellpadding="0"
                                        style='border-collapse: collapse;'>
                                        <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
                                            <td width="605" colspan="2" valign="bottom" style='width: 454.05pt; border: solid windowtext 1.0pt; border-bottom: none; background: white; padding: 0in 0in 0in 0in'>
                                                <p align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Cách thức liên lạc khác qua hệ thống nhắn tin tức thời</span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr style='mso-yfti-irow: 1'>
                                            <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; background: white; padding: 0in 0in 0in 0in'>
                                                <p style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>a) Yahoo ID:</span>
                                                </p>
                                            </td>
                                            <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; background: white; padding: 0in 0in 0in 0in'>
                                                <p style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                                                        <input name="LLKhac_Yahoo" maxlength="250" id="LLKhac_Yahoo" class="textstyle1" type="text" value="<%=entityDk.LLKhac_Yahoo %>" />
                                                    </span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr style='mso-yfti-irow: 2'>
                                            <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; background: white; padding: 0in 0in 0in 0in'>
                                                <p style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>b) Skype:</span>
                                                </p>
                                            </td>
                                            <td width="398" valign="top" style="width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; background: white; padding: 0in 0in 0in 0in">
                                                <p style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                                                        <input name="LLKhac_Skype" maxlength="250" id="LLKhac_Skype" class="textstyle1" type="text" value="<%=entityDk.LLKhac_Skype %>" />
                                                    </span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr style='mso-yfti-irow: 3'>
                                            <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; background: white; padding: 0in 0in 0in 0in'>
                                                <p style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>c) Google Talk:</span>
                                                </p>
                                            </td>
                                            <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; background: white; padding: 0in 0in 0in 0in'>
                                                <p style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                                                        <input name="LLKhac_GoogleTalk" maxlength="250" id="LLKhac_GoogleTalk" class="textstyle1" type="text" value="<%=entityDk.LLKhac_GoogleTalk %>" />
                                                    </span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr style='mso-yfti-irow: 4'>
                                            <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; background: white; padding: 0in 0in 0in 0in'>
                                                <p style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>d) Hotmail:</span>
                                                </p>
                                            </td>
                                            <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; background: white; padding: 0in 0in 0in 0in'>
                                                <p style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                                                        <input name="LLKhac_Hotmail" maxlength="250" id="LLKhac_Hotmail" class="textstyle1" type="text" value="<%=entityDk.LLKhac_Hotmail %>" />
                                                    </span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr style='mso-yfti-irow: 5'>
                                            <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; background: white; padding: 0in 0in 0in 0in'>
                                                <p style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>đ) Khác:</span>
                                                </p>
                                            </td>
                                            <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; background: white; padding: 0in 0in 0in 0in'>
                                                <p style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                                                        <input name="LLKhac_Khac" maxlength="250" id="LLKhac_Khac" class="textstyle1" type="text" value="<%=entityDk.LLKhac_Khac %>" />
                                                    </span>
                                                </p>
                                            </td>
                                        </tr>
                                        <tr style='mso-yfti-irow: 6; mso-yfti-lastrow: yes'>
                                            <td width="605" colspan="2" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                                <p style='margin-top: 6.0pt'>
                                                    <i>
                                                        <sup>
                                                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>(5)</span>
                                                        </sup>
                                                    </i><span style="font-size: 10.0pt; font-family: 'Arial','sans-serif';">
                                                        <i style="mso-bidi-font-style: normal">
                                                            <span lang="VI">Thông tin không bắt buộc </span>
                                                        </i>
                                                    </span>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p style='margin-top: 6.0pt'>
                                        <b>
                                            <i>
                                                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Chúng tôi cam kết tuân thủ các trách nhiệm, quyền hạn của thành viên mạng lưới, các quy định về hoạt động điều phối ứng cứu sự cố theo quy định pháp luật và hướng dẫn của Cơ quan điều phối quốc gia ban hành.</span>
                                            </i>
                                        </b><b>
                                            <i>
                                                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                            </i>
                                        </b>
                                    </p>

                                    <p style='margin-top: 6.0pt'>
                                        <b>
                                            <i>
                                                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                            </i>
                                        </b>
                                    </p>

                                    <table border="0" cellspacing="0" cellpadding="0"
                                        style='border-collapse: collapse; mso-padding-alt: 0in 5.4pt 0in 5.4pt'>
                                        <tr>
                                            <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                                </p>
                                            </td>
                                            <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <i>
                                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>….., ngày …. tháng …. năm 20……<br>
                                                        </span>
                                                    </i><b>
                                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>NGƯỜI ĐẠI DIỆN THEO PHÁP LUẬT<br>
                                                        </span>
                                                    </b><i>
                                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>(Ký tên và đóng dấu)</span>
                                                    </i><b>
                                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                                    </b>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p>
                                        <span lang="VI"></span>
                                    </p>

                                </div>

                                <div class="button">
                                    <input type="hidden" name="endCode" value="<%=endCode %>" />
                                    <%if (!string.IsNullOrEmpty(endCode))
                                        {%>
                                    <%if (entityDk != null & entityDk.Activity == false)
                                        {%>
                                    <input class="btn btn-success" name="_hl_action[UpdateDangKyUCSC]" value="{RS:Form_CapNhatBtn}" type="submit" onclick="fnSubmit()" />
                                    <%} %>
                                    <%}
                                        else
                                        {%>
                                    <input class="btn btn-success" name="_hl_action[AddDangKyUCSC]" value="{RS:Form_LuuBtn}" type="submit" onclick="fnSubmit()" />
                                    <%}%>

                                    <input class="btn btn-danger" style="margin-left: 10px;" onclick="location.href = '<%=dsUrl%>';" type="button" name="" value="{RS:Form_DSDangKyBtn}" />
                                </div>

                            </div>
                        </div>
                        <input type="hidden" name="M" value="" id="M" />
                        <input type="hidden" name="NhanLuc" value="" id="NhanLuc" />
                        <input type="hidden" name="TongHopNhanLucLVDT" value="" id="TongHopNhanLucLVDT" />
                        <input type="hidden" name="TongHopNhanLucTDDT" value="" id="TongHopNhanLucTDDT" />
                        <input type="hidden" name="TongHopNhanLucCC" value="" id="TongHopNhanLucCC" />
                        <input type="hidden" name="TongHopNhanLucNhomATTT" value="" id="TongHopNhanLucNhomATTT" />
                        <input type="hidden" name="TongHopNhanLucNhomKTPT" value="" id="TongHopNhanLucNhomKTPT" />
                        <input type="hidden" name="TongHopNhanLucNhomKTBV" value="" id="TongHopNhanLucNhomKTBV" />
                        <input type="hidden" name="TongHopNhanLucNhomKTKT" value="" id="TongHopNhanLucNhomKTKT" />
                    </form>
                </div>
                <!--.Main_container-->

            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<style type="text/css">
    .my-modal {
        display: none; /* Hidden by default */
        position: fixed; /* Stay in place */
        z-index: 1; /* Sit on top */
        left: 0;
        top: 0;
        width: 100%; /* Full width */
        height: 100%; /* Full height */
        overflow: auto; /* Enable scroll if needed */
        background-color: rgb(0,0,0); /* Fallback color */
        background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
    }

    /* Modal Content/Box */
    .modal-content {
        background-color: #fefefe;
        margin: 15% auto; /* 15% from the top and centered */
        padding: 20px;
        border: 1px solid #888;
        width: 80%; /* Could be more or less, depending on screen size */
    }

    /* The Close Button */
    .close {
        color: #aaa;
        float: right;
        font-size: 28px;
        font-weight: bold;
    }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
</style>

<div id="DaoTaoModal" class="my-modal">

    <!-- Modal content -->
    <div class="modal-content">
        <span class="close">&times;</span>
        <table class="thanh-vien">
            <thead>
                <tr>
                    <th>TT</th>
                    <th>Phân loại</th>
                    <th>&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <tr style="text-align: left; font-weight: bold;">
                    <td style="width: 3%;">I</td>
                    <td style="width: 20%;">Lĩnh vực đào tạo</td>
                    <td style="width: 20%;">&nbsp;</td>
                </tr>
                <%for (int i = 0; i < countDaoTao; i++)
                    {%>
                <tr style="text-align: left !important;">
                    <td style="width: 3%;"><%=i+1 %></td>
                    <td style="width: 20%;"><%=lstDaoTao[i].Name %></td>
                    <td style="width: 20%;">
                        <input type="checkbox" name="" id="DT<%=lstDaoTao[i].ID %>" class="arrDaoTao" value="<%=lstDaoTao[i].ID %>" /></td>
                </tr>
                <%} %>

                <tr style="text-align: left; font-weight: bold;">
                    <td style="width: 3%;">II</td>
                    <td style="width: 20%;">Trình độ đào tạo</td>
                    <td style="width: 20%;">&nbsp;</td>
                </tr>
                <%for (int i = 0; i < countTrinhDoDaoTao; i++)
                    {%>
                <tr style="text-align: left !important;">
                    <td style="width: 3%;"><%=i+1 %></td>
                    <td style="width: 20%;"><%=lstTrinhDoDaoTao[i].Name %></td>
                    <td style="width: 20%;">
                        <input type="checkbox" name="" id="DT<%=lstTrinhDoDaoTao[i].ID %>" class="arrTrinhDoDaoTao" value="<%=lstTrinhDoDaoTao[i].ID %>" /></td>
                </tr>
                <%} %>

                <tr style="text-align: left; font-weight: bold;">
                    <td style="width: 3%;">III</td>
                    <td style="width: 20%;">Chứng chỉ về CNTT, ATTT hoặc tương đương</td>
                    <td style="width: 20%;">&nbsp;</td>
                </tr>
                <%for (int i = 0; i < countChungChi; i++)
                    {%>
                <tr style="text-align: left !important;">
                    <td style="width: 3%;"><%=i+1 %></td>
                    <td style="width: 20%;"><%=lstChungChi[i].Name %></td>
                    <td style="width: 20%;">
                        <input type="checkbox" name="" id="DT<%=lstChungChi[i].ID %>" class="arrChungChi" value="<%=lstChungChi[i].ID %>" /></td>
                </tr>
                <%} %>
            </tbody>
            <tfoot></tfoot>
        </table>

        <%--<a href="javascript: void(0)" id="btnAddDaoTao">Lưu lại</a>--%>
    </div>

</div>

<div id="KinhNghiemDaoTaoModal" class="my-modal">

    <!-- Modal content -->
    <div class="modal-content">
        <span class="close">&times;</span>
        <table class="thanh-vien">
            <thead>
                <tr>
                    <th>TT</th>
                    <th>Phân loại</th>
                    <th>&nbsp;</th>
                </tr>
            </thead>
            <tbody>
                <tr style="text-align: left; font-weight: bold;">
                    <td style="width: 3%;">I</td>
                    <td style="width: 20%;">Chuyên gia quản lý ATTT</td>
                    <td style="width: 20%;">&nbsp;</td>
                </tr>
                <%for (int i = 0; i < countQuanLyATTT; i++)
                    {%>
                <tr style="text-align: left !important;">
                    <td style="width: 3%;"><%=i+1 %></td>
                    <td style="width: 20%;"><%=lstQuanLyATTT[i].Name %></td>
                    <td style="width: 20%;">
                        <input type="checkbox" name="" id="KN<%=lstQuanLyATTT[i].ID %>" class="arrQuanLyATTT" value="<%=lstQuanLyATTT[i].ID %>" /></td>
                </tr>
                <%} %>

                <tr style="text-align: left; font-weight: bold;">
                    <td style="width: 3%;">II</td>
                    <td style="width: 20%;">Chuyên gia kỹ thuật phòng thủ, chống tấn công</td>
                    <td style="width: 20%;">&nbsp;</td>
                </tr>
                <%for (int i = 0; i < countKyThuatPhongThu; i++)
                    {%>
                <tr style="text-align: left !important;">
                    <td style="width: 3%;"><%=i+1 %></td>
                    <td style="width: 20%;"><%=lstKyThuatPhongThu[i].Name %></td>
                    <td style="width: 20%;">
                        <input type="checkbox" name="" id="KN<%=lstKyThuatPhongThu[i].ID %>" class="arrKyThuatPhongThu" value="<%=lstKyThuatPhongThu[i].ID %>" /></td>
                </tr>
                <%} %>

                <tr style="text-align: left; font-weight: bold;">
                    <td style="width: 3%;">III</td>
                    <td style="width: 20%;">Chuyên gia kỹ thuật bảo vệ an toàn hệ thống và ứng dụng</td>
                    <td style="width: 20%;">&nbsp;</td>
                </tr>
                <%for (int i = 0; i < countKyThuatBaoVe; i++)
                    {%>
                <tr style="text-align: left !important;">
                    <td style="width: 3%;"><%=i+1 %></td>
                    <td style="width: 20%;"><%=lstKyThuatBaoVe[i].Name %></td>
                    <td style="width: 20%;">
                        <input type="checkbox" name="" id="KN<%=lstKyThuatBaoVe[i].ID %>" class="arrKyThuatBaoVe" value="<%=lstKyThuatBaoVe[i].ID %>" /></td>
                </tr>
                <%} %>

                <tr style="text-align: left; font-weight: bold;">
                    <td style="width: 3%;">IV</td>
                    <td style="width: 20%;">Chuyên gia kỹ thuật kiểm tra, đánh giá ATTT</td>
                    <td style="width: 20%;">&nbsp;</td>
                </tr>
                <%for (int i = 0; i < countKyThuatKiemTra; i++)
                    {%>
                <tr style="text-align: left !important;">
                    <td style="width: 3%;"><%=i+1 %></td>
                    <td style="width: 20%;"><%=lstKyThuatKiemTra[i].Name %></td>
                    <td style="width: 20%;">
                        <input type="checkbox" name="" id="KN<%=lstKyThuatKiemTra[i].ID %>" class="arrKyThuatKiemTra" value="<%=lstKyThuatKiemTra[i].ID %>" /></td>
                </tr>
                <%} %>
            </tbody>
            <tfoot></tfoot>
        </table>
    </div>

</div>
<script>
    $(document).ready(function () {
        // Bien luu element hien tai
        var currentElement,
            currLinhVucDT, currTrinhDoDT, currChungChi,
            currQuanLyATTT, currKyThuatPhongThu, currKyThuatKiemTra, currKyThuatBaoVe;

        // Get the modal
        var modal = document.getElementById('DaoTaoModal');
        var modal2 = document.getElementById('KinhNghiemDaoTaoModal');

        //// Get the button that opens the modal
        //var btn = document.getElementById("btnDaoTao");
        //var btn2 = document.getElementById("btnChungChi");

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];
        var span2 = document.getElementsByClassName("close")[1];

        //// When the user clicks on the button, open the modal
        //btn.onclick = function () {
        //    modal.style.display = "block";
        //}
        //btn2.onclick = function () {
        //    modal2.style.display = "block";
        //}
        $('.btnDaoTao').click(function () {
            currentElement = this;
            modal.style.display = "block";
            $('#DaoTaoModal input[type=checkbox]').prop('checked', false);

            // Linh vuc dao tao
            currLinhVucDT = $(currentElement).attr('data-linhvucdt');
            if (currLinhVucDT) {
                var tmp = currLinhVucDT.split(',');
                for (var i = 0; i < tmp.length; i++) {
                    $('#DT' + tmp[i]).prop('checked', true);
                }
            }

            // Trinh do dao tao
            currTrinhDoDT = $(currentElement).attr('data-trinhdodt');
            if (currTrinhDoDT) {
                var tmp = currTrinhDoDT.split(',');
                for (var i = 0; i < tmp.length; i++) {
                    $('#DT' + tmp[i]).prop('checked', true);
                }
            }

            // Chung chi
            currChungChi = $(currentElement).attr('data-chungchi');
            if (currChungChi) {
                var tmp = currChungChi.split(',');
                for (var i = 0; i < tmp.length; i++) {
                    $('#DT' + tmp[i]).prop('checked', true);
                }
            }
        });
        $('.btnChungChi').click(function () {
            currentElement = this;
            modal2.style.display = "block";
            $('#KinhNghiemDaoTaoModal input[type=checkbox]').prop('checked', false);

            // Quan ly ATTT
            currQuanLyATTT = $(currentElement).attr('data-quanlyattt');
            if (currQuanLyATTT) {
                var tmp = currQuanLyATTT.split(',');
                for (var i = 0; i < tmp.length; i++) {
                    $('#KN' + tmp[i]).prop('checked', true);
                }
            }

            // Ky thuat phong thu
            currKyThuatPhongThu = $(currentElement).attr('data-kythuatphongthu');
            if (currKyThuatPhongThu) {
                var tmp = currKyThuatPhongThu.split(',');
                for (var i = 0; i < tmp.length; i++) {
                    $('#KN' + tmp[i]).prop('checked', true);
                }
            }

            // Ky thuat kiem tra
            currKyThuatKiemTra = $(currentElement).attr('data-kythuatkiemtra');
            if (currKyThuatKiemTra) {
                var tmp = currKyThuatKiemTra.split(',');
                for (var i = 0; i < tmp.length; i++) {
                    $('#KN' + tmp[i]).prop('checked', true);
                }
            }

            // Ky thuat bao ve
            currKyThuatBaoVe = $(currentElement).attr('data-kythuatbaove');
            if (currKyThuatBaoVe) {
                var tmp = currKyThuatBaoVe.split(',');
                for (var i = 0; i < tmp.length; i++) {
                    $('#KN' + tmp[i]).prop('checked', true);
                }
            }
        });

        // When the user clicks on <span> (x), close the modal
        function fnSpanOnclick() {
            modal.style.display = "none";
            //var arrDaoTao = $('.arrDaoTao').is(':checked');
            $(currentElement).attr("data-linhvucdt", getValues('.arrDaoTao'));
            $(currentElement).attr("data-trinhdodt", getValues('.arrTrinhDoDaoTao'));
            $(currentElement).attr("data-chungchi", getValues('.arrChungChi'));
        };
        span.onclick = fnSpanOnclick;

        span2.onclick = function () {
            modal2.style.display = "none";
            $(currentElement).attr("data-quanlyattt", getValues('.arrQuanLyATTT'));
            $(currentElement).attr("data-kythuatphongthu", getValues('.arrKyThuatPhongThu'));
            $(currentElement).attr("data-kythuatbaove", getValues('.arrKyThuatBaoVe'));
            $(currentElement).attr("data-kythuatkiemtra", getValues('.arrKyThuatKiemTra'));
        }

        // When the user clicks anywhere outside of the modal, close it
        window.onclick = function (event) {
            if (event.target == modal) {
                modal.style.display = "none";
                $(currentElement).attr("data-linhvucdt", getValues('.arrDaoTao'));
                $(currentElement).attr("data-trinhdodt", getValues('.arrTrinhDoDaoTao'));
                $(currentElement).attr("data-chungchi", getValues('.arrChungChi'));
            }
            if (event.target == modal2) {
                modal2.style.display = "none";
                $(currentElement).attr("data-quanlyattt", getValues('.arrQuanLyATTT'));
                $(currentElement).attr("data-kythuatphongthu", getValues('.arrKyThuatPhongThu'));
                $(currentElement).attr("data-kythuatbaove", getValues('.arrKyThuatBaoVe'));
                $(currentElement).attr("data-kythuatkiemtra", getValues('.arrKyThuatKiemTra'));
            }
        }

        function getValues(e) {
            var values = $(e).map(function () {
                if ($(this).is(':checked'))
                    return $(this).val();
            }).toArray().join(',');
            return values;
        }

        //var d = 1;
        var d = <%=d%>;
        $('#btnAppend').click(function () {
            d++;
            var rnd = Math.floor(Math.random() * 999999);
            var html = "<tr class='nhanLuc'>";
            html += "<td class='nhanLucTT' style='width: 3%;'>" + d + "</td>";
            html += "<td style='width: 20%;'>";
            html += "<input autocomplete='off' name='Name' maxlength='255' id='' class='textstyle1 input' type='text' value='' /></td>";
            html += "<td style='width: 20%;'>";
            html += "<input autocomplete='off' name='School' maxlength='255' id='' class='textstyle1 input' type='text' value='' /></td>";
            html += "<td style='width: 10%;'><a href='javascript: void(0)' class='btnDaoTao dt" + rnd + "'>+ Chi tiết</a></td>";
            html += "<td style='width: 13%;'><a href='javascript: void(0)' class='btnChungChi cc" + rnd + "'>+ Chi tiết</a></td>";
            html += "<td style='width: 1%;'>";
            html += "<input autocomplete='off' name='NamTotNghiep' maxlength='255' id='' class='textstyle1 input' type='text' value='' style='width: 60px;' /></td>";
            html += "<td style='width: 1%;'><a href='javascript: void(0)' class='btnRemove" + rnd + "'>Xóa</a></td>";
            html += "</tr>";
            $('#append').before(html);

            $('.dt' + rnd).click(function () {
                currentElement = this;
                modal.style.display = "block";
                $('#DaoTaoModal input[type=checkbox]').prop('checked', false);

                // Linh vuc dao tao
                currLinhVucDT = $(currentElement).attr('data-linhvucdt');
                if (currLinhVucDT) {
                    var tmp = currLinhVucDT.split(',');
                    for (var i = 0; i < tmp.length; i++) {
                        $('#DT' + tmp[i]).prop('checked', true);
                    }
                }

                // Trinh do dao tao
                currTrinhDoDT = $(currentElement).attr('data-trinhdodt');
                if (currTrinhDoDT) {
                    var tmp = currTrinhDoDT.split(',');
                    for (var i = 0; i < tmp.length; i++) {
                        $('#DT' + tmp[i]).prop('checked', true);
                    }
                }

                // Chung chi
                currChungChi = $(currentElement).attr('data-chungchi');
                if (currChungChi) {
                    var tmp = currChungChi.split(',');
                    for (var i = 0; i < tmp.length; i++) {
                        $('#DT' + tmp[i]).prop('checked', true);
                    }
                }
            });
            $('.cc' + rnd).click(function () {
                currentElement = this;
                modal2.style.display = "block";
                $('#KinhNghiemDaoTaoModal input[type=checkbox]').prop('checked', false);

                // Quan ly ATTT
                currQuanLyATTT = $(currentElement).attr('data-quanlyattt');
                if (currQuanLyATTT) {
                    var tmp = currQuanLyATTT.split(',');
                    for (var i = 0; i < tmp.length; i++) {
                        $('#KN' + tmp[i]).prop('checked', true);
                    }
                }

                // Ky thuat phong thu
                currKyThuatPhongThu = $(currentElement).attr('data-kythuatphongthu');
                if (currKyThuatPhongThu) {
                    var tmp = currKyThuatPhongThu.split(',');
                    for (var i = 0; i < tmp.length; i++) {
                        $('#KN' + tmp[i]).prop('checked', true);
                    }
                }

                // Ky thuat kiem tra
                currKyThuatKiemTra = $(currentElement).attr('data-kythuatkiemtra');
                if (currKyThuatKiemTra) {
                    var tmp = currKyThuatKiemTra.split(',');
                    for (var i = 0; i < tmp.length; i++) {
                        $('#KN' + tmp[i]).prop('checked', true);
                    }
                }

                // Ky thuat bao ve
                currKyThuatBaoVe = $(currentElement).attr('data-kythuatbaove');
                if (currKyThuatBaoVe) {
                    var tmp = currKyThuatBaoVe.split(',');
                    for (var i = 0; i < tmp.length; i++) {
                        $('#KN' + tmp[i]).prop('checked', true);
                    }
                }
            });
            $('.btnRemove' + rnd).click(function () {
                $(this).parent().parent().remove();
                d--;

                var elementNhanLucTT = $('.nhanLucTT');
                for (var i = 0; i < d; i++) {
                    $(elementNhanLucTT[i]).html(i + 1);
                }
            });
        });

        $('.btnRemove').click(function () {
            $(this).parent().parent().remove();
            d--;

            var elementNhanLucTT = $('.nhanLucTT');
            for (var i = 0; i < d; i++) {
                $(elementNhanLucTT[i]).html(i + 1);
            }
        });

        // Onchange checkbox gov
        $('.IsGOV').change(function (x) {
            if ($(this).is(':checked')) $(this).val(1);
            else $(this).val(0);
        })
    });
</script>
<!-- End Modal -->

<script>
    function selectCapDo(obj, ind) {
        $("#M" + ind).attr('data-m', $(obj)[0].value);
    }

    var indexM = <%=countHeThong%> + 1;
    var lstId = [];
    for (var j = 0; j < <%=countHeThong%>; j++) {
        lstId.push(j + 1);
    }

    $('#btnThem').click(function () {
        $("#TblHTTT tbody").append('<tr id="Row' + indexM + '">' +
            '<td>' + indexM +
            '</td>' +
            '<td>' +
            ' <select style="width: 100%; height: 80px" onchange="selectCapDo(this, ' + indexM + ')">' +
            <%for (int j = 0; j < lstCapDo.Count; j++)%>
            <%{ %>
            '<option value="<%=lstCapDo[j].ID %>"><%=lstCapDo[j].Name %></option>' +
            <%} %>
            '</select>' +
            '</td>' +
            '<td>' +
            '<textarea id="M' + indexM + '" data-m="<%=lstCapDo[0].ID %>" name="HTTT' + indexM + '" class="textstyle1" rows="3" style="max-width: 90%; width: 90%; max-height: 300px;"></textarea>' +
            '</td>' +
            '<td>' +
            '<a href="javascript:fnDel(' + indexM + ')" data-idx="' + indexM + '">Xóa</a>' +
            '</td>' +
            '</tr>');
        lstId.push(indexM);
        indexM++;
    });

    function fnDel(r) {
        $('#Row' + r).remove();
        lstId.splice(lstId.indexOf(r), 1);
    }

    function fnSubmit() {
        var s = '';
        for (var i = 0; i < lstId.length; i++) {
            var m = $('#M' + lstId[i]).attr('data-m');
            s += m + '_';
            s += $('#M' + lstId[i]).val() + '|';
        }
        $('#M').val(s.substr(0, s.length - 1));

        var nhanLucs = '';
        var elementNhanLuc = $('.nhanLuc');
        //console.log(elementNhanLuc);
        for (var i = 0; i < elementNhanLuc.length; i++) {
            var nhanLuc = '';
            var name = $(elementNhanLuc[i]).find('input[name=Name]').val();
            var school = $(elementNhanLuc[i]).find('input[name=School]').val();
            var linhvucdt = $(elementNhanLuc[i]).find('a[class*="btnDaoTao"]').attr('data-linhvucdt');
            var trinhdodt = $(elementNhanLuc[i]).find('a[class*="btnDaoTao"]').attr('data-trinhdodt');
            var chungchi = $(elementNhanLuc[i]).find('a[class*="btnDaoTao"]').attr('data-chungchi');
            var quanlyattt = $(elementNhanLuc[i]).find('a[class*="btnChungChi"]').attr('data-quanlyattt');
            var kythuatphongthu = $(elementNhanLuc[i]).find('a[class*="btnChungChi"]').attr('data-kythuatphongthu');
            var kythuatbaove = $(elementNhanLuc[i]).find('a[class*="btnChungChi"]').attr('data-kythuatbaove');
            var kythuatkiemtra = $(elementNhanLuc[i]).find('a[class*="btnChungChi"]').attr('data-kythuatkiemtra');
            var namTN = $(elementNhanLuc[i]).find('input[name=NamTotNghiep]').val();

            if (name) {
                if (!school) school = '';
                if (!linhvucdt) linhvucdt = '';
                if (!trinhdodt) trinhdodt = '';
                if (!chungchi) chungchi = '';
                if (!quanlyattt) quanlyattt = '';
                if (!kythuatphongthu) kythuatphongthu = '';
                if (!kythuatbaove) kythuatbaove = '';
                if (!kythuatkiemtra) kythuatkiemtra = '';
                nhanLuc = name + '_' + school + '_' + linhvucdt + '_' + trinhdodt + '_' + chungchi + '_' + quanlyattt + '_' + kythuatphongthu + '_' + kythuatbaove + '_' + kythuatkiemtra + '_' + namTN;
                nhanLucs += nhanLuc + '|';
            }
        }
        //console.log(nhanLucs);
        $('#NhanLuc').val(nhanLucs);

        /* ===================================================== */
        /* ===================================================== */
        var arrTongHopNhanLuc = [];
        var elementTongHopNhanLucLVDT = $('.tongHopNhanLucLVDT');
        for (var i = 0; i < elementTongHopNhanLucLVDT.length; i++) {
            var tongHopNhanLuc = '';
            var menuId = $(elementTongHopNhanLucLVDT[i]).find('input[name=TongHopNhanLucInput]').attr("menu-id");
            var menuId_Value = $(elementTongHopNhanLucLVDT[i]).find('input[name=TongHopNhanLucInput]').val();

            if (menuId_Value) {
                arrTongHopNhanLuc.push(menuId + '_' + menuId_Value);
            } else {
                arrTongHopNhanLuc.push(menuId + '_0');
            }
        }
        $('#TongHopNhanLucLVDT').val(arrTongHopNhanLuc.join("|"));

        arrTongHopNhanLuc = [];
        elementTongHopNhanLucTDDT = $('.tongHopNhanLucTDDT');
        for (var i = 0; i < elementTongHopNhanLucTDDT.length; i++) {
            var tongHopNhanLuc = '';
            var menuId = $(elementTongHopNhanLucTDDT[i]).find('input[name=TongHopNhanLucInput]').attr("menu-id");
            var menuId_Value = $(elementTongHopNhanLucTDDT[i]).find('input[name=TongHopNhanLucInput]').val();

            if (menuId_Value) {
                arrTongHopNhanLuc.push(menuId + '_' + menuId_Value);
            } else {
                arrTongHopNhanLuc.push(menuId + '_0');
            }
        }
        $('#TongHopNhanLucTDDT').val(arrTongHopNhanLuc.join("|"));

        arrTongHopNhanLuc = [];
        elementTongHopNhanLucCC = $('.tongHopNhanLucCC');
        for (var i = 0; i < elementTongHopNhanLucCC.length; i++) {
            var tongHopNhanLuc = '';
            var menuId = $(elementTongHopNhanLucCC[i]).find('input[name=TongHopNhanLucInput]').attr("menu-id");
            var menuId_Value = $(elementTongHopNhanLucCC[i]).find('input[name=TongHopNhanLucInput]').val();

            if (menuId_Value) {
                arrTongHopNhanLuc.push(menuId + '_' + menuId_Value);
            } else {
                arrTongHopNhanLuc.push(menuId + '_0');
            }
        }
        $('#TongHopNhanLucCC').val(arrTongHopNhanLuc.join("|"));

        arrTongHopNhanLuc = [];
        elementTongHopNhanLucNhomATTT = $('.tongHopNhanLucNhomATTT');
        for (var i = 0; i < elementTongHopNhanLucNhomATTT.length; i++) {
            var tongHopNhanLuc = '';
            var menuId = $(elementTongHopNhanLucNhomATTT[i]).find('input[name=TongHopNhanLucInput]').attr("menu-id");
            var menuId_Value = $(elementTongHopNhanLucNhomATTT[i]).find('input[name=TongHopNhanLucInput]').val();

            if (menuId_Value) {
                arrTongHopNhanLuc.push(menuId + '_' + menuId_Value);
            } else {
                arrTongHopNhanLuc.push(menuId + '_0');
            }
        }
        $('#TongHopNhanLucNhomATTT').val(arrTongHopNhanLuc.join("|"));

        arrTongHopNhanLuc = [];
        elementTongHopNhanLucNhomKTPT = $('.tongHopNhanLucNhomKTPT');
        for (var i = 0; i < elementTongHopNhanLucNhomKTPT.length; i++) {
            var tongHopNhanLuc = '';
            var menuId = $(elementTongHopNhanLucNhomKTPT[i]).find('input[name=TongHopNhanLucInput]').attr("menu-id");
            var menuId_Value = $(elementTongHopNhanLucNhomKTPT[i]).find('input[name=TongHopNhanLucInput]').val();

            if (menuId_Value) {
                arrTongHopNhanLuc.push(menuId + '_' + menuId_Value);
            } else {
                arrTongHopNhanLuc.push(menuId + '_0');
            }
        }
        $('#TongHopNhanLucNhomKTPT').val(arrTongHopNhanLuc.join("|"));

        arrTongHopNhanLuc = [];
        elementTongHopNhanLucNhomKTBV = $('.tongHopNhanLucNhomKTBV');
        for (var i = 0; i < elementTongHopNhanLucNhomKTBV.length; i++) {
            var tongHopNhanLuc = '';
            var menuId = $(elementTongHopNhanLucNhomKTBV[i]).find('input[name=TongHopNhanLucInput]').attr("menu-id");
            var menuId_Value = $(elementTongHopNhanLucNhomKTBV[i]).find('input[name=TongHopNhanLucInput]').val();

            if (menuId_Value) {
                arrTongHopNhanLuc.push(menuId + '_' + menuId_Value);
            } else {
                arrTongHopNhanLuc.push(menuId + '_0');
            }
        }
        $('#TongHopNhanLucNhomKTBV').val(arrTongHopNhanLuc.join("|"));

        arrTongHopNhanLuc = [];
        elementTongHopNhanLucNhomKTKT = $('.tongHopNhanLucNhomKTKT');
        for (var i = 0; i < elementTongHopNhanLucNhomKTKT.length; i++) {
            var tongHopNhanLuc = '';
            var menuId = $(elementTongHopNhanLucNhomKTKT[i]).find('input[name=TongHopNhanLucInput]').attr("menu-id");
            var menuId_Value = $(elementTongHopNhanLucNhomKTKT[i]).find('input[name=TongHopNhanLucInput]').val();

            if (menuId_Value) {
                arrTongHopNhanLuc.push(menuId + '_' + menuId_Value);
            } else {
                arrTongHopNhanLuc.push(menuId + '_0');
            }
        }
        $('#TongHopNhanLucNhomKTKT').val(arrTongHopNhanLuc.join("|"));
    }
</script>
