using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class CNewsController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Hot[MenuID-true|PageSize-true|Title-true]")]
        public string LayoutDefine;

        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|News")]
        public int MenuID;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 5;

        [HL.Core.MVC.PropertyInfo("Tiêu đề")]
        public string Title;

        [HL.Core.MVC.PropertyInfo("Vị trí", "ConfigKey|Mod.NewsState")]
        public int State;

        public override void OnLoad()
        {
            ViewBag.Data = ModNewsService.Instance.CreateQuery()
                .Where(o => o.Activity == true)
                .Where(State > 0, o => (o.State & State) == State)
                .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("News", MenuID, ViewPage.CurrentLang.ID))
                .OrderByDesc(o => o.Order)
                .Take(PageSize)
                .ToList_Cache();

            ViewBag.Title = Title;
        }
    }
}
