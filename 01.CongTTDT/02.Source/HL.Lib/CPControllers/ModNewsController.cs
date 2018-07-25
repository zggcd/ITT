using System;
using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;
using System.Collections;

namespace HL.Lib.CPControllers
{
    public class ModNewsController : CPController
    {
        public ModNewsController()
        {
            //khoi tao Service
            DataService = ModNewsService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModNewsModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            int userId = CPLogin.CurrentUser.ID;
            CPUserRoleEntity userRole = CPUserRoleService.Instance.CreateQuery().Where(o => o.UserID == userId).ToSingle();
            string roleCode = string.Empty;
            string menuIds = WebMenuService.Instance.GetChildIDForCP("News", model.MenuID, model.LangID);
            ArrayList menuIdsTemp = new ArrayList();
            if (userRole != null)
            {
                var role = CPRoleService.Instance.CreateQuery().Where(o => o.ID == userRole.RoleID).ToSingle();
                if (role != null)
                {
                    roleCode = role.Code;
                    string roleMenu = role.MenuIDs;
                    string[] menuArr = menuIds.Split(',');
                    foreach(string m in menuArr)
                    {
                        if (!string.IsNullOrEmpty(roleMenu))
                        {
                            if (roleMenu.Contains(m)) menuIdsTemp.Add(m);
                        }
                    }
                    menuIds = string.Join(",", menuIdsTemp.ToArray());
                }
            }

            // tao danh sach
            if (!string.IsNullOrEmpty(menuIds))
            {
                var dbQuery = ModNewsService.Instance.CreateQuery()
                    .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                    .Where(model.State > 0, o => (o.State & model.State) == model.State)
                    .Where(roleCode == "NV", o => o.CreateUser == userId)
                    .Where(roleCode == "Admin", o => o.Activity1 == true)
                    .WhereIn(o => o.MenuID, menuIds)
                    .Take(model.PageSize)
                    .OrderBy(orderBy)
                    .Skip(model.PageIndex * model.PageSize);

                ViewBag.Data = dbQuery.ToList();
                model.TotalRecord = dbQuery.TotalRecord;
            }
            ViewBag.Model = model;
        }

        public void ActionAdd(ModNewsModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModNewsService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
                entity.UpdateUser = CPLogin.CurrentUser.ID;
                entity.Updated = DateTime.Now;
            }
            else
            {
                entity = new ModNewsEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.MenuID = model.MenuID;
                entity.CreateUser = CPLogin.CurrentUser.ID;
                entity.Published = DateTime.Now;
                entity.Activity1 = CPViewPage.UserPermissions.Approve1;
                entity.Activity = CPViewPage.UserPermissions.Approve;
                entity.Order = GetMaxOrder(model);
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModNewsModel model)
        {
            if (ValidSave(model))
                SaveRedirect();
        }

        public void ActionApply(ModNewsModel model)
        {
            if (ValidSave(model))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModNewsModel model)
        {
            if (ValidSave(model))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        public void ActionActivity1(int id)
        {
            //update for id
            ModNewsService.Instance.Update(o => o.ID == id,
                "@Activity1", 1);

            //update for != id
            //ModNewsService.Instance.Update(o => o.ID != id,
            //    "@Activity1", 0);

            //thong bao
            CPViewPage.SetMessage("Đã thực hiện thành công.");
            CPViewPage.RefreshPage();
        }

        public void ActionUnActivity1(int id)
        {
            //update for id
            ModNewsService.Instance.Update(o => o.ID == id,
                "@Activity1", 0);

            //thong bao
            CPViewPage.SetMessage("Đã thực hiện thành công.");
            CPViewPage.RefreshPage();
        }

        #region private func

        private ModNewsEntity entity = null;

        private bool ValidSave(ModNewsModel model)
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

                try
                {
                    //save
                    ModNewsService.Instance.Save(entity);

                    //update tag
                    ModTagService.Instance.UpdateTag(entity.ID, entity.Tags);
                }
                catch (Exception ex)
                {
                    Global.Error.Write(ex);
                    CPViewPage.Message.ListMessage.Add(ex.Message);
                    return false;
                }

                return true;
            }

            return false;
        }

        private int GetMaxOrder(ModNewsModel model)
        {
            return ModNewsService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion
    }

    public class ModNewsModel : DefaultModel
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
