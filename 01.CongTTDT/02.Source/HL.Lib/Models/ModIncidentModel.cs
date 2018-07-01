using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModIncidentEntity : EntityBase
    {

        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int? ParentID { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public int State { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public string Path { get; set; }

        [DataInfo]
        public string FakeDestination { get; set; }

        [DataInfo]
        public string Source { get; set; }

        [DataInfo]
        public DateTime AttackOn { get; set; }

        [DataInfo]
        public string IP { get; set; }

        [DataInfo]
        public string ISP { get; set; }

        [DataInfo]
        public int EmailNo { get; set; }

        [DataInfo]
        public string Attacker { get; set; }

        [DataInfo]
        public string MalwareName { get; set; }

        [DataInfo]
        public string AttackerIP { get; set; }

        [DataInfo]
        public string NetworkName { get; set; }

        [DataInfo]
        public string LocalIP { get; set; }

        [DataInfo]
        public int LocalTCPPort { get; set; }

        [DataInfo]
        public DateTime Timestamp { get; set; }

        [DataInfo]
        public string ASN { get; set; }

        [DataInfo]
        public string Geo { get; set; }

        [DataInfo]
        public string Url { get; set; }

        [DataInfo]
        public int Type { get; set; }

        [DataInfo]
        public string HttpAgent { get; set; }

        [DataInfo]
        public int SrcPort { get; set; }

        [DataInfo]
        public string HostName { get; set; }

        [DataInfo]
        public int Destinationport { get; set; }

        [DataInfo]
        public int Protocol { get; set; }

        [DataInfo]
        public string ServerName { get; set; }

        [DataInfo]
        public string Server { get; set; }

        [DataInfo]
        public string Header { get; set; }

        [DataInfo]
        public string Tag { get; set; }

        [DataInfo]
        public string Region { get; set; }

        [DataInfo]
        public string City { get; set; }

        [DataInfo]
        public string Sector { get; set; }

        [DataInfo]
        public DateTime Published { get; set; }

        [DataInfo]
        public int Order { get; set; }

        [DataInfo]
        public bool Resolve { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        [DataInfo]
        public int ChildNum { get; set; }

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

    public class ModIncidentService : ServiceBase<ModIncidentEntity>
    {

        #region Autogen by HL

        private ModIncidentService()
            : base("[Mod_Incident]")
        {

        }

        private static ModIncidentService _Instance = null;
        public static ModIncidentService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModIncidentService();

                return _Instance;
            }
        }

        #endregion

        public ModIncidentEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}