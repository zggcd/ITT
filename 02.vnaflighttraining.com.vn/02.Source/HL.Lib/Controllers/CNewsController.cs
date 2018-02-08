using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class CNewsController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|News")]
        public int MenuID;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 5;

        [HL.Core.MVC.PropertyInfo("Tiêu đề")]
        public string Title;

        public override void OnLoad()
        {
            ViewBag.Data = ModNewsService.Instance.CreateQuery()
                .Where(o => o.Activity == true)
                .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("News", MenuID, ViewPage.CurrentLang.ID))
                .OrderByDesc(o => o.Order)
                .Take(PageSize)
                .ToList_Cache();

            ViewBag.Title = Title;
        }
    }
}
