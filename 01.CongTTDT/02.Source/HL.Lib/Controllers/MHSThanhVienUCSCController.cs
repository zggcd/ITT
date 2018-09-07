using System;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;
using System.Collections.Generic;

namespace HL.Lib.Controllers
{
    public class MHSThanhVienUCSCController : Controller
    {

        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|HSThanhVienUCSC")]
        public int MenuID;

        //[HL.Core.MVC.PropertyInfo("Vị trí", "ConfigKey|Mod.HSThanhVienUCSCState")]
        public int State;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        public void ActionIndex(MHSThanhVienUCSCModel model)
        {
            if (ViewPage.CurrentPage.MenuID > 0)
                MenuID = ViewPage.CurrentPage.MenuID;
            int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;

            var dbQuery = ModHSThanhVienUCSCService.Instance.CreateQuery()
                            //.Where(o => o.Activity == true)
                            .Where(userId > 0, o => o.UserID == userId)
                            .Where(State > 0, o => (o.State & State) == State)
                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("HSThanhVienUCSC", MenuID, ViewPage.CurrentLang.ID))
                            .OrderByDesc(o => o.Order)
                            .Take(PageSize)
                            .Skip(PageSize * model.Page);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            model.PageSize = PageSize;
            ViewBag.Model = model;
        }

        public void ActionDetail(string endCode)
        {
            string layout = "";
            string ec = endCode.ToLower();
            if (ec == "them-ho-so-ung-cuu-su-co") layout = "HoSoUCSC";
            else if (ec == "sua-ho-so-ung-cuu-su-co") layout = "HoSoUCSC";
            else if (ec == "ho-so-ung-cuu-su-co") layout = "Index";
            else if (ec == "dang-xuat")
            {
                string currUrl = ViewPage.Request.RawUrl;
                CPLogin.Logout();
                ViewPage.Response.Redirect(currUrl);
            }
            if (!string.IsNullOrEmpty(layout)) RenderView(layout);
            else
            {
                int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
                var entity = ModHSThanhVienUCSCService.Instance.CreateQuery()
                            //.Where(o => o.Activity == true)
                            .Where(userId > 0, o => o.UserID == userId)
                            .Where(o => o.Code == endCode)
                            //.WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("HSThanhVienUCSC", MenuID, ViewPage.CurrentLang.ID))
                            .ToSingle();

                if (entity != null)
                {
                    ViewBag.Other = ModHSThanhVienUCSCService.Instance.CreateQuery()
                                            .Where(o => o.Activity == true)
                                            .Where(o => o.Order < entity.Order)
                                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("HSThanhVienUCSC", MenuID, ViewPage.CurrentLang.ID))
                                            .OrderByDesc(o => o.Order)
                                            .Take(PageSize)
                                            .ToList();

                    ViewBag.Data = entity;
                    SetObject["view.Meta"] = entity;

                    ViewBag.HoSo = entity;
                    var dm = ModDauMoiUCSCService.Instance.CreateQuery()
                                            .Where(o => o.Activity == true && o.HSThanhVienUCSCID == entity.ID)
                                            .ToSingle();
                    ViewBag.DauMoi = dm;
                    ViewBag.HTTT = ModHeThongThongTinService.Instance.CreateQuery()
                        .Where(o => o.Activity == true && o.DauMoiUCSCID == dm.ID)
                        .ToList();
                    ViewBag.HTTT1 = ModHeThongThongTinService.Instance.CreateQuery()
                        .Where(o => o.Activity == true && o.DonDangKyUCSCID == entity.ID)
                        .ToList();
                    ViewBag.NhanLuc = ModNhanLucUCSCService.Instance.CreateQuery()
                        .Where(o => o.Activity == true && o.HSThanhVienUCSCID == entity.ID)
                        .ToList();
                    ViewBag.EndCode = endCode;

                    ViewBag.ListTongHopNhanLucLVDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "LinhVucDaoDao");
                    ViewBag.ListTongHopNhanLucTDDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "TrinhDoDaoTao");
                    ViewBag.ListTongHopNhanLucCC = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "ChungChi");
                    ViewBag.ListTongHopNhanLucNhomATTT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "QuanLyATTT");
                    ViewBag.ListTongHopNhanLucNhomKTPT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "KyThuatPhongThu");
                    ViewBag.ListTongHopNhanLucNhomKTBV = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "KyThuatBaoVe");
                    ViewBag.ListTongHopNhanLucNhomKTKT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "KyThuatKiemTra");

                    RenderView("../MInfo/HoSoUCSC");
                }
                else
                {
                    ViewPage.Error404();
                }
            }
        }

        public void ActionXoaHoSo(string hoSoId)
        {
            int hsId = HL.Core.Global.Convert.ToInt(hoSoId, 0);
            int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
            var entity = ModHSThanhVienUCSCService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(hsId > 0, o => o.ID == hsId)
                        .ToSingle();

            if (entity != null)
            {
                var dm = ModDauMoiUCSCService.Instance.CreateQuery()
                            .Where(o => o.HSThanhVienUCSCID == entity.ID)
                            .ToSingle();
                ModHSThanhVienUCSCService.Instance.Delete(entity.ID);
                if (dm != null)
                {
                    var httt = ModHeThongThongTinService.Instance.CreateQuery()
                        .Where(o => o.DauMoiUCSCID == dm.ID)
                        .ToList();
                    if (httt != null) ModHeThongThongTinService.Instance.Delete(httt);
                    ModDauMoiUCSCService.Instance.Delete(dm);

                    // Xoa nha luc
                    var nhanLuc = ModNhanLucUCSCService.Instance.CreateQuery()
                                    .Where(o => o.HSThanhVienUCSCID == entity.ID).ToList();
                    if (nhanLuc != null) ModNhanLucUCSCService.Instance.Delete(nhanLuc);

                    // Xoa tong hop nhan luc
                    List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLuc = ModTongHopNhanLucUCSCService.Instance.GetByHSThanhVienID(hsId);
                    if (lstTongHopNhanLuc != null) ModTongHopNhanLucUCSCService.Instance.Delete(lstTongHopNhanLuc);
                }

                ViewPage.Alert("Xóa hồ sơ thành công.");
                ViewPage.Navigate(ViewPage.CurrentURL);
            }
            else
            {
                ViewPage.Alert("Bạn không có quyền thao tác trên hồ sơ này.");
            }
        }

        public void ActionUpdateHoSoUCSC(ModHSThanhVienUCSCEntity entityHs, MAppend append, ModDauMoiUCSCEntity entityDm, MHSThanhVienUCSCModel model, string endCode)
        {
            int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
            var entity = ModHSThanhVienUCSCService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(o => o.Code == endCode)
                        .ToSingle();
            if (entity != null)
            {
                DateTime date = DateTime.Now;

                //Thong tin chung
                entityHs.ID = entity.ID;
                entityHs.UserID = entity.UserID;
                entityHs.UserID1 = userId;
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
                entityDm.Name = dm.Name;
                entityDm.Code = dm.Code;
                entityDm.Order = dm.Order;
                entityDm.Published = entity.Published;
                entityDm.Activity = dm.Activity;
                ModDauMoiUCSCService.Instance.Save(entityDm);

                //He thong thong tin
                var httt = ModHeThongThongTinService.Instance.CreateQuery().Where(o => o.Activity == true && o.DauMoiUCSCID == dm.ID).ToList();
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

                ViewBag.HoSo = entityHs;
                ViewBag.DauMoi = entityDm;
                ViewBag.HTTT = entityHTTT;


                /* =======================================================*/
                /* =======================================================*/
                #region ITT UPDATE
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

                // LinhVucDaoDao
                string[] tongHopNhanLucs = append.TongHopNhanLucLVDT.Split('|');
                List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucLVDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "LinhVucDaoDao");
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
                List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucTDDT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "TrinhDoDaoTao");
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
                List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucCC = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "ChungChi");
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
                List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomATTT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "QuanLyATTT");
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
                List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTPT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "KyThuatPhongThu");
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
                List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTBV = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "KyThuatBaoVe");
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
                List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTKT = ModTongHopNhanLucUCSCService.Instance.GetTongHopNhanLucByHSThanhVienID(entity.ID, "KyThuatKiemTra");
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
                ViewPage.Alert("Cập nhật hồ sơ thành công! Chúng tôi sẽ xem xét và phê duyệt hồ sơ của bạn sớm nhất có thể.");
                ViewPage.Navigate("/vn/Thanh-vien/Ho-so-ung-cuu-su-co.aspx");
            }

            //DateTime date = DateTime.Now;
            //string code = "HSUCSC" + ModHSThanhVienUCSCService.Instance.GetMaxID();
            //entity.Name = code;
            //entity.Code = Data.GetCode(code);
            //entity.UserID = Lib.Global.CPLogin.UserIDOnWeb;
            //entity.Published = date;
            //entity.Activity = false;
            //int id = ModHSThanhVienUCSCService.Instance.Save(entity);

            //WebMenuEntity menu = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "DauMoiUCSC" && o.Code == "Chinh").ToSingle();
            //entityDm.HSThanhVienUCSCID = id;
            //entityDm.MenuID = menu.ID;
            //entityDm.Published = date;
            //entityDm.Activity = true;
            //ModDauMoiUCSCService.Instance.Save(entityDm);

            //ViewPage.Alert("Tạo mới hồ sơ thành công! Chúng tôi sẽ xem xét và phê duyệt hồ sơ của bạn sớm nhất có thể.");
            //ViewPage.Navigate("/vn/Thanh-vien/Ho-so-ung-cuu-su-co.aspx");
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

    public class MHSThanhVienUCSCModel
    {
        private int _Page = 0;
        public int Page
        {
            get { return _Page; }
            set { _Page = value - 1; }
        }

        public int PageSize { get; set; }
        public int TotalRecord { get; set; }

        public string M { get; set; }
        public string NhanLuc { get; set; }
    }
}
