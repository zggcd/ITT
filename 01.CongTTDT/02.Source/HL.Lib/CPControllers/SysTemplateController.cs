using System;
using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class SysTemplateController : CPController
    {
        public SysTemplateController()
        {
            //khoi tao Service
            DataService = SysTemplateService.Instance;
            //CheckPermissions = false;
        }

        public void ActionIndex(SysTemplateModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort, "[Order]");

            // tao danh sach
            var dbQuery = SysTemplateService.Instance.CreateQuery()
                                .Where(o => o.LangID == model.LangID)
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(SysTemplateModel model)
        {
            if (model.RecordID > 0)
            {
                entity = SysTemplateService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new SysTemplateEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.LangID = model.LangID;
                entity.Order = GetMaxOrder(model);
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(SysTemplateModel model)
        {
            if (ValidSave(model))
                SaveRedirect();
        }

        public void ActionApply(SysTemplateModel model)
        {
            if (ValidSave(model))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(SysTemplateModel model)
        {
            if (ValidSave(model))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private SysTemplateEntity entity = null;

        private bool ValidSave(SysTemplateModel model)
        {
            TryUpdateModel(entity);

            ViewBag.Data = entity;
            ViewBag.Model = model;

            CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;

            //kiem tra ten 
            if (entity.Name.Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Nhập tên mẫu giao diện.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                try
                {
                    //save
                    SysTemplateService.Instance.Save(entity);
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

        private int GetMaxOrder(SysTemplateModel model)
        {
            return SysTemplateService.Instance.CreateQuery()
                    .Where(o => o.LangID == model.LangID)
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion
    }

    public class SysTemplateModel : DefaultModel
    {
        private int _LangID = 1;
        public int LangID
        {
            get { return _LangID; }
            set { _LangID = value; }
        }
    }
}
