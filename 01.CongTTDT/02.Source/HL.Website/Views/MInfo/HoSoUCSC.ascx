<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HL.Lib.Global.CPLogin.IsLoginOnWeb())
        {
            Response.Redirect("/vn/Thanh-vien/Dang-nhap.aspx?ReturnPath=" + HttpUtility.ParseQueryString("/vn/Thanh-vien/Them-ho-so-ung-cuu-su-co.aspx"));
            return;
        }
    }
</script>

<%
    CPUserEntity entity = ViewBag.Data as CPUserEntity ?? CPLogin.CurrentUser;
    ModHSThanhVienUCSCEntity entityHs = ViewBag.HoSo as ModHSThanhVienUCSCEntity ?? new ModHSThanhVienUCSCEntity();
    ModDauMoiUCSCEntity entityDm = ViewBag.DauMoi as ModDauMoiUCSCEntity ?? new ModDauMoiUCSCEntity();

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
            width: 90%;
        }
</style>

<div class="row-fluid titleContainer">
    <span>BẢN KHAI HỒ SƠ THÀNH VIÊN MẠNG LƯỚI ỨNG CỨU SỰ CỐ</span>
</div>
<div class="contentNews">
    <div class="main_right">
        <div class="box-category mb10">
            <div class="vanban-new">
                <h3 class="title-list-news">
                    <span class="title-t1">BẢN KHAI HỒ SƠ THÀNH VIÊN MẠNG LƯỚI ỨNG CỨU SỰ CỐ</span>
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
                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                    </p>
                                    <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0"
                                        style='border-collapse: collapse; border: none;'>
                                        <tr>
                                            <td width="231" valign="top" style='width: 173.4pt; border: none; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                                </p>
                                            </td>
                                            <td width="359" valign="top" style='width: 269.4pt; border: solid windowtext 1.0pt; border-left: none; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <a
                                                        name="chuong_pl_2"><b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Mẫu số 01</span></b></a><b><span
                                                            style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><br>
                                                        </span></b><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Ban hành kèm theo Thông tư số 20/2017/TT-BTTT ngày 12/9/2017 của Bộ trưởng Bộ Thông tin và Truyền thông</span></i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                    </p>

                                    <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"
                                        style='border-collapse: collapse;'>
                                        <tr>
                                            <td width="306" valign="top" style='width: 265.2pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt;'>
                                                    <b><span style='font-size: 9.0pt; font-family: "Arial",sans-serif;'>
                                                        <input name="ToChuc_TenCoQuanKhac" maxlength="250" id="ToChuc_TenCoQuanKhac" placeholder="TÊN CƠ QUAN" class="textstyle1" type="text" value="<%=entityHs.ToChuc_TenCoQuanKhac %>" style="text-align: center; text-transform: uppercase" /><br>
                                                        <input name="ToChuc_TenKhac" maxlength="250" id="ToChuc_TenKhac" placeholder="TÊN TỔ CHỨC" class="textstyle1" type="text" value="<%=entityHs.ToChuc_TenKhac %>" style="text-align: center; text-transform: uppercase" /><br>
                                                        ---------------</span></b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span><br>
                                                    <input name="ToChuc_SoVanBan" maxlength="250" id="ToChuc_SoVanBan" placeholder="Số văn bản" class="textstyle1" type="text" value="<%=entityHs.ToChuc_SoVanBan %>" style="text-align: center; width: 32%; font-size: 8pt" /><br>
                                                </p>
                                            </td>
                                            <td width="299" valign="top" style='width: 224.35pt; padding: 0in 0in 0in 0in'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM<br>
                                                        Độc lập - Tự do - Hạnh phúc
                                           
                                                        <br>
                                                        ---------------</span></b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                    </p>

                                    <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                        <a name="chuong_pl_2_name">
                                            <b>
                                                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>BẢN KHAI HỒ SƠ THÀNH VIÊN MẠNG LƯỚI ỨNG CỨU SỰ CỐ</span>
                                            </b>
                                        </a>
                                        <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span></b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt'>
                                        <b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>1. Thông tin chung về tổ chức</span></b><b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span></b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;Tên tổ chức:</span>
                                        <input name="ToChuc_Ten" maxlength="250" id="ToChuc_Ten" class="textstyle1" type="text" value="<%=entityHs.ToChuc_Ten %>" />
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;Tên cơ quan chủ quản:</span>
                                        <input name="ToChuc_TenCoQuan" maxlength="250" id="ToChuc_TenCoQuan" class="textstyle1" type="text" value="<%=entityHs.ToChuc_TenCoQuan %>" />
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;Địa chỉ:</span>
                                        <input name="ToChuc_DiaChi" maxlength="250" id="ToChuc_DiaChi" class="textstyle1" type="text" value="<%=entityHs.ToChuc_DiaChi %>" />
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Điện thoại:</span>
                                        <input name="ToChuc_DienThoai" maxlength="250" id="ToChuc_DienThoai" class="textstyle2" type="text" value="<%=entityHs.ToChuc_DienThoai %>" />
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                                            style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> Fax: 
                           
                                            <input name="ToChuc_Fax" maxlength="250" id="ToChuc_Fax" class="textstyle2" type="text" value="<%=entityHs.ToChuc_Fax %>" />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                                            lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Email:</span>
                                        <input name="ToChuc_Email" maxlength="250" id="ToChuc_Email" class="textstyle2" type="text" value="<%=entityHs.ToChuc_Email %>" />
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                                            style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> Website: 
                           
                                            <input name="ToChuc_Web" maxlength="250" id="ToChuc_Web" class="textstyle2" type="text" value="<%=entityHs.ToChuc_Web %>" />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                                            lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Lãnh đạo phụ trách an toàn thông tin:</span><span
                                                style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                                <input name="ToChuc_LanhDao" maxlength="250" id="ToChuc_LanhDao" class="textstyle2" type="text" value="<%=entityHs.ToChuc_LanhDao %>" />. Chức vụ: 
                                   
                                                <input name="ToChuc_ChucVu" maxlength="250" id="ToChuc_ChucVu" class="textstyle2" type="text" value="<%=entityHs.ToChuc_ChucVu %>" />
                                            </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>2. Thông tin tiếp nhận thông báo sự cố</span></b><b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span></b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Địa chỉ:</span>
                                        <input name="TTTN_DiaChi" maxlength="250" id="TTTN_DiaChi" class="textstyle1" type="text" value="<%=entityHs.TTTN_DiaChi %>" />
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Số điện thoại cố định:</span>
                                        <input name="TTTN_DienThoai" maxlength="250" id="TTTN_DienThoai" class="textstyle2" type="text" value="<%=entityHs.TTTN_DienThoai %>" />
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Số điện thoại di động:
                           
                                            <input name="TTTN_DienThoaiDD" maxlength="250" id="TTTN_DienThoaiDD" class="textstyle2" type="text" value="<%=entityHs.TTTN_DienThoaiDD %>" />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span>
                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Số Fax: 
                           
                                            <input name="TTTN_Fax" maxlength="250" id="TTTN_Fax" class="textstyle2" type="text" value="<%=entityHs.TTTN_Fax %>" />
                                        </span>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                                            style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> Email: 
                           
                                            <input name="TTTN_Email" maxlength="250" id="TTTN_Email" class="textstyle2" type="text" value="<%=entityHs.TTTN_Email %>" />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>3. Đầu mối ứng cứu sự cố</span></b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>3.1. Đầu mối ứng cứu sự cố chính</span></b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span>
                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Họ và tên: 
                           
                                            <input name="Name" maxlength="250" id="Name" class="textstyle2" type="text" value="<%=entityDm.Name %>" />
                                        </span>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span>
                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Chức vụ: 
                           
                                            <input name="ChucVu" maxlength="250" id="ChucVu" class="textstyle2" type="text" value="<%=entityDm.ChucVu %>" />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span
                                            lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Địa chỉ liên hệ: 
                           
                                            <input name="DiaChi" maxlength="250" id="DiaChi" class="textstyle1" type="text" value="<%=entityDm.DiaChi %>" />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Số điện thoại cố định:
                           
                                            <input name="DienThoai" maxlength="250" id="DienThoai" class="textstyle2" type="text" value="<%=entityDm.DienThoai %>" />
                                        </span>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Số di động:
                           
                                            <input name="DienThoaiDD" maxlength="250" id="DienThoaiDD" class="textstyle2" type="text" value="<%=entityDm.DienThoaiDD %>" />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Số Fax: 
                           
                                            <input name="Fax" maxlength="250" id="Fax" class="textstyle2" type="text" value="<%=entityDm.Fax %>" />
                                        </span>
                                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span>
                                        <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Email: 
                           
                                            <input name="Email" maxlength="250" id="Email" class="textstyle2" type="text" value="<%=entityDm.Email %>" />
                                        </span>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>4. Giới thiệu về hoạt động của tổ chức</span></b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>(Cung cấp cho Cơ quan điều phối quốc gia các thông tin về năng lực ứng cứu sự cố của tổ chức như nhân sự, công nghệ, kinh nghiệm, đối tượng phục vụ…)</span></i>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                            <textarea name="Content" id="Content" class="textstyle1" rows="3" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityHs.Content %></textarea>
                                        </span></i>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>5. Tên các hệ thống thông tin thuộc phạm vi phụ trách hoặc cung cấp dịch vụ:</span></b>
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
                                    <%-- ======================================= START: ITT UPDATE ======================================= --%>
                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>8. Thông tin về Số lượng nhân lực liên quan đến CNTT, ATTT hoặc tương đương</span></b>
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
                                                <td>6.1</td>
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
                                                <td>6.2</td>
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
                                                <td>6.3</td>
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
                                        <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>7. Thông tin về Số lượng nhân lực có kinh nghiệm, được đào tạo về ATTT</span></b>
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
                                                <td>7.1</td>
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
                                                <td>7.2</td>
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
                                                <td>7.3</td>
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
                                                <td>7.4</td>
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

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>8. Thông tin về Danh sách nhân lực, chuyên gia an toàn thông tin, công nghệ thông tin và tương đương</span></b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>(Cung cấp thông tin về nhân lực an toàn thông tin, công nghệ thông tin thuộc đơn vị hoặc các đơn vị liên quan trong phạm vi mình phụ trách theo mẫu Tổng hợp kèm theo Biểu mẫu 01 này)</span></i>
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
                                                    <input name="NameNhanLuc" maxlength="250" id="" class="textstyle1 input" type="text" value="<%=lstNhanLuc[i].Name %>" /></td>
                                                <td style="width: 20%;">
                                                    <input name="School" maxlength="250" id="" class="textstyle1 input" type="text" value="<%=lstNhanLuc[i].School %>" /></td>
                                                <td style="width: 10%;"><a href="javascript: void(0)" class="btnDaoTao" data-linhvucdt="<%=lstNhanLuc[i].MenuIDs_LinhVucDT %>" data-trinhdodt="<%=lstNhanLuc[i].MenuIDs_TrinhDoDT %>" data-chungchi="<%=lstNhanLuc[i].MenuIDs_ChungChi %>">+ Chi tiết</a></td>
                                                <td style="width: 13%;"><a href="javascript: void(0)" class="btnChungChi" data-quanlyattt="<%=lstNhanLuc[i].MenuIDs_QuanLyATTT %>" data-kythuatphongthu="<%=lstNhanLuc[i].MenuIDs_KyThuatPhongThu %>" data-kythuatbaove="<%=lstNhanLuc[i].MenuIDs_KyThuatBaoVe %>" data-kythuatkiemtra="<%=lstNhanLuc[i].MenuIDs_KyThuatKiemTra %>">+ Chi tiết</a></td>
                                                <td style="width: 1%;">
                                                    <input name="NamTotNghiep" maxlength="250" id="" class="textstyle1 input" type="text" value="<%=lstNhanLuc[i].NamTotNghiep > 0 ? (lstNhanLuc[i].ThangTotNghiep + "/" + lstNhanLuc[i].NamTotNghiep) : "" %>" style="width: 60px;" /></td>
                                                <td style="width: 1%;"><a href="javascript: void(0)" class="btnRemove">Xóa</a></td>
                                            </tr>
                                            <%}
                                                d = countNhanLuc + 1; %>
                                            <tr class="nhanLuc">
                                                <td class='nhanLucTT' style="width: 3%;"><%=d %></td>
                                                <td style="width: 20%;">
                                                    <input name="NameNhanLuc" maxlength="250" id="" class="textstyle1 input" type="text" value="" /></td>
                                                <td style="width: 20%;">
                                                    <input name="School" maxlength="250" id="" class="textstyle1 input" type="text" value="" /></td>
                                                <td style="width: 10%;"><a href="javascript: void(0)" class="btnDaoTao">+ Chi tiết</a></td>
                                                <td style="width: 13%;"><a href="javascript: void(0)" class="btnChungChi">+ Chi tiết</a></td>
                                                <td style="width: 1%;">
                                                    <input name="NamTotNghiep" maxlength="250" id="" class="textstyle1 input" type="text" value="" style="width: 60px;" /></td>
                                                <td style="width: 1%;"><a href="javascript: void(0)" class="btnRemove">Xóa</a></td>
                                            </tr>
                                            <tr id="append"></tr>
                                            <tr>
                                                <td colspan="7" class="text-center"><a href="javascript: void(0)" id="btnAppend">+ Thêm</a></td>
                                            </tr>
                                        </tbody>
                                        <tfoot></tfoot>
                                    </table>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <b><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Chúng tôi cam kết thông tin khai báo trong hồ sơ là chính xác và tuân thủ trách nhiệm, quyền hạn của thành viên mạng cưới, các quy định về hoạt động điều phối ứng cứu sự cố theo quy định pháp luật và hướng dẫn của Cơ quan điều phối quốc gia ban hành.</span></i></b>
                                    </p>

                                    <p class="MsoNormal" style='margin-top: 6.0pt;'>
                                        <b><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span></i></b>
                                    </p>

                                    <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"
                                        style='border-collapse: collapse; mso-padding-alt: 0in 5.4pt 0in 5.4pt'>
                                        <tr>
                                            <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p class="MsoNormal" style='margin-top: 6.0pt'>
                                                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                                                </p>
                                            </td>
                                            <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                                                <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>…., ngày …… tháng ….. <span class="GramE">n&#259;m</span> …….<br>
                                                        <b>NGƯỜI ĐẠI DIỆN THEO PHÁP LUẬT<br>
                                                        </b><i>(Ký tên, đóng dấu hoặc sử dụng chữ ký số)</i></span>
                                                </p>
                                            </td>
                                        </tr>
                                    </table>

                                    <p class="MsoNormal">
                                        <span lang="VI"></span>
                                    </p>

                                </div>

                                <div class="button">
                                    <input type="hidden" name="endCode" value="<%=endCode %>" />
                                    <%if (!string.IsNullOrEmpty(endCode))
                                        {%>
                                    <%if (entityHs != null & entityHs.Activity == false)
                                        {%>
                                    <input class="btn btn-success" name="_hl_action[UpdateHoSoUCSC]" value="Cập nhật" type="submit" onclick="fnSubmit()" />
                                    <%} %>
                                    <%}
                                        else
                                        {%>
                                    <input class="btn btn-success" name="_hl_action[AddHoSoUCSC]" value="Lưu" type="submit" onclick="fnSubmit()" />
                                    <%}%>

                                    <input class="btn btn-danger" style="margin-left: 10px;" onclick="location.href = '/vn/Thanh-vien/Ho-so-ung-cuu-su-co.aspx';" type="button" name="" value="Danh sách hồ sơ" />
                                    <%--<input type="hidden" name="File" value="<%=entity.File %>" />--%>
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
            html += "<input name='NameNhanLuc' maxlength='255' id='' class='textstyle1 input' type='text' value='' /></td>";
            html += "<td style='width: 20%;'>";
            html += "<input name='School' maxlength='255' id='' class='textstyle1 input' type='text' value='' /></td>";
            html += "<td style='width: 10%;'><a href='javascript: void(0)' class='btnDaoTao dt" + rnd + "'>+ Chi tiết</a></td>";
            html += "<td style='width: 13%;'><a href='javascript: void(0)' class='btnChungChi cc" + rnd + "'>+ Chi tiết</a></td>";
            html += "<td style='width: 1%;'>";
            html += "<input name='NamTotNghiep' maxlength='255' id='' class='textstyle1 input' type='text' value='' style='width: 60px;' /></td>";
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
        $('.ToChuc_Kieu').change(function (x) {
            $('input.ToChuc_Kieu').each(function () {
                $(this).val(0);
            });
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
            var name = $(elementNhanLuc[i]).find('input[name=NameNhanLuc]').val();
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

<%--<script>
    $('#btnThem').click(function () {
        var ranNum = Math.floor(Math.random() * 999999).toString();
        var html = '<p class="MsoNormal Del' + ranNum + '" style="margin-top: 6.0pt;"><input name="" maxlength="250" id="" class="textstyle1 input" type="text" value="" /></span></p>';
        var html1 = '<p class="MsoNormal Del' + ranNum + '" style="margin-top: 6.0pt;"><a href="javascript:fnDel(' + ranNum + ')">Xóa</a></span></p>';
        $('.Out').before(html);
        $('.Out1').before(html1);
    });

    function fnDel(r) {
        $('.Del' + r).remove();
    }

    function fnSubmit() {
        var ln = <%=countCapDo%>;
        var s = '';
        for (var i = 0; i < ln; i++) {
            var m = $('#M' + i).attr('data-m');
            s += m + '_';
            var n = $('#M' + i).find('input[type=text]');
            var ln1 = n.length;
            for (var j = 0; j < ln1; j++) {
                s += $(n[j]).val() + ',';
            }
            s += ';';
        }
        $('#M').val(s);
    }
</script>--%>
