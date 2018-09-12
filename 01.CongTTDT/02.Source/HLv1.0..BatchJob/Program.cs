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

            // Lay log gui mail
            string incidentIds = string.Empty;
            ModSendMailLogsEntity sendMailLog = ModSendMailLogsService.Instance.CreateQuery().Where(o => o.Activity == true).OrderByDesc(o => o.Publish).ToSingle();
            if (sendMailLog != null)
            {
                incidentIds = sendMailLog.IncidentIDs;
            }

            // Duyet qua cac ban ghi dv canh bao va thuc hien gui mail tuong ung
            WebMenuEntity menuIncident = null;
            string sSuCo = string.Empty, isp = string.Empty, ip = string.Empty;
            string s2 = string.Empty, s3 = string.Empty, s4 = string.Empty, sName = string.Empty;
            foreach (ModDichVuCanhBaoEntity dv in dvs)
            {
                incidents = ModIncidentService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.Resolve == false)
                    .WhereIn(incidentIds != "", o => o.ID, incidentIds)
                    .ToList();

                if (incidents == null) continue;

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
                        EmailTo = emailEntity.To,
                        EmailCc = emailEntity.Cc,
                        Subject = emailEntity.Subject,
                        Body = emailEntity.Body,
                        IncidentIDs = incidentIds + "," + string.Join(",", incidents.Select(o => o.ID).ToArray()),
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

    }
}
