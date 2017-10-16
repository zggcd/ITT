<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    var listItem = ViewBag.Data as List<ModVanBanEntity>;
    var model = ViewBag.Model as MVanBanModel;

    int c = listItem != null ? listItem.Count : 0;

    int i = 0, j = 0, c1 = 0;
    var linhVucs = ViewBag.LinhVuc as List<WebMenuEntity>;
    var coQuans = ViewBag.CoQuan as List<WebMenuEntity>;
    var hinhThucs = ViewBag.HinhThuc as List<WebMenuEntity>;
%>

<script src="/Content/js/AjaxRequest.js"></script>
<script src="/Content/js/Function.js"></script>
<script>
    function loadNews(pageIdNews) {
        $('.main_vbtable').html("<tr><td colspan='6'><img height='50' width='50' src='/Content2/style/images/loading.gif' ></td></tr>");

        $.ajax({
            type: 'post',
            //url: '/Tools/Ajax.aspx?cmd=SearchVB&pageSize=10&totalPage=5&totalItem=1153',
            url: '/Tools/Ajax.aspx/SearchVB',
            dataType: 'html',
            data: {
                "SoKyHieu": $('#txtSoHieu').val(),
                "TuNgayNgayXuatBan": $('#txtTuNgayBanHanh').val(),
                "DenNgayNgayXuatBan": $('#txtDenNgayBanHanh').val(),
                "TuNgayNgayCoHieuLuc": $('#txtTuNgayHieuLuc').val(),
                "DenNgayNgayCoHieuLuc": $('#txtDenNgayHieuLuc').val(),
                "CoQuan": $('#ddlCoQuan').val(),
                "HinhThuc": $('#ddlHinhThuc').val(),
                "LopVanBan": "100",
                "LinhVuc": $('#ddlLinhVuc').val(),
                "TrichYeu": $('#txtTrichYeu').val(),
                "Lang": "1"
            },
            success: (function (html) {
                var nHtml = html.substring(html.indexOf("<div id=\"content\">"));

                $('.main_vbtable').html(nHtml.substring(0, nHtml.indexOf("<div id=\"end\">")));
                $('#pagevanbant').html(nHtml.substring(nHtml.indexOf("<div id=\"end\">"), nHtml.indexOf("<div id=\"endpage\">")));
            })
        });
    }

    function fnSearchVB() {
        var num = Math.floor(Math.random() * 999999);
        var data = {
            "SoKyHieu": $('#txtSoHieu').val(),
            "TuNgayNgayXuatBan": $('#txtTuNgayBanHanh').val(),
            "DenNgayNgayXuatBan": $('#txtDenNgayBanHanh').val(),
            "TuNgayNgayCoHieuLuc": $('#txtTuNgayHieuLuc').val(),
            "DenNgayNgayCoHieuLuc": $('#txtDenNgayHieuLuc').val(),
            "CoQuan": $('#ddlCoQuan').val(),
            "HinhThuc": $('#ddlHinhThuc').val(),
            "LinhVuc": $('#ddlLinhVuc').val(),
            "TrichYeu": $('#txtTrichYeu').val(),
            "Lang": '<%=ViewPage.CurrentLang.ID%>'
        };
        sLink = '/Tools/Ajax.aspx?cmd=SearchVB&SoKyHieu=' + data.SoKyHieu + '&TuNgayNgayXuatBan=' + data.TuNgayNgayXuatBan + '&DenNgayNgayXuatBan=' + data.DenNgayNgayXuatBan + '&TuNgayNgayCoHieuLuc=' + data.TuNgayNgayCoHieuLuc + '&DenNgayNgayCoHieuLuc=' + data.DenNgayNgayCoHieuLuc + '&CoQuan=' + data.CoQuan + '&HinhThuc=' + data.HinhThuc + '&LinhVuc=' + data.LinhVuc + '&TrichYeu=' + data.TrichYeu + '&Lang=' + data.Lang + '&rnd=' + num;

        AjaxRequest.get({
            'url': sLink,
            'onSuccess': function (req) {
                with (req.responseXML.getElementsByTagName("I").item(0)) {
                    var sHtml = getNodeValue(getElementsByTagName("Content"));
                    $('#tbody').html(sHtml);
                    console.log(sHtml);
                }
            },
            'onError': function (req) { }
        });
    }
</script>

<script>
    $(document).ready(function () {
        $("title").html('Văn bản');
        $(".g-b-search").click(function () {
            $(".g-search").toggle('slow', function () {
                if ($("#div_form_search").css("display") == "block") {
                    $("#div_btn_filter").text("Đóng");
                    $("#div_btn_search").show();

                } else if ($("#div_form_search").css("display") == "none") {
                    $("#div_btn_filter").text("Lọc");
                    $("#div_btn_search").hide();
                }
                $("#txtSoHieu").focus();
            });
        });
        $(".btn_clear").click(function () {
            $('#txtSoHieu').val("");
            $('#txtTuNgayBanHanh').val("");
            $('#txtDenNgayBanHanh').val("");
            $('#txtTuNgayHieuLuc').val("");
            $('#txtDenNgayHieuLuc').val("");
            $('#ddlCoQuan').val("");
            $('#ddlHinhThuc').val("");
            $('#ddlLinhVuc').val("");
            $('#txtTrichYeu').val("");
            $('#txtSoHieu').focus();
        });
    });
</script>

<link href="/Content2/style/datetimepicker/jquery-ui-timepicker-addon.css" type="text/css" media="all" rel="stylesheet" />
<link href="/Content2/style/datetimepicker/jquery-ui.css" type="text/css" media="all" rel="stylesheet" />
<script src="/Content2/style/datetimepicker/jquery-1.11.0.min.js"></script>
<script src="/Content2/style/datetimepicker/jquery-ui.min.js"></script>
<script src="/Content2/style/datetimepicker/jquery-ui-timepicker-addon.js"></script>
<script src="/Content2/style/datetimepicker/jquery-ui-sliderAccess.js"></script>
<script src="/Content2/style/datetimepicker/api_buttons.js"></script>
<script src="/Content2/style/datetimepicker/custom.js"></script>
<script src="/Content2/style/js/relation.js"></script>

<link rel="stylesheet" href="/Content2/style/validation/validationEngine.jquery.css" type="text/css" />
<link rel="stylesheet" href="/Content2/style/validation/template.css" type="text/css" />
<script src="/Content2/style/js/jquery-1.12.4.min.js"></script>
<script src="/Content2/style/validation/jquery.validationEngine-vi.js" charset="utf-8"></script>
<script src="/Content2/style/validation/jquery.validationEngine.js" charset="utf-8"></script>

<script>
    function setFormSubmitToFalse() {
        setTimeout(function () { _spFormOnSubmitCalled = false; }, 300);
        return true;
    }
    jQuery(document).ready(function () {
        // binds form submission and fields to the validation engine
        jQuery('form').validationEngine({ promptPosition: "topLeft" });
    });

    function SearchButtonClick() {
        setFormSubmitToFalse();
        document.getElementById('btnSearch').click();
    }
    function CancelButtonClick() {
        setFormSubmitToFalse();
        document.getElementById('btnSearch').click();
    }
</script>
<span style="display: none">
    <input type="submit" name="btnSearch" value="Search" onclick="javascript: fnSearchVB()" id="btnSearch" class="btn btn-primary" />
</span>

<div class="main_right">
    <div class="box-category mb10">
        <div class="vanban-new">
            <h3 class="title-list-news">
                <span class="title-t1">
                    <span id="lbTieuDe"><%=ViewPage.CurrentPage.Name %></span>
                </span>

            </h3>
        </div>
    </div>
    <!--//#box-news-x-->
    <div class="vanban_right">

        <div class="contents">
            <div class="top">
                <div id="div_btn_filter" class="btn_filter g-b-search">Lọc</div>
                <div id="div_btn_search" style="display: none" class="btn_filter" onclick="SearchButtonClick()">Tìm kiếm</div>

                <p class="number">Tổng số văn bản <span><%=model.TotalRecord %></span></p>
                <div id="div_form_search" class="content_filter active_ g-search">
                    <ul>
                        <li><span style="color: red">(gõ nội dung vào một trong các ô tương ứng và nhấn nút Tìm kiếm)</span></li>
                        <li>
                            <div class="name">Số hiệu</div>
                            <input name="txtSoHieu" type="text" maxlength="500" id="txtSoHieu" class="txt_name" />
                        </li>
                        <li>
                            <div class="name">Trích yếu nội dung</div>
                            <input name="txtTrichYeu" type="text" maxlength="3000" id="txtTrichYeu" class="txt_name" /></li>
                        <li>Ngày ban hành
                        </li>
                        <li class="">
                            <div class="to">
                                <div class="name">Từ</div>
                                <input name="txtTuNgayBanHanh" type="text" maxlength="10" id="txtTuNgayBanHanh" class="datepicker validate[custom[dateFormat]] DeepSearch txt_name1" />
                            </div>
                            <div class="from">
                                <div class="name">Đến</div>
                                <input name="txtDenNgayBanHanh" type="text" maxlength="10" id="txtDenNgayBanHanh" class="datepicker validate[custom[dateFormat]] DeepSearch txt_name1" />
                            </div>
                        </li>
                        <li>Ngày hiệu lực
                        </li>
                        <li>
                            <div class="to">
                                <div class="name">Từ</div>
                                <input name="txtTuNgayHieuLuc" type="text" maxlength="10" id="txtTuNgayHieuLuc" class="datepicker validate[custom[dateFormat]] DeepSearch txt_name1" />
                            </div>
                            <div class="from">
                                <div class="name">Đến</div>
                                <input name="txtDenNgayHieuLuc" type="text" maxlength="10" id="txtDenNgayHieuLuc" class="datepicker validate[custom[dateFormat]] DeepSearch txt_name1" />
                            </div>
                        </li>
                        <li class="linhvuc">
                            <div class="name">Lĩnh vực</div>
                            <select name="ddlLinhVuc" id="ddlLinhVuc">
                                <option selected="selected" value="">-Tất cả-</option>
                                <%if (linhVucs != null)
                                    {
                                        c1 = linhVucs.Count;%>
                                <%for (j = 0; j < c1; j++)
                                    {%>
                                <option value="<%=linhVucs[j].ID %>"><%=linhVucs[j].Name %></option>
                                <%} %>
                                <%} %>
                            </select>
                        </li>
                        <li class="hinhthuc">
                            <div class="name">Hình thức văn bản</div>
                            <select name="ddlHinhThuc" id="ddlHinhThuc">
                                <option selected="selected" value="">-Tất cả-</option>
                                <%if (hinhThucs != null)
                                    {
                                        c1 = hinhThucs.Count;%>
                                <%for (j = 0; j < c1; j++)
                                    {%>
                                <option value="<%=hinhThucs[j].ID %>"><%=hinhThucs[j].Name %></option>
                                <%} %>
                                <%} %>
                            </select>
                        </li>
                        <li class="cq">
                            <div class="name">Cơ quan ban hành</div>
                            <select name="ddlCoQuan" id="ddlCoQuan">
                                <option selected="selected" value="">-Tất cả-</option>
                                <%if (coQuans != null)
                                    {
                                        c1 = coQuans.Count;%>
                                <%for (j = 0; j < c1; j++)
                                    {%>
                                <option value="<%=coQuans[j].ID %>"><%=coQuans[j].Name %></option>
                                <%} %>
                                <%} %>
                            </select>

                        </li>
                        <li class="button">
                            <div class="btn_filter" onclick="SearchButtonClick()">Tìm kiếm</div>
                            <div class="btn_filter btn_clear">Hủy bỏ</div>
                        </li>
                    </ul>
                </div>

            </div>
            <div class="main_vbtable  table-vanban">
                <table>
                    <thead>
                        <tr id="headvanban">
                            <th>Số hiệu</th>
                            <th>Cơ quan ban hành</th>
                            <th>Hình thức văn bản</th>
                            <th>Lĩnh vực</th>
                            <th>Trích yếu nội dung</th>
                            <th>Ngày ban hành</th>
                        </tr>
                    </thead>
                    <tbody id="tbody">
                        <%for (i = 0; i < c; i++)
                            {
                                string url = ViewPage.GetURL(listItem[i].MenuID1, listItem[i].Code);
                                string cls = "";
                                if (i % 2 != 0)
                                {
                                    cls = "even";
                                }%>
                        <tr class="<%=cls %>">
                            <td><%=listItem[i].Name %></td>
                            <td><%= HL.Lib.MVC.ViewControl.GetName(listItem[i].getMenu1()) %></td>
                            <td><%= HL.Lib.MVC.ViewControl.GetName(listItem[i].getMenu2()) %></td>
                            <td><%=Utils.ShowTextByType3("VBLinhVuc", ViewPage.CurrentLang.ID, listItem[i].MenuIDs, "MenuIDs") %></td>
                            <td><a href='<%=url %>'><%=listItem[i].Summary %></a></td>
                            <td><%=string.Format("{0:dd/MM/yyyy}", listItem[i].NgayBanHanh) %></td>
                        </tr>
                        <%} %>
                        <script>$('#headvanban').show(); $('.main_vbtable').css('border-top', '1px solid #bababa');</script>
                    </tbody>
                </table>
            </div>
        </div>
        <!--.Main_container-->

        <div class="navi-page">
            <div class="navigation" style="width: 100%;">
                <div id="pagevanbant">
                    <%--<ul>
                        <li class='active'><a href="javascript:loadNews('1')">1 </a></li>
                        <li><a href="javascript:loadNews('2')">2 </a></li>
                        <li><a href="javascript:loadNews('3')">3 </a></li>
                        <li><a href="javascript:loadNews('4')">4 </a></li>
                        <li><a href="javascript:loadNews('5')">5 </a></li>
                        <li><a href="javascript:loadNews('6')">...</a></li>
                        <li><a href="javascript:loadNews('2')">Sau&gt;&gt;</a></li>
                        <li><a href="javascript:loadNews('116')">Trang cuối</a></li>
                    </ul>--%>
                    <%= GetPagination(model.Page, model.PageSize, model.TotalRecord)%>
                </div>
            </div>
        </div>
        <!--//#navi-page-->

    </div>
</div>
