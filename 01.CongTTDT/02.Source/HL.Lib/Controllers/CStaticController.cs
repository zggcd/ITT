using HL.Lib.MVC;

namespace HL.Lib.Controllers
{
    public class CStaticController : Controller
    {
        public override void OnLoad()
        {
            ViewBag.Online = HL.Lib.Global.Utils.GetCountOnline();
            ViewBag.TruyCapNgay = HL.Lib.Global.Utils.GetCountVisitToday();
            ViewBag.TruyCapThang = HL.Lib.Global.Utils.GetCountVisitMonth();
            ViewBag.TruyCapNam = HL.Lib.Global.Utils.GetCountVisitYear();
            ViewBag.TruyCapTong = HL.Lib.Global.Utils.GetCountVisit();
        }
    }
}
