using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModDichVuCanhBaoEntity : EntityBase
    {

        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int DonDangKyUCSCID { get; set; }

        [DataInfo]
        public int UserID { get; set; }

        [DataInfo]
        public int UserID1 { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public int State { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public TimeSpan Time { get; set; }

        [DataInfo]
        public DateTime? Published { get; set; }

        [DataInfo]
        public DateTime? Published1 { get; set; }

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

        private ModUserEntity _oUser = null;
        public ModUserEntity getUser()
        {
            if (_oUser == null && UserID > 0)
                _oUser = ModUserService.Instance.GetByID(UserID);

            if (_oUser == null)
                _oUser = new ModUserEntity();

            return _oUser;
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

    public class ModDichVuCanhBaoService : ServiceBase<ModDichVuCanhBaoEntity>
    {

        #region Autogen by HL

        private ModDichVuCanhBaoService()
            : base("[Mod_DichVuCanhBao]")
        {

        }

        private static ModDichVuCanhBaoService _Instance = null;
        public static ModDichVuCanhBaoService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModDichVuCanhBaoService();

                return _Instance;
            }
        }

        #endregion

        public ModDichVuCanhBaoEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

        public int GetMaxID()
        {
            return base.CreateQuery()
                    .Max(o => o.ID)
                    .ToValue().ToInt(0) + 1;
        }

    }
}