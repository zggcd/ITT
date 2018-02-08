using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class CMenuController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Trang")]
        public int PageID;

        public override void OnLoad()
        {
            SysPageEntity _Page = SysPageService.Instance.GetByID_Cache(PageID);

            if (_Page != null)
            {
                ViewBag.Data = SysPageService.Instance.GetByParent_Cache(_Page.ID);
                ViewBag.Page = _Page;
            }
        }
    }
}
