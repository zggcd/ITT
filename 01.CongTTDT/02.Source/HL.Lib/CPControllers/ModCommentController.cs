using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModCommentController : CPController
    {
        public ModCommentController()
        {
            //khoi tao Service
            DataService = ModCommentService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModCommentModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModCommentService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Comment", model.MenuID, model.LangID))
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModCommentModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModCommentService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new ModCommentEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.MenuID = model.MenuID;
                entity.Activity = CPViewPage.UserPermissions.Approve;
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModCommentModel model)
        {
            if (ValidSave(model))
               SaveRedirect();
        }

        public void ActionApply(ModCommentModel model)
        {
            if (ValidSave(model))
               ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModCommentModel model)
        {
            if (ValidSave(model))
               SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModCommentEntity entity = null;

        private bool ValidSave(ModCommentModel model)
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
                CPViewPage.Message.ListMessage.Add("Nhập tiêu đề.");

            //kiem tra so dien thoai 
            if (entity.Name.Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Nhập số điện thoại.");
            else
            {
                string checkPhone = Utils.GetMobilePhone(entity.PhoneNum);
                if (string.IsNullOrEmpty(checkPhone))
                {
                    CPViewPage.Message.ListMessage.Add("Số điện thoại không hợp lệ.");
                }
            }

            // Email
            if (!string.IsNullOrEmpty(entity.Email))
            {
                string checkEmail = Utils.GetEmailAddress(entity.Email);
                if (string.IsNullOrEmpty(checkEmail))
                {
                    CPViewPage.Message.ListMessage.Add("Email không hợp lệ.");
                }
            }

            // Noi dung
            if (string.IsNullOrEmpty(entity.Content))
            {
                CPViewPage.Message.ListMessage.Add("Bạn chưa nhập Nội dung.");
            }

            //kiem tra chuyen muc
            //if (entity.MenuID < 1)
            //    CPViewPage.Message.ListMessage.Add("Chọn chuyên mục.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                 //neu khong nhap code -> tu sinh
                 //if (entity.Code.Trim() == string.Empty)
                 //   entity.Code = Data.GetCode(entity.Name);

                 //cap nhat state
                entity.State = GetState(model.ArrState);

                //save
                ModCommentService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        #endregion
    }

    public class ModCommentModel : DefaultModel
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

