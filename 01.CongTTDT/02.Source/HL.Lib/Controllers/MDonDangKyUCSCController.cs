using System;

using HL.Lib.MVC;
using HL.Lib.Models;
using System.Collections.Generic;
using HL.Lib.Global;
using HL.Core.Models;

namespace HL.Lib.Controllers
{
    public class MDonDangKyUCSCController : Controller
    {

        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|DonDangKyUCSC")]
        public int MenuID;

        //[HL.Core.MVC.PropertyInfo("Vị trí", "ConfigKey|Mod.DonDangKyUCSCState")]
        public int State;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        public void ActionIndex(MDonDangKyUCSCModel model)
        {
            if (ViewPage.CurrentPage.MenuID > 0)
                MenuID = ViewPage.CurrentPage.MenuID;
            int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;

            string endCode = ViewPage.CurrentPage.Code;
            DBQuery<ModDonDangKyUCSCEntity> dbQuery;

            if (endCode == "Thanh-vien-con-m2")
            {
                dbQuery = ModDonDangKyUCSCService.Instance.CreateQuery()
                                .Where(userId > 0, o => o.UserID == userId)
                                .Where(State > 0, o => (o.State & State) == State)
                                .Where(o => o.ParentID > 0)
                                .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("DonDangKyUCSC", MenuID, ViewPage.CurrentLang.ID))
                                .OrderByDesc(o => o.Order)
                                .Take(PageSize)
                                .Skip(PageSize * model.Page);
            }
            else
            {
                dbQuery = ModDonDangKyUCSCService.Instance.CreateQuery()
                                //.Where(o => o.Activity == true)
                                .Where(userId > 0, o => o.UserID == userId)
                                .Where(State > 0, o => (o.State & State) == State)
                                .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("DonDangKyUCSC", MenuID, ViewPage.CurrentLang.ID))
                                .OrderByDesc(o => o.Order)
                                .Take(PageSize)
                                .Skip(PageSize * model.Page);
            }

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            model.PageSize = PageSize;
            ViewBag.Model = model;
        }

        public void ActionDetail(string endCode)
        {
            string layout = "";
            string ec = endCode.ToLower();
            if (ec == "dang-ky-ung-cuu-su-co") layout = "DangKyUCSC";
            else if (ec == "sua-dang-ky-ung-cuu-su-co") layout = "DangKyUCSC";
            else if (ec == "ds-dang-ky-ung-cuu-su-co") layout = "Index";

            if (!string.IsNullOrEmpty(layout)) RenderView(layout);
            else
            {
                int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
                var entity = ModDonDangKyUCSCService.Instance.CreateQuery()
                            //.Where(o => o.Activity == true)
                            .Where(userId > 0, o => o.UserID == userId)
                            .Where(o => o.Code == endCode)
                            //.WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("DonDangKyUCSC", MenuID, ViewPage.CurrentLang.ID))
                            .ToSingle();

                if (entity != null)
                {
                    ViewBag.Other = ModDonDangKyUCSCService.Instance.CreateQuery()
                                            //.Where(o => o.Activity == true)
                                            .Where(o => o.Order < entity.Order)
                                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("DonDangKyUCSC", MenuID, ViewPage.CurrentLang.ID))
                                            .OrderByDesc(o => o.Order)
                                            .Take(PageSize)
                                            .ToList();

                    ViewBag.Data = entity;
                    SetObject["view.Meta"] = entity;

                    ViewBag.HTTT = ModHeThongThongTinService.Instance.CreateQuery()
                        .Where(o => o.Activity == true && o.DonDangKyUCSCID == entity.ID)
                        .ToList();
                    ViewBag.NhanLuc = ModNhanLucUCSCService.Instance.CreateQuery()
                        .Where(o => o.Activity == true && o.DonDangKyUCSCID == entity.ID)
                        .ToList();
                    ViewBag.EndCode = endCode;
                    ViewBag.ListTongHopNhanLucLVDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "LinhVucDaoDao");
                    ViewBag.ListTongHopNhanLucTDDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "TrinhDoDaoTao");
                    ViewBag.ListTongHopNhanLucCC = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "ChungChi");
                    ViewBag.ListTongHopNhanLucNhomATTT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "QuanLyATTT");
                    ViewBag.ListTongHopNhanLucNhomKTPT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "KyThuatPhongThu");
                    ViewBag.ListTongHopNhanLucNhomKTBV = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "KyThuatBaoVe");
                    ViewBag.ListTongHopNhanLucNhomKTKT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "KyThuatKiemTra");

                    RenderView("../MInfo/DangKyUCSC");
                }
                else
                {
                    ViewPage.Error404();
                }
            }
        }

        public void ActionXoaDangKy(string dangKyId)
        {
            int dkId = HL.Core.Global.Convert.ToInt(dangKyId, 0);
            int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
            var entity = ModDonDangKyUCSCService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(dkId > 0, o => o.ID == dkId)
                        .ToSingle();

            if (entity != null)
            {
                var httt = ModHeThongThongTinService.Instance.CreateQuery()
                    .Where(o => o.DonDangKyUCSCID == entity.ID)
                    .ToList();

                var nhanLuc = ModNhanLucUCSCService.Instance.CreateQuery()
                    .Where(o => o.DonDangKyUCSCID == entity.ID)
                    .ToList();

                ModDonDangKyUCSCService.Instance.Delete(entity.ID);
                if (httt != null) ModHeThongThongTinService.Instance.Delete(httt);
                if (nhanLuc != null) ModNhanLucUCSCService.Instance.Delete(nhanLuc);
                // Xoa tong hop nhan luc
                List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLuc = ModTongHopNhanLucUCSCService.Instance.GetByDonDangKyUCSCID(dkId);
                if (lstTongHopNhanLuc != null) ModTongHopNhanLucUCSCService.Instance.Delete(lstTongHopNhanLuc);

                ViewPage.Alert("Xóa đăng ký thành công.");
                ViewPage.Navigate(ViewPage.CurrentURL);
            }
            else
            {
                ViewPage.Alert("Bạn không có quyền thao tác trên bản đăng ký này.");
            }
        }

        public void ActionUpdateDangKyUCSC(ModDonDangKyUCSCEntity entityDk, MAppend append, MHSThanhVienUCSCModel model, string endCode)
        {
            int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
            var entity = ModDonDangKyUCSCService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(o => o.Code == endCode)
                        .ToSingle();
            if (entity != null)
            {
                DateTime date = DateTime.Now;

                entityDk.ID = entity.ID;
                entityDk.UserID = entity.UserID;
                entityDk.UserID1 = userId;
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
                var arr = model.M.Split('|');
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

                ViewBag.DangKy = entityDk;
                ViewBag.HTTT1 = entityHTTT;

                // LinhVucDaoDao
                string[] tongHopNhanLucs = append.TongHopNhanLucLVDT.Split('|');
                List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucLVDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "LinhVucDaoDao");
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
                List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucTDDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "TrinhDoDaoTao");
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
                List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucCC = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "ChungChi");
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
                List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomATTT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "QuanLyATTT");
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
                List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTPT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "KyThuatPhongThu");
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
                List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTBV = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "KyThuatBaoVe");
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
                List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTKT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByDonDangKyUCSCID(entity.ID, "KyThuatKiemTra");
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

                ViewPage.Alert("Cập nhật đăng ký thành công! Chúng tôi sẽ xem xét và phê duyệt đăng ký của bạn sớm nhất có thể.");
                ViewPage.Navigate("/vn/Thanh-vien/DS-dang-ky-ung-cuu-su-co.aspx");
            }
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
    }

    public class MDonDangKyUCSCModel
    {
        private int _Page = 0;
        public int Page
        {
            get { return _Page; }
            set { _Page = value - 1; }
        }

        public int PageSize { get; set; }
        public int TotalRecord { get; set; }
    }
}
