using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModBaoCaoTongHopController : CPController
    {
        public ModBaoCaoTongHopController()
        {
            //khoi tao Service
            DataService = ModBaoCaoTongHopService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModBaoCaoTongHopModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModBaoCaoTongHopService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("BaoCaoTongHop", model.MenuID, model.LangID))
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModBaoCaoTongHopModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModBaoCaoTongHopService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
                entity.UserID1 = Lib.Global.CPLogin.UserID;

                ViewBag.SuCo = ModSoLuongSuCoService.Instance.CreateQuery().Where(o => o.Activity == true && o.BaoCaoTongHopID == entity.ID).ToList();
            }
            else
            {
                entity = new ModBaoCaoTongHopEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.MenuID = model.MenuID;
                entity.UserID = Lib.Global.CPLogin.UserID;
                DateTime d = DateTime.Now;
                entity.TuNgay = d;
                entity.DenNgay = d;
                entity.Published = d;
                entity.Activity = CPViewPage.UserPermissions.Approve;
                entity.Order = GetMaxOrder(model);
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public override void ActionDelete(int[] arrID)
        {
            if (CheckPermissions && !CPViewPage.UserPermissions.Delete)
            {
                //thong bao
                CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;
                CPViewPage.Message.ListMessage.Add("Quyền hạn chế.");
                return;
            }

            DataService.Delete("[ID] IN (" + HL.Core.Global.Array.ToString(arrID) + ")");
            var query = ModSoLuongSuCoService.Instance.CreateQuery().WhereIn(o => o.BaoCaoTongHopID, HL.Core.Global.Array.ToString(arrID)).ToList();
            ModSoLuongSuCoService.Instance.Delete(query);

            //thong bao
            CPViewPage.SetMessage("Đã xóa thành công.");
            CPViewPage.RefreshPage();
        }

        public void ActionSave(ModBaoCaoTongHopModel model, MSoLuongSuCoModel entitySuCo)
        {
            if (ValidSave(model, entitySuCo))
                SaveRedirect();
        }

        public void ActionApply(ModBaoCaoTongHopModel model, MSoLuongSuCoModel entitySuCo)
        {
            if (ValidSave(model, entitySuCo))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModBaoCaoTongHopModel model, MSoLuongSuCoModel entitySuCo)
        {
            if (ValidSave(model, entitySuCo))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModBaoCaoTongHopEntity entity = null;

        private bool ValidSave(ModBaoCaoTongHopModel model, MSoLuongSuCoModel entitySuCo)
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
                CPViewPage.Message.ListMessage.Add("Nhập tên.");

            //kiem tra chuyen muc
            //if (entity.MenuID < 1)
            //    CPViewPage.Message.ListMessage.Add("Chọn chuyên mục.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                //neu khong nhap code -> tu sinh
                if (entity.Code.Trim() == string.Empty)
                    entity.Code = Data.GetCode(entity.Name);

                //cap nhat state
                entity.State = GetState(model.ArrState);

                //save
                int id = ModBaoCaoTongHopService.Instance.Save(entity);
                if (model.RecordID > 0) UpdateOther(entity, entitySuCo);
                else SaveOther(id, entitySuCo);

                return true;
            }

            return false;
        }

        private int GetMaxOrder(ModBaoCaoTongHopModel model)
        {
            return ModBaoCaoTongHopService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        public void SaveOther(int id, MSoLuongSuCoModel entitySuCo)
        {
            DateTime date = DateTime.Now;

            int c = entitySuCo.MN.Length;
            for (int i = 0; i < c; i++)
            {
                var suCo = new ModSoLuongSuCoEntity();
                bool flag = false;
                if (entitySuCo.SoLuong[i] > 0)
                {
                    suCo.SoLuong = entitySuCo.SoLuong[i];
                    flag = true;
                }
                if (entitySuCo.TuXuLy[i] > 0)
                {
                    suCo.TuXuLy = entitySuCo.TuXuLy[i];
                    flag = true;
                }
                if (entitySuCo.ToChucHoTro[i] > 0)
                {
                    suCo.ToChucHoTro = entitySuCo.ToChucHoTro[i];
                    flag = true;
                }
                if (entitySuCo.ToChucNuocNgoaiHoTro[i] > 0)
                {
                    suCo.ToChucNuocNgoaiHoTro = entitySuCo.ToChucNuocNgoaiHoTro[i];
                    flag = true;
                }
                if (entitySuCo.DeNghi[i] > 0)
                {
                    suCo.DeNghi = entitySuCo.DeNghi[i];
                    flag = true;
                }
                if (entitySuCo.ThietHaiUocTinh[i] > 0)
                {
                    suCo.ThietHaiUocTinh = entitySuCo.ThietHaiUocTinh[i];
                    flag = true;
                }
                if (flag == true)
                {
                    suCo.BaoCaoTongHopID = id;
                    suCo.MenuID = entitySuCo.MN[i];
                    suCo.Published = date;
                    suCo.Order = GetMaxOrder_SoSuCo();
                    suCo.Activity = true;

                    ModSoLuongSuCoService.Instance.Save(suCo);
                }
            }
        }

        public void UpdateOther(ModBaoCaoTongHopEntity entityBc, MSoLuongSuCoModel entitySuCo)
        {
            int userId = HL.Lib.Global.CPLogin.UserID;
            var entity = ModBaoCaoTongHopService.Instance.CreateQuery()
                        //.Where(userId > 0, o => o.UserID == userId)
                        .Where(o => o.Code == entityBc.Code)
                        .ToSingle();
            if (entity != null)
            {
                DateTime date = DateTime.Now;

                entityBc.ID = entity.ID;
                entityBc.UserID = entity.UserID;
                entityBc.UserID1 = userId;
                entityBc.MenuID = entity.MenuID;
                entityBc.State = entity.State;
                entityBc.Name = entity.Name;
                entityBc.Code = entity.Code;
                entityBc.Order = entity.Order;
                entityBc.Published = entity.Published;
                entityBc.Published1 = date;
                entityBc.Activity = false;

                var lstSuCo = ModSoLuongSuCoService.Instance.CreateQuery().Where(o => o.BaoCaoTongHopID == entity.ID).ToList();
                if (lstSuCo != null) ModSoLuongSuCoService.Instance.Delete(lstSuCo);
                int c = entitySuCo.MN.Length;
                for (int i = 0; i < c; i++)
                {
                    var suCo = new ModSoLuongSuCoEntity();
                    bool flag = false;
                    if (entitySuCo.SoLuong[i] > 0)
                    {
                        suCo.SoLuong = entitySuCo.SoLuong[i];
                        flag = true;
                    }
                    if (entitySuCo.TuXuLy[i] > 0)
                    {
                        suCo.TuXuLy = entitySuCo.TuXuLy[i];
                        flag = true;
                    }
                    if (entitySuCo.ToChucHoTro[i] > 0)
                    {
                        suCo.ToChucHoTro = entitySuCo.ToChucHoTro[i];
                        flag = true;
                    }
                    if (entitySuCo.ToChucNuocNgoaiHoTro[i] > 0)
                    {
                        suCo.ToChucNuocNgoaiHoTro = entitySuCo.ToChucNuocNgoaiHoTro[i];
                        flag = true;
                    }
                    if (entitySuCo.DeNghi[i] > 0)
                    {
                        suCo.DeNghi = entitySuCo.DeNghi[i];
                        flag = true;
                    }
                    if (entitySuCo.ThietHaiUocTinh[i] > 0)
                    {
                        suCo.ThietHaiUocTinh = entitySuCo.ThietHaiUocTinh[i];
                        flag = true;
                    }
                    if (flag == true)
                    {
                        int id = ModBaoCaoTongHopService.Instance.Save(entityBc);
                        suCo.BaoCaoTongHopID = id;
                        suCo.MenuID = entitySuCo.MN[i];
                        suCo.Published = date;
                        suCo.Order = GetMaxOrder_SoSuCo();
                        suCo.Activity = true;

                        ModSoLuongSuCoService.Instance.Save(suCo);
                    }
                }

                ViewBag.BaoCao = entityBc;
            }
        }

        private int GetMaxOrder_SoSuCo()
        {
            return ModSoLuongSuCoService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion
    }

    public class ModBaoCaoTongHopModel : DefaultModel
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

    public class MSoLuongSuCoModel
    {
        public int[] MN { get; set; }
        public int[] SoLuong { get; set; }
        public int[] TuXuLy { get; set; }
        public int[] ToChucHoTro { get; set; }
        public int[] ToChucNuocNgoaiHoTro { get; set; }
        public int[] DeNghi { get; set; }
        public int[] ThietHaiUocTinh { get; set; }
    }
}

