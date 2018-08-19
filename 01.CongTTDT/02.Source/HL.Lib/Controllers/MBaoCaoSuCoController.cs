using System;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;
using System.Text;
using System.Collections.Generic;

namespace HL.Lib.Controllers
{
    public class MBaoCaoSuCoController : Controller
    {

        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|BaoCaoBanDauSuCo")]
        public int MenuID;

        //[HL.Core.MVC.PropertyInfo("Vị trí", "ConfigKey|Mod.BaoCaoBanDauSuCoState")]
        public int State;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        public void ActionIndex(MBaoCaoSuCoModel model)
        {
            if (ViewPage.CurrentPage.MenuID > 0)
                MenuID = ViewPage.CurrentPage.MenuID;
            int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;

            var dbQuery = ModBaoCaoSuCoService.Instance.CreateQuery()
                            //.Where(o => o.Activity == true)
                            .Where(userId > 0, o => o.UserID == userId)
                            .Where(State > 0, o => (o.State & State) == State)
                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("BaoCaoSuCo", MenuID, ViewPage.CurrentLang.ID))
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
            string[] ecArr = ec.Split('-');
            if (ec == "them-bao-cao")
            {
                layout = "Add";
                ViewBag.Data = new ModBaoCaoSuCoEntity();
            }
            else if (ec.Contains("bc-ban-dau-su-co"))
            {
                int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
                string code = ecArr[0].ToString();
                ModBaoCaoSuCoEntity sc = ModBaoCaoSuCoService.Instance.CreateQuery()
                    .Where(userId > 0, o => o.UserID == userId)
                    .Where(o => o.Code == code)
                    .ToSingle();
                if (sc != null)
                {
                    ViewBag.BCSuCo = sc;
                    layout = "BCBanDauUCSC";
                    ModBaoCaoBanDauSuCoEntity bcBanDau = ModBaoCaoBanDauSuCoService.Instance.CreateQuery()
                        .Where(o => o.BaoCaoSuCoID == sc.ID)
                        .ToSingle();
                    if (bcBanDau == null)
                    {
                        DateTime dt = DateTime.Now;
                        bcBanDau = new ModBaoCaoBanDauSuCoEntity()
                        {
                            ChiTiet_NgayGioPhatHien = dt,
                            ThoiGianThucHien = dt
                        };
                    }
                    else
                    {
                        ViewBag.CachThuc = ModInfoMagicService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == bcBanDau.ID)
                            .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("CachThuc", MenuID, ViewPage.CurrentLang.ID))
                            .ToList();

                        ViewBag.ThongBao = ModInfoMagicService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == bcBanDau.ID)
                            .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("GuiThongBaoSuCo", MenuID, ViewPage.CurrentLang.ID))
                            .ToList();

                        ViewBag.DichVu = ModInfoMagicService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == bcBanDau.ID)
                            .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("DichVu", MenuID, ViewPage.CurrentLang.ID))
                            .ToList();

                        ViewBag.BienPhap = ModInfoMagicService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == bcBanDau.ID)
                            .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("BienPhapATTT", MenuID, ViewPage.CurrentLang.ID))
                            .ToList();

                        ViewBag.ThongTinGuiKem = ModInfoMagicService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == bcBanDau.ID)
                            .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("ThongTinGuiKem", MenuID, ViewPage.CurrentLang.ID))
                            .ToList();

                        //ViewBag.EndCode = code;
                        ViewBag.IsEdit = 1;
                    }

                    ViewBag.EndCode = code;
                    ViewBag.BaoCao = bcBanDau;
                }
            }
            else if (ec.Contains("bc-tong-hop-su-co"))
            {
                int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
                string code = ecArr[0].ToString();
                ModBaoCaoSuCoEntity sc = ModBaoCaoSuCoService.Instance.CreateQuery()
                    .Where(userId > 0, o => o.UserID == userId)
                    .Where(o => o.Code == code)
                    .ToSingle();
                if (sc != null)
                {
                    ViewBag.BCSuCo = sc;
                    layout = "BCTongHopUCSC";
                    ModBaoCaoTongHopEntity bcTongHop = ModBaoCaoTongHopService.Instance.CreateQuery()
                        .Where(o => o.BaoCaoSuCoID == sc.ID)
                        .ToSingle();
                    if (bcTongHop == null)
                    {
                        DateTime dt = DateTime.Now;
                        bcTongHop = new ModBaoCaoTongHopEntity()
                        {
                            TuNgay = dt,
                            DenNgay = dt
                        };
                    }
                    else
                    {
                        ViewBag.IsEdit = 1;
                        ViewBag.SuCo = ModSoLuongSuCoService.Instance.CreateQuery().Where(o => o.Activity == true && o.BaoCaoTongHopID == bcTongHop.ID).ToList();
                    }

                    ViewBag.EndCode = code;
                    ViewBag.BaoCao = bcTongHop;
                }
            }
            else if (ec.Contains("bc-ket-thuc-su-co"))
            {
                int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
                string code = ecArr[0].ToString();
                ModBaoCaoSuCoEntity sc = ModBaoCaoSuCoService.Instance.CreateQuery()
                    .Where(userId > 0, o => o.UserID == userId)
                    .Where(o => o.Code == code)
                    .ToSingle();
                if (sc != null)
                {

                    ViewBag.BCSuCo = sc;
                    layout = "BCKetThucUCSC";
                    ModBaoCaoKetThucSuCoEntity bcKetThuc = ModBaoCaoKetThucSuCoService.Instance.CreateQuery()
                        .Where(o => o.BaoCaoSuCoID == sc.ID)
                        .ToSingle();
                    ViewBag.BCBanDau = ModBaoCaoBanDauSuCoService.Instance.CreateQuery()
                        .Where(o => o.BaoCaoSuCoID == sc.ID)
                        .ToSingle();
                    if (bcKetThuc == null)
                    {
                        DateTime dt = DateTime.Now;
                        bcKetThuc = new ModBaoCaoKetThucSuCoEntity()
                        {
                            NgayBaoCao = dt,
                            NgayGioPhatHien = dt
                        };
                    }
                    else
                    {
                        ViewBag.IsEdit = 1;
                    }

                    ViewBag.EndCode = code;
                    ViewBag.BaoCao = bcKetThuc;
                }
            }

            if (!string.IsNullOrEmpty(layout)) RenderView(layout);
            else
            {
                int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
                var entity = ModBaoCaoSuCoService.Instance.CreateQuery()
                            //.Where(o => o.Activity == true)
                            .Where(userId > 0, o => o.UserID == userId)
                            .Where(o => o.Code == endCode)
                            //.WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("BaoCaoBanDauSuCo", MenuID, ViewPage.CurrentLang.ID))
                            .ToSingle();

                if (entity != null)
                {
                    ViewBag.Other = ModBaoCaoBanDauSuCoService.Instance.CreateQuery()
                                            .Where(o => o.Activity == true)
                                            .Where(o => o.Order < entity.Order)
                                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("BaoCaoBanDauSuCo", MenuID, ViewPage.CurrentLang.ID))
                                            .OrderByDesc(o => o.Order)
                                            .Take(PageSize)
                                            .ToList();

                    ViewBag.Data = entity;
                    SetObject["view.Meta"] = entity;

                    ViewBag.CachThuc = ModInfoMagicService.Instance.CreateQuery()
                        .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == entity.ID)
                        .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("CachThuc", MenuID, ViewPage.CurrentLang.ID))
                        .ToList();

                    ViewBag.ThongBao = ModInfoMagicService.Instance.CreateQuery()
                        .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == entity.ID)
                        .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("GuiThongBaoSuCo", MenuID, ViewPage.CurrentLang.ID))
                        .ToList();

                    ViewBag.DichVu = ModInfoMagicService.Instance.CreateQuery()
                        .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == entity.ID)
                        .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("DichVu", MenuID, ViewPage.CurrentLang.ID))
                        .ToList();

                    ViewBag.BienPhap = ModInfoMagicService.Instance.CreateQuery()
                        .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == entity.ID)
                        .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("BienPhapATTT", MenuID, ViewPage.CurrentLang.ID))
                        .ToList();

                    ViewBag.ThongTinGuiKem = ModInfoMagicService.Instance.CreateQuery()
                        .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == entity.ID)
                        .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("ThongTinGuiKem", MenuID, ViewPage.CurrentLang.ID))
                        .ToList();

                    ViewBag.BaoCao = entity;
                    ViewBag.EndCode = endCode;
                    RenderView("Add");
                    //layout = "Add";
                }
                else
                {
                    ViewPage.Error404();
                }
            }
        }

        public void ActionAdd(ModBaoCaoSuCoEntity entity, MBaoCaoSuCoModel model)
        {
            ViewBag.Data = entity;

            if (string.IsNullOrEmpty(entity.Name))
            {
                ViewPage.Message.ListMessage.Add("Bạn chưa nhập Tên tổ chức/cá nhân báo cáo sự cố.");
            }
            if (string.IsNullOrEmpty(entity.Address))
            {
                ViewPage.Message.ListMessage.Add("Bạn chưa nhập Địa chỉ.");
            }
            if (string.IsNullOrEmpty(entity.Phone))
            {
                ViewPage.Message.ListMessage.Add("Bạn chưa nhập Điện thoại.");
            }
            else
            {
                string checkPhone = Utils.GetMobilePhone(entity.Phone);
                if (string.IsNullOrEmpty(checkPhone))
                {
                    ViewPage.Message.ListMessage.Add("Số điện thoại không hợp lệ.");
                }
            }
            if (string.IsNullOrEmpty(entity.Email))
            {
                ViewPage.Message.ListMessage.Add("Bạn chưa nhập Email.");
            }
            else
            {
                string checkEmail = Utils.GetEmailAddress(entity.Email);
                if (string.IsNullOrEmpty(checkEmail))
                {
                    ViewPage.Message.ListMessage.Add("Email không hợp lệ.");
                }
            }

            if (ViewPage.Message.ListMessage.Count > 0)
            {
                string message = @"Thông tin còn thiếu hoặc chưa hợp lệ: \r\n";

                for (int i = 0; i < ViewPage.Message.ListMessage.Count; i++)
                    message += @"\r\n + " + ViewPage.Message.ListMessage[i];

                ViewPage.Alert(message);
            }
            else
            {
                string code = "BCSC" + ModBaoCaoSuCoService.Instance.GetMaxID();
                ////neu khong nhap code -> tu sinh
                //if (entity.Code.Trim() == string.Empty)
                //    entity.Code = Data.GetCode(entity.Name);

                ////cap nhat state
                //entity.State = GetState(model.ArrState);

                try
                {
                    WebMenuEntity menu = WebMenuService.Instance.CreateQuery()
                        .Where(o => o.Activity == true && o.Code == "Cho")
                        .ToSingle();
                    //save
                    entity.Code = code;
                    entity.MenuID = menu != null ? menu.ID : 0;
                    entity.UserID = Lib.Global.CPLogin.UserIDOnWeb;
                    entity.Published = DateTime.Now;
                    entity.Order = GetMaxOrder_BCSuCo();
                    entity.Activity = true;
                    ModBaoCaoSuCoService.Instance.Save(entity);
                }
                catch (Exception ex)
                {
                    Global.Error.Write(ex);
                    ViewPage.Alert(ex.Message);
                }

                ViewPage.Alert("Tạo báo cáo sự cố thành công.");
                ViewPage.Navigate("/vn/Bao-cao-su-co.aspx");
            }
        }

        public void ActionDelete(string baoCaoId)
        {
            int bcId = HL.Core.Global.Convert.ToInt(baoCaoId, 0);
            int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
            var entity = ModBaoCaoSuCoService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(bcId > 0, o => o.ID == bcId)
                        .ToSingle();

            if (entity != null)
            {
                DelBCBanDau(entity.ID);
                DelBCTongHop(entity.ID);
                DelBCKetThuc(entity.ID);
                ModBaoCaoSuCoService.Instance.Delete(entity.ID);

                ViewPage.Alert("Xóa báo cáo thành công.");
                ViewPage.RefreshPage();
            }
            else
            {
                ViewPage.Alert("Bạn không có quyền thao tác trên báo cáo này.");
            }
        }

        public void ActionUpdate(ModBaoCaoSuCoEntity entity, MBaoCaoSuCoModel model, string endCode)
        {
            int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
            var bc = ModBaoCaoSuCoService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(o => o.Code == endCode)
                        .ToSingle();
            if (bc != null)
            {
                ViewBag.Data = entity;

                if (string.IsNullOrEmpty(entity.Name))
                {
                    ViewPage.Message.ListMessage.Add("Bạn chưa nhập Tên tổ chức/cá nhân báo cáo sự cố.");
                }
                if (string.IsNullOrEmpty(entity.Address))
                {
                    ViewPage.Message.ListMessage.Add("Bạn chưa nhập Địa chỉ.");
                }
                if (string.IsNullOrEmpty(entity.Phone))
                {
                    ViewPage.Message.ListMessage.Add("Bạn chưa nhập Điện thoại.");
                }
                if (string.IsNullOrEmpty(entity.Email))
                {
                    ViewPage.Message.ListMessage.Add("Bạn chưa nhập Email.");
                }

                if (ViewPage.Message.ListMessage.Count > 0)
                {
                    string message = @"Thông tin còn thiếu hoặc chưa hợp lệ: \r\n";

                    for (int i = 0; i < ViewPage.Message.ListMessage.Count; i++)
                        message += @"\r\n + " + ViewPage.Message.ListMessage[i];

                    ViewPage.Alert(message);
                }
                else
                {
                    try
                    {
                        //save
                        bc.Name = entity.Name;
                        bc.Address = entity.Address;
                        bc.Phone = entity.Phone;
                        bc.Email = entity.Email;
                        bc.UserID1 = Lib.Global.CPLogin.UserIDOnWeb;
                        bc.Published1 = DateTime.Now;
                        ModBaoCaoSuCoService.Instance.Save(bc);
                    }
                    catch (Exception ex)
                    {
                        Global.Error.Write(ex);
                        ViewPage.Alert(ex.Message);
                    }

                    ViewPage.Alert("Cập nhật báo cáo thành công.");
                }
            }
        }

        public void ActionAddBCBanDauUCSC(ModBaoCaoBanDauSuCoEntity entity, MInfoMagicModel modelInfo, MAppend append, string endCode)
        {
            bool isValid = ValidBCBanDau(ref entity, modelInfo, append, endCode);

            #region Get model
            ViewBag.BaoCao = entity;

            // Cach thuc phat hien
            int num = modelInfo.chkCachThuc != null ? modelInfo.chkCachThuc.Length : 0;
            List<ModInfoMagicEntity> listInfoMagic = new List<ModInfoMagicEntity>();
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkCachThuc[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity infoMagic = new ModInfoMagicEntity() { MenuID = HL.Core.Global.Convert.ToInt(tmp[2]) };
                    listInfoMagic.Add(infoMagic);
                }
            }
            ViewBag.CachThuc = listInfoMagic;

            // Da gui thong bao su co cho
            num = modelInfo.chkThongBao != null ? modelInfo.chkThongBao.Length : 0;
            listInfoMagic = new List<ModInfoMagicEntity>();
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkThongBao[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity infoMagic = new ModInfoMagicEntity() { MenuID = HL.Core.Global.Convert.ToInt(tmp[2]) };
                    listInfoMagic.Add(infoMagic);
                }
            }
            ViewBag.ThongBao = listInfoMagic;

            // Dich vu
            num = modelInfo.chkDichVu != null ? modelInfo.chkDichVu.Length : 0;
            listInfoMagic = new List<ModInfoMagicEntity>();
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkDichVu[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity infoMagic = new ModInfoMagicEntity() { MenuID = HL.Core.Global.Convert.ToInt(tmp[2]) };
                    listInfoMagic.Add(infoMagic);
                }
            }
            ViewBag.DichVu = listInfoMagic;

            // Bien phap
            num = modelInfo.chkBienPhap != null ? modelInfo.chkBienPhap.Length : 0;
            listInfoMagic = new List<ModInfoMagicEntity>();
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkBienPhap[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity infoMagic = new ModInfoMagicEntity() { MenuID = HL.Core.Global.Convert.ToInt(tmp[2]) };
                    listInfoMagic.Add(infoMagic);
                }
            }
            ViewBag.BienPhap = listInfoMagic;

            // Thong tin gui kem
            num = modelInfo.chkThongTinGuiKem != null ? modelInfo.chkThongTinGuiKem.Length : 0;
            listInfoMagic = new List<ModInfoMagicEntity>();
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkThongTinGuiKem[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity infoMagic = new ModInfoMagicEntity() { MenuID = HL.Core.Global.Convert.ToInt(tmp[2]) };
                    listInfoMagic.Add(infoMagic);
                }
            }
            ViewBag.ThongTinGuiKem = listInfoMagic;
            #endregion Get model

            if (isValid == true)
            {
                int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
                string ec = endCode.ToLower();
                string[] ecArr = ec.Split('-');
                string codes = ecArr[0].ToString();
                ModBaoCaoSuCoEntity sc = ModBaoCaoSuCoService.Instance.CreateQuery()
                    .Where(userId > 0, o => o.UserID == userId)
                    .Where(o => o.Code == codes)
                    .ToSingle();
                if (sc != null)
                {

                    DateTime date = DateTime.Now;
                    string ngayGioPhatHien = append.Ngay + " " + append.Gio + ":" + append.Phut;
                    string[] arr = append.ThoiGian.Split('/');
                    string thoiGianThucHien = "";
                    if (arr.Length == 5) thoiGianThucHien = arr[0] + "/" + arr[1] + "/" + arr[2] + " " + arr[3] + ":" + arr[4];
                    string code = "BCBDSC" + ModBaoCaoBanDauSuCoService.Instance.GetMaxID();
                    entity.Name = code;
                    entity.Code = Data.GetCode(code);
                    entity.UserID = Lib.Global.CPLogin.UserIDOnWeb;
                    if (!string.IsNullOrEmpty(ngayGioPhatHien)) entity.ChiTiet_NgayGioPhatHien = HL.Core.Global.Convert.ToDateTime(ngayGioPhatHien);
                    else entity.ChiTiet_NgayGioPhatHien = DateTime.MinValue;
                    if (!string.IsNullOrEmpty(thoiGianThucHien)) entity.ThoiGianThucHien = HL.Core.Global.Convert.ToDateTime(thoiGianThucHien);
                    else entity.ThoiGianThucHien = DateTime.MinValue;
                    entity.Order = GetMaxOrder_BCBanDau();
                    entity.Published = date;
                    entity.Activity = true;
                    entity.BaoCaoSuCoID = sc.ID;
                    int id = ModBaoCaoBanDauSuCoService.Instance.Save(entity);

                    //Cach thuc phat hien
                    num = modelInfo.chkCachThuc != null ? modelInfo.chkCachThuc.Length : 0;
                    for (int i = 0; i < num; i++)
                    {
                        string[] tmp = modelInfo.chkCachThuc[i].Split('_');
                        if (tmp.Length == 3)
                        {
                            ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                            {
                                BaoCaoBanDauSuCoID = id,
                                Order = GetMaxOrder_InfoMagic(),
                                Published = date,
                                Activity = true
                            };
                            entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                            if (tmp[0] == "1")
                            {
                                int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                                if (modelInfo.txtCachThuc != null && modelInfo.txtCachThuc.Length >= idx)
                                {
                                    entityTmp.Name = modelInfo.txtCachThuc[idx];
                                    entityTmp.Code = Data.GetCode(modelInfo.txtCachThuc[idx]);
                                }
                            }
                            ModInfoMagicService.Instance.Save(entityTmp);
                        }
                    }

                    //Da gui thong bao su co
                    num = modelInfo.chkThongBao != null ? modelInfo.chkThongBao.Length : 0;
                    for (int i = 0; i < num; i++)
                    {
                        string[] tmp = modelInfo.chkThongBao[i].Split('_');
                        if (tmp.Length == 3)
                        {
                            ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                            {
                                BaoCaoBanDauSuCoID = id,
                                Order = GetMaxOrder_InfoMagic(),
                                Published = date,
                                Activity = true
                            };
                            entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                            if (tmp[0] == "1")
                            {
                                int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                                if (modelInfo.txtThongBao != null && modelInfo.txtThongBao.Length >= idx)
                                {
                                    entityTmp.Name = modelInfo.txtThongBao[idx];
                                    entityTmp.Code = Data.GetCode(modelInfo.txtThongBao[idx]);
                                }
                            }
                            ModInfoMagicService.Instance.Save(entityTmp);
                        }
                    }

                    //Dich vu
                    num = modelInfo.chkDichVu != null ? modelInfo.chkDichVu.Length : 0;
                    for (int i = 0; i < num; i++)
                    {
                        string[] tmp = modelInfo.chkDichVu[i].Split('_');
                        if (tmp.Length == 3)
                        {
                            ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                            {
                                BaoCaoBanDauSuCoID = id,
                                Order = GetMaxOrder_InfoMagic(),
                                Published = date,
                                Activity = true
                            };
                            entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                            if (tmp[0] == "1")
                            {
                                int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                                if (modelInfo.txtDichVu != null && modelInfo.txtDichVu.Length >= idx)
                                {
                                    entityTmp.Name = modelInfo.txtDichVu[idx];
                                    entityTmp.Code = Data.GetCode(modelInfo.txtDichVu[idx]);
                                }
                            }
                            ModInfoMagicService.Instance.Save(entityTmp);
                        }
                    }

                    //Bien phap
                    num = modelInfo.chkBienPhap != null ? modelInfo.chkBienPhap.Length : 0;
                    for (int i = 0; i < num; i++)
                    {
                        string[] tmp = modelInfo.chkBienPhap[i].Split('_');
                        if (tmp.Length == 3)
                        {
                            ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                            {
                                BaoCaoBanDauSuCoID = id,
                                Order = GetMaxOrder_InfoMagic(),
                                Published = date,
                                Activity = true
                            };
                            entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                            if (tmp[0] == "1")
                            {
                                int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                                if (modelInfo.txtBienPhap != null && modelInfo.txtBienPhap.Length >= idx)
                                {
                                    entityTmp.Name = modelInfo.txtBienPhap[idx];
                                    entityTmp.Code = Data.GetCode(modelInfo.txtBienPhap[idx]);
                                }
                            }
                            ModInfoMagicService.Instance.Save(entityTmp);
                        }
                    }

                    //Thong tin gui kem
                    num = modelInfo.chkThongTinGuiKem != null ? modelInfo.chkThongTinGuiKem.Length : 0;
                    for (int i = 0; i < num; i++)
                    {
                        string[] tmp = modelInfo.chkThongTinGuiKem[i].Split('_');
                        if (tmp.Length == 3)
                        {
                            ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                            {
                                BaoCaoBanDauSuCoID = id,
                                Order = GetMaxOrder_InfoMagic(),
                                Published = date,
                                Activity = true
                            };
                            entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                            if (tmp[0] == "1")
                            {
                                int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                                if (modelInfo.txtThongTinGuiKem != null && modelInfo.txtThongTinGuiKem.Length >= idx)
                                {
                                    entityTmp.Name = modelInfo.txtThongTinGuiKem[idx];
                                    entityTmp.Code = Data.GetCode(modelInfo.txtThongTinGuiKem[idx]);
                                }
                            }
                            ModInfoMagicService.Instance.Save(entityTmp);
                        }
                    }

                    ViewPage.Alert("Tạo báo cáo ban đầu thành công.");
                    ViewPage.Navigate("/vn/Bao-cao-su-co.aspx");
                    //ViewPage.RefreshPage();
                }
            }
        }

        public void ActionUpdateBCBanDauUCSC(ModBaoCaoBanDauSuCoEntity entityBc, MInfoMagicModel modelInfo, MAppend append, string endCode)
        {
            bool isValid = ValidBCBanDau(ref entityBc, modelInfo, append, endCode);

            #region Get model
            ViewBag.BaoCao = entityBc;

            // Cach thuc phat hien
            int num = modelInfo.chkCachThuc != null ? modelInfo.chkCachThuc.Length : 0;
            List<ModInfoMagicEntity> listInfoMagic = new List<ModInfoMagicEntity>();
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkCachThuc[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity infoMagic = new ModInfoMagicEntity() { MenuID = HL.Core.Global.Convert.ToInt(tmp[2]) };
                    listInfoMagic.Add(infoMagic);
                }
            }
            ViewBag.CachThuc = listInfoMagic;

            // Da gui thong bao su co cho
            num = modelInfo.chkThongBao != null ? modelInfo.chkThongBao.Length : 0;
            listInfoMagic = new List<ModInfoMagicEntity>();
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkThongBao[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity infoMagic = new ModInfoMagicEntity() { MenuID = HL.Core.Global.Convert.ToInt(tmp[2]) };
                    listInfoMagic.Add(infoMagic);
                }
            }
            ViewBag.ThongBao = listInfoMagic;

            // Dich vu
            num = modelInfo.chkDichVu != null ? modelInfo.chkDichVu.Length : 0;
            listInfoMagic = new List<ModInfoMagicEntity>();
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkDichVu[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity infoMagic = new ModInfoMagicEntity() { MenuID = HL.Core.Global.Convert.ToInt(tmp[2]) };
                    listInfoMagic.Add(infoMagic);
                }
            }
            ViewBag.DichVu = listInfoMagic;

            // Bien phap
            num = modelInfo.chkBienPhap != null ? modelInfo.chkBienPhap.Length : 0;
            listInfoMagic = new List<ModInfoMagicEntity>();
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkBienPhap[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity infoMagic = new ModInfoMagicEntity() { MenuID = HL.Core.Global.Convert.ToInt(tmp[2]) };
                    listInfoMagic.Add(infoMagic);
                }
            }
            ViewBag.BienPhap = listInfoMagic;

            // Thong tin gui kem
            num = modelInfo.chkThongTinGuiKem != null ? modelInfo.chkThongTinGuiKem.Length : 0;
            listInfoMagic = new List<ModInfoMagicEntity>();
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkThongTinGuiKem[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity infoMagic = new ModInfoMagicEntity() { MenuID = HL.Core.Global.Convert.ToInt(tmp[2]) };
                    listInfoMagic.Add(infoMagic);
                }
            }
            ViewBag.ThongTinGuiKem = listInfoMagic;
            #endregion Get model

            if (isValid == true)
            {
                int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
                ModBaoCaoSuCoEntity sc = ModBaoCaoSuCoService.Instance.CreateQuery()
                    .Where(userId > 0, o => o.UserID == userId)
                    .Where(o => o.Code == endCode)
                    .ToSingle();
                var entity = ModBaoCaoBanDauSuCoService.Instance.CreateQuery()
                            .Where(userId > 0, o => o.UserID == userId)
                            .Where(o => o.BaoCaoSuCoID == sc.ID)
                            .ToSingle();
                if (entity != null)
                {
                    DateTime date = DateTime.Now;
                    string ngayGioPhatHien = append.Ngay + " " + append.Gio + ":" + append.Phut;
                    string[] arr = append.ThoiGian.Split('/');
                    string thoiGianThucHien = "";
                    if (arr.Length == 5) thoiGianThucHien = arr[0] + "/" + arr[1] + "/" + arr[2] + " " + arr[3] + ":" + arr[4];
                    if (!string.IsNullOrEmpty(ngayGioPhatHien)) entityBc.ChiTiet_NgayGioPhatHien = HL.Core.Global.Convert.ToDateTime(ngayGioPhatHien);
                    else entityBc.ChiTiet_NgayGioPhatHien = DateTime.MinValue;
                    if (!string.IsNullOrEmpty(thoiGianThucHien)) entityBc.ThoiGianThucHien = HL.Core.Global.Convert.ToDateTime(thoiGianThucHien);
                    else entityBc.ThoiGianThucHien = DateTime.MinValue;

                    entityBc.ID = entity.ID;
                    entityBc.BaoCaoSuCoID = entity.BaoCaoSuCoID;
                    entityBc.UserID = entity.UserID;
                    entityBc.UserID1 = userId;
                    entityBc.MenuID = entity.MenuID;
                    entityBc.State = entity.State;
                    entityBc.Name = entity.Name;
                    entityBc.Code = entity.Code;
                    entityBc.Order = entity.Order;
                    entityBc.Published = entity.Published;
                    entityBc.Published1 = date;
                    entityBc.Activity = true;
                    ModBaoCaoBanDauSuCoService.Instance.Save(entityBc);

                    //Xoa toan bo thong tin InfoMagic cua Bao cao ban dau su co
                    var lstInfoMagic = ModInfoMagicService.Instance.CreateQuery()
                            .Where(o => o.BaoCaoBanDauSuCoID == entity.ID)
                            .ToList();
                    if (lstInfoMagic != null) ModInfoMagicService.Instance.Delete(lstInfoMagic);

                    //Cach thuc phat hien
                    num = modelInfo.chkCachThuc != null ? modelInfo.chkCachThuc.Length : 0;
                    for (int i = 0; i < num; i++)
                    {
                        string[] tmp = modelInfo.chkCachThuc[i].Split('_');
                        if (tmp.Length == 3)
                        {
                            ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                            {
                                BaoCaoBanDauSuCoID = entity.ID,
                                Order = GetMaxOrder_InfoMagic(),
                                Published = date,
                                Activity = true
                            };
                            entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                            if (tmp[0] == "1")
                            {
                                int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                                if (modelInfo.txtCachThuc != null && modelInfo.txtCachThuc.Length >= idx)
                                {
                                    entityTmp.Name = modelInfo.txtCachThuc[idx];
                                    entityTmp.Code = Data.GetCode(modelInfo.txtCachThuc[idx]);
                                }
                            }
                            ModInfoMagicService.Instance.Save(entityTmp);
                        }
                    }

                    //Da gui thong bao su co
                    num = modelInfo.chkThongBao != null ? modelInfo.chkThongBao.Length : 0;
                    for (int i = 0; i < num; i++)
                    {
                        string[] tmp = modelInfo.chkThongBao[i].Split('_');
                        if (tmp.Length == 3)
                        {
                            ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                            {
                                BaoCaoBanDauSuCoID = entity.ID,
                                Order = GetMaxOrder_InfoMagic(),
                                Published = date,
                                Activity = true
                            };
                            entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                            if (tmp[0] == "1")
                            {
                                int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                                if (modelInfo.txtThongBao != null && modelInfo.txtThongBao.Length >= idx)
                                {
                                    entityTmp.Name = modelInfo.txtThongBao[idx];
                                    entityTmp.Code = Data.GetCode(modelInfo.txtThongBao[idx]);
                                }
                            }
                            ModInfoMagicService.Instance.Save(entityTmp);
                        }
                    }

                    //Dich vu
                    num = modelInfo.chkDichVu != null ? modelInfo.chkDichVu.Length : 0;
                    for (int i = 0; i < num; i++)
                    {
                        string[] tmp = modelInfo.chkDichVu[i].Split('_');
                        if (tmp.Length == 3)
                        {
                            ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                            {
                                BaoCaoBanDauSuCoID = entity.ID,
                                Order = GetMaxOrder_InfoMagic(),
                                Published = date,
                                Activity = true
                            };
                            entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                            if (tmp[0] == "1")
                            {
                                int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                                if (modelInfo.txtDichVu != null && modelInfo.txtDichVu.Length >= idx)
                                {
                                    entityTmp.Name = modelInfo.txtDichVu[idx];
                                    entityTmp.Code = Data.GetCode(modelInfo.txtDichVu[idx]);
                                }
                            }
                            ModInfoMagicService.Instance.Save(entityTmp);
                        }
                    }

                    //Bien phap
                    num = modelInfo.chkBienPhap != null ? modelInfo.chkBienPhap.Length : 0;
                    for (int i = 0; i < num; i++)
                    {
                        string[] tmp = modelInfo.chkBienPhap[i].Split('_');
                        if (tmp.Length == 3)
                        {
                            ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                            {
                                BaoCaoBanDauSuCoID = entity.ID,
                                Order = GetMaxOrder_InfoMagic(),
                                Published = date,
                                Activity = true
                            };
                            entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                            if (tmp[0] == "1")
                            {
                                int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                                if (modelInfo.txtBienPhap != null && modelInfo.txtBienPhap.Length >= idx)
                                {
                                    entityTmp.Name = modelInfo.txtBienPhap[idx];
                                    entityTmp.Code = Data.GetCode(modelInfo.txtBienPhap[idx]);
                                }
                            }
                            ModInfoMagicService.Instance.Save(entityTmp);
                        }
                    }

                    //Thong tin gui kem
                    num = modelInfo.chkThongTinGuiKem != null ? modelInfo.chkThongTinGuiKem.Length : 0;
                    for (int i = 0; i < num; i++)
                    {
                        string[] tmp = modelInfo.chkThongTinGuiKem[i].Split('_');
                        if (tmp.Length == 3)
                        {
                            ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                            {
                                BaoCaoBanDauSuCoID = entity.ID,
                                Order = GetMaxOrder_InfoMagic(),
                                Published = date,
                                Activity = true
                            };
                            entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                            if (tmp[0] == "1")
                            {
                                int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                                if (modelInfo.txtThongTinGuiKem != null && modelInfo.txtThongTinGuiKem.Length >= idx)
                                {
                                    entityTmp.Name = modelInfo.txtThongTinGuiKem[idx];
                                    entityTmp.Code = Data.GetCode(modelInfo.txtThongTinGuiKem[idx]);
                                }
                            }
                            ModInfoMagicService.Instance.Save(entityTmp);
                        }
                    }

                    ViewBag.BaoCao = entityBc;

                    ViewPage.Alert("Cập nhật báo cáo ban đầu thành công.");
                    //ViewPage.RefreshPage();
                    ViewPage.Navigate(ViewPage.ActionForm);
                }
            }
        }

        public void ActionAddBCKetThucUCSC(ModBaoCaoKetThucSuCoEntity entity, MAppend append, string endCode)
        {
            bool isValid = ValidBCKetThuc(ref entity, append, endCode);
            ViewBag.BaoCao = entity;

            if (isValid == true)
            {
                int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
                string ec = endCode.ToLower();
                string[] ecArr = ec.Split('-');
                string codes = ecArr[0].ToString();
                ModBaoCaoSuCoEntity sc = ModBaoCaoSuCoService.Instance.CreateQuery()
                    .Where(userId > 0, o => o.UserID == userId)
                    .Where(o => o.Code == codes)
                    .ToSingle();
                if (sc != null)
                {

                    DateTime date = DateTime.Now;
                    string ngayGioPhatHien = append.Ngay + " " + append.Gio + ":" + append.Phut;
                    string code = "BCKTSC" + ModBaoCaoKetThucSuCoService.Instance.GetMaxID();
                    entity.Name = code;
                    entity.Code = Data.GetCode(code);
                    entity.UserID = Lib.Global.CPLogin.UserIDOnWeb;
                    if (!string.IsNullOrEmpty(ngayGioPhatHien)) entity.NgayGioPhatHien = HL.Core.Global.Convert.ToDateTime(ngayGioPhatHien);
                    else entity.NgayGioPhatHien = DateTime.MinValue;
                    entity.Order = GetMaxOrder_BCKetThuc();
                    entity.Published = date;
                    entity.Activity = true;
                    entity.BaoCaoSuCoID = sc.ID;
                    int id = ModBaoCaoKetThucSuCoService.Instance.Save(entity);

                    ViewBag.BaoCao = entity;

                    ViewPage.Alert("Tạo báo cáo kết thúc thành công.");
                    ViewPage.Navigate("/vn/Bao-cao-su-co.aspx");
                    //ViewPage.RefreshPage();
                }
            }
        }

        public void ActionUpdateBCKetThucUCSC(ModBaoCaoKetThucSuCoEntity entityBc, MAppend append, string endCode)
        {
            bool isValid = ValidBCKetThuc(ref entityBc, append, endCode);
            ViewBag.BaoCao = entityBc;

            if (isValid == true)
            {
                int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
                ModBaoCaoSuCoEntity sc = ModBaoCaoSuCoService.Instance.CreateQuery()
                    .Where(userId > 0, o => o.UserID == userId)
                    .Where(o => o.Code == endCode)
                    .ToSingle();
                var entity = ModBaoCaoKetThucSuCoService.Instance.CreateQuery()
                            .Where(userId > 0, o => o.UserID == userId)
                            .Where(o => o.BaoCaoSuCoID == sc.ID)
                            .ToSingle();
                if (entity != null)
                {
                    DateTime date = DateTime.Now;
                    string ngayGioPhatHien = append.Ngay + " " + append.Gio + ":" + append.Phut;
                    if (!string.IsNullOrEmpty(ngayGioPhatHien)) entityBc.NgayGioPhatHien = HL.Core.Global.Convert.ToDateTime(ngayGioPhatHien);
                    else entityBc.NgayGioPhatHien = DateTime.MinValue;

                    entityBc.ID = entity.ID;
                    entityBc.BaoCaoSuCoID = entity.BaoCaoSuCoID;
                    entityBc.UserID = entity.UserID;
                    entityBc.UserID1 = userId;
                    entityBc.MenuID = entity.MenuID;
                    entityBc.State = entity.State;
                    entityBc.Name = entity.Name;
                    entityBc.Code = entity.Code;
                    entityBc.Order = entity.Order;
                    entityBc.Published = entity.Published;
                    entityBc.Published1 = date;
                    entityBc.Activity = true;
                    ModBaoCaoKetThucSuCoService.Instance.Save(entityBc);

                    ViewBag.BaoCao = entityBc;

                    ViewPage.Alert("Cập nhật báo cáo kết thúc thành công.");
                    ViewPage.Navigate(ViewPage.ActionForm);
                }
            }
        }

        public void ActionAddBCTongHopUCSC(ModBaoCaoTongHopEntity entity, MSoLuongSuCoModel entitySuCo, string endCode)
        {
            int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
            string ec = endCode.ToLower();
            string[] ecArr = ec.Split('-');
            string codes = ecArr[0].ToString();
            ModBaoCaoSuCoEntity sc = ModBaoCaoSuCoService.Instance.CreateQuery()
                .Where(userId > 0, o => o.UserID == userId)
                .Where(o => o.Code == codes)
                .ToSingle();
            if (sc != null)
            {
                DateTime date = DateTime.Now;
                string code = "BCTHSC" + ModBaoCaoTongHopService.Instance.GetMaxID();
                entity.Name = code;
                entity.Code = Data.GetCode(code);
                entity.UserID = Lib.Global.CPLogin.UserIDOnWeb;
                entity.Order = GetMaxOrder_BCTongHop();
                entity.Published = date;
                entity.Activity = true;
                entity.BaoCaoSuCoID = sc.ID;

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
                        int id = ModBaoCaoTongHopService.Instance.Save(entity);
                        suCo.BaoCaoTongHopID = id;
                        suCo.MenuID = entitySuCo.MN[i];
                        suCo.Published = date;
                        suCo.Order = GetMaxOrder_SoSuCo();
                        suCo.Activity = true;

                        ModSoLuongSuCoService.Instance.Save(suCo);
                    }
                }

                ViewBag.BaoCao = entity;

                ViewPage.Alert("Tạo báo cáo tổng hợp thành công.");
                ViewPage.Navigate("/vn/Bao-cao-su-co.aspx");
                //ViewPage.RefreshPage();
            }
        }

        public void ActionUpdateBCTongHopUCSC(ModBaoCaoTongHopEntity entityBc, MSoLuongSuCoModel entitySuCo, string endCode)
        {
            int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
            ModBaoCaoSuCoEntity sc = ModBaoCaoSuCoService.Instance.CreateQuery()
                .Where(userId > 0, o => o.UserID == userId)
                .Where(o => o.Code == endCode)
                .ToSingle();
            var entity = ModBaoCaoTongHopService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(o => o.BaoCaoSuCoID == sc.ID)
                        .ToSingle();
            if (entity != null)
            {
                DateTime date = DateTime.Now;

                entityBc.ID = entity.ID;
                entityBc.BaoCaoSuCoID = entity.BaoCaoSuCoID;
                entityBc.UserID = entity.UserID;
                entityBc.UserID1 = userId;
                entityBc.MenuID = entity.MenuID;
                entityBc.State = entity.State;
                entityBc.Name = entity.Name;
                entityBc.Code = entity.Code;
                entityBc.Order = entity.Order;
                entityBc.Published = entity.Published;
                entityBc.Published1 = date;
                entityBc.Activity = true;

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

                ViewPage.Alert("Cập nhật báo cáo tổng hợp thành công.");
                ViewPage.Navigate(ViewPage.ActionForm);
            }
        }

        #region private function
        private void DelBCBanDau(int baoCaoId)
        {
            int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
            var entity = ModBaoCaoBanDauSuCoService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(baoCaoId > 0, o => o.BaoCaoSuCoID == baoCaoId)
                        .ToSingle();

            if (entity != null)
            {
                var entityInfoMagic = ModInfoMagicService.Instance.CreateQuery().Where(o => o.BaoCaoBanDauSuCoID == entity.ID).ToList();
                if (entityInfoMagic != null) ModInfoMagicService.Instance.Delete(entityInfoMagic);

                ModBaoCaoBanDauSuCoService.Instance.Delete(entity.ID);
            }
        }

        private void DelBCTongHop(int baoCaoId)
        {
            int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
            var entity = ModBaoCaoTongHopService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(baoCaoId > 0, o => o.BaoCaoSuCoID == baoCaoId)
                        .ToSingle();

            if (entity != null)
            {
                var lstSuCo = ModSoLuongSuCoService.Instance.CreateQuery().Where(o => o.BaoCaoTongHopID == entity.ID).ToList();
                if (lstSuCo != null) ModSoLuongSuCoService.Instance.Delete(lstSuCo);

                ModBaoCaoTongHopService.Instance.Delete(entity.ID);
            }
        }

        private void DelBCKetThuc(int baoCaoId)
        {
            int userId = HL.Lib.Global.CPLogin.UserIDOnWeb;
            var entity = ModBaoCaoKetThucSuCoService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(baoCaoId > 0, o => o.ID == baoCaoId)
                        .ToSingle();

            if (entity != null)
            {
                ModBaoCaoKetThucSuCoService.Instance.Delete(entity.ID);
            }
        }

        private int GetMaxOrder_InfoMagic()
        {
            return ModInfoMagicService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_BCSuCo()
        {
            return ModBaoCaoSuCoService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_BCBanDau()
        {
            return ModBaoCaoBanDauSuCoService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_BCKetThuc()
        {
            return ModBaoCaoKetThucSuCoService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_BCTongHop()
        {
            return ModBaoCaoTongHopService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_SoSuCo()
        {
            return ModSoLuongSuCoService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private bool ValidBCBanDau(ref ModBaoCaoBanDauSuCoEntity entity, MInfoMagicModel modelInfo, MAppend append, string endCode)
        {
            // Ho va ten
            if (string.IsNullOrEmpty(entity.NguoiLienHe_Ten))
            {
                ViewPage.Message.ListMessage.Add("Bạn chưa nhập Họ và tên người liên hệ.");
            }

            // Dien thoai
            if (string.IsNullOrEmpty(entity.NguoiLienHe_DienThoai))
            {
                ViewPage.Message.ListMessage.Add("Bạn chưa nhập Điện thoại người liên hệ.");
            }
            else
            {
                string checkPhone = Utils.GetMobilePhone(entity.NguoiLienHe_DienThoai);
                if (string.IsNullOrEmpty(checkPhone))
                {
                    ViewPage.Message.ListMessage.Add("Số điện thoại người liên hệ không hợp lệ.");
                }
            }

            // Email
            if (string.IsNullOrEmpty(entity.NguoiLienHe_Email))
            {
                ViewPage.Message.ListMessage.Add("Bạn chưa nhập Email người liên hệ.");
            }
            else
            {
                string checkEmail = Utils.GetEmailAddress(entity.NguoiLienHe_Email);
                if (string.IsNullOrEmpty(checkEmail))
                {
                    ViewPage.Message.ListMessage.Add("Email người liên hệ không hợp lệ.");
                }
            }

            // Ten don vi van hanh
            if (string.IsNullOrEmpty(entity.ChiTiet_TenDonVi))
            {
                ViewPage.Message.ListMessage.Add("Bạn chưa nhập Tên đơn vị vận hành hệ thống thông tin.");
            }

            // Mo ta so bo su co
            if (string.IsNullOrEmpty(entity.ChiTiet_MoTa))
            {
                ViewPage.Message.ListMessage.Add("Bạn chưa nhập Mô tả sơ bộ về sự cố.");
            }

            // Ngay & thoi gian phat hien su co
            if (entity.ChiTiet_NgayGioPhatHien == DateTime.MinValue)
            {
                ViewPage.Message.ListMessage.Add("Ngày hoặc Thời gian phát hiện sự cố không hợp lệ.");
            }
            else
            {
                bool hasThoiGian = true;
                if (string.IsNullOrEmpty(append.Ngay))
                {
                    ViewPage.Message.ListMessage.Add("Bạn chưa nhập Ngày phát hiện sự cố.");
                    hasThoiGian = false;
                }
                if (string.IsNullOrEmpty(append.Gio.ToString()) && string.IsNullOrEmpty(append.Phut.ToString()))
                {
                    ViewPage.Message.ListMessage.Add("Bạn chưa nhập Thời gian phát hiện sự cố.");
                    hasThoiGian = false;
                }
                if (hasThoiGian == true)
                {
                    string gio = !string.IsNullOrEmpty(append.Gio.ToString()) ? append.Gio.ToString() : "00";
                    string phut = !string.IsNullOrEmpty(append.Phut.ToString()) ? append.Phut.ToString() : "00";
                    string ngayGioPhatHien = append.Ngay + " " + append.Gio + ":" + append.Phut;

                    if (append.Gio < 0 || append.Gio > 24 || append.Phut < 0 || append.Phut > 59)
                    {
                        ViewPage.Message.ListMessage.Add("Thời gian phát hiện sự cố không hợp lệ.");
                        entity.ChiTiet_NgayGioPhatHien = null;
                    }
                    else
                    {
                        DateTime dt = HL.Core.Global.Convert.ToDateTime(ngayGioPhatHien);
                        entity.ChiTiet_NgayGioPhatHien = dt;
                        if (dt == DateTime.MinValue)
                        {
                            ViewPage.Message.ListMessage.Add("Ngày phát hiện sự cố không hợp lệ.");
                            entity.ChiTiet_NgayGioPhatHien = null;
                        }
                    }
                }
            }

            // Thoi gian thuc hien bao cao
            if (entity.ThoiGianThucHien == DateTime.MinValue)
            {
                ViewPage.Message.ListMessage.Add("Thời gian thực hiện báo cáo sự cố không hợp lệ.");
                entity.ThoiGianThucHien = null;
            }
            else
            {
                if (string.IsNullOrEmpty(append.Ngay))
                {
                    ViewPage.Message.ListMessage.Add("Bạn chưa nhập Thời gian thực hiện báo cáo sự cố.");
                }
                else
                {
                    string[] arr = append.ThoiGian.Split('/');
                    string thoiGianThucHien = "";
                    if (arr.Length == 5) thoiGianThucHien = arr[0] + "/" + arr[1] + "/" + arr[2] + " " + arr[3] + ":" + arr[4];
                    DateTime dt = HL.Core.Global.Convert.ToDateTime(thoiGianThucHien);
                    entity.ThoiGianThucHien = dt;
                    if (dt == DateTime.MinValue)
                    {
                        ViewPage.Message.ListMessage.Add("Thời gian thực hiện báo cáo sự cố không hợp lệ.");
                        entity.ChiTiet_NgayGioPhatHien = null;
                    }
                }
            }

            // Hien trang su co

            // Cach thuc phat hien
            int num = modelInfo.chkCachThuc != null ? modelInfo.chkCachThuc.Length : 0;
            if (num <= 0)
            {
                ViewPage.Message.ListMessage.Add("Bạn chưa chọn Cách thức phát hiện sự cố.");
            }

            // Da gui thong bao su co cho
            num = modelInfo.chkThongBao != null ? modelInfo.chkThongBao.Length : 0;
            if (num <= 0)
            {
                ViewPage.Message.ListMessage.Add("Bạn chưa chọn đã gửi thông báo sự cố.");
            }

            if (ViewPage.Message.ListMessage.Count > 0)
            {
                string message = @"Thông tin còn thiếu hoặc chưa hợp lệ: \r\n";

                for (int i = 0; i < ViewPage.Message.ListMessage.Count; i++)
                    message += @"\r\n + " + ViewPage.Message.ListMessage[i];

                ViewPage.Alert(message);
                return false;
            }

            return true;
        }

        private bool ValidBCKetThuc(ref ModBaoCaoKetThucSuCoEntity entity, MAppend append, string endCode)
        {
            // Tên đơn vị vận hành hệ thống thông tin
            if (string.IsNullOrEmpty(entity.ChiTiet_TenDonVi))
            {
                ViewPage.Message.ListMessage.Add("Bạn chưa nhập Tên đơn vị vận hành hệ thống thông tin.");
            }

            // Ngày phát hiện sự cố
            if (entity.NgayGioPhatHien == DateTime.MinValue)
            {
                ViewPage.Message.ListMessage.Add("Ngày hoặc Thời gian phát hiện sự cố không hợp lệ.");
            }
            else
            {
                bool hasThoiGian = true;
                if (string.IsNullOrEmpty(append.Ngay))
                {
                    ViewPage.Message.ListMessage.Add("Bạn chưa nhập Ngày phát hiện sự cố.");
                    hasThoiGian = false;
                }
                if (string.IsNullOrEmpty(append.Gio.ToString()) && string.IsNullOrEmpty(append.Phut.ToString()))
                {
                    ViewPage.Message.ListMessage.Add("Bạn chưa nhập Thời gian phát hiện sự cố.");
                    hasThoiGian = false;
                }
                if (hasThoiGian == true)
                {
                    string gio = !string.IsNullOrEmpty(append.Gio.ToString()) ? append.Gio.ToString() : "00";
                    string phut = !string.IsNullOrEmpty(append.Phut.ToString()) ? append.Phut.ToString() : "00";
                    string ngayGioPhatHien = append.Ngay + " " + append.Gio + ":" + append.Phut;

                    if (append.Gio < 0 || append.Gio > 24 || append.Phut < 0 || append.Phut > 59)
                    {
                        ViewPage.Message.ListMessage.Add("Thời gian phát hiện sự cố không hợp lệ.");
                        entity.NgayGioPhatHien = null;
                    }
                    else
                    {
                        DateTime dt = HL.Core.Global.Convert.ToDateTime(ngayGioPhatHien);
                        entity.NgayGioPhatHien = dt;
                        if (dt == DateTime.MinValue)
                        {
                            ViewPage.Message.ListMessage.Add("Ngày phát hiện sự cố không hợp lệ.");
                            entity.NgayGioPhatHien = null;
                        }
                    }
                }
            }

            if (ViewPage.Message.ListMessage.Count > 0)
            {
                string message = @"Thông tin còn thiếu hoặc chưa hợp lệ: \r\n";

                for (int i = 0; i < ViewPage.Message.ListMessage.Count; i++)
                    message += @"\r\n + " + ViewPage.Message.ListMessage[i];

                ViewPage.Alert(message);
                return false;
            }

            return true;
        }
        #endregion private function
    }

    public class MBaoCaoSuCoModel
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
