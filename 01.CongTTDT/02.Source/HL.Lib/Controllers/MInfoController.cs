using System;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;
namespace HL.Lib.Controllers
{
    public class MInfoController : Controller
    {
        public void ActionIndex()
        {
            ////if (!CPLogin.IsLogin())
            ////    ViewPage.Response.Redirect("/Thanh-vien/dang-ky.html");
            ViewBag.Data = CPLogin.CurrentUser;
        }
        public void ActionDetail(string endcode)
        {
            string layout = "";
            string ec = endcode.ToLower();
            if (ec == "dang-nhap") layout = "Login";
            else if (ec == "dang-ky") layout = "Register";
            else if (ec == "quen-mat-khau") layout = "ResetPass";
            else if (ec == "thong-tin-ca-nhan") layout = "Info";
            else if (ec == "doi-mat-khau") layout = "ChangePass";
            else if (ec == "them-ho-so-ung-cuu-su-co") layout = "HoSoUCSC";
            else if (ec == "dang-xuat")
            {
                string currUrl = ViewPage.Request.RawUrl;
                CPLogin.Logout();
                ViewPage.Response.Redirect(currUrl);
            }
            RenderView(layout);
        }

        public void ActionRegisterPOST(CPUserEntity entity, MUserModel model)
        {
            if (entity.LoginName.Trim() == string.Empty)
                ViewPage.Message.ListMessage.Add("+ Nhập tên truy cập.");

            //if (entity.Name.Trim() == string.Empty)
            //    ViewPage.Message.ListMessage.Add("Nhập tên.");

            //if (entity.CityID.Trim() == string.Empty)
            //    ViewPage.Message.ListMessage.Add("Chọn Tỉnh/Thành phố.");

            if (Utils.GetEmailAddress(entity.Email) == string.Empty)
                ViewPage.Message.ListMessage.Add("+ Địa chỉ email thiếu hoặc không chính xác.");
            else
            {
                if (CPUserService.Instance.exits(entity.Email)) ViewPage.Message.ListMessage.Add("Địa chỉ email đã được sử dụng.");
            }

            //if (entity.Year < 0)
            //    ViewPage.Message.ListMessage.Add("Chọn năm sinh.");

            if (entity.Phone == string.Empty)
                ViewPage.Message.ListMessage.Add("+ Nhập số điện thoại.");

            //if (entity.Note.Trim() == string.Empty)
            //    ViewPage.Message.ListMessage.Add("Nhập lý do tham gia.");

            if (entity.Password.Trim() == string.Empty)
                ViewPage.Message.ListMessage.Add("+ Nhập mật khẩu.");

            if (model.RePassword.Trim() == string.Empty)
                ViewPage.Message.ListMessage.Add("+ Nhập lại mật khẩu.");
            else if (model.RePassword.Trim() != entity.Password)
                ViewPage.Message.ListMessage.Add("+ Mật khẩu nhắc lại không đúng.");

            //if (entity.Address == string.Empty)
            //    ViewPage.Message.ListMessage.Add("Nhập địa chỉ.");

            //if (model.Agree != 1)
            //    ViewPage.Message.ListMessage.Add("Bạn cần đồng ý điều khoản để trở thành thành viên.");


            if (ViewPage.Message.ListMessage.Count > 0)
            {
                ViewBag.DataRes = entity;
                string s = @"Các thông tin nhập còn thiếu hoặc chưa chính xác: \r\n";
                for (int i = 0; i < ViewPage.Message.ListMessage.Count; i++)
                {
                    s += @"\r\n" + ViewPage.Message.ListMessage[i];
                }
                ViewPage.Alert(s);
            }
            else
            {
                entity.Password = Lib.Global.Security.GetPass(entity.Password.Trim());
                entity.Created = DateTime.Now;
                entity.NgayActive = DateTime.Now;
                entity.Activity = true;
                entity.ClientIP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];

                CPUserService.Instance.Save(entity);
                CPUserRoleService.Instance.Save(new CPUserRoleEntity() { UserID = entity.ID, RoleID = 2 });
                // xoa trang
                entity = new CPUserEntity();

                //ViewPage.Alert("Bạn đã đăng kí thành công! Bạn vui lòng chờ đợi Ban Quản trị chấp thuận. Thân chào."); ViewPage.Navigate("/");
                ViewPage.Alert("Chào mừng bạn đăng ký thành công và đã được kích hoạt"); ViewPage.Navigate("/");
            }
            ViewBag.DataRes = entity;
        }

        public void ActionLogin(MLoginModel model)
        {
            CPUserEntity entity = new CPUserEntity();
            entity.LoginName = model.LoginName;
            entity.Password = model.Password;
            ViewBag.Data = entity;
            //2553: dang ky moi; 2554: chap nhan; 2555: bi khoa; 2556: tu choi; 2557: bannick
            //var user = CPUserService.Instance.GetByEmail(model.Email.Trim());
            //var user = CPUserService.Instance.GetLogin(model.LoginName.Trim(), entity.Password);
            if (CPLogin.CheckLogin1(model.LoginName, model.Password))
            {
                string redirect = HL.Core.Web.HttpQueryString.GetValue("ReturnPath").ToString();
                ViewPage.Response.Redirect(string.IsNullOrEmpty(redirect) ? "/" : redirect);
            }
            else
            {
                ViewBag.Login = model;
                ViewPage.Alert("Đăng nhập không thành công! Tên đăng nhập hoặc mật khẩu không đúng.");
            }

            //if (user.State == 2554)
            //{
            //    if (CPLogin.CheckLogin2(model.Email, model.Password))
            //    {
            //        string redirect = HL.Core.Web.HttpQueryString.GetValue("ReturnPath").ToString();
            //        ViewPage.Response.Redirect(string.IsNullOrEmpty(redirect) ? "/Dang-tin.aspx" : redirect);
            //    }
            //    else
            //    {
            //        ViewBag.Login = model;
            //        ViewPage.Alert("Đăng nhập không thành công! Tên đăng nhập hoặc mật khẩu không đúng.");
            //    }
            //}
            //else if (user.State == 2553)
            //    ViewPage.Alert("Đăng ký thành viên của bạn chưa được chấp thuận. Bạn vui lòng chờ đợi Ban Quản trị chấp thuận.Thân chào.");
            //else if (user.State == 2555)
            //{
            //    var todate = string.Format("{0:dd/MM/yyyy}", user.NgayMoLock);
            //    if (user.NgayMoLock < DateTime.Now)
            //    {
            //        if (CPLogin.CheckLogin2(model.Email, model.Password))
            //        {
            //            user.State = 2554;
            //            user.NgayActive = user.NgayMoLock;
            //            user.SoNgayLock = 0;
            //            user.NgayLock = DateTime.MinValue;
            //            user.NgayMoLock = DateTime.MinValue;
            //            CPUserService.Instance.Save(user);
            //            string redirect = HL.Core.Web.HttpQueryString.GetValue("ReturnPath").ToString();
            //            ViewPage.Response.Redirect(string.IsNullOrEmpty(redirect) ? "/Dang-tin.aspx" : redirect);
            //        }
            //        else
            //        {
            //            ViewBag.Login = model;
            //            ViewPage.Alert("Đăng nhập không thành công! Tên đăng nhập hoặc mật khẩu không đúng.");
            //        }
            //    }
            //    else ViewPage.Alert("Tin post của bạn phạm quy, bạn vui lòng ở ngoài đọc tin cho đến hết ngày " + todate + ". Cần biết thêm chi tiết bạn vui lòng liên lạc với Ban Quản trị qua email: goldonlinesys@gmail.com hoặc điện thoại 0909993960.");
            //}
            //else if (user.State == 2556)
            //{
            //    ViewPage.Alert("Rất tiếc, thông tin đăng kí thành viên của bạn không phù hợp. Nên không được chấp thuận làm thành viên. Bạn vui lòng liên lạc với Ban Quản Trị để được hướng dẫn hoặc biết thêm chi tiết: Địa chỉ email goldonlinesys@gmail.com. Điện thoại: 0909993960.");
            //}
            //else if (user.State == 2557) { }
        }

        public void ActionChangePassPOST(PasswordModel model)
        {
            var obj = CPUserService.Instance.CreateQuery().Where(o => o.ID == CPLogin.UserID).Select(o => new { o.Password, o.ID }).ToSingle();
            if (model.PassCur.Trim() == string.Empty)
                ViewPage.Message.ListMessage.Add("Nhập mật khẩu hiện tại");
            else if (Security.GetPass(model.PassCur.Trim()) != obj.Password)
                ViewPage.Message.ListMessage.Add("Mật khẩu hiện tại không đúng !");

            if (model.PassNew.Trim() == string.Empty)
                ViewPage.Message.ListMessage.Add("Nhập mật khẩu mới");
            else if (model.PassNew.Trim() != model.RePass.Trim())
                ViewPage.Message.ListMessage.Add("Mật khẩu nhắc lại không đúng");

            if (ViewPage.Message.ListMessage.Count > 0)
            {
                string s = @"Các thông tin nhập còn thiếu hoặc sai chính xác \r\n";
                for (int i = 0; i < ViewPage.Message.ListMessage.Count; i++)
                {
                    s += @"\r\n" + ViewPage.Message.ListMessage[i];
                }
                ViewPage.Alert(s);
            }
            else
            {
                obj.Password = Security.GetPass(model.PassNew);
                CPUserService.Instance.Save(obj, o => o.Password);
                ViewPage.Alert("Cập nhật mật khẩu thành công !");
                ViewPage.Navigate("/");
            }
            ViewBag.ChangePass = model;
        }

        public void ActionChangeInfoPOST(CPUserEntity entity)
        {
            string alert = string.Empty;

            //if (entity.Name.Trim() == string.Empty)
            //    ViewPage.Message.ListMessage.Add("+ Nhập tên.");
            string file = Utils.Upload("Avatar", entity.File, "/Data/upload/images/User/" + entity.Email.Replace("@", "_").Trim(), ref alert);

            entity.File = string.IsNullOrEmpty(file) ? entity.File : file;


            if (entity.LoginName.Trim() == string.Empty)
                ViewPage.Message.ListMessage.Add("+ Nhập tên truy cập.");

            //if (entity.CityID.Trim() == string.Empty)
            //    ViewPage.Message.ListMessage.Add("Nhập tên thành phố.");

            if (Utils.GetEmailAddress(entity.Email) == string.Empty)
                ViewPage.Message.ListMessage.Add("+ Địa chỉ email thiếu hoặc không chính xác.");
            else
            {
                var loginName = entity.LoginName.Trim();
                var user = CPUserService.Instance.CreateQuery().Where(o => o.LoginName == loginName).ToSingle();
                if (user.Email.Trim() != entity.Email.Trim() && CPUserService.Instance.exits(entity.Email)) ViewPage.Message.ListMessage.Add("Địa chỉ email đã được sử dụng.");
            }

            //if (entity.Year < 0)
            //    ViewPage.Message.ListMessage.Add("Chọn năm sinh.");

            //if (entity.Note.Trim() == string.Empty)
            //    ViewPage.Message.ListMessage.Add("Nhập lý do tham gia.");

            if (entity.Phone == string.Empty)
                ViewPage.Message.ListMessage.Add("+ Nhập số điện thoại.");

            if (alert != string.Empty)
            {
                ViewPage.Message.ListMessage.Add(alert);
            }
            if (ViewPage.Message.ListMessage.Count > 0)
            {
                string s = @"Thông tin nhập còn thiếu hoặc sai chính xác: \r\n";
                for (int i = 0; i < ViewPage.Message.ListMessage.Count; i++)
                {
                    s += @"\r\n" + ViewPage.Message.ListMessage[i];
                }
                ViewPage.Alert(s);
            }
            else
            {
                entity.ID = CPLogin.UserID;
                CPUserService.Instance.Save(entity, o => new { o.Name, o.Phone, o.Note, o.LoginName, o.Email, o.File, o.Sex, o.Year, o.CityID });
                ViewPage.Alert("Cập nhật thông tin thành công!");
                ViewPage.Navigate(ViewPage.Request.RawUrl);
            }
            ViewBag.Data = entity;
        }
        CPUserEntity entity = null;
        public void ActionRePassPOST(PasswordModel model)
        {
            if (model.Email.Trim() == string.Empty)
                ViewPage.Message.ListMessage.Add("Bạn chưa nhập Email.");
            else if (Utils.GetEmailAddress(model.Email) == string.Empty)
                ViewPage.Message.ListMessage.Add("Định dạng Email không đúng.");
            else
            {
                entity = CPUserService.Instance.CreateQuery()
                    .Where(o => o.Email == model.Email).Select(o => new { o.ID, o.LoginName, o.Phone, o.TempPassword, o.Email }).ToSingle();
                if (entity == null)
                    ViewPage.Message.ListMessage.Add("Email không tồn tại.");
            }
            if (ViewPage.Message.ListMessage.Count > 0)
            {
                string s = @"Các thông tin còn thiếu hoặc sai chính xác \r\n";
                for (int i = 0; i < ViewPage.Message.ListMessage.Count; i++)
                {
                    s += @"\r\n" + ViewPage.Message.ListMessage[i];
                }
                ViewPage.Alert(s);
            }
            else
            {
                string pas = Utils.GetRandString();
                entity.TempPassword = Security.GetPass(pas);
                CPUserService.Instance.Save(entity, o => o.TempPassword);
                string statesendmail = Mail.SendMailUseSMTP_2(entity.Email.Trim(), Global.Setting.Sys_SiteID + " - Thông báo lấy lại mật khẩu", "Mật khẩu mới của bạn là : <b>" + pas + "</b><br />Email đăng nhập : " + entity.Email + "<br /><b><i>+ Lưu ý: Nếu không phải bạn yêu cầu đổi mật khẩu thì hãy bỏ qua thư này và đăng nhập bằng mật khẩu hiện tại.</i></b>", "");

                var objMailTo = ModConfigSendMailService.Instance.CreateQuery().Where(o => o.Activity == true && o.MailType == 137).ToSingle();
                if (objMailTo != null)
                {
                    string sHTML = string.Empty;
                    sHTML += "<p style='text-align: center;'><span style='font-size: 14px;'><strong>Th&ocirc;ng tin th&agrave;nh vi&ecirc;n reset mật khẩu:</strong></span></p>";
                    sHTML += "<table align='center' border='1' cellpadding='2' cellspacing='0' height='114' width='284'><tbody>";
                    sHTML += "<tr><td style='width: 80px;'><strong>ID</strong></td><td>" + entity.ID + "</td></tr>";
                    sHTML += "<tr><td style='width: 80px;'><strong>T&ecirc;n thảo luận</strong></td><td>" + entity.LoginName + "</td></tr>";
                    sHTML += "<tr><td style='width: 80px;'><strong>Email</strong></td><td>" + entity.Email + "</td></tr>";
                    sHTML += "<tr><td style='width: 80px;'><strong>Thời gian</strong></td><td>" + string.Format("{0:dd/MM/yyyy HH:mm}", DateTime.Now) + "</td></tr>";
                    sHTML += "<tr><td style='width: 80px;'><strong>Mật khẩu mới</strong></td><td>" + pas + "</td></tr>";
                    sHTML += "</tbody></table>";
                    Mail.SendMailUseSMTP_2(objMailTo.ToMail, Global.Setting.Sys_SiteID + " - Thông báo lấy lại mật khẩu", sHTML, "");
                }
                var userresetpass = new ModUserResetPassEntity
                {
                    UserID = entity.ID,
                    LoginName = entity.LoginName,
                    Phone = entity.Phone,
                    Email = entity.Email,
                    TimeReset = DateTime.Now,
                    PassReset = pas,
                    StateSend = string.IsNullOrEmpty(statesendmail)
                };
                ModUserResetPassService.Instance.Save(userresetpass);

                ViewPage.Alert("Hệ thống đã gửi lại mật khẩu mới cho bạn, vui lòng kiểm tra hòm thư !");
                ViewPage.Navigate("/");
            }
            ViewBag.ResetPass = model;
        }

        #region Dieu phoi, ung cuu su co ATTT mang
        public void ActionAddHoSoUCSC(ModHSThanhVienUCSCEntity entity, ModDauMoiUCSCEntity entityDm)
        {

        }
        #endregion Dieu phoi, ung cuu su co ATTT mang
    }
    public class MUserModel
    {
        public string ValidCode { get; set; }
        public string safeCode { get; set; }
        public string RePassword { get; set; }
        public int Agree { get; set; }
    }
    public class MLoginModel
    {
        public string LoginName { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
    }
    public class PasswordModel
    {
        public string Email { get; set; }
        public string PassCur { get; set; }
        public string PassNew { get; set; }
        public string RePass { get; set; }
    }
}
