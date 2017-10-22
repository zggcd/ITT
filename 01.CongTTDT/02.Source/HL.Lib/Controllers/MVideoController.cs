using System;

using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class MVideoController : Controller
    {

        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|Video")]
        public int MenuID;

        //[HL.Core.MVC.PropertyInfo("Vị trí", "ConfigKey|Mod.VideoState")]
        public int State;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        public void ActionIndex(MVideoModel model)
        {
            if (ViewPage.CurrentPage.MenuID > 0)
                MenuID = ViewPage.CurrentPage.MenuID;

            var dbQuery = ModVideoService.Instance.CreateQuery()
                            .Where(o => o.Activity == true)
                            .Where(State > 0, o => (o.State & State) == State)
                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("Video", MenuID, ViewPage.CurrentLang.ID))
                            .OrderByDesc(o => o.Order)
                            .Take(PageSize)
                            .Skip(PageSize * model.Page);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            model.PageSize = PageSize;
            ViewBag.Model = model;
        }

        public void ActionDetail(string endCode)
        {
            var entity = ModVideoService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.Code == endCode)
                            //.WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("Video", MenuID, ViewPage.CurrentLang.ID))
                            .ToSingle();

            if (entity != null)
            {
                MDuThaoModel model = new MDuThaoModel();
                model.PageSize = PageSize;
                string[] str = ((HL.Core.MVC.ViewPage)(ViewPage)).ReturnPath.Replace("%2fPage%2f", "&").Split('&');
                if (str.Length == 2)
                    model.Page = HL.Core.Global.Convert.ToInt(str[1], 0);

                var dbQuery = ModVideoService.Instance.CreateQuery()
                    .Where(o => o.Activity == true)
                    .Where(o => o.Order < entity.Order)
                    .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("Video", MenuID, ViewPage.CurrentLang.ID))
                    .OrderByDesc(o => o.Order)
                    .Take(PageSize)
                    .Skip(PageSize * model.Page);

                ViewBag.Other = dbQuery.ToList();
                model.TotalRecord = dbQuery.TotalRecord;
                model.PageSize = PageSize;
                ViewBag.Model = model;

                ViewBag.Data = entity;
                SetObject["view.Meta"] = entity;
            }
            else
            {
                ViewPage.Error404();
            }
        }
    }

    public class MVideoModel
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
