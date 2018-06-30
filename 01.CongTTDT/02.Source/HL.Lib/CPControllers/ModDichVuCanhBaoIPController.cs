using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModDichVuCanhBaoIPController : CPController
    {
        public ModDichVuCanhBaoIPController()
        {
            //khoi tao Service
            DataService = ModDichVuCanhBaoIPService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModDichVuCanhBaoIPModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModDichVuCanhBaoIPService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("DichVuCanhBaoIP", model.MenuID, model.LangID))
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModDichVuCanhBaoIPModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModDichVuCanhBaoIPService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new ModDichVuCanhBaoIPEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.MenuID = model.MenuID;
                entity.Activity = CPViewPage.UserPermissions.Approve;
                entity.Order = GetMaxOrder(model);
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModDichVuCanhBaoIPModel model)
        {
            if (ValidSave(model))
               SaveRedirect();
        }

        public void ActionApply(ModDichVuCanhBaoIPModel model)
        {
            if (ValidSave(model))
               ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModDichVuCanhBaoIPModel model)
        {
            if (ValidSave(model))
               SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModDichVuCanhBaoIPEntity entity = null;

        private bool ValidSave(ModDichVuCanhBaoIPModel model)
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

            //kiem tra chuyen muc
            if (entity.MenuID < 1)
                CPViewPage.Message.ListMessage.Add("Chọn chuyên mục.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {

                //save
                ModDichVuCanhBaoIPService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        private int GetMaxOrder(ModDichVuCanhBaoIPModel model)
        {
            return ModDichVuCanhBaoIPService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion
    }

    public class ModDichVuCanhBaoIPModel : DefaultModel
    {
        private int _LangID = 1;
        public int LangID
        {
            get { return _LangID; }
            set { _LangID = value; }
        }

        public int MenuID { get; set; }
        public string SearchText { get; set; }
    }
}

