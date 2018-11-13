<%@ Page Language="C#" AutoEventWireup="true" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!HL.Lib.Global.CPLogin.IsLoginOnWeb())
        {
            int langId = HL.Core.Global.Convert.ToInt(Request.QueryString["langId"], 0);
            string loginUrl = "/vn/Thanh-vien/Dang-nhap.aspx";
            if (langId == 2)
            {
                loginUrl = "/en/Member/Login.aspx";
            }

            Response.Redirect(loginUrl + "?ReturnPath=" + HttpUtility.ParseQueryString(Request.RawUrl));
            return;
        }
    }
</script>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Preview</title>
    <meta name="author" content="lehoanganhhd@gmail.com" />
    <meta name="generator" content="HLv3.0.Min" />

    <style>
        table.thanh-vien {
            border-collapse: collapse;
        }

            table.thanh-vien th {
                text-align: center;
            }

            table.thanh-vien th,
            table.thanh-vien td {
                border: 1px solid #000;
                border-collapse: collapse;
                text-align: center;
                padding: 5px;
            }

                table.thanh-vien td input,
                table.thanh-vien td select {
                    width: 90%;
                }
    </style>
</head>
<body>
    <form id="hlForm" runat="server">

        <%
            ModHSThanhVienUCSCEntity entity = ModHSThanhVienUCSCService.Instance.GetByID(HL.Core.Web.HttpQueryString.GetValue("RecordID").ToInt());

            WebMenuEntity menu = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "DauMoiUCSC" && o.Code == "Chinh").ToSingle();
            ModDauMoiUCSCEntity entityDm = ModDauMoiUCSCService.Instance.CreateQuery()
                .Where(o => o.Activity == true && o.HSThanhVienUCSCID == entity.ID && o.MenuID == menu.ID)
                .ToSingle();

            WebMenuEntity menu1 = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "DauMoiUCSC" && o.Code == "DuPhong").ToSingle();
            ModDauMoiUCSCEntity entityDmDuPhong = ModDauMoiUCSCService.Instance.CreateQuery()
                .Where(o => o.Activity == true && o.HSThanhVienUCSCID == entity.ID && o.MenuID == menu1.ID)
                .ToSingle();

            List<WebMenuEntity> lstCapDo = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "CapDo" && o.ParentID > 0).ToList_Cache();
            int countCapDo = lstCapDo != null ? lstCapDo.Count : 0;

            List<ModNhanLucUCSCEntity> lstNhanLuc = ModNhanLucUCSCService.Instance.CreateQuery()
                        .Where(o => o.Activity == true && o.HSThanhVienUCSCID == entity.ID)
                        .ToList();
            int countNhanLuc = lstNhanLuc != null ? lstNhanLuc.Count : 0;

            //List<ModHeThongThongTinEntity> currHTTT = ModHeThongThongTinService.Instance.CreateQuery()
            //    .Where(o => o.Activity == true && o.DauMoiUCSCID == entity.ID)
            //    .ToList();

            var lstTongHopNhanLucLVDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "LinhVucDaoDao");
            var lstTongHopNhanLucTDDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "TrinhDoDaoTao");
            var lstTongHopNhanLucCC = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "ChungChi");
            var lstTongHopNhanLucNhomATTT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "QuanLyATTT");
            var lstTongHopNhanLucNhomKTPT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "KyThuatPhongThu");
            var lstTongHopNhanLucNhomKTBV = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "KyThuatBaoVe");
            var lstTongHopNhanLucNhomKTKT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "KyThuatKiemTra");
        %>


        <div class="WordSection1" style="margin: 0 auto; width: 595px;">

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&nbsp;
                </span>
            </p>

            <table class="MsoNormalTable" border="1"
                style='border-collapse: collapse; border: none;'>
                <tr>
                    <td width="231" valign="top" style='width: 173.4pt; border: none; border-right: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&nbsp;
                            </span>
                        </p>
                    </td>
                    <td width="359" valign="top" style='width: 269.4pt; border: solid windowtext 1.0pt; border-left: none; padding: 0in 5.4pt 0in 5.4pt'>
                        <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                            <a
                                name="chuong_pl_2"><b><span
                                    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>M&#7851;u
  s&#7889; 01</span></b></a><b><span
      style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><br>
  </span></b><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Ban hành kèm theo Thông t&#432;
  s&#7889; 20/2017/TT-BTTT ngày 12/9/2017 c&#7911;a B&#7897; tr&#432;&#7903;ng
  B&#7897; Thông tin và Truy&#7873;n thông</span></i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                        </p>
                    </td>
                </tr>
            </table>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&nbsp;
                </span>
            </p>

            <table class="MsoNormalTable" border="0"
                style='border-collapse: collapse;'>
                <tr>
                    <td width="306" valign="top" style='width: 229.2pt; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                            <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>TÊN T&#7892; CH&#7912;C<br>
                                <%=entity.ToChuc_Ten %></span></b><b><span lang="VI"
                                    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><br>
                                    -------</span></b>
                        </p>
                    </td>
                    <td width="299" valign="top" style='width: 224.35pt; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                            <b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>C&#7896;NG
  HÒA XÃ H&#7896;I CH&#7910; NGH&#296;A VI&#7878;T NAM<br>
                                &#272;&#7897;c l&#7853;p - T&#7921; do - H&#7841;nh phúc
                                    <br>
                                ---------------</span></b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                        </p>
                    </td>
                </tr>
            </table>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&nbsp;
                </span>
            </p>

            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                <a
                    name="chuong_pl_2_name"><b><span
                        style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>B&#7842;N KHAI H&#7890; S&#416; THÀNH VIÊN M&#7840;NG
L&#431;&#7898;I &#7912;NG C&#7912;U S&#7920; C&#7888;</span></b></a><b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span></b>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>1. Thông tin chung v&#7873; t&#7893; ch&#7913;c</span></b><b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span></b>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;
Tên t&#7893; ch&#7913;c:</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.ToChuc_Ten %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;
Tên c&#417; quan ch&#7911; qu&#7843;n:</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.ToChuc_TenCoQuan %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;
&#272;</span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7883;</span><span
    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>a
ch&#7881;:</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.ToChuc_DiaChi %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;
&#272;i</span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7879;</span><span
    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>n
tho</span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7841;</span><span lang="VI"
    style='font-size: 10.0pt; font-family: "Arial",sans-serif'>i:</span><span
        lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.ToChuc_DienThoai %> </span><span
            lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> Fax: <%=entity.ToChuc_Fax %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                        lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Email:</span><span
                            lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.ToChuc_Email %> </span><span
                                lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                                    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> Website: <%=entity.ToChuc_Web %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                        lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Lãnh &#273;</span><span
                            style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7841;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>o ph</span><span
                                style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7909;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'> trách an toàn thôn</span><span
                                    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>g</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'> tin:</span><span
                                        lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.ToChuc_LanhDao %> Ch&#7913;c
v&#7909;: <%=entity.ToChuc_ChucVu %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>2. Thông tin ti&#7871;p
nh&#7853;n thông báo s&#7921; c&#7889;</span></b><b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span></b>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                        lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#272;</span><span
                            style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7883;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>a ch&#7881;:</span><span
                                style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.TTTN_DiaChi %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                        lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>S&#7889; &#273;i</span><span
                            style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7879;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>n tho</span><span
                                style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7841;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>i c&#7889; &#273;</span><span
                                    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7883;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>nh:</span><span
                                        lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.TTTN_DienThoai %> </span><span
                                            lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                                                style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> S&#7889; &#273;i&#7879;n tho&#7841;i di &#273;&#7897;ng:
                                                <%=entity.TTTN_DienThoaiDD %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                        style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> S&#7889; Fax: <%=entity.TTTN_Fax %> </span><span lang="VI"
                            style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                                style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> Email: <%=entity.TTTN_Email %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>3. &#272;&#7847;u
m&#7889;i &#7913;ng c&#7913;u s&#7921; c&#7889;</span></b>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>3.1 &#272;&#7847;u
m&#7889;i &#7913;ng c&#7913;u s&#7921; c&#7889; chính</span></b>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                        style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> H&#7885; và tên: <%=entityDm.Name %> </span><span lang="VI"
                            style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                                style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> Ch&#7913;c v&#7909;: <%=entityDm.ChucVu %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                        style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> &#272;&#7883;a ch&#7881; liên h&#7879;: <%=entityDm.DiaChi %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                        style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> S&#7889; &#273;i&#7879;n tho&#7841;i c&#7889; &#273;&#7883;nh:
                        <%=entityDm.DienThoai %> <span></span></span><span lang="VI"
                            style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                                style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> S&#7889; di &#273;&#7897;ng: <%=entityDm.DienThoaiDD %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                        style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> S&#7889; Fax: <%=entityDm.Fax %> <span></span></span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                            style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> Email: <%=entityDm.Email %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>3.2 &#272;&#7847;u
m&#7889;i &#7913;ng c&#7913;u s&#7921; c&#7889; dự phòng</span></b>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                        style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> H&#7885; và tên: <%=entityDmDuPhong.Name %> </span><span lang="VI"
                            style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                                style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> Ch&#7913;c v&#7909;: <%=entityDmDuPhong.ChucVu %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                        style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> &#272;&#7883;a ch&#7881; liên h&#7879;: <%=entityDmDuPhong.DiaChi %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                        style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> S&#7889; &#273;i&#7879;n tho&#7841;i c&#7889; &#273;&#7883;nh:
                        <%=entityDmDuPhong.DienThoai %> <span></span></span><span lang="VI"
                            style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                                style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> S&#7889; di &#273;&#7897;ng: <%=entityDmDuPhong.DienThoaiDD %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                        style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> S&#7889; Fax: <%=entityDmDuPhong.Fax %> <span></span></span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span
                            style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> Email: <%=entityDmDuPhong.Email %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>4. Gi&#7899;i
thi&#7879;u v&#7873; ho&#7841;t &#273;&#7897;ng c&#7911;a t&#7893; ch&#7913;c</span></b>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>(Cung c&#7845;p
cho C&#417; quan &#273;i&#7873;u ph&#7889;i qu&#7889;c gia các thông tin v&#7873;
n&#259;ng l&#7921;c &#7913;ng c&#7913;u s&#7921; c&#7889; c&#7911;a t&#7893; ch&#7913;c
nh&#432; nhân s&#7921;, công ngh&#7879;, kinh nghi&#7879;m, &#273;&#7889;i
t&#432;&#7907;ng ph&#7909;c v&#7909;…)</span></i>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.Content %></span></i>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>5. Tên các h&#7879;
th&#7889;ng thông tin thu&#7897;c ph&#7841;m <span class="GramE">vi</span> ph&#7909;
trách ho&#7863;c cung c&#7845;p d&#7883;ch v&#7909;:</span></b>
            </p>

            <table class="MsoNormalTable" border="0" style='border-collapse: collapse;'>
                <tr>
                    <%for (int i = 0; i < countCapDo; i++)
                        {
                            List<ModHeThongThongTinEntity> lstHTTT = ModHeThongThongTinService.Instance.CreateQuery()
                                .Where(o => o.Activity == true && o.DauMoiUCSCID == entity.ID && o.MenuID == lstCapDo[i].ID)
                                .ToList();
                    %>
                    <td width="121" valign="top" style='width: 90.65pt; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt;'>
                            <span
                                lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#9642;</span><span
                                    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> <%=lstCapDo[i].Name %>:</span>
                        </p>
                        <%for (int j = 0; lstHTTT != null && j < lstHTTT.Count; j++)
                            {%>
                        <p class="MsoNormal" style='margin-top: 6.0pt;'>
                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=j+1 %>. <%=lstHTTT[j].Name %></span>
                        </p>
                        <%} %>
                    </td>
                    <%} %>
                </tr>
            </table>

            <%--<p class="MsoNormal" style='margin-top: 6.0pt;'>
                <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>6. Thông tin v&#7873;
Danh sách nhân l&#7921;c, chuyên gia an toàn thông tin, công ngh&#7879; thông
tin và t&#432;&#417;ng &#273;&#432;&#417;ng</span></b>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>(Cung c&#7845;p
thông tin v&#7873; nhân l&#7921;c an toàn thông tin, công ngh&#7879; thông tin
thu&#7897;c &#273;&#417;n v&#7883; ho&#7863;c các &#273;&#417;n v&#7883; liên
quan trong ph&#7841;m vi mình ph&#7909; trách theo m&#7851;u T&#7893;ng h&#7907;p
kèm theo Bi&#7875;u m&#7851;u 01 này)</span></i>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <b><i><span
                    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Chúng tôi cam k&#7871;t thông tin khai báo trong h&#7891;
s&#417; là chính xác và tuân th&#7911; trách nhi&#7879;m, quy&#7873;n h&#7841;n
c&#7911;a thành viên m&#7841;ng c&#432;&#7899;i, các quy &#273;&#7883;nh v&#7873;
ho&#7841;t &#273;&#7897;ng &#273;i&#7873;u ph&#7889;i &#7913;ng c&#7913;u s&#7921;
c&#7889; <span class="GramE">theo</span> quy &#273;&#7883;nh pháp lu&#7853;t và
h&#432;&#7899;ng d&#7851;n c&#7911;a C&#417; quan &#273;i&#7873;u ph&#7889;i qu&#7889;c
gia ban hành.</span></i></b>
            </p>--%>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>6. Thông tin về Số lượng nhân lực liên quan đến CNTT, ATTT hoặc tương đương</span></b>
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
                            <%= lstTongHopNhanLucLVDT[i].MenuID_Value > 0 ? lstTongHopNhanLucLVDT[i].MenuID_Value.ToString() : "0" %>
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
                            <%= lstTongHopNhanLucTDDT[i].MenuID_Value > 0 ? lstTongHopNhanLucTDDT[i].MenuID_Value.ToString() : "0" %>
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
                            <%= lstTongHopNhanLucCC[i].MenuID_Value > 0 ? lstTongHopNhanLucCC[i].MenuID_Value.ToString() : "0" %>
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
                            <%= lstTongHopNhanLucNhomATTT[i].MenuID_Value > 0 ? lstTongHopNhanLucNhomATTT[i].MenuID_Value.ToString() : "0" %>
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
                            <%= lstTongHopNhanLucNhomKTPT[i].MenuID_Value > 0 ? lstTongHopNhanLucNhomKTPT[i].MenuID_Value.ToString() : "0" %>
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
                            <%= lstTongHopNhanLucNhomKTBV[i].MenuID_Value > 0 ? lstTongHopNhanLucNhomKTBV[i].MenuID_Value.ToString() : "0" %>
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
                            <%= lstTongHopNhanLucNhomKTKT[i].MenuID_Value > 0 ? lstTongHopNhanLucNhomKTKT[i].MenuID_Value.ToString() : "0" %>
                        </td>
                    </tr>
                    <%} %>
                </tbody>
            </table>

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
                    </tr>
                </thead>
                <tbody>
                    <%for (int i = 0; i < countNhanLuc; i++)
                        {
                            string sLinhVuc = "";
                            string sTrinhDo = "";
                            string sChungChi = "";

                            if (!string.IsNullOrEmpty(lstNhanLuc[i].MenuIDs_LinhVucDT))
                            {
                                var linhVuc = WebMenuService.Instance.CreateQuery()
                                    .Where(o => o.Activity == true)
                                    .WhereIn(o => o.ID, lstNhanLuc[i].MenuIDs_LinhVucDT)
                                    .ToList();
                                var tenLinhVuc = linhVuc.Select(o => o.Name).ToArray();
                                if (tenLinhVuc != null) sLinhVuc = string.Join(", ", tenLinhVuc);
                            }

                            if (!string.IsNullOrEmpty(lstNhanLuc[i].MenuIDs_TrinhDoDT))
                            {
                                var trinhDo = WebMenuService.Instance.CreateQuery()
                                    .Where(o => o.Activity == true)
                                    .WhereIn(o => o.ID, lstNhanLuc[i].MenuIDs_TrinhDoDT)
                                    .ToList();
                                var tenTrinhDo = trinhDo.Select(o => o.Name).ToArray();
                                if (tenTrinhDo != null) sTrinhDo = string.Join(", ", tenTrinhDo);
                            }

                            if (!string.IsNullOrEmpty(lstNhanLuc[i].MenuIDs_ChungChi))
                            {
                                var chungChi = WebMenuService.Instance.CreateQuery()
                                    .Where(o => o.Activity == true)
                                    .WhereIn(o => o.ID, lstNhanLuc[i].MenuIDs_ChungChi)
                                    .ToList();
                                var tenChungChi = chungChi.Select(o => o.Name).ToArray();
                                if (tenChungChi != null) sChungChi = string.Join(", ", tenChungChi);
                            }

                            string sQuanLyATTT = "";
                            string sKyThuatPhongThu = "";
                            string sKyThuatBaoVe = "";
                            string sKyThuatKiemTra = "";

                            if (!string.IsNullOrEmpty(lstNhanLuc[i].MenuIDs_QuanLyATTT))
                            {
                                var quanLyATTT = WebMenuService.Instance.CreateQuery()
                                    .Where(o => o.Activity == true)
                                    .WhereIn(o => o.ID, lstNhanLuc[i].MenuIDs_QuanLyATTT)
                                    .ToList();
                                var tenQuanLyATTT = quanLyATTT.Select(o => o.Name).ToArray();
                                if (tenQuanLyATTT != null) sQuanLyATTT = string.Join(", ", tenQuanLyATTT);
                            }

                            if (!string.IsNullOrEmpty(lstNhanLuc[i].MenuIDs_KyThuatPhongThu))
                            {
                                var kyThuatPhongThu = WebMenuService.Instance.CreateQuery()
                                    .Where(o => o.Activity == true)
                                    .WhereIn(o => o.ID, lstNhanLuc[i].MenuIDs_KyThuatPhongThu)
                                    .ToList();
                                var tenKyThuatPhongThu = kyThuatPhongThu.Select(o => o.Name).ToArray();
                                if (tenKyThuatPhongThu != null) sKyThuatPhongThu = string.Join(", ", tenKyThuatPhongThu);
                            }

                            if (!string.IsNullOrEmpty(lstNhanLuc[i].MenuIDs_KyThuatBaoVe))
                            {
                                var kyThuatBaoVe = WebMenuService.Instance.CreateQuery()
                                    .Where(o => o.Activity == true)
                                    .WhereIn(o => o.ID, lstNhanLuc[i].MenuIDs_KyThuatBaoVe)
                                    .ToList();
                                var tenThuatBaoVe = kyThuatBaoVe.Select(o => o.Name).ToArray();
                                if (tenThuatBaoVe != null) sKyThuatBaoVe = string.Join(", ", tenThuatBaoVe);
                            }

                            if (!string.IsNullOrEmpty(lstNhanLuc[i].MenuIDs_KyThuatKiemTra))
                            {
                                var kyThuatKiemTra = WebMenuService.Instance.CreateQuery()
                                    .Where(o => o.Activity == true)
                                    .WhereIn(o => o.ID, lstNhanLuc[i].MenuIDs_KyThuatKiemTra)
                                    .ToList();
                                var tenKyThuatKiemTra = kyThuatKiemTra.Select(o => o.Name).ToArray();
                                if (tenKyThuatKiemTra != null) sKyThuatKiemTra = string.Join(", ", tenKyThuatKiemTra);
                            }
                    %>
                    <tr class="nhanLuc">
                        <td class='nhanLucTT' style="width: 3%;"><%=i+1 %></td>
                        <td style="width: 20%;"><%=lstNhanLuc[i].Name %></td>
                        <td style="width: 20%;"><%=lstNhanLuc[i].School %></td>
                        <td style="width: 10%;">
                            <%if (!string.IsNullOrEmpty(sLinhVuc))
                                {%>
                            Lĩnh vực: <%=sLinhVuc %>
                            <%} %>
                            <%if (!string.IsNullOrEmpty(sTrinhDo))
                                {%>
                            <br />
                            Trình độ: <%=sTrinhDo %>
                            <%} %>
                            <%if (!string.IsNullOrEmpty(sChungChi))
                                {%>
                            <br />
                            Chứng chỉ: <%=sChungChi %>
                            <%} %>
                        </td>
                        <td style="width: 13%;">
                            <%if (!string.IsNullOrEmpty(sQuanLyATTT))
                                {%>
                            Chuyên gia quản lý ATTT: <%=sQuanLyATTT %>
                            <%} %>
                            <%if (!string.IsNullOrEmpty(sKyThuatPhongThu))
                                {%>
                            <br />
                            Chuyên gia kỹ thuật phòng thủ, chống tấn công: <%=sKyThuatPhongThu %>
                            <%} %>
                            <%if (!string.IsNullOrEmpty(sKyThuatBaoVe))
                                {%>
                            <br />
                            Chuyên gia kỹ thuật bảo vệ an toàn hệ thống và ứng dụng: <%=sKyThuatBaoVe %>
                            <%} %>
                            <%if (!string.IsNullOrEmpty(sKyThuatKiemTra))
                                {%>
                            <br />
                            Chuyên gia kỹ thuật kiểm tra, đánh giá ATTT: <%=sKyThuatKiemTra %>
                            <%} %>
                        </td>
                        <td style="width: 1%;">
                            <%=lstNhanLuc[i].NamTotNghiep > 0 ? (lstNhanLuc[i].ThangTotNghiep + "/" + lstNhanLuc[i].NamTotNghiep) : "" %></td>
                    </tr>
                    <%}%>
                    <tr class="nhanLuc">
                        <td class='nhanLucTT' style="width: 3%;"></td>
                        <td style="width: 10%;">&nbsp;</td>
                        <td style="width: 10%;">&nbsp;</td>
                        <td style="width: 20%;">&nbsp;</td>
                        <td style="width: 23%;">&nbsp;</td>
                        <td style="width: 1%;">&nbsp;</td>
                    </tr>
                </tbody>
                <tfoot></tfoot>
            </table>

            <table class="MsoNormalTable" border="0" align="left"
                style='border-collapse: collapse; margin-left: 6.75pt; margin-right: 6.75pt;'>
                <tr style='height: 84.15pt'>
                    <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt; height: 84.15pt'>
                        <p class="MsoNormal" style='margin-top: 6.0pt;'>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&nbsp;
                            </span>
                        </p>
                    </td>
                    <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt; height: 84.15pt'>
                        <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center;'>
                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>…., ngày …… tháng ….. <span class="GramE">n&#259;m</span>
                                …….<br>
                                <b>NG&#431;&#7900;I &#272;&#7840;I
  DI&#7878;N THEO PHÁP LU&#7852;T<br>
                                </b><i>(Ký tên, &#273;óng d&#7845;u
  ho&#7863;c s&#7917; d&#7909;ng ch&#7919; ký s&#7889;)</i><b></b></span>
                        </p>
                    </td>
                </tr>
            </table>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <b><i><span
                    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&nbsp;
                </span></i></b>
            </p>

            <p class="MsoNormal">
                <span lang="VI" style='font-size: 13.0pt; font-family: "Times New Roman",serif'>&nbsp;
                </span>
            </p>

        </div>

    </form>

    <script src="/TTportal/Content/media/system/js/jquery.min-1.12.4.js"></script>
    <script>
        $(document).ready(function () {
            window.print();
        });
    </script>
</body>
</html>
