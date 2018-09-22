using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Globalization;

using NLog;
using HL.Lib.CPControllers;
using HL.Lib.Models;
using HL.Lib.Global;
using System.Web;
using System.Xml.Linq;
using System.Xml.Xsl;
using System.Xml.XPath;
using Aspose.Words;
using System.Data;
using System.Configuration;

namespace BatchJob
{
    static class Program
    {
        private static readonly Logger Logger = LogManager.GetCurrentClassLogger();

        static void Main(string[] args)
        {
            try
            {
                Console.Title = "ITT - Batch job application.";

                SendMail();

                //#pragma warning disable CS0618 // Type or member is obsolete
                //                string SmtpServer = System.Configuration.ConfigurationSettings.AppSettings["SmtpServer"].ToString();
                //                string MailUserName = System.Configuration.ConfigurationSettings.AppSettings["MailUserName"].ToString();
                //                string MailPassword = System.Configuration.ConfigurationSettings.AppSettings["MailPassword"].ToString();
                //                string MailFrom = System.Configuration.ConfigurationSettings.AppSettings["MailFrom"].ToString();
                //                string MailPort = System.Configuration.ConfigurationSettings.AppSettings["MailPort"].ToString();
                //                string EnableSsl = System.Configuration.ConfigurationSettings.AppSettings["EnableSsl"].ToString();
                //#pragma warning restore CS0618 // Type or member is obsolete

                //                if (string.IsNullOrEmpty(SmtpServer) || string.IsNullOrEmpty(MailUserName) || string.IsNullOrEmpty(MailPassword)
                //                    || string.IsNullOrEmpty(MailFrom) || string.IsNullOrEmpty(MailPort) || string.IsNullOrEmpty(EnableSsl))
                //                {
                //                    Console.WriteLine("ERROR: Ban chua cau hinh Email trong file config");
                //                    Logger.Error($"Failed: Ban chua cau hinh Email trong file config");
                //                    return;
                //                }
            }
            catch (Exception ex)
            {
                Logger.Error($"Failed: {ex.Message}\n {ex.StackTrace}");
                Console.WriteLine("Exception: " + ex.Message);
            }
        }

        private static void SendMail()
        {
            // Khai bao bien
            List<ModIncidentEntity> incidents;
            EmailEntity emailEntity;
            DateTime dateNow = DateTime.Now;
            DateTime ngayDauTuan;
            TimeSpan subtract;
            WebMenuEntity menuIncident = null;
            WebMenuEntity chuKyGuiMail = null;
            bool allowSend = false;
            string sSuCo = string.Empty, isp = string.Empty, ip = string.Empty;
            string s2 = string.Empty, s3 = string.Empty, s4 = string.Empty, sName = string.Empty;
            string tempFolderConfig = ConfigurationManager.AppSettings.Get("TempFolder");
            string exportTemp = ConfigurationManager.AppSettings.Get("ExportTemp");
            string exportConfig = ConfigurationManager.AppSettings.Get("Export");

            if (string.IsNullOrEmpty(tempFolderConfig))
            {
                Console.WriteLine("ERROR: Ban chua cau hinh cho key TempFolder.");
                Console.WriteLine("===== Ket thuc chuong trinh =====");
                Logger.Error($"Ban chua cau hinh cho key TempFolder.");
                return;
            }
            if (string.IsNullOrEmpty(exportConfig))
            {
                Console.WriteLine("ERROR: Ban chua cau hinh cho key Export.");
                Console.WriteLine("===== Ket thuc chuong trinh =====");
                Logger.Error($"Ban chua cau hinh cho key Export.");
                return;
            }
            if (string.IsNullOrEmpty(exportTemp))
            {
                Console.WriteLine("ERROR: Ban chua cau hinh cho key ExportTemp.");
                Console.WriteLine("===== Ket thuc chuong trinh =====");
                Logger.Error($"Ban chua cau hinh cho key ExportTemp.");
                return;
            }

            // Lay ds Dich vu canh bao
            List<ModDichVuCanhBaoEntity> dvs = ModDichVuCanhBaoService.Instance.CreateQuery()
                .Where(o => o.Activity == true)
                .ToList();

            if (dvs == null)
            {
                Console.WriteLine("INFO: Khong co dich vu canh bao nao.");
                Console.WriteLine("===== Ket thuc chuong trinh =====");
                Logger.Info($"Khong co dich vu canh bao nao.");
                return;
            }

            // Lay template
            ModEmailTemplateEntity emailTemp = ModEmailTemplateService.Instance.CreateQuery().Where(o => o.Activity == true && o.Code == "Type2").ToSingle();
            if (emailTemp == null)
            {
                Console.WriteLine("FAILED: Khong co Email template.");
                Console.WriteLine("===== Ket thuc chuong trinh =====");
                Logger.Error($"Khong co Email template.");
                return;
            }

            // Duyet qua cac ban ghi dv canh bao va thuc hien gui mail tuong ung
            foreach (ModDichVuCanhBaoEntity dv in dvs)
            {
                // Lay log gui mail
                string incidentIds = string.Empty;
                ModSendMailLogsEntity sendMailLog = ModSendMailLogsService.Instance.CreateQuery().Where(o => o.Activity == true && o.DichVuCanhBaoID == dv.ID).OrderByDesc(o => o.Publish).ToSingle();
                if (sendMailLog != null)
                {
                    // Neu dich vu canh bao da gui mail trong ngay hom nay roi thi khong thuc hien gui mail nua
                    if (sendMailLog.Publish.Date == dateNow.Date)
                    {
                        continue;
                    }
                    incidentIds = sendMailLog.IncidentIDs.Trim(',');
                }

                incidents = ModIncidentService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.Resolve == false)
                    .WhereIn(incidentIds != "", o => o.ID, incidentIds)
                    .ToList();

                if (incidents == null) continue;

                // Lay chu ky gui mail
                chuKyGuiMail = WebMenuService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.ID == dv.MenuID)
                    .ToSingle();
                if (chuKyGuiMail == null)
                {
                    Console.WriteLine("WARN: Dich vu canh bao co ID = " + dv.ID + " khong co chu ky gui mail.");
                    Logger.Warn($"Dich vu canh bao co ID = {dv.ID} khong co chu ky gui mail.");
                    continue;
                }

                allowSend = false;
                subtract = dv.Time.Subtract(dateNow.TimeOfDay);
                switch (chuKyGuiMail.Code)
                {
                    case "Nam":
                        if (dateNow.Day.ToString() == "1" && dateNow.Month.ToString() == "1")
                        {
                            if (subtract.Hours == 0 && subtract.Minutes <= 5)
                            {
                                allowSend = true;
                            }
                        }
                        break;
                    case "Quy":
                        if (dateNow.Day.ToString() == "1" && dateNow.Month.ToString() == "4"
                            || dateNow.Day.ToString() == "1" && dateNow.Month.ToString() == "7"
                            || dateNow.Day.ToString() == "1" && dateNow.Month.ToString() == "10"
                            || dateNow.Day.ToString() == "1" && dateNow.Month.ToString() == "1")
                        {
                            if (subtract.Hours == 0 && subtract.Minutes <= 5)
                            {
                                allowSend = true;
                            }
                        }
                        break;
                    case "Thang":
                        if (dateNow.Day.ToString() == "1")
                        {
                            if (subtract.Hours == 0 && subtract.Minutes <= 5)
                            {
                                allowSend = true;
                            }
                        }
                        break;
                    case "Tuan":
                        ngayDauTuan = GetFirstDayOfWeek(dateNow);
                        if (ngayDauTuan == dateNow)
                        {
                            if (subtract.Hours == 0 && subtract.Minutes <= 5)
                            {
                                allowSend = true;
                            }
                        }
                        break;
                    case "Ngay":
                        if (subtract.Hours == 0 && subtract.Minutes <= 5)
                        {
                            allowSend = true;
                        }
                        break;
                    default:
                        allowSend = false;
                        break;
                }

                if (allowSend == false)
                {
                    continue;
                }

                try
                {
                    if (incidents != null && incidents.Count > 0)
                    {
                        int countSuCo = incidents.Count;
                        for (int i = 0; i < countSuCo; i++)
                        {
                            menuIncident = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "Incident" && o.ID == incidents[i].MenuID).ToSingle();
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
                            //sSuCo += "<br />&nbsp;&nbsp;&nbsp;&nbsp;" + incidents[i].Path + "<br />";
                        }
                    }

                    emailEntity = new EmailEntity
                    {
                        To = dv.ToEmails,
                        Cc = string.IsNullOrEmpty(dv.CcEmails) ? "tnchung@vncert.vn" : dv.CcEmails,
                        Subject = string.Format(emailTemp.Subject, dv.Name),
                        Body = string.Format(emailTemp.Content, dv.Name, s2 + (!string.IsNullOrEmpty(s3) ? ", " + s3 : "")),
                        Attach = Export(dv, incidents, "Word")
                    };

                    // Goi ham send mail
                    Console.WriteLine("INFO: Thuc hien gui mail...");
                    string sendResult = Mail.SendMailUseSMTP(emailEntity.To, emailEntity.Cc, emailEntity.Subject, emailEntity.Body, emailEntity.Attach);
                    Console.Write("INFO: Ket qua gui mail:\n" + sendResult);
                    Logger.Info($"Ket qua gui mail: {sendResult}");

                    // Ghi lai log gui mail
                    ModSendMailLogsEntity logEntity = new ModSendMailLogsEntity()
                    {
                        DichVuCanhBaoID = dv.ID,
                        EmailTo = emailEntity.To,
                        EmailCc = emailEntity.Cc,
                        Subject = emailEntity.Subject,
                        Body = emailEntity.Body,
                        IncidentIDs = incidentIds + "," + string.Join(",", incidents.Select(o => o.ID).ToArray()),
                        SendSuccess = string.IsNullOrEmpty(sendResult) ? true : false,
                        Publish = DateTime.Now,
                        Activity = true
                    };
                    ModSendMailLogsService.Instance.Save(logEntity);
                }
                catch (Exception ex)
                {
                    Logger.Error($"Failed: {ex.Message}\n {ex.StackTrace}");
                    Console.WriteLine("Exception: " + ex.Message);
                }

            }

        }

        /// <summary>
        /// Returns the first day of the week that the specified
        /// date is in using the current culture. 
        /// </summary>
        public static DateTime GetFirstDayOfWeek(DateTime dayInWeek)
        {
            CultureInfo defaultCultureInfo = CultureInfo.CurrentCulture;
            return GetFirstDayOfWeek(dayInWeek, defaultCultureInfo);
        }

        /// <summary>
        /// Returns the first day of the week that the specified date 
        /// is in. 
        /// </summary>
        public static DateTime GetFirstDayOfWeek(DateTime dayInWeek, CultureInfo cultureInfo)
        {
            DayOfWeek firstDay = cultureInfo.DateTimeFormat.FirstDayOfWeek;
            DateTime firstDayInWeek = dayInWeek.Date;
            while (firstDayInWeek.DayOfWeek != firstDay)
                firstDayInWeek = firstDayInWeek.AddDays(-1);

            return firstDayInWeek;
        }

        private static string Export(ModDichVuCanhBaoEntity dv, List<ModIncidentEntity> incidents, string type)
        {
            string result = string.Empty;
            try
            {
                string domain = ConfigurationManager.AppSettings.Get("Domain");
                string tempFolder = ConfigurationManager.AppSettings.Get("TempFolder");
                string exportTemp = ConfigurationManager.AppSettings.Get("ExportTemp");
                string export = ConfigurationManager.AppSettings.Get("Export");
                string exportUrl = ConfigurationManager.AppSettings.Get("ExportUrl");
                string fileName = string.Empty;
                DateTime dateNow = DateTime.Now;
                int tongSuCo = incidents.Count;
                string exportFileName = ""; // "yyyymmdd_XXX_Report.pdf";
                exportFileName = string.Format("{0:yyyyMMdd}", dateNow) + "_" + Data.GetCode(dv.Name) + "_Report.pdf";

                if (string.IsNullOrEmpty(tempFolder))
                {
                    Console.WriteLine("ERROR: Ban chua cau hinh cho key TempFolder.");
                    Console.WriteLine("===== Ket thuc chuong trinh =====");
                    Logger.Error($"Ban chua cau hinh cho key TempFolder.");
                    return "";
                }
                if (string.IsNullOrEmpty(export))
                {
                    Console.WriteLine("ERROR: Ban chua cau hinh cho key Export.");
                    Console.WriteLine("===== Ket thuc chuong trinh =====");
                    Logger.Error($"Ban chua cau hinh cho key Export.");
                    return "";
                }
                if (string.IsNullOrEmpty(exportTemp))
                {
                    Console.WriteLine("ERROR: Ban chua cau hinh cho key ExportTemp.");
                    Console.WriteLine("===== Ket thuc chuong trinh =====");
                    Logger.Error($"Ban chua cau hinh cho key ExportTemp.");
                    return "";
                }

                // Xoa file cu
                CleanUpTemporaryFiles(exportTemp);

                #region Word
                if (type == "Word")
                {
                    Document doc = new Document(tempFolder + "DanhSachSuCo.doc");

                    doc.MailMerge.Execute(
                        new string[] { "Field1",
                                    "Field2",
                                    "Field3",
                                    "Field4",
                                    "Field5",
                                    "Field6",
                                    "Field7",
                                    "Field8"
                        },
                        new object[] { "",
                                    string.Format("{0:dd/MM/yyyy}", dateNow),
                                    string.Format("{0:dd/MM/yyyy HH:mm:ss}", dateNow),
                                    "Trung tâm VNCERT (ir@vncert.vn)",
                                    dv.Name,
                                    tongSuCo,
                                    domain + "/" + exportUrl + exportFileName,
                                    "1"
                        });

                    //Grid
                    DataTable dt = new DataTable("dataTable");
                    dt.Columns.Add("Field9");
                    dt.Columns.Add("Field10");
                    dt.Columns.Add("Field11");
                    dt.Columns.Add("Field12");
                    dt.Columns.Add("Field13");
                    dt.Columns.Add("Field14");
                    dt.Columns.Add("Field15");
                    dt.Columns.Add("Field16");
                    dt.Columns.Add("Field17");
                    dt.Columns.Add("Field18");
                    dt.Columns.Add("Field19");
                    dt.Columns.Add("Field20");
                    int _countSTT = 0;
                    foreach (ModIncidentEntity incident in incidents)
                    {
                        _countSTT += 1;
                        dt.Rows.Add(new object[]
                                    {
                                        _countSTT,
                                        incident.Timestamp,
                                        incident.IP,
                                        incident.ASN,
                                        incident.Url,
                                        incident.MalwareName,
                                        incident.SrcPort,
                                        incident.Destinationport,
                                        incident.HostName,
                                        incident.Source,
                                        incident.AttackOn,
                                        incident.HandShake
                                    });
                    }
                    DataSet dataSet = new DataSet();
                    dataSet.Tables.Add(dt);
                    doc.MailMerge.ExecuteWithRegions(dataSet);

                    fileName = "DanhSachSuCo.doc";
                    doc.Save(exportTemp + fileName);

                    doc = new Document(exportTemp + fileName);
                    doc.Save(export + exportFileName, SaveFormat.Pdf);
                    result = export + exportFileName;
                }
                #endregion

                return result;
            }
            catch (Exception ex)
            {
                Logger.Error($"Failed: {ex.Message}\n {ex.StackTrace}");
                Console.WriteLine("Exception: " + ex.Message);
                return "";
            }
        }

        #region Export use xslt format
        public static void Export()
        {
            try
            {
                var KeHoach02 = new List<string>();
                var FileName = "yyyymmdd_XXX_Report";

                var p = CreateFile(KeHoach02, @"~/Manages/xslt/" + FileName + ".xslt", FileName + ".doc");
            }
            catch (Exception ex)
            {
                Logger.Error($"Failed: {ex.Message}\n {ex.StackTrace}");
                Console.WriteLine("Exception: " + ex.Message);
            }
        }

        public static string CreateFile(object ds, string XSLTFilePath, string fileName)
        {
            string TempFolder = HttpContext.Current.Server.MapPath(@"~/ExportTemp/");
            CleanUpTemporaryFiles(TempFolder);

            var doc = ToXml(ds);
            // doc.Save(@"d:\demo.xml");
            string path = HttpContext.Current.Server.MapPath(XSLTFilePath);
            var strHTML = ToHTML(doc, path, new XsltArgumentList());

            string p = DownLoadHelper.Save(TempFolder + fileName, strHTML);
            p = p.Replace(TempFolder, "");
            return p;
        }

        public static System.Xml.Linq.XElement ToXml(object obj)
        {
            try
            {
                System.Xml.Serialization.XmlSerializer xmlSerializer = new System.Xml.Serialization.XmlSerializer(obj.GetType());
                using (System.IO.MemoryStream xmlStream = new System.IO.MemoryStream())
                {
                    xmlSerializer.Serialize(xmlStream, obj);
                    xmlStream.Position = 0;
                    System.Xml.Linq.XElement doc = System.Xml.Linq.XElement.Load(xmlStream);
                    return doc;
                }
            }
            catch (Exception) { throw; }
        }

        public static string ToHTML(XElement InputXMLDocument, string XSLTFilePath, XsltArgumentList XSLTArgs)
        {
            try
            {
                System.IO.StringWriter sw = new System.IO.StringWriter();
                XslCompiledTransform xslTrans = new XslCompiledTransform();
                xslTrans.Load(XSLTFilePath);
                xslTrans.Transform(InputXMLDocument.CreateNavigator(), XSLTArgs, sw);
                return sw.ToString();
            }
            catch (Exception) { throw; }
        }

        /// <summary>
        /// Xoa file trong folder dua vao lan cuoi truy cap
        /// </summary>
        /// <param name="TempFolder"></param>
        /// <param name="minutes"></param>
        public static void CleanUpTemporaryFiles(string TempFolder, int minutes = 0)
        {
            string strFile = null;
            try
            {
                if (TempFolder != HttpContext.Current.Server.MapPath(HttpContext.Current.Request.ApplicationPath))
                {
                    foreach (var dir in System.IO.Directory.GetDirectories(TempFolder))
                    {
                        CleanUpTemporaryFiles(dir, minutes);
                        System.IO.Directory.Delete(dir);
                    }

                    foreach (string strFile_loopVariable in System.IO.Directory.GetFiles(TempFolder))
                    {
                        strFile = strFile_loopVariable;
                        if (System.IO.File.GetLastAccessTime(strFile).AddMinutes(minutes) < DateTime.Now)
                        {
                            System.IO.File.Delete(strFile);
                        }
                    }
                }
            }
            catch { }
        }
        #endregion Export use xslt format

    }

    public class DownLoadHelper
    {
        public static string Save(string path, string Html)
        {
            FileStream fstream = default(FileStream);
            StreamWriter wstream = default(StreamWriter);
            try
            {
                fstream = new FileStream(path, FileMode.Create);
                wstream = new StreamWriter(fstream);
                //  wstream.Write(path.LastIndexOf(".doc") != -1 ? Html = System.Web.HttpUtility.HtmlDecode(Html) : Html);
                wstream.Write(System.Web.HttpUtility.HtmlDecode(Html));
                wstream.Flush();
                wstream.Close();
                return path;
            }
            catch (Exception) { return string.Empty; }
            finally
            {
                if (wstream != null)
                {
                    wstream.Close(); wstream = null;
                }
                if ((fstream != null))
                {
                    fstream.Close(); fstream = null;
                }
            }
        }
    }
}
