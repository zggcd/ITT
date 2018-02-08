using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class MSearchController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 20;

        public void ActionIndex(MSearchModel model)
        {
            var dbQuery = ModNewsService.Instance.CreateQuery()
                    .Where(o => o.Activity == true)
                    .Where(!string.IsNullOrEmpty(model.Keyword), o => o.Name.Contains(model.Keyword))
                    .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("News", 0, ViewPage.CurrentLang.ID))
                    .OrderByDesc(o => o.Order)
                    .Take(PageSize)
                    .Skip(PageSize * model.Page);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            model.PageSize = PageSize;
            ViewBag.Model = model;
        }
    }

    public class MSearchModel
    {
        private int _Page = 0;
        public int Page
        {
            get { return _Page; }
            set { _Page = value - 1; }
        }

        public int TotalRecord { get; set; }
        public int PageSize { get; set; }

        public string Keyword { get; set; }
    }
}
