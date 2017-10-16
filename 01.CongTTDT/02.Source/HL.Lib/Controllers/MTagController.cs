using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class MTagController : Controller
    {

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        public void ActionDetail(string tagCode)
        {
            MTagModel model = new MTagModel();

            TryUpdateModel(model);

            ModTagEntity _Tag = ModTagService.Instance.GetByCode(tagCode);

            if (_Tag != null)
            {
                var dbQuery = ModNewsService.Instance.CreateQuery()
                                    .Where(o => o.Activity == true)
                                    .WhereIn(o => o.ID, ModNewsTagService.Instance.CreateQuery()
                                                            .Select(o => o.NewsID)
                                                            .Where(o => o.TagID == _Tag.ID)
                                            )
                                    .OrderByDesc(o => o.ID)
                                    .Take(PageSize)
                                    .Skip(PageSize * model.Page);

                ViewBag.Data = dbQuery.ToList();
                model.TotalRecord = dbQuery.TotalRecord;
            }
            else
            {
                ViewPage.Response.Redirect("~/");
                return;
            }

            ViewBag.Model = model;
            ViewBag.Tag = _Tag;
        }

        public override void OnUnLoad()
        {
            if (ViewBag.Tag != null && ViewBag.Tag is ModTagEntity)
            {
                var tag = ViewBag.Tag as ModTagEntity;

                ViewPage.SetTitle(!string.IsNullOrEmpty(tag.Title) ? tag.Title : tag.Name);

                if (!string.IsNullOrEmpty(tag.Description))
                    ViewPage.SetMetaDescription(tag.Description);

                if (!string.IsNullOrEmpty(tag.Keywords))
                    ViewPage.SetMetaKeywords(tag.Keywords);
            }

            base.OnUnLoad();
        }
    }

    public class MTagModel
    {
        private int _Page = 0;
        public int Page
        {
            get { return _Page; }
            set { _Page = value - 1; }
        }

        public int PageSize { get; set; }
        public int TotalRecord { get; set; }
    }
}
