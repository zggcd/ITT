using System;

using HL.Lib.MVC;
using HL.Lib.Models;
using System.Collections.Generic;
using HL.Lib.Global;

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
            int userId = HL.Lib.Global.CPLogin.UserID;

            var dbQuery = ModDonDangKyUCSCService.Instance.CreateQuery()
                            //.Where(o => o.Activity == true)
                            .Where(userId > 0, o => o.UserID == userId)
                            .Where(State > 0, o => (o.State & State) == State)
                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("DonDangKyUCSC", MenuID, ViewPage.CurrentLang.ID))
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
            if (ec == "dang-ky-ung-cuu-su-co") layout = "DangKyUCSC";
            else if (ec == "sua-dang-ky-ung-cuu-su-co") layout = "DangKyUCSC";
            else if (ec == "ds-dang-ky-ung-cuu-su-co") layout = "Index";

            if (!string.IsNullOrEmpty(layout)) RenderView(layout);
            else
            {
                int userId = HL.Lib.Global.CPLogin.UserID;
                var entity = ModDonDangKyUCSCService.Instance.CreateQuery()
                            //.Where(o => o.Activity == true)
                            .Where(userId > 0, o => o.UserID == userId)
                            .Where(o => o.Code == endCode)
                            //.WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("DonDangKyUCSC", MenuID, ViewPage.CurrentLang.ID))
                            .ToSingle();

                if (entity != null)
                {
                    ViewBag.Other = ModDonDangKyUCSCService.Instance.CreateQuery()
                                            .Where(o => o.Activity == true)
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
                    ViewBag.EndCode = endCode;
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
            int userId = HL.Lib.Global.CPLogin.UserID;
            var entity = ModDonDangKyUCSCService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(dkId > 0, o => o.ID == dkId)
                        .ToSingle();

            if (entity != null)
            {
                var httt = ModHeThongThongTinService.Instance.CreateQuery()
                    .Where(o => o.DonDangKyUCSCID == entity.ID)
                    .ToList();

                ModDonDangKyUCSCService.Instance.Delete(entity.ID);
                if (httt != null) ModHeThongThongTinService.Instance.Delete(httt);

                ViewPage.Alert("Xóa đăng ký thành công.");
                ViewPage.Navigate(ViewPage.CurrentURL);
            }
            else
            {
                ViewPage.Alert("Bạn không có quyền thao tác trên bản đăng ký này.");
            }
        }

        public void ActionUpdateDangKyUCSC(ModDonDangKyUCSCEntity entityDk, MHSThanhVienUCSCModel model, string endCode)
        {
            int userId = HL.Lib.Global.CPLogin.UserID;
            var entity = ModDonDangKyUCSCService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(o => o.Code == endCode)
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
                var arr = model.M.Split(';');
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

                ViewBag.DangKy = entityDk;
                ViewBag.HTTT1 = entityHTTT;

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
