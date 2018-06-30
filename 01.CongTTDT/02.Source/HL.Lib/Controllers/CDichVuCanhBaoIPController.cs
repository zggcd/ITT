using System;

using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class CDichVuCanhBaoIPController : Controller
    {

        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|DichVuCanhBaoIP")]
        public int MenuID;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        [HL.Core.MVC.PropertyInfo("Tiêu đề")]
        public string Title;

        public override void OnLoad()
        {
            ViewBag.Data = ModDichVuCanhBaoIPService.Instance.CreateQuery()
                            .Where(o => o.Activity == true)
                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("DichVuCanhBaoIP", MenuID, ViewPage.CurrentLang.ID))
                            .OrderByDesc(o => o.Order)
                            .Take(PageSize)
                            .ToList_Cache();

            ViewBag.Title = Title;
        }
    }
}
