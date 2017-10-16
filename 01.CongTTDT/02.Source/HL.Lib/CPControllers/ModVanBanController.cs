using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModVanBanController : CPController
    {
        public ModVanBanController()
        {
            //khoi tao Service
            DataService = ModVanBanService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModVanBanModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModVanBanService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModVanBanModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModVanBanService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new ModVanBanEntity
                {
                    // khoi tao gia tri mac dinh khi insert
                    NgayBanHanh = DateTime.Now,
                    NgayCoHieuLuc = DateTime.Now,
                    Published = DateTime.Now,
                    Activity = CPViewPage.UserPermissions.Approve,
                    Order = GetMaxOrder(model)
                };
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModVanBanModel model)
        {
            if (ValidSave(model))
                SaveRedirect();
        }

        public void ActionApply(ModVanBanModel model)
        {
            if (ValidSave(model))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModVanBanModel model)
        {
            if (ValidSave(model))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModVanBanEntity entity = null;

        private bool ValidSave(ModVanBanModel model)
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
                CPViewPage.Message.ListMessage.Add("Nhập Số hiệu.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                //neu khong nhap code -> tu sinh
                if (entity.Code.Trim() == string.Empty)
                    entity.Code = Data.GetCode(entity.Name);

                entity.MenuIDs = GetMenuIDs(model.ArrMenuIDs);
                entity.UserIDs = GetMenuIDs(model.ArrUserIDs);

                //save
                ModVanBanService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        private int GetMaxOrder(ModVanBanModel model)
        {
            return ModVanBanService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion
    }

    public class ModVanBanModel : DefaultModel
    {
        private int _LangID = 1;
        public int LangID
        {
            get { return _LangID; }
            set { _LangID = value; }
        }
        public int MenuID { get; set; }
        public string SearchText { get; set; }
        public int[] ArrMenuIDs { get; set; }
        public int[] ArrUserIDs { get; set; }
    }
}

