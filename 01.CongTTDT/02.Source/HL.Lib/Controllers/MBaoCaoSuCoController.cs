using System;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

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
            int userId = HL.Lib.Global.CPLogin.UserID;

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
            if (ec == "them-bao-cao")
            {
                layout = "Add";
                ViewBag.Data = new ModBaoCaoSuCoEntity();
            }
            else if (ec == "them-bc-ban-dau-su-co") layout = "BCBanDauUCSC";
            else if (ec == "sua-bc-ban-dau-su-co") layout = "BCBanDauUCSC";
            else if (ec == "bc-ban-dau-su-co") layout = "Index";

            if (!string.IsNullOrEmpty(layout)) RenderView(layout);
            else
            {
                int userId = HL.Lib.Global.CPLogin.UserID;
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
                string code = "BCSC" + ModBaoCaoSuCoService.Instance.GetMaxID();
                ////neu khong nhap code -> tu sinh
                //if (entity.Code.Trim() == string.Empty)
                //    entity.Code = Data.GetCode(entity.Name);

                ////cap nhat state
                //entity.State = GetState(model.ArrState);

                try
                {
                    //save
                    entity.Code = code;
                    entity.UserID = Lib.Global.CPLogin.UserID;
                    entity.Published = DateTime.Now;
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
            int userId = HL.Lib.Global.CPLogin.UserID;
            var entity = ModBaoCaoSuCoService.Instance.CreateQuery()
                        .Where(userId > 0, o => o.UserID == userId)
                        .Where(bcId > 0, o => o.ID == bcId)
                        .ToSingle();

            if (entity != null)
            {
                ModBaoCaoSuCoService.Instance.Delete(entity.ID);

                ViewPage.Alert("Xóa báo cáo thành công.");
                ViewPage.Navigate(ViewPage.CurrentURL);
            }
            else
            {
                ViewPage.Alert("Bạn không có quyền thao tác trên báo cáo này.");
            }
        }

        public void ActionUpdate(ModBaoCaoSuCoEntity entity, MBaoCaoSuCoModel model, string endCode)
        {
            int userId = HL.Lib.Global.CPLogin.UserID;
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
                        bc.UserID1 = Lib.Global.CPLogin.UserID;
                        bc.Published1 = DateTime.Now;
                        ModBaoCaoSuCoService.Instance.Save(bc);
                    }
                    catch (Exception ex)
                    {
                        Global.Error.Write(ex);
                        ViewPage.Alert(ex.Message);
                    }

                    ViewPage.Alert("Cập nhật báo cáo thành công.");
                    ViewPage.RefreshPage();
                }
            }
        }

        private int GetMaxOrder_InfoMagic()
        {
            return ModInfoMagicService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }
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
