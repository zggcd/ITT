using System;
using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModNewsEntity : EntityBase
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
        public string Tags { get; set; }

        [DataInfo]
        public string Summary { get; set; }

        [DataInfo]
        public string Content { get; set; }

        [DataInfo]
        public string Custom { get; set; }

        [DataInfo]
        public string File { get; set; }

        [DataInfo]
        public string Audio { get; set; }

        [DataInfo]
        public int View { get; set; }

        [DataInfo]
        public DateTime Published { get; set; }

        [DataInfo]
        public int Order { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        #endregion

        public ModNewsEntity()
        {
            Items.SetValue("IsName", true);
            Items.SetValue("IsSummary", true);
        }

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

    public class ModNewsService : ServiceBase<ModNewsEntity>
    {
        #region Autogen by HL

        public ModNewsService() : base("[Mod_News]")
        {
        }

        private static ModNewsService _Instance = null;
        public static ModNewsService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModNewsService();

                return _Instance;
            }
        }

        #endregion

        public ModNewsEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }
    }
}
