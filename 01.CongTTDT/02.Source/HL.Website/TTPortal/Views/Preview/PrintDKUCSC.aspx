<%@ Page Language="C#" AutoEventWireup="true" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="content-type" content="text/html; charset=utf-8" />
    <title>Preview</title>
    <meta name="author" content="lehoanganhhd@gmail.com" />
    <meta name="generator" content="HLv3.0.Min" />
</head>
<body>
    <form id="hlForm" runat="server">

        <%
            ModDonDangKyUCSCEntity entity = ModDonDangKyUCSCService.Instance.GetByID(HL.Core.Web.HttpQueryString.GetValue("RecordID").ToInt());
            ModDauMoiUCSCEntity entityDm = ModDauMoiUCSCService.Instance.CreateQuery()
                .Where(o => o.Activity == true && o.HSThanhVienUCSCID == entity.ID)
                .ToSingle();

            List<WebMenuEntity> lstCapDo = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "CapDo" && o.ParentID > 0).ToList_Cache();
            int countCapDo = lstCapDo != null ? lstCapDo.Count : 0;

            //List<ModHeThongThongTinEntity> currHTTT = ModHeThongThongTinService.Instance.CreateQuery()
            //    .Where(o => o.Activity == true && o.DauMoiUCSCID == entity.ID)
            //    .ToList();
        %>

        <div class="WordSection1" style="margin: 0 auto; width: 595px;">

            <table class="MsoNormalTable" border="1" cellspacing="0" cellpadding="0"
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
                                name="chuong_pl_3"><b><span
                                    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>M&#7851;u
  s&#7889; 02<br>
                                </span></b></a><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Ban hành kèm theo Thông t&#432;
  s&#7889; 20/2017/TT-BTTT ngày 12/9/2017 c&#7911;a B&#7897; Thông tin và
  Truy&#7873;n thông</span></i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
                        </p>
                    </td>
                </tr>
            </table>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&nbsp;
                </span>
            </p>

            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                <b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>C&#7896;NG HÒA XÃ H&#7896;I
CH&#7910; NGH&#296;A V&#7878;T NAM</span></b><b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><br>
</span></b><b><span lang="VI"
    style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#272;&#7897;c
l&#7853;p - T&#7921; do - H&#7841;nh phúc</span></b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><br>
    ---------------------</span>
            </p>

            <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                <a
                    name="chuong_pl_3_name"><b><span lang="VI"
                        style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#272;&#416;N
XIN &#272;&#258;NG KÝ THAM GIA M&#7840;NG L&#431;&#7898;I &#7912;NG C&#7912;U S&#7920;
C&#7888;</span></b></a><span></span><b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><br>
</span></b><i><span lang="VI"
    style='font-size: 10.0pt; font-family: "Arial",sans-serif'>(</span></i><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>Á</span></i><i><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>p d&#7909;ng cho t&#7893;
ch&#7913;c, doanh nghi&#7879;p và cá nhân t&#7921; nguy&#7879;n tham gia m&#7841;ng
l&#432;&#7899;i </span></i><i><span
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7913;</span></i><i><span
        lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>ng
c&#7913;u s&#7921; c&#7889; m&#7841;ng)</span></i><span lang="VI"
    style='font-size: 10.0pt; font-family: "Arial",sans-serif'></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>I. Thông tin chung v&#7873; t&#7893; ch&#7913;c</span></b><b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span></b>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>1.
Tên t&#7893; ch&#7913;c:</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.ToChuc_Ten %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>2.
&#272;&#7883;a ch&#7881;:</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.ToChuc_DiaChi %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>3.
&#272;i&#7879;n tho&#7841;i:</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.ToChuc_DienThoai %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>4.
Fax:</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.ToChuc_Fax %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>5.
Email:</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.ToChuc_Email %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>II. Gi&#7899;i thi&#7879;u v&#7873; ho&#7841;t
&#273;&#7897;ng c&#7911;a t&#7893; ch&#7913;c</span></b>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>1. Gi&#7899;i
thi&#7879;u chung v&#7873; ho&#7841;t &#273;&#7897;ng c&#7911;a t&#7893; ch&#7913;c</span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <i><span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>(Cung
c&#7845;p cho C&#417; quan &#273;i&#7873;u ph</span></i><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7889;</span></i><i><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>i qu&#7889;c gia các
thông tin ng&#7855;n g&#7885;n gi&#7899;i thi&#7879;u v&#7873; các l&#297;nh v&#7921;c
ho&#7841;t &#273;&#7897;ng c&#7911;a t&#7893; ch&#7913;c, v&#7873; n&#259;ng l&#7921;c
&#7913;ng c&#7913;u s&#7921; c&#7889; c&#7911;a t&#7893; ch</span></i><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7913;</span></i><i><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>c nh&#432; nhân s&#7921;,
công ngh</span></i><i><span
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7879;,</span></i><i><span
        lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
kinh nghi&#7879;m, &#273;&#7889;i t&#432;&#7907;ng ph&#7909;c v&#7909;,...)</span></i><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span></i>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.Content %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>2. Tên các h&#7879;
th&#7889;ng thông tin thu&#7897;c ph&#7909; trách qu&#7843;n lý ho&#7863;c h&#7895;
                </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>tr</span><span lang="VI"
                    style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#7907;
&#7913;ng c&#7913;u (c&#7845;p &#273;</span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7897;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'> phê duy</span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7879;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>t ho&#7863;c d&#7921; ki&#7871;n t</span><span
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#432;&#417;</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>ng
&#273;&#432;&#417;ng):</span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
            </p>

            <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" style='border-collapse: collapse;'>
                <tr>
                    <%for (int i = 0; i < countCapDo; i++)
                        {
                            List<ModHeThongThongTinEntity> lstHTTT = ModHeThongThongTinService.Instance.CreateQuery()
                                .Where(o => o.Activity == true && o.DonDangKyUCSCID == entity.ID && o.MenuID == lstCapDo[i].ID)
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

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>3 Thông tin v&#7873;
nhân l&#7921;c, chuyên gia an toàn thông tin, công ngh&#7879; thông tin và
t&#432;&#417;ng &#273;&#432;&#417;ng</span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <i><span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>(Cun</span></i><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>g</span></i><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif'> <span lang="VI">c&#7845;p thông </span></span></i><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif; color: windowtext;'>tin</span></i><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span></i><i><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>v&#7873; nhân l&#7921;c,
an toàn thông </span></i><i><span
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>ti</span></i><i><span
        lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>n,
công ngh&#7879; thông tin thu&#7897;c &#273;&#417;n v&#7883; mình theo b&#7843;ng
kèm theo Bi&#7875;u m&#7851;u 01 c&#7911;a Thông t&#432; này)</span></i>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>III</span></b><b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>. Thông tin trao &#273;&#7893;i, liên l&#7841;c
trong m&#7841;ng </span></b><b><span
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>l&#432;</span></b><b><span
        lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#7899;i</span></b>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>1.
&#272;&#7883;a ch&#7881; Website:</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.ThongTinLL_Web %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>2.
&#272;&#7883;a ch&#7881; th&#432; &#273;i&#7879;n t&#7917; c&#7911;a
&#273;&#417;n v&#7883;<sup>(1)</sup>:</span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>PGP/GPG
Public Key cho &#273;&#7883;a ch&#7881; th&#432; &#273;i&#7879;n t&#7917; PoC c&#7911;a
t&#7893; ch&#7913;c:<sup>(2)</sup></span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>a)
Tên (User ID) :</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.ThongTinLL_ThuDT_Ten %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>b)
Fingerprint :</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.ThongTinLL_ThuDT_Fingerprint %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>c)
Liên k&#7871;t &#273;&#7871;n Public key c&#7911;a t&#7893; ch&#7913;c<sup>(3)</sup>:</span><span
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.ThongTinLL_ThuDT_LinkToPublicKey %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <i><sup><span
                    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>(1)</span></sup></i><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif'> </span></i><i><span
                        style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#272;&#7883;a </span></i><i><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>ch&#7881; th&#432; &#273;i&#7879;n t&#7917;
&#273;&#432;&#7907;c s&#7917; d&#7909;ng làm &#273;&#7847;u m&#7889;i trao
&#273;&#7893;i thông tin v&#7899;i M&#7841;ng l&#432;&#7899;i &#7913;ng c&#7913;u
s&#7921; c&#7889; khuy</span></i><i><span
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7871;</span></i><i><span
        lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>n
ngh&#7883; không nên s&#7917; d&#7909;ng &#273;&#7883;a ch&#7881; th&#432;
&#273;i&#7879;n t&#7917; cá nhân, nên s&#7917; d&#7909;ng tên &#273;&#7841;i di&#7879;n
cho t&#7893; ch&#7913;c.</span></i>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <i><sup><span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>(2)</span></sup></i><i><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'> N&#7871;u t&#7893;
ch&#7913;c ch&#432;a có thì có th&#7875; b&#7887; tr&#7889;ng ho&#7863;c yêu c&#7847;u
VNCERT h&#432;&#7899;ng d&#7851;n t&#7841;o.</span></i>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <i><sup><span
                    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>(3)</span></sup></i><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span></i><i><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>T</span></i><i><span
                        style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7893;</span></i><i><span
                            lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
ch</span></i><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7913;</span></i><i><span lang="VI"
    style='font-size: 10.0pt; font-family: "Arial",sans-serif'>c
c</span></i><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>ó</span></i><i><span lang="VI"
    style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
th</span></i><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7875;</span></i><i><span lang="VI"
    style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
g&#7917;i Public Key v&#7873; VNCERT qua <span class="GramE">th&#432;</span>
    &#273;i&#7879;n t&#7917; (csirts@vncert.vn)</span></i>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>3. &#272;&#7847;u m&#7889;i liên l&#7841;c
trong gi&#7901; làm vi&#7879;c</span></b>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>a)
Tên b&#7897; ph&#7853;n/ng&#432;&#7901;i gi&#7843;i quy&#7871;t: </span><span
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.DauMoiLL_TrongGio_Ten %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>b)
&#272;i&#7879;n tho&#7841;i c&#7889; &#273;&#7883;nh:</span><span lang="VI"
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.DauMoiLL_TrongGio_DienThoai %> </span><span
        lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>c)
&#272;i&#7879;n tho&#7841;i di &#273;&#7897;ng:</span><span lang="VI"
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.DauMoiLL_TrongGio_DienThoaiDD %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>d)
S&#7889; Fax:</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.DauMoiLL_TrongGio_Fax %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>4. &#272;&#7847;u m&#7889;i
liên l&#7841;c ngoài gi&#7901; làm vi&#7879;c</span></b><b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span></b>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>a)
Tên b&#7897; ph&#7853;n/ng&#432;&#7901;i gi&#7843;i quy&#7871;t:</span><span
    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.DauMoiLL_NgoaiGio_Ten %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>b)
&#272;i&#7879;n tho&#7841;i c&#7889; &#273;&#7883;nh:</span><span lang="VI"
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.DauMoiLL_NgoaiGio_DienThoai %> </span><span
        lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>c)
&#272;i&#7879;n tho&#7841;i di &#273;&#7897;ng:</span><span lang="VI"
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.DauMoiLL_NgoaiGio_DienThoaiDD %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>d)
S&#7889; Fax:</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.DauMoiLL_NgoaiGio_Fax %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>5. &#272;&#7847;u m&#7889;i
lãnh &#273;&#7841;o ph&#7909; trách v&#7873; an toàn thông tin c&#7911;a t&#7893;
ch&#7913;c</span></b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'> <i><sup>(4)</sup></i></span><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span></i>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>a)
Tên b&#7897; ph&#7853;n/ng&#432;&#7901;i gi&#7843;i quy&#7871;t:</span><span
    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.DauMoiLanhDao_Ten %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>b)
&#272;i&#7879;n tho&#7841;i c&#7889; &#273;&#7883;nh:</span><span lang="VI"
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.DauMoiLanhDao_DienThoai %> </span><span
        lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>c)
&#272;i&#7879;n tho&#7841;i di &#273;&#7897;ng:</span><span lang="VI"
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.DauMoiLanhDao_DienThoaiDD %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <i><sup><span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>(4)</span></sup></i><i><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'> &#272;&#7847;u m&#7889;i
Lãnh &#273;&#7841;o ph&#7909; trách v&#7873; an toàn thông tin c&#7911;a t&#7893;
ch&#7913;c s&#7869; ch&#7881; &#273;&#432;&#7907;c s&#7917; d&#7909;ng khi
không liên l&#7841;c &#273;&#432;&#7907;c v&#7899;i các &#273;&#7847;u m&#7889;i
khác ho&#7863;c trong các tình hu&#7889;ng s&#7921; c&#7889; có t</span></i><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>í</span></i><i><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>nh ch&#7845;t nghiêm
tr&#7885;ng</span></i>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>6. &#272;&#7883;a ch&#7881; nh&#7853;n th&#432;
và công v&#259;n qua &#273;&#432;&#7901;ng b&#432;u &#273;i&#7879;n:</span></b>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>a)
Tên b&#7897; ph&#7853;n/ng&#432;&#7901;i nh&#7853;n: </span><span
    style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.DCNhanThu_TenBoPhan %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>b)
V&#7883; trí, ch&#7913;c v&#7909;:</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.DCNhanThu_ViTri %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>c)
Tên t&#7893; ch&#7913;c:</span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.DCNhanThu_TenToChuc %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>d)
&#272;&#7883;a ch&#7881; liên h&#7879;:</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.DCNhanThu_DiaChi %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt;'>
                <span
                    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#273;)
&#272;i&#7879;n tho&#7841;i:</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'> </span><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.DCNhanThu_DienThoai %></span>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>7. Ph&#432;&#417;ng ti&#7879;n liên l&#7841;c
khác</span></b><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'> <i><sup>(5)</sup></i></span>
            </p>

            <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"
                style='border-collapse: collapse;'>
                <tr>
                    <td width="605" colspan="2" valign="bottom" style='width: 454.05pt; border: solid windowtext 1.0pt; border-bottom: none; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                            <span
                                lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Cách
  th&#7913;c liên l&#7841;c khác qua h&#7879; th&#7889;ng nh&#7855;n tin t&#7913;c
  th&#7901;i</span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>a) Yahoo ID:</span>
                        </p>
                    </td>
                    <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.LLKhac_Yahoo %></span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>s</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>b) Skype:</span>
                        </p>
                    </td>
                    <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.LLKhac_Skype %></span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>c) Google
  Talk:</span>
                        </p>
                    </td>
                    <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.LLKhac_GoogleTalk %></span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>d) </span><span
                                style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>H</span><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>otmail:</span>
                        </p>
                    </td>
                    <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.LLKhac_Hotmail %></span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td width="207" valign="top" style='width: 155.45pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>&#273;)
  Khác:</span>
                        </p>
                    </td>
                    <td width="398" valign="top" style='width: 298.6pt; border: solid windowtext 1.0pt; border-bottom: none; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'><%=entity.LLKhac_Khac %></span>
                        </p>
                    </td>
                </tr>
                <tr>
                    <td width="605" colspan="2" valign="top" style='width: 454.05pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <i><sup><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>(5)</span></sup></i><span
                                style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
                                <i><span lang="VI">Thông tin không b&#7855;t
  bu&#7897;c</span></i><span lang="VI"></span></span>
                        </p>
                    </td>
                </tr>
            </table>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <b><i><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>Chúng tôi cam
k&#7871;t tuân th&#7911; các trách nhi&#7879;m, quy&#7873;n h&#7841;n c&#7911;a
thành viên m&#7841;ng l&#432;&#7899;i, các quy &#273;&#7883;nh v&#7873; ho&#7841;t
&#273;&#7897;ng &#273;i&#7873;u ph</span></i></b><b><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7889;</span></i></b><b><i><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>i &#7913;ng c&#7913;u
s&#7921; c</span></i></b><b><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7889;</span></i></b><b><i><span
    lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>
theo quy &#273;&#7883;nh pháp lu&#7853;t và h&#432;&#7899;ng d&#7851;n c&#7911;a
C&#417; quan &#273;i&#7873;u ph</span></i></b><b><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&#7889;</span></i></b><b><i><span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif'>i qu&#7889;c gia ban
hành.</span></i></b><b><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span></i></b>
            </p>

            <p class="MsoNormal" style='margin-top: 6.0pt'>
                <b><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&nbsp;
                </span></i></b>
            </p>

            <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0"
                style='border-collapse: collapse;'>
                <tr>
                    <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                            <span lang="VI" style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>&nbsp;
                            </span>
                        </p>
                    </td>
                    <td width="295" valign="top" style='width: 221.4pt; padding: 0in 5.4pt 0in 5.4pt'>
                        <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                            <i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>…<span class="GramE">..,</span> ngày …. <span class="GramE">tháng</span>
                                …. <span class="GramE">n&#259;m</span> 20……<br>
                            </span></i><b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>NG&#431;&#7900;I &#272;&#7840;I DI&#7878;N THEO PHÁP
  LU&#7852;T<br>
                            </span></b><i><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'>(Ký tên và &#273;óng d&#7845;u)</span></i><b><span style='font-size: 10.0pt; font-family: "Arial",sans-serif;'></span></b>
                        </p>
                    </td>
                </tr>
            </table>

            <p class="MsoNormal">
                <span lang="VI">&nbsp;
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
