using System;
using System.Collections.Generic;
using System.Web;
using System.Text.RegularExpressions;
using HL.Lib.Models;

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

        public static string ShowDDLMenuByType2(string type, int langID, int selectID)
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
                    s += "<option " + (list[i].ID == selectID ? "selected" : string.Empty) + " value=\"" + list[i].ID + "\">" + list[i].Name + "</option>";
                }
            }

            return s;
        }

        public static string ShowDDLMenuByType(string type, int langID, int selectID)
        {
            List<ListItem.Item> list = ListItem.List.GetList(WebMenuService.Instance, langID, type);

            string s = string.Empty;

            for (int i = 0; list != null && i < list.Count; i++)
            {
                s += "<option " + (list[i].Value == selectID.ToString() ? "selected" : string.Empty) + " value=\"" + list[i].Value + "\">&nbsp; " + list[i].Name + "</option>";
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
    }
}
