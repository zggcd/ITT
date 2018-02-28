using System;

using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class MConfigSendMailController : Controller
    {

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        public void ActionIndex(MConfigSendMailModel model)
        {
            var dbQuery = ModConfigSendMailService.Instance.CreateQuery()
                            .Where(o => o.Activity == true)
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
            var entity = ModConfigSendMailService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.ID == id)
                            .ToSingle();

            if (entity != null)
            {
                ViewBag.Other = ModConfigSendMailService.Instance.CreateQuery()
                                        .Where(o => o.Activity == true)
                                        .Where(o => o.ID < entity.ID)
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

    public class MConfigSendMailModel
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
