using System;
using Ionic.Zip;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.Controllers
{
    public class MGopYController : Controller
    {

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 10;

        public void ActionIndex(MGopYModel model)
        {
            var dbQuery = ModGopYService.Instance.CreateQuery()
                            .Where(o => o.Activity == true)
                            .OrderByDesc(o => o.Order)
                            .Take(PageSize)
                            .Skip(PageSize * model.Page);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            model.PageSize = PageSize;
            ViewBag.Model = model;
        }

        public void ActionDetail(int id)
        {
            var entity = ModGopYService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.ID == id)
                            .ToSingle();

            if (entity != null)
            {
                ViewBag.Other = ModGopYService.Instance.CreateQuery()
                                        .Where(o => o.Activity == true)
                                        .Where(o => o.Order < entity.Order)
                                        .OrderByDesc(o => o.Order)
                                        .Take(PageSize)
                                        .ToList();

                ViewBag.Data = entity;
                SetObject["view.Meta"] = entity;
            }
            else
            {
                ViewPage.Error404();
            }
        }

        public void ActionAddGopY(ModGopYEntity entity)
        {
            if (string.IsNullOrEmpty(entity.Name))
                ViewPage.Message.ListMessage.Add("{RS:Web_FBE_Name}.");

            if (string.IsNullOrEmpty(entity.Email))
                ViewPage.Message.ListMessage.Add("Nhập email");
            else if (Global.Utils.GetEmailAddress(entity.Email.Trim()) == string.Empty)
                ViewPage.Message.ListMessage.Add("Định dạng email không chính xác");

            if (string.IsNullOrEmpty(entity.Title))
                ViewPage.Message.ListMessage.Add("{RS:Web_FBE_Title}.");

            if (string.IsNullOrEmpty(entity.Content))
                ViewPage.Message.ListMessage.Add("{RS:Web_FBE_Content}.");

            //hien thi thong bao loi
            if (ViewPage.Message.ListMessage.Count > 0)
            {
                string message = @"{RS:Web_FBE_Mess}: \r\n";

                for (int i = 0; i < ViewPage.Message.ListMessage.Count; i++)
                    message += @"\r\n + " + ViewPage.Message.ListMessage[i];

                ViewPage.Alert(message);
            }
            else
            {
                //return;
                entity.ID = 0;
                entity.IP = HL.Core.Web.HttpRequest.IP;
                entity.Published = DateTime.Now;

                string filePath = "";
                string[] fileTmp;
                if (!string.IsNullOrEmpty(entity.Files))
                {
                    DateTime d = DateTime.Now;
                    string sDate = d.Year.ToString() + d.Month.ToString() + d.Day.ToString() + "_" + d.Hour.ToString() + d.Minute.ToString() + d.Second.ToString();
                    fileTmp = entity.Files.Split('|');
                    int c = fileTmp.Length;
                    for (int i = 0; i < c; i++)
                    {
                        var sbase64 = fileTmp[i].Split(';');
                        filePath = AppDomain.CurrentDomain.BaseDirectory + "/Data/upload/files/GopY/" + entity.DuThaoID + "/" + entity.Email.Replace("@", "_") + "/" + sDate;
                        HL.Lib.Global.File.Base64ToFile(sbase64[1].Replace("base64,", ""), filePath, sbase64[2]);
                        entity.Files = "/Data/upload/files/GopY/" + entity.DuThaoID + "/" + entity.Email.Replace("@", "_") + "/" + sDate + "/" + sbase64[2];
                    }
                    if (c > 1)
                    {
                        using (ZipFile zip = new ZipFile())
                        {
                            for (int i = 0; i < c; i++)
                            {
                                var sbase64 = fileTmp[i].Split(';');
                                filePath = AppDomain.CurrentDomain.BaseDirectory + "/Data/upload/files/GopY/" + entity.DuThaoID + "/" + entity.Email.Replace("@", "_") + "/" + sDate + "/" + sbase64[2];

                                zip.AddFile(filePath, "files");
                            }
                            zip.Save(AppDomain.CurrentDomain.BaseDirectory + @"\Data\upload\files\GopY\" + entity.DuThaoID + @"\" + entity.Email.Replace("@", "_") + @"\" + sDate + @"\" + entity.Email.Replace("@", "_") + "_" + sDate + ".zip");
                            entity.Files = "/Data/upload/files/GopY/" + entity.DuThaoID + "/" + entity.Email.Replace("@", "_") + "/" + sDate + "/" + entity.Email.Replace("@", "_") + "_" + sDate + ".zip";

                            for (int i = 0; i < c; i++)
                            {
                                var sbase64 = fileTmp[i].Split(';');
                                File.Delete(AppDomain.CurrentDomain.BaseDirectory + "/Data/upload/files/GopY/" + entity.DuThaoID + "/" + entity.Email.Replace("@", "_") + "/" + sDate + "/" + sbase64[2]);
                            }
                        }
                    }
                }

                ModGopYService.Instance.Save(entity);

                // xoa trang
                entity = new ModGopYEntity();

                ViewPage.Alert("Bạn đã gửi góp ý thành công! Góp ý của bạn sẽ phải được xem xét, kiểm duyệt trong thời gian sớm nhất.");
            }

            ViewBag.Data = entity;
        }
    }

    public class MGopYModel
    {
        private int _Page = 0;
        public int Page
        {
            get { return _Page; }
            set { _Page = value - 1; }
        }

        public int PageSize { get; set; }
        public int TotalRecord { get; set; }
    }
}
