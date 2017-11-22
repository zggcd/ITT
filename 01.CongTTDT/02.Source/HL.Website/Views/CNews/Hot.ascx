<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<%
    var item = ViewBag.HotNews as ModNewsEntity;
%>

<div class="news-hot">
    <%if (item != null)
        {
            string url = ViewPage.GetURL(item.MenuID, item.Code);
            List<HL.Lib.Global.ListItem.Item> listStatus = HL.Lib.Global.ListItem.List.GetListByConfigkey("Mod.NewsState");
            int c1 = listStatus != null ? listStatus.Count : 0;

            TimeSpan ts = DateTime.Now - item.Published;
            int numDate = (int)(ts.TotalDays);
    %>
    <a href="<%=url %>">
        <%if (!string.IsNullOrEmpty(item.File))
            {%>
        <img src="<%=item.File.Replace("~/", "/") %>" alt="<%=item.Name %>" />
        <%} %>
    </a>
    <h3 class="title">
        <a href="<%=url %>" class=""><%=item.Name %>
            <%bool flag = false;
                for (int j = 0; j < c1; j++)
                {
                    if ((item.State & HL.Core.Global.Convert.ToInt(listStatus[j].Value)) == HL.Core.Global.Convert.ToInt(listStatus[j].Value))
                    {
                        flag = true;
                        break;
                    }
                }
                if (flag == true)
                {%>
            <img src='/Content2/style/images/new_icon.gif' style='width: 35px; height: 20px; float: none; margin: 0px' />
            <%}%>
            <span class="time-pst">
                <%if (numDate == 0)
                    {%>Hôm nay<%}
                                  else
                                  {
                                      string dv = "ngày";
                                      int r = numDate;
                                      int t = numDate / 30;
                                      if (t > 0)
                                      {
                                          r = t;
                                          dv = "tháng";
                                      }%>
                <span style="color: #898989;"><%=r %> <%=dv %> trước</span>
                <%} %>
            </span>
        </a>
    </h3>
    <div class="desc">
        <p style="text-align: justify;">
            <%=item.Summary %>
        </p>
    </div>
    <%} %>
</div>
