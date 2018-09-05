using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModThongBaoSuCoController : CPController
    {
        public ModThongBaoSuCoController()
        {
            //khoi tao Service
            DataService = ModThongBaoSuCoService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModThongBaoSuCoModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModThongBaoSuCoService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.ChiTiet_TenHeThong.Contains(model.SearchText) || o.ChiTiet_TenDonVi.Contains(model.SearchText) || o.ChiTiet_CoQuan.Contains(model.SearchText) || o.ChiTiet_MoTa.Contains(model.SearchText) || o.ToChuc_Ten.Contains(model.SearchText))
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("ThongBaoSuCo", model.MenuID, model.LangID))
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModThongBaoSuCoModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModThongBaoSuCoService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
                entity.UserID1 = CPLogin.CurrentUser.ID;
                entity.UpdatedDate = DateTime.Now;
            }
            else
            {
                entity = new ModThongBaoSuCoEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.MenuID = model.MenuID;
                entity.CreatedDate = DateTime.Now;
                entity.Activity = CPViewPage.UserPermissions.Approve;
                entity.Order = GetMaxOrder(model);
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModThongBaoSuCoModel model, MAppend append)
        {
            if (ValidSave(model, append))
                SaveRedirect();
        }

        public void ActionApply(ModThongBaoSuCoModel model, MAppend append)
        {
            if (ValidSave(model, append))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModThongBaoSuCoModel model, MAppend append)
        {
            if (ValidSave(model, append))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModThongBaoSuCoEntity entity = null;

        private bool ValidSave(ModThongBaoSuCoModel model, MAppend append)
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

            if (string.IsNullOrEmpty(entity.ToChuc_Ten))
            {
                CPViewPage.Message.ListMessage.Add("Bạn chưa nhập Tên tổ chức/cá nhân thông báo sự cố.");
            }
            if (string.IsNullOrEmpty(entity.ToChuc_DiaChi))
            {
                CPViewPage.Message.ListMessage.Add("Bạn chưa nhập Địa chỉ tổ chức/cá nhân thông báo sự cố.");
            }
            if (string.IsNullOrEmpty(entity.ChiTiet_TenHeThong))
            {
                CPViewPage.Message.ListMessage.Add("Bạn chưa nhập Tên hoặc tên miền, địa chỉ IP của hệ thống thông tin bị sự cố.");
            }
            if (string.IsNullOrEmpty(entity.ChiTiet_TenDonVi))
            {
                CPViewPage.Message.ListMessage.Add("Bạn chưa nhập Tên cơ quan chủ quản hệ thống thông tin bị sự cố.");
            }
            if (string.IsNullOrEmpty(entity.ChiTiet_MoTa))
            {
                CPViewPage.Message.ListMessage.Add("Bạn chưa nhập Mô tả sơ bộ về sự cố.");
            }
            if (string.IsNullOrEmpty(entity.ChiTiet_KetQua))
            {
                CPViewPage.Message.ListMessage.Add("Bạn chưa nhập Kết quả xử lý sự cố đề xuất.");
            }

            // Ngay & thoi gian phat hien su co
            if (entity.ChiTiet_NgayGioPhatHien == DateTime.MinValue)
            {
                CPViewPage.Message.ListMessage.Add("Ngày hoặc Thời gian phát hiện sự cố không hợp lệ.");
            }
            else
            {
                bool hasThoiGian = true;
                if (string.IsNullOrEmpty(append.Ngay))
                {
                    CPViewPage.Message.ListMessage.Add("Bạn chưa nhập Ngày phát hiện sự cố.");
                    hasThoiGian = false;
                }
                if (string.IsNullOrEmpty(append.Gio.ToString()) && string.IsNullOrEmpty(append.Phut.ToString()))
                {
                    CPViewPage.Message.ListMessage.Add("Bạn chưa nhập Thời gian phát hiện sự cố.");
                    hasThoiGian = false;
                }
                if (hasThoiGian == true)
                {
                    string[] arr = append.GioPhut.Split(':');
                    string gio = !string.IsNullOrEmpty(arr[0]) ? arr[0] : "00";
                    string phut = !string.IsNullOrEmpty(arr[1]) ? arr[1] : "00";
                    string ngayGioPhatHien = append.Ngay + " " + gio + ":" + phut;


                    if (Int32.Parse(gio, 0) < 0 || Int32.Parse(gio, 0) > 24 || Int32.Parse(phut, 0) < 0 || Int32.Parse(phut, 0) > 59)
                    {
                        CPViewPage.Message.ListMessage.Add("Thời gian phát hiện sự cố không hợp lệ.");
                        entity.ChiTiet_NgayGioPhatHien = null;
                    }
                    else
                    {
                        DateTime dt = HL.Core.Global.Convert.ToDateTime(ngayGioPhatHien);
                        entity.ChiTiet_NgayGioPhatHien = dt;
                        if (dt == DateTime.MinValue)
                        {
                            CPViewPage.Message.ListMessage.Add("Ngày phát hiện sự cố không hợp lệ.");
                            entity.ChiTiet_NgayGioPhatHien = null;
                        }
                    }
                }
            }

            //kiem tra chuyen muc
            if (entity.MenuID < 1)
                CPViewPage.Message.ListMessage.Add("Chọn chuyên mục.");


            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                //neu khong nhap code -> tu sinh
                if (entity.Code.Trim() == string.Empty)
                    entity.Code = Data.GetCode(entity.Name);

                //cap nhat state
                entity.State = GetState(model.ArrState);

                //save
                ModThongBaoSuCoService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        private int GetMaxOrder(ModThongBaoSuCoModel model)
        {
            return ModThongBaoSuCoService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }
        #endregion
    }

    public class ModThongBaoSuCoModel : DefaultModel
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
    }
}
