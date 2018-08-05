using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModHeThongThongTinEntity : EntityBase
    {

        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int DonDangKyUCSCID { get; set; }

        [DataInfo]
        public int DauMoiUCSCID { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public int State { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public DateTime? Published { get; set; }

        [DataInfo]
        public int Order { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        #endregion

        private ModDonDangKyUCSCEntity _oDonDangKyUCSC = null;
        public ModDonDangKyUCSCEntity getDonDangKyUCSC()
        {
            if (_oDonDangKyUCSC == null && DonDangKyUCSCID > 0)
                _oDonDangKyUCSC = ModDonDangKyUCSCService.Instance.GetByID(DonDangKyUCSCID);

            if (_oDonDangKyUCSC == null)
                _oDonDangKyUCSC = new ModDonDangKyUCSCEntity();

            return _oDonDangKyUCSC;
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

    public class ModHeThongThongTinService : ServiceBase<ModHeThongThongTinEntity>
    {

        #region Autogen by HL

        private ModHeThongThongTinService()
            : base("[Mod_HeThongThongTin]")
        {

        }

        private static ModHeThongThongTinService _Instance = null;
        public static ModHeThongThongTinService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModHeThongThongTinService();

                return _Instance;
            }
        }

        #endregion

        public ModHeThongThongTinEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}