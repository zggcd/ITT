<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HL.Lib.Global.CPLogin.IsLogin())
        {
            Response.Redirect("/vn/Thanh-vien/Dang-nhap.aspx?ReturnPath=" + HttpUtility.ParseQueryString("/vn/Thanh-vien/Them-ho-so-ung-cuu-su-co.aspx"));
            return;
        }
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

    int d = 0;
%>

<style>
    .textstyle1 {
        border: none !important;
        border-bottom: 1px dotted !important;
        padding: 0 !important;
    }

    .name {
        width: 30% !important;
    }

    .input {
        width: 70% !important;
    }

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
            width: 90% !important;
        }
</style>

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

                                <table border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse; border: none; mso-border-alt: solid windowtext .5pt; mso-padding-alt: 0in 5.4pt 0in 5.4pt; mso-border-insideh: .5pt solid windowtext; mso-border-insidev: .5pt solid windowtext'>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                        <td width="231" valign="top" style='width: 173.4pt; border: none; border-right: solid windowtext 1.0pt; mso-border-right-alt: solid windowtext .5pt; padding: 0in 5.4pt 0in 5.4pt'>
                                            <p style='margin-top: 6.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                    <o:p>&nbsp;</o:p>
                                                </span>
                                            </p>
                                        </td>
                                        <td width="359" valign="top" style='width: 269.4pt; border: solid windowtext 1.0pt; border-left: none; mso-border-left-alt: solid windowtext .5pt; mso-border-alt: solid windowtext .5pt; padding: 0in 5.4pt 0in 5.4pt'>
                                            <p align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <a name="chuong_pl_3">
                                                    <b style='mso-bidi-font-weight: normal'>
                                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Mẫu số 02<br>
                                                        </span>
                                                    </b>
                                                </a><i style='mso-bidi-font-style: normal'>
                                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>Ban hành kèm theo Thông tư số 20/2017/TT-BTTT ngày 12/9/2017 của Bộ Thông tin và Truyền thông</span>
                                                </i>
                                            </p>
                                        </td>
                                    </tr>
                                </table>

                                <p style='margin-top: 6.0pt'></p>

                                <p align="center" style='margin-top: 6.0pt; text-align: center'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>CỘNG HÒA XÃ HỘI CHỦ NGHĨA VỆT NAM</span>
                                    </b><b style='mso-bidi-font-weight: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                            <br>
                                        </span>
                                    </b><b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI"
                                            style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Độc lập - Tự do - Hạnh phúc</span>
                                    </b><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                        <br>
                                        ---------------------
                                    </span>
                                </p>

                                <p align="center" style='margin-top: 6.0pt; text-align: center'>
                                    <a name="chuong_pl_3_name">
                                        <b style='mso-bidi-font-weight: normal'>
                                            <span lang="VI"
                                                style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>ĐƠN XIN ĐĂNG KÝ THAM GIA MẠNG LƯỚI ỨNG CỨU SỰ CỐ</span>
                                        </b>
                                    </a><span style='mso-bookmark: chuong_pl_3_name'></span><b style='mso-bidi-font-weight: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                            <br>
                                        </span>
                                    </b><i style='mso-bidi-font-style: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>(Áp dụng cho tổ chức, doanh nghiệp và cá nhân tự nguyện tham gia mạng lưới ứng cứu sự cố mạng)</span></i>
                                </p>

                                <p style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>I. Thông tin chung về tổ chức</span>
                                    </b>
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>1. Tên tổ chức:</span>
                                    <input name="ToChuc_Ten" maxlength="255" id="ToChuc_Ten" class="textstyle1" type="text" value="<%=entityDk.ToChuc_Ten %>" />
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>2. Địa chỉ: </span>
                                    <input name="ToChuc_DiaChi" maxlength="255" id="ToChuc_DiaChi" class="textstyle1" type="text" value="<%=entityDk.ToChuc_DiaChi %>" />
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>3. Điện thoại:</span>
                                    <input name="ToChuc_DienThoai" maxlength="255" id="ToChuc_DienThoai" class="textstyle1" type="text" value="<%=entityDk.ToChuc_DienThoai %>" />
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>4. Fax:</span>
                                    <input name="ToChuc_Fax" maxlength="255" id="ToChuc_Fax" class="textstyle1" type="text" value="<%=entityDk.ToChuc_Fax %>" />
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>5. Email:</span>
                                    <input name="ToChuc_Email" maxlength="255" id="ToChuc_Email" class="textstyle1" type="text" value="<%=entityDk.ToChuc_Email %>" />
                                </p>

                                <p style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>II. Giới thiệu về hoạt động của tổ chức</span>
                                    </b>
                                </p>

                                <p style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>1. Giới thiệu chung về hoạt động của tổ chức</span>
                                </p>

                                <p style='margin-top: 6.0pt'>
                                    <i style='mso-bidi-font-style: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>(Cung cấp cho Cơ quan điều ph ố i quốc gia các thông tin ngắn gọn giới thiệu về các lĩnh vực hoạt động của tổ chức, về năng lực ứng cứu sự cố của tổ ch ứ c như nhân sự, công ngh ệ, kinh nghiệm, đối tượng phục vụ,...)</span>
                                    </i>
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                        <textarea name="Content" maxlength="255" id="Content" class="textstyle1" rows="1" style="max-width: 90%; width: 90%; max-height: 300px;"><%=entityDk.Content %></textarea>
                                    </span>
                                </p>

                                <p style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>2. Tên các hệ thống thông tin thuộc phụ trách quản lý hoặc hỗ trợ ứng cứu (cấp độ phê duyệt hoặc dự kiến tương đương):</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>
                                    </span>
                                </p>

                                <table border="0" cellspacing="0" cellpadding="0" style='border-collapse: collapse;'>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                        <%int lvl = 2;
                                            if (currHTTT != null && currHTTT.Count > 0) lvl = currHTTT.GroupBy(o => o.MenuID).Select(o => o.Count()).Max();
                                            for (int i = 0; i < countCapDo; i++)
                                            {%>
                                        <td width="121" valign="top" style='width: 90.65pt; padding: 0in 0in 0in 0in' data-m="<%=lstCapDo[i].ID %>" id="M<%=i %>">
                                            <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'>&#9642;</span>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'><%=lstCapDo[i].Name %>:</span>
                                            </p>
                                            <%int lnHt = 0;
                                                List<ModHeThongThongTinEntity> ht = null;
                                                if (currHTTT != null && currHTTT.Count > 0)
                                                {
                                                    ht = currHTTT.Where(o => o.MenuID == lstCapDo[i].ID).ToList();
                                                    lnHt = ht.Count;
                                                }
                                                for (int j = 0; j < lvl; j++)
                                                {
                                                    var val = "";
                                                    if (lnHt > j && ht != null) val = ht[j].Name;
                                            %>
                                            <p class="MsoNormal Del<%=j+1 %>" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                    <input name="" maxlength="255" id="" class="textstyle1 input" type="text" value="<%=val %>" /></span>
                                            </p>
                                            <%} %>
                                            <output class="Out"></output>
                                        </td>
                                        <%} %>
                                        <td width="121" valign="top" style='width: 90.65pt; padding: 0in 0in 0in 0in'>
                                            <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'></span>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>&nbsp;</span>
                                            </p>
                                            <%for (int j = 0; j < lvl; j++)
                                                {%>
                                            <p class="MsoNormal Del<%=j+1 %>" style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                    <a href="javascript:fnDel(<%=j+1 %>)" data-idx="<%=j+1 %>">Xóa</a>
                                                </span>
                                            </p>
                                            <%} %>
                                            <output class="Out1"></output>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                                <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>
                                                    <a href="javascript:void(0)" id="btnThem">+ Thêm</a>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                </table>

                                <p style='margin-top: 6.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>3. Thông tin về nhân lực, chuyên gia an toàn thông tin, công nghệ thông tin và tương đương</span>
                                </p>

                                <p style='margin-top: 6.0pt'>
                                    <i style='mso-bidi-font-style: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>(Cung cấp thông tin về nhân lực, an toàn thông tin, công nghệ thông tin thuộc đơn vị mình theo bảng kèm theo Biểu mẫu 01 của Thông tư này)</span>
                                    </i>
                                    <br />
                                    <p style="line-height: 0; color: #00455A;">
                                        Upload file <%--(dung lượng < 100Kb)--%>
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

                                            //if (window.ActiveXObject) {
                                            //    var fso = new ActiveXObject("Scripting.FileSystemObject");
                                            //    var filepath = document.getElementById('fileInput').value;
                                            //    var thefile = fso.getFile(filepath);
                                            //    var sizeinbytes = thefile.size;
                                            //    var name = thefile.name;
                                            //} else {
                                            //    var sizeinbytes = document.getElementById('Atack').files[0].size;
                                            //    var name = document.getElementById('Atack').files[0].name;
                                            //}

                                            //var fSExt = new Array('Bytes', 'KB', 'MB', 'GB');
                                            //fSize = sizeinbytes;
                                            //i = 0;
                                            //while (fSize > 900) {
                                            //    fSize /= 1024;
                                            //    i++;
                                            //}

                                            //if (fSize > 100 && (name.contains('.jpg') || name.contains('.png') || name.contains('.bmp') || name.contains('.gif'))) {
                                            //    document.getElementById('Atack').value = "";
                                            //    alert('Kích thước file phải nhỏ hơn 100Kb')
                                            //}

                                            //alert((Math.round(fSize*100)/100)+' '+fSExt[i]);
                                        }
                                    </script>
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
                                            <td style="width: 3%;"><%=i+1 %></td>
                                            <td style="width: 20%;">
                                                <input name="Name" maxlength="255" id="" class="textstyle1 input" type="text" value="<%=lstNhanLuc[i].Name %>" /></td>
                                            <td style="width: 20%;">
                                                <input name="School" maxlength="255" id="" class="textstyle1 input" type="text" value="<%=lstNhanLuc[i].School %>" /></td>
                                            <td style="width: 10%;"><a href="javascript: void(0)" class="btnDaoTao" data-linhvucdt="<%=lstNhanLuc[i].MenuIDs_LinhVucDT %>" data-trinhdodt="<%=lstNhanLuc[i].MenuIDs_TrinhDoDT %>" data-chungchi="<%=lstNhanLuc[i].MenuIDs_ChungChi %>">+ Chi tiết</a></td>
                                            <td style="width: 13%;"><a href="javascript: void(0)" class="btnChungChi" data-quanlyattt="<%=lstNhanLuc[i].MenuIDs_QuanLyATTT %>" data-kythuatphongthu="<%=lstNhanLuc[i].MenuIDs_KyThuatPhongThu %>" data-kythuatbaove="<%=lstNhanLuc[i].MenuIDs_KyThuatBaoVe %>" data-kythuatkiemtra="<%=lstNhanLuc[i].MenuIDs_KyThuatKiemTra %>">+ Chi tiết</a></td>
                                            <td style="width: 1%;">
                                                <input name="NamTotNghiep" maxlength="255" id="" class="textstyle1 input" type="text" value="<%=lstNhanLuc[i].NamTotNghiep %>" style="width: 60px;" /></td>
                                            <td style="width: 1%;"><a href="javascript: void(0)" class="btnRemove">Xóa</a></td>
                                        </tr>
                                        <%}
                                            d = countNhanLuc + 1; %>
                                        <tr class="nhanLuc">
                                            <td style="width: 3%;"><%=d %></td>
                                            <td style="width: 20%;">
                                                <input name="Name" maxlength="255" id="" class="textstyle1 input" type="text" value="" /></td>
                                            <td style="width: 20%;">
                                                <input name="School" maxlength="255" id="" class="textstyle1 input" type="text" value="" /></td>
                                            <td style="width: 10%;"><a href="javascript: void(0)" class="btnDaoTao">+ Chi tiết</a></td>
                                            <td style="width: 13%;"><a href="javascript: void(0)" class="btnChungChi">+ Chi tiết</a></td>
                                            <td style="width: 1%;">
                                                <input name="NamTotNghiep" maxlength="255" id="" class="textstyle1 input" type="text" value="" style="width: 60px;" /></td>
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
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>III. Thông tin trao đổi, liên lạc trong mạng lưới</span>
                                    </b>
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>1. Địa chỉ Website:
                                        <input name="ThongTinLL_Web" maxlength="255" id="ThongTinLL_Web" class="textstyle1" type="text" value="<%=entityDk.ThongTinLL_Web %>" />
                                    </span>
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>2. Địa chỉ thư điện tử của đơn vị<sup>(1)</sup>:</span>
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>PGP/GPG Public Key cho địa chỉ thư điện tử PoC của tổ chức:<sup>(2)</sup></span>
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>a) Tên (User ID):</span>
                                    <input name="ThongTinLL_ThuDT_Ten" maxlength="255" id="ThongTinLL_ThuDT_Ten" class="textstyle1" type="text" value="<%=entityDk.ThongTinLL_ThuDT_Ten %>" />
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>b) Fingerprint:
                                    <input name="ThongTinLL_ThuDT_Fingerprint" maxlength="255" id="ThongTinLL_ThuDT_Fingerprint" class="textstyle1" type="text" value="<%=entityDk.ThongTinLL_ThuDT_Fingerprint %>" />
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>c) Liên kết đến Public key của tổ chức<sup>(3)</sup>:</span>
                                    <input name="ThongTinLL_ThuDT_LinkToPublicKey" maxlength="255" id="ThongTinLL_ThuDT_LinkToPublicKey" class="textstyle1" type="text" value="<%=entityDk.ThongTinLL_ThuDT_LinkToPublicKey %>" />
                                </p>

                                <p style='margin-top: 6.0pt'>
                                    <i style='mso-bidi-font-style: normal'>
                                        <sup>
                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>(1)</span>
                                        </sup>
                                    </i><i style='mso-bidi-font-style: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'></span>
                                    </i><i style='mso-bidi-font-style: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>Địa chỉ thư điện tử được sử dụng làm đầu mối trao đổi thông tin với Mạng lưới ứng cứu sự cố khuyến nghị không nên sử dụng địa chỉ thư điện tử cá nhân, nên sử dụng tên đại diện cho tổ chức.</span>
                                    </i>
                                </p>

                                <p style='margin-top: 6.0pt'>
                                    <i style='mso-bidi-font-style: normal'>
                                        <sup>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>(2)</span>
                                        </sup>
                                    </i><i style='mso-bidi-font-style: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Nếu tổ chức chưa có thì có thể bỏ trống hoặc yêu cầu VNCERT hướng dẫn tạo.</span>
                                    </i>
                                </p>

                                <p style='margin-top: 6.0pt'>
                                    <i style='mso-bidi-font-style: normal'>
                                        <sup>
                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>(3)</span>
                                        </sup>
                                    </i><i style='mso-bidi-font-style: normal'>
                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
                                    </i><i style='mso-bidi-font-style: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Tổ chức có thể gửi Public Key về VNCERT qua thư điện tử (csirts@vncert.vn)</span>
                                    </i>
                                </p>

                                <p style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>3. Đầu mối liên lạc trong giờ làm việc</span>
                                    </b>
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>a) Tên bộ phận/người giải quyết:</span>
                                    <input name="DauMoiLL_TrongGio_Ten" maxlength="255" id="DauMoiLL_TrongGio_Ten" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_TrongGio_Ten %>" />
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>b) Điện thoại cố định:</span>
                                    <input name="DauMoiLL_TrongGio_DienThoai" maxlength="255" id="DauMoiLL_TrongGio_DienThoai" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_TrongGio_DienThoai %>" />
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>c) Điện thoại di động:</span>
                                    <input name="DauMoiLL_TrongGio_DienThoaiDD" maxlength="255" id="DauMoiLL_TrongGio_DienThoaiDD" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_TrongGio_DienThoaiDD %>" />
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>d) Số Fax:</span>
                                    <input name="DauMoiLL_TrongGio_Fax" maxlength="255" id="DauMoiLL_TrongGio_Fax" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_TrongGio_Fax %>" />
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>4. Đầu mối liên lạc ngoài giờ làm việc</span>
                                    </b>
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>a) Tên bộ phận/người giải quyết:</span>
                                    <input name="DauMoiLL_NgoaiGio_Ten" maxlength="255" id="DauMoiLL_NgoaiGio_Ten" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_NgoaiGio_Ten %>" />
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>b) Điện thoại cố định:</span>
                                    <input name="DauMoiLL_NgoaiGio_DienThoai" maxlength="255" id="DauMoiLL_NgoaiGio_DienThoai" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_NgoaiGio_DienThoai %>" />
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>c) Điện thoại di động:</span>
                                    <input name="DauMoiLL_NgoaiGio_DienThoaiDD" maxlength="255" id="DauMoiLL_NgoaiGio_DienThoaiDD" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_NgoaiGio_DienThoaiDD %>" />
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>d) Số Fax:</span>
                                    <input name="DauMoiLL_NgoaiGio_Fax" maxlength="255" id="DauMoiLL_NgoaiGio_Fax" class="textstyle1" type="text" value="<%=entityDk.DauMoiLL_NgoaiGio_Fax %>" />
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>5. Đầu mối lãnh đạo phụ trách về an toàn thông tin của tổ chức <i style='mso-bidi-font-style: normal'><sup>(4)</sup></i></span>
                                    </b>
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>a) Tên bộ phận/người giải quyết:</span>
                                    <input name="DauMoiLanhDao_Ten" maxlength="255" id="DauMoiLanhDao_Ten" class="textstyle1" type="text" value="<%=entityDk.DauMoiLanhDao_Ten %>" />
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>b) Điện thoại cố định:</span>
                                    <input name="DauMoiLanhDao_DienThoai" maxlength="255" id="DauMoiLanhDao_DienThoai" class="textstyle1" type="text" value="<%=entityDk.DauMoiLanhDao_DienThoai %>" />
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>c) Điện thoại di động:</span>
                                    <input name="DauMoiLanhDao_DienThoaiDD" maxlength="255" id="DauMoiLanhDao_DienThoaiDD" class="textstyle1" type="text" value="<%=entityDk.DauMoiLanhDao_DienThoaiDD %>" />
                                </p>

                                <p style='margin-top: 6.0pt'>
                                    <i style='mso-bidi-font-style: normal'>
                                        <sup>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>(4)</span>
                                        </sup>
                                    </i>
                                    <i style='mso-bidi-font-style: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Đầu mối Lãnh đạo phụ trách về an toàn thông tin của tổ chức sẽ chỉ được sử dụng khi không liên lạc được với các đầu mối khác hoặc trong các tình huống sự cố có tính chất nghiêm trọng</span>
                                    </i>
                                </p>

                                <p style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>6. Địa chỉ nhận thư và công văn qua đường bưu điện:</span>
                                    </b>
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>a) Tên bộ phận/người nhận:</span>
                                    <input name="DCNhanThu_TenBoPhan" maxlength="255" id="DCNhanThu_TenBoPhan" class="textstyle1" type="text" value="<%=entityDk.DCNhanThu_TenBoPhan %>" />
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>b) Vị trí, chức vụ:</span>
                                    <input name="DCNhanThu_ViTri" maxlength="255" id="DCNhanThu_ViTri" class="textstyle1" type="text" value="<%=entityDk.DCNhanThu_ViTri %>" />
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>c) Tên tổ chức:</span>
                                    <input name="DCNhanThu_TenToChuc" maxlength="255" id="DCNhanThu_TenToChuc" class="textstyle1" type="text" value="<%=entityDk.DCNhanThu_TenToChuc %>" />
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>d) Địa chỉ liên hệ:</span>
                                    <input name="DCNhanThu_DiaChi" maxlength="255" id="DCNhanThu_DiaChi" class="textstyle1" type="text" value="<%=entityDk.DCNhanThu_DiaChi %>" />
                                </p>

                                <p style='margin-top: 6.0pt; tab-stops: dotted 420.0pt'>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>đ) Điện thoại:</span>
                                    <input name="DCNhanThu_DienThoai" maxlength="255" id="DCNhanThu_DienThoai" class="textstyle1" type="text" value="<%=entityDk.DCNhanThu_DienThoai %>" />
                                </p>

                                <p style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>7. Phương tiện liên lạc khác</span>
                                    </b>
                                    <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'><i style='mso-bidi-font-style: normal'><sup>(5)</sup></i></span>
                                </p>

                                <table border="0" cellspacing="0" cellpadding="0"
                                    style='border-collapse: collapse;'>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
                                        <td width="605" colspan="2" valign="bottom" style='width: 454.05pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Cách thức liên lạc khác qua hệ thống nhắn tin tức thời</span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 1'>
                                        <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>a) Yahoo ID:</span>
                                            </p>
                                        </td>
                                        <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <input name="LLKhac_Yahoo" maxlength="255" id="LLKhac_Yahoo" class="textstyle1" type="text" value="<%=entityDk.LLKhac_Yahoo %>" />
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 2'>
                                        <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>b) Skype:</span>
                                            </p>
                                        </td>
                                        <td width="398" valign="top" style="width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in">
                                            <p style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <input name="LLKhac_Skype" maxlength="255" id="LLKhac_Skype" class="textstyle1" type="text" value="<%=entityDk.LLKhac_Skype %>" />
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 3'>
                                        <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>c) Google Talk:</span>
                                            </p>
                                        </td>
                                        <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <input name="LLKhac_GoogleTalk" maxlength="255" id="LLKhac_GoogleTalk" class="textstyle1" type="text" value="<%=entityDk.LLKhac_GoogleTalk %>" />
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 4'>
                                        <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>d) Hotmail:</span>
                                            </p>
                                        </td>
                                        <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <input name="LLKhac_Hotmail" maxlength="255" id="LLKhac_Hotmail" class="textstyle1" type="text" value="<%=entityDk.LLKhac_Hotmail %>" />
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 5'>
                                        <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>đ) Khác:</span>
                                            </p>
                                        </td>
                                        <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>
                                                    <input name="LLKhac_Khac" maxlength="255" id="LLKhac_Khac" class="textstyle1" type="text" value="<%=entityDk.LLKhac_Khac %>" />
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                    <tr style='mso-yfti-irow: 6; mso-yfti-lastrow: yes'>
                                        <td width="605" colspan="2" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; mso-border-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                            <p style='margin-top: 6.0pt'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <sup>
                                                        <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>(5)</span>
                                                    </sup>
                                                </i><span style="font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: 'Arial','sans-serif';">
                                                    <i style="mso-bidi-font-style: normal">
                                                        <span lang="VI">Thông tin không bắt buộc </span>
                                                    </i>
                                                </span>
                                            </p>
                                        </td>
                                    </tr>
                                </table>

                                <p style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <i style='mso-bidi-font-style: normal'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Chúng tôi cam kết tuân thủ các trách nhiệm, quyền hạn của thành viên mạng lưới, các quy định về hoạt động điều phối ứng cứu sự cố theo quy định pháp luật và hướng dẫn của Cơ quan điều phối quốc gia ban hành.</span>
                                        </i>
                                    </b><b style='mso-bidi-font-weight: normal'>
                                        <i style='mso-bidi-font-style: normal'>
                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
                                        </i>
                                    </b>
                                </p>

                                <p style='margin-top: 6.0pt'>
                                    <b style='mso-bidi-font-weight: normal'>
                                        <i style='mso-bidi-font-style: normal'>
                                            <span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'></span>
                                        </i>
                                    </b>
                                </p>

                                <table border="0" cellspacing="0" cellpadding="0"
                                    style='border-collapse: collapse; mso-padding-alt: 0in 5.4pt 0in 5.4pt'>
                                    <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes; mso-yfti-lastrow: yes'>
                                        <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                                            <p style='margin-top: 6.0pt'>
                                                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"'></span>
                                            </p>
                                        </td>
                                        <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                                            <p align="center" style='margin-top: 6.0pt; text-align: center'>
                                                <i style='mso-bidi-font-style: normal'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>….., ngày …. tháng …. năm 20……<br>
                                                    </span>
                                                </i><b style='mso-bidi-font-weight: normal'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>NGƯỜI ĐẠI DIỆN THEO PHÁP LUẬT<br>
                                                    </span>
                                                </b><i style='mso-bidi-font-style: normal'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'>(Ký tên và đóng dấu)</span>
                                                </i><b style='mso-bidi-font-weight: normal'>
                                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif; mso-fareast-font-family: "Times New Roman"; mso-ansi-language: EN-US'></span>
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
                                <input class="btn_action search icon QAcustom" name="_hl_action[UpdateDangKyUCSC]" value="Cập nhật" type="submit" onclick="fnSubmit()" />
                                <%}
                                    else
                                    {%>
                                <input class="btn_action search icon QAcustom" name="_hl_action[AddDangKyUCSC]" value="Lưu" type="submit" onclick="fnSubmit()" />
                                <%}%>

                                <input style="margin-left: 10px;" onclick="location.href = '/vn/Thanh-vien/DS-dang-ky-ung-cuu-su-co.aspx';" type="button" name="" value="Danh sách đăng ký" />
                            </div>

                        </div>
                    </div>
                    <input type="hidden" name="M" value="" id="M" />
                    <input type="hidden" name="NhanLuc" value="" id="NhanLuc" />
                </form>
            </div>
            <!--.Main_container-->

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

        $('#btnAppend').click(function () {
            var html = "<tr class='nhanLuc'>";
            html += "<td style='width: 3%;'><%=d%></td>";
            html += "<td style='width: 20%;'>";
            html += "<input name='Name' maxlength='255' id='' class='textstyle1 input' type='text' value='' /></td>";
            html += "<td style='width: 20%;'>";
            html += "<input name='School' maxlength='255' id='' class='textstyle1 input' type='text' value='' /></td>";
            html += "<td style='width: 10%;'><a href='javascript: void(0)' class='btnDaoTao'>+ Chi tiết</a></td>";
            html += "<td style='width: 13%;'><a href='javascript: void(0)' class='btnChungChi'>+ Chi tiết</a></td>";
            html += "<td style='width: 1%;'>";
            html += "<input name='NamTotNghiep' maxlength='255' id='' class='textstyle1 input' type='text' value='' style='width: 60px;' /></td>";
            html += "<td style='width: 1%;'><a href='javascript: void(0)' class='btnRemove'>Xóa</a></td>";
            html += "</tr>";
            $('#append').before(html);

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
            $('.btnRemove').click(function () { $(this).parent().parent().remove(); });
        });
    });

    $('.btnRemove').click(function () {
        $(this).parent().parent().remove();
    });
</script>
<!-- End Modal -->

<script>
    $('#btnThem').click(function () {
        var ranNum = Math.floor(Math.random() * 999999).toString();
        var html = '<p class="MsoNormal Del' + ranNum + '" style="margin-top: 6.0pt; tab-stops: dotted 420.0pt"><input name="" maxlength="255" id="" class="textstyle1 input" type="text" value="" /></span></p>';
        var html1 = '<p class="MsoNormal Del' + ranNum + '" style="margin-top: 6.0pt; tab-stops: dotted 420.0pt"><a href="javascript:fnDel(' + ranNum + ')">Xóa</a></span></p>';
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

        var nhanLucs = '';
        var elementNhanLuc = $('.nhanLuc');
        //console.log(elementNhanLuc);
        for (var i = 0; i < elementNhanLuc.length; i++) {
            var nhanLuc = '';
            var name = $(elementNhanLuc[i]).find('input[name=Name]').val();
            var school = $(elementNhanLuc[i]).find('input[name=School]').val();
            var linhvucdt = $(elementNhanLuc[i]).find('a[class=btnDaoTao]').attr('data-linhvucdt');
            var trinhdodt = $(elementNhanLuc[i]).find('a[class=btnDaoTao]').attr('data-trinhdodt');
            var chungchi = $(elementNhanLuc[i]).find('a[class=btnDaoTao]').attr('data-chungchi');
            var quanlyattt = $(elementNhanLuc[i]).find('a[class=btnChungChi]').attr('data-quanlyattt');
            var kythuatphongthu = $(elementNhanLuc[i]).find('a[class=btnChungChi]').attr('data-kythuatphongthu');
            var kythuatbaove = $(elementNhanLuc[i]).find('a[class=btnChungChi]').attr('data-kythuatbaove');
            var kythuatkiemtra = $(elementNhanLuc[i]).find('a[class=btnChungChi]').attr('data-kythuatkiemtra');
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
    }
</script>
