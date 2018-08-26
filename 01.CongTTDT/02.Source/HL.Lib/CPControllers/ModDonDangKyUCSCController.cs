using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModDonDangKyUCSCController : CPController
    {
        public ModDonDangKyUCSCController()
        {
            //khoi tao Service
            DataService = ModDonDangKyUCSCService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModDonDangKyUCSCModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModDonDangKyUCSCService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("DonDangKyUCSC", model.MenuID, model.LangID))
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModDonDangKyUCSCModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModDonDangKyUCSCService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
                entity.UserID1 = Lib.Global.CPLogin.UserID;

                //ViewBag.HTTT = ModHeThongThongTinService.Instance.CreateQuery()
                //    .Where(o => o.Activity == true && o.DonDangKyUCSCID == model.RecordID)
                //    .ToList();
                entityHTTT = ModHeThongThongTinService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.DonDangKyUCSCID == model.RecordID)
                    .ToList();
                entityNhanLuc = ModNhanLucUCSCService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.DonDangKyUCSCID == model.RecordID)
                    .ToList();
            }
            else
            {
                entity = new ModDonDangKyUCSCEntity();
                entityHTTT = new List<ModHeThongThongTinEntity>();
                entityNhanLuc = new List<ModNhanLucUCSCEntity>();

                // khoi tao gia tri mac dinh khi insert
                entity.MenuID = model.MenuID;
                entity.UserID = Lib.Global.CPLogin.UserID;
                entity.Published = DateTime.Now;
                entity.Activity = CPViewPage.UserPermissions.Approve;
                entity.Order = GetMaxOrder(model);
            }

            ViewBag.HTTT = entityHTTT;
            ViewBag.NhanLuc = entityNhanLuc;
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
            var query = ModHeThongThongTinService.Instance.CreateQuery().WhereIn(o => o.DonDangKyUCSCID, HL.Core.Global.Array.ToString(arrID)).ToSingle();
            if (query != null)
            {
                ModHeThongThongTinService.Instance.Delete(query);
            }

            //thong bao
            CPViewPage.SetMessage("Đã xóa thành công.");
            CPViewPage.RefreshPage();
        }

        public void ActionSave(ModDonDangKyUCSCModel model, ModDonDangKyUCSCEntity entityDk, MAppend append)
        {
            if (ValidSave(model, entityDk, append))
                SaveRedirect();
        }

        public void ActionApply(ModDonDangKyUCSCModel model, ModDonDangKyUCSCEntity entityDk, MAppend append)
        {
            if (ValidSave(model, entityDk, append))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModDonDangKyUCSCModel model, ModDonDangKyUCSCEntity entityDk, MAppend append)
        {
            if (ValidSave(model, entityDk, append))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModDonDangKyUCSCEntity entity = null;
        private List<ModHeThongThongTinEntity> entityHTTT = null;
        private List<ModNhanLucUCSCEntity> entityNhanLuc = null;

        private bool ValidSave(ModDonDangKyUCSCModel model, ModDonDangKyUCSCEntity entityDk, MAppend append)
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
                int id = ModDonDangKyUCSCService.Instance.Save(entity);
                if (model.RecordID > 0) UpdateOther(entity, model, append);
                else SaveOther(id, model, append);

                return true;
            }

            return false;
        }

        public void SaveOther(int id, ModDonDangKyUCSCModel donDkModel, MAppend append)
        {
            ViewBag.DangKy = entity;

            //He thong thong tin
            var arr = append.M.Split(';');
            List<ModHeThongThongTinEntity> entityHTTT = new List<ModHeThongThongTinEntity>();
            for (int i = 0; i < arr.Length; i++)
            {
                if (string.IsNullOrEmpty(arr[i])) continue;
                var tmp = arr[i].Split('_');
                int m = HL.Core.Global.Convert.ToInt(tmp[0], 0);
                if (m <= 0 || tmp.Length != 2) continue;
                var lstName = tmp[1].Split(',');

                for (int j = 0; j < lstName.Length; j++)
                {
                    if (string.IsNullOrEmpty(lstName[j])) continue;
                    var entityTmp = new ModHeThongThongTinEntity
                    {
                        DauMoiUCSCID = id,
                        MenuID = m,
                        Name = lstName[j],
                        Code = Data.GetCode(lstName[j]),
                        Published = DateTime.Now,
                        Order = GetMaxOrder_HTTT(),
                        Activity = true
                    };
                    entityHTTT.Add(entityTmp);
                }
                ModHeThongThongTinService.Instance.Save(entityHTTT);
            }

            // Nhan luc
            var nhanLucs = append.NhanLuc.Split('|');
            var cNhanLucs = nhanLucs.Length;
            List<ModNhanLucUCSCEntity> entityNhanLuc = new List<ModNhanLucUCSCEntity>();
            for (int i = 0; i < cNhanLucs; i++)
            {
                if (string.IsNullOrEmpty(nhanLucs[i])) continue;
                var nhanLuc = nhanLucs[i].Split('_');
                int cNhanLuc = nhanLuc.Length;
                if (cNhanLuc != 10) continue;
                var item = new ModNhanLucUCSCEntity()
                {
                    DonDangKyUCSCID = id,
                    Name = nhanLuc[0],
                    School = nhanLuc[1],
                    MenuIDs_LinhVucDT = nhanLuc[2],
                    MenuIDs_TrinhDoDT = nhanLuc[3],
                    MenuIDs_ChungChi = nhanLuc[4],
                    MenuIDs_QuanLyATTT = nhanLuc[5],
                    MenuIDs_KyThuatPhongThu = nhanLuc[6],
                    MenuIDs_KyThuatBaoVe = nhanLuc[7],
                    MenuIDs_KyThuatKiemTra = nhanLuc[8],
                    NamTotNghiep = HL.Core.Global.Convert.ToInt(nhanLuc[9], 0),
                    Activity = true,
                    Published = DateTime.Now,
                    Order = GetMaxOrder_NhanLuc()
                };
                entityNhanLuc.Add(item);
            }
            ViewBag.NhanLuc = entityNhanLuc;
            ModNhanLucUCSCService.Instance.Save(entityNhanLuc);
        }

        public void UpdateOther(ModDonDangKyUCSCEntity entityDk, ModDonDangKyUCSCModel model, MAppend append)
        {
            int userId = HL.Lib.Global.CPLogin.UserID;
            var entity = ModDonDangKyUCSCService.Instance.CreateQuery()
                        //.Where(userId > 0, o => o.UserID == userId)
                        .Where(o => o.Code == entityDk.Code)
                        .ToSingle();
            if (entity != null)
            {
                DateTime date = DateTime.Now;

                entityDk.ID = entity.ID;
                entityDk.UserID = entity.UserID;
                entityDk.UserID1 = entity.UserID1;
                entityDk.MenuID = entity.MenuID;
                entityDk.State = entity.State;
                entityDk.Name = entity.Name;
                entityDk.Code = entity.Code;
                entityDk.Order = entity.Order;
                entityDk.Published = entity.Published;
                entityDk.Published1 = date;
                entityDk.Activity = false;
                ModDonDangKyUCSCService.Instance.Save(entityDk);

                //He thong thong tin
                var httt = ModHeThongThongTinService.Instance.CreateQuery().Where(o => o.Activity == true && o.DonDangKyUCSCID == entity.ID).ToList();
                if (httt != null) ModHeThongThongTinService.Instance.Delete(httt);
                var arr = append.M.Split(';');
                List<ModHeThongThongTinEntity> entityHTTT = new List<ModHeThongThongTinEntity>();
                for (int i = 0; i < arr.Length; i++)
                {
                    if (string.IsNullOrEmpty(arr[i])) continue;
                    var tmp = arr[i].Split('_');
                    int m = HL.Core.Global.Convert.ToInt(tmp[0], 0);
                    if (m <= 0 || tmp.Length != 2) continue;
                    var lstName = tmp[1].Split(',');

                    for (int j = 0; j < lstName.Length; j++)
                    {
                        if (string.IsNullOrEmpty(lstName[j])) continue;
                        var entityTmp = new ModHeThongThongTinEntity
                        {
                            DonDangKyUCSCID = entity.ID,
                            MenuID = m,
                            Name = lstName[j],
                            Code = Data.GetCode(lstName[j]),
                            Published = DateTime.Now,
                            Order = GetMaxOrder_HTTT(),
                            Activity = true
                        };
                        entityHTTT.Add(entityTmp);
                    }
                    ModHeThongThongTinService.Instance.Save(entityHTTT);
                }

                // Nhan luc
                var nhanLucExist = ModNhanLucUCSCService.Instance.CreateQuery().Where(o => o.Activity == true && o.DonDangKyUCSCID == entity.ID).ToList();
                if (nhanLucExist != null) ModNhanLucUCSCService.Instance.Delete(nhanLucExist);
                var nhanLucs = append.NhanLuc.Split('|');
                var cNhanLucs = nhanLucs.Length;
                List<ModNhanLucUCSCEntity> entityNhanLuc = new List<ModNhanLucUCSCEntity>();
                for (int i = 0; i < cNhanLucs; i++)
                {
                    if (string.IsNullOrEmpty(nhanLucs[i])) continue;
                    var nhanLuc = nhanLucs[i].Split('_');
                    int cNhanLuc = nhanLuc.Length;
                    if (cNhanLuc != 10) continue;
                    var item = new ModNhanLucUCSCEntity()
                    {
                        DonDangKyUCSCID = entity.ID,
                        Name = nhanLuc[0],
                        School = nhanLuc[1],
                        MenuIDs_LinhVucDT = nhanLuc[2],
                        MenuIDs_TrinhDoDT = nhanLuc[3],
                        MenuIDs_ChungChi = nhanLuc[4],
                        MenuIDs_QuanLyATTT = nhanLuc[5],
                        MenuIDs_KyThuatPhongThu = nhanLuc[6],
                        MenuIDs_KyThuatBaoVe = nhanLuc[7],
                        MenuIDs_KyThuatKiemTra = nhanLuc[8],
                        NamTotNghiep = HL.Core.Global.Convert.ToInt(nhanLuc[9], 0),
                        Activity = true,
                        Published = DateTime.Now,
                        Order = GetMaxOrder_NhanLuc()
                    };
                    entityNhanLuc.Add(item);
                }
                ViewBag.NhanLuc = entityNhanLuc;
                ModNhanLucUCSCService.Instance.Save(entityNhanLuc);

                ViewBag.HoSo = entityDk;
                ViewBag.HTTT = entityHTTT;
                ViewBag.NhanLuc = entityNhanLuc;
            }
        }

        private int GetMaxOrder(ModDonDangKyUCSCModel model)
        {
            return ModDonDangKyUCSCService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_HTTT()
        {
            return ModHeThongThongTinService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_NhanLuc()
        {
            return ModNhanLucUCSCService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion
    }

    public class ModDonDangKyUCSCModel : DefaultModel
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

