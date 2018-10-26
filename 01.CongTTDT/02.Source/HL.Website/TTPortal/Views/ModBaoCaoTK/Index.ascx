<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<%
    var model = ViewBag.Model as ModIncidentModel;
    var listEntity = ViewBag.Data as List<ModIncidentEntity>;
    var c0 = listEntity != null ? listEntity.Count : 0;
%>

<link rel="stylesheet" type="text/css" href="/Content/css/jquery.datetimepicker.css" />
<script src="/Content/js/datetime/jquery.js"></script>

<form id="hlForm" name="hlForm" method="post">

    <input type="hidden" id="_hl_action" name="_hl_action" />
    <input type="hidden" id="boxchecked" name="boxchecked" value="0" />

    <div id="toolbar-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="toolbar-list" id="toolbar">
                <ul style="float: left; padding-right: 15px;">
                    <li id="toolbar-apply" class="button">
                        <a class="toolbar" href="<%=CPViewPage.Request.RawUrl.Replace("Index.aspx","Export.aspx") %>">
                            <span title="Xuất Excel" class="icon-32-fileexport"></span>Xuất File</a>
                    </li>
                </ul>
                <%=GetListCommand("cancel|Đóng")%>
            </div>
            <div class="pagetitle icon-48-generic">
                <h2>Báo cáo thống kê sự cố</h2>
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

    <style>
        .gr {
            padding-left: 10px;
        }
    </style>

    <script type="text/javascript">
        var HLController = 'ModBaoCaoTK';

        var HLArrVar = [
            'filter_state', 'State',
            'filter_menu', 'MenuID',
            'filter_lang', 'LangID',
            'limit', 'PageSize',

            'filter_isp', 'ISPState',
            'filter_domain', 'DomainState',
            'filter_virus', 'VirusState',
            'filter_member', 'MemberID',
            'filter_from', 'From',
            'filter_to', 'To',
            'filter_khoangthoigian', 'KhoangThoiGian'
        ];

        var HLArrVar_QS = [
            'filter_search', 'SearchText'
        ];

        var HLArrQT = [
                      '<%= model.PageIndex + 1 %>', 'PageIndex', 
                      '<%= model.Sort %>', 'Sort'
        ];

        var HLArrDefault =
            [
                '1', 'PageIndex',
                '1', 'LangID',
                '20', 'PageSize'
            ];
    </script>

    <%= ShowMessage()%>

    <div id="element-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">

            <table>
                <tr>
                    <td width="100%">
                        <%--<span>Lọc:</span>
                        <input type="text" id="filter_search" value="<%= model.SearchText %>" class="text_area" onchange="HLRedirect();return false;" />
                        <button onclick="HLRedirect();return false;">Tìm kiếm</button>--%>
                        <span>Thống kê theo khoảng thời gian: </span>
                        <input type="text" value="<%=model.KhoangThoiGian %>" id="filter_khoangthoigian" name="KhoangThoiGian" style="display: none;" />
                        <input type="radio" name="KhoangThoiGian1" value="1" <%if (model.KhoangThoiGian == 1)
                            {%>checked<%} %>
                            onchange="javascript: if (this.checked) { $('#filter_khoangthoigian').val($(this).val());}" />
                        1 tháng
                            <input type="radio" name="KhoangThoiGian1" value="3" <%if (model.KhoangThoiGian == 3)
                                {%>checked<%} %>
                                onchange="javascript: if (this.checked) { $('#filter_khoangthoigian').val($(this).val());}" />
                        3 tháng
                            <input type="radio" name="KhoangThoiGian1" value="6" <%if (model.KhoangThoiGian == 6)
                                {%>checked<%} %>
                                onchange="javascript: if (this.checked) { $('#filter_khoangthoigian').val($(this).val());}" />
                        6 tháng
                            <input type="radio" name="KhoangThoiGian1" value="12" <%if (model.KhoangThoiGian == 12)
                                {%>checked<%} %>
                                onchange="javascript: if (this.checked) { $('#filter_khoangthoigian').val($(this).val());}" />
                        12 tháng
                            &nbsp;&nbsp;&nbsp;&nbsp;

                            <span>Từ ngày:</span>
                        <input type="text" id="filter_from" name="From" value="<%=string.Format("{0:dd-MM-yyyy}",  model.From) %>" class="text_area" />
                        <span>Đến ngày:</span>
                        <input type="text" id="filter_to" name="To" value="<%=string.Format("{0:dd-MM-yyyy}",  model.To) %>" class="text_area" />
                        <button onclick="HLRedirect();return false;">Xem</button>

                        <%--<span class="gr">Thành viên:</span>
                            <select id="filter_member" onchange="HLRedirect()" class="inputbox" size="1">
                                <option value="0">(Tất cả)</option>
                            </select>--%>

                        <%--<p>
                            <span>ISP bị tấn công:</span>
                            <select id="filter_isp" onchange="HLRedirect()" class="inputbox" size="1">
                                <option value="0">(Tất cả)</option>
                                <%= Utils.ShowDDLByConfigkey("Mod.CommonState", model.ISPState)%>
                            </select>

                            <span class="gr">Domain bị tấn công:</span>
                            <select id="filter_domain" onchange="HLRedirect()" class="inputbox" size="1">
                                <option value="0">(Tất cả)</option>
                                <%= Utils.ShowDDLByConfigkey("Mod.CommonState", model.DomainState)%>
                            </select>

                            <span class="gr">Virus xuất hiện:</span>
                            <select id="filter_virus" onchange="HLRedirect()" class="inputbox" size="1">
                                <option value="0">(Tất cả)</option>
                                <%= Utils.ShowDDLByConfigkey("Mod.CommonState", model.VirusState)%>
                            </select>
                        </p>--%>
                    </td>
                    <td nowrap="nowrap">
                        <%--<span>Loại sự cố:</span>
                        <select id="filter_menu" onchange="HLRedirect()" class="inputbox" size="1">
                            <option value="0">(Tất cả)</option>
                            <%= Utils.ShowDDLMenuByType2("Incident", model.LangID, model.MenuID)%>
                        </select>--%>
                        <%--Vị trí :
                       <select id="filter_state" onchange="HLRedirect()" class="inputbox" size="1">
                           <option value="0">(Tất cả)</option>
                           <%= Utils.ShowDDLByConfigkey("Mod.IncidentState", model.State)%>
                       </select>--%>
                        <span>Ngôn ngữ:</span><%= ShowDDLLang(model.LangID)%>
                    </td>
                </tr>
                <%-- <tr>
                    <td width="100%">
                        <button onclick="HLRedirect();return false;">Tìm kiếm</button>
                    </td>
                </tr>--%>
            </table>

            <%
                string menuType = "Deface";
                int menuId = 0;
                WebMenuEntity menu = null;
                List<ModIncidentEntity> defaces = new List<ModIncidentEntity>();
                List<ModIncidentEntity> phishings = new List<ModIncidentEntity>();
                List<ModIncidentEntity> malwares = new List<ModIncidentEntity>();
                menu = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Code == menuType).ToSingle();
                menuId = menu != null ? menu.ID : 0;

                if (listEntity != null) defaces = listEntity.Where(o => o.MenuID == menuId).ToList();

                menuType = "Phishing";
                menuId = 0;
                menu = null;
                menu = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Code == menuType).ToSingle();
                menuId = menu != null ? menu.ID : 0;

                if (listEntity != null) phishings = listEntity.Where(o => o.MenuID == menuId).ToList();

                menuType = "Malware";
                menuId = 0;
                menu = null;
                menu = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Code == menuType).ToSingle();
                menuId = menu != null ? menu.ID : 0;

                if (listEntity != null) malwares = listEntity.Where(o => o.MenuID == menuId).ToList();
            %>
            <p></p>
            <h2 style="text-align: center;">Thống kê từ ngày <%=string.Format("{0:dd/MM/yyyy}", model.From) %> đến ngày <%=string.Format("{0:dd/MM/yyyy}", model.To) %></h2>
            <table class="adminlist" cellspacing="1">
                <thead>
                    <tr>
                        <th width="5%" nowrap="nowrap">Thống kê</th>
                        <th width="5%" nowrap="nowrap">Phishing</th>
                        <th width="5%" nowrap="nowrap">Deface</th>
                        <th width="5%" nowrap="nowrap">Malware</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td align="center">Tổng số</td>
                        <td align="center"><%=phishings.Count %></td>
                        <td align="center"><%=defaces.Count %></td>
                        <td align="center"><%=malwares.Count %></td>
                    </tr>
                    <tr>
                        <td align="center">Đã cảnh báo</td>
                        <td align="center">0</td>
                        <td align="center">0</td>
                        <td align="center">0</td>
                    </tr>
                    <tr>
                        <td align="center">Đã khắc phục</td>
                        <td align="center"><%=phishings.Where(o => o.Resolve == true).ToList().Count %></td>
                        <td align="center"><%=defaces.Where(o => o.Resolve == true).ToList().Count %></td>
                        <td align="center"><%=malwares.Where(o => o.Resolve == true).ToList().Count %></td>
                    </tr>
                    <tr>
                        <td align="center">Còn tồn tại</td>
                        <td align="center"><%=phishings.Where(o => o.Resolve == false).ToList().Count %></td>
                        <td align="center"><%=defaces.Where(o => o.Resolve == false).ToList().Count %></td>
                        <td align="center"><%=malwares.Where(o => o.Resolve == false).ToList().Count %></td>
                    </tr>
                </tbody>
            </table>

            <%
                int deface_govCount = 0,
                    deface_eduCount = 0,
                    deface_comCount = 0,
                    deface_netCount = 0,
                    deface_vnCount = 0,
                    deface_comVnCount = 0,
                    deface_govVnCount = 0,
                    deface_eduVnCount = 0;
                int phishing_govCount = 0,
                    phishing_eduCount = 0,
                    phishing_comCount = 0,
                    phishing_netCount = 0,
                    phishing_vnCount = 0,
                    phishing_comVnCount = 0,
                    phishing_govVnCount = 0,
                    phishing_eduVnCount = 0;
                int malware_govCount = 0,
                    malware_eduCount = 0,
                    malware_comCount = 0,
                    malware_netCount = 0,
                    malware_vnCount = 0,
                    malware_comVnCount = 0,
                    malware_govVnCount = 0,
                    malware_eduVnCount = 0;
                int idx = 0;
                for (int i = 0; i < defaces.Count; i++)
                {
                    Uri uri = new Uri(defaces[i].Name);
                    string host = uri.Host; string pathAndQuery = uri.PathAndQuery;

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".com.vn"));
                    if (idx == 0)
                    {
                        deface_comVnCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".gov.vn"));
                    if (idx == 0)
                    {
                        deface_govVnCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".edu.vn"));
                    if (idx == 0)
                    {
                        deface_eduVnCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".gov"));
                    if (idx == 0)
                    {
                        deface_govCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".edu"));
                    if (idx == 0)
                    {
                        deface_eduCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".com"));
                    if (idx == 0)
                    {
                        deface_comCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".net"));
                    if (idx == 0)
                    {
                        deface_netCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".vn"));
                    if (idx == 0)
                    {
                        deface_vnCount++;
                        continue;
                    }
                }

                for (int i = 0; i < phishings.Count; i++)
                {
                    Uri uri = new Uri(phishings[i].Name);
                    string host = uri.Host; string pathAndQuery = uri.PathAndQuery;

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".com.vn"));
                    if (idx == 0)
                    {
                        phishing_comVnCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".gov.vn"));
                    if (idx == 0)
                    {
                        phishing_govVnCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".edu.vn"));
                    if (idx == 0)
                    {
                        phishing_eduVnCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".gov"));
                    if (idx == 0)
                    {
                        phishing_govCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".edu"));
                    if (idx == 0)
                    {
                        phishing_eduCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".com"));
                    if (idx == 0)
                    {
                        phishing_comCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".net"));
                    if (idx == 0)
                    {
                        phishing_netCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".vn"));
                    if (idx == 0)
                    {
                        phishing_vnCount++;
                        continue;
                    }
                }

                for (int i = 0; i < malwares.Count; i++)
                {
                    Uri uri = new Uri(malwares[i].Name);
                    string host = uri.Host; string pathAndQuery = uri.PathAndQuery;

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".com.vn"));
                    if (idx == 0)
                    {
                        malware_comVnCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".gov.vn"));
                    if (idx == 0)
                    {
                        malware_govVnCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".edu.vn"));
                    if (idx == 0)
                    {
                        malware_eduVnCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".gov"));
                    if (idx == 0)
                    {
                        malware_govCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".edu"));
                    if (idx == 0)
                    {
                        malware_eduCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".com"));
                    if (idx == 0)
                    {
                        malware_comCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".net"));
                    if (idx == 0)
                    {
                        malware_netCount++;
                        continue;
                    }

                    idx = Utils.Reverse(host).IndexOf(Utils.Reverse(".vn"));
                    if (idx == 0)
                    {
                        malware_vnCount++;
                        continue;
                    }
                }

                int deface_khacCount = defaces.Count() - (deface_govCount +
                    deface_eduCount +
                    deface_comCount +
                    deface_netCount +
                    deface_vnCount +
                    deface_comVnCount +
                    deface_govVnCount +
                    deface_eduVnCount);

                int phishing_khacCount = phishings.Count() - (phishing_govCount +
                    phishing_eduCount +
                    phishing_comCount +
                    phishing_netCount +
                    phishing_vnCount +
                    phishing_comVnCount +
                    phishing_govVnCount +
                    phishing_eduVnCount);

                int malware_khacCount = malwares.Count() - (malware_govCount +
                    malware_eduCount +
                    malware_comCount +
                    malware_netCount +
                    malware_vnCount +
                    malware_comVnCount +
                    malware_govVnCount +
                    malware_eduVnCount);
            %>
            <p></p>
            <h2 style="text-align: center;">Thống kê tên miền từ ngày <%=string.Format("{0:dd/MM/yyyy}", model.From) %> đến ngày <%=string.Format("{0:dd/MM/yyyy}", model.To) %></h2>
            <table class="adminlist" cellspacing="1">
                <thead>
                    <tr>
                        <th width="5%" nowrap="nowrap">Tên miền</th>
                        <th width="5%" nowrap="nowrap">Phishing</th>
                        <th width="5%" nowrap="nowrap">Deface</th>
                        <th width="5%" nowrap="nowrap">Malware</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td align="center">.gov</td>
                        <td align="center"><%=phishing_govCount %></td>
                        <td align="center"><%=deface_govCount %></td>
                        <td align="center"><%=malware_govCount %></td>
                    </tr>
                    <tr>
                        <td align="center">.edu</td>
                        <td align="center"><%=phishing_eduCount %></td>
                        <td align="center"><%=deface_eduCount %></td>
                        <td align="center"><%=malware_eduCount %></td>
                    </tr>
                    <tr>
                        <td align="center">.com</td>
                        <td align="center"><%=phishing_comCount %></td>
                        <td align="center"><%=deface_comCount %></td>
                        <td align="center"><%=malware_comCount %></td>
                    </tr>
                    <tr>
                        <td align="center">.net</td>
                        <td align="center"><%=phishing_netCount %></td>
                        <td align="center"><%=deface_netCount %></td>
                        <td align="center"><%=malware_netCount %></td>
                    </tr>
                    <tr>
                        <td align="center">.vn</td>
                        <td align="center"><%=phishing_vnCount %></td>
                        <td align="center"><%=deface_vnCount %></td>
                        <td align="center"><%=malware_vnCount %></td>
                    </tr>
                    <tr>
                        <td align="center">.com.vn</td>
                        <td align="center"><%=phishing_comVnCount %></td>
                        <td align="center"><%=deface_comVnCount %></td>
                        <td align="center"><%=malware_comVnCount %></td>
                    </tr>
                    <tr>
                        <td align="center">.gov.vn</td>
                        <td align="center"><%=phishing_govVnCount %></td>
                        <td align="center"><%=deface_govVnCount %></td>
                        <td align="center"><%=malware_govVnCount %></td>
                    </tr>
                    <tr>
                        <td align="center">.edu.vn</td>
                        <td align="center"><%=phishing_eduVnCount %></td>
                        <td align="center"><%=deface_eduVnCount %></td>
                        <td align="center"><%=malware_eduVnCount %></td>
                    </tr>
                    <tr>
                        <td align="center">Khác</td>
                        <td align="center"><%=deface_khacCount %></td>
                        <td align="center"><%=phishing_khacCount %></td>
                        <td align="center"><%=malware_khacCount %></td>
                    </tr>
                </tbody>
            </table>

            <%
                var a = phishings.GroupBy(o => o.ISP)
                    .Select(g => new
                    {
                        ISP = g.Key,
                        Count = g.Select(gg => gg.ISP).ToList().Count
                    })
                    .ToList();

                var b = defaces.GroupBy(o => o.ISP)
                    .Select(g => new
                    {
                        ISP = g.Key,
                        Count = g.Select(gg => gg.ISP).ToList().Count
                    })
                    .ToList();

                var c = malwares.GroupBy(o => o.ISP)
                    .Select(g => new
                    {
                        ISP = g.Key,
                        Count = g.Select(gg => gg.ISP).ToList().Count
                    })
                    .ToList();

                int ca = a.Count, cb = b.Count, cc = c.Count;
                int c1 = ca > cb ? (ca > cc ? ca : cb > cc ? cb : cc) : (cb > cc ? cb : ca > cc ? ca : cc);
            %>
            <p></p>
            <h2 style="text-align: center;">Top 20 ISP từ ngày <%=string.Format("{0:dd/MM/yyyy}", model.From) %> đến ngày <%=string.Format("{0:dd/MM/yyyy}", model.To) %></h2>
            <table class="adminlist" cellspacing="1">
                <thead>
                    <tr>
                        <th width="5%" nowrap="nowrap">Phishing</th>
                        <th width="5%" nowrap="nowrap">Deface</th>
                        <th width="5%" nowrap="nowrap">Malware</th>
                    </tr>
                </thead>
                <tbody>
                    <%for (int i = 0; i < c1; i++)
                        {%>
                    <tr>
                        <td align="center">
                            <%if (i < ca)
                                {%><%=a[i].ISP %> (<%=a[i].Count %>)<%}
                        else
                        {%>0<%} %>
                        </td>
                        <td align="center">
                            <%if (i < cb)
                                {%><%=b[i].ISP %> (<%=b[i].Count %>)<%}
                        else
                        {%>0<%} %>
                        </td>
                        <td align="center">
                            <%if (i < cc)
                                {%><%=c[i].ISP %> (<%=c[i].Count %>)<%}
                        else
                        {%>0<%} %>
                        </td>
                    </tr>
                    <%} %>
                </tbody>
            </table>

            <%--<p></p>
            <h2 style="text-align: center;">Top 20 từ ngày 04/01/2012 đến ngày 04/02/2012</h2>
            <table class="adminlist" cellspacing="1">
                <thead>
                    <tr>
                        <th width="5%" nowrap="nowrap">Phishing - Targets</th>
                        <th width="5%" nowrap="nowrap">Deface - Sites</th>
                        <th width="5%" nowrap="nowrap">Malware - Virus</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td align="center">0</td>
                        <td align="center">0</td>
                        <td align="center">0</td>
                    </tr>
                    <tr>
                        <td align="center">0</td>
                        <td align="center">0</td>
                        <td align="center">0</td>
                    </tr>
                    <tr>
                        <td align="center">0</td>
                        <td align="center">0</td>
                        <td align="center">0</td>
                    </tr>
                    <tr>
                        <td align="center">0</td>
                        <td align="center">0</td>
                        <td align="center">0</td>
                    </tr>
                </tbody>
            </table>--%>

            <%--            <table class="adminlist" cellspacing="1">
                <thead>
                    <tr>
                        <th width="1%">#</th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("PID", "ID")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("Loại sự cố", "MenuID")%>
                        </th>
                        <th width="10%" nowrap="nowrap">
                            <%= GetSortLink("Domain/URL", "Path")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("IP", "IP")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("ISP", "ISP")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("Tên Virus", "MalwareName")%>
                        </th>
                        <th width="5%" nowrap="nowrap">
                            <%= GetSortLink("Thời gian", "AttackOn")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Tồn tại", "Resolve")%>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <span>Tần suất</span>
                        </th>
                        <th width="1%" nowrap="nowrap">
                            <%= GetSortLink("Lần gửi", "EmailNo")%>
                        </th>
                    </tr>
                </thead>
                <tfoot>
                    <tr>
                        <td colspan="15">
                            <del class="container">
                                <%= GetPagination(model.PageIndex, model.PageSize, model.TotalRecord)%>
                            </del>
                        </td>
                    </tr>
                </tfoot>
                <tbody>
                    <%int c = 0;
                        for (int i = 0; listEntity != null && i < listEntity.Count; i++)
                        {
                            c = 0;
                            var listChild = ModIncidentService.Instance.CreateQuery().Where(o => o.ParentID == listEntity[i].ID).ToList();
                            if (listChild != null) c = listChild.Count;
                    %>
                    <tr class="row<%= i%2 %> openchild" id="p_<%=i %>">
                        <td align="center">
                            <%= i + 1%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ID%>
                        </td>
                        <td align="center">
                            <%= GetName(listEntity[i].getMenu()) %>
                        </td>
                        <td align="center">
                            <%if (c > 0)
                                {%>
                            <span style="float: left; font-weight: bold; color: blue;">&or;</span>
                            <%} %>
                            <%= listEntity[i].Path%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].IP%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].ISP%>
                        </td>
                        <td align="center">
                            <%= listEntity[i].MalwareName%>
                        </td>
                        <td align="center">
                            <%= string.Format("{0:dd/MM/yyyy HH:mm}", listEntity[i].AttackOn) %>
                        </td>
                        <td align="center">
                            <%= GetPublish(listEntity[i].ID, listEntity[i].Resolve)%>
                        </td>
                        <td align="center">99</td>
                        <td align="right">
                            <%= string.Format("{0:#,##0}", listEntity[i].EmailNo)%>
                        </td>
                    </tr>
                    <%if (c > 0)
                        {%>
                    <tr class="row<%= i%2 %>" id="c_<%=i %>" style="display: none;" data-child="<%=listEntity[i].ID %>">
                        <td colspan="12">
                            <table class="adminlist" cellspacing="1" style="border: 1px solid blue;">
                                <%for (int j = 0; listChild != null && j < listChild.Count; j++)
                                    {
                                %>
                                <tr class="row<%= i%2 %>">
                                    <td align="center">
                                        <%= j + 1%>
                                    </td>
                                    <td align="center">
                                        <%= GetCheckbox(listChild[j].ID, j)%>
                                    </td>
                                    <td align="center">
                                        <%= listChild[j].ID%>
                                    </td>
                                    <td align="center">
                                        <%= GetName(listChild[j].getMenu()) %>
                                    </td>
                                    <td align="center">
                                        <%= listChild[j].Path%>
                                    </td>
                                    <td align="center">
                                        <%= listChild[j].IP%>
                                    </td>
                                    <td align="center">
                                        <%= listChild[j].ISP%>
                                    </td>
                                    <td align="center">
                                        <%= listChild[j].MalwareName%>
                                    </td>
                                    <td align="center">
                                        <%= string.Format("{0:dd/MM/yyyy HH:mm}", listChild[j].AttackOn) %>
                                    </td>
                                    <td align="center">
                                        <%= GetPublish(listChild[j].ID, listChild[j].Resolve)%>
                                    </td>
                                    <td align="center">
                                        <a href="javascript:HLRedirect('SendMail', <%= listChild[j].ID %>)" title="Gửi email cảnh báo tới đơn vị bị sự cố">
                                            <img src="/{CPPath}/Content/add/img/email.png" />
                                        </a>
                                    </td>
                                    <td align="right">
                                        <%= string.Format("{0:#,##0}", listChild[j].EmailNo)%>
                                    </td>
                                    <td align="center">
                                        <%= GetPublish(listChild[j].ID, listChild[j].Activity)%>
                                    </td>
                                </tr>
                                <%} %>
                            </table>
                        </td>
                    </tr>
                    <%} %>
                    <%} %>
                </tbody>
            </table>--%>

            <div class="clr"></div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>

</form>

<script src="/Content/js/datetime/jquery.datetimepicker.js"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $('.openchild').click(function () {
            var child = $(this).next()[0];
            var isShow = child.style.display;
            if (isShow && isShow == 'none') {
                child.style.display = 'table-row';
            } else if (isShow == 'table-row') {
                child.style.display = 'none';
            }
        });
    });

    $('#filter_from, #filter_to').datetimepicker({
        onGenerate: function (ct) {
            $(this).find('.xdsoft_date')
                .toggleClass('xdsoft_disabled');
        },
        minDate: '-2-01-1970',
        maxDate: '+2-01-1970',
        timepicker: false,
        format: 'd-m-Y',
        formatDate: 'Y-m-d',
    });
</script>
