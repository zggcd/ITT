using System;
using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.Controllers
{
    public class MFeedbackController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Tin bài")]
        public int NewsID = 0;

        public void ActionIndex()
        {
            ViewBag.Detail = ModNewsService.Instance.CreateQuery()
                .Where(o => o.ID == NewsID)
                .ToSingle();
        }

        public void ActionAddPOST(ModFeedbackEntity entity)
        {
            if (entity.Title.Trim() == string.Empty)
                ViewPage.Message.ListMessage.Add("{RS:Web_FBE_Title}.");

            if (entity.Content.Trim() == string.Empty)
                ViewPage.Message.ListMessage.Add("{RS:Web_FBE_Content}.");

            if (entity.Name.Trim() == string.Empty)
                ViewPage.Message.ListMessage.Add("{RS:Web_FBE_Name}.");

            if (entity.Phone.Trim() == string.Empty)
                ViewPage.Message.ListMessage.Add("{RS:Web_FBE_Phone}.");

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
                entity.ID = 0;
                entity.IP = HL.Core.Web.HttpRequest.IP;
                entity.Created = DateTime.Now;

                ModFeedbackService.Instance.Save(entity);

                // xoa trang
                entity = new ModFeedbackEntity();

                ViewPage.Alert("{RS:Web_FB_SuccessMess}");
            }

            ViewBag.Data = entity;
        }
    }
}
