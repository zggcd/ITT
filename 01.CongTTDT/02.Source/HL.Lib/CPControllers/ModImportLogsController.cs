using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModImportLogsController : CPController
    {
        public ModImportLogsController()
        {
            //khoi tao Service
            DataService = ModImportLogsService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModImportLogsModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModImportLogsService.Instance.CreateQuery()
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("ImportLogs", model.MenuID, model.LangID))
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModImportLogsModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModImportLogsService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new ModImportLogsEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.MenuID = model.MenuID;
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModImportLogsModel model)
        {
            if (ValidSave(model))
               SaveRedirect();
        }

        public void ActionApply(ModImportLogsModel model)
        {
            if (ValidSave(model))
               ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModImportLogsModel model)
        {
            if (ValidSave(model))
               SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModImportLogsEntity entity = null;

        private bool ValidSave(ModImportLogsModel model)
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

                //save
                ModImportLogsService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        #endregion
    }

    public class ModImportLogsModel : DefaultModel
    {
        private int _LangID = 1;
        public int LangID
        {
            get { return _LangID; }
            set { _LangID = value; }
        }

        public int MenuID { get; set; }
    }
}

