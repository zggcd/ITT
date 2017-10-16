using System;

using HL.Lib.MVC;
using HL.Lib.Models;
using System.Collections.Generic;

namespace HL.Lib.Controllers
{
    public class MVanBanController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|VanBan")]
        public int MenuID;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        public void ActionIndex(MVanBanModel model)
        {
            if (ViewPage.CurrentPage.MenuID > 0)
                MenuID = ViewPage.CurrentPage.MenuID;

            var dbQuery = ModVanBanService.Instance.CreateQuery()
                            .Where(o => o.Activity == true)
                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("VanBan", MenuID, ViewPage.CurrentLang.ID));

            if (model.LV > 0)
            {
                dbQuery.Where(o => o.MenuIDs.Contains(model.LV.ToString()));
            }

            if (model.CQ > 0)
            {
                dbQuery.Where(o => o.MenuID1 == model.CQ);
            }

            if (model.HT > 0)
            {
                dbQuery.Where(o => o.MenuID2 == model.HT);
            }

            dbQuery.OrderByDesc(o => o.Order);
            dbQuery.Take(PageSize).Skip(PageSize * model.Page);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            model.PageSize = PageSize;
            ViewBag.Model = model;

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
        }

        public void ActionDetail(string endCode)
        {
            var entity = ModVanBanService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.Code == endCode)
                            .ToSingle();

            if (entity != null)
            {
                ViewBag.Other = ModVanBanService.Instance.CreateQuery()
                                        .Where(o => o.Activity == true)
                                        .Where(o => o.Order < entity.Order)
                                        .OrderByDesc(o => o.Order)
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

    public class MVanBanModel
    {
        private int _Page = 0;
        public int Page
        {
            get { return _Page; }
            set { _Page = value - 1; }
        }

        public int PageSize { get; set; }
        public int TotalRecord { get; set; }

        public int LV { get; set; }
        public int CQ { get; set; }
        public int HT { get; set; }
    }
}
