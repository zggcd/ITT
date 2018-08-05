using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModSoLuongSuCoEntity : EntityBase
    {
        
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int UserID { get; set; }

        [DataInfo]
        public int UserID1 { get; set; }

        [DataInfo]
        public int BaoCaoTongHopID { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public int State { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public int SoLuong { get; set; }

        [DataInfo]
        public int TuXuLy { get; set; }

        [DataInfo]
        public int ToChucHoTro { get; set; }

        [DataInfo]
        public int ToChucNuocNgoaiHoTro { get; set; }

        [DataInfo]
        public int DeNghi { get; set; }

        [DataInfo]
        public int ThietHaiUocTinh { get; set; }

        [DataInfo]
        public DateTime? Published { get; set; }

        [DataInfo]
        public DateTime? Published1 { get; set; }

        [DataInfo]
        public int Order { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        #endregion      
  
        private ModUserEntity _oUser = null;
        public ModUserEntity getUser()
        {
            if (_oUser == null && UserID > 0)
                _oUser = ModUserService.Instance.GetByID(UserID);

            if (_oUser == null)
                _oUser = new ModUserEntity();

            return _oUser;
        }      
  
        private ModBaoCaoTongHopEntity _oBaoCaoTongHop = null;
        public ModBaoCaoTongHopEntity getBaoCaoTongHop()
        {
            if (_oBaoCaoTongHop == null && BaoCaoTongHopID > 0)
                _oBaoCaoTongHop = ModBaoCaoTongHopService.Instance.GetByID(BaoCaoTongHopID);

            if (_oBaoCaoTongHop == null)
                _oBaoCaoTongHop = new ModBaoCaoTongHopEntity();

            return _oBaoCaoTongHop;
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

    public class ModSoLuongSuCoService : ServiceBase<ModSoLuongSuCoEntity>
    {

        #region Autogen by HL

        private ModSoLuongSuCoService()
            : base("[Mod_SoLuongSuCo]")
        {

        }

        private static ModSoLuongSuCoService _Instance = null;
        public static ModSoLuongSuCoService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModSoLuongSuCoService();

                return _Instance;
            }
        }

        #endregion

        public ModSoLuongSuCoEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}