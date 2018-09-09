using System;

using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class MImportLogsController : Controller
    {

        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|ImportLogs")]
        public int MenuID;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        public void ActionIndex(MImportLogsModel model)
        {
            if (ViewPage.CurrentPage.MenuID > 0)
               MenuID = ViewPage.CurrentPage.MenuID;

            var dbQuery = ModImportLogsService.Instance.CreateQuery()
                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("ImportLogs", MenuID, ViewPage.CurrentLang.ID))
                            .OrderByDesc(o => o.ID)
                            .Take(PageSize)
                            .Skip(PageSize * model.Page);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            model.PageSize = PageSize;
            ViewBag.Model = model;
        }

        public void ActionDetail(int id)
        {
            var entity = ModImportLogsService.Instance.CreateQuery()
                            .Where(o => o.ID == id)
                            .ToSingle();

            if (entity != null)
            {
                ViewBag.Other = ModImportLogsService.Instance.CreateQuery()
                                        .Where(o => o.ID < entity.ID)
                                        .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("ImportLogs", MenuID, ViewPage.CurrentLang.ID))
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

    public class MImportLogsModel
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
