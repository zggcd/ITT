using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModDonDangKyUCSCController : CPController
    {
        private List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucLVDT = null;
        private List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucTDDT = null;
        private List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucCC = null;
        private List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomATTT = null;
        private List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTPT = null;
        private List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTBV = null;
        private List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTKT = null;


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

                ViewBag.HTTT = ModHeThongThongTinService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.DonDangKyUCSCID == model.RecordID)
                    .ToList();

                // Danh sach nhan luc
                ViewBag.NhanLuc = ModNhanLucUCSCService.Instance.CreateQuery()
                        .Where(o => o.Activity == true && o.DonDangKyUCSCID == entity.ID)
                        .ToList();

                // Khoi tao tong hop nhan su
                lstTongHopNhanLucLVDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "LinhVucDaoDao");
                lstTongHopNhanLucTDDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "TrinhDoDaoTao");
                lstTongHopNhanLucCC = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "ChungChi");
                lstTongHopNhanLucNhomATTT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "QuanLyATTT");
                lstTongHopNhanLucNhomKTPT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "KyThuatPhongThu");
                lstTongHopNhanLucNhomKTBV = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "KyThuatBaoVe");
                lstTongHopNhanLucNhomKTKT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "KyThuatKiemTra");

            }
            else
            {
                entity = new ModDonDangKyUCSCEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.MenuID = model.MenuID;
                entity.UserID = Lib.Global.CPLogin.UserID;
                entity.Published = DateTime.Now;
                entity.Activity = CPViewPage.UserPermissions.Approve;
                entity.Order = GetMaxOrder(model);

                // Khoi tao tong hop nhan su
                lstTongHopNhanLucLVDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(0, "LinhVucDaoDao");
                lstTongHopNhanLucTDDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(0, "TrinhDoDaoTao");
                lstTongHopNhanLucCC = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(0, "ChungChi");
                lstTongHopNhanLucNhomATTT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(0, "QuanLyATTT");
                lstTongHopNhanLucNhomKTPT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(0, "KyThuatPhongThu");
                lstTongHopNhanLucNhomKTBV = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(0, "KyThuatBaoVe");
                lstTongHopNhanLucNhomKTKT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(0, "KyThuatKiemTra");
            }

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
            var query = ModHeThongThongTinService.Instance.CreateQuery().WhereIn(o => o.DonDangKyUCSCID, HL.Core.Global.Array.ToString(arrID)).ToSingle();
            if (query != null)
            {
                ModHeThongThongTinService.Instance.Delete(query);
            }

            // Xoa tong hop nhan luc
            for (int i = 0; i < arrID.Length; i++)
            {
                List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLuc = ModTongHopNhanLucUCSCService.Instance.GetByDonDangKyUCSCID(arrID[i]);
                if (lstTongHopNhanLuc != null && lstTongHopNhanLuc.Count > 0) ModTongHopNhanLucUCSCService.Instance.Delete(lstTongHopNhanLuc);
            }

            //thong bao
            CPViewPage.SetMessage("Đã xóa thành công.");
            CPViewPage.RefreshPage();
        }

        public void ActionSave(ModDonDangKyUCSCModel model, ModDonDangKyUCSCEntity entityDk)
        {
            if (ValidSave(model, entityDk))
                SaveRedirect();
        }

        public void ActionApply(ModDonDangKyUCSCModel model, ModDonDangKyUCSCEntity entityDk)
        {
            if (ValidSave(model, entityDk))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModDonDangKyUCSCModel model, ModDonDangKyUCSCEntity entityDk)
        {
            if (ValidSave(model, entityDk))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModDonDangKyUCSCEntity entity = null;

        private bool ValidSave(ModDonDangKyUCSCModel model, ModDonDangKyUCSCEntity entityDk)
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
            var nhanLucs = model.NhanLuc.Split('|');
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
                    ThangTotNghiep = iThang,
                    NamTotNghiep = iNam,
                    Activity = true,
                    Published = DateTime.Now,
                    Order = GetMaxOrder_NhanLuc()
                };
                entityNhanLuc.Add(item);
            }

            // LinhVucDaoDao
            string[] tongHopNhanLucs = model.TongHopNhanLucLVDT.Split('|');
            lstTongHopNhanLucLVDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "LinhVucDaoDao");
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
            tongHopNhanLucs = model.TongHopNhanLucTDDT.Split('|');
            lstTongHopNhanLucTDDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "TrinhDoDaoTao");
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
            tongHopNhanLucs = model.TongHopNhanLucCC.Split('|');
            lstTongHopNhanLucCC = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "ChungChi");
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
            tongHopNhanLucs = model.TongHopNhanLucNhomATTT.Split('|');
            lstTongHopNhanLucNhomATTT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "QuanLyATTT");
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
            tongHopNhanLucs = model.TongHopNhanLucNhomKTPT.Split('|');
            lstTongHopNhanLucNhomKTPT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "KyThuatPhongThu");
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
            tongHopNhanLucs = model.TongHopNhanLucNhomKTBV.Split('|');
            lstTongHopNhanLucNhomKTBV = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "KyThuatBaoVe");
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                if (menuId == 0 || thnl[1].Trim() == "") continue;

                int index = lstTongHopNhanLucNhomKTBV.FindIndex(ind => ind.MenuID == menuId);
                lstTongHopNhanLucNhomKTBV[index].MenuID_Value = Int32.Parse(thnl[1], 0);
            }

            tongHopNhanLucs = model.TongHopNhanLucNhomKTKT.Split('|');
            lstTongHopNhanLucNhomKTKT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "KyThuatKiemTra");
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
                int id = ModDonDangKyUCSCService.Instance.Save(entity);
                if (model.RecordID > 0) UpdateOther(entity, model);
                else SaveOther(id, model);

                return true;
            }
            ViewBag.NhanLuc = entityNhanLuc;

            return false;
        }

        public void SaveOther(int id, ModDonDangKyUCSCModel append)
        {
            ViewBag.DangKy = entity;

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
                    DauMoiUCSCID = id,
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


            #region ITT UPDATE
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
                    DonDangKyUCSCID = entity.ID,
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
                    DonDangKyUCSCID = entity.ID,
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
                    DonDangKyUCSCID = entity.ID,
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
                    DonDangKyUCSCID = entity.ID,
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
                    DonDangKyUCSCID = entity.ID,
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
                    DonDangKyUCSCID = entity.ID,
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
                    DonDangKyUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucNhomKTKT.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucNhomKTKT);

            #endregion
        }

        public void UpdateOther(ModDonDangKyUCSCEntity entityDk, ModDonDangKyUCSCModel model)
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
                entityDk.Activity = entity.Activity;
                ModDonDangKyUCSCService.Instance.Save(entityDk);

                //He thong thong tin
                var httt = ModHeThongThongTinService.Instance.CreateQuery().Where(o => o.Activity == true && o.DonDangKyUCSCID == entity.ID).ToList();
                if (httt != null) ModHeThongThongTinService.Instance.Delete(httt);
                var arr = model.M.Split('|');
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
                        DonDangKyUCSCID = entity.ID,
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

                /* ====================================================================================== */
                // Nhan luc
                string[] arrNhanLucInString = model.NhanLuc.Split('|');
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
                        DonDangKyUCSCID = entityDk.ID,
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
                string[] tongHopNhanLucs = model.TongHopNhanLucLVDT.Split('|');
                lstTongHopNhanLucLVDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "LinhVucDaoDao");
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
                tongHopNhanLucs = model.TongHopNhanLucTDDT.Split('|');
                lstTongHopNhanLucTDDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "TrinhDoDaoTao");
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
                tongHopNhanLucs = model.TongHopNhanLucCC.Split('|');
                lstTongHopNhanLucCC = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "ChungChi");
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
                tongHopNhanLucs = model.TongHopNhanLucNhomATTT.Split('|');
                lstTongHopNhanLucNhomATTT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "QuanLyATTT");
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
                tongHopNhanLucs = model.TongHopNhanLucNhomKTPT.Split('|');
                lstTongHopNhanLucNhomKTPT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "KyThuatPhongThu");
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
                tongHopNhanLucs = model.TongHopNhanLucNhomKTBV.Split('|');
                lstTongHopNhanLucNhomKTBV = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "KyThuatBaoVe");
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

                tongHopNhanLucs = model.TongHopNhanLucNhomKTKT.Split('|');
                lstTongHopNhanLucNhomKTKT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "KyThuatKiemTra");
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

                ViewBag.HoSo = entityDk;
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

        #region Export
        public void ActionExport(ModDonDangKyUCSCModel model)
        {
            //lấy danh sách
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModDonDangKyUCSCService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("DonDangKyUCSC", model.MenuID, model.LangID))
                                .OrderBy(orderBy);
            var listEntity = dbQuery.ToList();
            if (listEntity == null)
            {
                CPViewPage.SetMessage("Không có dữ liệu.");
                return;
            }

            //khai báo tập hợp bản ghi excel
            List<List<object>> list = new List<List<object>>();
            //khai báo 1 dòng excel
            List<object> _list = null;
            for (int i = 0; listEntity != null && listEntity.Count > 0 && i < listEntity.Count; i++)
            {
                var user = CPUserService.Instance.GetByID(listEntity[i].UserID);
                _list = new List<object>();
                _list.Add(user?.LoginName);
                _list.Add(listEntity[i].ToChuc_DiaChi);
                _list.Add(listEntity[i].ToChuc_Email);
                _list.Add(listEntity[i].ToChuc_DienThoai);
                _list.Add(listEntity[i].DauMoiLanhDao_DienThoaiDD);
                _list.Add(listEntity[i].DauMoiLanhDao_Ten);
                list.Add(_list);
            }

            //ghi exel
            string temp_file = CPViewPage.Server.MapPath("~/Data/upload/files/Excel/ThanhVien_" +
            string.Format("{0:yyyy_MM_dd}", DateTime.Now) + ".xlsx");
            string filePath = CPViewPage.Server.MapPath("~/TTPortal/Templates/Export_ThanhVien.xlsx");
            Excel.Export(list, 1, filePath, temp_file);
            //CPViewPage.Response.Write("Here!6");


            CPViewPage.Response.Clear();
            CPViewPage.Response.ContentType = "application/excel";
            CPViewPage.Response.AppendHeader("Content-Disposition", "attachment; filename=" + System.IO.Path.GetFileName(temp_file));
            CPViewPage.Response.WriteFile(temp_file);
            CPViewPage.Response.End();

            //CPViewPage.Response.Write("Here!");
        }
        #endregion Export
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
        public string M { get; set; }
        public string NhanLuc { get; set; }
        public string TongHopNhanLucLVDT { get; set; }
        public string TongHopNhanLucTDDT { get; set; }
        public string TongHopNhanLucCC { get; set; }
        public string TongHopNhanLucNhomATTT { get; set; }
        public string TongHopNhanLucNhomKTPT { get; set; }
        public string TongHopNhanLucNhomKTBV { get; set; }
        public string TongHopNhanLucNhomKTKT { get; set; }
    }
}

