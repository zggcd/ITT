using System;
using HL.Lib.Models;
using System.Text;
using HL.Lib.MVC;

namespace HL.Lib.Global
{
    public class Sitemap
    {
        public static string Domain = HL.Core.Global.Config.GetValue("Sys.Domain").ToString();
        public static string PageExt = HL.Core.Global.Config.GetValue("Sys.PageExt").ToString();
        public static string UpdateSitemap(string type)
        {
            string sMes = string.Empty, sXML = string.Empty;

            string path = HL.Core.Global.Application.BaseDirectory + "sitemap.xml";
            try
            {
                if (type == "Create")
                {
                    //lay tat ca noi dung
                    sXML = "<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\">";
                    sXML += getXML(0, 0, 0);
                    sXML += "</urlset>";
                    //
                    File.WriteText(path, sXML, false);
                    sMes = "Tạo mới thành công !";
                }
                else if (type == "Update")
                {
                    sXML = File.ReadText(path);
                    if (sXML == string.Empty) sMes = "Nội dung trống , bạn cần tạo mới trước khi update !";
                    //lay noi dung cap nhat
                    int sP = HL.Core.Global.Convert.ToInt(WebSettingService.Instance.getValueOrCreateDefault("MaxPageSiteMap", "0"));
                    int sN = HL.Core.Global.Convert.ToInt(WebSettingService.Instance.getValueOrCreateDefault("MaxNewsSiteMap", "0"));
                    int sT = HL.Core.Global.Convert.ToInt(WebSettingService.Instance.getValueOrCreateDefault("MaxTagSiteMap", "0"));
                    string sUpdate = getXML(sP, sN, sT);
                    //
                    int last = sXML.IndexOf("</urlset>");
                    sXML = sXML.Insert(last, sUpdate);
                    File.WriteText(path, sXML, false);
                    sMes = "Update thành công !";
                }
            }
            catch (Exception ex)
            {
                sMes = "Sitemap Err : " + ex.Message;
                Error.Write(sMes);
            }
            return sMes;
        }
        public static string getXML(int sP, int sN, int sT)
        {
            StringBuilder sb = new StringBuilder();
            var listP = SysPageService.Instance.CreateQuery().Where(o => o.Activity == true && o.ParentID != 0)
                .Where(sP > 0, o => o.ID > sP)
                .ToList();
            if (listP != null && listP.Count > 0)
            {
                for (int i = 0; listP != null && i < listP.Count; i++)
                {
                    //string url = Domain + (listP[i].Code == "/" ? "" : listP[i].Code + PageExt);
                    string url = Domain + new ViewPage().GetPageURL(listP[i]) + PageExt;
                    //string changefreq = listP[i].Code == "/" ? "daily" : "weekly";
                    string priority = listP[i].Items.GetValue("Priority").ToString();
                    if (priority == string.Empty) priority = listP[i].Code == "/" ? "1.0" : "0.6";
                    sb.Append("<url><loc>" + url + "</loc>");
                    sb.Append("<lastmod>" + string.Format("{0:yyyy-MM-dd}", DateTime.Now) + "</lastmod>");
                    sb.Append("<changefreq>daily</changefreq>"); //always;hourly;daily;weekly;monthly;yearly;never
                    sb.Append("<priority>" + priority + "</priority>");
                    sb.Append("</url>");
                }
                sP = listP[listP.Count - 1].ID;
                WebSettingService.Instance.Update("MaxPageSiteMap", sP.ToString());
            }
            //news
            var listN = ModNewsService.Instance.CreateQuery().Where(o => o.Activity == true)
                .Where(sN > 0, o => o.ID > sN)
                .ToList();
            if (listN != null && listN.Count > 0)
            {
                for (int i = 0; i < listN.Count; i++)
                {
                    //string url = listN[i].GetURL();
                    //if (url == string.Empty) continue;
                    //url = Domain + url + ".html";
                    var page = SysPageService.Instance.CreateQuery().Where(o => o.MenuID == listN[i].MenuID).ToSingle();
                    var urlPart = "";
                    if (page != null)
                    {
                        urlPart = new ViewPage().GetURL(listN[i].MenuID, listN[i].Code);
                    }
                    else
                    {
                        urlPart = new ViewPage().GetURL(listN[i].Code);
                    }
                    string url = Domain + urlPart + PageExt;
                    sb.Append("<url><loc>" + url + "</loc>");
                    sb.Append("<lastmod>" + string.Format("{0:yyyy-MM-dd}", listN[i].Published) + "</lastmod>");
                    sb.Append("<changefreq>weekly</changefreq>"); //always;hourly;daily;weekly;monthly;yearly;never
                    sb.Append("<priority>0.2</priority>");
                    sb.Append("</url>");
                }
                sN = listN[listN.Count - 1].ID;
                WebSettingService.Instance.Update("MaxNewsSiteMap", sN.ToString());
            }
            return sb.ToString();
        }
    }
}
