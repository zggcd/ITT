<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%
    var item = ViewBag.Data as CPUserEntity ?? new CPUserEntity();
%>

<div class="columns-max" id="main-content" role="main">
    <div class="portlet-layout">
        <div class="portlet-column portlet-column-only" id="column-1">
            <div id="p_p_id_58_" class="portlet-boundary portlet-boundary_58_ portlet-static portlet-static-end portlet-login ">
                <div class="portlet-body">
                    <section class="portlet" id="portlet_58">
                        <header class="portlet-topper">
                            <h1 class="portlet-title"><span class="portlet-title-text"><%=ViewPage.CurrentPage.Name %></span></h1>
                        </header>
                        <div class="portlet-content">
                            <div class=" portlet-content-container" style="">
                                <div class="portlet-body">
                                    <%if (!HL.Lib.Global.CPLogin.IsLogin())
                                        {%>
                                    <form action="{ActionForm}" class="aui-form  yui3-widget aui-form-validator aui-form-validator-content" method="post">
                                        <%--<div class="portlet-msg-error">Xác thực không thành công xin kiểm tra lại tên đăng nhập và mật khẩu </div>--%>
                                        <div class="BoxLogin">
                                            <span class="aui-field aui-field-text aui-form-validator-valid-container" id="aui_3_4_0_1_356">
                                                <span class="aui-field-content" id="aui_3_4_0_1_355">
                                                    <label class="aui-field-label" for="LoginName">Người dùng </label>
                                                    <span class="aui-field-element " id="aui_3_4_0_1_354">
                                                        <input class="aui-field-input aui-field-input-text aui-text-placeholder aui-form-validator-valid" id="LoginName" name="LoginName" placeholder="Đăng nhập" value="<%=item.LoginName %>" aria-required="true" type="text">
                                                    </span>
                                                </span>
                                            </span>
                                            <span class="aui-field aui-field-text">
                                                <span class="aui-field-content">
                                                    <label class="aui-field-label" for="Password">Mật khẩu </label>
                                                    <span class="aui-field-element ">
                                                        <input class="aui-field-input aui-field-input-text aui-text-placeholder" id="Password" name="Password" placeholder="Mật khẩu" value="<%=item.Password %>" aria-required="true" type="password">
                                                    </span>
                                                </span>
                                            </span>
                                            <span class="aui-field aui-field-choice"><span class="aui-field-content">
                                                <span class="aui-field-element aui-field-label-right">
                                                    <input class="aui-field-input aui-field-input-choice" id="chkDuyTriDN" name="chkDuyTriDN" onclick="" value="true" type="checkbox">
                                                </span>
                                                <label class="aui-field-label" for="chkDuyTriDN">Duy trì đăng nhập </label>
                                            </span>
                                            </span>
                                            <div class="aui-button-holder ">
                                                <span class="aui-button aui-button-submit">
                                                    <span class="aui-button-content">
                                                        <input class="aui-button-input aui-button-input-submit" name="_hl_action[Login]" value="Đăng nhập" type="submit">
                                                    </span>
                                                </span>
                                            </div>
                                        </div>
                                    </form>
                                    <%}
                                        else
                                        {%>
                                    <p>Bạn đã đăng nhập thành công!</p>
                                    <%}%>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
    </div>
</div>
<input type="hidden" value="<%= Utils.GetMapPage(ViewPage.CurrentPage, "", "")%>" id="TpmBreadCrumbs" />
<script>
    $(document).ready(function () {
        $('#AutoGenBreadcrumbs').after($('#TpmBreadCrumbs').val());
    });
</script>
