using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModConfigSendMailController : CPController
    {
        public ModConfigSendMailController()
        {
            //khoi tao Service
            DataService = ModConfigSendMailService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModConfigSendMailModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModConfigSendMailService.Instance.CreateQuery()
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModConfigSendMailModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModConfigSendMailService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new ModConfigSendMailEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.Activity = CPViewPage.UserPermissions.Approve;
                entity.SmtpSSL = true;
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModConfigSendMailModel model)
        {
            if (ValidSave(model))
               SaveRedirect();
        }

        public void ActionApply(ModConfigSendMailModel model)
        {
            if (ValidSave(model))
               ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModConfigSendMailModel model)
        {
            if (ValidSave(model))
               SaveNewRedirect(model.RecordID, entity.ID);
        }

        public void ActionSmtpSSLGX(int[] arrID)
        {
            if (CheckPermissions && !CPViewPage.UserPermissions.Approve)
            {
                //thong bao
                CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;
                CPViewPage.Message.ListMessage.Add("Quyền hạn chế.");
                return;
            }

            DataService.Update("[ID]=" + arrID[0],
                        "@SmtpSSL", arrID[1]);

            //thong bao
            CPViewPage.SetMessage("Đã thực hiện thành công.");
            CPViewPage.RefreshPage();
        }

        #region private func

        private ModConfigSendMailEntity entity = null;

        private bool ValidSave(ModConfigSendMailModel model)
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
                var objMenu =
                    WebMenuService.Instance.CreateQuery()
                        .Where(o => o.ID == HL.Core.Global.Convert.ToInt(entity.SmtpServer, 0))
                        .ToSingle();
                //save
                entity.SmtpServer = objMenu.Code;
                entity.SmtpPort = entity.SmtpServer.Contains("gmail") ? 587 : 25;
                entity.SmtpSSL = true;
                ModConfigSendMailService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        #endregion
    }

    public class ModConfigSendMailModel : DefaultModel
    {
        private int _LangID = 1;
        public int LangID
        {
            get { return _LangID; }
            set { _LangID = value; }
        }
    }
}

