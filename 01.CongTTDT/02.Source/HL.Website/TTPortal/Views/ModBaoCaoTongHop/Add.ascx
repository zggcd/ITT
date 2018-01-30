<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModBaoCaoTongHopModel;
    var entity = ViewBag.Data as ModBaoCaoTongHopEntity;

    List<ModSoLuongSuCoEntity> currSuCo = ViewBag.SuCo as List<ModSoLuongSuCoEntity> ?? new List<ModSoLuongSuCoEntity>();

    string strSuCo = string.Join(",", currSuCo.Select(o => o.MenuID));
    string endCode = ViewBag.EndCode;

    List<WebMenuEntity> lstLoaiSuCo = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "LoaiSuCo" && o.ParentID > 0).ToList_Cache();
    int countLoaiSuCo = lstLoaiSuCo != null ? lstLoaiSuCo.Count : 0;
%>

<form id="hlForm" name="hlForm" method="post">
    <input type="hidden" id="_hl_action" name="_hl_action" />

    <div id="toolbar-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="toolbar-list" id="toolbar">
                <%= GetDefaultAddCommand()%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Báo cáo tổng hợp : <%=  model.RecordID > 0 ? "Chỉnh sửa" : "Thêm mới"%></h2>
            </div>
            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>
    <div class="clr"></div>

    <%= ShowMessage()%>

    <div id="element-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="col width-100">
                <table class="admintable">
                    <tr>
                        <td class="key">
                            <label>User :</label>
                        </td>
                        <td>
                            <% List<CPUserEntity> listUser = CPUserService.Instance.CreateQuery().ToList(); %>
                            <select name="UserID" id="UserID" class="text_input">
                                <option value="0">-</option>
                                <%for (int i = 0; listUser != null && i < listUser.Count; i++)
                                    { %>
                                <option <%if (entity.UserID == listUser[i].ID)
                                    {%>
                                    selected <%} %> value="<%= listUser[i].ID%>"><%= listUser[i].Name%></option>
                                <%} %>
                            </select>
                        </td>
                    </tr>
                    <%--<tr>
                        <td class="key">
                            <label>User i d1 :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="UserID1" id="UserID1" value="<%=entity.UserID1 %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Chuyên mục :</label>
                        </td>
                        <td>
                            <select name="MenuID" id="MenuID" class="text_input">
                                <option value="0">Root</option>
                                <%= Utils.ShowDDLMenuByType("BaoCaoTongHop", model.LangID, entity.MenuID)%>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Vị trí :</label>
                        </td>
                        <td>
                            <%= Utils.ShowCheckBoxByConfigkey("Mod.BaoCaoTongHopState", "ArrState", entity.State)%>
                        </td>
                    </tr>--%>
                    <tr>
                        <td class="key">
                            <label>Tên :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Name" id="Name" value="<%=entity.Name %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Mã :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Code" id="Code" value="<%=entity.Code %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Từ tháng :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="TuNgay" id="TuNgay" value="<%=string.Format("{0:dd/MM/yyyy}", entity.TuNgay) %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Đến tháng :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="DenNgay" id="DenNgay" value="<%=string.Format("{0:dd/MM/yyyy}", entity.DenNgay) %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Tên cơ quan/tổ chức :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="TenToChuc" id="TenToChuc" value="<%=entity.TenToChuc %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Địa chỉ :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="DiaChi" id="DiaChi" value="<%=entity.DiaChi %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Mã thành viên mạng lưới :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="MaThanhVien" id="MaThanhVien" value="<%=entity.MaThanhVien %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Số lượng sự cố và cách thức xử lý :</label>
                        </td>
                        <td>
                            <table class="MsoNormalTable" border="0" cellspacing="0" cellpadding="0" style='width: 98%; border-collapse: collapse; mso-padding-alt: 0in 0in 0in 0in'>
                                <tr style='mso-yfti-irow: 0; mso-yfti-firstrow: yes'>
                                    <td width="208" style='width: 155.7pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Loại sự cố/tấn công mạng</span>
                                        </p>
                                    </td>
                                    <td width="42" style='width: 31.85pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Số lượng</span>
                                        </p>
                                    </td>
                                    <td width="52" style='width: 38.8pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Số sự cố tự xử lý</span>
                                        </p>
                                    </td>
                                    <td width="78" style='width: 58.55pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>S</span><span style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif; mso-ansi-language: EN-US'>&#7889;</span><span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Số sự cố có sự hỗ trợ xử lý từ các tổ chức khác</span>
                                        </p>
                                    </td>
                                    <td width="77" style='width: 58.1pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Số sự cố có hỗ trợ xử lý từ tổ chức nước ngoài</span>
                                        </p>
                                    </td>
                                    <td width="76" style='width: 57.2pt; border-top: solid windowtext 1.0pt; border-left: solid windowtext 1.0pt; border-bottom: none; border-right: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Số sự cố đề nghị VNCERT hỗ trợ xử lý</span>
                                        </p>
                                    </td>
                                    <td width="72" style='width: 53.85pt; border: solid windowtext 1.0pt; border-bottom: none; mso-border-top-alt: solid windowtext .5pt; mso-border-left-alt: solid windowtext .5pt; mso-border-right-alt: solid windowtext .5pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p class="MsoNormal" align="center" style='margin-top: 6.0pt; text-align: center'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'>Thiệt hại ước tính</span>
                                        </p>
                                    </td>
                                </tr>

                                <%for (int i = 0; i < countLoaiSuCo; i++)
                                    {
                                        var row = currSuCo.Where(o => o.MenuID == lstLoaiSuCo[i].ID).SingleOrDefault();
                                        if (row == null) row = new ModSoLuongSuCoEntity();
                                %>
                                <tr>
                                    <td>
                                        <input type="hidden" name="MN" value="<%=lstLoaiSuCo[i].ID %>" />
                                    </td>
                                </tr>
                                <tr style='mso-yfti-irow: 1'>
                                    <td width="208" valign="top" style='width: 155.7pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'><%=lstLoaiSuCo[i].Name %></span>
                                        </p>
                                    </td>
                                    <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p class="MsoNormal" style='margin-top: 6.0pt; text-align: center;'>
                                            <input name="SoLuong" maxlength="255" id="" class="textstyle1" type="text" value="<%=row.SoLuong > 0 ? string.Format("{0:##,###}", row.SoLuong) : "0" %>" style="width: 50%; text-align: center;" />
                                        </p>
                                    </td>
                                    <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p class="MsoNormal" style='margin-top: 6.0pt; text-align: center;'>
                                            <input name="TuXuLy" maxlength="255" id="" class="textstyle1" type="text" value="<%=row.TuXuLy > 0 ? string.Format("{0:##,###}", row.TuXuLy) : "0" %>" style="width: 50%; text-align: center;" />
                                        </p>
                                    </td>
                                    <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p class="MsoNormal" style='margin-top: 6.0pt; text-align: center;'>
                                            <input name="ToChucHoTro" maxlength="255" id="" class="textstyle1" type="text" value="<%=row.ToChucHoTro > 0 ? string.Format("{0:##,###}", row.ToChucHoTro) : "0" %>" style="width: 50%; text-align: center;" />
                                        </p>
                                    </td>
                                    <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p class="MsoNormal" style='margin-top: 6.0pt; text-align: center;'>
                                            <input name="ToChucNuocNgoaiHoTro" maxlength="255" id="" class="textstyle1" type="text" value="<%=row.ToChucNuocNgoaiHoTro > 0 ? string.Format("{0:##,###}", row.ToChucNuocNgoaiHoTro) : "0" %>" style="width: 50%; text-align: center;" />
                                        </p>
                                    </td>
                                    <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p class="MsoNormal" style='margin-top: 6.0pt; text-align: center;'>
                                            <input name="DeNghi" maxlength="255" id="" class="textstyle1" type="text" value="<%=row.DeNghi > 0 ? string.Format("{0:##,###}", row.DeNghi) : "0" %>" style="width: 50%; text-align: center;" />
                                        </p>
                                    </td>
                                    <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p class="MsoNormal" style='margin-top: 6.0pt; text-align: center;'>
                                            <input name="ThietHaiUocTinh" maxlength="255" id="" class="textstyle1" type="text" value="<%=row.ThietHaiUocTinh > 0 ? string.Format("{0:##,###}", row.ThietHaiUocTinh) : "0" %>" style="width: 50%; text-align: center;" />
                                        </p>
                                    </td>
                                </tr>
                                <%} %>

                                <tr style='mso-yfti-irow: 1'>
                                    <td width="208" valign="top" style='width: 155.7pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p class="MsoNormal" style='margin-top: 6.0pt'>
                                            <span lang="VI" style='font-size: 10.0pt; mso-bidi-font-size: 12.0pt; font-family: "Arial",sans-serif'><b>Tổng cộng</b></span>
                                        </p>
                                    </td>
                                    <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p id="T1" class="MsoNormal" style='margin-top: 6.0pt; text-align: center; font-weight: bold;'>
                                            <%=currSuCo.Sum(o => o.SoLuong) %>
                                        </p>
                                    </td>
                                    <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p id="T2" class="MsoNormal" style='margin-top: 6.0pt; text-align: center; font-weight: bold;'>
                                            <%=currSuCo.Sum(o => o.TuXuLy) %>
                                        </p>
                                    </td>
                                    <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p id="T3" class="MsoNormal" style='margin-top: 6.0pt; text-align: center; font-weight: bold;'>
                                            <%=currSuCo.Sum(o => o.ToChucHoTro) %>
                                        </p>
                                    </td>
                                    <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p id="T4" class="MsoNormal" style='margin-top: 6.0pt; text-align: center; font-weight: bold;'>
                                            <%=currSuCo.Sum(o => o.ToChucNuocNgoaiHoTro) %>
                                        </p>
                                    </td>
                                    <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p id="T5" class="MsoNormal" style='margin-top: 6.0pt; text-align: center; font-weight: bold;'>
                                            <%=currSuCo.Sum(o => o.DeNghi) %>
                                        </p>
                                    </td>
                                    <td width="42" valign="top" style='width: 31.85pt; border: solid windowtext 1.0pt; background: white; padding: 0in 0in 0in 0in'>
                                        <p id="T6" class="MsoNormal" style='margin-top: 6.0pt; text-align: center; font-weight: bold;'>
                                            <%=currSuCo.Sum(o => o.ThietHaiUocTinh) %>
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Danh sách các tổ chức hỗ trợ xử lý sự cố :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="ToChucHoTro" id="ToChucHoTro" value="<%=entity.DSToChucHoTro %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Danh sách các tổ chức nước ngoài hỗ trợ xử lý sự cố :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="ToChucNuocNgoaiHoTro" id="ToChucNuocNgoaiHoTro" value="<%=entity.DSToChucNuocNgoaiHoTro %>" maxlength="255" />
                        </td>
                    </tr>
                    <tr>
                        <td class="key">
                            <label>Đề xuất kiến nghị :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="DeXuat" id="DeXuat" value="<%=entity.DeXuat %>" maxlength="255" />
                        </td>
                    </tr>
                    <%--<tr>
                        <td class="key">
                            <label>Published1 :</label>
                        </td>
                        <td>
                            <input class="text_input" type="text" name="Published1" id="Published1" value="<%=entity.Published1 %>" maxlength="255" />
                        </td>
                    </tr>--%>
                    <%if (CPViewPage.UserPermissions.Approve)
                        {%>
                    <tr>
                        <td class="key">
                            <label>Duyệt :</label>
                        </td>
                        <td>
                            <input name="Activity" <%= entity.Activity ? "checked" : "" %> type="radio" value='1' />
                            Có
                    <input name="Activity" <%= !entity.Activity ? "checked" : "" %> type="radio" value='0' />
                            Không
                        </td>
                    </tr>
                    <%} %>
                </table>
            </div>
            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>

    <script>
        $('input[name=SoLuong]').change(function () {
            var n = 0;
            $('input[name=SoLuong]').map(function () {
                n += $(this).val() * 1;
            })
            $('#T1').html(n);
        });
        $('input[name=TuXuLy]').change(function () {
            var n = 0;
            $('input[name=TuXuLy]').map(function () {
                n += $(this).val() * 1;
            })
            $('#T2').html(n);
        });
        $('input[name=ToChucHoTro]').change(function () {
            var n = 0;
            $('input[name=ToChucHoTro]').map(function () {
                n += $(this).val() * 1;
            })
            $('#T3').html(n);
        });
        $('input[name=ToChucNuocNgoaiHoTro]').change(function () {
            var n = 0;
            $('input[name=ToChucNuocNgoaiHoTro]').map(function () {
                n += $(this).val() * 1;
            })
            $('#T4').html(n);
        });
        $('input[name=DeNghi]').change(function () {
            var n = 0;
            $('input[name=DeNghi]').map(function () {
                n += $(this).val() * 1;
            })
            $('#T5').html(n);
        });
        $('input[name=ThietHaiUocTinh]').change(function () {
            var n = 0;
            $('input[name=ThietHaiUocTinh]').map(function () {
                n += $(this).val() * 1;
            })
            $('#T6').html(n);
        });
    </script>

</form>
