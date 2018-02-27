using HL.Lib.MVC;

namespace HL.Lib.Controllers
{
    public class CStaticController : Controller
    {
        [HL.Core.MVC.PropertyInfo("ThoiTiet[MenuID-true]")]
        public string LayoutDefine;
    }
}
