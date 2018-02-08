<%@ Page Language="C#" AutoEventWireup="true" %>

<script runat="server">
    protected void Page_Load(object sender, EventArgs e)
    {
        string sMes = string.Empty;
        string type = Request["Type"].ToString();
        if (!CPLogin.IsLogin())
            sMes = "Vui lòng đăng nhập !";
        else sMes = HL.Lib.Global.Sitemap.UpdateSitemap(type);
        Response.Clear();
        Response.Write("<center><h1>" + sMes + "</h1><br /><a href=\"/sitemap.xml\" rel=\"nofollow\">Sitemap<a></center>");
    }
</script>
