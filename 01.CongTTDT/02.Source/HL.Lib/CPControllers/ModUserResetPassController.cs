using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModUserResetPassController : CPController
    {
        public ModUserResetPassController()
        {
            //khoi tao Service
            DataService = ModUserResetPassService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModUserResetPassModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModUserResetPassService.Instance.CreateQuery()
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModUserResetPassModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModUserResetPassService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new ModUserResetPassEntity();

                // khoi tao gia tri mac dinh khi insert
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModUserResetPassModel model)
        {
            if (ValidSave(model))
               SaveRedirect();
        }

        public void ActionApply(ModUserResetPassModel model)
        {
            if (ValidSave(model))
               ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModUserResetPassModel model)
        {
            if (ValidSave(model))
               SaveNewRedirect(model.RecordID, entity.ID);
        }

        public void ActionStateSendGX(int[] arrID)
        {
            if (CheckPermissions && !CPViewPage.UserPermissions.Approve)
            {
                //thong bao
                CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;
                CPViewPage.Message.ListMessage.Add("Quyền hạn chế.");
                return;
            }

            DataService.Update("[ID]=" + arrID[0],
                        "@StateSend", arrID[1]);

            //thong bao
            CPViewPage.SetMessage("Đã thực hiện thành công.");
            CPViewPage.RefreshPage();
        }

        #region private func

        private ModUserResetPassEntity entity = null;

        private bool ValidSave(ModUserResetPassModel model)
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
                ModUserResetPassService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        #endregion
    }

    public class ModUserResetPassModel : DefaultModel
    {
    }
}

