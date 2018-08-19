using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModDichVuCanhBaoController : CPController
    {
        public ModDichVuCanhBaoController()
        {
            //khoi tao Service
            DataService = ModDichVuCanhBaoService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModDichVuCanhBaoModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModDichVuCanhBaoService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("DichVuCanhBao", model.MenuID, model.LangID))
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModDichVuCanhBaoModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModDichVuCanhBaoService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
                entity.UserID1 = CPLogin.CurrentUser.ID;
                entity.Published1 = DateTime.Now;
            }
            else
            {
                entity = new ModDichVuCanhBaoEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.UserID = CPLogin.CurrentUser.ID;
                entity.MenuID = model.MenuID;
                entity.Published = DateTime.Now;
                entity.Activity = CPViewPage.UserPermissions.Approve;
                entity.Order = GetMaxOrder(model);
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModDichVuCanhBaoModel model, MAppend append)
        {
            if (ValidSave(model, append))
                SaveRedirect();
        }

        public void ActionApply(ModDichVuCanhBaoModel model, MAppend append)
        {
            if (ValidSave(model, append))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModDichVuCanhBaoModel model, MAppend append)
        {
            if (ValidSave(model, append))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModDichVuCanhBaoEntity entity = null;

        private bool ValidSave(ModDichVuCanhBaoModel model, MAppend append)
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
            //if (entity.MenuID < 1)
            //    CPViewPage.Message.ListMessage.Add("Chọn chuyên mục.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                //neu khong nhap code -> tu sinh
                if (entity.Code.Trim() == string.Empty)
                    entity.Code = Data.GetCode(entity.Name);

                entity.Time = TimeSpan.Parse(append.ThoiGian);

                //cap nhat state
                entity.State = GetState(model.ArrState);

                //save
                ModDichVuCanhBaoService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        private int GetMaxOrder(ModDichVuCanhBaoModel model)
        {
            return ModDichVuCanhBaoService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion
    }

    public class ModDichVuCanhBaoModel : DefaultModel
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

        public int[] ArrState { get; set; }
    }
}

