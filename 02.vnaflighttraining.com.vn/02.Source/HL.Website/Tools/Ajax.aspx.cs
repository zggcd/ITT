using HL.Lib.Global;
using HL.Lib.Models;
using HL.Lib.MVC;
using System;

namespace HL.Website.Tools
{
    public partial class Ajax : System.Web.UI.Page
    {
        public string sHTML = string.Empty;
        public string safeCode = string.Empty;

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
            else if (cmd == "refresh")
            {
                safeCode = HL.Lib.Global.Utils.GetRandString();
            }
            else if (cmd == "ressetPass")
            {
                int iduser = HL.Core.Global.Convert.ToInt(HL.Core.Web.HttpQueryString.GetValue("iduser"), 0);
                string pass = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("pass"));

                var objUser = CPUserService.Instance.CreateQuery().Where(o => o.ID == iduser).ToSingle();
                if (objUser != null)
                {
                    objUser.Password = HL.Lib.Global.Security.GetPass(pass);
                    CPUserService.Instance.Save(objUser);
                }
            }
            else if (cmd == "checkdn")
            {
                string LoginName = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("LoginName"));
                string pass = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("pass"));

                if (CPLogin.CheckLogin3(LoginName.Trim(), pass))
                {
                    sHTML = "1";
                }
                else sHTML = "0";
            }
            else if (cmd == "dx")
            {
                if (HL.Lib.Global.CPLogin.IsLogin())
                {
                    CPLogin.Logout();
                    sHTML = "1";
                }
                else sHTML = "0";
            }
            else if (cmd == "checkdk")
            {
                //tentl, hoten, tinhthanh, email, namsinh, gioitinh, dienthoai, lydo, mk, golaimk, mabaove, chapnhannoiquy
                string tentl = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("tentl"));
                string hoten = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("hoten"));
                string tinhthanh = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("tinhthanh"));
                string email = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("email"));
                int namsinh = HL.Core.Global.Convert.ToInt(HL.Core.Web.HttpQueryString.GetValue("namsinh"), 0);
                string gioitinh = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("gioitinh"));
                string dienthoai = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("dienthoai"));
                string lydo = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("lydo"));
                string mk = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("mk"));
                string golaimk = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("golaimk"));
                string mabaove = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("mabaove"));
                string sVY = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("sVY"));
                string chapnhannoiquy =
                    HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("chapnhannoiquy"));
                //string sVY = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("sVY"));
                //sVY = HL.Core.Global.CryptoString.Decrypt(sVY).Replace(HttpContext.Current.Request.UserHostAddress + "." + string.Format("yyyy.MM.dd.hh", DateTime.Now) + ".", string.Empty);

                if (string.IsNullOrEmpty(tentl))
                    sHTML = "Bạn chưa nhập tên truy cập";
                else if (CPUserService.Instance.exitsloginname(tentl)) sHTML = "Tên truy cập đã có người sử dụng";
                //else if (string.IsNullOrEmpty(hoten)) sHTML = "Bạn chưa nhập họ tên";
                else if (string.IsNullOrEmpty(mk)) sHTML = "Bạn chưa nhập mật khẩu";
                else if (string.IsNullOrEmpty(golaimk)) sHTML = "Bạn chưa nhập lại mật khẩu";
                else if (mk != golaimk) sHTML = "Mật khẩu nhắc lại không đúng";
                else if (string.IsNullOrEmpty(email)) sHTML = "Bạn chưa nhập địa chỉ Email";
                else if (CPUserService.Instance.exits(email)) sHTML = "Email đã có người sử dụng";
                //else if (namsinh == 0) sHTML = "Bạn chưa chọn năm sinh";
                else if (string.IsNullOrEmpty(dienthoai)) sHTML = "Bạn chưa nhập số điện thoại";
                //else if (string.IsNullOrEmpty(lydo)) sHTML = "Bạn chưa nhập lý do";
                else if (string.IsNullOrEmpty(mabaove.Trim())) sHTML = "Bạn chưa nhập mã bảo vệ";
                else if (sVY.ToLower().Trim() != mabaove.ToLower().Trim())
                    sHTML = "Mã bảo vệ không chính xác";
                //else if (chapnhannoiquy == "0") sHTML = "Bạn chưa chấp nhận nội quy";
                else sHTML = "";
            }
            else if (cmd == "checkaddtt")
            {
                string tentl = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("tentl"));
                string hoten = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("hoten"));
                string email = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("email"));
                string gioitinh = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("gioitinh"));
                string dienthoai = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("dienthoai"));
                string lydo = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("lydo"));

                if (string.IsNullOrEmpty(hoten))
                    sHTML = "Bạn chưa nhập họ tên";
                //else if (string.IsNullOrEmpty(tentl)) sHTML = "Bạn chưa nhập tên thảo luận";
                else if (string.IsNullOrEmpty(email)) sHTML = "Bạn chưa nhập địa chỉ Email";
                else if (string.IsNullOrEmpty(Utils.GetEmailAddress(email))) sHTML = "Địa chỉ Email không hợp lệ";
                //else if (ModCungCapTTService.Instance.exits(email)) sHTML = "Email đã có người sử dụng";
                else if (string.IsNullOrEmpty(dienthoai)) sHTML = "Bạn chưa nhập số điện thoại";
                else sHTML = "";
            }

        }
    }
}
