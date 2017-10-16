using System;
using System.Web;

namespace HL.Lib.Global
{
    public class Application
    {
        public static void OnError()
        {
            //lay loi tu server
            Exception ex = HttpContext.Current.Server.GetLastError();

            if (Setting.Mod_WriteError)
            {
                //ghi lai loi
                if (ex.InnerException != null)
                    HL.Lib.Global.Error.Write(ex.InnerException);
                else
                    HL.Lib.Global.Error.Write(ex);
            }

            //chay che do release
            if (!HL.Core.Global.Application.Debug)
            {
                //khong hien ra loi
                HttpContext.Current.Server.ClearError();

                //trang hien tai la webpage
                //HL.Lib.MVC.ViewPage _WebPage = HL.Core.Web.Application.CurrentViewPage as HL.Lib.MVC.ViewPage;
                //if (_WebPage != null)
                //{
                //    if (_WebPage.CurrentSite != null 
                //        && _WebPage.CurrentPage != null)
                //    {
                //        // loi xay ra khong phai trang chu
                //        if (_WebPage.CurrentSite.PageID != _WebPage.CurrentPage.ID)
                //        {
                //            HttpContext.Current.Response.Redirect("~/");
                //            return;
                //        }
                //    }
                //}

                //thong bao loi
                HttpContext.Current.Response.Clear();
                HttpContext.Current.Response.StatusCode = 500;
                HttpContext.Current.Response.Write(Global.File.ReadText(HttpContext.Current.Server.MapPath("~/Views/HttpError/500.html")));
                HttpContext.Current.Response.End();
            }
        }
    }
}
