using System;
using System.Collections.Generic;
using HL.Core.Models;
using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModRSSController : CPController
    {
        public ModRSSController()
        {
            //khoi tao Service
            DataService = ModRSSService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModRSSModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            //var dbQuery = ModRSSService.Instance.CreateQuery()
            //                    .Where(model.State > 0, o => (o.State & model.State) == model.State)
            //                    .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("RSS", model.MenuID, model.LangID))
            //                    .Take(model.PageSize)
            //                    .OrderBy(orderBy)
            //                    .Skip(model.PageIndex * model.PageSize);

            var startdate = string.IsNullOrEmpty(model.FromDate) ? "01/01/" + DateTime.MinValue.Year : model.FromDate;
            var enddate = string.IsNullOrEmpty(model.ToDate) ? "31/12/" + DateTime.Now.Year : model.ToDate;
            DBQuery<ModRSSEntity> dbQuery = null;
            if (model.Activity == 0)
            {
                dbQuery = ModRSSService.Instance.CreateQuery()
                    .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                    .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("RSS", model.MenuID, model.LangID))
                    .Where(model.State > 0, o => (o.State & model.State) == model.State)
                    .Where(
                        o => o.Published <= Convert.ToDateTime(enddate) && o.Published >= Convert.ToDateTime(startdate))
                    .Take(model.PageSize)
                    .OrderBy(orderBy)
                    .Skip(model.PageIndex * model.PageSize);
            }
            else
            {
                int active = model.Activity == 2 ? 0 : 1;
                dbQuery = ModRSSService.Instance.CreateQuery()
                    .Where(o => o.Activity == Convert.ToBoolean(active))
                    .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                    .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("RSS", model.MenuID, model.LangID))
                    .Where(model.State > 0, o => (o.State & model.State) == model.State)
                    .Where(
                        o => o.Published <= Convert.ToDateTime(enddate) && o.Published >= Convert.ToDateTime(startdate))
                    .Take(model.PageSize)
                    .OrderBy(orderBy)
                    .Skip(model.PageIndex * model.PageSize);
            }

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModRSSModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModRSSService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new ModRSSEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.MenuID = model.MenuID;
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModRSSModel model)
        {
            if (ValidSave(model))
                SaveRedirect();
        }

        public void ActionApply(ModRSSModel model)
        {
            if (ValidSave(model))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModRSSModel model)
        {
            if (ValidSave(model))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModRSSEntity entity = null;

        private bool ValidSave(ModRSSModel model)
        {
            TryUpdateModel(entity);

            //chong hack
            entity.ID = model.RecordID;

            ViewBag.Data = entity;
            ViewBag.Model = model;

            CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;

            //kiem tra quyen han
            if ((model.RecordID < 1 && !CPViewPage.UserPermissions.Add) || (model.RecordID > 0 && !CPViewPage.UserPermissions.Edit))
                CPViewPage.Message.ListMessage.Add("Quyền hạn chế.");

            //kiem tra chuyen muc
            if (entity.MenuID < 1)
                CPViewPage.Message.ListMessage.Add("Chọn chuyên mục.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {

                //cap nhat state
                entity.State = GetState(model.ArrState);

                //save
                ModRSSService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        #endregion
    }

    public class ModRSSModel : DefaultModel
    {
        private int _LangID = 1;
        public int LangID
        {
            get { return _LangID; }
            set { _LangID = value; }
        }

        public int MenuID { get; set; }
        public int State { get; set; }
        public string SearchText { get; set; }
        public string FromDate { get; set; }
        public string ToDate { get; set; }

        //private int _Activity = 1;

        //public int Activity
        //{
        //    get { return _Activity; }
        //    set { _Activity = value; }
        //}
        public int Activity { get; set; }

        public int[] ArrState { get; set; }
    }
}

