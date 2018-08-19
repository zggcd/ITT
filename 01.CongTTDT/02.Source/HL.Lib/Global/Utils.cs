using System;
using System.Collections.Generic;
using System.Web;
using System.Text.RegularExpressions;
using HL.Lib.Models;
using Microsoft.Win32;
using System.Collections.Concurrent;
using System.Xml;
using System.Data;
using System.Globalization;
using System.Net;
using System.IO;
using System.Text;
using HtmlAgilityPack;
using Newtonsoft.Json;

namespace HL.Lib.Global
{
    public class Utils : HL.Core.Web.Utils
    {
        public static string GetURL(int MenuID, string Code)
        {
            string Key_Cache = "Lib.App.ViewPage.GetURL." + MenuID;

            string _MapCode = null;
            object obj = HL.Core.Web.Cache.GetValue(Key_Cache);
            if (obj != null)
            {
                _MapCode = obj.ToString();
            }
            else
            {
                SysPageEntity _NewPage = null;

                while (MenuID > 0)
                {
                    _NewPage = SysPageService.Instance.CreateQuery()
                                    .Where(o => o.MenuID == MenuID && o.Activity == true)
                                    .ToSingle_Cache();

                    if (_NewPage != null)
                        break;

                    WebMenuEntity _Menu = WebMenuService.Instance.GetByID_Cache(MenuID);

                    if (_Menu == null || (_Menu != null && _Menu.ParentID == 0))
                        break;

                    MenuID = _Menu.ParentID;
                }

                if (_NewPage != null)
                    _MapCode = "/" + SysPageService.Instance.GetMapCode_Cache(_NewPage) + "/" + Code + ".aspx";
                else
                    _MapCode = string.Empty;

                HL.Core.Web.Cache.SetValue(Key_Cache, _MapCode);
            }

            return _MapCode;
        }

        public static List<WebMenuEntity> GetMenuByType(string type, int langID)
        {
            List<WebMenuEntity> list = WebMenuService.Instance.CreateQuery()
                                        .Where(o => o.ParentID == 0 && o.LangID == langID && o.Type == type)
                                        .OrderByAsc(o => o.Order)
                                        .ToList_Cache();

            if (list != null)
            {
                int _parent_id = list[0].ID;

                return WebMenuService.Instance.CreateQuery()
                        .Where(o => o.ParentID == _parent_id)
                        .OrderByAsc(o => o.Order)
                        .ToList_Cache();
            }

            return null;
        }

        public static string GetNameOfConfig(string configKey, int value)
        {
            List<ListItem.Item> list = ListItem.List.GetListByConfigkey(configKey);

            ListItem.Item item = list.Find(o => o.Value == value.ToString());

            return item == null ? string.Empty : item.Name;
        }

        public static string GetEmailAddress(string Eml)
        {
            Eml = Eml.Trim().ToLower();
            Match match = Regex.Match(Eml, @"^(\w[-._\w]*\w@\w[-._\w]*\w\.\w{2,4})$");
            if (match.Success)
            {
                return match.Groups[1].Value;
            }
            return string.Empty;
        }

        public static string GetMobilePhone(string number)
        {
            number = number.Trim().ToLower();
            Match match = Regex.Match(number, @"^0(1\d{9}|9\d{8})$");
            if (match.Success)
            {
                return match.Groups[1].Value;
            }
            return string.Empty;
        }

        public bool IsGoodLoginName(string s)
        {
            if (s.Length < 4 || s.Length > 22) return false;
            if (!Char.IsLetter(s[0])) return false;
            return (!Regex.IsMatch(s, "[^a-z0-9_]", RegexOptions.IgnoreCase));
        }

        public static string GetRandString()
        {
            Random rand = new Random();
            int iRan = rand.Next();
            string sKey = HL.Lib.Global.Security.MD5(iRan.ToString());
            return sKey.Substring(0, 2) + iRan.ToString()[0] + sKey.Substring(3, 2);
        }

        public static int GetCountOnline()
        {
            int _Online = ModOnlineService.Instance.CreateQuery()
                            .Where(o => o.TimeValue > DateTime.Now.AddMinutes(-5).Ticks)
                            .Count()
                            .ToValue().ToInt();

            if (_Online == 0)
                _Online = 1;

            return _Online;
        }

        public static int GetCountVisit()
        {
            return WebSettingService.Instance.CreateQuery()
                     .Where(o => o.Code == "VISIT")
                     .Select(o => o.Value)
                     .ToValue().ToInt();
        }

        public static void UpdateOnline()
        {
            if (HL.Core.Global.Config.GetValue("Mod.Visit").ToBool())
            {
                if (HttpContext.Current.Request.Cookies["Mod.Online"] == null)
                {
                    WebSettingService.Instance.Update("[Code]='VISIT'",
                        "@Value", GetCountVisit() + 1);

                    if (HL.Core.Global.Config.GetValue("Mod.Online").ToBool())
                    {
                        ModOnlineService.Instance.Delete(o => o.TimeValue < DateTime.Now.AddMinutes(-5).Ticks);
                        ModOnlineService.Instance.Save(new ModOnlineEntity()
                        {
                            SessionID = HttpContext.Current.Session.SessionID,
                            TimeValue = DateTime.Now.Ticks
                        });
                    }

                    HttpContext.Current.Response.Cookies["Mod.Online"].Value = "1";
                    HttpContext.Current.Response.Cookies["Mod.Online"].Expires = System.DateTime.Now.AddMinutes(5);
                }
            }
        }

        public static string ShowDDLMenuByParent(int parentID, int selectID)
        {
            if (parentID < 1)
                return string.Empty;

            List<WebMenuEntity> list = WebMenuService.Instance.CreateQuery()
                                          .Where(o => o.ParentID == parentID)
                                          .OrderByAsc(o => o.Order)
                                          .ToList_Cache();

            string s = string.Empty;

            for (int i = 0; list != null && i < list.Count; i++)
            {
                s += "<option " + (list[i].ID == selectID ? "selected" : string.Empty) + " value=\"" + list[i].ID + "\">" + list[i].Name + "</option>";
            }

            return s;
        }

        public static string ShowTextByType3(string type, int langID, string selectIDs, string idName)
        {
            string s = string.Empty;

            List<WebMenuEntity> list = WebMenuService.Instance.CreateQuery()
                                        .Where(o => o.ParentID == 0 && o.LangID == langID && o.Type == type)
                                        .OrderByAsc(o => o.Order)
                                        .ToList_Cache();

            if (list != null)
            {
                int _parent_id = list[0].ID;

                list = WebMenuService.Instance.CreateQuery()
                        .Where(o => o.ParentID == _parent_id)
                        .OrderByAsc(o => o.Order)
                        .ToList_Cache();

                string split = ";";

                for (int i = 0; list != null && i < list.Count; i++)
                {
                    if (selectIDs != null && selectIDs.Contains(list[i].ID.ToString()))
                    {
                        if (i == list.Count - 1) split = "";
                        s += list[i].Name + split;
                    }
                }
            }

            return s.Trim(';');
        }

        public static string ShowDDLMenuByType3(string type, int langID, string selectIDs, string idName)
        {
            string s = string.Empty;

            List<WebMenuEntity> list = WebMenuService.Instance.CreateQuery()
                                        .Where(o => o.ParentID == 0 && o.LangID == langID && o.Type == type)
                                        .OrderByAsc(o => o.Order)
                                        .ToList_Cache();

            if (list != null)
            {
                int _parent_id = list[0].ID;

                list = WebMenuService.Instance.CreateQuery()
                        .Where(o => o.ParentID == _parent_id)
                        .OrderByAsc(o => o.Order)
                        .ToList_Cache();

                for (int i = 0; list != null && i < list.Count; i++)
                {
                    string sChecked = "";
                    if (selectIDs != null && selectIDs.Contains(list[i].ID.ToString()))
                    {
                        sChecked = "checked";
                    }
                    s += "<label><input type=\"checkbox\" name=\"Arr" + idName + "\" value=\"" + list[i].ID.ToString() + "\" " + sChecked + " onclick=\"fnSetCheck(event, '" + list[i].Name + "', '#" + idName + "')\" />" + list[i].Name + "</label>";
                }
            }

            return s;
        }

        /// <summary>
        /// Gen select box
        /// </summary>
        /// <param name="type"></param>
        /// <param name="langID"></param>
        /// <param name="selectID"></param>
        /// <param name="isRemoveBefore">Cho phep an nhung item dung truoc</param>
        /// <returns></returns>
        public static string ShowDDLMenuByType2(string type, int langID, int selectID, bool isRemoveBefore = false)
        {
            string s = string.Empty;

            List<WebMenuEntity> list = WebMenuService.Instance.CreateQuery()
                                        .Where(o => o.ParentID == 0 && o.LangID == langID && o.Type == type)
                                        .OrderByAsc(o => o.Order)
                                        .ToList_Cache();

            if (list != null)
            {
                int _parent_id = list[0].ID;

                list = WebMenuService.Instance.CreateQuery()
                        .Where(o => o.ParentID == _parent_id)
                        .Where(isRemoveBefore == true, o => o.ID >= selectID)
                        .OrderByAsc(o => o.Order)
                        .ToList_Cache();

                for (int i = 0; list != null && i < list.Count; i++)
                {
                    s += "<option " + (list[i].ID == selectID ? "selected" : string.Empty) + " value=\"" + list[i].ID + "\">" + list[i].Name + "</option>";
                }
            }

            return s;
        }

        public static string ShowDDLMenuByType(string type, int langID, int selectID)
        {
            List<ListItem.Item> list = ListItem.List.GetList(WebMenuService.Instance, langID, type);
            int userId = CPLogin.CurrentUser.ID;
            CPUserRoleEntity userRole = CPUserRoleService.Instance.CreateQuery().Where(o => o.UserID == userId).ToSingle();
            CPRoleEntity role = null;
            if (userRole != null)
            {
                role = CPRoleService.Instance.CreateQuery().Where(o => o.ID == userRole.RoleID).ToSingle();
            }
            string s = string.Empty;

            for (int i = 0; list != null && i < list.Count; i++)
            {
                if (type == "News" && role != null && role.MenuIDs != null && role.MenuIDs.Contains(list[i].Value))
                {
                    s += "<option " + (list[i].Value == selectID.ToString() ? "selected" : string.Empty) + " value=\"" + list[i].Value + "\">&nbsp; " + list[i].Name + "</option>";
                }
                if (type != "News")
                {
                    s += "<option " + (list[i].Value == selectID.ToString() ? "selected" : string.Empty) + " value=\"" + list[i].Value + "\">&nbsp; " + list[i].Name + "</option>";
                }
            }

            return s;
        }

        //public static string ShowDDLMenuByType(string type, int langID, int selectID)
        //{
        //    List<ListItem.Item> list = ListItem.List.GetList(WebMenuService.Instance, langID, type);

        //    string s = string.Empty;

        //    for (int i = 0; list != null && i < list.Count; i++)
        //    {
        //        s += "<option " + (list[i].Value == selectID.ToString() ? "selected" : string.Empty) + " value=\"" + list[i].Value + "\">&nbsp; " + list[i].Name + "</option>";
        //    }

        //    return s;
        //}

        public static string ShowDDLMenuByTypeWithCheckbox(string type, int langID, string selectIDs)
        {
            List<ListItem.Item> list = ListItem.List.GetList(WebMenuService.Instance, langID, type);

            string s = string.Empty;

            for (int i = 0; list != null && i < list.Count; i++)
            {
                string check = "";
                if (!string.IsNullOrEmpty(selectIDs) && selectIDs.Contains(list[i].Value)) check = "checked";
                s += "<span><input type='checkbox' name='MenuIDs' value=\"" + list[i].Value + "\" " + check + " />&nbsp; " + list[i].Name + "</span><br />";
            }

            return s;
        }

        public static string ShowDDLActivity(int activity)
        {
            string s = string.Empty;

            for (int i = 1; i <= 2; i++)
            {
                s += "<option " + (i == activity ? "selected" : string.Empty) + " value=\"" + i + "\">" +
                     (i == 1 ? "Duyệt" : "Bỏ duyệt") + "</option>";
            }

            return s;
        }

        public static string ShowRadioByConfigkey(string configKey, string name, int flag)
        {
            List<ListItem.Item> list = ListItem.List.GetListByConfigkey(configKey);

            string s = string.Empty;

            for (int i = 0; list != null && i < list.Count; i++)
            {
                s += "<input name=\"" + name + "\"" + ((flag & HL.Core.Global.Convert.ToInt(list[i].Value)) == HL.Core.Global.Convert.ToInt(list[i].Value) ? "checked=\"checked\"" : string.Empty) + " value=\"" + list[i].Value + "\" type=\"radio\" />" + list[i].Name + " &nbsp;";
            }

            return s;
        }

        public static string ShowCheckBoxByConfigkey(string configKey, string name, int flag)
        {
            List<ListItem.Item> list = ListItem.List.GetListByConfigkey(configKey);

            string s = string.Empty;

            for (int i = 0; list != null && i < list.Count; i++)
            {
                s += "<input name=\"" + name + "\"" + ((flag & HL.Core.Global.Convert.ToInt(list[i].Value)) == HL.Core.Global.Convert.ToInt(list[i].Value) ? "checked=\"checked\"" : string.Empty) + " value=\"" + list[i].Value + "\" type=\"checkbox\" />" + list[i].Name + " &nbsp;";
            }

            return s;
        }

        public static string ShowDDLByConfigkey(string configKey, int selectID)
        {
            List<ListItem.Item> list = ListItem.List.GetListByConfigkey(configKey);

            string s = string.Empty;

            for (int i = 0; list != null && i < list.Count; i++)
            {
                s += "<option " + (list[i].Value == selectID.ToString() ? "selected" : string.Empty) + " value=\"" + list[i].Value + "\">" + list[i].Name + "</option>";
            }

            return s;
        }

        public static string DayOfWeekVN(DateTime dt)
        {
            string[] ArrDayOfWeek = "Chủ nhật,Thứ hai,Thứ ba,Thứ tư,Thứ năm,Thứ sáu,Thứ bảy".Split(',');

            return ArrDayOfWeek[(int)dt.DayOfWeek];
        }

        public static string GetMapPage(SysPageEntity Page, string sKey)
        {
            return GetMapPage(Page, sKey, string.Empty);
        }

        public static string GetMapPage(SysPageEntity Page, string Space, string CssClass)
        {
            if (Page == null || Page.Root)
                return string.Empty;

            HL.Lib.MVC.ViewPage ViewPage = HL.Core.Web.Application.CurrentViewPage as HL.Lib.MVC.ViewPage;

            string sMap = string.Empty;

            if (Page.ID == ViewPage.CurrentPage.ID)
            {
                if (CssClass != string.Empty)
                    sMap = string.Format("<span class='{2}'>{1}</span>", ViewPage.GetPageURL(Page), Page.Name, CssClass);
                else
                    sMap = string.Format("<span>{1}</span>", ViewPage.GetPageURL(Page), Page.Name);
            }
            else
            {
                if (CssClass != string.Empty)
                    sMap = string.Format("<a href='{0}' class='{2}'><span>{1}</span></a>", ViewPage.GetPageURL(Page), Page.Name, CssClass);
                else
                    sMap = string.Format("<a href='{0}'><span>{1}</span></a>", ViewPage.GetPageURL(Page), Page.Name);
            }

            SysPageEntity _Parent = SysPageService.Instance.GetByID_Cache(Page.ParentID);

            if (_Parent == null || _Parent.Root)
                return sMap;
            else
                return GetMapPage(_Parent, Space, CssClass) + Space + sMap;
        }

        public static string GetMapPage2(SysPageEntity Page, string Space, string CssClass)
        {
            if (Page == null || Page.Root)
                return string.Empty;

            HL.Lib.MVC.ViewPage ViewPage = HL.Core.Web.Application.CurrentViewPage as HL.Lib.MVC.ViewPage;

            string sMap = string.Empty;

            if (Page.ID == ViewPage.CurrentPage.ID)
            {
                if (CssClass != string.Empty)
                    sMap = string.Format("<a href='{0}' class='{2}'><span class='{2}'>{1}</span></a>", ViewPage.GetPageURL(Page), Page.Name, CssClass);
                else
                    sMap = string.Format("<a href='{0}'><span>{1}</span></a>", ViewPage.GetPageURL(Page), Page.Name);
            }
            else
            {
                if (CssClass != string.Empty)
                    sMap = string.Format("<a href='{0}' class='{2}'><span>{1}</span></a>", ViewPage.GetPageURL(Page), Page.Name, CssClass);
                else
                    sMap = string.Format("<a href='{0}'><span>{1}</span></a>", ViewPage.GetPageURL(Page), Page.Name);
            }

            SysPageEntity _Parent = SysPageService.Instance.GetByID_Cache(Page.ParentID);

            if (_Parent == null || _Parent.Root)
                return sMap;
            else
                return GetMapPage(_Parent, Space, CssClass) + Space + sMap;
        }

        public static string GetCodeAdv(ModAdvEntity _Adv)
        {
            if (!string.IsNullOrEmpty(_Adv.File))
            {
                if (!string.IsNullOrEmpty(_Adv.URL))
                {
                    if (_Adv.File.ToLower().EndsWith(".swf"))
                    {
                        return GetMedia(0, _Adv.File, _Adv.Name, _Adv.Width, _Adv.Height, null, false, _Adv.AddInTag);
                    }
                    else
                    {
                        return "<a href=\"" + _Adv.URL + "\" target=\"" + _Adv.Target + "\">" + GetMedia(0, _Adv.File, _Adv.Name, _Adv.Width, _Adv.Height, null, false, _Adv.AddInTag) + "</a>";
                    }
                }
                else
                {
                    return GetMedia(0, _Adv.File, _Adv.Name, _Adv.Width, _Adv.Height, null, false, _Adv.AddInTag);
                }
            }

            if (!string.IsNullOrEmpty(_Adv.AdvCode))
                return _Adv.AdvCode;

            return string.Empty;
        }

        public static string GetResizeFile(string File, int TypeResize, int Width, int Height)
        {
            if (string.IsNullOrEmpty(File))
                return string.Empty;

            if (File.ToLower().StartsWith("http"))
                return File;

            string applicationPath = "/" + HL.Core.Web.HttpRequest.ApplicationPath;

            try
            {
                File = System.Web.HttpUtility.UrlDecode(File);

                string pathFile = HttpContext.Current.Server.MapPath(File);
                string pathTempFile = System.IO.Path.GetDirectoryName(File.ToLower().Replace("~/data/upload/", string.Empty));

                Global.Directory.Create(HttpContext.Current.Server.MapPath("~/Data/ResizeImage/" + pathTempFile));

                string _temp_file = "~/Data/ResizeImage/" + pathTempFile + "/" + Global.File.FormatFileName(System.IO.Path.GetFileNameWithoutExtension(File)) + "x" + Width + "x" + Height + "x" + TypeResize + System.IO.Path.GetExtension(File);
                string _temp_file_full = HttpContext.Current.Server.MapPath(_temp_file);

                if (!System.IO.File.Exists(_temp_file_full))
                {
                    if (System.IO.File.Exists(pathFile))
                    {
                        HL.Lib.Global.Image.ResizeImageFile(Width, Height, TypeResize, pathFile, _temp_file_full, System.Drawing.Imaging.ImageFormat.Jpeg);

                        if (System.IO.File.Exists(_temp_file_full))
                            return applicationPath + _temp_file.Replace("~/", string.Empty).Replace("\\", "/").Replace("//", "/").Replace("//", "/");
                    }
                }
                else
                    return applicationPath + _temp_file.Replace("~/", string.Empty).Replace("\\", "/").Replace("//", "/").Replace("//", "/");

            }
            catch { }

            return applicationPath + File.Replace("~/", string.Empty);
        }

        public static string GetMedia(int TypeResize, string File, string Alt, int Width, int Height, string CssClass, bool Compression, string AddInTag)
        {
            if (string.IsNullOrEmpty(File))
                return string.Empty;

            string attAlt = null;
            string attCssClass = null;
            string attWidth = null;
            string attHeight = null;

            if (!string.IsNullOrEmpty(Alt))
                attAlt = " alt=\"" + Alt + "\" ";

            if (!string.IsNullOrEmpty(CssClass))
                attCssClass = " class=\"" + CssClass + "\" ";

            if (Width > 0)
                attWidth = " width=\"" + Width + "\" ";
            else
                attWidth = " width=\"100%\" ";

            if (Height > 0)
                attHeight = " height=\"" + Height + "\" ";
            else
                attHeight = " height=\"100%\" ";

            string extFile = System.IO.Path.GetExtension(File).ToUpper();
            if (extFile == ".SWF")
            {
                File = File.Replace("~/", string.Empty);

                if (!File.ToLower().StartsWith("http"))
                    File = "/" + HL.Core.Web.HttpRequest.ApplicationPath + HttpContext.Current.Server.UrlPathEncode(File);

                string htmlFlash = "<object classid=\"clsid:d27cdb6e-ae6d-11cf-96b8-444553540000\" codebase=\"http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0\" border=\"0\" " + attWidth + attHeight + AddInTag + ">";
                htmlFlash += "<param name=\"movie\" value=\"" + File + "\">";
                htmlFlash += "<param name=\"AllowScriptAccess\" value=\"always\">";
                htmlFlash += "<param name=\"quality\" value=\"high\">";
                htmlFlash += "<param name=\"wmode\" value=\"transparent\">";
                htmlFlash += "<embed src=\"" + File + "\" quality=\"high\" wmode=\"transparent\" allowscriptaccess=\"always\" pluginspage=\"http://www.macromedia.com/go/getflashplayer\" type=\"application/x-shockwave-flash\" " + attWidth + attHeight + AddInTag + "></embed>";
                htmlFlash += "</object>";

                return htmlFlash;
            }
            else
            {
                if (!Compression)
                {
                    File = File.Replace("~/", string.Empty);

                    if (!File.ToLower().StartsWith("http"))
                        File = "/" + HL.Core.Web.HttpRequest.ApplicationPath + HttpContext.Current.Server.UrlPathEncode(File);

                    return "<img " + attAlt + attCssClass + " src=\"" + File + "\" " + attWidth + attHeight + AddInTag + "/>";
                }
                else
                {
                    bool isFix = true;
                    if (!File.ToLower().StartsWith("http"))
                    {
                        if (TypeResize == 4)
                            isFix = false;

                        File = GetResizeFile(File, TypeResize, Width, Height);
                    }

                    return "<img " + attAlt + attCssClass + " src=\"" + File + "\" " + (isFix ? attWidth + attHeight : string.Empty) + AddInTag + "/>";
                }
            }
        }

        public static string GetMedia(string Url, int Width, int Height, string CssClass, bool Compression, string AddInTag)
        {
            return GetMedia(2, Url, null, Width, Height, CssClass, Compression, AddInTag);
        }

        public static string GetMedia(string Url, int Width, int Height, string CssClass, bool Compression)
        {
            return GetMedia(2, Url, null, Width, Height, CssClass, Compression, null);
        }

        public static string GetMedia(string Url, int Width, string CssClass, bool Compression)
        {
            return GetMedia(2, Url, null, Width, 0, CssClass, Compression, null);
        }

        public static string GetMedia(string Url, int Width, int Height, bool Compression)
        {
            return GetMedia(2, Url, null, Width, Height, null, Compression, null);
        }

        public static string GetMedia(string Url, int Width, int Height, string CssClass)
        {
            return GetMedia(2, Url, null, Width, Height, CssClass, true, null);
        }

        public static string GetMedia(string Url, int Width, string CssClass)
        {
            return GetMedia(2, Url, null, Width, 0, CssClass, true, null);
        }

        public static string GetMedia(string Url, int Width, int Height)
        {
            return GetMedia(2, Url, null, Width, Height, null, true, null);
        }

        public static string GetMedia(string Url, int Width)
        {
            return GetMedia(2, Url, null, Width, 0, null, true, null);
        }

        public static string GetMedia(string Url)
        {
            return GetMedia(2, Url, null, 0, 0, null, true, null);
        }

        public const string CodauChars =
            "?&,/àáảãạâầấẩẫậăằắẳẵặèéẻẽẹêềếểễệđìíỉĩịòóỏõọôồốổỗộơờớởỡợùúủũụưừứửữựỳýỷỹỵÀÁẢÃẠÂẦẤẨẪẬĂẰẮẲẴẶÈÉẺẼẸÊỀẾỂỄỆĐÌÍỈĨỊÒÓỎÕỌÔỒỐỔỖỘƠỜỚỞỠỢÙÚỦŨỤƯỪỨỬỮỰỲÝỶỸỴ";

        public const string KodauChars =
            "____aaaaaaaaaaaaaaaaaeeeeeeeeeeediiiiiooooooooooooooooouuuuuuuuuuuyyyyyAAAAAAAAAAAAAAAAAEEEEEEEEEEEDIIIIIOOOOOOOOOOOOOOOOOOOUUUUUUUUUUUYYYYY";

        public static string Codau2Khongdau(string input, string separateBy)
        {
            string temp = string.Empty;
            string[] replace = { "“", "”", "'", "\"", "?", ":", "'", "=", "&", "(", ")", "[", "]", "%", "~", "!", "#", "$", "^", "*", "+", "<", ">", @"\", "|", "/", "." };
            for (int i = 0; i < replace.Length; i++)
            {
                input = input.Replace(replace[i], "");
            }
            input = Regex.Replace(input, @"\s+", " ").Replace(" - ", separateBy).Replace("'", "").Replace("\"", "").TrimEnd();
            for (int i = 0; i < input.Length; i++)
            {
                if (input[i].ToString() == " " || input[i].ToString() == "-")
                    temp += separateBy;
                else
                {
                    int pos = CodauChars.IndexOf(input[i].ToString(), System.StringComparison.Ordinal);
                    if (pos >= 0)
                        temp += KodauChars[pos];
                    else
                        temp += input[i];
                }
            }

            return temp;
        }

        public static string Upload(string name, string old, string sDir, ref string alert)
        {
            return Upload(name, old, sDir, ref alert, false);
        }

        public static string Upload(string name, string old, string sDir, ref string alert, bool overide)
        {
            string sFile = string.Empty;
            HttpPostedFile DKKD = HttpContext.Current.Request.Files[name];
            if (DKKD != null && DKKD.FileName.Length > 0)
            {
                string _fileName = DKKD.FileName;
                if (DKKD.ContentLength > 5 * 1024 * 1024)
                {
                    alert += @"\r\nKích cỡ " + name + " không được lớn hơn 5MB.";
                    return string.Empty;
                }
                else
                {
                    try
                    {
                        string sDirFull = HL.Core.Global.Application.BaseDirectory + sDir;
                        //if (!System.IO.Directory.Exists(sDirFull))
                        //    System.IO.Directory.CreateDirectory(sDirFull);
                        sFile = sDir +
                                HL.Lib.Global.Data.GetCode(System.IO.Path.GetFileNameWithoutExtension(_fileName)) +
                                System.IO.Path.GetExtension(_fileName);
                        string sFileFull = HL.Core.Global.Application.BaseDirectory + sFile;
                        System.IO.FileInfo fi = new System.IO.FileInfo(sFileFull);
                        //Kiểm tra tồn tại, nếu tồn tại thì xóa
                        bool exits = fi.Exists;
                        if (exits)
                        {
                            if (overide)
                            {
                                string unique = string.Format("{0:ddMMyyyyhhmmss}", DateTime.Now);
                                sFile = sDir + Data.GetCode(System.IO.Path.GetFileNameWithoutExtension(_fileName)) + "_" + unique + System.IO.Path.GetExtension(_fileName);
                                sFileFull = HL.Core.Global.Application.BaseDirectory + sFile;
                            }
                            else
                            {
                                fi.Delete();
                            }
                        }
                        if (!string.IsNullOrEmpty(old) && old != sFile)
                            if (System.IO.File.Exists(HL.Core.Global.Application.BaseDirectory + old.Replace("~/", "/")))
                                System.IO.File.Delete(HL.Core.Global.Application.BaseDirectory + old.Replace("~/", "/"));
                        //them vao db
                        DKKD.SaveAs(sFileFull);
                    }
                    catch (Exception ex)
                    {
                        Error.Write("Loi upload file : " + ex.Message);
                    }
                }
            }
            if (!string.IsNullOrEmpty(sFile))
                return "~" + sFile;
            else return "";
        }

        private static ConcurrentDictionary<string, string> MimeTypeToExtension = new ConcurrentDictionary<string, string>();
        private static ConcurrentDictionary<string, string> ExtensionToMimeType = new ConcurrentDictionary<string, string>();

        public static string ConvertMimeTypeToExtension(string mimeType)
        {
            if (string.IsNullOrWhiteSpace(mimeType))
                throw new ArgumentNullException("mimeType");

            string key = string.Format(@"MIME\Database\Content Type\{0}", mimeType);
            string result;
            if (MimeTypeToExtension.TryGetValue(key, out result))
                return result;

            RegistryKey regKey;
            object value;

            regKey = Registry.ClassesRoot.OpenSubKey(key, false);
            value = regKey != null ? regKey.GetValue("Extension", null) : null;
            result = value != null ? value.ToString() : string.Empty;

            MimeTypeToExtension[key] = result;
            return result;
        }

        // check existed news by code.
        public static bool CheckNews(string code, string title)
        {
            var entity = ModRSSService.Instance.CreateQuery().Where(o => o.Code.Contains(code) || o.Name.Contains(title)).ToSingle();
            if (entity == null)
                return false;
            else
                return true;
        }

        // get html content
        public static string GetHTML(string url)
        {
            if (string.IsNullOrEmpty(url))
            {
                return "";
            }
            string html = "";
            var request = (HttpWebRequest)WebRequest.Create(url);
            var response = (HttpWebResponse)request.GetResponse();
            Stream responseStream = response.GetResponseStream();
            var reader = new StreamReader(responseStream, Encoding.UTF8);
            html = reader.ReadToEnd();
            response.Close();
            reader.Close();
            return html;
        }

        /// <summary>
        /// Code cu: lay RSS (khong lay noi dung)
        /// </summary>
        /// <param name="url">Duong dan url</param>
        /// <param name="startHtml">Doan html bat dau</param>
        /// <param name="startIndex">Vi tri bat dau lay trong xau html</param>
        /// <param name="endHtml">Doan html ket thuc</param>
        /// <returns></returns>
        public static string GetContentFromURL(string url, string startHtml, int startIndex, string endHtml)
        {
            string content = string.Empty;
            int start = url.IndexOf("http://");
            int end = url.IndexOf(".html");
            url = url.Substring(start, (end - start) + 5);
            content = GetHTML(url);
            int t = 0;
            int b = 0;
            t = content.IndexOf(startHtml);
            if (t > 0)
                content = content.Substring(t + startIndex, content.Length - t - startIndex);

            b = content.LastIndexOf(endHtml);
            content = content.Substring(0, b);

            return content;
        }

        /// <summary>
        /// Code moi: lay RSS (lay ca noi dung)
        /// </summary>
        /// <param name="url">Duong dan url</param>
        /// <param name="get_tagname">Ten the: Node cha chua noi dung lay</param>
        /// <param name="get_classorid">Ten lop hoac id cua Node cha chua noi dung lay</param>
        /// <param name="remov_tagname">Ten the (bao gom ca node con) can xoa trong Node cha lay o tren</param>
        /// <param name="remove_classorid">Ten lop hoac id cua Node can xoa</param>
        /// <returns></returns>
        public static string GetContentFromURL(string url, string get_tagname, string get_classorid, string remov_tagname, string remove_classorid)
        {
            string content = string.Empty;

            var webGet = new HtmlWeb();
            var doc = webGet.Load(url);
            //HtmlDocument doc = new HtmlDocument();
            //doc.Load("file.htm");

            var divs = !string.IsNullOrEmpty(get_tagname) && !string.IsNullOrEmpty(get_classorid)
                ? doc.DocumentNode.SelectSingleNode("//" + get_tagname + "[@" + get_classorid + "]")
                : null;
            var divRemove = !string.IsNullOrEmpty(remov_tagname) && !string.IsNullOrEmpty(remove_classorid) && divs != null
                ? divs.SelectSingleNode("//" + remov_tagname + "[@" + remove_classorid + "]")
                : null;
            if (divs == null) return content;
            content = divRemove != null ? divs.InnerHtml.Replace(divRemove.OuterHtml, "").Trim() : divs.InnerHtml.Trim();

            return content;
        }

        public static void GetContentFromRSS(string domain, string rss, int menuID, string gettag, string getclass, string deltag, string delclass)
        {
            try
            {
                var reader = new XmlTextReader(rss);
                var ds = new DataSet();
                try { ds.ReadXml(reader); }
                catch { }

                for (int i = 0; ds.Tables["item"] != null && i < ds.Tables["item"].Rows.Count; i++)
                {
                    try
                    {
                        string pubdate = ds.Tables["item"].Rows[i]["pubDate"].ToString();

                        string[] formats =
                        {
                            "M/d/yyyy h:mm:ss tt", "M/d/yyyy h:mm tt",
                            "MM/dd/yyyy hh:mm:ss", "M/d/yyyy h:mm:ss",
                            "M/d/yyyy hh:mm tt", "M/d/yyyy hh tt",
                            "M/d/yyyy h:mm", "M/d/yyyy h:mm",
                            "MM/dd/yyyy hh:mm", "M/dd/yyyy hh:mm",
                            "yyyy/M/d h:mm:ss tt", "yyyy/M/d h:mm tt",
                            "yyyy/MM/dd hh:mm:ss", "yyyy/MM/dd h:mm:ss",
                            "yyyy/M/d hh:mm tt", "yyyy/M/d hh tt",
                            "yyyy/M/d h:mm", "yyyy/M/d h:mm",
                            "yyyy/MM/dd hh:mm", "yyyy/MM/dd hh:mm",
                            "M-d-yyyy h:mm:ss tt", "M-d-yyyy h:mm tt",
                            "MM-dd-yyyy hh:mm:ss", "M-d-yyyy h:mm:ss",
                            "M-d-yyyy hh:mm tt", "M-d-yyyy hh tt",
                            "M-d-yyyy h:mm", "M-d-yyyy h:mm",
                            "MM-dd-yyyy hh:mm", "M-dd-yyyy hh:mm",
                            "yyyy-M-d h:mm:ss tt", "yyyy-M-d h:mm tt",
                            "yyyy-MM-dd hh:mm:ss", "yyyy-MM-dd h:mm:ss", "yyyy-MM-dd HH:mm:ss", "yyyy-MM-dd H:mm:ss",
                            "yyyy-M-d hh:mm tt", "yyyy-M-d hh tt",
                            "yyyy-M-d h:mm", "yyyy-M-d h:mm",
                            "yyyy-MM-dd hh:mm", "yyyy-MM-dd hh:mm",

                            "MM/dd/yyyy HH:mm:ss",
                            "M/d/yyyy HH:mm tt", "M/d/yyyy HH tt",
                            "MM/dd/yyyy HH:mm", "M/dd/yyyy HH:mm",
                            "yyyy/MM/dd HH:mm:ss",
                            "yyyy/M/d HH:mm tt", "yyyy/M/d HH tt",
                            "yyyy/MM/dd HH:mm", "yyyy/MM/dd HH:mm",
                            "MM-dd-yyyy HH:mm:ss",
                            "M-d-yyyy HH:mm tt", "M-d-yyyy HH tt",
                            "MM-dd-yyyy HH:mm", "M-dd-yyyy HH:mm","yyyy-M-d H:mm:ss tt", "yyyy-M-d H:mm tt",
                            "M-d-yyyy H:mm", "M-d-yyyy H:mm",
                            "M-d-yyyy H:mm:ss tt", "M-d-yyyy H:mm tt", "M-d-yyyy H:mm:ss",
                            "yyyy/M/d H:mm", "yyyy/M/d H:mm",
                            "yyyy/M/d H:mm:ss tt", "yyyy/M/d H:mm tt", "yyyy/MM/dd H:mm:ss",
                            "M/d/yyyy H:mm", "M/d/yyyy H:mm", "M/d/yyyy H:mm:ss", "M/d/yyyy H:mm:ss tt", "M/d/yyyy H:mm tt",
                            "yyyy-M-d HH:mm tt", "yyyy-M-d HH tt",
                            "yyyy-M-d H:mm", "yyyy-M-d H:mm",
                            "yyyy-MM-dd HH:mm", "yyyy-MM-dd HH:mm",

                            "dddd, MMMM dd yyyy", "dddd, MMMM dd, yyyy h:mm tt",
                            "dddd, MMMM dd, yyyy h:mm:ss tt", "MMMM dd",
                            "MMMM, yyyy", "ddd, dd MMM yyyy HH:mm:ss GMT", "ddd, dd MMM yyyy HH:mm:ss zzz",
                            "yyyy-MM-dd HH:mm:ssZ",
                            "MM/dd/yyyy HH:mm:ss GMT",
                            "ddd, dd MMM yyyy HH:mm:ss GMTZ", //"Mon, 20 Mar 2017 21:56:05 GMT+7"
                            "ddd, dd MMM yyyy HH':'mm':'ss 'GMT+7'"
                        };
                        DateTime published = DateTime.Now;

                        try
                        {
                            //published = DateTime.ParseExact(pubdate, formats,
                            //    CultureInfo.CurrentCulture,
                            //    DateTimeStyles.None);
                            published = DateTime.ParseExact(pubdate, formats,
                                CultureInfo.CurrentUICulture,
                                DateTimeStyles.None);
                        }
                        catch (FormatException e)
                        {
                            continue;
                        }
                        //if (published.ToShortDateString() == DateTime.Now.ToShortDateString())
                        //{
                        string url = ds.Tables["item"].Rows[i]["link"].ToString().Replace(System.Environment.NewLine, " ");
                        string description = ds.Tables["item"].Rows[i]["description"].ToString();


                        string img = string.Empty, des = string.Empty;


                        if (description.Contains("<img"))
                        {
                            int start = description.IndexOf("<img");
                            int end = description.IndexOf("</a>");
                            if (start <= end)
                                img = description.Substring(start, description.Length - start - 1);
                        }

                        string matchString = Regex.Match(img, "<img.+?src=[\"'](.+?)[\"'].+?>", RegexOptions.IgnoreCase).Groups[1].Value;
                        if (string.IsNullOrEmpty(matchString) && description.Contains("<img"))
                        {
                            int start = description.IndexOf("<img");
                            int end = description.IndexOf("/>");
                            if (start <= end)
                                img = description.Substring(start, description.Length - start - 1);
                            matchString = Regex.Match(img, "<img.+?src=[\"'](.+?)[\"'].+?>", RegexOptions.IgnoreCase).Groups[1].Value;
                        }
                        //if (description.Contains("<img"))
                        //{
                        //    description = description.Replace(matchString, "");
                        //}
                        if (description.Contains("<a"))
                        {
                            int start = description.IndexOf("<a");
                            int end = description.IndexOf("</a>");
                            if (start <= end)
                                des = description.Substring(start, end - start + 4);
                            description = description.Replace(des, "").Trim();
                        }
                        if (description.Contains("<img"))
                        {
                            int start = description.IndexOf("<img");
                            int end = description.IndexOf("/>");
                            if (start <= end)
                                des = description.Substring(start, end - start + 2);
                            description = description.Replace(des, "").Trim();
                        }
                        string title = ds.Tables["item"].Rows[i]["title"].ToString();
                        if (CheckNews(Data.GetCode(title), title) == false)
                        {
                            var entity = new ModRSSEntity
                            {
                                Name = title,
                                Code = Data.GetCode(title),
                                Url = url,
                                Published = published,
                                NgayLayTin = DateTime.Now,
                                Nguon = domain,
                                File = matchString,
                                Summary = description,
                                Content = GetContentFromURL(url, gettag, getclass, deltag, delclass),
                                MenuID = menuID,
                                Activity = false
                            };
                            ModRSSService.Instance.Save(entity);
                        }
                        //}
                    }
                    catch (Exception ex)
                    {
                        continue;
                    }
                }
            }
            catch (Exception)
            {
            }

        }

        /// <summary>
        /// Lay du lieu tu API
        /// </summary>
        /// <typeparam name="T">Kieu du lieu dong</typeparam>
        /// <param name="api">Link API</param>
        /// <param name="msg">Thong bao loi</param>
        /// <returns></returns>
        public static T DownloadJsonToData<T>(string api, ref string msg) where T : new()
        {
            using (var w = new WebClient())
            {
                var json = string.Empty;

                try
                {
                    json = w.DownloadString(api);

                    return !string.IsNullOrEmpty(json) ? JsonConvert.DeserializeObject<T>(json) : new T();
                }
                catch (Exception)
                {
                    msg = "Lỗi chuyển dữ liệu từ API sang dữ liệu hệ thống.";
                }

                return new T();
            }
        }

        public static string getSubString(string s, int length)
        {
            if (String.IsNullOrEmpty(s))
                throw new ArgumentNullException(s);
            var words = s.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
            if (words[0].Length > length)
                throw new ArgumentException("Từ đầu tiên dài hơn chuỗi cần cắt");
            var sb = new System.Text.StringBuilder();
            foreach (var word in words)
            {
                if ((sb + word).Length > length)
                    return string.Format("{0}...", sb.ToString().TrimEnd(' '));
                sb.Append(word + " ");
            }
            return string.Format("{0}...", sb.ToString().TrimEnd(' '));
        }

    }
}
