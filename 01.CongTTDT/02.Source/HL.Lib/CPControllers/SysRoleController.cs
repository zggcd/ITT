using System;
using System.Collections.Generic;
using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class SysRoleController : CPController
    {
        public SysRoleController()
        {
            //khoi tao Service
            DataService = CPRoleService.Instance;
            //CheckPermissions = false;
        }

        public void ActionIndex(SysRoleModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort, "[Order]");

            // tao danh sach
            var dbQuery = CPRoleService.Instance.CreateQuery()
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(SysRoleModel model)
        {
            if (model.RecordID > 0)
            {
                entity = CPRoleService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new CPRoleEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.Order = GetMaxOrder(model);
            }

            listCPModule = CPModuleService.Instance.CreateQuery().ToList();

            ViewBag.Data = entity;
            ViewBag.Model = model;
            ViewBag.CPModule = listCPModule;
        }

        public void ActionSave(SysRoleModel model)
        {
            if (ValidSave(model))
                SaveRedirect();
        }

        public void ActionApply(SysRoleModel model)
        {
            if (ValidSave(model))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(SysRoleModel model)
        {
            if (ValidSave(model))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        public override void ActionDelete(int[] arrID)
        {
            for (int i = 0; i < arrID.Length; i++)
            {
                int id = arrID[i];

                CPRoleEntity _Item = CPRoleService.Instance.GetByID(id);

                if (_Item.Lock)
                    continue;

                //thuc thi
                CPUserRoleService.Instance.Delete(o => o.RoleID == id);
                CPAccessService.Instance.Delete(o => o.RoleID == id);
                CPRoleService.Instance.Delete(id);
            }

            //thong bao
            CPViewPage.SetMessage("Đã xóa thành công.");
            CPViewPage.RefreshPage();
        }

        #region private func

        private List<CPModuleEntity> listCPModule = null;
        private CPRoleEntity entity = null;

        private bool ValidSave(SysRoleModel model)
        {
            TryUpdateModel(entity);

            ViewBag.Data = entity;
            ViewBag.Model = model;

            CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;

            //kiem tra ten 
            if (entity.Name.Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Nhập tên nhóm người sử dụng.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                try
                {
                    //save
                    CPRoleService.Instance.Save(entity);

                    UpdateRoleModule(model);

                }
                catch (Exception ex)
                {
                    Global.Error.Write(ex);
                    CPViewPage.Message.ListMessage.Add(ex.Message);
                    return false;
                }

                Global.Utils.Clear_Cache();

                return true;
            }

            return false;
        }

        private void UpdateRoleModule(SysRoleModel model)
        {
            CPAccessService.Instance.Delete(o => o.Type == "CP.MODULE" && o.RoleID == entity.ID);

            for (int i = 0; i < listCPModule.Count; i++)
            {
                int _Access = 0;

                if (model.ArrApprove1 != null && Array.IndexOf(model.ArrApprove1, listCPModule[i].ID) > -1)
                    _Access |= 32;
                if (model.ArrApprove != null && Array.IndexOf(model.ArrApprove, listCPModule[i].ID) > -1)
                    _Access |= 16;
                if (model.ArrDelete != null && Array.IndexOf(model.ArrDelete, listCPModule[i].ID) > -1)
                    _Access |= 8;
                if (model.ArrEdit != null && Array.IndexOf(model.ArrEdit, listCPModule[i].ID) > -1)
                    _Access |= 4;
                if (model.ArrAdd != null && Array.IndexOf(model.ArrAdd, listCPModule[i].ID) > -1)
                    _Access |= 2;
                if (model.ArrView != null && Array.IndexOf(model.ArrView, listCPModule[i].ID) > -1)
                    _Access |= 1;

                if (_Access > 0)
                {
                    if ((_Access & 1) != 1)
                        _Access |= 1;

                    CPAccessEntity _AccessEntity = new CPAccessEntity();
                    _AccessEntity.RefID = listCPModule[i].ID;
                    _AccessEntity.RoleID = entity.ID;
                    _AccessEntity.Value = _Access;
                    _AccessEntity.Type = "CP.MODULE";
                    CPAccessService.Instance.Save(_AccessEntity);
                }
            }
        }

        private int GetMaxOrder(SysRoleModel model)
        {
            return CPRoleService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion
    }

    public class SysRoleModel : DefaultModel
    {
        public int[] ArrApprove { get; set; }
        public int[] ArrApprove1 { get; set; }
        public int[] ArrDelete { get; set; }
        public int[] ArrEdit { get; set; }
        public int[] ArrAdd { get; set; }
        public int[] ArrView { get; set; }
        public int[] MenuIDs { get; set; }
    }
}
