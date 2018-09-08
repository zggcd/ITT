using System;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;
using System.Collections.Generic;

namespace HL.Lib.Controllers
{
    public class MInfoController : Controller
    {
        public void ActionIndex()
        {
            string endcode = ViewPage.CurrentPage.Code;
            if (!string.IsNullOrEmpty(endcode) && (endcode.ToLower() == "dashboard" || endcode.ToLower() == "quan-ly-tai-khoan") && !CPLogin.IsLoginOnWeb())
                ViewPage.Response.Redirect("/vn/Thanh-vien/Dang-nhap.aspx");
            else if (endcode.ToLower() == "quan-ly-tai-khoan")
                ViewPage.Response.Redirect("/vn/Thanh-vien/Thong-tin-ca-nhan.aspx");
            else if (!CPLogin.IsLoginOnWeb() && endcode.ToLower() == "bao-cao-su-co")
                ViewPage.Response.Redirect("/vn/Thanh-vien/Dang-nhap.aspx");
            ViewBag.Data = CPLogin.CurrentUserOnWeb;
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
            else if (ec == "dich-vu-canh-bao-su-co")
            {
                ViewBag.DichVu = new ModDichVuCanhBaoEntity()
                {
                    Name = "",
                    Time = DateTime.Now.TimeOfDay
                };

                ViewBag.IPs = new ModDichVuCanhBaoIPEntity()
                {
                    Name = ""
                };

                //int userId = Lib.Global.CPLogin.UserIDOnWeb;
                //var donDk = ModDonDangKyUCSCService.Instance.CreateQuery().Where(o => o.UserID == userId).ToSingle();
                //if (donDk != null)
                //{
                //    var dv = ModDichVuCanhBaoService.Instance.CreateQuery().Where(o => o.DonDangKyUCSCID == donDk.ID).ToSingle();
                //    if (dv != null)
                //    {
                //        ViewBag.DichVu = dv;
                //        ViewBag.Append = new MAppend() { ThoiGian = dv.Time.ToString(@"hh\:mm") };
                //        ViewBag.EndCode = dv.Name;
                //        var ips = ModDichVuCanhBaoIPService.Instance.CreateQuery().Where(o => o.DichVuCanhBaoID == dv.ID).ToList();
                //        if (ips != null && ips.Count > 0) ViewBag.IPs = ips;
                //    }
                //}

                layout = "DVCanhBao";
            }
            else if (ec == "dang-xuat")
            {
                //string currUrl = ViewPage.Request.RawUrl;
                string currUrl = "/vn/Dashboard.aspx";
                CPLogin.LogoutOnWeb();
                ViewPage.Response.Redirect(currUrl);
            }
            RenderView(layout);
        }

        public void ActionRegisterPOST(CPUserEntity entity, MUserModel model)
        {
            if (entity.LoginName.Trim() == string.Empty)
                ViewPage.Message.ListMessage.Add("+ Nhập tên truy cập.");
            else
            {
                if (CPUserService.Instance.exitsloginname(entity.LoginName.Trim()))
                {
                    ViewPage.Message.ListMessage.Add("Tên truy cập đã được sử dụng.");
                }
            }

            //if (entity.Name.Trim() == string.Empty)
            //    ViewPage.Message.ListMessage.Add("Nhập tên.");

            //if (entity.CityID.Trim() == string.Empty)
            //    ViewPage.Message.ListMessage.Add("Chọn Tỉnh/Thành phố.");

            //if (Utils.GetEmailAddress(entity.Email) == string.Empty)
            //    ViewPage.Message.ListMessage.Add("+ Địa chỉ email thiếu hoặc không chính xác.");
            //else
            //{
            //    if (CPUserService.Instance.exits(entity.Email)) ViewPage.Message.ListMessage.Add("Địa chỉ email đã được sử dụng.");
            //}

            //if (entity.Year < 0)
            //    ViewPage.Message.ListMessage.Add("Chọn năm sinh.");

            //if (entity.Phone == string.Empty)
            //    ViewPage.Message.ListMessage.Add("+ Nhập số điện thoại.");

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

            string sVY = model.sVY;
            if (string.IsNullOrEmpty(model.ValidCode.Trim())) ViewPage.Message.ListMessage.Add("+ Bạn chưa nhập mã bảo vệ");
            else if (sVY.ToLower().Trim() != model.ValidCode.ToLower().Trim())
                ViewPage.Message.ListMessage.Add("+ Mã bảo vệ không chính xác");

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

                int userId = CPUserService.Instance.Save(entity);
                //CPUserRoleService.Instance.Save(new CPUserRoleEntity() { UserID = entity.ID });

                if (userId > 0)
                {
                    Cookies.SetValue("CP.UserIDOnWeb", userId.ToString(), Setting.Mod_CPTimeout, true);
                    entity = new CPUserEntity();
                    ViewPage.Alert("Chào mừng bạn đăng ký thành công và đã được kích hoạt"); ViewPage.Navigate("/vn/Dashboard.aspx");
                }

                ////ViewPage.Alert("Bạn đã đăng kí thành công! Bạn vui lòng chờ đợi Ban Quản trị chấp thuận. Thân chào."); ViewPage.Navigate("/");
                //if (CPLogin.CheckLogin1(entity.LoginName.Trim(), entity.Password.Trim()))
                //{
                //    // xoa trang
                //    //string redirect = HL.Core.Web.HttpQueryString.GetValue("ReturnPath").ToString();
                //    //ViewPage.Response.Redirect(string.IsNullOrEmpty(redirect) ? "/vn/Dashboard.aspx" : redirect);
                //}
            }
            //ViewBag.DataRes = entity;
        }

        public void ActionLogin(MLoginModel model)
        {
            CPUserEntity entity = new CPUserEntity();
            entity.LoginName = model.LoginName;
            entity.Password = model.Password;
            ViewBag.Data = entity;

            if (CPLogin.CheckLogin1(model.LoginName, model.Password, true))
            {
                string redirect = HL.Core.Web.HttpQueryString.GetValue("ReturnPath").ToString();
                ViewPage.Response.Redirect(string.IsNullOrEmpty(redirect) ? "/vn/Dashboard.aspx" : redirect);
            }
            else
            {
                ViewBag.Login = model;
                ViewPage.Alert("Đăng nhập không thành công! Tên đăng nhập hoặc mật khẩu không đúng.");
            }
        }

        public void ActionChangePassPOST(PasswordModel model)
        {
            var obj = CPUserService.Instance.CreateQuery().Where(o => o.ID == CPLogin.UserIDOnWeb).Select(o => new { o.Password, o.ID }).ToSingle();
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
                //ViewPage.Navigate("/");
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
                entity.ID = CPLogin.UserIDOnWeb;
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
        /// Them ho so ung cuu su co (Dang ky bat buoc)
        /// </summary>
        /// <param name="entity">HS thanh vien</param>
        /// <param name="entityDm">Dau moi UCSC</param>
        /// <param name="append">Doi tuong them</param>
        public void ActionAddHoSoUCSC(ModHSThanhVienUCSCEntity entity, ModDauMoiUCSCEntity entityDm, MAppend append)
        {
            ViewBag.HoSo = entity;
            ViewBag.DauMoi = entityDm;

            DateTime date = DateTime.Now;
            string code = "HSUCSC" + ModHSThanhVienUCSCService.Instance.GetMaxID();
            entity.Name = code;
            entity.Code = Data.GetCode(code);
            entity.UserID = Lib.Global.CPLogin.UserIDOnWeb;
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
            int id1 = ModDauMoiUCSCService.Instance.Save(entityDm);

            //He thong thong tin
            var arr = append.M.Split(';');
            List<ModHeThongThongTinEntity> entityHTTT = new List<ModHeThongThongTinEntity>();
            for (int i = 0; i < arr.Length; i++)
            {
                if (string.IsNullOrEmpty(arr[i])) continue;
                var tmp = arr[i].Split('_');
                int m = HL.Core.Global.Convert.ToInt(tmp[0], 0);
                if (m <= 0 || tmp.Length != 2) continue;
                var lstName = tmp[1].Split(',');

                for (int j = 0; j < lstName.Length; j++)
                {
                    if (string.IsNullOrEmpty(lstName[j])) continue;
                    var entityTmp = new ModHeThongThongTinEntity
                    {
                        DauMoiUCSCID = id1,
                        MenuID = m,
                        Name = lstName[j],
                        Code = Data.GetCode(lstName[j]),
                        Published = DateTime.Now,
                        Order = GetMaxOrder_HTTT(),
                        Activity = true
                    };
                    entityHTTT.Add(entityTmp);
                }
                ModHeThongThongTinService.Instance.Save(entityHTTT);
            }

            // Nhan luc
            var nhanLucs = append.NhanLuc.Split('|');
            var cNhanLucs = nhanLucs.Length;
            List<ModNhanLucUCSCEntity> entityNhanLuc = new List<ModNhanLucUCSCEntity>();
            for (int i = 0; i < cNhanLucs; i++)
            {
                if (string.IsNullOrEmpty(nhanLucs[i])) continue;
                var nhanLuc = nhanLucs[i].Split('_');
                int cNhanLuc = nhanLuc.Length;
                if (cNhanLuc != 10) continue;

                // Parse Nam/Thang tot nghiệp
                int iThang = 0;
                int iNam = 0;
                string[] arrNamThangTotNghiep = nhanLuc[9].Split('/');
                if (arrNamThangTotNghiep.Length == 2)   // Dinh dang MM/yyyy
                {
                    iThang = Int32.Parse(arrNamThangTotNghiep[0], 0);
                    iNam = Int32.Parse(arrNamThangTotNghiep[1], 0);
                }

                var item = new ModNhanLucUCSCEntity()
                {
                    HSThanhVienUCSCID = id,
                    Name = nhanLuc[0],
                    School = nhanLuc[1],
                    MenuIDs_LinhVucDT = nhanLuc[2],
                    MenuIDs_TrinhDoDT = nhanLuc[3],
                    MenuIDs_ChungChi = nhanLuc[4],
                    MenuIDs_QuanLyATTT = nhanLuc[5],
                    MenuIDs_KyThuatPhongThu = nhanLuc[6],
                    MenuIDs_KyThuatBaoVe = nhanLuc[7],
                    MenuIDs_KyThuatKiemTra = nhanLuc[8],
                    ThangTotNghiep = iThang,
                    NamTotNghiep = iNam,
                    Activity = true,
                    Published = DateTime.Now,
                    Order = GetMaxOrder_NhanLuc()
                };
                entityNhanLuc.Add(item);
            }
            ViewBag.NhanLuc = entityNhanLuc;
            ModNhanLucUCSCService.Instance.Save(entityNhanLuc);

            #region ITT UPDATE
            // LinhVucDaoDao
            string[] tongHopNhanLucs = append.TongHopNhanLucLVDT.Split('|');
            List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucLVDT = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    HSThanhVienUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucLVDT.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucLVDT);

            // TrinhDoDaoTao
            tongHopNhanLucs = append.TongHopNhanLucTDDT.Split('|');
            List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucTDDT = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    HSThanhVienUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucTDDT.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucTDDT);

            // ChungChi
            tongHopNhanLucs = append.TongHopNhanLucCC.Split('|');
            List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucCC = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    HSThanhVienUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucCC.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucCC);

            // QuanLyATTT
            tongHopNhanLucs = append.TongHopNhanLucNhomATTT.Split('|');
            List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomATTT = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    HSThanhVienUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucNhomATTT.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucNhomATTT);

            //KyThuatPhongThu
            tongHopNhanLucs = append.TongHopNhanLucNhomKTPT.Split('|');
            List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTPT = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    HSThanhVienUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucNhomKTPT.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucNhomKTPT);

            // KyThuatBaoVe
            tongHopNhanLucs = append.TongHopNhanLucNhomKTBV.Split('|');
            List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTBV = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    HSThanhVienUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucNhomKTBV.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucNhomKTBV);

            tongHopNhanLucs = append.TongHopNhanLucNhomKTKT.Split('|');
            List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTKT = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    HSThanhVienUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucNhomKTKT.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucNhomKTKT);

            ViewBag.ListTongHopNhanLucLVDT = lstTongHopNhanLucLVDT;
            ViewBag.ListTongHopNhanLucTDDT = lstTongHopNhanLucTDDT;
            ViewBag.ListTongHopNhanLucCC = lstTongHopNhanLucCC;
            ViewBag.ListTongHopNhanLucNhomATTT = lstTongHopNhanLucNhomATTT;
            ViewBag.ListTongHopNhanLucNhomKTPT = lstTongHopNhanLucNhomKTPT;
            ViewBag.ListTongHopNhanLucNhomKTBV = lstTongHopNhanLucNhomKTBV;
            ViewBag.ListTongHopNhanLucNhomKTKT = lstTongHopNhanLucNhomKTKT;
            #endregion

            ViewPage.Alert("Tạo mới hồ sơ thành công! Chúng tôi sẽ xem xét và phê duyệt hồ sơ của bạn sớm nhất có thể.");
            ViewPage.Navigate("/vn/Thanh-vien/Ho-so-ung-cuu-su-co.aspx");
        }

        /// <summary>
        /// Them dang ky ung cuu su co (Dang ky tu nguyen)
        /// </summary>
        /// <param name="entity">Don dang ky</param>
        /// <param name="append">Doi tuong them</param>
        public void ActionAddDangKyUCSC(ModDonDangKyUCSCEntity entity, MAppend append)
        {
            string alert = string.Empty;
            ViewBag.DangKy = entity;

            DateTime date = DateTime.Now;
            string code = "DKUCSC" + ModDonDangKyUCSCService.Instance.GetMaxID();
            entity.Name = code;
            entity.Code = Data.GetCode(code);
            entity.UserID = Lib.Global.CPLogin.UserIDOnWeb;
            entity.Order = GetMaxOrder_DangKy();

            string folder = "/Data/upload/files/DKUCSC/" + CPLogin.CurrentUserOnWeb.ID.ToString() + "_" + CPLogin.CurrentUserOnWeb.LoginName + "/";
            Lib.Global.Directory.Create(HL.Core.Global.Application.BaseDirectory + folder);
            entity.File = Utils.Upload("Atack", entity.File, folder, ref alert, true);

            entity.Published = date;
            entity.Activity = false;
            int id = ModDonDangKyUCSCService.Instance.Save(entity);

            //He thong thong tin
            var arr = append.M.Split(';');
            List<ModHeThongThongTinEntity> entityHTTT = new List<ModHeThongThongTinEntity>();
            for (int i = 0; i < arr.Length; i++)
            {
                if (string.IsNullOrEmpty(arr[i])) continue;
                var tmp = arr[i].Split('_');
                int m = HL.Core.Global.Convert.ToInt(tmp[0], 0);
                if (m <= 0 || tmp.Length != 2) continue;
                var lstName = tmp[1].Split(',');

                for (int j = 0; j < lstName.Length; j++)
                {
                    if (string.IsNullOrEmpty(lstName[j])) continue;
                    var entityTmp = new ModHeThongThongTinEntity
                    {
                        DonDangKyUCSCID = id,
                        MenuID = m,
                        Name = lstName[j],
                        Code = Data.GetCode(lstName[j]),
                        Published = DateTime.Now,
                        Order = GetMaxOrder_HTTT(),
                        Activity = true
                    };
                    entityHTTT.Add(entityTmp);
                }
                ModHeThongThongTinService.Instance.Save(entityHTTT);
            }

            // Nhan luc
            var nhanLucs = append.NhanLuc.Split('|');
            var cNhanLucs = nhanLucs.Length;
            List<ModNhanLucUCSCEntity> entityNhanLuc = new List<ModNhanLucUCSCEntity>();
            for (int i = 0; i < cNhanLucs; i++)
            {
                if (string.IsNullOrEmpty(nhanLucs[i])) continue;
                var nhanLuc = nhanLucs[i].Split('_');
                int cNhanLuc = nhanLuc.Length;
                if (cNhanLuc != 10) continue;

                // Parse Nam/Thang tot nghiệp
                int iThang = 0;
                int iNam = 0;
                string[] arrNamThangTotNghiep = nhanLuc[9].Split('/');
                if (arrNamThangTotNghiep.Length == 2)   // Dinh dang MM/yyyy
                {
                    iThang = Int32.Parse(arrNamThangTotNghiep[0], 0);
                    iNam = Int32.Parse(arrNamThangTotNghiep[1], 0);
                }

                var item = new ModNhanLucUCSCEntity()
                {
                    DonDangKyUCSCID = id,
                    Name = nhanLuc[0],
                    School = nhanLuc[1],
                    MenuIDs_LinhVucDT = nhanLuc[2],
                    MenuIDs_TrinhDoDT = nhanLuc[3],
                    MenuIDs_ChungChi = nhanLuc[4],
                    MenuIDs_QuanLyATTT = nhanLuc[5],
                    MenuIDs_KyThuatPhongThu = nhanLuc[6],
                    MenuIDs_KyThuatBaoVe = nhanLuc[7],
                    MenuIDs_KyThuatKiemTra = nhanLuc[8],
                    ThangTotNghiep = iThang,
                    NamTotNghiep = iNam,
                    Activity = true,
                    Published = DateTime.Now,
                    Order = GetMaxOrder_NhanLuc()
                };
                entityNhanLuc.Add(item);
            }
            ViewBag.NhanLuc = entityNhanLuc;
            ModNhanLucUCSCService.Instance.Save(entityNhanLuc);

            if (alert != string.Empty)
            {
                ViewPage.Message.ListMessage.Add(alert);
            }

            #region ITT UPDATE
            // LinhVucDaoDao
            string[] tongHopNhanLucs = append.TongHopNhanLucLVDT.Split('|');
            List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucLVDT = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    DonDangKyUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucLVDT.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucLVDT);

            // TrinhDoDaoTao
            tongHopNhanLucs = append.TongHopNhanLucTDDT.Split('|');
            List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucTDDT = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    DonDangKyUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucTDDT.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucTDDT);

            // ChungChi
            tongHopNhanLucs = append.TongHopNhanLucCC.Split('|');
            List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucCC = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    DonDangKyUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucCC.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucCC);

            // QuanLyATTT
            tongHopNhanLucs = append.TongHopNhanLucNhomATTT.Split('|');
            List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomATTT = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    DonDangKyUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucNhomATTT.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucNhomATTT);

            //KyThuatPhongThu
            tongHopNhanLucs = append.TongHopNhanLucNhomKTPT.Split('|');
            List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTPT = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    DonDangKyUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucNhomKTPT.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucNhomKTPT);

            // KyThuatBaoVe
            tongHopNhanLucs = append.TongHopNhanLucNhomKTBV.Split('|');
            List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTBV = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    DonDangKyUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucNhomKTBV.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucNhomKTBV);

            tongHopNhanLucs = append.TongHopNhanLucNhomKTKT.Split('|');
            List<ModTongHopNhanLucUCSCEntity> lstTongHopNhanLucNhomKTKT = new List<ModTongHopNhanLucUCSCEntity>();
            for (int i = 0; i < tongHopNhanLucs.Length; i++)
            {
                if (string.IsNullOrEmpty(tongHopNhanLucs[i])) continue;
                string[] thnl = tongHopNhanLucs[i].Split('_');
                int menuId = Int32.Parse(thnl[0], 0);
                int menuId_value = Int32.Parse(thnl[1], 0);
                if (menuId == 0 || menuId_value == 0) continue;

                var item = new ModTongHopNhanLucUCSCEntity()
                {
                    DonDangKyUCSCID = entity.ID,
                    MenuID = menuId,
                    MenuID_Value = menuId_value,
                };
                lstTongHopNhanLucNhomKTKT.Add(item);
            }
            ModTongHopNhanLucUCSCService.Instance.Save(lstTongHopNhanLucNhomKTKT);

            ViewBag.ListTongHopNhanLucLVDT = lstTongHopNhanLucLVDT;
            ViewBag.ListTongHopNhanLucTDDT = lstTongHopNhanLucTDDT;
            ViewBag.ListTongHopNhanLucCC = lstTongHopNhanLucCC;
            ViewBag.ListTongHopNhanLucNhomATTT = lstTongHopNhanLucNhomATTT;
            ViewBag.ListTongHopNhanLucNhomKTPT = lstTongHopNhanLucNhomKTPT;
            ViewBag.ListTongHopNhanLucNhomKTBV = lstTongHopNhanLucNhomKTBV;
            ViewBag.ListTongHopNhanLucNhomKTKT = lstTongHopNhanLucNhomKTKT;

            #endregion

            ViewPage.Alert("Tạo mới đăng ký thành công! Chúng tôi sẽ xem xét và phê duyệt đăng ký của bạn sớm nhất có thể.");
            ViewPage.Navigate("/vn/Thanh-vien/DS-dang-ky-ung-cuu-su-co.aspx");
        }

        public void ActionAddDVCanhBao(ModDichVuCanhBaoEntity entity, MAppend append, string endCode)
        {
            string alert = string.Empty;
            ViewBag.DichVu = entity;
            ViewBag.Append = append;
            DateTime date = DateTime.Now;
            int userId = Lib.Global.CPLogin.UserIDOnWeb;

            try
            {
                // Lay ban ghi dang ky UCSC cua user
                var donDk = ModDonDangKyUCSCService.Instance.CreateQuery().Where(o => o.UserID == userId).ToSingle();
                if (donDk == null) ViewPage.Message.ListMessage.Add("Bạn chưa thực hiện đăng ký UCSC.");

                string code = "DVCB" + ModDichVuCanhBaoService.Instance.GetMaxID();

                //entity.DonDangKyUCSCID = 0;
                entity.Name = code;
                entity.Code = Data.GetCode(code);
                entity.UserID = userId;
                entity.Order = GetMaxOrder_DVCanhBao();

                try
                {
                    if (!string.IsNullOrEmpty(append.ThoiGian)) entity.Time = TimeSpan.Parse(append.ThoiGian);
                }
                catch (Exception e)
                {
                    ViewPage.Message.ListMessage.Add("Định dạng thời gian không đúng (HH:mm)");
                }

                // Lay ban ghi neu da ton tai
                ModDichVuCanhBaoEntity curr = null;
                List<ModDichVuCanhBaoIPEntity> ipCurr = null;
                if (!string.IsNullOrEmpty(endCode))
                {
                    curr = ModDichVuCanhBaoService.Instance.CreateQuery().Where(o => o.Name == endCode).ToSingle();
                    if (curr != null)
                    {
                        curr.MenuID = entity.MenuID;
                        curr.Time = entity.Time;
                        ipCurr = ModDichVuCanhBaoIPService.Instance.CreateQuery().Where(o => o.DichVuCanhBaoID == curr.ID).ToList();
                    }
                }

                entity.Published = date;
                entity.Activity = true;
                int id = 0;

                // Danh sach IP
                var arr = append.M.Split(';');
                List<ModDichVuCanhBaoIPEntity> listIP = new List<ModDichVuCanhBaoIPEntity>();

                for (int j = 0; j < arr.Length; j++)
                {
                    if (string.IsNullOrEmpty(arr[j])) continue;
                    var entityIP = new ModDichVuCanhBaoIPEntity
                    {
                        DichVuCanhBaoID = id,
                        MenuID = entity.MenuID,
                        Name = arr[j],
                        UserID = userId,
                        Published = DateTime.Now,
                        Published1 = null,
                        Order = GetMaxOrder_DVCanhBaoIP(),
                        Activity = true
                    };
                    listIP.Add(entityIP);
                }
                ViewBag.IPs = listIP;
                if (ViewPage.Message.ListMessage.Count == 0)
                {
                    if (curr != null)
                    {
                        ModDichVuCanhBaoService.Instance.Save(curr);
                        id = curr.ID;
                    }
                    else
                    {
                        //entity.DonDangKyUCSCID = donDk.ID;
                        ViewBag.EndCode = entity.Name;
                        id = ModDichVuCanhBaoService.Instance.Save(entity);
                    }

                    // Xoa IP cu
                    var ipDel = ModDichVuCanhBaoIPService.Instance.CreateQuery().Where(o => o.DichVuCanhBaoID == id).ToList();
                    if (ipDel != null) ModDichVuCanhBaoIPService.Instance.Delete(ipDel);

                    listIP.ForEach(o => o.DichVuCanhBaoID = id);
                    ModDichVuCanhBaoIPService.Instance.Save(listIP);
                }
            }
            catch (Exception ex)
            {
                ViewPage.Message.ListMessage.Add("Lỗi đăng ký nhận cảnh báo! Hãy kiểm tra tính hợp lệ.");
            }

            if (ViewPage.Message.ListMessage.Count > 0)
            {
                ViewPage.Alert(string.Join("\n", ViewPage.Message.ListMessage));
            }
            else
            {
                ViewPage.Alert("Đăng ký nhận cảnh báo thành công.");
                //ViewPage.RefreshPage();
            }
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

        private int GetMaxOrder_InfoMagic()
        {
            return ModInfoMagicService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_HTTT()
        {
            return ModHeThongThongTinService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_DVCanhBao()
        {
            return ModDichVuCanhBaoService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_DVCanhBaoIP()
        {
            return ModDichVuCanhBaoIPService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private int GetMaxOrder_NhanLuc()
        {
            return ModNhanLucUCSCService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }
        #endregion Dieu phoi, ung cuu su co ATTT mang
    }
    public class MUserModel
    {
        public string ValidCode { get; set; }
        public string safeCode { get; set; }
        public string sVY { get; set; }
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
        public string M { get; set; }
        public string NhanLuc { get; set; }
        public string TongHopNhanLucLVDT { get; set; }
        public string TongHopNhanLucTDDT { get; set; }
        public string TongHopNhanLucCC { get; set; }
        public string TongHopNhanLucNhomATTT { get; set; }
        public string TongHopNhanLucNhomKTPT { get; set; }
        public string TongHopNhanLucNhomKTBV { get; set; }
        public string TongHopNhanLucNhomKTKT { get; set; }
    }
}
