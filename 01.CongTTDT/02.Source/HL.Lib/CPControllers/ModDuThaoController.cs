using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModDuThaoController : CPController
    {
        public ModDuThaoController()
        {
            //khoi tao Service
            DataService = ModDuThaoService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModDuThaoModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModDuThaoService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModDuThaoModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModDuThaoService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new ModDuThaoEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.StartDate = DateTime.Now;
                entity.FinishDate = DateTime.Now;
                entity.Published = DateTime.Now;
                //entity.IP = HL.Core.Web.HttpRequest.IP;
                entity.Activity = CPViewPage.UserPermissions.Approve;
                entity.Order = GetMaxOrder(model);
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModDuThaoModel model)
        {
            if (ValidSave(model))
                SaveRedirect();
        }

        public void ActionApply(ModDuThaoModel model)
        {
            if (ValidSave(model))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModDuThaoModel model)
        {
            if (ValidSave(model))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModDuThaoEntity entity = null;

        private bool ValidSave(ModDuThaoModel model)
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
                CPViewPage.Message.ListMessage.Add("Bạn chưa nhập tên.");

            //kiem tra ngay bat dau, ket thuc 
            if (entity.StartDate.ToString().Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Bạn chưa nhập ngày bắt đầu.");
            if (entity.FinishDate.ToString().Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Bạn chưa nhập ngày kết thúc.");
            if(!string.IsNullOrEmpty(entity.StartDate.ToString()) && !string.IsNullOrEmpty(entity.FinishDate.ToString()))
            {
                if (entity.FinishDate < entity.StartDate)
                    CPViewPage.Message.ListMessage.Add("Ngày kết thúc phải lớn hơn hoặc bằng ngày bắt đầu.");
            }

            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                //neu khong nhap code -> tu sinh
                if (entity.Code.Trim() == string.Empty)
                    entity.Code = Data.GetCode(entity.Name);

                //save
                ModDuThaoService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        private int GetMaxOrder(ModDuThaoModel model)
        {
            return ModDuThaoService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion
    }

    public class ModDuThaoModel : DefaultModel
    {
        public string SearchText { get; set; }
    }
}

