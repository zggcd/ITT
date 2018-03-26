using System;

using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class MRSSController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|RSS")]
        public int MenuID;

        [HL.Core.MVC.PropertyInfo("Vị trí", "ConfigKey|Mod.RSSState")]
        public int State;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 5;

        [HL.Core.MVC.PropertyInfo("Tiêu đề")]
        public string Title;

        public void ActionIndex(MRSSModel model)
        {
            if (ViewPage.CurrentPage.MenuID > 0)
            {
                MenuID = ViewPage.CurrentPage.MenuID;
            }
            var dbQuery = ModRSSService.Instance
                .CreateQuery()
                .Where(o => o.Activity == true)
                .Where(State > 0, o => (o.State & State) == State)
                .WhereIn(MenuID > 0, o => o.MenuID,
                    WebMenuService.Instance.GetChildIDForWeb_Cache("RSS", MenuID, ViewPage.CurrentLang.ID))
                .OrderByDesc(o => o.State)
                .OrderByDesc(o => o.Published)
                .Take(PageSize)
                .Skip(PageSize * model.Page);


            //if (ViewPage.CurrentPage.MenuID > 0)
            //{
            //    MenuID = ViewPage.CurrentPage.MenuID;
            //}
            //var dbQuery = ModRSSService.Instance.CreateQuery().Where(o => o.MenuID == MenuID)
            //        .Where(State > 0, o => (o.State & State) == State)
            //        .OrderByDesc(o => o.ID)
            //        .Take(PageSize)
            //        .Skip(PageSize * model.Page);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            model.PageSize = PageSize;
            ViewBag.Model = model;

            ViewBag.Title = Title;
        }

        public void ActionDetail(string endCode)
        {
            if (ViewPage.CurrentPage.MenuID > 0)
                MenuID = ViewPage.CurrentPage.MenuID;

            //string slist = WebMenuService.Instance.GetChildIDForWeb_Cache("RSS", MenuID, ViewPage.CurrentLang.ID);
            var entity = ModRSSService.Instance.CreateQuery().Where(o => (o.Activity == true && o.Code == endCode)).ToSingle();
            if (entity != null)
            {
                var model = new MRSSModel();
                model.PageSize = PageSize;
                string[] str = ((HL.Core.MVC.ViewPage)(ViewPage)).ReturnPath.Replace("%2fPage%2f", "&").Split('&');
                if (str.Length == 2)
                    model.Page = HL.Core.Global.Convert.ToInt(str[1], 0);

                var dbQuery = ModRSSService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.ID < entity.ID && o.MenuID == MenuID)
                    //.WhereIn(o => o.MenuID, slist)
                    .Take(PageSize)
                    .OrderByDesc(o => o.State)
                    .OrderByDesc(o => o.Published)
                    .Skip(PageSize * model.Page);
                ViewBag.Other = dbQuery.ToList();
                Lib.Global.PS<ModRSSEntity>.NonQuery("upviews", new object[] { "@id", entity.ID });
                ViewBag.Data = entity;

                model.TotalRecord = dbQuery.TotalRecord;
                model.PageSize = PageSize;
                ViewBag.Model = model;
                //if (Layout != "Index") RenderView(Layout+"Detail");
            }
            else
            {
                ViewPage.Error404();
            }
        }

    }

    public class MRSSModel
    {
        private int _Page = 0;
        public int Page
        {
            get { return _Page; }
            set { _Page = value - 1; }
        }

        public int TotalRecord { get; set; }
        public int PageSize { get; set; }

        public int m { get; set; }
    }
}
