using HL.Lib.MVC;

namespace HL.Lib.Controllers
{
    public class CTextController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Chọn văn bản")]
        public string Text;

        public override void OnLoad()
        {
            if (!string.IsNullOrEmpty(Text))
                ViewBag.Text = Global.Data.Base64Decode(Text);
            else
                ViewBag.Text = string.Empty;
        }
    }
}
