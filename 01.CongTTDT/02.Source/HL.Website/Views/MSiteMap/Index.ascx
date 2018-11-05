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

<form method="post" action="/" id="ctl01">
    <script type="text/javascript">
        //<![CDATA[
        var theForm = document.forms['ctl01'];
        if (!theForm) {
            theForm = document.ctl01;
        }
        function __doPostBack(eventTarget, eventArgument) {
            if (!theForm.onsubmit || (theForm.onsubmit() != false)) {
                theForm.__EVENTTARGET.value = eventTarget;
                theForm.__EVENTARGUMENT.value = eventArgument;
                theForm.submit();
            }
        }
//]]>
    </script>

    <script src="/Content/js/WebResource.js"></script>
    <script src="/Content/js/ScriptResource.js"></script>
<%--    <script src="/Content/js/MicrosoftAjax.js"></script>
    <script src="/Content/js/MicrosoftAjaxWebForms.js"></script>--%>

    <div class="row-fluid titleContainer">
        <span><%=ViewPage.CurrentPage.Name %></span>
    </div>
    <div class="row-fluid contentNews">
        <asp:TreeView CssClass="sitemap" ID="tvMap" runat="server" ImageSet="BulletedList4">
            <Nodes></Nodes>
            <NodeStyle Font-Names="Tahoma" Font-Size="12pt" ForeColor="Black" HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
            <ParentNodeStyle />
            <HoverNodeStyle Font-Underline="True" ForeColor="#FF0000" />
            <SelectedNodeStyle Font-Underline="True" ForeColor="#FF0000" HorizontalPadding="0px" VerticalPadding="0px" />
        </asp:TreeView>
    </div>
    <script type="text/javascript">
        //<![CDATA[
        var MainContent_TreeView1_ImageArray = new Array('', '', '', '/WebResource.axd?d=Vnw6Nul5Gi8dLBSg8ZsULQPMIXtxEsJcJ0e7VcUHPjcgPCb7WO7MRkyjkTVMuqNU6LBKqkGTZVMrPApkzOOtrdo-gf6mP1zVr5KByfoNyQI1&t=636668942816624236', '/WebResource.axd?d=Wt-oJLHV-dsfkxJN06L-WZF9SVhiMwyQKpp6p1F2o9Uqm-X7hgyd9f5BBW1xqRldETHQRWPo0r0G8Xj3vdVe5pnd9CjXsORiZVkNmVSwV5c1&t=636668942816624236', '/WebResource.axd?d=-n2KnhPEOy8tY2UhU96DmzTGr1yoWRpQiDr1rON4c43oGWsH4G_8nGPHBgUWLMQ70hCcOQiynSG2ZXdCpRuFceT-qWU6NC6Kbz6GTPadsjQ1&t=636668942816624236');
//]]>
    </script>


    <script type="text/javascript">
        //<![CDATA[

        WebForm_InitCallback(); var MainContent_TreeView1_Data = new Object();
        MainContent_TreeView1_Data.images = MainContent_TreeView1_ImageArray;
        MainContent_TreeView1_Data.collapseToolTip = "Collapse {0}";
        MainContent_TreeView1_Data.expandToolTip = "Expand {0}";
        MainContent_TreeView1_Data.expandState = theForm.elements['MainContent_TreeView1_ExpandState'];
        MainContent_TreeView1_Data.selectedNodeID = theForm.elements['MainContent_TreeView1_SelectedNode'];
        (function () {
            for (var i = 0; i < 6; i++) {
                var preLoad = new Image();
                if (MainContent_TreeView1_ImageArray[i].length > 0)
                    preLoad.src = MainContent_TreeView1_ImageArray[i];
            }
        })();
        MainContent_TreeView1_Data.lastIndex = 13;
        MainContent_TreeView1_Data.populateLog = theForm.elements['MainContent_TreeView1_PopulateLog'];
        MainContent_TreeView1_Data.treeViewID = 'ctl00$MainContent$TreeView1';
        MainContent_TreeView1_Data.name = 'MainContent_TreeView1_Data';
//]]>
    </script>
</form>
