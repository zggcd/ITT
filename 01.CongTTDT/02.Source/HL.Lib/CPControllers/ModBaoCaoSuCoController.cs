using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;
using System.Linq;

namespace HL.Lib.CPControllers
{
    public class ModBaoCaoSuCoController : CPController
    {
        public ModBaoCaoSuCoController()
        {
            //khoi tao Service
            DataService = ModBaoCaoSuCoService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModBaoCaoSuCoModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // Search theo user
            var user = CPUserService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.LoginName.Contains(model.SearchText))
                                .ToList();
            string s = "";
            if (user != null)
            {
                s = string.Join(",", user.Select(o => o.ID).ToArray());
            }

            // Lay user chiu trach nhiem xu ly su co
            int userTrachNhiem = 0;
            if (CPLogin.CurrentUser.IsAdministrator == false) {
                userTrachNhiem = CPLogin.CurrentUser.ID;
            }

            // tao danh sach
            var dbQuery = ModBaoCaoSuCoService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText) && string.IsNullOrEmpty(s), o => o.Title.Contains(model.SearchText))
                                .WhereIn(!string.IsNullOrEmpty(s), o => o.UserID, s)
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .Where(userTrachNhiem > 0, o => o.UserID2 == userTrachNhiem)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("BaoCaoSuCo", model.MenuID, model.LangID))
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModBaoCaoSuCoModel model)
        {
            // Lay user chiu trach nhiem xu ly su co
            int userTrachNhiem = 0;
            if (CPLogin.CurrentUser.IsAdministrator == false)
            {
                userTrachNhiem = CPLogin.CurrentUser.ID;
            }

            if (model.RecordID > 0)
            {
                entity = ModBaoCaoSuCoService.Instance.GetByID(model.RecordID);

                if (userTrachNhiem > 0)
                {
                    if (entity.UserID2 != userTrachNhiem)
                    {
                        CPViewPage.Message.MessageType = Message.MessageTypeEnum.Notice;
                        CPViewPage.SetMessage("Bản ghi không tồn tại.");
                        CPViewPage.Response.Redirect(CPViewPage.Request.RawUrl.Replace("Add.aspx", "Index.aspx"));
                    }
                }

                // khoi tao gia tri mac dinh khi update
                entity.UserID1 = CPLogin.CurrentUser.ID;
                entity.Published1 = DateTime.Now;
            }
            else
            {
                entity = new ModBaoCaoSuCoEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.MenuID = model.MenuID;
                entity.Published = DateTime.Now;
                entity.Activity = CPViewPage.UserPermissions.Approve;
                entity.Order = GetMaxOrder(model);
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModBaoCaoSuCoModel model)
        {
            if (ValidSave(model))
               SaveRedirect();
        }

        public void ActionApply(ModBaoCaoSuCoModel model)
        {
            if (ValidSave(model))
               ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModBaoCaoSuCoModel model)
        {
            if (ValidSave(model))
               SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModBaoCaoSuCoEntity entity = null;

        private bool ValidSave(ModBaoCaoSuCoModel model)
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

            // kiem tra ten su co
            if (entity.Title.Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Nhập tên sự cố.");

            //kiem tra ten 
            if (entity.Name.Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Nhập tên tổ chức.");

            //kiem tra chuyen muc
            if (entity.MenuID < 1)
                CPViewPage.Message.ListMessage.Add("Chọn chuyên mục.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                 //neu khong nhap code -> tu sinh
                 if (entity.Code.Trim() == string.Empty)
                    entity.Code = Data.GetCode(entity.Name);

                 //cap nhat state
                entity.State = GetState(model.ArrState);

                entity.Published2 = null;
                string trangThai = WebMenuService.Instance.GetByID(entity.MenuID).Code;
                if (trangThai == "KetThuc")
                {
                    entity.Published2 = DateTime.Now;
                }

                //save
                ModBaoCaoSuCoService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        private int GetMaxOrder(ModBaoCaoSuCoModel model)
        {
            return ModBaoCaoSuCoService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion
    }

    public class ModBaoCaoSuCoModel : DefaultModel
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

