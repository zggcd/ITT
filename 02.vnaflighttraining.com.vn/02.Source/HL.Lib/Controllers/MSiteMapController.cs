using HL.Lib.MVC;

namespace HL.Lib.Controllers
{
    public class MSiteMapController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Trang")]
        public int PageID;

        public void ActionIndex()
        {
            ViewBag.PageID = PageID;
        }
    }
}
