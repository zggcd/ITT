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

            DateTime? f = HL.Core.Global.Convert.ToDateTime(model.From, DateTime.MinValue);
            DateTime? t = HL.Core.Global.Convert.ToDateTime(model.To, DateTime.MaxValue);
            DateTime? from = f != DateTime.MinValue ? f : null;
            DateTime? to = t != DateTime.MaxValue ? t : null;

            // tao danh sach
            var dbQuery = ModIncidentService.Instance.CreateQuery().Where(o => o.ParentID == null)
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .Where(from != null, o => o.AttackOn >= from)
                                .Where(to != null, o => o.AttackOn <= to)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                                .Select(o => new ModIncidentEntity()
                                {
                                    ID = o.ID,
                                    ParentID = o.ParentID,
                                    MenuID = o.MenuID,
                                    State = o.State,
                                    Name = o.Name,
                                    Code = o.Code,
                                    Path = o.Path,
                                    FakeDestination = o.FakeDestination,
                                    Source = o.Source,
                                    AttackOn = o.AttackOn,
                                    IP = o.IP,
                                    ISP = o.ISP,
                                    EmailNo = o.EmailNo,
                                    Attacker = o.Attacker,
                                    MalwareName = o.MalwareName,
                                    AttackerIP = o.AttackerIP,
                                    NetworkName = o.NetworkName,
                                    LocalIP = o.LocalIP,
                                    LocalTCPPort = o.LocalTCPPort,
                                    Timestamp = o.Timestamp,
                                    ASN = o.ASN,
                                    Geo = o.Geo,
                                    Url = o.Url,
                                    Type = o.Type,
                                    HttpAgent = o.HttpAgent,
                                    SrcPort = o.SrcPort,
                                    HostName = o.HostName,
                                    Destinationport = o.Destinationport,
                                    Protocol = o.Protocol,
                                    ServerName = o.ServerName,
                                    Server = o.Server,
                                    Header = o.Header,
                                    Tag = o.Tag,
                                    Region = o.Region,
                                    City = o.City,
                                    Sector = o.Sector,
                                    Published = o.Published,
                                    Order = o.Order,
                                    Resolve = o.Resolve,
                                    Activity = o.Activity,
                                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ParentID == o.ID).ToList().Count
                                })
                                .OrderBy("ChildNum DESC")
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

        public void ActionImport(ModIncidentModel model)
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

        public void ActionImportData(ModIncidentModel model)
        {
            CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;

            if (model.MenuID < 1)
                CPViewPage.Message.ListMessage.Add("Chọn Loại sự cố.");

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
                int count = Excel.ImportExcel_Incident(model, ref msg, ref success);

                if (!string.IsNullOrEmpty(msg))
                {
                    CPViewPage.Message.ListMessage.Add(msg);
                }
                else
                {
                    CPViewPage.SetMessage("Đã import được " + count + " sự cố." + success);
                }

                //CPViewPage.CPRedirect("ModIncident/Index.aspx");
                //CPViewPage.Request.RawUrl.Replace("Import.aspx", "Index.aspx");
            }

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
            string temp_file = CPViewPage.Server.MapPath("~/Data/upload/files/Excel/DanhSachSuCo_" +
            string.Format("{0:dd_MM_yyyy}", DateTime.Now) + ".xls");
            string filePath = CPViewPage.Server.MapPath("~/TTPortal/Templates/DanhSachSuCo.xlsx");
            Excel.Export(list, 1, filePath, temp_file);
            //CPViewPage.Response.Write("Here!6");


            CPViewPage.Response.Clear();
            CPViewPage.Response.ContentType = "application/excel";
            CPViewPage.Response.AppendHeader("Content-Disposition", "attachment; filename=" + System.IO.Path.GetFileName(temp_file));
            CPViewPage.Response.WriteFile(temp_file);
            CPViewPage.Response.End();

            //CPViewPage.Response.Write("Here!");
        }

        //public void ExportToPDF(ModIncidentModel model)
        //{
        //    RenderView("Index");

        //    //lấy danh sách thuật ngữ
        //    var listEntity = ModIncidentService.Instance.CreateQuery()
        //                //.Where(o => o.Activity == true)
        //                .ToList();

        //    //khai báo tập hợp bản ghi excel
        //    List<List<object>> list = new List<List<object>>();
        //    //khai báo 1 dòng excel
        //    List<object> _list = null;
        //    string cityname = "";
        //    for (int i = 0; listEntity != null && listEntity.Count > 0 && i < listEntity.Count; i++)
        //    {
        //        _list = new List<object>();
        //        //add 1 dòng excel
        //        // _list.Add(i + 1);
        //        _list.Add(listEntity[i].Name);
        //        _list.Add(cityname);
        //        _list.Add(listEntity[i].Published);
        //        list.Add(_list);
        //    }

        //    //ghi exel
        //    string temp_file = CPViewPage.Server.MapPath("~/Data/upload/files/Excel/DanhSachSuCo_" +
        //    string.Format("{0:dd_MM_yyyy}", DateTime.Now) + ".xls");
        //    string filePath = CPViewPage.Server.MapPath("~/TTPortal/Templates/DanhSachSuCo.xlsx");



        //    CPViewPage.Response.ContentType = "application/pdf";
        //    CPViewPage.Response.AddHeader("content-disposition", "attachment;filename=DataTable.pdf");
        //    CPViewPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    StringWriter sw = new StringWriter();
        //    HtmlTextWriter hw = new HtmlTextWriter(sw);
        //    GridView1.RenderControl(hw);
        //    StringReader sr = new StringReader(sw.ToString());
        //    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
        //    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        //    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        //    pdfDoc.Open();
        //    htmlparser.Parse(sr);
        //    pdfDoc.Close();
        //    CPViewPage.Response.Write(pdfDoc);
        //    CPViewPage.Response.End();
        //}

        public void ActionSendMail(EmailEntity emailEntity)
        {
            // Lay danh sach su co
            ModIncidentEntity suCoParent = ModIncidentService.Instance.CreateQuery().Where(o => o.ID == emailEntity.RecordID).ToSingle();
            List<ModIncidentEntity> suCos = null;
            WebMenuEntity menuIncident = null;
            string sSuCo = string.Empty, isp = string.Empty, ip = string.Empty;
            string s2 = string.Empty, s3 = string.Empty, s4 = string.Empty, sName = string.Empty;
            //{2}: (giả mạo (phishing), nhiễm mã độc  (malware), (thay đổi giao diện) Deface )
            //{3}: , và các cố {2}
            // {4}: {2} + {3}
            if (suCoParent != null)
            {
                suCos = ModIncidentService.Instance.CreateQuery().Where(o => o.Resolve == false && o.ParentID == suCoParent.ID).ToList();
                sSuCo += "<b><span>" + suCoParent.Path + "</span></b>";
                isp = suCoParent.ISP;
                ip = suCoParent.IP;
            }
            if (suCos != null && suCos.Count > 0)
            {
                int countSuCo = suCos.Count;
                for (int i = 0; i < countSuCo; i ++)
                {
                    menuIncident = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "Incident" && o.ID == suCos[i].MenuID).ToSingle();
                    if (menuIncident != null)
                    {
                        sName = menuIncident.Code == "Phishing" ? "giả mạo (Phishing)" : menuIncident.Code == "Malware" ? "nhiễm mã độc(Malware)" : "thay đổi giao diện (Deface)";
                        if (i == 0)
                        {
                            s2 = sName;
                        }
                        else
                        {
                            s3 += sName;
                            if (i < countSuCo - 1)
                            {
                                s3 += ", ";
                            }
                        }
                    }
                    sSuCo += "<br />&nbsp;&nbsp;&nbsp;&nbsp;" + suCos[i].Path + "<br />";
                }
            }
            sSuCo += ip;

            // Lay template
            ModEmailTemplateEntity emailTemp = ModEmailTemplateService.Instance.CreateQuery().Where(o => o.Activity == true && o.Code == "Type1").ToSingle();

            // Lay email gui di theo ISP
            ModISPEntity ispEntity = ModISPService.Instance.CreateQuery().Where(o => o.Activity == true && o.Name == isp).ToSingle();

            if (emailTemp != null)
            {
                if (ispEntity != null) emailEntity.To = ispEntity.Email;
                emailEntity.Cc = "tnchung@vncert.vn";
                emailEntity.Subject = string.Format(emailTemp.Subject, isp);
                emailEntity.Body = string.Format(emailTemp.Content, isp, sSuCo, s2, (!string.IsNullOrEmpty(s3) ? ", và các sự cố " + s3 : ""), s2 + (!string.IsNullOrEmpty(s3) ? ", " + s3 : ""));
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
                    var incident = ModIncidentService.Instance.CreateQuery().Where(o => o.ID == emailEntity.RecordID).ToSingle();
                    incident.EmailNo++;
                    ModIncidentService.Instance.Save(incident);
                }
            }
        }

        public void ActionResolveGX(int id)
        {
            //update for id
            ModIncidentService.Instance.Update(o => o.ID == id,
                "@Resolve", 1);

            //update for != id
            //ModIncidentService.Instance.Update(o => o.ID != id,
            //    "@Resolve", 0);

            //thong bao
            CPViewPage.SetMessage("Đã thực hiện thành công.");
            CPViewPage.RefreshPage();
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
        public string Menu { get; set; }
        public int State { get; set; }
        public string SearchText { get; set; }

        public int[] ArrState { get; set; }
        public string File { get; set; }
        public string FilePath { get; set; }

        public int PhishingState { get; set; }
        public int MalwareState { get; set; }
        public int ISPState { get; set; }
        public int DomainState { get; set; }
        public int VirusState { get; set; }
        public string From { get; set; }
        public string To { get; set; }
        public int MemberID { get; set; }
    }

    public class ModFileExcelEntity
    {
        public int MenuID { get; set; }
        public ModFileExcelEntity() { }
        public string File { get; set; }
    }

    public class EmailEntity
    {
        public string To { get; set; }
        public string Cc { get; set; }
        public string Subject { get; set; }
        public string Body { get; set; }
        public string Attach { get; set; }

        public int RecordID { get; set; }
    }

}

