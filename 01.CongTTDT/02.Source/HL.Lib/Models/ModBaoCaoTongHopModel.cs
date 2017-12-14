using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModBaoCaoTongHopEntity : EntityBase
    {
        
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

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
        public DateTime TuNgay { get; set; }

        [DataInfo]
        public DateTime DenNgay { get; set; }

        [DataInfo]
        public string TenToChuc { get; set; }

        [DataInfo]
        public string DiaChi { get; set; }

        [DataInfo]
        public string MaThanhVien { get; set; }

        [DataInfo]
        public string ToChucHoTro { get; set; }

        [DataInfo]
        public string ToChucNuocNgoaiHoTro { get; set; }

        [DataInfo]
        public string DeXuat { get; set; }

        [DataInfo]
        public DateTime Published { get; set; }

        [DataInfo]
        public DateTime Published1 { get; set; }

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

    public class ModBaoCaoTongHopService : ServiceBase<ModBaoCaoTongHopEntity>
    {

        #region Autogen by HL

        private ModBaoCaoTongHopService()
            : base("[Mod_BaoCaoTongHop]")
        {

        }

        private static ModBaoCaoTongHopService _Instance = null;
        public static ModBaoCaoTongHopService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModBaoCaoTongHopService();

                return _Instance;
            }
        }

        #endregion

        public ModBaoCaoTongHopEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}