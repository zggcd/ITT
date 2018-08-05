using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModVideoEntity : EntityBase
    {

        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public int State { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public string Summary { get; set; }

        [DataInfo]
        public string Content { get; set; }

        [DataInfo]
        public string File { get; set; }

        [DataInfo]
        public string File1 { get; set; }

        [DataInfo]
        public string Time { get; set; }

        [DataInfo]
        public int View { get; set; }

        [DataInfo]
        public DateTime? Published { get; set; }

        [DataInfo]
        public int Order { get; set; }

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

    public class ModVideoService : ServiceBase<ModVideoEntity>
    {

        #region Autogen by HL

        private ModVideoService()
            : base("[Mod_Video]")
        {

        }

        private static ModVideoService _Instance = null;
        public static ModVideoService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModVideoService();

                return _Instance;
            }
        }

        #endregion

        public ModVideoEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}