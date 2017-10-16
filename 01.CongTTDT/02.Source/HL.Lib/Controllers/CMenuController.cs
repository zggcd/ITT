using HL.Lib.MVC;
using HL.Lib.Models;
using System.Web.UI.WebControls;
using System.Collections.Generic;

namespace HL.Lib.Controllers
{
    public class CMenuController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Left[PageID-true]," +
            "Left2[PageID-true]," +
            "TopLeft[PageID-true]," +
            "TopRight[PageID-true]")]
        public string LayoutDefine;

        [HL.Core.MVC.PropertyInfo("Trang")]
        public int PageID;

        [HL.Core.MVC.PropertyInfo("Ẩn các trang con")]
        public int HiddenChid = 0;

        public override void OnLoad()
        {
            SysPageEntity _Page = SysPageService.Instance.GetByID_Cache(PageID);

            if (_Page != null)
            {
                ViewBag.Data = SysPageService.Instance.GetByParent_Cache(_Page.ID);
                ViewBag.Page = _Page;

                List<WebMenuEntity> list = WebMenuService.Instance.CreateQuery()
                                        .Where(o => o.ParentID == 0 && o.LangID == ViewPage.CurrentLang.ID && o.Type == "VBLinhVuc")
                                        .OrderByAsc(o => o.Order)
                                        .ToList_Cache();
                int _parent_id = list[0].ID;
                ViewBag.LinhVuc = WebMenuService.Instance.CreateQuery()
                        .Where(o => o.ParentID == _parent_id)
                        .OrderByAsc(o => o.Order)
                        .ToList_Cache();
                //ViewBag.LinhVuc = HL.Lib.Global.ListItem.List.GetList(WebMenuService.Instance, ViewPage.CurrentLang.ID, "VBLinhVuc");

                list = WebMenuService.Instance.CreateQuery()
                                        .Where(o => o.ParentID == 0 && o.LangID == ViewPage.CurrentLang.ID && o.Type == "VBCoQuan")
                                        .OrderByAsc(o => o.Order)
                                        .ToList_Cache();
                _parent_id = list[0].ID;
                ViewBag.CoQuan = WebMenuService.Instance.CreateQuery()
                        .Where(o => o.ParentID == _parent_id)
                        .OrderByAsc(o => o.Order)
                        .ToList_Cache();

                list = WebMenuService.Instance.CreateQuery()
                                        .Where(o => o.ParentID == 0 && o.LangID == ViewPage.CurrentLang.ID && o.Type == "VBHinhThuc")
                                        .OrderByAsc(o => o.Order)
                                        .ToList_Cache();
                _parent_id = list[0].ID;
                ViewBag.HinhThuc = WebMenuService.Instance.CreateQuery()
                        .Where(o => o.ParentID == _parent_id)
                        .OrderByAsc(o => o.Order)
                        .ToList_Cache();

                ViewBag.HiddenChid = HiddenChid;
            }
        }
    }
}
