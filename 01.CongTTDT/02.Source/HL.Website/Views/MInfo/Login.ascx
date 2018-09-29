<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%
    var item = ViewBag.Data as CPUserEntity ?? new CPUserEntity();
%>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        if (HL.Lib.Global.CPLogin.IsLoginOnWeb())
        {
            int langId = ViewPage.CurrentPage.LangID;
            string infoUrl = "/vn/Thanh-vien/Thong-tin-ca-nhan.aspx";
            if (langId == 2)
            {
                infoUrl = "/en/Member/Info.aspx";
            }

            Response.Redirect(infoUrl);
            return;
        }
    }
</script>

<%
    int langId = ViewPage.CurrentPage.LangID;
    string registerUrl = "/vn/Thanh-vien/Dang-ky.aspx";
    if (langId == 2)
    {
        registerUrl = "/en/Member/Register.aspx";
    }
%>
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
                &nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=registerUrl %>">Đăng ký >></a>

            </form>
        </div>
        <div class="col-md-3">&nbsp;</div>
    </div>
</div>
