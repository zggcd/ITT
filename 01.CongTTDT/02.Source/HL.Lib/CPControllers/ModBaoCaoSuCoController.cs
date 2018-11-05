using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;
using System.Linq;

namespace HL.Lib.CPControllers
{
    public class ModBaoCaoSuCoController : CPController
    {
        public ModBaoCaoSuCoController()
        {
            //khoi tao Service
            DataService = ModBaoCaoSuCoService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModBaoCaoSuCoModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            DateTime? dFrom = null;
            DateTime? dTo = null;
            DateTime? f = HL.Core.Global.Convert.ToDateTime(model.From, DateTime.MinValue);
            DateTime? t = HL.Core.Global.Convert.ToDateTime(model.To, DateTime.MaxValue);
            DateTime? from = f != DateTime.MinValue ? f : dFrom != null ? dFrom : null;
            DateTime? to = t != DateTime.MaxValue ? t : dTo != null ? dTo : null;
            model.From = from != null ? HL.Core.Global.Convert.ToDateTime(from).ToShortDateString() : "";
            model.To = to != null ? HL.Core.Global.Convert.ToDateTime(to).ToShortDateString() : "";

            // Search theo user
            var user = CPUserService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.LoginName.Contains(model.SearchText))
                                .ToList();
            string s = "";
            if (user != null)
            {
                s = string.Join(",", user.Select(o => o.ID).ToArray());
            }

            // Lay user chiu trach nhiem xu ly su co
            int userTrachNhiem = 0;
            if (CPLogin.CurrentUser.IsAdministrator == false) {
                userTrachNhiem = CPLogin.CurrentUser.ID;
            }

            // tao danh sach
            var dbQuery = ModBaoCaoSuCoService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText) && string.IsNullOrEmpty(s), o => o.Title.Contains(model.SearchText))
                                .WhereIn(!string.IsNullOrEmpty(s), o => o.UserID, s)
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .Where(userTrachNhiem > 0, o => o.UserID2 == userTrachNhiem)
                                .Where(model.ThanhVienID > 0, o => o.UserID == model.ThanhVienID)
                                .Where(model.MenuID1 > 0, o => o.MenuID1 == model.MenuID1)
                                .Where(from != null, o => o.Published >= from)
                                .Where(to != null, o => o.Published <= to)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("BaoCaoSuCo", model.MenuID, model.LangID))
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModBaoCaoSuCoModel model)
        {
            // Lay user chiu trach nhiem xu ly su co
            int userTrachNhiem = 0;
            if (CPLogin.CurrentUser.IsAdministrator == false)
            {
                userTrachNhiem = CPLogin.CurrentUser.ID;
            }

            if (model.RecordID > 0)
            {
                entity = ModBaoCaoSuCoService.Instance.GetByID(model.RecordID);

                if (userTrachNhiem > 0)
                {
                    if (entity.UserID2 != userTrachNhiem)
                    {
                        CPViewPage.Message.MessageType = Message.MessageTypeEnum.Notice;
                        CPViewPage.SetMessage("Bản ghi không tồn tại.");
                        CPViewPage.Response.Redirect(CPViewPage.Request.RawUrl.Replace("Add.aspx", "Index.aspx"));
                    }
                }

                // khoi tao gia tri mac dinh khi update
                entity.UserID1 = CPLogin.CurrentUser.ID;
                entity.Published1 = DateTime.Now;
            }
            else
            {
                entity = new ModBaoCaoSuCoEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.MenuID = model.MenuID;
                entity.Published = DateTime.Now;
                entity.Activity = CPViewPage.UserPermissions.Approve;
                entity.Order = GetMaxOrder(model);
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModBaoCaoSuCoModel model)
        {
            if (ValidSave(model))
               SaveRedirect();
        }

        public void ActionApply(ModBaoCaoSuCoModel model)
        {
            if (ValidSave(model))
               ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModBaoCaoSuCoModel model)
        {
            if (ValidSave(model))
               SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region Export
        public void ActionExport(ModBaoCaoSuCoModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            DateTime? dFrom = null;
            DateTime? dTo = null;
            DateTime? f = HL.Core.Global.Convert.ToDateTime(model.From, DateTime.MinValue);
            DateTime? t = HL.Core.Global.Convert.ToDateTime(model.To, DateTime.MaxValue);
            DateTime? from = f != DateTime.MinValue ? f : dFrom != null ? dFrom : null;
            DateTime? to = t != DateTime.MaxValue ? t : dTo != null ? dTo : null;
            model.From = from != null ? HL.Core.Global.Convert.ToDateTime(from).ToShortDateString() : "";
            model.To = to != null ? HL.Core.Global.Convert.ToDateTime(to).ToShortDateString() : "";

            // Search theo user
            var user = CPUserService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.LoginName.Contains(model.SearchText))
                                .ToList();
            string s = "";
            if (user != null)
            {
                s = string.Join(",", user.Select(o => o.ID).ToArray());
            }

            // Lay user chiu trach nhiem xu ly su co
            int userTrachNhiem = 0;
            if (CPLogin.CurrentUser.IsAdministrator == false)
            {
                userTrachNhiem = CPLogin.CurrentUser.ID;
            }

            // tao danh sach
            var dbQuery = ModBaoCaoSuCoService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText) && string.IsNullOrEmpty(s), o => o.Title.Contains(model.SearchText))
                                .WhereIn(!string.IsNullOrEmpty(s), o => o.UserID, s)
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .Where(userTrachNhiem > 0, o => o.UserID2 == userTrachNhiem)
                                .Where(model.ThanhVienID > 0, o => o.UserID == model.ThanhVienID)
                                .Where(model.MenuID1 > 0, o => o.MenuID1 == model.MenuID1)
                                .Where(from != null, o => o.Published >= from)
                                .Where(to != null, o => o.Published <= to)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("BaoCaoSuCo", model.MenuID, model.LangID))
                                .Take(model.PageSize)
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
                var user1 = CPUserService.Instance.GetByID(listEntity[i].UserID);
                var user2 = CPUserService.Instance.GetByID(listEntity[i].UserID2);
                _list = new List<object>();
                _list.Add(user2?.LoginName);
                _list.Add(user1?.LoginName);

                // Loai su co
                WebMenuEntity menu1 = WebMenuService.Instance.GetByID(listEntity[i].MenuID1);
                _list.Add(menu1?.Name);

                // Trang thai
                WebMenuEntity menu = WebMenuService.Instance.GetByID(listEntity[i].MenuID);
                _list.Add(menu?.Name);

                _list.Add(listEntity[i].Title);
                _list.Add(listEntity[i].Name);
                _list.Add(listEntity[i].Code);
                _list.Add(listEntity[i].Address);
                _list.Add(listEntity[i].Phone);
                _list.Add(listEntity[i].Email);
                _list.Add(string.Format("{0:dd/MM/yyyy}", listEntity[i].Published));
                list.Add(_list);
            }

            //ghi exel
            string temp_file = CPViewPage.Server.MapPath("~/Data/upload/files/Excel/BaoCaoSuCo_" +
            string.Format("{0:yyyy_MM_dd}", DateTime.Now) + ".xlsx");
            string filePath = CPViewPage.Server.MapPath("~/TTPortal/Templates/Export_BaoCaoSuCo.xlsx");
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

        #region private func

        private ModBaoCaoSuCoEntity entity = null;

        private bool ValidSave(ModBaoCaoSuCoModel model)
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

            // kiem tra ten su co
            if (entity.Title.Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Nhập tên sự cố.");

            //kiem tra ten 
            if (entity.Name.Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Nhập tên tổ chức.");

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

                entity.Published2 = null;
                string trangThai = WebMenuService.Instance.GetByID(entity.MenuID).Code;
                if (trangThai == "KetThuc")
                {
                    entity.Published2 = DateTime.Now;
                }

                //save
                ModBaoCaoSuCoService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        private int GetMaxOrder(ModBaoCaoSuCoModel model)
        {
            return ModBaoCaoSuCoService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion
    }

    public class ModBaoCaoSuCoModel : DefaultModel
    {
        private int _LangID = 1;
        public int LangID
        {
            get { return _LangID; }
            set { _LangID = value; }
        }

        public int MenuID { get; set; }
        public int MenuID1 { get; set; }
        public int ThanhVienID { get; set; }
        public int State { get; set; }
        public string SearchText { get; set; }

        public int[] ArrState { get; set; }
        public string From { get; set; }
        public string To { get; set; }
    }
}

