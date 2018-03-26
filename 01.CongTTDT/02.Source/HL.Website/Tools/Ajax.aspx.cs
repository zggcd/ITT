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

            if (cmd == "GuiGopY")
            {
                var dtid = HL.Core.Web.HttpQueryString.GetValue("duthaoid");
                int duthaoid = HL.Core.Global.Convert.ToInt(dtid, 0);
                string name = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("name")).Trim();
                string email = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("email")).Trim();
                //string phone = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("phone")).Trim();
                string title = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("title")).Trim();
                //string content = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("content")).Trim();
                string content = HL.Core.Web.HttpQueryString.GetValue("content").ToString();
                string sFile = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("sFile")).Trim();
                return;

                if (!string.IsNullOrEmpty(name) && !string.IsNullOrEmpty(email) && !string.IsNullOrEmpty(title) && !string.IsNullOrEmpty(content))
                {
                    string filePath = "";
                    try
                    {
                        ModGopYEntity entity = new ModGopYEntity()
                        {
                            DuThaoID = duthaoid,
                            Name = name,
                            Email = email,
                            //Phone = phone,
                            //Mobile = phone,
                            Title = title,
                            Content = content,
                            IP = System.Web.HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"],
                            Published = DateTime.Now
                        };
                        string[] fileTmp;
                        if (!string.IsNullOrEmpty(sFile))
                        {
                            fileTmp = sFile.Split('.');
                            int c = fileTmp.Length;
                            for (int i = 0; i < c; i++)
                            {
                                filePath = AppDomain.CurrentDomain.BaseDirectory + "/Data/upload/files/GopY/" + email.Replace("@", "_");
                                HL.Lib.Global.File.Base64ToFile(fileTmp[i], filePath, title + "_" + duthaoid);
                                entity.Files = filePath + title + "_" + duthaoid;
                            }
                        }
                        ModGopYService.Instance.Save(entity);
                        sHTML = "Bạn đã gửi góp ý thành công!<br />Góp ý của bạn sẽ phải được xem xét, kiểm duyệt trong thời gian sớm nhất.";
                    }
                    catch (Exception ex)
                    {
                        sHTML = "";
                        HL.Lib.Global.File.Delete(filePath + title + "_" + duthaoid);
                    }
                }
            }
            else if (cmd == "SearchVB")
            {
                string SoKyHieu = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("SoKyHieu")).Trim();
                DateTime TuNgayNgayXuatBan = HL.Core.Global.Convert.ToDateTime(HL.Core.Web.HttpQueryString.GetValue("TuNgayNgayXuatBan"));
                DateTime DenNgayNgayXuatBan = HL.Core.Global.Convert.ToDateTime(HL.Core.Web.HttpQueryString.GetValue("DenNgayNgayXuatBan"));
                DateTime TuNgayNgayCoHieuLuc = HL.Core.Global.Convert.ToDateTime(HL.Core.Web.HttpQueryString.GetValue("TuNgayNgayCoHieuLuc"));
                DateTime DenNgayNgayCoHieuLuc = HL.Core.Global.Convert.ToDateTime(HL.Core.Web.HttpQueryString.GetValue("DenNgayNgayCoHieuLuc"));
                int CoQuan = HL.Core.Global.Convert.ToInt(HL.Core.Web.HttpQueryString.GetValue("CoQuan"));
                int HinhThuc = HL.Core.Global.Convert.ToInt(HL.Core.Web.HttpQueryString.GetValue("HinhThuc"));
                int LinhVuc = HL.Core.Global.Convert.ToInt(HL.Core.Web.HttpQueryString.GetValue("LinhVuc"));
                string TrichYeu = HL.Core.Global.Convert.ToString(HL.Core.Web.HttpQueryString.GetValue("TrichYeu")).Trim();
                int Lang = HL.Core.Global.Convert.ToInt(HL.Core.Web.HttpQueryString.GetValue("Lang"));

                try
                {
                    var dbQuery = ModVanBanService.Instance.CreateQuery()
                            .Where(o => o.Activity == true);

                    if (!string.IsNullOrEmpty(SoKyHieu))
                    {
                        dbQuery.Where(o => o.Name.Contains(SoKyHieu));
                    }

                    if (TuNgayNgayXuatBan != DateTime.MinValue && TuNgayNgayXuatBan != DateTime.MaxValue)
                    {
                        dbQuery.Where(o => o.NgayBanHanh >= TuNgayNgayXuatBan);
                    }

                    if (DenNgayNgayXuatBan != DateTime.MinValue && DenNgayNgayXuatBan != DateTime.MaxValue)
                    {
                        dbQuery.Where(o => o.NgayBanHanh <= DenNgayNgayXuatBan);
                    }

                    if (TuNgayNgayCoHieuLuc != DateTime.MinValue && TuNgayNgayCoHieuLuc != DateTime.MaxValue)
                    {
                        dbQuery.Where(o => o.NgayCoHieuLuc >= TuNgayNgayCoHieuLuc);
                    }

                    if (DenNgayNgayCoHieuLuc != DateTime.MinValue && DenNgayNgayCoHieuLuc != DateTime.MaxValue)
                    {
                        dbQuery.Where(o => o.NgayCoHieuLuc <= DenNgayNgayCoHieuLuc);
                    }

                    if (LinhVuc > 0)
                    {
                        dbQuery.Where(o => o.MenuIDs.Contains(LinhVuc.ToString()));
                    }

                    if (CoQuan > 0)
                    {
                        dbQuery.Where(o => o.MenuID1 == CoQuan);
                    }

                    if (HinhThuc > 0)
                    {
                        dbQuery.Where(o => o.MenuID2 == HinhThuc);
                    }

                    if (!string.IsNullOrEmpty(TrichYeu))
                    {
                        dbQuery.Where(o => o.Summary.Contains(TrichYeu));
                    }

                    dbQuery.OrderByDesc(o => o.Order);
                    dbQuery.Take(10).Skip(10 * 0);
                    var listItem = dbQuery.ToList();

                    int c = listItem != null ? listItem.Count : 0;
                    int i = 0;
                    for (i = 0; i < c; i++)
                    {
                        string url = new ViewPage().GetURL(listItem[i].MenuID1, listItem[i].Code);
                        if (Lang == 1)
                        {
                            url = "vn/" + url;
                        }
                        else if (Lang == 2)
                        {
                            url = "en/" + url;
                        }
                        string cls = "";
                        if (i % 2 != 0)
                        {
                            cls = "even";
                        }
                        sHTML += "<tr class=\"" + cls + "\">";
                        sHTML += "<td>" + listItem[i].Name + "</td>";
                        sHTML += "<td>" + HL.Lib.MVC.ViewControl.GetName(listItem[i].getMenu1()) + "</td>";
                        sHTML += "<td>" + HL.Lib.MVC.ViewControl.GetName(listItem[i].getMenu2()) + "</td>";
                        sHTML += "<td>" + Utils.ShowTextByType3("VBLinhVuc", 1, listItem[i].MenuIDs, "MenuIDs") + "</td>";
                        sHTML += "<td><a href='/" + url + ".aspx'>" + listItem[i].Summary + "</a></td>";
                        sHTML += "<td>" + string.Format("{0:dd/MM/yyyy}", listItem[i].NgayBanHanh) + "</td>";
                        sHTML += "</tr>";
                    }
                }
                catch (Exception ex)
                {

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
                    //var user = CPUserService.Instance.GetLogin(LoginName.Trim(), pass);
                    ////user.State = 2554;
                    //user.NgayActive = user.NgayMoLock;
                    //user.SoNgayLock = 0;
                    //user.NgayLock = DateTime.MinValue;
                    //user.NgayMoLock = DateTime.MinValue;
                    //CPUserService.Instance.Save(user);
                    //string redirect = HL.Core.Web.HttpQueryString.GetValue("ReturnPath").ToString();
                    //ViewPage.Response.Redirect(string.IsNullOrEmpty(redirect) ? "/Dang-tin.aspx" : redirect);
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
            else if (cmd == "getrss")
            {
                //if (!CPLogin.IsLogin()) return;
                //int hour = DateTime.Now.Hour;
                //if (hour % 3 == 0)
                //{
                var list =
                    WebMenuService.Instance.CreateQuery()
                        .Where(o => o.Type == "Org" && o.Activity == true)
                        .ToList_Cache();
                for (int i = 0; list != null && i < list.Count; i++)
                {
                    var gettagwithclass = list[i].Items.GetValue("GetTagWithClass").ToString();
                    var gettagwithid = list[i].Items.GetValue("GetTagWithID").ToString();
                    var deltagwithclass = list[i].Items.GetValue("DelTagWithClass").ToString();
                    var deltagwithid = list[i].Items.GetValue("DelTagWithID").ToString();
                    string[] arr;
                    string gettag = "", getclassorid = "", deltag = "", delclassorid = "";
                    if (!string.IsNullOrEmpty(gettagwithclass))
                    {
                        arr = gettagwithclass.Split('|');
                        gettag = arr[0];
                        getclassorid = "class='" + arr[1] + "'";
                    }
                    else if (!string.IsNullOrEmpty(gettagwithid))
                    {
                        arr = gettagwithid.Split('|');
                        gettag = arr[0];
                        getclassorid = "id='" + arr[1] + "'";
                    }
                    if (!string.IsNullOrEmpty(deltagwithclass))
                    {
                        arr = deltagwithclass.Split('|');
                        deltag = arr[0];
                        delclassorid = "class='" + arr[1] + "'";
                    }
                    else if (!string.IsNullOrEmpty(deltagwithid))
                    {
                        arr = deltagwithid.Split('|');
                        deltag = arr[0];
                        delclassorid = "id='" + arr[1] + "'";
                    }
                    Utils.GetContentFromRSS(list[i].Code, list[i].RSS, list[i].SourceID, gettag, getclassorid, deltag,
                        delclassorid);
                    //}
                }
            }

        }
    }
}
