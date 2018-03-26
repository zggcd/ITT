using System;

using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class CRSSController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|RSS")]
        public int MenuID;

        [HL.Core.MVC.PropertyInfo("Trang hiển thị", "Type|Page")]
        public int PageID;

        [HL.Core.MVC.PropertyInfo("Vị trí", "ConfigKey|Mod.RSSState")]
        public int State;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 5;

        [HL.Core.MVC.PropertyInfo("Tiêu đề")]
        public string Title;

        public override void OnLoad()
        {
            //string sLM = WebMenuService.Instance.GetChildIDForWeb_Cache("RSS", MenuID, ViewPage.CurrentLang.ID);
            //if (!string.IsNullOrEmpty(sLM))
            //{
            //    ViewBag.Data = ModRSSService.Instance
            //        .CreateQuery()
            //        .OrderByDesc(o => o.ID)
            //        .Where(State > 0, o => (o.State & State) == State)
            //        .WhereIn(MenuID > 0, o => o.MenuID, sLM)
            //        .Take(PageSize)
            //        .ToList_Cache();
            //}
            ViewBag.Data = WebMenuService.Instance.GetByParentID(MenuID);
            ViewBag.Title = Title;
            ViewBag.PageID = PageID;

            if (ViewPage.CurrentPage.MenuID > 0)
                MenuID = ViewPage.CurrentPage.MenuID;
            string sLM = WebMenuService.Instance.GetChildIDForWeb_Cache("RSS", MenuID, ViewPage.CurrentLang.ID);
            if (!string.IsNullOrEmpty(sLM))
            {
                ViewBag.Data2 = ModRSSService.Instance
                    .CreateQuery()
                    .Where(o => o.Activity == true)
                    .OrderByDesc(o => o.State)
                    .OrderByDesc(o => o.ID)
                    .Where(State > 0, o => (o.State & State) == State)
                    .WhereIn(MenuID > 0, o => o.MenuID, sLM)
                    .Take(PageSize)
                    .ToList_Cache();
                var p = SysPageService.Instance.GetByMenuID_Cache(MenuID);
                if (p != null) ViewBag.URL = ViewPage.GetPageURL(p);
                ViewBag.MenuID = MenuID;
            }

            ViewBag.PageSize = PageSize;
        }
    }
}
