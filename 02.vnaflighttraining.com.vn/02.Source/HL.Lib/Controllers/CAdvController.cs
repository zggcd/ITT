using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class CAdvController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|Adv")]
        public int MenuID;

        public override void OnLoad()
        {
            ViewBag.Data = ModAdvService.Instance.CreateQuery()
                .Where(o => o.Activity == true && o.MenuID == MenuID)
                .OrderByAsc(o => o.Order)
                .ToList_Cache();
        }
    }
}
