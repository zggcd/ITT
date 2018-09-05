using System;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class FormBaoCaoDienBienSuCoController : CPController
    {
        public FormBaoCaoDienBienSuCoController()
        {
            //khoi tao Service
            DataService = ModBaoCaoDienBienSuCoService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(FormBaoCaoDienBienSuCoModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModBaoCaoDienBienSuCoService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Code.Contains(model.SearchText) || o.ToChuc_DiaChi.Contains(model.SearchText) || o.ToChuc_Email.Contains(model.SearchText) || o.ToChuc_DienThoai.Contains(model.SearchText) || o.ToChuc_Ten.Contains(model.SearchText) || o.ChiTiet_MoTa.Contains(model.SearchText))
                                .Where(o => o.BaoCaoSuCoID == model.BaoCaoSuCoID)
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModBaoCaoDienBienSuCoEntity entity, MAppend append, string endCode)
        {
            if (entity.ID == 0) 
            {
                entity = new ModBaoCaoDienBienSuCoEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.MenuID = 0;
                entity.UserID = Lib.Global.CPLogin.UserID;
                DateTime d = DateTime.Now;
                entity.ChiTiet_NgayTao = d;
                entity.Activity = CPViewPage.UserPermissions.Approve;
            }
            else
            {
                bool isValid = ValidBCDienBien(ref entity, append, endCode);
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
                        string code = "BCDBSC" + ModBaoCaoDienBienSuCoService.Instance.GetMaxID();
                        entity.Name = code;
                        entity.Code = Data.GetCode(code);
                        entity.UserID = Lib.Global.CPLogin.UserIDOnWeb;
                        entity.Activity = true;
                        entity.BaoCaoSuCoID = sc.ID;
                        entity.ToChuc_Ten = sc.Name;
                        entity.ToChuc_DiaChi = sc.Address;
                        entity.ToChuc_DienThoai = sc.Phone;
                        entity.ToChuc_Email = sc.Email;
                        int id = ModBaoCaoDienBienSuCoService.Instance.Save(entity);
                         
                        CPViewPage.Alert("Thêm báo cáo diễn biến thành công.");
                        CPViewPage.RefreshPage();
                        //ViewPage.Navigate("/vn/Bao-cao-su-co/" + sc.Code + "-bc-dien-bien-su-co.aspx");
                    }
                }
            }

            ViewBag.Data = entity;
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

            //thong bao
            CPViewPage.SetMessage("Đã xóa thành công.");
            CPViewPage.RefreshPage();
        }
        #region private func

        private ModBaoCaoDienBienSuCoEntity entity = null;

        private bool ValidBCDienBien(ref ModBaoCaoDienBienSuCoEntity entity, MAppend append, string endCode)
        {
            if (string.IsNullOrEmpty(entity.ChiTiet_MoTa))
            {
                CPViewPage.Message.ListMessage.Add("Bạn chưa nhập Mô tả diễn biến sự cố.");
            }

            if (CPViewPage.Message.ListMessage.Count > 0)
            {
                string message = @"Thông tin còn thiếu hoặc chưa hợp lệ: \n";

                for (int i = 0; i < CPViewPage.Message.ListMessage.Count; i++)
                    message += @"\n + " + CPViewPage.Message.ListMessage[i];

                CPViewPage.Alert(message);
                return false;
            }

            return true;
        }

        #endregion
    }

    public class FormBaoCaoDienBienSuCoModel : DefaultModel
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
        public int BaoCaoSuCoID { get; set; }
    }
}

