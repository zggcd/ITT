using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class CAdvController : Controller
    {
        [HL.Core.MVC.PropertyInfo("BoxMarquee[Title-true|MenuID-true|Title1-false|MenuID2-false|Title2-false|MenuID3-false|Title3-false]," +
            "LienKet1ChuyenMuc[Title-true|MenuID-true|Title1-false|MenuID2-false|Title2-false|MenuID3-false|Title3-false]," +
            "LienKet3ChuyenMuc[Title-true|MenuID-true|Title-true|MenuID2-true|Title2-true|MenuID3-true|Title3-true]," +
            "Logo[Title-false|MenuID-true|Title-false|MenuID2-false|Title2-false|MenuID3-false|Title3-false]," +
            "SlideHome[Title-false|MenuID-false|Title-false|MenuID2-false|Title2-false|MenuID3-false|Title3-false]")]
        public string LayoutDefine;

        [HL.Core.MVC.PropertyInfo("Tiêu đề chính")]
        public string Title;

        [HL.Core.MVC.PropertyInfo("Chuyên mục 1", "Type|Adv")]
        public int MenuID;

        [HL.Core.MVC.PropertyInfo("Tiêu đề 1")]
        public string Title1;

        [HL.Core.MVC.PropertyInfo("Chuyên mục 2", "Type|Adv")]
        public int MenuID2;

        [HL.Core.MVC.PropertyInfo("Tiêu đề 2")]
        public string Title2;

        [HL.Core.MVC.PropertyInfo("Chuyên mục 3", "Type|Adv")]
        public int MenuID3;

        [HL.Core.MVC.PropertyInfo("Tiêu đề 3")]
        public string Title3;

        public override void OnLoad()
        {
            ViewBag.Data = ModAdvService.Instance.CreateQuery()
                .Where(o => o.Activity == true && o.MenuID == MenuID)
                .OrderByAsc(o => o.Order)
                .ToList_Cache();

            ViewBag.Data2 = ModAdvService.Instance.CreateQuery()
                .Where(o => o.Activity == true && o.MenuID == MenuID2)
                .OrderByAsc(o => o.Order)
                .ToList_Cache();

            ViewBag.Data3 = ModAdvService.Instance.CreateQuery()
                .Where(o => o.Activity == true && o.MenuID == MenuID3)
                .OrderByAsc(o => o.Order)
                .ToList_Cache();

            ViewBag.Title = Title;
            ViewBag.Title1 = Title1;
            ViewBag.Title2 = Title2;
            ViewBag.Title3 = Title3;
        }
    }
}
