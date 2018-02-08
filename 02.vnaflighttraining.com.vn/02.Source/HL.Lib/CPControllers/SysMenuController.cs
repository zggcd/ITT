using System;
using System.Collections.Generic;
using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class SysMenuController : CPController
    {
        public SysMenuController()
        {
            //khoi tao Service
            DataService = WebMenuService.Instance;
            //CheckPermissions = false;
        }

        public void ActionIndex(SysMenuModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort, "[Order]");

            // tao danh sach
            var dbQuery = WebMenuService.Instance.CreateQuery()
                                .Where(o => o.ParentID == model.ParentID && o.LangID == model.LangID)
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(SysMenuModel model)
        {
            if (model.RecordID > 0)
            {
                entity = WebMenuService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new WebMenuEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.ParentID = model.ParentID;
                entity.Activity = true;
                entity.LangID = model.LangID;
                entity.Order = GetMaxOrder(model);

                if (model.ParentID > 0)
                    entity.Type = WebMenuService.Instance.GetByID(model.ParentID).Type;
                else
                    entity.Type = "News";
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(SysMenuModel model)
        {
            if (ValidSave(model))
                SaveRedirect();
        }

        public void ActionApply(SysMenuModel model)
        {
            if (ValidSave(model))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(SysMenuModel model)
        {
            if (ValidSave(model))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        public override void ActionDelete(int[] arrID)
        {
            List<int> list = new List<int>();
            GetMenuIDChildForDelete(ref list, arrID);

            if (list != null && list.Count > 0)
            {
                string sWhere = "[ID] IN (" + HL.Core.Global.Array.ToString(list.ToArray()) + ")";

                //xoa menu
                WebMenuService.Instance.Delete(sWhere);

                sWhere = "[MenuID] IN (" + HL.Core.Global.Array.ToString(list.ToArray()) + ")";

                //xoa news
                ModNewsService.Instance.Delete(sWhere);
                //xoa adv
                ModAdvService.Instance.Delete(sWhere);
            }

            //thong bao
            CPViewPage.SetMessage("Đã xóa thành công.");
            CPViewPage.RefreshPage();
        }

        #region private func

        private WebMenuEntity entity = null;

        private bool ValidSave(SysMenuModel model)
        {
            TryUpdateModel(entity);

            ViewBag.Data = entity;
            ViewBag.Model = model;

            CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;

            //kiem tra ten 
            if (entity.Name.Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Nhập tên chuyên mục.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                // neu code khong duoc nhap -> tu dong tao ra khi them moi
                if (entity.Code == string.Empty)
                    entity.Code = Data.GetCode(entity.Name);

                try
                {
                    //neu di chuyen thi cap nhat lai Type va Order
                    if (model.RecordID > 0 && entity.ParentID != model.ParentID)
                    {
                        // cap nhat Type
                        if (entity.ParentID != 0)
                            entity.Type = WebMenuService.Instance.GetByID(entity.ParentID).Type;

                        //cap nhat Order
                        entity.Order = GetMaxOrder(model);
                    }

                    //save
                    WebMenuService.Instance.Save(entity);

                    //neu di chuyen thi cap nhat lai Type cua chuyen muc con
                    if (model.RecordID > 0 && entity.ParentID != model.ParentID && entity.ParentID != 0)
                    {
                        // lay danh sach chuyen muc con
                        List<int> list = new List<int>();
                        GetMenuIDChild(ref list, model.RecordID);

                        //cap nhat Type cho danh sach chuyen muc con
                        if (list.Count > 1)
                            WebMenuService.Instance.Update("[ID] IN (" + HL.Core.Global.Array.ToString(list.ToArray()) + ")",
                                "@Type", WebMenuService.Instance.GetByID(entity.ParentID).Type);
                    }
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

        private int GetMaxOrder(SysMenuModel model)
        {
            return WebMenuService.Instance.CreateQuery()
                    .Where(o => o.LangID == model.LangID && o.ParentID == model.ParentID)
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private void GetMenuIDChildForDelete(ref List<int> list, int[] ArrID)
        {
            for (int i = 0; ArrID != null && i < ArrID.Length; i++)
            {
                GetMenuIDChild(ref list, ArrID[i]);
            }
        }

        private void GetMenuIDChild(ref List<int> list, int menu_id)
        {
            list.Add(menu_id);

            List<WebMenuEntity> _ListMenu = WebMenuService.Instance.CreateQuery()
                                                .Where(o => o.ParentID == menu_id)
                                                .ToList();

            for (int i = 0; _ListMenu != null && i < _ListMenu.Count; i++)
            {
                GetMenuIDChild(ref list, _ListMenu[i].ID);
            }
        }

        #endregion
    }

    public class SysMenuModel : DefaultModel
    {
        public int ParentID { get; set; }
        private int _LangID = 1;
        public int LangID
        {
            get { return _LangID; }
            set { _LangID = value; }
        }
    }
}
