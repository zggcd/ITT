<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%
    var item = ViewBag.Data as CPUserEntity ?? new CPUserEntity();
%>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HL.Lib.Global.CPLogin.IsLoginOnWeb())
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
    <div class="row">
        <div class="col-md-3">&nbsp;</div>
        <div class="col-md-6">
            <form method="post" action="{ActionForm}" name="">
                <div class="form-group">
                    <label for="LoginName">Tên truy cập: <span style="color: red">*</span></label>
                    <input type="text" class="form-control" id="LoginName" name="LoginName" placeholder="Tên truy cập" value="<%=item.LoginName %>">
                </div>
                <div class="form-group">
                    <label for="Password">Mật khẩu: <span style="color: red">*</span></label>
                    <input type="password" class="form-control" id="Password" name="Password" placeholder="Mật khẩu" value="<%=item.Password %>">
                </div>

                <input class="btn btn-success" name="_hl_action[Login]" value="Đăng nhập" type="submit" />
                &nbsp;&nbsp;&nbsp;&nbsp;<a href="/vn/Thanh-vien/Dang-ky.aspx">Đăng ký >></a>

            </form>
        </div>
        <div class="col-md-3">&nbsp;</div>
    </div>
</div>
