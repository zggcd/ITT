using System;

using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class MBaoCaoTongHopController : Controller
    {

        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|BaoCaoTongHop")]
        public int MenuID;

        //[HL.Core.MVC.PropertyInfo("Vị trí", "ConfigKey|Mod.BaoCaoTongHopState")]
        public int State;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        public void ActionIndex(MBaoCaoTongHopModel model)
        {
            if (ViewPage.CurrentPage.MenuID > 0)
                MenuID = ViewPage.CurrentPage.MenuID;
            int userId = HL.Lib.Global.CPLogin.UserID;

            var dbQuery = ModBaoCaoTongHopService.Instance.CreateQuery()
                            //.Where(o => o.Activity == true)
                            .Where(userId > 0, o => o.UserID == userId)
                            .Where(State > 0, o => (o.State & State) == State)
                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("BaoCaoTongHop", MenuID, ViewPage.CurrentLang.ID))
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
            if (ec == "them-bc-tong-hop-su-co") layout = "BCTongHopUCSC";
            else if (ec == "sua-bc-tong-hop-su-co") layout = "BCTongHopUCSC";
            else if (ec == "bc-tong-hop-su-co") layout = "Index";

            if (!string.IsNullOrEmpty(layout)) RenderView(layout);
            else
            {
                int userId = HL.Lib.Global.CPLogin.UserID;
                var entity = ModBaoCaoTongHopService.Instance.CreateQuery()
                            //.Where(o => o.Activity == true)
                            .Where(userId > 0, o => o.UserID == userId)
                            .Where(o => o.Code == endCode)
                            //.WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("BaoCaoTongHop", MenuID, ViewPage.CurrentLang.ID))
                            .ToSingle();

                if (entity != null)
                {
                    ViewBag.Other = ModBaoCaoTongHopService.Instance.CreateQuery()
                                            .Where(o => o.Activity == true)
                                            .Where(o => o.Order < entity.Order)
                                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("BaoCaoTongHop", MenuID, ViewPage.CurrentLang.ID))
                                            .OrderByDesc(o => o.Order)
                                            .Take(PageSize)
                                            .ToList();

                    ViewBag.SuCo = ModSoLuongSuCoService.Instance.CreateQuery().Where(o => o.Activity == true && o.BaoCaoTongHopID == entity.ID).ToList();

                    ViewBag.Data = entity;
                    SetObject["view.Meta"] = entity;

                    ViewBag.BaoCao = entity;
                    ViewBag.EndCode = endCode;
                    RenderView("../MInfo/BCTongHopUCSC");
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
            var entity = ModBaoCaoTongHopService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(bcId > 0, o => o.ID == bcId)
                        .ToSingle();

            if (entity != null)
            {
                var lstSuCo = ModSoLuongSuCoService.Instance.CreateQuery().Where(o => o.BaoCaoTongHopID == entity.ID).ToList();
                if (lstSuCo != null) ModSoLuongSuCoService.Instance.Delete(lstSuCo);

                ModBaoCaoTongHopService.Instance.Delete(entity.ID);

                ViewPage.Alert("Xóa báo cáo thành công.");
                ViewPage.Navigate(ViewPage.CurrentURL);
            }
            else
            {
                ViewPage.Alert("Bạn không có quyền thao tác trên báo cáo này.");
            }
        }

        public void ActionUpdateBaoCaoUCSC(ModBaoCaoTongHopEntity entityBc, MSoLuongSuCoModel entitySuCo, string endCode)
        {
            int userId = HL.Lib.Global.CPLogin.UserID;
            var entity = ModBaoCaoTongHopService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(o => o.Code == endCode)
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

                ViewPage.Alert("Cập nhật báo cáo thành công! Chúng tôi sẽ xem xét và phê duyệt báo cáo của bạn sớm nhất có thể.");
                ViewPage.Navigate("/vn/Thanh-vien/DS-bc-tong-hop-su-co.aspx");
            }
        }

        private int GetMaxOrder_SoSuCo()
        {
            return ModSoLuongSuCoService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }
    }

    public class MBaoCaoTongHopModel
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
