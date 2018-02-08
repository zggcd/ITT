using HL.Lib.Models;
using System;
using System.Collections.Generic;

namespace HL.Website.Tools
{
    public partial class Ajax : System.Web.UI.Page
    {
        public string sHTML = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.ContentType = "text/xml";
            string cmd = HL.Core.Web.HttpQueryString.GetValue("cmd").ToString();

            if (cmd == "sendContact")
            {
                string name = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("name")).Trim();
                string email = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("email")).Trim();
                string phone = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("phone")).Trim();
                string title = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("title")).Trim();
                string content = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("content")).Trim();

                if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(phone) && !string.IsNullOrEmpty(title) && !string.IsNullOrEmpty(content))
                {
                    try
                    {
                        ModFeedbackEntity entity = new ModFeedbackEntity()
                        {
                            Name = name,
                            Email = email,
                            Phone = phone,
                            Mobile = phone,
                            Title = title,
                            Content = content,
                            IP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"],
                            Created = DateTime.Now
                        };
                        ModFeedbackService.Instance.Save(entity);
                        sHTML = "Gửi liên hệ thành công! Cám ơn bạn rất nhiều.<br />Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất!";
                    }
                    catch (Exception ex)
                    {
                        sHTML = "";
                    }
                }
            }

        }
    }
}
