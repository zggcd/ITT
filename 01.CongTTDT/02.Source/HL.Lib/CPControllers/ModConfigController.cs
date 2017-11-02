using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModConfigController : CPController
    {
        public ModConfigController()
        {
            //khoi tao Service
            DataService = WebSettingService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(WebSettingModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort, "[Code]");

            // tao danh sach
            var dbQuery = WebSettingService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Code.Contains(model.SearchText))
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            //int tr = 0;
            //string where = "1=1";
            //where += !string.IsNullOrEmpty(model.SearchText) ? " AND [Name] LIKE '%" + model.SearchText + "%'" : "";
            //ViewBag.Data = Global.PS<WebSettingEntity>.PhanTrang(out tr, model.PageSize, model.PageSize * model.PageIndex, "Web_Setting", "*", where, orderBy);
            //model.TotalRecord = tr;
            ViewBag.Model = model;
        }

        public void ActionAdd(WebSettingModel model)
        {
            if (model.RecordID > 0)
            {
                entity = WebSettingService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new WebSettingEntity();
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(WebSettingModel model)
        {
            if (ValidSave(model))
            {
                CPViewPage.SetMessage("Thông tin đã cập nhật.");
                CPViewPage.Response.Redirect(CPViewPage.Request.RawUrl.Replace("Add.aspx", "Index.aspx"));
            }
        }

        public void ActionApply(WebSettingModel model)
        {
            if (ValidSave(model))
            {
                CPViewPage.SetMessage("Thông tin đã cập nhật.");

                if (model.RecordID > 0)
                    CPViewPage.RefreshPage();
                else
                    CPViewPage.Response.Redirect(CPViewPage.Request.RawUrl + "/RecordID/" + entity.ID);
            }
        }

        #region private func

        private WebSettingEntity entity = null;

        private bool ValidSave(WebSettingModel model)
        {
            TryUpdateModel(entity);

            ViewBag.Data = entity;
            ViewBag.Model = model;

            CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;

            //kiem tra ma
            if (entity.Code.Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Nhập mã.");

            //kiem tra ton tai
            if (model.RecordID < 1 && WebSettingService.Instance.CP_HasExists(entity.Code))
                CPViewPage.Message.ListMessage.Add("Mã đã tồn tại.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                //save
                WebSettingService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        #endregion
    }

    public class WebSettingModel : DefaultModel
    {
        private int _LangID = 1;
        public int LangID
        {
            get { return _LangID; }
            set { _LangID = value; }
        }

        public string SearchText { get; set; }
    }
}
