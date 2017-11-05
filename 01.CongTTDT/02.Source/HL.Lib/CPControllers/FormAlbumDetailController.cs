using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class FormAlbumDetailController : CPController
    {
        public FormAlbumDetailController()
        {
            //khoi tao Service
            DataService = ModAlbumDetailService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(FormAlbumDetailModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModAlbumDetailService.Instance.CreateQuery()
                .Where(o => o.AlbumID == model.AlbumID)
                .Take(model.PageSize)
                .OrderBy(orderBy)
                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(FormAlbumDetailModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModAlbumDetailService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new ModAlbumDetailEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.Activity = CPViewPage.UserPermissions.Approve;
                entity.Order = GetMaxOrder(model);
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(FormAlbumDetailModel model)
        {
            if (ValidSave(model))
                SaveRedirect();
        }

        public void ActionApply(FormAlbumDetailModel model)
        {
            if (ValidSave(model))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(FormAlbumDetailModel model)
        {
            if (ValidSave(model))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModAlbumDetailEntity entity = null;

        private bool ValidSave(FormAlbumDetailModel model)
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

            //kiem tra ten 
            if (entity.Name.Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Nhập tên.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {

                //save
                entity.AlbumID = model.AlbumID;
                ModAlbumDetailService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        private int GetMaxOrder(FormAlbumDetailModel model)
        {
            return ModAlbumDetailService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion
    }

    public class FormAlbumDetailModel : DefaultModel
    {
        public int AlbumID { get; set; }
    }
}

