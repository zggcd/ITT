using System;
using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class SysUserController : CPController
    {
        public SysUserController()
        {
            //khoi tao Service
            DataService = CPUserService.Instance;
            //CheckPermissions = false;
        }

        public void ActionIndex(SysUserModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = CPUserService.Instance.CreateQuery()
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(SysUserModel model)
        {
            if (model.RecordID > 0)
            {
                entity = CPUserService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new CPUserEntity();

                // khoi tao gia tri mac dinh khi insert
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(SysUserModel model)
        {
            if (ValidSave(model))
                SaveRedirect();
        }

        public void ActionApply(SysUserModel model)
        {
            if (ValidSave(model))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(SysUserModel model)
        {
            if (ValidSave(model))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private CPUserEntity entity = null;

        private bool ValidSave(SysUserModel model)
        {
            TryUpdateModel(entity);

            ViewBag.Data = entity;
            ViewBag.Model = model;

            CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;

            //kiem tra ten dang nhap
            if (entity.LoginName.Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Nhập tên người sử dụng.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                if (model.NewPassword != string.Empty)
                    //entity.Password = HL.Lib.Global.Security.MD5(model.NewPassword);
                    entity.Password = Global.Security.GetPass(model.NewPassword);

                try
                {
                    //save
                    CPUserService.Instance.Save(entity);

                    //xoa 
                    CPUserRoleService.Instance.Delete(o => o.UserID == entity.ID);

                    //them
                    for (int i = 0; model.ArrRole != null && i < model.ArrRole.Length; i++)
                    {
                        CPUserRoleService.Instance.Save(new CPUserRoleEntity()
                        {
                            UserID = entity.ID,
                            RoleID = model.ArrRole[i]
                        });
                    }
                }
                catch (Exception ex)
                {
                    Global.Error.Write(ex);
                    CPViewPage.Message.ListMessage.Add(ex.Message);
                    return false;
                }

                Utils.Clear_Cache();

                return true;
            }

            return false;
        }

        #endregion
    }

    public class SysUserModel : DefaultModel
    {
        public int[] ArrRole { get; set; }
        public string NewPassword { get; set; }
    }
}
