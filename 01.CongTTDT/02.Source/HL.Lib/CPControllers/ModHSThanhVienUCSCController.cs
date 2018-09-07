using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModHSThanhVienUCSCController : CPController
    {
        public ModHSThanhVienUCSCController()
        {
            //khoi tao Service
            DataService = ModHSThanhVienUCSCService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModHSThanhVienUCSCModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModHSThanhVienUCSCService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("HSThanhVienUCSC", model.MenuID, model.LangID))
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModHSThanhVienUCSCModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModHSThanhVienUCSCService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
                entity.UserID1 = Lib.Global.CPLogin.UserID;

                entityDM = ModDauMoiUCSCService.Instance.CreateQuery()
                                        .Where(o => o.Activity == true && o.HSThanhVienUCSCID == model.RecordID)
                                        .ToSingle();
                entityHTTT = ModHeThongThongTinService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.DauMoiUCSCID == entityDM.ID)
                    .ToList();

                // Danh sach nhan luc
                ViewBag.NhanLuc = ModNhanLucUCSCService.Instance.CreateQuery()
                        .Where(o => o.Activity == true && o.HSThanhVienUCSCID == entity.ID)
                        .ToList();

                lstTongHopNhanLucLVDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "LinhVucDaoDao");
                lstTongHopNhanLucTDDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "TrinhDoDaoTao");
                lstTongHopNhanLucCC = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "ChungChi");
                lstTongHopNhanLucNhomATTT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "QuanLyATTT");
                lstTongHopNhanLucNhomKTPT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "KyThuatPhongThu");
                lstTongHopNhanLucNhomKTBV = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "KyThuatBaoVe");
                lstTongHopNhanLucNhomKTKT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "KyThuatKiemTra");

            }
            else
            {
                entity = new ModHSThanhVienUCSCEntity();
                entityDM = new ModDauMoiUCSCEntity();
                entityHTTT = new List<ModHeThongThongTinEntity>();

                // khoi tao gia tri mac dinh khi insert
                entity.MenuID = model.MenuID;
                entity.UserID = Lib.Global.CPLogin.UserID;
                entity.Published = DateTime.Now;
                entity.Activity = CPViewPage.UserPermissions.Approve;
                entity.Order = GetMaxOrder(model);

                lstTongHopNhanLucLVDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "LinhVucDaoDao");
                lstTongHopNhanLucTDDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "TrinhDoDaoTao");
                lstTongHopNhanLucCC = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "ChungChi");
                lstTongHopNhanLucNhomATTT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "QuanLyATTT");
                lstTongHopNhanLucNhomKTPT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "KyThuatPhongThu");
                lstTongHopNhanLucNhomKTBV = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "KyThuatBaoVe");
                lstTongHopNhanLucNhomKTKT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(0, "KyThuatKiemTra");
            }

            ViewBag.DauMoi = entityDM;
            ViewBag.HTTT = entityHTTT;
            ViewBag.Data = entity;
            ViewBag.Model = model;

            ViewBag.ListTongHopNhanLucLVDT = lstTongHopNhanLucLVDT;
            ViewBag.ListTongHopNhanLucTDDT = lstTongHopNhanLucTDDT;
            ViewBag.ListTongHopNhanLucCC = lstTongHopNhanLucCC;
            ViewBag.ListTongHopNhanLucNhomATTT = lstTongHopNhanLucNhomATTT;
            ViewBag.ListTongHopNhanLucNhomKTPT = lstTongHopNhanLucNhomKTPT;
            ViewBag.ListTongHopNhanLucNhomKTBV = lstTongHopNhanLucNhomKTBV;
            ViewBag.ListTongHopNhanLucNhomKTKT = lstTongHopNhanLucNhomKTKT;
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
            var query = ModDauMoiUCSCService.Instance.CreateQuery().WhereIn(o => o.HSThanhVienUCSCID, HL.Core.Global.Array.ToString(arrID)).ToSingle();
            if (query != null)
            {
                var httt = ModHeThongThongTinService.Instance.CreateQuery().Where(o => o.DauMoiUCSCID == query.ID).ToList();
                if (httt != null) ModHeThongThongTinService.Instance.Delete(httt);
                ModDauMoiUCSCService.Instance.Delete(query);
            }

            // Xoa tong hop nhan luc
            for (int i = 0; i < arrID.Length; i++)
            {
                List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLuc = ModTongHopNhanLucUCSCService.Instance.GetByHSThanhVienID(arrID[i]);
                if (lstTongHopNhanLuc != null && lstTongHopNhanLuc.Count > 0) ModTongHopNhanLucUCSCService.Instance.Delete(lstTongHopNhanLuc);
            }

            //thong bao
            CPViewPage.SetMessage("Đã xóa thành công.");
            CPViewPage.RefreshPage();
        }

        public void ActionSave(ModHSThanhVienUCSCModel model, ModDauMoiUCSCEntity entityDm, MAppend append)
        {
            if (ValidSave(model, entityDm, append))
                SaveRedirect();
        }

        public void ActionApply(ModHSThanhVienUCSCModel model, ModDauMoiUCSCEntity entityDm, MAppend append)
        {
            if (ValidSave(model, entityDm, append))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModHSThanhVienUCSCModel model, ModDauMoiUCSCEntity entityDm, MAppend append)
        {
            if (ValidSave(model, entityDm, append))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModHSThanhVienUCSCEntity entity = null;
        private ModDauMoiUCSCEntity entityDM = null;
        private List<ModHeThongThongTinEntity> entityHTTT = null;

        private List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucLVDT = null;
        private List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucTDDT = null;
        private List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucCC = null;
        private List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomATTT = null;
        private List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTPT = null;
        private List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTBV = null;
        private List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTKT = null;

        private bool ValidSave(ModHSThanhVienUCSCModel model, ModDauMoiUCSCEntity entityDm, MAppend append)
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

            #region ITT UPDATE
            var nhanLucs = append.NhanLuc.Split('|');
            var cNhanLucs = nhanLucs.Length;
            List<ModNhanLucUCSCEntity> entityNhanLuc = new List<ModNhanLucUCSCEntity>();
            for (int i = 0; i < cNhanLucs; i++)
            {
                if (string.IsNullOrEmpty(nhanLucs[i])) continue;
                var nhanLuc = nhanLucs[i].Split('_');
                int cNhanLuc = nhanLuc.Length;
                if (cNhanLuc != 10) continue;

                // Parse Nam/Thang tot nghiệp
                int iThang = 0;
                int iNam = 0;
                string[] arrNamThangTotNghiep = nhanLuc[9].Split('/');
                if (arrNamThangTotNghiep.Length == 2)   // Dinh dang MM/yyyy
                {
                    iThang = Int32.Parse(arrNamThangTotNghiep[0], 0);
                    iNam = Int32.Parse(arrNamThangTotNghiep[1], 0);
                }

                var item = new ModNhanLucUCSCEntity()
                {
                    HSThanhVienUCSCID = entity.ID,
                    Name = nhanLuc[0],
                    School = nhanLuc[1],
                    MenuIDs_LinhVucDT = nhanLuc[2],
                    MenuIDs_TrinhDoDT = nhanLuc[3],
                    MenuIDs_ChungChi = nhanLuc[4],
                    MenuIDs_QuanLyATTT = nhanLuc[5],
                    MenuIDs_KyThuatPhongThu = nhanLuc[6],
                    MenuIDs_KyThuatBaoVe = nhanLuc[7],
                    MenuIDs_KyThuatKiemTra = nhanLuc[8],
                    ThangTotNghiep = iThang,
                    NamTotNghiep = iNam,
                    Activity = true,
                    Published = DateTime.Now,
                    Order = GetMaxOrder_NhanLuc()
                };
                entityNhanLuc.Add(item);
            }
            // LinhVucDaoDao
            string[] tongHopNhanLucs = append.TongHopNhanLucLVDT.Split('|');
            lstTongHopNhanLucLVDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "LinhVucDaoDao");
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                if (menuId == 0 || thnl[1].Trim() == "") continue;

                int index = lstTongHopNhanLucLVDT.FindIndex(ind => ind.MenuID == menuId);
                lstTongHopNhanLucLVDT[index].MenuID_Value = Int32.Parse(thnl[1], 0);
            }

            // TrinhDoDaoTao
            tongHopNhanLucs = append.TongHopNhanLucTDDT.Split('|');
            lstTongHopNhanLucTDDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "TrinhDoDaoTao");
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                if (menuId == 0 || thnl[1].Trim() == "") continue;

                int index = lstTongHopNhanLucTDDT.FindIndex(ind => ind.MenuID == menuId);
                lstTongHopNhanLucTDDT[index].MenuID_Value = Int32.Parse(thnl[1], 0);
            }

            // ChungChi
            tongHopNhanLucs = append.TongHopNhanLucCC.Split('|');
            lstTongHopNhanLucCC = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "ChungChi");
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                if (menuId == 0 || thnl[1].Trim() == "") continue;

                int index = lstTongHopNhanLucCC.FindIndex(ind => ind.MenuID == menuId);
                lstTongHopNhanLucCC[index].MenuID_Value = Int32.Parse(thnl[1], 0);
            }

            // QuanLyATTT
            tongHopNhanLucs = append.TongHopNhanLucNhomATTT.Split('|');
            lstTongHopNhanLucNhomATTT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "QuanLyATTT");
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                if (menuId == 0 || thnl[1].Trim() == "") continue;

                int index = lstTongHopNhanLucNhomATTT.FindIndex(ind => ind.MenuID == menuId);
                lstTongHopNhanLucNhomATTT[index].MenuID_Value = Int32.Parse(thnl[1], 0);
            }

            //KyThuatPhongThu
            tongHopNhanLucs = append.TongHopNhanLucNhomKTPT.Split('|');
            lstTongHopNhanLucNhomKTPT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "KyThuatPhongThu");
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                if (menuId == 0 || thnl[1].Trim() == "") continue;

                int index = lstTongHopNhanLucNhomKTPT.FindIndex(ind => ind.MenuID == menuId);
                lstTongHopNhanLucNhomKTPT[index].MenuID_Value = Int32.Parse(thnl[1], 0);
            }

            // KyThuatBaoVe
            tongHopNhanLucs = append.TongHopNhanLucNhomKTBV.Split('|');
            lstTongHopNhanLucNhomKTBV = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "KyThuatBaoVe");
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                if (menuId == 0 || thnl[1].Trim() == "") continue;

                int index = lstTongHopNhanLucNhomKTBV.FindIndex(ind => ind.MenuID == menuId);
                lstTongHopNhanLucNhomKTBV[index].MenuID_Value = Int32.Parse(thnl[1], 0);
            }

            tongHopNhanLucs = append.TongHopNhanLucNhomKTKT.Split('|');
            lstTongHopNhanLucNhomKTKT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "KyThuatKiemTra");
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                if (menuId == 0 || thnl[1].Trim() == "") continue;

                int index = lstTongHopNhanLucNhomKTKT.FindIndex(ind => ind.MenuID == menuId);
                lstTongHopNhanLucNhomKTKT[index].MenuID_Value = Int32.Parse(thnl[1], 0);
            }

            ViewBag.ListTongHopNhanLucLVDT = lstTongHopNhanLucLVDT;
            ViewBag.ListTongHopNhanLucTDDT = lstTongHopNhanLucTDDT;
            ViewBag.ListTongHopNhanLucCC = lstTongHopNhanLucCC;
            ViewBag.ListTongHopNhanLucNhomATTT = lstTongHopNhanLucNhomATTT;
            ViewBag.ListTongHopNhanLucNhomKTPT = lstTongHopNhanLucNhomKTPT;
            ViewBag.ListTongHopNhanLucNhomKTBV = lstTongHopNhanLucNhomKTBV;
            ViewBag.ListTongHopNhanLucNhomKTKT = lstTongHopNhanLucNhomKTKT;
            #endregion

            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                //neu khong nhap code -> tu sinh
                if (entity.Code.Trim() == string.Empty)
                    entity.Code = Data.GetCode(entity.Name);

                //cap nhat state
                entity.State = GetState(model.ArrState);

                //save
                int id = ModHSThanhVienUCSCService.Instance.Save(entity);
                if (model.RecordID > 0) UpdateOther(entity, entityDm, append);
                else SaveOther(id, entityDm, append);

                return true;
            }
            ViewBag.NhanLuc = entityNhanLuc;

            return false;
        }

        public void SaveOther(int id, ModDauMoiUCSCEntity entityDm, MAppend append)
        {
            ViewBag.HoSo = entity;
            ViewBag.DauMoi = entityDm;

            WebMenuEntity menu = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "DauMoiUCSC" && o.Code == "Chinh").ToSingle();
            entityDm.HSThanhVienUCSCID = id;
            entityDm.MenuID = menu.ID;
            entityDm.Order = GetMaxOrder_DauMoi();
            entityDm.Published = DateTime.Now;
            entityDm.Activity = true;
            int id1 = ModDauMoiUCSCService.Instance.Save(entityDm);

            //He thong thong tin
            var arr = append.M.Split('|');
            List<ModHeThongThongTinEntity> entityHTTT = new List<ModHeThongThongTinEntity>();
            for (int i = 0; i < arr.Length; i++)
            {
                if (string.IsNullOrEmpty(arr[i])) continue;
                var tmp = arr[i].Split('_');
                int m = HL.Core.Global.Convert.ToInt(tmp[0], 0);
                if (m <= 0 || tmp.Length != 2) continue;
                var sName = tmp[1];

                if (string.IsNullOrEmpty(sName)) continue;
                var entityTmp = new ModHeThongThongTinEntity
                {
                    DauMoiUCSCID = id1,
                    MenuID = m,
                    Name = sName,
                    Code = Data.GetCode(sName),
                    Published = DateTime.Now,
                    Order = GetMaxOrder_HTTT(),
                    Activity = true
                };
                entityHTTT.Add(entityTmp);
                ModHeThongThongTinService.Instance.Save(entityHTTT);
            }

            #region ITT UPDATE
            // ITT UPDATE: Them nhan luc
            var nhanLucs = append.NhanLuc.Split('|');
            var cNhanLucs = nhanLucs.Length;
            List<ModNhanLucUCSCEntity> entityNhanLuc = new List<ModNhanLucUCSCEntity>();
            for (int i = 0; i < cNhanLucs; i++)
            {
                if (string.IsNullOrEmpty(nhanLucs[i])) continue;
                var nhanLuc = nhanLucs[i].Split('_');
                int cNhanLuc = nhanLuc.Length;
                if (cNhanLuc != 10) continue;

                // Parse Nam/Thang tot nghiệp
                int iThang = 0;
                int iNam = 0;
                string[] arrNamThangTotNghiep = nhanLuc[9].Split('/');
                if (arrNamThangTotNghiep.Length == 2)   // Dinh dang MM/yyyy
                {
                    iThang = Int32.Parse(arrNamThangTotNghiep[0], 0);
                    iNam = Int32.Parse(arrNamThangTotNghiep[1], 0);
                }

                var item = new ModNhanLucUCSCEntity()
                {
                    HSThanhVienUCSCID = id,
                    Name = nhanLuc[0],
                    School = nhanLuc[1],
                    MenuIDs_LinhVucDT = nhanLuc[2],
                    MenuIDs_TrinhDoDT = nhanLuc[3],
                    MenuIDs_ChungChi = nhanLuc[4],
                    MenuIDs_QuanLyATTT = nhanLuc[5],
                    MenuIDs_KyThuatPhongThu = nhanLuc[6],
                    MenuIDs_KyThuatBaoVe = nhanLuc[7],
                    MenuIDs_KyThuatKiemTra = nhanLuc[8],
                    ThangTotNghiep = iThang,
                    NamTotNghiep = iNam,
                    Activity = true,
                    Published = DateTime.Now,
                    Order = GetMaxOrder_NhanLuc()
                };
                entityNhanLuc.Add(item);
            }
            ViewBag.NhanLuc = entityNhanLuc;
            ModNhanLucUCSCService.Instance.Save(entityNhanLuc);

            // LinhVucDaoDao
            string[] tongHopNhanLucs = append.TongHopNhanLucLVDT.Split('|');
            lstTongHopNhanLucLVDT = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    HSThanhVienUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucLVDT.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucLVDT);

            // TrinhDoDaoTao
            tongHopNhanLucs = append.TongHopNhanLucTDDT.Split('|');
            lstTongHopNhanLucTDDT = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    HSThanhVienUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucTDDT.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucTDDT);

            // ChungChi
            tongHopNhanLucs = append.TongHopNhanLucCC.Split('|');
            lstTongHopNhanLucCC = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    HSThanhVienUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucCC.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucCC);

            // QuanLyATTT
            tongHopNhanLucs = append.TongHopNhanLucNhomATTT.Split('|');
            lstTongHopNhanLucNhomATTT = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    HSThanhVienUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucNhomATTT.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucNhomATTT);

            //KyThuatPhongThu
            tongHopNhanLucs = append.TongHopNhanLucNhomKTPT.Split('|');
            lstTongHopNhanLucNhomKTPT = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    HSThanhVienUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucNhomKTPT.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucNhomKTPT);

            // KyThuatBaoVe
            tongHopNhanLucs = append.TongHopNhanLucNhomKTBV.Split('|');
            lstTongHopNhanLucNhomKTBV = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    HSThanhVienUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucNhomKTBV.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucNhomKTBV);

            tongHopNhanLucs = append.TongHopNhanLucNhomKTKT.Split('|');
            lstTongHopNhanLucNhomKTKT = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    HSThanhVienUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucNhomKTKT.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucNhomKTKT);

            #endregion
        }

        public void UpdateOther(ModHSThanhVienUCSCEntity entityHs, ModDauMoiUCSCEntity entityDm, MAppend append)
        {
            int userId = HL.Lib.Global.CPLogin.UserID;
            var entity = ModHSThanhVienUCSCService.Instance.CreateQuery()
                        //.Where(userId > 0, o => o.UserID == userId)
                        .Where(o => o.Code == entityHs.Code)
                        .ToSingle();
            if (entity != null)
            {
                DateTime date = DateTime.Now;

                //Thong tin chung
                entityHs.ID = entity.ID;
                entityHs.UserID = entity.UserID;
                entityHs.UserID1 = entity.UserID1;
                entityHs.MenuID = entity.MenuID;
                entityHs.State = entity.State;
                entityHs.Name = entity.Name;
                entityHs.Code = entity.Code;
                entityHs.Order = entity.Order;
                entityHs.Published = entity.Published;
                entityHs.Published1 = date;
                entityHs.Activity = false;
                ModHSThanhVienUCSCService.Instance.Save(entityHs);

                //Dau moi UCSC
                var dm = ModDauMoiUCSCService.Instance.CreateQuery().Where(o => o.Activity == true && o.HSThanhVienUCSCID == entity.ID).ToSingle();
                entityDm.ID = dm.ID;
                entityDm.HSThanhVienUCSCID = dm.HSThanhVienUCSCID;
                entityDm.MenuID = dm.MenuID;
                entityDm.State = dm.State;
                entityDm.Name = append.Name1;
                entityDm.Code = Data.GetCode(append.Name1);
                entityDm.Order = dm.Order;
                entityDm.Published = entity.Published;
                entityDm.Activity = dm.Activity;
                ModDauMoiUCSCService.Instance.Save(entityDm);

                //He thong thong tin
                var httt = ModHeThongThongTinService.Instance.CreateQuery().Where(o => o.Activity == true && o.DauMoiUCSCID == dm.ID).ToList();
                if (httt != null) ModHeThongThongTinService.Instance.Delete(httt);
                var arr = append.M.Split('|');
                List<ModHeThongThongTinEntity> entityHTTT = new List<ModHeThongThongTinEntity>();
                for (int i = 0; i < arr.Length; i++)
                {
                    if (string.IsNullOrEmpty(arr[i])) continue;
                    var tmp = arr[i].Split('_');
                    int m = HL.Core.Global.Convert.ToInt(tmp[0], 0);
                    if (m <= 0 || tmp.Length != 2) continue;
                    string sName = tmp[1];

                    if (string.IsNullOrEmpty(sName)) continue;
                    var entityTmp = new ModHeThongThongTinEntity
                    {
                        DauMoiUCSCID = dm.ID,
                        MenuID = m,
                        Name = sName,
                        Code = Data.GetCode(sName),
                        Published = DateTime.Now,
                        Order = GetMaxOrder_HTTT(),
                        Activity = true,
                        DonDangKyUCSCID = entityHs.ID
                    };
                    entityHTTT.Add(entityTmp);
                    ModHeThongThongTinService.Instance.Save(entityHTTT);
                }

                /* ====================================================================================== */
                // Nhan luc
                string[] arrNhanLucInString = append.NhanLuc.Split('|');
                List<ModNhanLucUCSCEntity> lstNhanLucInViewBag = ViewBag.NhanLuc as List<ModNhanLucUCSCEntity> ?? new List<ModNhanLucUCSCEntity>();
                List<ModNhanLucUCSCEntity> lstNhanLucMoi = new List<ModNhanLucUCSCEntity>();

                for (int i = 0; i < arrNhanLucInString.Length; i++)
                {
                    if (string.IsNullOrEmpty(arrNhanLucInString[i])) continue;
                    var nhanLuc = arrNhanLucInString[i].Split('_');
                    int cNhanLuc = nhanLuc.Length;
                    if (cNhanLuc != 10) continue;

                    // Parse Nam/Thang tot nghiệp
                    int iThang = 0;
                    int iNam = 0;
                    string[] arrNamThangTotNghiep = nhanLuc[9].Split('/');
                    if (arrNamThangTotNghiep.Length == 2)
                    {
                        iThang = Int32.Parse(arrNamThangTotNghiep[0], 0);
                        iNam = Int32.Parse(arrNamThangTotNghiep[1], 0);
                    }

                    var item = new ModNhanLucUCSCEntity()
                    {
                        HSThanhVienUCSCID = entityHs.ID,
                        Name = nhanLuc[0],
                        School = nhanLuc[1],
                        MenuIDs_LinhVucDT = nhanLuc[2],
                        MenuIDs_TrinhDoDT = nhanLuc[3],
                        MenuIDs_ChungChi = nhanLuc[4],
                        MenuIDs_QuanLyATTT = nhanLuc[5],
                        MenuIDs_KyThuatPhongThu = nhanLuc[6],
                        MenuIDs_KyThuatBaoVe = nhanLuc[7],
                        MenuIDs_KyThuatKiemTra = nhanLuc[8],
                        ThangTotNghiep = iThang,
                        NamTotNghiep = iNam,
                        Activity = true,
                        Published = DateTime.Now,
                        Order = GetMaxOrder_NhanLuc()
                    };
                    lstNhanLucMoi.Add(item);
                }
                ModNhanLucUCSCService.Instance.Delete(lstNhanLucInViewBag);
                ModNhanLucUCSCService.Instance.Save(lstNhanLucMoi);
                ViewBag.NhanLuc = lstNhanLucMoi;

                #region ITT UPDATE
                // LinhVucDaoDao
                string[] tongHopNhanLucs = append.TongHopNhanLucLVDT.Split('|');
                lstTongHopNhanLucLVDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "LinhVucDaoDao");
                for (int i = 0; i < tongHopNhanLucs.Length; i++)
                {
                    if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                    string[] thnl = tongHopNhanLucs[i].Split('_');
                    int menuId = Int32.Parse(thnl[0], 0);
                    int menuId_value = Int32.Parse(thnl[1], 0);
                    if (menuId == 0) continue;

                    // REPLACE OR ADD TO LIST
                    int index = lstTongHopNhanLucLVDT.FindIndex(ind => ind.MenuID == menuId);
                    lstTongHopNhanLucLVDT[index].MenuID_Value = menuId_value;
                    lstTongHopNhanLucLVDT[index].UpdatedDate = DateTime.Now;
                }
                ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucLVDT.FindAll(o => o.MenuID_Value > 0));
                ModTongHopNhanLucUCSCService.Instance.Delete(lstTongHopNhanLucLVDT.FindAll(o => o.MenuID_Value <= 0));

                // TrinhDoDaoTao
                tongHopNhanLucs = append.TongHopNhanLucTDDT.Split('|');
                lstTongHopNhanLucTDDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "TrinhDoDaoTao");
                for (int i = 0; i < tongHopNhanLucs.Length; i++)
                {
                    if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                    string[] thnl = tongHopNhanLucs[i].Split('_');
                    int menuId = Int32.Parse(thnl[0], 0);
                    int menuId_value = Int32.Parse(thnl[1], 0);
                    if (menuId == 0) continue;

                    // REPLACE OR ADD TO LIST
                    int index = lstTongHopNhanLucTDDT.FindIndex(ind => ind.MenuID == menuId);
                    lstTongHopNhanLucTDDT[index].MenuID_Value = menuId_value;
                    lstTongHopNhanLucTDDT[index].UpdatedDate = DateTime.Now;
                }
                ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucTDDT.FindAll(o => o.MenuID_Value > 0));
                ModTongHopNhanLucUCSCService.Instance.Delete(lstTongHopNhanLucTDDT.FindAll(o => o.MenuID_Value <= 0));

                // ChungChi
                tongHopNhanLucs = append.TongHopNhanLucCC.Split('|');
                lstTongHopNhanLucCC = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "ChungChi");
                for (int i = 0; i < tongHopNhanLucs.Length; i++)
                {
                    if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                    string[] thnl = tongHopNhanLucs[i].Split('_');
                    int menuId = Int32.Parse(thnl[0], 0);
                    int menuId_value = Int32.Parse(thnl[1], 0);
                    if (menuId == 0) continue;

                    // REPLACE OR ADD TO LIST
                    int index = lstTongHopNhanLucCC.FindIndex(ind => ind.MenuID == menuId);
                    lstTongHopNhanLucCC[index].MenuID_Value = menuId_value;
                    lstTongHopNhanLucCC[index].UpdatedDate = DateTime.Now;
                }
                ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucCC.FindAll(o => o.MenuID_Value > 0));
                ModTongHopNhanLucUCSCService.Instance.Delete(lstTongHopNhanLucCC.FindAll(o => o.MenuID_Value <= 0));

                // QuanLyATTT
                tongHopNhanLucs = append.TongHopNhanLucNhomATTT.Split('|');
                lstTongHopNhanLucNhomATTT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "QuanLyATTT");
                for (int i = 0; i < tongHopNhanLucs.Length; i++)
                {
                    if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                    string[] thnl = tongHopNhanLucs[i].Split('_');
                    int menuId = Int32.Parse(thnl[0], 0);
                    int menuId_value = Int32.Parse(thnl[1], 0);
                    if (menuId == 0) continue;

                    // REPLACE OR ADD TO LIST
                    int index = lstTongHopNhanLucNhomATTT.FindIndex(ind => ind.MenuID == menuId);
                    lstTongHopNhanLucNhomATTT[index].MenuID_Value = menuId_value;
                    lstTongHopNhanLucNhomATTT[index].UpdatedDate = DateTime.Now;
                }
                ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucNhomATTT.FindAll(o => o.MenuID_Value > 0));
                ModTongHopNhanLucUCSCService.Instance.Delete(lstTongHopNhanLucNhomATTT.FindAll(o => o.MenuID_Value <= 0));

                //KyThuatPhongThu
                tongHopNhanLucs = append.TongHopNhanLucNhomKTPT.Split('|');
                lstTongHopNhanLucNhomKTPT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "KyThuatPhongThu");
                for (int i = 0; i < tongHopNhanLucs.Length; i++)
                {
                    if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                    string[] thnl = tongHopNhanLucs[i].Split('_');
                    int menuId = Int32.Parse(thnl[0], 0);
                    int menuId_value = Int32.Parse(thnl[1], 0);
                    if (menuId == 0) continue;

                    // REPLACE OR ADD TO LIST
                    int index = lstTongHopNhanLucNhomKTPT.FindIndex(ind => ind.MenuID == menuId);
                    lstTongHopNhanLucNhomKTPT[index].MenuID_Value = menuId_value;
                    lstTongHopNhanLucNhomKTPT[index].UpdatedDate = DateTime.Now;
                }
                ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucNhomKTPT.FindAll(o => o.MenuID_Value > 0));
                ModTongHopNhanLucUCSCService.Instance.Delete(lstTongHopNhanLucNhomKTPT.FindAll(o => o.MenuID_Value <= 0));

                // KyThuatBaoVe
                tongHopNhanLucs = append.TongHopNhanLucNhomKTBV.Split('|');
                lstTongHopNhanLucNhomKTBV = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "KyThuatBaoVe");
                for (int i = 0; i < tongHopNhanLucs.Length; i++)
                {
                    if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                    string[] thnl = tongHopNhanLucs[i].Split('_');
                    int menuId = Int32.Parse(thnl[0], 0);
                    int menuId_value = Int32.Parse(thnl[1], 0);
                    if (menuId == 0) continue;

                    // REPLACE OR ADD TO LIST
                    int index = lstTongHopNhanLucNhomKTBV.FindIndex(ind => ind.MenuID == menuId);
                    lstTongHopNhanLucNhomKTBV[index].MenuID_Value = menuId_value;
                    lstTongHopNhanLucNhomKTBV[index].UpdatedDate = DateTime.Now;
                }
                ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucNhomKTBV.FindAll(o => o.MenuID_Value > 0));
                ModTongHopNhanLucUCSCService.Instance.Delete(lstTongHopNhanLucNhomKTBV.FindAll(o => o.MenuID_Value <= 0));

                tongHopNhanLucs = append.TongHopNhanLucNhomKTKT.Split('|');
                lstTongHopNhanLucNhomKTKT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "KyThuatKiemTra");
                for (int i = 0; i < tongHopNhanLucs.Length; i++)
                {
                    if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                    string[] thnl = tongHopNhanLucs[i].Split('_');
                    int menuId = Int32.Parse(thnl[0], 0);
                    int menuId_value = Int32.Parse(thnl[1], 0);
                    if (menuId == 0) continue;

                    // REPLACE OR ADD TO LIST
                    int index = lstTongHopNhanLucNhomKTKT.FindIndex(ind => ind.MenuID == menuId);
                    lstTongHopNhanLucNhomKTKT[index].MenuID_Value = menuId_value;
                    lstTongHopNhanLucNhomKTKT[index].UpdatedDate = DateTime.Now;
                }
                ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucNhomKTKT.FindAll(o => o.MenuID_Value > 0));
                ModTongHopNhanLucUCSCService.Instance.Delete(lstTongHopNhanLucNhomKTKT.FindAll(o => o.MenuID_Value <= 0));

                #endregion

                ViewBag.HoSo = entityHs;
                ViewBag.DauMoi = entityDm;
                ViewBag.HTTT = entityHTTT;

                ViewBag.ListTongHopNhanLucLVDT = lstTongHopNhanLucLVDT;
                ViewBag.ListTongHopNhanLucTDDT = lstTongHopNhanLucTDDT;
                ViewBag.ListTongHopNhanLucCC = lstTongHopNhanLucCC;
                ViewBag.ListTongHopNhanLucNhomATTT = lstTongHopNhanLucNhomATTT;
                ViewBag.ListTongHopNhanLucNhomKTPT = lstTongHopNhanLucNhomKTPT;
                ViewBag.ListTongHopNhanLucNhomKTBV = lstTongHopNhanLucNhomKTBV;
                ViewBag.ListTongHopNhanLucNhomKTKT = lstTongHopNhanLucNhomKTKT;
            }
        }

        private int GetMaxOrder(ModHSThanhVienUCSCModel model)
        {
            return ModHSThanhVienUCSCService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_HTTT()
        {
            return ModHeThongThongTinService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_DauMoi()
        {
            return ModDauMoiUCSCService.Instance.CreateQuery()
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

    public class ModHSThanhVienUCSCModel : DefaultModel
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
        public string M { get; set; }
    }
}

