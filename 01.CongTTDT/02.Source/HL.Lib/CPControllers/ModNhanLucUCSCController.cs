using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;
using System.Linq;

namespace HL.Lib.CPControllers
{
    public class ModNhanLucUCSCController : CPController
    {
        public ModNhanLucUCSCController()
        {
            //khoi tao Service
            DataService = ModNhanLucUCSCService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModNhanLucUCSCModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            var lstDonDk = ModDonDangKyUCSCService.Instance.CreateQuery()
                .Where(o => o.UserID == model.ThanhVienID && o.Activity == true)
                .ToSingle();
            var lstHSThanhVien = ModHSThanhVienUCSCService.Instance.CreateQuery()
                .Where(o => o.UserID == model.ThanhVienID && o.Activity == true)
                .ToSingle();
            int donDk = 0, hsThanhVien = 0;
            if (lstDonDk != null) donDk = lstDonDk.ID;
            if (lstHSThanhVien != null) hsThanhVien = lstHSThanhVien.ID;

            // tao danh sach
            var dbQuery = ModNhanLucUCSCService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .Where(model.MenuIDs_TrinhDoDT > 0, o => o.MenuIDs_TrinhDoDT.Contains(model.MenuIDs_TrinhDoDT.ToString()))
                                .Where(model.MenuIDs_ChungChi > 0, o => o.MenuIDs_ChungChi.Contains(model.MenuIDs_ChungChi.ToString()))
                                .Where(donDk > 0, o => o.DonDangKyUCSCID == donDk)
                                .Where(hsThanhVien > 0, o => o.HSThanhVienUCSCID == hsThanhVien)
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModNhanLucUCSCModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModNhanLucUCSCService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new ModNhanLucUCSCEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.Activity = CPViewPage.UserPermissions.Approve;
                entity.Order = GetMaxOrder(model);
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModNhanLucUCSCModel model)
        {
            if (ValidSave(model))
                SaveRedirect();
        }

        public void ActionApply(ModNhanLucUCSCModel model)
        {
            if (ValidSave(model))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModNhanLucUCSCModel model)
        {
            if (ValidSave(model))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModNhanLucUCSCEntity entity = null;

        private bool ValidSave(ModNhanLucUCSCModel model)
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

            //kiem tra ten 
            if (entity.Name.Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Nhập tên.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {

                //save
                ModNhanLucUCSCService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        private int GetMaxOrder(ModNhanLucUCSCModel model)
        {
            return ModNhanLucUCSCService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion

        #region Export
        public void ActionExport(ModNhanLucUCSCModel model)
        {
            //lấy danh sách
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            var lstDonDk = ModDonDangKyUCSCService.Instance.CreateQuery()
                .Where(o => o.UserID == model.ThanhVienID && o.Activity == true)
                .ToSingle();
            var lstHSThanhVien = ModHSThanhVienUCSCService.Instance.CreateQuery()
                .Where(o => o.UserID == model.ThanhVienID && o.Activity == true)
                .ToSingle();
            int donDk = 0, hsThanhVien = 0;
            if (lstDonDk != null) donDk = lstDonDk.ID;
            if (lstHSThanhVien != null) hsThanhVien = lstHSThanhVien.ID;

            // tao danh sach
            var dbQuery = ModNhanLucUCSCService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .Where(model.MenuIDs_TrinhDoDT > 0, o => o.MenuIDs_TrinhDoDT.Contains(model.MenuIDs_TrinhDoDT.ToString()))
                                .Where(model.MenuIDs_ChungChi > 0, o => o.MenuIDs_ChungChi.Contains(model.MenuIDs_ChungChi.ToString()))
                                .Where(donDk > 0, o => o.DonDangKyUCSCID == donDk)
                                .Where(hsThanhVien > 0, o => o.HSThanhVienUCSCID == hsThanhVien)
                                .OrderBy(orderBy);
            var listEntity = dbQuery.ToList();
            if (listEntity == null)
            {
                CPViewPage.SetMessage("Không có dữ liệu.");
                return;
            }

            //khai báo tập hợp bản ghi excel
            List<List<object>> list = new List<List<object>>();
            //khai báo 1 dòng excel
            List<object> _list = null;
            for (int i = 0; listEntity != null && listEntity.Count > 0 && i < listEntity.Count; i++)
            {
                _list = new List<object>();
                var lstTd = listEntity[i].getMenuTrinhDo().Select(o => o.Name).ToArray();
                var lstCc = listEntity[i].getMenuChungChi().Select(o => o.Name).ToArray();
                string td = "", cc = "";
                if (lstTd.Length > 0) td = string.Join(",", lstTd);
                if (lstCc.Length > 0) cc = string.Join(",", lstCc);

                var donDangky = ModDonDangKyUCSCService.Instance.CreateQuery()
                    .Where(o => o.ID == listEntity[i].DonDangKyUCSCID && o.Activity == true)
                    .ToSingle();
                var hSThanhVien = ModHSThanhVienUCSCService.Instance.CreateQuery()
                    .Where(o => o.ID == listEntity[i].HSThanhVienUCSCID && o.Activity == true)
                    .ToSingle();

                int tvId = donDangky != null ? donDangky.UserID : hSThanhVien.UserID;
                var user = CPUserService.Instance.GetByID(tvId);
                string loginName = "";
                if (user != null) loginName = user.LoginName;

                _list.Add(loginName);
                _list.Add(td);
                _list.Add(cc);
                _list.Add(listEntity[i].Name);
                _list.Add(listEntity[i].School);
                _list.Add(listEntity[i].NamTotNghiep);
                list.Add(_list);
            }

            //ghi exel
            string temp_file = CPViewPage.Server.MapPath("~/Data/upload/files/Excel/NhanLuc_" +
            string.Format("{0:yyyy_MM_dd}", DateTime.Now) + ".xlsx");
            string filePath = CPViewPage.Server.MapPath("~/TTPortal/Templates/Export_NhanLuc.xlsx");
            Excel.Export(list, 1, filePath, temp_file);
            //CPViewPage.Response.Write("Here!6");


            CPViewPage.Response.Clear();
            CPViewPage.Response.ContentType = "application/excel";
            CPViewPage.Response.AppendHeader("Content-Disposition", "attachment; filename=" + System.IO.Path.GetFileName(temp_file));
            CPViewPage.Response.WriteFile(temp_file);
            CPViewPage.Response.End();

            //CPViewPage.Response.Write("Here!");
        }
        #endregion Export
    }

    public class ModNhanLucUCSCModel : DefaultModel
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
        public int MenuIDs_TrinhDoDT { get; set; }
        public int MenuIDs_ChungChi { get; set; }
        public int ThanhVienID { get; set; }
    }
}

