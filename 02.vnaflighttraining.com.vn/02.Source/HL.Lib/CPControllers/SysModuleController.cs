using System;
using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class SysModuleController : CPController
    {
        public SysModuleController()
        {
            //khoi tao Service
            DataService = SysModuleService.Instance;
            //CheckPermissions = false;
        }

        public void ActionIndex(SysModuleModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort, "[Type],[Order]");

            // tao danh sach
            var dbQuery = SysModuleService.Instance.CreateQuery()
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(SysModuleModel model)
        {
            if (model.RecordID > 0)
            {
                entity = SysModuleService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new SysModuleEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.TypeName = "HL.Lib.Controllers.[Name]Controller";
                entity.AssemblyName = "HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null";
                entity.Order = GetMaxOrder(model);
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(SysModuleModel model)
        {
            if (ValidSave(model))
                SaveRedirect();
        }

        public void ActionApply(SysModuleModel model)
        {
            if (ValidSave(model))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(SysModuleModel model)
        {
            if (ValidSave(model))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private SysModuleEntity entity = null;

        private bool ValidSave(SysModuleModel model)
        {
            TryUpdateModel(entity);

            ViewBag.Data = entity;
            ViewBag.Model = model;

            CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;

            //kiem tra ten 
            if (entity.Name.Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Nhập tên chức năng.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                try
                {
                    //save
                    SysModuleService.Instance.Save(entity);
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

        private int GetMaxOrder(SysModuleModel model)
        {
            return SysModuleService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion
    }

    public class SysModuleModel : DefaultModel
    {
    }
}
