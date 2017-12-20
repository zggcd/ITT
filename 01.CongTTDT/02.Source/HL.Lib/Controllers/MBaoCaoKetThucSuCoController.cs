using System;

using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class MBaoCaoKetThucSuCoController : Controller
    {

        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|BaoCaoKetThucSuCo")]
        public int MenuID;

        //[HL.Core.MVC.PropertyInfo("Vị trí", "ConfigKey|Mod.BaoCaoKetThucSuCoState")]
        public int State;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        public void ActionIndex(MBaoCaoKetThucSuCoModel model)
        {
            if (ViewPage.CurrentPage.MenuID > 0)
                MenuID = ViewPage.CurrentPage.MenuID;
            int userId = HL.Lib.Global.CPLogin.UserID;

            var dbQuery = ModBaoCaoKetThucSuCoService.Instance.CreateQuery()
                            //.Where(o => o.Activity == true)
                            .Where(userId > 0, o => o.UserID == userId)
                            .Where(State > 0, o => (o.State & State) == State)
                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("BaoCaoKetThucSuCo", MenuID, ViewPage.CurrentLang.ID))
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
            if (ec == "them-bc-ket-thuc-su-co") layout = "BCKetThucUCSC";
            else if (ec == "sua-bc-ket-thuc-su-co") layout = "BCKetThucUCSC";
            else if (ec == "bc-ket-thuc-su-co") layout = "Index";

            if (!string.IsNullOrEmpty(layout)) RenderView(layout);
            else
            {
                int userId = HL.Lib.Global.CPLogin.UserID;
                var entity = ModBaoCaoKetThucSuCoService.Instance.CreateQuery()
                            //.Where(o => o.Activity == true)
                            .Where(userId > 0, o => o.UserID == userId)
                            .Where(o => o.Code == endCode)
                            //.WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("BaoCaoKetThucSuCo", MenuID, ViewPage.CurrentLang.ID))
                            .ToSingle();

                if (entity != null)
                {
                    ViewBag.Other = ModBaoCaoKetThucSuCoService.Instance.CreateQuery()
                                            .Where(o => o.Activity == true)
                                            .Where(o => o.Order < entity.Order)
                                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("BaoCaoKetThucSuCo", MenuID, ViewPage.CurrentLang.ID))
                                            .OrderByDesc(o => o.Order)
                                            .Take(PageSize)
                                            .ToList();

                    ViewBag.Data = entity;
                    SetObject["view.Meta"] = entity;

                    ViewBag.BaoCao = entity;
                    ViewBag.EndCode = endCode;
                    RenderView("../MInfo/BCKetThucUCSC");
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
            var entity = ModBaoCaoKetThucSuCoService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(bcId > 0, o => o.ID == bcId)
                        .ToSingle();

            if (entity != null)
            {
                ModBaoCaoKetThucSuCoService.Instance.Delete(entity.ID);

                ViewPage.Alert("Xóa báo cáo thành công.");
                ViewPage.Navigate(ViewPage.CurrentURL);
            }
            else
            {
                ViewPage.Alert("Bạn không có quyền thao tác trên báo cáo này.");
            }
        }

        public void ActionUpdateBaoCaoUCSC(ModBaoCaoKetThucSuCoEntity entityBc, MAppend append, string endCode)
        {
            int userId = HL.Lib.Global.CPLogin.UserID;
            var entity = ModBaoCaoKetThucSuCoService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(o => o.Code == endCode)
                        .ToSingle();
            if (entity != null)
            {
                DateTime date = DateTime.Now;
                string ngayGioPhatHien = append.Ngay + " " + append.Gio + ":" + append.Phut;
                if (!string.IsNullOrEmpty(ngayGioPhatHien)) entityBc.NgayGioPhatHien = HL.Core.Global.Convert.ToDateTime(ngayGioPhatHien);
                else entityBc.NgayGioPhatHien = DateTime.MinValue;

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
                ModBaoCaoKetThucSuCoService.Instance.Save(entityBc);

                ViewBag.BaoCao = entityBc;

                ViewPage.Alert("Cập nhật báo cáo thành công! Chúng tôi sẽ xem xét và phê duyệt báo cáo của bạn sớm nhất có thể.");
                ViewPage.Navigate("/vn/Thanh-vien/DS-bc-ket-thuc-su-co.aspx");
            }
        }
    }

    public class MBaoCaoKetThucSuCoModel
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
