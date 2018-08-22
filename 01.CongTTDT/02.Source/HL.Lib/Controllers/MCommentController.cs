using System;

using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class MCommentController : Controller
    {

        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|Comment")]
        public int MenuID;

        //[HL.Core.MVC.PropertyInfo("Vị trí", "ConfigKey|Mod.CommentState")]
        public int State;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        public void ActionIndex(MCommentModel model)
        {
            if (ViewPage.CurrentPage.MenuID > 0)
               MenuID = ViewPage.CurrentPage.MenuID;

            var dbQuery = ModCommentService.Instance.CreateQuery()
                            .Where(o => o.Activity == true)
                            .Where(State > 0, o => (o.State & State) == State)
                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("Comment", MenuID, ViewPage.CurrentLang.ID))
                            .OrderByDesc(o => o.ID)
                            .Take(PageSize)
                            .Skip(PageSize * model.Page);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            model.PageSize = PageSize;
            ViewBag.Model = model;
        }

        public void ActionDetail(string endCode)
        {
            var entity = ModCommentService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.Code == endCode)
                            //.WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("Comment", MenuID, ViewPage.CurrentLang.ID))
                            .ToSingle();

            if (entity != null)
            {
                ViewBag.Other = ModCommentService.Instance.CreateQuery()
                                        .Where(o => o.Activity == true)
                                        .Where(o => o.ID < entity.ID)
                                        .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("Comment", MenuID, ViewPage.CurrentLang.ID))
                                        .OrderByDesc(o => o.ID)
                                        .Take(PageSize)
                                        .ToList();

                ViewBag.Data = entity;
                SetObject["view.Meta"] = entity;
            }
            else
            {
                ViewPage.Error404();
            }
        }
    }

    public class MCommentModel
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
