using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class MContentTempController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Tin bài")]
        public int NewsID = 0;

        //[HL.Core.MVC.PropertyInfo("View")]
        public string LayoutView = string.Empty;

        public void ActionIndex()
        {
            if (!string.IsNullOrEmpty(LayoutView))
                RenderView(LayoutView);

            ViewBag.Data = ModNewsService.Instance.CreateQuery()
                .Where(o => o.ID == NewsID)
                .ToSingle();
        }
    }
}
