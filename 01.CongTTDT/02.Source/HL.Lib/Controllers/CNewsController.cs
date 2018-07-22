using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class CNewsController : Controller
    {
        [HL.Core.MVC.PropertyInfo("HaiChuyenMuc[MenuID-true|Title-true|MenuID2-true|Title2-true|PageSize-true|State-true]," +
            "HomeCarousel[MenuID-true|Title-false|MenuID2-false|Title2-false|PageSize-true|State-true]," +
            "Hot[MenuID-true|Title-false|MenuID2-false|Title2-false|PageSize-false|State-true]," +
            "MotChuyenMuc[MenuID-true|Title-true|MenuID2-false|Title2-false|PageSize-true|State-true]," +
            "MultiMedia[MenuID-true|Title-true|MenuID2-false|Title2-false|PageSize-true|State-true]")]
        public string LayoutDefine;

        [HL.Core.MVC.PropertyInfo("Chuyên mục 1", "Type|News")]
        public int MenuID;

        [HL.Core.MVC.PropertyInfo("Tiêu đề 1")]
        public string Title;

        [HL.Core.MVC.PropertyInfo("Chuyên mục 2", "Type|News")]
        public int MenuID2;

        [HL.Core.MVC.PropertyInfo("Tiêu đề 2")]
        public string Title2;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 5;

        [HL.Core.MVC.PropertyInfo("Vị trí", "ConfigKey|Mod.NewsState")]
        public int State;

        public override void OnLoad()
        {
            ViewBag.Data = ModNewsService.Instance.CreateQuery()
                .Where(o => o.Activity == true)
                .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("News", MenuID, ViewPage.CurrentLang.ID))
                .Where(State > 0, o => (o.State & State) == State)
                .OrderByDesc(o => o.Order)
                .Take(PageSize)
                .ToList();

            ViewBag.Data2 = ModNewsService.Instance.CreateQuery()
                .Where(o => o.Activity == true)
                .WhereIn(MenuID2 > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("News", MenuID2, ViewPage.CurrentLang.ID))
                .Where(State > 0, o => (o.State & State) == State)
                .OrderByDesc(o => o.Order)
                .Take(PageSize)
                .ToList();

            ViewBag.HotNews = ModNewsService.Instance.CreateQuery()
                .Where(o => o.Activity == true)
                .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("News", MenuID, ViewPage.CurrentLang.ID))
                .Where(State > 0, o => (o.State & State) == State)
                .OrderByDesc(o => o.Order)
                .Take(PageSize)
                .ToSingle();

            ViewBag.Title = Title;
            ViewBag.Title2 = Title2;

            SysPageEntity page1 = SysPageService.Instance.CreateQuery().Where(o => o.MenuID == MenuID).ToSingle();
            if (page1 != null) ViewBag.Url1 = ViewPage.GetPageURL(page1);
            SysPageEntity page2 = SysPageService.Instance.CreateQuery().Where(o => o.MenuID == MenuID2).ToSingle();
            if (page2 != null) ViewBag.Url2 = ViewPage.GetPageURL(page2);

            ViewBag.Video = ModVideoService.Instance.CreateQuery()
                .Where(o => o.Activity == true)
                //.Where(State > 0, o => (o.State & State) == State)
                //.WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("Video", MenuID, ViewPage.CurrentLang.ID))
                .OrderByDesc(o => o.Order)
                .Take(4)
                .ToList_Cache();

            ViewBag.Album = ModAlbumService.Instance.CreateQuery()
                .Where(o => o.Activity == true)
                .OrderByDesc(o => o.Order)
                .Take(4)
                .ToList_Cache();
        }
    }
}
