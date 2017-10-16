﻿using System;

using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class MCoQuanController : Controller
    {

        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|CoQuan")]
        public int MenuID;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        public void ActionIndex(MCoQuanModel model)
        {
            if (ViewPage.CurrentPage.MenuID > 0)
               MenuID = ViewPage.CurrentPage.MenuID;

            var dbQuery = ModCoQuanService.Instance.CreateQuery()
                            .Where(o => o.Activity == true)
                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("CoQuan", MenuID, ViewPage.CurrentLang.ID))
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
            var entity = ModCoQuanService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.Code == endCode)
                            //.WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("CoQuan", MenuID, ViewPage.CurrentLang.ID))
                            .ToSingle();

            if (entity != null)
            {
                ViewBag.Other = ModCoQuanService.Instance.CreateQuery()
                                        .Where(o => o.Activity == true)
                                        .Where(o => o.Order < entity.Order)
                                        .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("CoQuan", MenuID, ViewPage.CurrentLang.ID))
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

    public class MCoQuanModel
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
