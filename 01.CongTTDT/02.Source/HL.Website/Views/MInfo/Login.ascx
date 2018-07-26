<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%
    var item = ViewBag.Data as CPUserEntity ?? new CPUserEntity();
%>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HL.Lib.Global.CPLogin.IsLogin())
        {
            Response.Redirect("/vn/Thanh-vien/Thong-tin-ca-nhan.aspx");
            return;
        }
    }
</script>

<div class="row-fluid titleContainer">
    <span>Đăng nhập</span>
</div>
<div class="contentNews">
    <form method="post" action="{ActionForm}" name="">
        <div>
            <span class="name">Tên truy nhập:</span>
            <div class="input">
                <input name="LoginName" maxlength="255" id="LoginName" class="" type="text" value="<%=item.LoginName %>">
            </div>

            <span class="name">Mật khẩu:</span>
            <div class="input">
                <input name="Password" maxlength="255" id="Password" class="" type="password" value="<%=item.Password %>">
            </div>
        </div>

        <div class="button">
            <input class="btn_action search icon QAcustom" name="_hl_action[Login]" value="Đăng nhập" type="submit" />
            <a href="/vn/Thanh-vien/Dang-ky.aspx">Đăng ký >></a>
        </div>
    </form>
</div>
