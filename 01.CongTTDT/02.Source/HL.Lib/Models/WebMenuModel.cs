using System.Collections.Generic;
using HL.Core.Models;

namespace HL.Lib.Models
{
    public class WebMenuEntity : EntityBase
    {
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int LangID { get; set; }

        [DataInfo]
        public string Type { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Alias { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public string Custom { get; set; }

        [DataInfo]
        public int ParentID { get; set; }

        [DataInfo]
        public bool IsAddText { get; set; }

        [DataInfo]
        public int Order { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        [DataInfo]
        public int SourceID { get; set; }

        [DataInfo]
        public string RSS { get; set; }

        #endregion
    }

    public class WebMenuService : ServiceBase<WebMenuEntity>
    {
        #region Autogen by HL

        public WebMenuService() : base("[Web_Menu]")
        {
        }

        private static WebMenuService _Instance = null;
        public static WebMenuService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new WebMenuService();

                return _Instance;
            }
        }

        #endregion

        public WebMenuEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

        public WebMenuEntity GetByID_Cache(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle_Cache();
        }

        public List<WebMenuEntity> GetByParentID(int id)
        {
            return all_cache().FindAll(o => o.ParentID == id);
        }

        public List<WebMenuEntity> all_cache()
        {
            return WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true).ToList_Cache();
        }

        public string GetChildIDForCP(int menu_id, int lang_id)
        {
            return GetChildIDForCP(string.Empty, menu_id, lang_id);
        }

        public string GetChildIDForCP(string type, int menu_id, int lang_id)
        {
            List<int> list = new List<int>();

            List<WebMenuEntity> list_all_menu = base.CreateQuery()
                      .Where(o => o.LangID == lang_id)
                      .Where(type != string.Empty, o => o.Type == type)
                      .Select(o => new { o.ID, o.ParentID })
                      .ToList();

            GetChildIDForCP(ref list, list_all_menu, menu_id, lang_id);

            return HL.Core.Global.Array.ToString(list.ToArray());
        }

        private void GetChildIDForCP(ref List<int> list, List<WebMenuEntity> list_all_menu, int menu_id, int lang_id)
        {
            list.Add(menu_id);

            if (list_all_menu == null)
                return;

            List<WebMenuEntity> list_menu = list_all_menu.FindAll(o => o.ParentID == menu_id);

            for (int i = 0; list_menu != null && i < list_menu.Count; i++)
            {
                GetChildIDForCP(ref list, list_all_menu, list_menu[i].ID, lang_id);
            }
        }

        public string GetChildIDForWeb_Cache(int menu_id, int lang_id)
        {
            return GetChildIDForWeb_Cache(string.Empty, menu_id, lang_id);
        }

        public string GetChildIDForWeb_Cache(string type, int menu_id, int lang_id)
        {
            string Key_Cache = "Lib.App.WebMenu.GetChildIDForWeb." + type + "." + menu_id + "." + lang_id;

            string _CacheValue = null;
            object obj = HL.Core.Web.Cache.GetValue(Key_Cache);
            if (obj != null)
            {
                _CacheValue = obj.ToString();
            }
            else
            {
                List<int> list = new List<int>();

                List<WebMenuEntity> list_all_menu = base.CreateQuery()
                                    .Where(o => o.Activity == true && o.LangID == lang_id)
                                    .Where(type != string.Empty, o => o.Type == type)
                                    .Select(o => new { o.ID, o.ParentID })
                                    .ToList_Cache();

                GetChildIDForWeb_Cache(ref list, list_all_menu, menu_id, lang_id);

                _CacheValue = HL.Core.Global.Array.ToString(list.ToArray());

                HL.Core.Web.Cache.SetValue(Key_Cache, _CacheValue);
            }

            return _CacheValue;
        }

        private void GetChildIDForWeb_Cache(ref List<int> list, List<WebMenuEntity> list_all_menu, int menu_id, int lang_id)
        {
            list.Add(menu_id);

            if (list_all_menu == null)
                return;

            List<WebMenuEntity> list_menu = list_all_menu.FindAll(o => o.ParentID == menu_id);

            for (int i = 0; list_menu != null && i < list_menu.Count; i++)
            {
                GetChildIDForWeb_Cache(ref list, list_all_menu, list_menu[i].ID, lang_id);
            }
        }
    }
}
