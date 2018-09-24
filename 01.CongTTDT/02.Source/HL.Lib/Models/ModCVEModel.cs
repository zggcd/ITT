using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModCVEEntity : EntityBase
    {

        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public int State { get; set; }

        [DataInfo]
        public string VulnerabilityType { get; set; }

        [DataInfo]
        public string Product { get; set; }

        [DataInfo]
        public string Score { get; set; }

        [DataInfo]
        public string GainedAccessLevel { get; set; }

        [DataInfo]
        public DateTime Published { get; set; }

        [DataInfo]
        public DateTime Updated { get; set; }

        [DataInfo]
        public int Order { get; set; }

        [DataInfo]
        public int EmailNo { get; set; }

        [DataInfo]
        public bool Resolve { get; set; }

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

    public class ModCVEService : ServiceBase<ModCVEEntity>
    {

        #region Autogen by HL

        private ModCVEService()
            : base("[Mod_CVE]")
        {

        }

        private static ModCVEService _Instance = null;
        public static ModCVEService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModCVEService();

                return _Instance;
            }
        }

        #endregion

        public ModCVEEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}