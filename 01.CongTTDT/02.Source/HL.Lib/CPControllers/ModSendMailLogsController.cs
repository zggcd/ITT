using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModSendMailLogsController : CPController
    {
        public ModSendMailLogsController()
        {
            //khoi tao Service
            DataService = ModSendMailLogsService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModSendMailLogsModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModSendMailLogsService.Instance.CreateQuery()
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModSendMailLogsModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModSendMailLogsService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new ModSendMailLogsEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.Activity = CPViewPage.UserPermissions.Approve;
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModSendMailLogsModel model)
        {
            if (ValidSave(model))
               SaveRedirect();
        }

        public void ActionApply(ModSendMailLogsModel model)
        {
            if (ValidSave(model))
               ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModSendMailLogsModel model)
        {
            if (ValidSave(model))
               SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModSendMailLogsEntity entity = null;

        private bool ValidSave(ModSendMailLogsModel model)
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

            if (CPViewPage.Message.ListMessage.Count == 0)
            {

                //save
                ModSendMailLogsService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        #endregion
    }

    public class ModSendMailLogsModel : DefaultModel
    {
    }
}

