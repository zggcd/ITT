using HL.Lib.Models;
using HL.Lib.MVC;

namespace HL.Lib.Controllers
{
    public class CContentController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Default[NewsID-true|LayoutView-true|Title-true]")]
        public string LayoutDefine;

        [HL.Core.MVC.PropertyInfo("Tin bài")]
        public int NewsID = 0;

        [HL.Core.MVC.PropertyInfo("Tiêu đề")]
        public string Title;

        //[HL.Core.MVC.PropertyInfo("View")]
        public string LayoutView = string.Empty;

        public override void OnLoad()
        {
            if (!string.IsNullOrEmpty(LayoutView))
                RenderView(LayoutView);

            ViewBag.Data = ModNewsService.Instance.CreateQuery()
                .Where(o => o.ID == NewsID)
                .ToSingle();

            ViewBag.Title = Title;
        }
    }
}
