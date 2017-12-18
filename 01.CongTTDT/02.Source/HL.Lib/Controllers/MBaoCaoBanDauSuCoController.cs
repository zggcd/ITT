using System;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.Controllers
{
    public class MBaoCaoBanDauSuCoController : Controller
    {

        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|BaoCaoBanDauSuCo")]
        public int MenuID;

        //[HL.Core.MVC.PropertyInfo("Vị trí", "ConfigKey|Mod.BaoCaoBanDauSuCoState")]
        public int State;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        public void ActionIndex(MBaoCaoBanDauSuCoModel model)
        {
            if (ViewPage.CurrentPage.MenuID > 0)
                MenuID = ViewPage.CurrentPage.MenuID;
            int userId = HL.Lib.Global.CPLogin.UserID;

            var dbQuery = ModBaoCaoBanDauSuCoService.Instance.CreateQuery()
                            //.Where(o => o.Activity == true)
                            .Where(userId > 0, o => o.UserID == userId)
                            .Where(State > 0, o => (o.State & State) == State)
                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("BaoCaoBanDauSuCo", MenuID, ViewPage.CurrentLang.ID))
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
            if (ec == "them-bc-ban-dau-su-co") layout = "BCBanDauUCSC";
            else if (ec == "sua-bc-ban-dau-su-co") layout = "BCBanDauUCSC";
            else if (ec == "bc-ban-dau-su-co") layout = "Index";

            if (!string.IsNullOrEmpty(layout)) RenderView(layout);
            else
            {
                int userId = HL.Lib.Global.CPLogin.UserID;
                var entity = ModBaoCaoBanDauSuCoService.Instance.CreateQuery()
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
                    RenderView("../MInfo/BCBanDauUCSC");
                }
                else
                {
                    ViewPage.Error404();
                }
            }
        }

        public void ActionXoaBaoCao(string baoCaoId)
        {
            int bcId = HL.Core.Global.Convert.ToInt(baoCaoId, 0);
            int userId = HL.Lib.Global.CPLogin.UserID;
            var entity = ModBaoCaoBanDauSuCoService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(bcId > 0, o => o.ID == bcId)
                        .ToSingle();

            if (entity != null)
            {
                var entityInfoMagic = ModInfoMagicService.Instance.CreateQuery().Where(o => o.BaoCaoBanDauSuCoID == entity.ID).ToList();
                if (entityInfoMagic != null) ModInfoMagicService.Instance.Delete(entityInfoMagic);

                ModBaoCaoBanDauSuCoService.Instance.Delete(entity.ID);

                ViewPage.Alert("Xóa báo cáo thành công.");
                ViewPage.Navigate(ViewPage.CurrentURL);
            }
            else
            {
                ViewPage.Alert("Bạn không có quyền thao tác trên báo cáo này.");
            }
        }

        public void ActionUpdateBaoCaoUCSC(ModBaoCaoBanDauSuCoEntity entityBc, MInfoMagicModel modelInfo, MAppend append, string endCode)
        {
            int userId = HL.Lib.Global.CPLogin.UserID;
            var entity = ModBaoCaoBanDauSuCoService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(o => o.Code == endCode)
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
                entityBc.UserID = entity.UserID;
                entityBc.UserID1 = entity.UserID1;
                entityBc.MenuID = entity.MenuID;
                entityBc.State = entity.State;
                entityBc.Name = entity.Name;
                entityBc.Code = entity.Code;
                entityBc.Order = entity.Order;
                entityBc.Published = entity.Published;
                entityBc.Published1 = date;
                entityBc.Activity = false;
                ModBaoCaoBanDauSuCoService.Instance.Save(entityBc);

                //Xoa toan bo thong tin InfoMagic cua Bao cao ban dau su co
                var lstInfoMagic = ModInfoMagicService.Instance.CreateQuery()
                        .Where(o => o.BaoCaoBanDauSuCoID == entity.ID)
                        .ToList();
                if (lstInfoMagic != null) ModInfoMagicService.Instance.Delete(lstInfoMagic);

                //Cach thuc phat hien
                int num = modelInfo.chkCachThuc != null ? modelInfo.chkCachThuc.Length : 0;
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

                ViewPage.Alert("Cập nhật báo cáo thành công! Chúng tôi sẽ xem xét và phê duyệt báo cáo của bạn sớm nhất có thể.");
                ViewPage.Navigate("/vn/Thanh-vien/DS-bc-ban-dau-su-co.aspx");
            }
        }

        private int GetMaxOrder_InfoMagic()
        {
            return ModInfoMagicService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }
    }

    public class MBaoCaoBanDauSuCoModel
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
