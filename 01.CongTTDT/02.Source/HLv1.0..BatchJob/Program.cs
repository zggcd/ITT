using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Globalization;

using NLog;
using HL.Lib.CPControllers;
using HL.Lib.Models;
using HL.Lib.Global;

namespace KPMG.PageUpMiddleware.BatchJob
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
            ModEmailTemplateEntity emailTemp = ModEmailTemplateService.Instance.CreateQuery().Where(o => o.Activity == true && o.Code == "Type1").ToSingle();
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
                    if (sendMailLog.Publish == dateNow)
                    {
                        continue;
                    }
                    incidentIds = sendMailLog.IncidentIDs;
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
                            sSuCo += "<br />&nbsp;&nbsp;&nbsp;&nbsp;" + incidents[i].Path + "<br />";
                        }
                    }

                    emailEntity = new EmailEntity();
                    emailEntity.To = dv.ToEmails;
                    emailEntity.Cc = string.IsNullOrEmpty(dv.CcEmails) ? "tnchung@vncert.vn" : dv.CcEmails;
                    emailEntity.Subject = string.Format(emailTemp.Subject, dv.Name);
                    emailEntity.Body = string.Format(emailTemp.Content, isp, sSuCo, s2, (!string.IsNullOrEmpty(s3) ? ", và các sự cố " + s3 : ""), s2 + (!string.IsNullOrEmpty(s3) ? ", " + s3 : ""));

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

    }
}
