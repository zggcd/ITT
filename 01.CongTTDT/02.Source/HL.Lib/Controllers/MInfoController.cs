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
            else if (ec == "dang-ky-ung-cuu-su-co") layout = "DangKyUCSC";
            else if (ec == "them-bc-ban-dau-su-co")
            {
                layout = "BCBanDauUCSC";
                DateTime dt = DateTime.Now;
                ViewBag.BaoCao = new ModBaoCaoBanDauSuCoEntity()
                {
                    ChiTiet_NgayGioPhatHien = dt,
                    ThoiGianThucHien = dt
                };
            }
            else if (ec == "them-bc-ket-thuc-su-co")
            {
                layout = "BCKetThucUCSC";
                DateTime dt = DateTime.Now;
                ViewBag.BaoCao = new ModBaoCaoKetThucSuCoEntity()
                {
                    NgayBaoCao = dt,
                    NgayGioPhatHien = dt
                };
            }
            else if (ec == "them-bc-tong-hop-su-co") layout = "BCTongHopUCSC";
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
                //entity.Password = HL.Lib.Global.Security.MD5(entity.Password.Trim());
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
        /// <summary>
        /// Them ho so ung cuu su co
        /// </summary>
        /// <param name="entity">HS thanh vien</param>
        /// <param name="entityDm">Dau moi UCSC</param>
        public void ActionAddHoSoUCSC(ModHSThanhVienUCSCEntity entity, ModDauMoiUCSCEntity entityDm)
        {
            ViewBag.HoSo = entity;
            ViewBag.DauMoi = entityDm;

            DateTime date = DateTime.Now;
            string code = "HSUCSC" + ModHSThanhVienUCSCService.Instance.GetMaxID();
            entity.Name = code;
            entity.Code = Data.GetCode(code);
            entity.UserID = Lib.Global.CPLogin.UserID;
            entity.Order = GetMaxOrder_HoSo();
            entity.Published = date;
            entity.Activity = false;
            int id = ModHSThanhVienUCSCService.Instance.Save(entity);

            WebMenuEntity menu = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == "DauMoiUCSC" && o.Code == "Chinh").ToSingle();
            entityDm.HSThanhVienUCSCID = id;
            entityDm.MenuID = menu.ID;
            entityDm.Order = GetMaxOrder_DauMoi();
            entityDm.Published = date;
            entityDm.Activity = true;
            ModDauMoiUCSCService.Instance.Save(entityDm);

            ViewPage.Alert("Tạo mới hồ sơ thành công! Chúng tôi sẽ xem xét và phê duyệt hồ sơ của bạn sớm nhất có thể.");
            ViewPage.Navigate("/vn/Thanh-vien/Ho-so-ung-cuu-su-co.aspx");
        }

        public void ActionAddDangKyUCSC(ModDonDangKyUCSCEntity entity)
        {
            ViewBag.DangKy = entity;

            DateTime date = DateTime.Now;
            string code = "DKUCSC" + ModDonDangKyUCSCService.Instance.GetMaxID();
            entity.Name = code;
            entity.Code = Data.GetCode(code);
            entity.UserID = Lib.Global.CPLogin.UserID;
            entity.Order = GetMaxOrder_DangKy();
            entity.Published = date;
            entity.Activity = false;
            int id = ModDonDangKyUCSCService.Instance.Save(entity);

            ViewPage.Alert("Tạo mới đăng ký thành công! Chúng tôi sẽ xem xét và phê duyệt đăng ký của bạn sớm nhất có thể.");
            ViewPage.Navigate("/vn/Thanh-vien/DS-dang-ky-ung-cuu-su-co.aspx");
        }

        public void ActionAddBCBanDauUCSC(ModBaoCaoBanDauSuCoEntity entity, MInfoMagicModel modelInfo, MAppend append)
        {
            DateTime date = DateTime.Now;
            string ngayGioPhatHien = append.Ngay + " " + append.Gio + ":" + append.Phut;
            string[] arr = append.ThoiGian.Split('/');
            string thoiGianThucHien = "";
            if (arr.Length == 5) thoiGianThucHien = arr[0] + "/" + arr[1] + "/" + arr[2] + " " + arr[3] + ":" + arr[4];
            string code = "BCBDSC" + ModBaoCaoBanDauSuCoService.Instance.GetMaxID();
            entity.Name = code;
            entity.Code = Data.GetCode(code);
            entity.UserID = Lib.Global.CPLogin.UserID;
            if (!string.IsNullOrEmpty(ngayGioPhatHien)) entity.ChiTiet_NgayGioPhatHien = HL.Core.Global.Convert.ToDateTime(ngayGioPhatHien);
            else entity.ChiTiet_NgayGioPhatHien = DateTime.MinValue;
            if (!string.IsNullOrEmpty(thoiGianThucHien)) entity.ThoiGianThucHien = HL.Core.Global.Convert.ToDateTime(thoiGianThucHien);
            else entity.ThoiGianThucHien = DateTime.MinValue;
            entity.Order = GetMaxOrder_BCBanDau();
            entity.Published = date;
            entity.Activity = false;
            int id = ModBaoCaoBanDauSuCoService.Instance.Save(entity);

            //Cach thuc phat hien
            int num = modelInfo.chkCachThuc != null ? modelInfo.chkCachThuc.Length : 0;
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkCachThuc[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                    {
                        BaoCaoBanDauSuCoID = id,
                        Order = GetMaxOrder_InfoMagic(),
                        Published = date,
                        Activity = true
                    };
                    entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                    if (tmp[0] == "1")
                    {
                        int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                        if (modelInfo.txtCachThuc != null && modelInfo.txtCachThuc.Length >= idx)
                        {
                            entityTmp.Name = modelInfo.txtCachThuc[idx];
                            entityTmp.Code = Data.GetCode(modelInfo.txtCachThuc[idx]);
                        }
                    }
                    ModInfoMagicService.Instance.Save(entityTmp);
                }
            }

            //Da gui thong bao su co
            num = modelInfo.chkThongBao != null ? modelInfo.chkThongBao.Length : 0;
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkThongBao[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                    {
                        BaoCaoBanDauSuCoID = id,
                        Order = GetMaxOrder_InfoMagic(),
                        Published = date,
                        Activity = true
                    };
                    entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                    if (tmp[0] == "1")
                    {
                        int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                        if (modelInfo.txtThongBao != null && modelInfo.txtThongBao.Length >= idx)
                        {
                            entityTmp.Name = modelInfo.txtThongBao[idx];
                            entityTmp.Code = Data.GetCode(modelInfo.txtThongBao[idx]);
                        }
                    }
                    ModInfoMagicService.Instance.Save(entityTmp);
                }
            }

            //Dich vu
            num = modelInfo.chkDichVu != null ? modelInfo.chkDichVu.Length : 0;
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkDichVu[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                    {
                        BaoCaoBanDauSuCoID = id,
                        Order = GetMaxOrder_InfoMagic(),
                        Published = date,
                        Activity = true
                    };
                    entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                    if (tmp[0] == "1")
                    {
                        int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                        if (modelInfo.txtDichVu != null && modelInfo.txtDichVu.Length >= idx)
                        {
                            entityTmp.Name = modelInfo.txtDichVu[idx];
                            entityTmp.Code = Data.GetCode(modelInfo.txtDichVu[idx]);
                        }
                    }
                    ModInfoMagicService.Instance.Save(entityTmp);
                }
            }

            //Bien phap
            num = modelInfo.chkBienPhap != null ? modelInfo.chkBienPhap.Length : 0;
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkBienPhap[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                    {
                        BaoCaoBanDauSuCoID = id,
                        Order = GetMaxOrder_InfoMagic(),
                        Published = date,
                        Activity = true
                    };
                    entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                    if (tmp[0] == "1")
                    {
                        int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                        if (modelInfo.txtBienPhap != null && modelInfo.txtBienPhap.Length >= idx)
                        {
                            entityTmp.Name = modelInfo.txtBienPhap[idx];
                            entityTmp.Code = Data.GetCode(modelInfo.txtBienPhap[idx]);
                        }
                    }
                    ModInfoMagicService.Instance.Save(entityTmp);
                }
            }

            //Bien phap
            num = modelInfo.chkThongTinGuiKem != null ? modelInfo.chkThongTinGuiKem.Length : 0;
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkThongTinGuiKem[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                    {
                        BaoCaoBanDauSuCoID = id,
                        Order = GetMaxOrder_InfoMagic(),
                        Published = date,
                        Activity = true
                    };
                    entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                    if (tmp[0] == "1")
                    {
                        int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                        if (modelInfo.txtThongTinGuiKem != null && modelInfo.txtThongTinGuiKem.Length >= idx)
                        {
                            entityTmp.Name = modelInfo.txtThongTinGuiKem[idx];
                            entityTmp.Code = Data.GetCode(modelInfo.txtThongTinGuiKem[idx]);
                        }
                        ModInfoMagicService.Instance.Save(entityTmp);
                    }
                }
            }

            ViewBag.BaoCao = entity;

            ViewPage.Alert("Tạo mới báo cáo thành công! Chúng tôi sẽ xem xét và phê duyệt báo cáo của bạn sớm nhất có thể.");
            ViewPage.Navigate("/vn/Thanh-vien/DS-bc-ban-dau-su-co.aspx");
        }

        public void ActionAddBCKetThucUCSC(ModBaoCaoKetThucSuCoEntity entity, MAppend append)
        {
            DateTime date = DateTime.Now;
            string ngayGioPhatHien = append.Ngay + " " + append.Gio + ":" + append.Phut;
            string[] arr = append.ThoiGian.Split('/');
            string code = "BCKTSC" + ModBaoCaoKetThucSuCoService.Instance.GetMaxID();
            entity.Name = code;
            entity.Code = Data.GetCode(code);
            entity.UserID = Lib.Global.CPLogin.UserID;
            if (!string.IsNullOrEmpty(ngayGioPhatHien)) entity.NgayGioPhatHien = HL.Core.Global.Convert.ToDateTime(ngayGioPhatHien);
            else entity.NgayGioPhatHien = DateTime.MinValue;
            entity.Order = GetMaxOrder_BCBanDau();
            entity.Published = date;
            entity.Activity = false;
            int id = ModBaoCaoKetThucSuCoService.Instance.Save(entity);

            ViewBag.BaoCao = entity;

            ViewPage.Alert("Tạo mới báo cáo thành công! Chúng tôi sẽ xem xét và phê duyệt báo cáo của bạn sớm nhất có thể.");
            ViewPage.Navigate("/vn/Thanh-vien/DS-bc-ket-thuc-su-co.aspx");
        }

        public void ActionAddBCTongHopUCSC(ModBaoCaoTongHopEntity entity)
        {
            ViewBag.BaoCao = entity;

            DateTime date = DateTime.Now;
            string code = "BCTHSC" + ModBaoCaoTongHopService.Instance.GetMaxID();
            entity.Name = code;
            entity.Code = Data.GetCode(code);
            entity.UserID = Lib.Global.CPLogin.UserID;
            entity.Order = GetMaxOrder_BCTongHop();
            entity.Published = date;
            entity.Activity = false;
            int id = ModBaoCaoTongHopService.Instance.Save(entity);

            ViewPage.Alert("Tạo mới báo cáo thành công! Chúng tôi sẽ xem xét và phê duyệt báo cáo của bạn sớm nhất có thể.");
            ViewPage.Navigate("/vn/Thanh-vien/DS-bc-tong-hop-su-co.aspx");
        }

        private int GetMaxOrder_HoSo()
        {
            return ModHSThanhVienUCSCService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_DauMoi()
        {
            return ModDauMoiUCSCService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_DangKy()
        {
            return ModDonDangKyUCSCService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_BCBanDau()
        {
            return ModBaoCaoBanDauSuCoService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_BCKetThuc()
        {
            return ModBaoCaoKetThucSuCoService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_BCTongHop()
        {
            return ModBaoCaoTongHopService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_InfoMagic()
        {
            return ModInfoMagicService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
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

    /// <summary>
    /// Model bo sung them cac item dac biet
    /// </summary>
    public class MAppend
    {
        public string Ngay { get; set; }
        public int Gio { get; set; }
        public int Phut { get; set; }
        public string ThoiGian { get; set; }    //Dinh dang: dd/MM/yyyy/HH/mm
    }
}
