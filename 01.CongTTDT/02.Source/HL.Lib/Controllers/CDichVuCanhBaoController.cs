using System;

using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class CDichVuCanhBaoController : Controller
    {

        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|DichVuCanhBao")]
        public int MenuID;

        [HL.Core.MVC.PropertyInfo("Vị trí", "ConfigKey|Mod.DichVuCanhBaoState")]
        public int State;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        [HL.Core.MVC.PropertyInfo("Tiêu đề")]
        public string Title;

        public override void OnLoad()
        {
            ViewBag.Data = ModDichVuCanhBaoService.Instance.CreateQuery()
                            .Where(o => o.Activity == true)
                            .Where(State > 0, o => (o.State & State) == State)
                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("DichVuCanhBao", MenuID, ViewPage.CurrentLang.ID))
                            .OrderByDesc(o => o.Order)
                            .Take(PageSize)
                            .ToList_Cache();

            ViewBag.Title = Title;
        }
    }
}
