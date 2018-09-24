using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;
using System.Linq;

namespace HL.Lib.CPControllers
{
    public class ModCVEController : CPController
    {
        public ModCVEController()
        {
            //khoi tao Service
            DataService = ModCVEService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModCVEModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModCVEService.Instance.CreateQuery()
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("CVE", model.MenuID, model.LangID))
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModCVEModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModCVEService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
                entity.Updated = DateTime.Now;
            }
            else
            {
                entity = new ModCVEEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.MenuID = model.MenuID;
                entity.Activity = CPViewPage.UserPermissions.Approve;
                entity.Order = GetMaxOrder(model);
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public void ActionSave(ModCVEModel model)
        {
            if (ValidSave(model))
               SaveRedirect();
        }

        public void ActionApply(ModCVEModel model)
        {
            if (ValidSave(model))
               ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModCVEModel model)
        {
            if (ValidSave(model))
               SaveNewRedirect(model.RecordID, entity.ID);
        }

        public void ActionResolveGX(int[] arrID)
        {
            if (CheckPermissions && !CPViewPage.UserPermissions.Approve)
            {
                //thong bao
                CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;
                CPViewPage.Message.ListMessage.Add("Quyền hạn chế.");
                return;
            }

            DataService.Update("[ID]=" + arrID[0],
                        "@Resolve", arrID[1]);

            //thong bao
            CPViewPage.SetMessage("Đã thực hiện thành công.");
            CPViewPage.RefreshPage();
        }

        #region private func

        private ModCVEEntity entity = null;

        private bool ValidSave(ModCVEModel model)
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

            //kiem tra chuyen muc
            if (entity.MenuID < 1)
                CPViewPage.Message.ListMessage.Add("Chọn chuyên mục.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {

                 //cap nhat state
                entity.State = GetState(model.ArrState);

                //save
                ModCVEService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        private int GetMaxOrder(ModCVEModel model)
        {
            return ModCVEService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion

        public void ActionImport(ModCVEModel model)
        {
            if (model.MenuID > 0)
            {
            }
            else
            {
            }

            ViewBag.Data = new ModFileExcelEntity();
            ViewBag.Model = model;
        }

        public void ActionImportData(ModCVEModel model)
        {
            CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;

            string filePath = CPViewPage.Server.MapPath(model.File);

            if (!filePath.EndsWith(".xls") && !filePath.EndsWith(".xlsx"))
            {
                CPViewPage.Message.ListMessage.Add("File không đúng định dạng (yêu cầu: .xls, .xlsx).");
            }
            else if (!System.IO.File.Exists(filePath))
            {
                CPViewPage.Message.ListMessage.Add("File không tồn tại.");
            }

            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                model.FilePath = filePath;
                string msg = "", success = "";
                int count = Excel.ImportExcel_CVE(model, ref msg, ref success);

                if (!string.IsNullOrEmpty(msg))
                {
                    CPViewPage.Message.ListMessage.Add(msg);
                }
                else
                {
                    CPViewPage.SetMessage("Đã import được " + count + " sự cố." + success);
                }

                //CPViewPage.CPRedirect("ModCVE/Index.aspx");
                //CPViewPage.Request.RawUrl.Replace("Import.aspx", "Index.aspx");
            }

        }

        public void ActionSendMail(EmailEntity emailEntity)
        {
            // Lay danh sach CVE
            ModCVEEntity cve = ModCVEService.Instance.CreateQuery().Where(o => o.ID == emailEntity.RecordID).ToSingle();

            // Lay template
            ModEmailTemplateEntity emailTemp = ModEmailTemplateService.Instance.CreateQuery().Where(o => o.Activity == true && o.Code == "Type1").ToSingle();

            // Lay he thong thong tin theo CVE tuong ung
            string s = cve.VulnerabilityType;
            var query = ModHeThongThongTinService.Instance.CreateQuery()
                .Where(o => o.Activity == true)
                .Where(!string.IsNullOrEmpty(s), o => o.Name.Contains(s));
            List<ModHeThongThongTinEntity> lstHttt = query.ToList();

            string emailTos = "";
            if (lstHttt != null)
            {
                string dauMoiIds = string.Join(",", lstHttt.Select(o => o.DauMoiUCSCID).ToArray());
                string donDkIds = string.Join(",", lstHttt.Select(o => o.DonDangKyUCSCID).ToArray());

                // Lay dau moi UCSC
                List<ModDauMoiUCSCEntity> lstDauMoi = ModDauMoiUCSCService.Instance.CreateQuery()
                    .Where(o => o.Activity == true)
                    .WhereIn(dauMoiIds != "", o => o.ID, dauMoiIds)
                    .ToList();
                emailTos = string.Join(";", lstDauMoi.Select(o => o.Email).ToArray());

                // Lay don DK
                List<ModDonDangKyUCSCEntity> lstDangKy = ModDonDangKyUCSCService.Instance.CreateQuery()
                    .Where(o => o.Activity == true)
                    .WhereIn(donDkIds != "", o => o.ID, donDkIds)
                    .ToList();
                emailTos += ";" + string.Join(";", lstDangKy.Select(o => o.ToChuc_Email).ToArray());
                emailTos.Replace(";;", ";").Replace(";;", ";").Replace(";;", ";").Trim(';');
            }

            if (emailTemp != null)
            {
                if (emailTos != "") emailEntity.To = emailTos;
                emailEntity.Cc = "tnchung@vncert.vn";
                emailEntity.Subject = string.Format(emailTemp.Subject, "");
                emailEntity.Body = cve.VulnerabilityType;
            }

            ViewBag.Data = emailEntity;
        }

        public void ActionSendMailExcute(EmailEntity emailEntity)
        {
            ViewBag.Data = emailEntity;

            CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;

            if (string.IsNullOrEmpty(emailEntity.To))
                CPViewPage.Message.ListMessage.Add("Bạn chưa nhập Email tiếp nhận.");
            else
            {
                var toArr = emailEntity.To.Split(',');
                foreach (var i in toArr)
                {
                    if (Utils.GetEmailAddress(i) == string.Empty)
                        CPViewPage.Message.ListMessage.Add("Định dạng Email tiếp nhận không đúng.");
                }
            }

            if (!string.IsNullOrEmpty(emailEntity.Cc))
            {
                var ccArr = emailEntity.Cc.Split(',');
                foreach (var i in ccArr)
                {
                    if (Utils.GetEmailAddress(i) == string.Empty)
                        CPViewPage.Message.ListMessage.Add("Định dạng Email Cc không đúng.");
                }
            }

            if (string.IsNullOrEmpty(emailEntity.Subject))
                CPViewPage.Message.ListMessage.Add("Bạn chưa nhập Tiêu đề.");

            if (string.IsNullOrEmpty(emailEntity.Body))
                CPViewPage.Message.ListMessage.Add("Bạn chưa nhập Nội dung.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                // Goi ham send mail
                string sendResult = Mail.SendMailUseSMTP(emailEntity.To, emailEntity.Cc, emailEntity.Subject, emailEntity.Body, emailEntity.Attach);

                if (!string.IsNullOrEmpty(sendResult))
                    CPViewPage.Message.ListMessage.Add("Gửi mail lỗi. Hãy kiểm tra lại việc cấu hình email của bạn.");
                else
                {
                    CPViewPage.SetMessage("Gửi mail thành công.");

                    // Thuc hien tang so lan gui mail them 1
                    var CVE = ModCVEService.Instance.CreateQuery().Where(o => o.ID == emailEntity.RecordID).ToSingle();
                    CVE.EmailNo++;
                    ModCVEService.Instance.Save(CVE);
                }
            }
        }
    }

    public class ModCVEModel : DefaultModel
    {
        private int _LangID = 1;
        public int LangID
        {
            get { return _LangID; }
            set { _LangID = value; }
        }

        public int MenuID { get; set; }
        public int State { get; set; }

        public int[] ArrState { get; set; }
        public string File { get; set; }
        public string FilePath { get; set; }
    }
}

