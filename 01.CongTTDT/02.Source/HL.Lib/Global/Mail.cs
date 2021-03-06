using HL.Lib.Models;
using System;
using System.Net;
using System.Net.Mail;

namespace HL.Lib.Global
{
    public class Mail
    {
        public static void SendWebMail(string to, string from, string name, string subject, string body)
        {
            System.Web.Mail.MailMessage myMail = new System.Web.Mail.MailMessage();
            myMail.To = to;
            myMail.From = "\"" + name + "\" <" + from + ">";
            myMail.Subject = subject;
            myMail.BodyFormat = System.Web.Mail.MailFormat.Html;
            myMail.BodyEncoding = System.Text.Encoding.UTF8;

            myMail.Body = body;
            try
            {
                System.Web.Mail.SmtpMail.Send(myMail);
            }
            catch (Exception ex)
            {
                HL.Lib.Global.Error.Write("SendWebMail", ex);
            }
        }

        private static void SendWebMail(string sHost,
            int nPort,
            string sUserName,
            string sPassword,
            string sFromName,
            string sFromEmail,
            string sToEmail,
            string sHeader,
            string sMessage,
            bool fSSL)
        {
            try
            {
                if (sFromName == "")
                    sFromName = sFromEmail;

                System.Web.Mail.MailMessage Mail = new System.Web.Mail.MailMessage();
                Mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpserver"] = sHost;
                Mail.Fields["http://schemas.microsoft.com/cdo/configuration/sendusing"] = 2;
                Mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpserverport"] = nPort.ToString();
                if (fSSL) Mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpusessl"] = "true";

                if (sUserName.Length == 0)
                {

                }
                else
                {
                    Mail.Fields["http://schemas.microsoft.com/cdo/configuration/smtpauthenticate"] = 1;
                    Mail.Fields["http://schemas.microsoft.com/cdo/configuration/sendusername"] = sUserName;
                    Mail.Fields["http://schemas.microsoft.com/cdo/configuration/sendpassword"] = sPassword;
                }

                Mail.To = sToEmail;
                Mail.From = "\"" + sFromName + "\" <" + sFromEmail + ">";
                Mail.Subject = sHeader;
                Mail.Body = sMessage;
                Mail.BodyFormat = System.Web.Mail.MailFormat.Html;
                Mail.BodyEncoding = System.Text.Encoding.UTF8;

                System.Web.Mail.SmtpMail.SmtpServer = sHost;
                System.Web.Mail.SmtpMail.Send(Mail);
            }
            catch (Exception ex)
            {
                HL.Lib.Global.Error.Write("SendWebMail", ex);
            }
        }

        public static void SendNetMail(string to, string from, string name, string subject, string body)
        {
            try
            {
                System.Net.Mail.MailMessage myMail = new System.Net.Mail.MailMessage();
                myMail.From = new System.Net.Mail.MailAddress(from, name);
                myMail.To.Add(to);
                myMail.Subject = subject;
                myMail.IsBodyHtml = true;
                myMail.Body = body;
                myMail.BodyEncoding = System.Text.Encoding.UTF8;

                System.Net.Mail.SmtpClient smtp = new System.Net.Mail.SmtpClient();
                smtp.Send(myMail);
            }
            catch (Exception ex)
            {
                HL.Lib.Global.Error.Write("SendNetMail", ex);
            }
        }

        public static void SendMail(string to, string from, string name, string subject, string body)
        {
            string HostName = HL.Core.Global.Config.GetValue("Mod.SmtpServer").ToString().Trim();
            if (HostName != string.Empty)
            {
                int Port = HL.Core.Global.Config.GetValue("Mod.SmtpPort").ToInt();
                string UserName = HL.Core.Global.Config.GetValue("Mod.SmtpUser").ToString();
                string UserPass = HL.Core.Global.Config.GetValue("Mod.SmtpPass").ToString();
                bool SSL = HL.Core.Global.Config.GetValue("Mod.SmtpSSL").ToBool();

                if (Port < 1)
                    Port = 25;

                SendWebMail(HostName, Port, UserName, UserPass, name, from, to, subject, body, SSL);
            }
            else
            {
                bool IsByNet = HL.Core.Global.Config.GetValue("Mod.MailByNet").ToBool();

                if (!IsByNet)
                    SendWebMail(to, from, name, subject, body);
                else
                    SendNetMail(to, from, name, subject, body);
            }
        }

        public static string SendMailUseSMTP_2(string To, string Subject, string Content, string Attack)
        {
            string rs = "";
            var objMail = ModConfigSendMailService.Instance.CreateQuery().Where(o => o.Activity == true && o.MailType == 137).ToSingle();
            if (objMail != null)
            {
                try
                {
                    var provider = objMail.SmtpServer;
                    var from = objMail.SmtpUser;
                    var pass = objMail.SmtpPass;
                    var port = objMail.SmtpPort;
                    var ssl = objMail.SmtpSSL;

                    //xac thuc tai khoan gmail
                    var loginInfo = new NetworkCredential(@from, pass);
                    //tao noi dung mail
                    var mail = new MailMessage { From = new MailAddress(@from) };
                    var arrTo = To.Split(',');
                    if (arrTo.Length > 0)
                    {
                        foreach (string t in arrTo)
                            if (Utils.GetEmailAddress(t) != string.Empty)
                                mail.To.Add(new MailAddress(t.Trim()));
                    }
                    else
                        mail.To.Add(new MailAddress(To.Trim()));
                    mail.Subject = Subject;
                    mail.Body = Content;
                    mail.IsBodyHtml = true;
                    //dinh kem
                    if (!string.IsNullOrEmpty(Attack) && System.IO.File.Exists(Attack))
                    {
                        var attachment = new System.Net.Mail.Attachment(Attack);
                        mail.Attachments.Add(attachment);
                    }
                    //gui
                    var client = new SmtpClient(provider)
                    {
                        Port = port,
                        DeliveryMethod = SmtpDeliveryMethod.Network,
                        EnableSsl = ssl,
                        UseDefaultCredentials = false,
                        Credentials = loginInfo
                    };
                    client.Send(mail);
                }
                catch (Exception ex)
                {
                    rs += "Error!!!";
                    //Error.Write(ex);
                }
            }
            return rs;
        }

        public static string SendMailUseSMTP(string To, string Cc, string Subject, string Content, string Attack)
        {
            string rs = "";
            var objMail = ModConfigSendMailService.Instance.CreateQuery().Where(o => o.Activity == true).ToSingle();
            if (objMail != null)
            {
                try
                {
                    var provider = objMail.SmtpServer;
                    var from = objMail.SmtpUser;
                    var pass = objMail.SmtpPass;
                    var port = objMail.SmtpPort;
                    var ssl = objMail.SmtpSSL;

                    //xac thuc tai khoan gmail
                    var loginInfo = new NetworkCredential(@from, pass);
                    //tao noi dung mail
                    var mail = new MailMessage { From = new MailAddress(@from) };
                    var arrTo = To.Split(',');
                    if (arrTo.Length > 0)
                    {
                        foreach (string t in arrTo)
                            if (Utils.GetEmailAddress(t) != string.Empty)
                                mail.To.Add(new MailAddress(t.Trim()));
                    }
                    else
                        mail.To.Add(new MailAddress(To.Trim()));
                    var arrCc = Cc.Split(',');
                    if (arrCc.Length > 0)
                    {
                        foreach (string t in arrCc)
                            if (Utils.GetEmailAddress(t) != string.Empty)
                                mail.CC.Add(new MailAddress(t.Trim()));
                    }
                    else
                        mail.CC.Add(new MailAddress(Cc.Trim()));
                    mail.Subject = Subject;
                    mail.Body = Content;
                    mail.IsBodyHtml = true;
                    //dinh kem
                    if (!string.IsNullOrEmpty(Attack) && System.IO.File.Exists(Attack))
                    {
                        var attachment = new System.Net.Mail.Attachment(Attack);
                        mail.Attachments.Add(attachment);
                    }
                    //gui
                    var client = new SmtpClient(provider)
                    {
                        Port = port,
                        DeliveryMethod = SmtpDeliveryMethod.Network,
                        EnableSsl = ssl,
                        UseDefaultCredentials = false,
                        Credentials = loginInfo
                    };
                    client.Send(mail);
                }
                catch (Exception ex)
                {
                    rs += "Error!!!";
                    //Error.Write(ex);
                }
            }
            return rs;
        }
    }
}
