<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<script runat="server">

    public void GenMap(TreeView tv, int pageID)
    {
        List<SysPageEntity> listPage = SysPageService.Instance.CreateQuery()
            .Where(o => o.ParentID == pageID)
            .ToList_Cache();

        for (int i = 0; listPage != null && i < listPage.Count; i++)
        {
            TreeNode _tn = new TreeNode(listPage[i].Name);
            _tn.NavigateUrl = ViewPage.GetPageURL(listPage[i]);

            tv.Nodes.Add(_tn);

            GenMap(_tn, listPage[i].ID);
        }
    }

    public void GenMap(TreeNode tn, int pageID)
    {
        List<SysPageEntity> listPage = SysPageService.Instance.CreateQuery()
            .Where(o => o.ParentID == pageID)
            .ToList_Cache();

        for (int i = 0; listPage != null && i < listPage.Count; i++)
        {
            TreeNode _tn = new TreeNode(listPage[i].Name);

            _tn.NavigateUrl = ViewPage.GetPageURL(listPage[i]);

            tn.ChildNodes.Add(_tn);

            GenMap(_tn, listPage[i].ID);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        var PageID = ViewBag.PageID;
        GenMap(tvMap, PageID);
    }

</script>

<style type="text/css">
    .sitemap {
        text-align: left;
        padding-left: 10px;
        width: 10px;
    }

        .sitemap table {
            text-align: left;
        }
</style>

<div class="container-fluid">
    <nav class="breadcrumb">
        <a class="breadcrumb-item" href="/">{RS:Web_HOME}</a>
        <%= Utils.GetMapPage(ViewPage.CurrentPage, "", "breadcrumb-item")%>
    </nav>
    <asp:TreeView CssClass="sitemap" ID="tvMap" runat="server" ImageSet="BulletedList4">
        <Nodes></Nodes>
        <NodeStyle Font-Names="Tahoma" Font-Size="12pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
        <ParentNodeStyle />
        <HoverNodeStyle Font-Underline="True" ForeColor="#FF0000" />
        <SelectedNodeStyle Font-Underline="True" ForeColor="#FF0000" HorizontalPadding="0px" VerticalPadding="0px" />
    </asp:TreeView>
</div>
