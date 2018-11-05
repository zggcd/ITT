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
            int recordId = HL.Core.Web.HttpQueryString.GetValue("RecordID").ToInt();
            ModBaoCaoBanDauSuCoEntity entityBc = ModBaoCaoBanDauSuCoService.Instance.GetByID(recordId);
            if (entityBc == null) return;

            ModBaoCaoSuCoEntity sc = ModBaoCaoSuCoService.Instance.CreateQuery().Where(o => o.ID == entityBc.BaoCaoSuCoID).ToSingle();
            if (sc == null) return;

            List<ModInfoMagicEntity> currCachThuc = ModInfoMagicService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == entityBc.ID)
                    //.WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("CachThuc", model.MenuID, model.LangID))
                    .ToList();
            List<ModInfoMagicEntity> currThongBao = ModInfoMagicService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == entityBc.ID)
                    //.WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("GuiThongBaoSuCo", model.MenuID, model.LangID))
                    .ToList();
            List<ModInfoMagicEntity> currDichVu = ModInfoMagicService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == entityBc.ID)
                    //.WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("DichVu", model.MenuID, model.LangID))
                    .ToList();
            List<ModInfoMagicEntity> currBienPhap = ModInfoMagicService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == entityBc.ID)
                    //.WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("BienPhapATTT", model.MenuID, model.LangID))
                    .ToList();
            List<ModInfoMagicEntity> currThongTinGuiKem = ModInfoMagicService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == entityBc.ID)
                    //.WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("ThongTinGuiKem", model.MenuID, model.LangID))
                    .ToList();

            string strCachThuc = string.Join(",", currCachThuc.Select(o => o.MenuID));
            string strThongBao = string.Join(",", currThongBao.Select(o => o.MenuID));
            string strDichVu = string.Join(",", currDichVu.Select(o => o.MenuID));
            string strBienPhap = string.Join(",", currBienPhap.Select(o => o.MenuID));
            string strThongTinGuiKem = string.Join(",", currThongTinGuiKem.Select(o => o.MenuID));

            List<WebMenuEntity> lstCapDo = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "CapDo" && o.ParentID > 0).ToList_Cache();
            int countCapDo = lstCapDo != null ? lstCapDo.Count : 0;

            List<WebMenuEntity> lstHienTrang = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "HienTrangSuCo" && o.ParentID > 0).ToList_Cache();
            int countHienTrang = lstHienTrang != null ? lstHienTrang.Count : 0;

            List<WebMenuEntity> lstCachThuc = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "CachThuc" && o.ParentID > 0).OrderByAsc(o => o.IsAddText).ToList_Cache();
            int countCachThuc = lstCachThuc != null ? lstCachThuc.Count : 0;

            List<WebMenuEntity> lstThongBao = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "GuiThongBaoSuCo" && o.ParentID > 0).ToList_Cache();
            int countThongBao = lstThongBao != null ? lstThongBao.Count : 0;

            List<WebMenuEntity> lstDichVu = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "DichVu" && o.ParentID > 0).ToList_Cache();
            int countDichVu = lstDichVu != null ? lstDichVu.Count : 0;

            List<WebMenuEntity> lstBienPhap = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "BienPhapATTT" && o.ParentID > 0).ToList_Cache();
            int countBienPhap = lstBienPhap != null ? lstBienPhap.Count : 0;

            List<WebMenuEntity> lstThongTinGuiKem = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "ThongTinGuiKem" && o.ParentID > 0).ToList_Cache();
            int countThongTinGuiKem = lstThongTinGuiKem != null ? lstThongTinGuiKem.Count : 0;
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
                            <a name="chuong_pl_4">
                                <b>
                                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Mẫu số 03</span>
                                </b>
                            </a><b>
                                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                    <br>
                                </span>
                            </b><i>
                                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Ban hành kèm theo Thông tư số 20/2017/TT-BTTT ngày 12/9/2017 của Bộ Thông tin và Truyền thông</span>
                            </i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                        </p>
                    </td>
                </tr>
            </table>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&nbsp;
                </span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&nbsp;
                </span>
            </p>

            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                <a>
                    <b>
                        <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>BÁO CÁO BAN ĐẦU SỰ CỐ MẠNG</span>
                    </b>
                </a><b>
                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'></span>
                </b>
            </p>

            <div class="clear-20">&nbsp;</div>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <b>
                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>THÔNG TIN VỀ TỔ CHỨC/CÁ NHÂN BÁO CÁO SỰ CỐ</span>
                </b>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Tên tổ chức/cá nhân báo cáo sự cố (*)</span>
                <span><%=sc.Name %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'> Địa chỉ: (*)</span>
                <span><%=sc.Address %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'> Điện thoại (*)</span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                    <span><%=sc.Phone %></span>
                </span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                    Email (*) 
                                    <span><%=sc.Email %></span>
                </span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <b>
                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>NGƯỜI LIÊN HỆ</span>
                </b><b>
                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                </b>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'> Họ và tên (*)</span>
                <span><%=entityBc.NguoiLienHe_Ten %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Chức vụ:</span>
                <span><%=entityBc.NguoiLienHe_ChucVu %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'> Điện thoại (*)</span>
                <span><%=entityBc.NguoiLienHe_DienThoai %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Email (*)</span>
                <span><%=entityBc.NguoiLienHe_Email %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <b>
                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>THÔNG TIN CHI TIẾT VỀ HỆ THỐNG BỊ SỰ CỐ</span>
                </b>
            </p>

            <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0"
                style='border-collapse: collapse; border: none; width: 100%'>
                <tr>
                    <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Tên đơn vị vận hành hệ thống thông tin (*): </span>
                        </p>
                    </td>
                    <td width="378" colspan="5" valign="top" style='width: 283.55pt; border: solid windowtext 1.0pt; border-left: none; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <i>
                                <span><%=entityBc.ChiTiet_TenDonVi %></span>
                            </i>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Cơ quan chủ quản:</span>
                        </p>
                        Chưa được xử lý
                    </td>
                    <td width="378" colspan="5" valign="top" style='width: 283.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <i>
                                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                    <%=entityBc.ChiTiet_CoQuan %>
                                </span>
                            </i>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Tên hệ thống bị sự cố</span>
                        </p>
                    </td>
                    <td width="378" colspan="5" valign="top" style='width: 283.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <i>
                                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                    <%=entityBc.ChiTiet_TenHeThong %>
                                </span>
                            </i>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Phân loại cấp độ của hệ thống thông tin (nếu có)</span>
                        </p>
                    </td>
                    <%for (int i = 0; i < countCapDo && i < 5; i++)
                        {%>
                    <td width="75" valign="top" style='width: 56.6pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <input name="ChiTiet_PhanLoaiID" <%= entityBc.ChiTiet_PhanLoaiID == lstCapDo[i].ID ? "checked" : "" %> type="radio" value='<%=lstCapDo[i].ID %>' disabled />
                            <%=lstCapDo[i].Name %>
                        </p>
                    </td>
                    <%} %>
                </tr>
                <tr>
                    <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Tổ chức cung cấp dịch vụ an toàn thông tin (nếu có):</span>
                        </p>
                    </td>
                    <td width="378" colspan="5" valign="top" style='width: 283.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <i>
                                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                    <%=entityBc.ChiTiet_TenToChucCungCap %>
                                </span>
                            </i>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Tên nhà cung cấp dịch vụ kết nối bên ngoài (nếu có)</span>
                        </p>
                    </td>
                    <td width="378" colspan="5" valign="top" style='width: 283.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <i>
                                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                    <%=entityBc.ChiTiet_TenNCC_BenNgoai %>
                                </span>
                            </i>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td width="227" valign="top" style='width: 170.5pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Điền tên nhà cung cấp ở đây</span>
                        </p>
                    </td>
                    <td width="378" colspan="5" valign="top" style='width: 283.55pt; border-top: none; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <i>
                                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                    <%=entityBc.ChiTiet_TenNCC %>
                                </span>
                            </i>
                        </p>
                    </td>
                </tr>
            </table>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'></span>
            </p>

            <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse; border: none; width: 100%'>
                <tr>
                    <td width="605" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Mô tả sơ bộ về sự cố (*)</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td width="605" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; border-top: none; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.25pt'>
                            <i>
                                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Đề nghị cung cấp một bản tóm tắt ngắn gọn về sự cố, bao gồm đánh giá sơ bộ cuộc tấn công đã xảy ra chưa và bất kỳ các nguy cơ dẫn đến khả năng phá hoại hoặc gián đoạn dịch vụ. Cũng vui lòng xác định mức độ nhạy cảm của thông tin liên quan hoặc những đối tượng bị ảnh hưởng bởi sự cố</span>
                            </i>
                        </p>
                        <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 420.25pt'>
                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                <%=entityBc.ChiTiet_MoTa %>
                            </span>
                        </p>
                    </td>
                </tr>
            </table>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
            </p>

            <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0"
                style='border-collapse: collapse; border: none; width: 100%'>
                <tr>
                    <td valign="top" style='width: 140.8pt; border: solid windowtext 1.0pt; border-right: none; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Ngày phát hiện sự cố (*) (dd/mm/yy)</span>
                        </p>
                    </td>
                    <td style='width: 33.45pt; border-top: solid windowtext 1.0pt; border-left: none; border-bottom: solid windowtext 1.0pt; border-right: none; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                            <%=string.Format("{0:dd/MM/yyyy}", entityBc.ChiTiet_NgayGioPhatHien) %>
                        </p>
                    </td>
                    <td width="52" style='width: 38.7pt; border: solid windowtext 1.0pt; border-left: none; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'></span>
                        </p>
                    </td>
                    <td style='width: 105.2pt; border: solid windowtext 1.0pt; border-left: none; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Thời gian phát hiện (*):</span>
                        </p>
                    </td>
                    <td width="147" style='width: 109.9pt; border: solid windowtext 1.0pt; border-left: none; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                                <%=string.Format("{0:HH}", entityBc.ChiTiet_NgayGioPhatHien) %>
                            </span>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>giờ
                                                    <%=string.Format("{0:mm}", entityBc.ChiTiet_NgayGioPhatHien) %>
                                phút
                            </span>
                        </p>
                    </td>
                </tr>
            </table>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <b>
                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>HIỆN TRẠNG SỰ CỐ (*)</span>
                </b>
            </p>

            <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" style='border-collapse: collapse; width: 100%'>
                <tr>
                    <%for (int i = 0; i < countHienTrang; i++)
                        {%>
                    <td width="302" valign="top" style='width: 226.75pt; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <input name="HienTrangID" <%= entityBc.HienTrangID == lstHienTrang[i].ID ? "checked" : "" %> type="radio" value='<%=lstHienTrang[i].ID %>' disabled />
                            <%=lstHienTrang[i].Name %>
                        </p>
                    </td>
                    <%} %>
                </tr>
            </table>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <b>
                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>CÁCH THỨC PHÁT HIỆN *</span>
                </b><i>
                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>(Đánh dấu những cách thức được sử dụng để phát hiện sự cố)</span>
                </i>
            </p>

            <%int d = 0;
                for (int i = 0; i < countCachThuc; i++)
                {
                    string chk = "", val = "";
                    if (strCachThuc.IndexOf(lstCachThuc[i].ID.ToString()) > -1)
                    {
                        chk = "checked";
                        var ct = currCachThuc.Where(o => o.MenuID == lstCachThuc[i].ID).SingleOrDefault();
                        if (ct != null) val = ct.Name;
                    }
                    string addText = "0_" + d.ToString();   //0: Chekbox ko them truong text; 1: Checkbox them truong text
                    if (lstCachThuc[i].IsAddText == true)
                    {
                        addText = "1_" + d.ToString();
                        d++;
                    }
            %>
            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                    <input name="chkCachThuc" type="checkbox" value="" onchange="setChkStatus(this, '<%=addText + "_" + lstCachThuc[i].ID %>')" <%=chk %> disabled />
                    <%=lstCachThuc[i].Name %>
                    <%if (lstCachThuc[i].IsAddText == true)
                        {%>
                    <span><%=val %></span>
                    <%} %>
                </span>
            </p>
            <%} %>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <b>
                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>ĐÃ GỬI THÔNG BÁO SỰ CỐ CHO *</span>
                </b>
            </p>

            <%d = 0;
                for (int i = 0; i < countThongBao; i++)
                {
                    string chk = "", val = "";
                    if (strThongBao.IndexOf(lstThongBao[i].ID.ToString()) > -1)
                    {
                        chk = "checked";
                        var ct = currThongBao.Where(o => o.MenuID == lstThongBao[i].ID).SingleOrDefault();
                        if (ct != null) val = ct.Name;
                    }
                    string addText = "0_" + d.ToString();   //0: Chekbox ko them truong text; 1: Checkbox them truong text
                    if (lstThongBao[i].IsAddText == true)
                    {
                        addText = "1_" + d.ToString();
                        d++;
                    }
            %>
            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                    <input name="chkThongBao" type="checkbox" value="" onchange="setChkStatus(this, '<%=addText + "_" + lstThongBao[i].ID %>')" <%=chk %> disabled />
                    <%=lstThongBao[i].Name %>
                    <%if (lstThongBao[i].IsAddText == true)
                        {%>
                    <span><%=val %></span>
                    <%} %>
                </span>
            </p>
            <%} %>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <b>
                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>THÔNG TIN BỔ SUNG VỀ HỆ THỐNG XẢY RA SỰ CỐ </span>
                </b>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Hệ điều hành</span>
                <span><%=entityBc.TTThem_HeDieuHanh %></span>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Version</span>
                <span><%=entityBc.TTThem_Version %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Các dịch vụ có trên hệ thống
                <i>(Đánh dấu những dịch vụ được sử dụng trên hệ thống)</i>
                </span>
            </p>

            <%d = 0;
                for (int i = 0; i < countDichVu; i++)
                {
                    string chk = "", val = "";
                    if (strDichVu.IndexOf(lstDichVu[i].ID.ToString()) > -1)
                    {
                        chk = "checked";
                        var ct = currDichVu.Where(o => o.MenuID == lstDichVu[i].ID).SingleOrDefault();
                        if (ct != null) val = ct.Name;
                    }
                    string addText = "0_" + d.ToString();   //0: Chekbox ko them truong text; 1: Checkbox them truong text
                    if (lstDichVu[i].IsAddText == true)
                    {
                        addText = "1_" + d.ToString();
                        d++;
                    }
            %>
            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                    <input name="chkDichVu" type="checkbox" value="" onchange="setChkStatus(this, '<%=addText + "_" + lstDichVu[i].ID %>')" <%=chk %> disabled />
                    <%=lstDichVu[i].Name %>
                    <%if (lstDichVu[i].IsAddText == true)
                        {%>
                    <span><%=val %></span>
                    <%} %>
                </span>
            </p>
            <%} %>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642;
                Các biện pháp an toàn thông tin đã triển khai <i>(Đánh dấu những biện pháp đã triển khai)</i>
                </span>
            </p>

            <%d = 0;
                for (int i = 0; i < countBienPhap; i++)
                {
                    string chk = "", val = "";
                    if (strBienPhap.IndexOf(lstBienPhap[i].ID.ToString()) > -1)
                    {
                        chk = "checked";
                        var ct = currBienPhap.Where(o => o.MenuID == lstBienPhap[i].ID).SingleOrDefault();
                        if (ct != null) val = ct.Name;
                    }
                    string addText = "0_" + d.ToString();   //0: Chekbox ko them truong text; 1: Checkbox them truong text
                    if (lstBienPhap[i].IsAddText == true)
                    {
                        addText = "1_" + d.ToString();
                        d++;
                    }
            %>
            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                    <input name="chkBienPhap" type="checkbox" value="" onchange="setChkStatus(this, '<%=addText + "_" + lstBienPhap[i].ID %>')" <%=chk %> disabled />
                    <%=lstBienPhap[i].Name %>
                    <%if (lstBienPhap[i].IsAddText == true)
                        {%>
                    <span><%=val %></span>
                    <%} %>
                </span>
            </p>
            <%} %>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Các địa chỉ IP của hệ thống <i>(Liệt kê địa chỉ IP sử dụng trên Internet, không liệt kê địa chỉ IP nội bộ)</i></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <i>
                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                        <%=entityBc.TTThem_DanhSachIP %>
                    </span>
                </i>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Các tên miền của hệ thống </span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <i>
                    <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>
                        <%=entityBc.TTThem_DanhSachTenMien %>
                    </span>
                </i>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Mục đích chính sử dụng hệ thống</span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <%=entityBc.TTThem_MucDichSuDung %>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Thông tin gửi kèm</span>
            </p>

            <%d = 0;
                for (int i = 0; i < countThongTinGuiKem; i++)
                {
                    string chk = "", val = "";
                    if (strThongTinGuiKem.IndexOf(lstThongTinGuiKem[i].ID.ToString()) > -1)
                    {
                        chk = "checked";
                        var ct = currThongTinGuiKem.Where(o => o.MenuID == lstThongTinGuiKem[i].ID).SingleOrDefault();
                        if (ct != null) val = ct.Name;
                    }
                    string addText = "0_" + d.ToString();   //0: Chekbox ko them truong text; 1: Checkbox them truong text
                    if (lstThongTinGuiKem[i].IsAddText == true)
                    {
                        addText = "1_" + d.ToString();
                        d++;
                    }
            %>
            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                    <input name="chkThongTinGuiKem" type="checkbox" value="" onchange="setChkStatus(this, '<%=addText + "_" + lstThongTinGuiKem[i].ID %>')" <%=chk %> disabled />
                    <%=lstThongTinGuiKem[i].Name %>
                    <%if (lstThongTinGuiKem[i].IsAddText == true)
                        {%>
                    <span><%=val %></span>
                    <%} %>
                </span>
            </p>
            <%} %>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#9642; Các thông tin cung cấp trong thông báo sự cố này đều phải được giữ bí mật:
                                        <input name="GiuBiMat" <%= entityBc.GiuBiMat ? "checked" : "" %> type="radio" value='1' disabled />
                    Có
                                    <input name="GiuBiMat" <%= !entityBc.GiuBiMat ? "checked" : "" %> type="radio" value='0' disabled />
                    Không
                </span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <b>
                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>KIẾN NGHỊ, ĐỀ XUẤT HỖ TRỢ</span>
                </b>
            </p>

            <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0" style='border-collapse: collapse; border: none; width: 100%'>
                <tr>
                    <td width="590" valign="top" style='width: 6.15in; border: solid windowtext 1.0pt; padding: 0in 5.4pt 0in 5.4pt'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Mô tả về đề xuất, kiến nghị</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td width="590" valign="top" style='width: 6.15in; border: solid windowtext 1.0pt; border-top: none; padding: 0in 5.4pt 0in 5.4pt'>
                        <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 419.85pt'>
                            <i>
                                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Đề nghị cung cấp tóm lược về các kiến nghị và đề xuất hỗ trợ ứng cứu (nếu có)</span>
                            </i>
                        </p>
                        <p class="MsoNormal" style='margin-top: 6.0pt; tab-stops: dotted 419.85pt'>
                            <%=entityBc.Content %>
                        </p>
                    </td>
                </tr>
            </table>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <b>
                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>THỜI GIAN THỰC HIỆN BÁO CÁO SỰ CỐ</span>
                </b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>*:</span>
                <span><%=string.Format("{0:dd/MM/yyyy/HH/mm}", entityBc.ThoiGianThucHien) %></span>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>(ngày/tháng/năm/giờ/phút)</span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
            </p>

            <div class="clear-20">&nbsp;</div>
            <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"
                style='border-collapse: collapse; width: 100%'>
                <tr>
                    <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                        </p>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                        </p>
                    </td>
                    <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                        <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                            <b>
                                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>CÁ NHÂN/NGƯỜI ĐẠI DIỆN THEO PHÁP LUẬT<br>
                                </span>
                            </b><i>
                                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>(Ký tên, đóng dấu)</span>
                            </i><b>
                                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                            </b>
                        </p>
                    </td>
                </tr>
            </table>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <i>
                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Chú thích:</span>
                </i><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                    <i>1. Phần (*) là những thông tin bắt buộc. Các phần còn lại có thể loại bỏ nếu không có thông tin.</i>
                </span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <i>
                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>2. Sử dụng tiêu đề (subject) bắt đầu bằng "[TBSC]" khi gửi thông báo qua email</span>
                </i>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <i>
                    <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>3. Tham khảo thêm tại website của VNCERT (www.vncert.gov vn)</span>
                </i>
            </p>

        </div>

    </form>

    <script src="/Content/js/jquery.min-1.12.4.js"></script>
    <script>
        $(document).ready(function () {
            window.print();
        });
    </script>
</body>
</html>
