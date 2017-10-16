using HL.Lib.MVC;

namespace HL.Lib.Controllers
{
    public class MSiteMapTempController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Trang")]
        public int PageID;

        public void ActionIndex()
        {
            ViewBag.PageID = PageID;
        }
    }
}
