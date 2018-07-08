<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%= ShowMessage()%>
<%
    var deface = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "Incident" && o.Code == "Deface").ToSingle();
    var botnet = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "Incident" && o.Code == "Botnet").ToSingle();
    var phishing = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "Incident" && o.Code == "Phishing").ToSingle();
    var malware = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "Incident" && o.Code == "Malware").ToSingle();
    var lstDeface = new List<ModIncidentEntity>();
    var lstBotnet = new List<ModIncidentEntity>();
    var lstMalware = new List<ModIncidentEntity>();
    var lstPhishing = new List<ModIncidentEntity>();
    var lstDeface2 = new List<ModIncidentEntity>();
    var lstBotnet2 = new List<ModIncidentEntity>();
    var lstMalware2 = new List<ModIncidentEntity>();
    var lstPhishing2 = new List<ModIncidentEntity>();
    int T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11, T12;
    DBQuery<ModIncidentEntity> dbQuery = null;

    if (deface != null)
    {
        dbQuery = ModIncidentService.Instance.CreateQuery()
            .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", deface.ID, 1))
            .Select(o => o.ISP)
            .Distinct();
        if (dbQuery.ToList() != null)
        {
            lstDeface = dbQuery.ToList().Select(o => new ModIncidentEntity
            {
                ISP = o.ISP,
                AttackOn = o.AttackOn,
                ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
            })
            .OrderByDescending(o => o.ChildNum)
            .Take(10)
            .Skip(0)
            .ToList();
        }

        lstDeface2 = ModIncidentService.Instance.CreateQuery().WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", deface.ID, 1)).ToList();
    }
    if (botnet != null)
    {
        dbQuery = ModIncidentService.Instance.CreateQuery()
            .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", botnet.ID, 1))
            .Select(o => o.ISP)
            .Distinct();
        if (dbQuery.ToList() != null)
        {
            lstBotnet = dbQuery.ToList().Select(o => new ModIncidentEntity
            {
                ISP = o.ISP,
                AttackOn = o.AttackOn,
                ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
            })
            .OrderByDescending(o => o.ChildNum)
            .Take(10)
            .Skip(0)
            .ToList();
        }

        lstBotnet2 = ModIncidentService.Instance.CreateQuery().WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", botnet.ID, 1)).ToList();
    }
    if (phishing != null)
    {
        dbQuery = ModIncidentService.Instance.CreateQuery()
            .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", phishing.ID, 1))
            .Select(o => o.ISP)
            .Distinct();
        if (dbQuery.ToList() != null)
        {
            lstPhishing = dbQuery.ToList().Select(o => new ModIncidentEntity
            {
                ISP = o.ISP,
                AttackOn = o.AttackOn,
                ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
            })
            .OrderByDescending(o => o.ChildNum)
            .Take(10)
            .Skip(0)
            .ToList();
        }

        lstPhishing2 = ModIncidentService.Instance.CreateQuery().WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", phishing.ID, 1)).ToList();
    }
    if (malware != null)
    {
        dbQuery = ModIncidentService.Instance.CreateQuery()
            .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", malware.ID, 1))
            .Select(o => o.ISP)
            .Distinct();
        if (dbQuery.ToList() != null)
        {
            lstMalware = dbQuery.ToList().Select(o => new ModIncidentEntity
            {
                ISP = o.ISP,
                AttackOn = o.AttackOn,
                ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
            })
            .OrderByDescending(o => o.ChildNum)
            .Take(10)
            .Skip(0)
            .ToList();
        }

        lstMalware2 = ModIncidentService.Instance.CreateQuery().WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", malware.ID, 1)).ToList();
    }
%>

<%--<script src="../../../dist/Chart.bundle.js"></script>--%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.7.2/Chart.bundle.js"></script>
<script src="/Content/js/chart/utils.js"></script>
<style>
    canvas {
        -moz-user-select: none;
        -webkit-user-select: none;
        -ms-user-select: none;
    }
</style>
<%--<script type="text/javascript" src="/Content/js/chart/Chart.min.js"></script>--%>
<%--<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>--%>
<script type="text/javascript">
    window.addEvent('domready', function () {
        new Accordion($$('div#panel-sliders.pane-sliders > .panel > h3.pane-toggler'), $$('div#panel-sliders.pane-sliders > .panel > div.pane-slider'), { onActive: function (toggler, i) { toggler.addClass('pane-toggler-down'); toggler.removeClass('pane-toggler'); i.addClass('pane-down'); i.removeClass('pane-hide'); Cookie.write('jpanesliders_panel-sliders', $$('div#panel-sliders.pane-sliders > .panel > h3').indexOf(toggler)); }, onBackground: function (toggler, i) { toggler.addClass('pane-toggler'); toggler.removeClass('pane-toggler-down'); i.addClass('pane-hide'); i.removeClass('pane-down'); if ($$('div#panel-sliders.pane-sliders > .panel > h3').length == $$('div#panel-sliders.pane-sliders > .panel > h3.pane-toggler').length) Cookie.write('jpanesliders_panel-sliders', -1); }, duration: 300, opacity: false, alwaysHide: true });
    });
</script>

<div id="element-box">
    <div class="t">
        <div class="t">
            <div class="t"></div>
        </div>
    </div>
    <div class="m">
        <div class="adminform">
            <div class="cpanel-left">

                <div id="cpanel">

                    <%--                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/ModNews/Add.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-article-add.png"
                                    alt="" />
                                <span>Thêm bài viết</span></a>
                        </div>
                    </div>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/ModNews/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-article.png" alt="" />
                                <span>Bài viết</span></a>
                        </div>
                    </div>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/SysMenu/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-category.png" alt="" />
                                <span>Chuyên mục</span></a>
                        </div>
                    </div>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/ModAdv/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-media.png" alt="" />
                                <span>Quảng cáo/Liên kết</span></a>
                        </div>
                    </div>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/ModFeedback/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-massmail.png" alt="" />
                                <span>Liên hệ</span></a>
                        </div>
                    </div>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/ModFile/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-section.png"
                                    alt="" />
                                <span>File tải lên</span></a>
                        </div>
                    </div>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/SysPage/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-menumgr.png" alt="" />
                                <span>Trang</span></a>
                        </div>
                    </div>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/SysTemplate/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-themes.png" alt="" />
                                <span>Mẫu giao diện</span></a>
                        </div>
                    </div>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/SysModule/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-plugin.png" alt="" />
                                <span>Chức năng</span></a>
                        </div>
                    </div>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/SysResource/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-language.png" alt="" />
                                <span>Tài nguyên</span></a>
                        </div>
                    </div>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/SysUser/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-user.png" alt="" />
                                <span>Người sử dụng</span></a>
                        </div>
                    </div>

                    <div class="icon-wrapper">
                        <div class="icon">
                            <a href="/{CPPath}/SysUserLog/Index.aspx">
                                <img src="/{CPPath}/Content/templates/bluestork/images/header/icon-48-user-profile.png"
                                    alt="" />
                                <span>Nhật ký đăng nhập</span></a>
                        </div>
                    </div>--%>

                    <div style="width: 200px !important; height: auto;">
                        <canvas id="deface" width="50" height="50"></canvas>
                    </div>
                    <script>
                        var ctx = document.getElementById('deface').getContext('2d');
                        var datas = [], lbls = [];
                        <%for (int i = 0; lstDeface != null && i < lstDeface.Count; i++)
                        {%>
                        datas.push('<%=lstDeface[i].ChildNum%>');
                        lbls.push('<%=lstDeface[i].ISP%>');
                        <%}%>

                        var myPieChart = new Chart(ctx, {
                            type: 'pie',
                            data: {
                                datasets: [{
                                    //data: [12, 19, 3, 5, 2, 3, 16, 13, 15, 12],
                                    data: datas,

                                    backgroundColor: [
                                        '#31c14a',
                                        '#aa3fb5',
                                        '#d5398d',
                                        '#00c164',
                                        '#ca9f42',
                                        '#345cb7',
                                        '#d53f3a',
                                        '#00bdbb',
                                        '#61c149',
                                        'rgba(255, 99, 132, 0.2)'
                                        //'rgba(54, 162, 235, 0.2)',
                                        //'rgba(255, 206, 86, 0.2)',
                                        //'rgba(75, 192, 192, 0.2)',
                                        //'rgba(153, 102, 255, 0.2)',
                                        //'rgba(255, 159, 64, 0.2)'
                                    ],
                                    borderColor: [
                                        'ffffff'
                                        //'rgba(255,99,132,1)',
                                        //'rgba(54, 162, 235, 1)',
                                        //'rgba(255, 206, 86, 1)',
                                        //'rgba(75, 192, 192, 1)',
                                        //'rgba(153, 102, 255, 1)',
                                        //'rgba(255, 159, 64, 1)'
                                    ],
                                    borderWidth: 1
                                }],

                                // These labels appear in the legend and in the tooltips when hovering different arcs
                                labels: lbls
                                //labels: [
                                //    'FPT',
                                //    'Viettel',
                                //    'VNPT',
                                //    'AZDIGI',
                                //    'ODS',
                                //    'CMC',
                                //    'NhanHoa',
                                //    'DSP',
                                //    'VNCERT',
                                //    'PAVietNam'
                                //]
                            },
                            //options: {
                            //    layout: {
                            //        padding: {
                            //            left: 50,
                            //            right: 0,
                            //            top: 0,
                            //            bottom: 0
                            //        }
                            //    }
                            //}
                            //options: {
                            //    scales: {
                            //        yAxes: [{
                            //            ticks: {
                            //                beginAtZero: true
                            //            }
                            //        }]
                            //    }
                            //}
                        });
                    </script>

                    <div style="width: 500px !important; height: auto;">
                        <canvas id="deface2" width="450" height="250"></canvas>
                    </div>
                    <script>
                        var ctx = document.getElementById('deface2').getContext('2d');
                        var datasDeface = [], datasBotnet = [], datasPhishing = [], datasMalware = [];
                        var color = Chart.helpers.color;
                        var lbls = ['T1', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'T8', 'T9', 'T10', 'T11', 'T12'];

                        <%if (lstDeface2 != null)
                        {
                            T1 = lstDeface2.Count(o => o.AttackOn.Value.Month == 1);
                            T2 = lstDeface2.Count(o => o.AttackOn.Value.Month == 2);
                            T3 = lstDeface2.Count(o => o.AttackOn.Value.Month == 3);
                            T4 = lstDeface2.Count(o => o.AttackOn.Value.Month == 4);
                            T5 = lstDeface2.Count(o => o.AttackOn.Value.Month == 5);
                            T6 = lstDeface2.Count(o => o.AttackOn.Value.Month == 6);
                            T7 = lstDeface2.Count(o => o.AttackOn.Value.Month == 7);
                            T8 = lstDeface2.Count(o => o.AttackOn.Value.Month == 8);
                            T9 = lstDeface2.Count(o => o.AttackOn.Value.Month == 9);
                            T10 = lstDeface2.Count(o => o.AttackOn.Value.Month == 10);
                            T11 = lstDeface2.Count(o => o.AttackOn.Value.Month == 11);
                            T12 = lstDeface2.Count(o => o.AttackOn.Value.Month == 12);
                            %>
                        datasDeface.push('<%=T1%>');
                        datasDeface.push('<%=T2%>');
                        datasDeface.push('<%=T3%>');
                        datasDeface.push('<%=T4%>');
                        datasDeface.push('<%=T5%>');
                        datasDeface.push('<%=T6%>');
                        datasDeface.push('<%=T7%>');
                        datasDeface.push('<%=T8%>');
                        datasDeface.push('<%=T9%>');
                        datasDeface.push('<%=T10%>');
                        datasDeface.push('<%=T11%>');
                        datasDeface.push('<%=T12%>');
                        <%}%>

                        <%if (lstBotnet2 != null)
                        {
                            T1 = lstBotnet2.Count(o => o.AttackOn.Value.Month == 1);
                            T2 = lstBotnet2.Count(o => o.AttackOn.Value.Month == 2);
                            T3 = lstBotnet2.Count(o => o.AttackOn.Value.Month == 3);
                            T4 = lstBotnet2.Count(o => o.AttackOn.Value.Month == 4);
                            T5 = lstBotnet2.Count(o => o.AttackOn.Value.Month == 5);
                            T6 = lstBotnet2.Count(o => o.AttackOn.Value.Month == 6);
                            T7 = lstBotnet2.Count(o => o.AttackOn.Value.Month == 7);
                            T8 = lstBotnet2.Count(o => o.AttackOn.Value.Month == 8);
                            T9 = lstBotnet2.Count(o => o.AttackOn.Value.Month == 9);
                            T10 = lstBotnet2.Count(o => o.AttackOn.Value.Month == 10);
                            T11 = lstBotnet2.Count(o => o.AttackOn.Value.Month == 11);
                            T12 = lstBotnet2.Count(o => o.AttackOn.Value.Month == 12);
                            %>
                        datasBotnet.push('<%=T1%>');
                        datasBotnet.push('<%=T2%>');
                        datasBotnet.push('<%=T3%>');
                        datasBotnet.push('<%=T4%>');
                        datasBotnet.push('<%=T5%>');
                        datasBotnet.push('<%=T6%>');
                        datasBotnet.push('<%=T7%>');
                        datasBotnet.push('<%=T8%>');
                        datasBotnet.push('<%=T9%>');
                        datasBotnet.push('<%=T10%>');
                        datasBotnet.push('<%=T11%>');
                        datasBotnet.push('<%=T12%>');
                        <%}%>

                        <%if (lstPhishing2 != null)
                        {
                            T1 = lstPhishing2.Count(o => o.AttackOn.Value.Month == 1);
                            T2 = lstPhishing2.Count(o => o.AttackOn.Value.Month == 2);
                            T3 = lstPhishing2.Count(o => o.AttackOn.Value.Month == 3);
                            T4 = lstPhishing2.Count(o => o.AttackOn.Value.Month == 4);
                            T5 = lstPhishing2.Count(o => o.AttackOn.Value.Month == 5);
                            T6 = lstPhishing2.Count(o => o.AttackOn.Value.Month == 6);
                            T7 = lstPhishing2.Count(o => o.AttackOn.Value.Month == 7);
                            T8 = lstPhishing2.Count(o => o.AttackOn.Value.Month == 8);
                            T9 = lstPhishing2.Count(o => o.AttackOn.Value.Month == 9);
                            T10 = lstPhishing2.Count(o => o.AttackOn.Value.Month == 10);
                            T11 = lstPhishing2.Count(o => o.AttackOn.Value.Month == 11);
                            T12 = lstPhishing2.Count(o => o.AttackOn.Value.Month == 12);
                            %>
                        datasPhishing.push('<%=T1%>');
                        datasPhishing.push('<%=T2%>');
                        datasPhishing.push('<%=T3%>');
                        datasPhishing.push('<%=T4%>');
                        datasPhishing.push('<%=T5%>');
                        datasPhishing.push('<%=T6%>');
                        datasPhishing.push('<%=T7%>');
                        datasPhishing.push('<%=T8%>');
                        datasPhishing.push('<%=T9%>');
                        datasPhishing.push('<%=T10%>');
                        datasPhishing.push('<%=T11%>');
                        datasPhishing.push('<%=T12%>');
                        <%}%>

                        <%if (lstMalware2 != null)
                        {
                            T1 = lstMalware2.Count(o => o.AttackOn.Value.Month == 1);
                            T2 = lstMalware2.Count(o => o.AttackOn.Value.Month == 2);
                            T3 = lstMalware2.Count(o => o.AttackOn.Value.Month == 3);
                            T4 = lstMalware2.Count(o => o.AttackOn.Value.Month == 4);
                            T5 = lstMalware2.Count(o => o.AttackOn.Value.Month == 5);
                            T6 = lstMalware2.Count(o => o.AttackOn.Value.Month == 6);
                            T7 = lstMalware2.Count(o => o.AttackOn.Value.Month == 7);
                            T8 = lstMalware2.Count(o => o.AttackOn.Value.Month == 8);
                            T9 = lstMalware2.Count(o => o.AttackOn.Value.Month == 9);
                            T10 = lstMalware2.Count(o => o.AttackOn.Value.Month == 10);
                            T11 = lstMalware2.Count(o => o.AttackOn.Value.Month == 11);
                            T12 = lstMalware2.Count(o => o.AttackOn.Value.Month == 12);
                            %>
                        datasMalware.push('<%=T1%>');
                        datasMalware.push('<%=T2%>');
                        datasMalware.push('<%=T3%>');
                        datasMalware.push('<%=T4%>');
                        datasMalware.push('<%=T5%>');
                        datasMalware.push('<%=T6%>');
                        datasMalware.push('<%=T7%>');
                        datasMalware.push('<%=T8%>');
                        datasMalware.push('<%=T9%>');
                        datasMalware.push('<%=T10%>');
                        datasMalware.push('<%=T11%>');
                        datasMalware.push('<%=T12%>');
                        <%}%>

                        var myPieChart = new Chart(ctx, {
                            type: 'bar',
                            data: {
                                labels: lbls,
                                datasets: [{
                                    data: datasDeface,
                                    label: 'Deface',
                                    backgroundColor: color(window.chartColors.red).alpha(0.5).rgbString(),
                                    borderColor: window.chartColors.red,
                                    borderWidth: 1,
                                },
                                {
                                    labels: lbls,
                                    data: datasPhishing,
                                    label: 'Phishing',
                                    backgroundColor: color(window.chartColors.blue).alpha(0.5).rgbString(),
                                    borderColor: window.chartColors.blue,
                                    borderWidth: 1
                                },
                                {
                                    labels: lbls,
                                    data: datasBotnet,
                                    label: 'Botnet',
                                    backgroundColor: color(window.chartColors.green).alpha(0.5).rgbString(),
                                    borderColor: window.chartColors.green,
                                    borderWidth: 1
                                },
                                {
                                    labels: lbls,
                                    data: datasMalware,
                                    label: 'Malware',
                                    backgroundColor: color(window.chartColors.orange).alpha(0.5).rgbString(),
                                    borderColor: window.chartColors.orange,
                                    borderWidth: 1
                                }]
                            },
                            options: {
                                responsive: true,
                                legend: {
                                    position: 'top',
                                },
                                title: {
                                    display: true,
                                    text: 'Biểu đồ cột sự cố'
                                },
                                //scales: {
                                //    xAxes: [{
                                //        gridLines: {
                                //            stacked: true,
                                //            offsetGridLines: true
                                //        },
                                //        //type: 'category',
                                //        labels: ['T1', 'T2', 'T3', 'T4', 'T5', 'T6', 'T7', 'T8', 'T9', 'T10', 'T11', 'T12'],
                                //    }],
                                //    yAxes: [{
                                //        stacked: true
                                //    }]
                                //}
                            }
                        });
                    </script>

                </div>

            </div>
            <div class="cpanel-right">

                <div id="panel-sliders" class="pane-sliders">

                    <% var listUserLog = CPUserLogService.Instance.CreateQuery()
                                                                                          .Take(5)
                                                                                          .OrderByDesc(o => o.ID)
                                                                                          .ToList(); %>
                    <div class="panel">
                        <h3 class="pane-toggler title" id="cpanel-panel-logged">
                            <a href="javascript:void(0);"><span>5 đăng nhập gần nhất</span></a>
                        </h3>
                        <div class="pane-slider content">
                            <table class="adminlist">
                                <thead>
                                    <tr>
                                        <th>#
                                        </th>
                                        <th>
                                            <strong>Ghi chú</strong>
                                        </th>
                                        <th>
                                            <strong>IP</strong>
                                        </th>
                                        <th>
                                            <strong>Ngày</strong>
                                        </th>
                                        <th>
                                            <strong>ID</strong>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (int i = 0; listUserLog != null && i < listUserLog.Count; i++)
                                        { %>
                                    <tr>
                                        <td>
                                            <%= listUserLog[i].getUser() != null ? listUserLog[i].getUser().LoginName : string.Empty%>
                                        </td>
                                        <td class="center">
                                            <%= listUserLog[i].Note%>
                                        </td>
                                        <td class="center">
                                            <%= listUserLog[i].IP%>
                                        </td>
                                        <td class="center">
                                            <%= string.Format("{0:dd-MM-yyyy HH:mm}", listUserLog[i].Created)%>
                                        </td>
                                        <td class="center">
                                            <%= listUserLog[i].ID%>
                                        </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <% var listNews = ModNewsService.Instance.CreateQuery()
                                                                                          .Take(5)
                                                                                          .OrderByDesc(o => o.ID)
                                                                                          .ToList(); %>
                    <div class="panel">
                        <h3 class="pane-toggler title" id="cpanel-panel-latest">
                            <a href="javascript:void(0);"><span>5 bài viết mới</span></a>
                        </h3>
                        <div class="pane-slider content">
                            <table class="adminlist">
                                <thead>
                                    <tr>
                                        <th>Tiêu đề
                                        </th>
                                        <th>
                                            <strong>Duyệt</strong>
                                        </th>
                                        <th>
                                            <strong>Xuất bản</strong>
                                        </th>
                                        <th>
                                            <strong>Chuyên mục</strong>
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <%for (int i = 0; listNews != null && i < listNews.Count; i++)
                                        { %>
                                    <tr>
                                        <td>
                                            <a href="/{CPPath}/ModNews/Add.aspx/RecordID/<%= listNews[i].ID%>/LangID/<%= listNews[i].getMenu().LangID%>"><%= listNews[i].Name%></a>
                                        </td>
                                        <td class="center">
                                            <span class="jgrid">
                                                <span class="state <%= listNews[i].Activity ? "publish" : "unpublish" %>"></span>
                                            </span>
                                        </td>
                                        <td class="center">
                                            <%= string.Format("{0:dd-MM-yyyy HH:mm}", listNews[i].Published)%>
                                        </td>
                                        <td class="center">
                                            <%= GetName(listNews[i].getMenu())%>
                                        </td>
                                    </tr>
                                    <%} %>
                                </tbody>
                            </table>
                        </div>
                    </div>

                </div>

            </div>
        </div>
        <div class="clr"></div>
    </div>
    <div class="b">
        <div class="b">
            <div class="b"></div>
        </div>
    </div>
</div>
