using System;

using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class CImportLogsController : Controller
    {

        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|ImportLogs")]
        public int MenuID;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        [HL.Core.MVC.PropertyInfo("Tiêu đề")]
        public string Title;

        public override void OnLoad()
        {
            ViewBag.Data = ModImportLogsService.Instance.CreateQuery()
                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("ImportLogs", MenuID, ViewPage.CurrentLang.ID))
                            .OrderByDesc(o => o.ID)
                            .Take(PageSize)
                            .ToList_Cache();

            ViewBag.Title = Title;
        }
    }
}
