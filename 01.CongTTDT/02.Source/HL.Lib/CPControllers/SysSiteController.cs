using System;
using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class SysSiteController : CPController
    {
        public SysSiteController()
        {
            //khoi tao Service
            DataService = SysSiteService.Instance;
            //CheckPermissions = false;
        }

        public void ActionIndex(SysSiteModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort, "[Order]");

            // tao danh sach
            var dbQuery = SysSiteService.Instance.CreateQuery()
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(SysSiteModel model)
        {
            if (model.RecordID > 0)
            {
                entity = SysSiteService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new SysSiteEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.Order = GetMaxOrder(model);
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(SysSiteModel model)
        {
            if (ValidSave(model))
                SaveRedirect();
        }

        public void ActionApply(SysSiteModel model)
        {
            if (ValidSave(model))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(SysSiteModel model)
        {
            if (ValidSave(model))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        public void ActionDefaultGX(int id)
        {
            //update for id
            SysSiteService.Instance.Update(o => o.ID == id,
                "@Default", 1);

            //update for != id
            SysSiteService.Instance.Update(o => o.ID != id,
                "@Default", 0);

            //thong bao
            CPViewPage.SetMessage("Đã thực hiện thành công.");
            CPViewPage.RefreshPage();
        }

        #region private func

        private SysSiteEntity entity = null;

        private bool ValidSave(SysSiteModel model)
        {
            TryUpdateModel(entity);

            ViewBag.Data = entity;
            ViewBag.Model = model;

            CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;

            //kiem tra ten 
            if (entity.Name.Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Nhập tên site.");

            //kiem tra ma 
            if (entity.Code.Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Nhập mã.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                try
                {
                    //save
                    SysSiteService.Instance.Save(entity);
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

        private int GetMaxOrder(SysSiteModel model)
        {
            return SysSiteService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion
    }

    public class SysSiteModel : DefaultModel
    {
    }
}
