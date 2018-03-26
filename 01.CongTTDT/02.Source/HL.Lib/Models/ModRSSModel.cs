using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModRSSEntity : EntityBase
    {

        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public string Url { get; set; }

        [DataInfo]
        public string Nguon { get; set; }

        [DataInfo]
        public string Summary { get; set; }

        [DataInfo]
        public string Content { get; set; }

        [DataInfo]
        public int State { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public int View { get; set; }

        [DataInfo]
        public string File { get; set; }

        [DataInfo]
        public DateTime Published { get; set; }

        [DataInfo]
        public DateTime NgayLayTin { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        #endregion      
  
        private WebMenuEntity _oMenu = null;
        public WebMenuEntity getMenu()
        {
            if (_oMenu == null && MenuID > 0)
                _oMenu = WebMenuService.Instance.GetByID_Cache(MenuID);

            if (_oMenu == null)
                _oMenu = new WebMenuEntity();

            return _oMenu;
        }

    }

    public class ModRSSService : ServiceBase<ModRSSEntity>
    {

        #region Autogen by HL

        private ModRSSService()
            : base("[Mod_RSS]")
        {

        }

        private static ModRSSService _Instance = null;
        public static ModRSSService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModRSSService();

                return _Instance;
            }
        }

        #endregion

        public ModRSSEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }
        public bool Exits(string name)
        {
            return CreateQuery()
               .Where(o => o.Name == name)
               .Select(o => o.ID).ToValue().ToInt(0)>0;
        }
    }
}