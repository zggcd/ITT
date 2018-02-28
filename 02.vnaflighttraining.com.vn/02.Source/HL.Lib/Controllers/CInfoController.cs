using System;
using System.Linq;
using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class CInfoController : Controller
    {
        [HL.Core.MVC.PropertyInfo("ChangePass[Title-false]," +
            "Info[Title-false]," +
            "Login[Title-false]," +
            "Register[Title-false]," +
            "ResetPass[Title-false]")]
        public string LayoutDefine;

        //[HL.Core.MVC.PropertyInfo("Bài viết")]
        //public int NewsID;

        //[HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|News")]
        //public int MenuID;

        //[HL.Core.MVC.PropertyInfo("Vị trí", "ConfigKey|Mod.NewsState")]
        //public int State;

        //[HL.Core.MVC.PropertyInfo("Số lượng")]
        //public int PageSize = 5;

        [HL.Core.MVC.PropertyInfo("Tiêu đề")]
        public string Title;

        public override void OnLoad()
        {
        }

        public void ActionLoginPOST(MLoginModel model)
        {
            
        }
    }
}
