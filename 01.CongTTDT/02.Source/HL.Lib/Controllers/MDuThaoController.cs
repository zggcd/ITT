using System;

using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class MDuThaoController : Controller
    {

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        public void ActionIndex(MDuThaoModel model)
        {
            DateTime d = DateTime.Now;
            var dbQuery = ModDuThaoService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.FinishDate >= d)
                            .OrderByDesc(o => o.Order);

            ViewBag.Data = dbQuery.ToList();

            var dbQuery2 = ModDuThaoService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.FinishDate < d)
                            .OrderByDesc(o => o.Order)
                            .Take(PageSize)
                            .Skip(PageSize * model.Page);

            ViewBag.DataHetHan = dbQuery2.ToList();
            model.TotalRecord = dbQuery2.TotalRecord;
            model.PageSize = PageSize;
            ViewBag.Model = model;
        }

        public void ActionDetail(string endCode)
        {
            var entity = ModDuThaoService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.Code == endCode)
                            .ToSingle();

            if (entity != null)
            {
                ViewBag.Other = ModDuThaoService.Instance.CreateQuery()
                                        .Where(o => o.Activity == true)
                                        .Where(o => o.Order < entity.Order)
                                        .OrderByDesc(o => o.Order)
                                        .Take(PageSize)
                                        .ToList();

                ViewBag.Data = entity;
                SetObject["view.Meta"] = entity;

                MDuThaoModel model = new MDuThaoModel();
                model.PageSize = PageSize;
                string[] str = ((HL.Core.MVC.ViewPage)(ViewPage)).ReturnPath.Replace("%2fPage%2f", "&").Split('&');
                if (str.Length == 2)
                    model.Page = HL.Core.Global.Convert.ToInt(str[1], 0);

                //Lay toan bo gop y cua du thao
                var dbQuery = ModGopYService.Instance.CreateQuery()
                    .Where(o => o.Activity == true)
                    .Where(o => o.DuThaoID == entity.ID)
                    .OrderByDesc(o => o.Order)
                    .Take(PageSize)
                    .Skip(PageSize * model.Page);

                ViewBag.GopY = dbQuery.ToList();
                model.TotalRecord = dbQuery.TotalRecord;
                model.PageSize = PageSize;
                ViewBag.Model = model;
            }
            else
            {
                ViewPage.Error404();
            }
        }
    }

    public class MDuThaoModel
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
