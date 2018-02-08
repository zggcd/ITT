using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class CFeedbackController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Tiêu đề")]
        public string Title;

        [HL.Core.MVC.PropertyInfo("Tin bài")]
        public int NewsID = 0;

        public override void OnLoad()
        {
            ViewBag.Detail = ModNewsService.Instance.CreateQuery()
                .Where(o => o.ID == NewsID)
                .ToSingle();

            ViewBag.Title = Title;
        }
    }
}
