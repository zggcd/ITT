using System.Collections.Generic;
using HL.Core.Interface;
using HL.Core.Models;

namespace HL.Lib.Models
{
    public class SysPageEntity : EntityBase, IPageInterface
    {
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int TemplateID { get; set; }

        [DataInfo]
        public int ModuleID { get; set; }

        [DataInfo]
        public int LangID { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public int ParentID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public string Custom { get; set; }

        [DataInfo]
        public int Order { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        #endregion

        public bool HasEnd { get; set; }

        public bool Root { get { return (ParentID == 0); } }

        public bool End { get { return Items.GetValue("End").ToBool(); } }
    }

    public class SysPageService : ServiceBase<SysPageEntity>, IPageServiceInterface
    {
        #region Autogen by HL

        public SysPageService() : base("[Sys_Page]")
        {
        }

        private static SysPageService _Instance = null;
        public static SysPageService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new SysPageService();

                return _Instance;
            }
        }

        #endregion

        public SysPageEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

        public SysPageEntity GetByID_Cache(int id)
        {
            //return base.CreateQuery()
            //   .Where(o => o.ID == id)
            //   .ToSingle_Cache();

            return _get_all_cache().Find(o => o.ID == id);
        }

        public List<SysPageEntity> GetByParent_Cache(int parent_id)
        {
            //return base.CreateQuery()
            //   .Where(o => o.Activity == true && o.ParentID == parent_id)
            //   .OrderByAsc(o => o.Order)
            //   .ToList_Cache();

            var list = _get_all_cache().FindAll(o => o.ParentID == parent_id);
            if (list != null)
                list.Sort((o1, o2) => o1.Order.CompareTo(o2.Order));
            return list;
        }

        public string GetMapCode_Cache(SysPageEntity page)
        {
            string Key_Cache = "Lib.App.SysPage.GetMapCode." + page.ID;

            string _MapCode = null;
            object obj = HL.Core.Web.Cache.GetValue(Key_Cache);
            if (obj != null)
            {
                _MapCode = obj.ToString();
            }
            else
            {
                SysPageEntity _Page = page;

                _MapCode = _Page.Code;
                while (_Page.ParentID > 0)
                {
                    int _parent_id = _Page.ParentID;

                    _Page = base.CreateQuery()
                           .Where(o => o.ID == _parent_id)
                           .ToSingle_Cache();

                    if (_Page == null || _Page.Root)
                        break;

                    _MapCode = _Page.Code + "/" + _MapCode;
                }

                HL.Core.Web.Cache.SetValue(Key_Cache, _MapCode);
            }

            return _MapCode;
        }

        private List<SysPageEntity> _get_all_cache()
        {
            return base.CreateQuery()
              .Where(o => o.Activity == true)
              .ToList_Cache();
        }

        #region IPageServiceInterface Members

        public IPageInterface HL_Core_GetByID(int id)
        {
            //return base.CreateQuery()
            //      .Where(o => o.ID == id)
            //      .ToSingle_Cache();

            return _get_all_cache().Find(o => o.ID == id);
        }

        public IPageInterface HL_Core_CurrentPage(HL.Core.MVC.ViewPage viewPage)
        {
            string code = viewPage.CurrentVQS.GetString(0);

            if (code == string.Empty)
                return null;

            SysPageEntity _Page = null, _PageNew = null;

            List<SysPageEntity> ArrRootPage = SearchByLangID(viewPage.CurrentLang.ID);

            if (ArrRootPage == null)
                return null;

            for (int i = 0; i < ArrRootPage.Count; i++)
            {
                //int _SiteID = ArrRootPage[i].Items.GetInt("SiteID");

                //if (_SiteID > 0 && CurrentSite.ID != _SiteID)
                //    continue;

                _PageNew = GetByCodeAndParentID(code, ArrRootPage[i].ID);

                if (_PageNew != null)
                {
                    _Page = _PageNew;
                    if (_Page.End)
                    {
                        _Page.HasEnd = true;

                        return _Page;
                    }

                    break;
                }
            }

            if (_Page == null)
                return null;

            bool hasEnd = false;
            int mvc_index = 0;
            for (int i = 1; i < viewPage.CurrentVQS.Count; i++)
            {
                mvc_index = i - 1;

                code = viewPage.CurrentVQS.GetString(i);

                _PageNew = GetByCodeAndParentID(code, _Page.ID);

                if (_PageNew != null)
                {
                    _Page = _PageNew;

                    if (_Page.End)
                    {
                        if (i != viewPage.CurrentVQS.Count - 1)
                            _Page.HasEnd = true;

                        break;
                    }
                }
                else
                {
                    hasEnd = true;

                    if (_Page != null)
                        _Page.HasEnd = true;

                    break;
                }
            }

            mvc_index++;

            if (!hasEnd)
                mvc_index++;

            if (mvc_index < viewPage.CurrentVQS.Count)
                viewPage.CurrentVQSMVC.Trunc(viewPage.CurrentVQS, mvc_index);

            return _Page;
        }

        private SysPageEntity GetByCodeAndParentID(string code, int parent_id)
        {
            //return base.CreateQuery()
            //   .Where(o => o.Activity == true && o.ParentID == parent_id && o.Code == code)
            //   .ToSingle_Cache();

            return _get_all_cache().Find(o => o.ParentID == parent_id && o.Code == code);
        }

        private List<SysPageEntity> SearchByLangID(int lang_id)
        {
            //return base.CreateQuery()
            //   .Where(o => o.Activity == true && o.ParentID == 0 && o.LangID == lang_id)
            //   .OrderByAsc(o => o.Order)
            //   .ToList_Cache();

            return _get_all_cache().FindAll(o => o.ParentID == 0 && o.LangID == lang_id);
        }

        public void HL_Core_CPSave(IPageInterface entity)
        {
            base.Save(entity as SysPageEntity);
        }

        #endregion
    }
}
