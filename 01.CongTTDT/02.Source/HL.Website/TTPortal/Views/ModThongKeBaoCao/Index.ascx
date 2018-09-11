<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<% 
    var model = ViewBag.Model as ModThongKeBaoCaoModel;
    var reportByAuthor = ViewBag.ReportByAuthor as List<ReportResultLine>;
    var reportByMenuId = ViewBag.ReportByMenuId as List<ReportResultLine>;
%>

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
            <div class="pagetitle icon-48-article">
                <h2>Thống kê báo cáo</h2>
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

    <script type="text/javascript">
        document.switcher = null;
        window.addEvent('domready', function () {
            toggler = document.id('submenu');
            element = document.id('tab-document1');
            if (element) {
                document.switcher = new JSwitcher(toggler, element, { cookieName: "app1" });
            }
        });
    </script>

    <%= ShowMessage()%>

    <div id="element-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div class="m">
            <div class="submenu-box">
                <div class="submenu-pad">
                    <ul id="submenu" class="configuration">
                        <li><a id="General" class="active">BÀI VIẾT THEO TÁC GIẢ</a></li>
                        <li><a id="tab1">BÀI VIẾT THEO CHUYÊN MỤC</a></li>
                    </ul>
                    <div class="clr">
                    </div>
                </div>
            </div>
            <div class="clr">
            </div>
            <div class="clr">
            </div>
        </div>
        <div class="b">
            <div class="b">
                <div class="b"></div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        window.addEvent('domready', function () { new Accordion($$('div#content-sliders-.pane-sliders > .panel > h3.pane-toggler'), $$('div#content-sliders-.pane-sliders > .panel > div.pane-slider'), { onActive: function (toggler, i) { toggler.addClass('pane-toggler-down'); toggler.removeClass('pane-toggler'); i.addClass('pane-down'); i.removeClass('pane-hide'); Cookie.write('jpanesliders_content-sliders-', $$('div#content-sliders-.pane-sliders > .panel > h3').indexOf(toggler)); }, onBackground: function (toggler, i) { toggler.addClass('pane-toggler'); toggler.removeClass('pane-toggler-down'); i.addClass('pane-hide'); i.removeClass('pane-down'); if ($$('div#content-sliders-.pane-sliders > .panel > h3').length == $$('div#content-sliders-.pane-sliders > .panel > h3.pane-toggler').length) Cookie.write('jpanesliders_content-sliders-', -1); }, duration: 300, opacity: false, alwaysHide: true }); });
    </script>

    <div id="element-box">
        <div class="t">
            <div class="t">
                <div class="t"></div>
            </div>
        </div>
        <div id="tab-document1" class="col width-100">
            <div id="page-General" class="tab">
                <div class="m">
                    <div class="col width-100">
                        <table class="adminlist" cellspacing="1">
                            <thead>
                                <tr>
                                    <th width="20%" style="text-align: left">Tên tác giả</th>
                                    <th width="2%">Số lượng bài viết</th>
                                    <th width="2%">Số lượt xem</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (int i = 0; reportByAuthor != null && i < reportByAuthor.Count; i++) %>
                                <%{ %>
                                <tr class="row<%= i%2 %>">
                                    <td><%= GetName(reportByAuthor[i].getUser()) %></td>
                                    <td align="center"><%= reportByAuthor[i].NewsNumber %></td>
                                    <td align="center"><%= reportByAuthor[i].ViewNumber %></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
                    </div>
                    <div class="clr"></div>
                </div>
                <div class="clr"></div>
            </div>
            <div id="page-tab1" class="tab">
                <div class="m">
                    <div class="col width-100">
                        <table class="adminlist" cellspacing="1">
                            <thead>
                                <tr>
                                    <th width="20%" style="text-align: left">Tên chuyên mục</th>
                                    <th width="2%">Số lượng bài viết</th>
                                    <th width="2%">Số lượt xem</th>
                                </tr>
                            </thead>
                            <tbody>
                                <%for (int i = 0; reportByMenuId != null && i < reportByMenuId.Count; i++) %>
                                <%{ %>
                                <tr class="row<%= i%2 %>">
                                    <td><%= GetName(reportByMenuId[i].getMenu()) %></td>
                                    <td align="center"><%= reportByMenuId[i].NewsNumber %></td>
                                    <td align="center"><%= reportByMenuId[i].ViewNumber %></td>
                                </tr>
                                <%}%>
                            </tbody>
                        </table>
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
    </div>
</form>
