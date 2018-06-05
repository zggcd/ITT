using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModIncidentController : CPController
    {
        public ModIncidentController()
        {
            //khoi tao Service
            DataService = ModIncidentService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModIncidentModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModIncidentService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModIncidentModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModIncidentService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new ModIncidentEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.MenuID = model.MenuID;
                entity.Activity = CPViewPage.UserPermissions.Approve;
                entity.Order = GetMaxOrder(model);
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModIncidentModel model)
        {
            if (ValidSave(model))
                SaveRedirect();
        }

        public void ActionApply(ModIncidentModel model)
        {
            if (ValidSave(model))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModIncidentModel model)
        {
            if (ValidSave(model))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        public void ActionImport()
        {

        }

        public void ActionImportData()
        {
            string file = HL.Core.Web.HttpQueryString.GetValue("file").ToString();
            string file2 = CPViewPage.Server.MapPath(file);
            int count = Excel.ImportExcel(file2);
            CPViewPage.Message.ListMessage.Add("Đã import được " + count + " doanh nghiệp vào danh sách.");
            CPViewPage.CPRedirect("ModEnterprise/Index.aspx");

        }

        public void ActionExport(ModIncidentModel model)
        {
            RenderView("Index");

            //lấy danh sách thuật ngữ
            var listEntity = ModIncidentService.Instance.CreateQuery()
                        //.Where(o => o.Activity == true)
                        .ToList();

            //khai báo tập hợp bản ghi excel
            List<List<object>> list = new List<List<object>>();
            //khai báo 1 dòng excel
            List<object> _list = null;
            string cityname = "";
            for (int i = 0; listEntity != null && listEntity.Count > 0 && i < listEntity.Count; i++)
            {
                _list = new List<object>();
                //add 1 dòng excel
                // _list.Add(i + 1);
                _list.Add(listEntity[i].Name);
                _list.Add(cityname);
                _list.Add(listEntity[i].Published);
                list.Add(_list);
            }

            //ghi exel
            string temp_file = CPViewPage.Server.MapPath("~/Data/upload/files/Excel/DanhBaDoanhNghiep_" +
            string.Format("{0:dd_MM_yyyy}", DateTime.Now) + ".xls");
            string filePath = CPViewPage.Server.MapPath("~/CP/Templates/DanhBaDoanhNghiep.xls");
            Excel.Export(list, 1, filePath, temp_file);
            //CPViewPage.Response.Write("Here!6");


            CPViewPage.Response.Clear();
            CPViewPage.Response.ContentType = "application/excel";
            CPViewPage.Response.AppendHeader("Content-Disposition", "attachment; filename=" + System.IO.Path.GetFileName(temp_file));
            CPViewPage.Response.WriteFile(temp_file);
            CPViewPage.Response.End();

            //CPViewPage.Response.Write("Here!");
        }

        #region private func

        private ModIncidentEntity entity = null;

        private bool ValidSave(ModIncidentModel model)
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
                ModIncidentService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        private int GetMaxOrder(ModIncidentModel model)
        {
            return ModIncidentService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion
    }

    public class ModIncidentModel : DefaultModel
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

    public class ModFileExcelEntity
    {
        public ModFileExcelEntity() { }
        public string File { get; set; }
    }
}

