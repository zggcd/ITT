using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModBaoCaoHoTroPhoiHopSuCoEntity : EntityBase
    {
        #region Code by NQT

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int BaoCaoSuCoID { get; set; }

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
        public string ToChuc_Ten { get; set; }

        [DataInfo]
        public string ToChuc_DiaChi { get; set; }

        [DataInfo]
        public string ToChuc_DienThoai { get; set; }

        [DataInfo]
        public string ToChuc_Email { get; set; }

        [DataInfo]
        public string ChiTiet_MoTa { get; set; }

        [DataInfo]
        public DateTime ChiTiet_NgayTao { get; set; }

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

        private CPUserEntity _oUser1 = null;
        public CPUserEntity getUser1()
        {
            if (_oUser1 == null && UserID > 0)
                _oUser1 = CPUserService.Instance.GetByID(UserID);

            if (_oUser1 == null)
                _oUser1 = new CPUserEntity();

            return _oUser1;
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


    public class ModBaoCaoHoTroPhoiHopSuCoService : ServiceBase<ModBaoCaoHoTroPhoiHopSuCoEntity>
    {

        #region Code by NQT

        private ModBaoCaoHoTroPhoiHopSuCoService()
            : base("[Mod_BaoCaoHoTroPhoiHopSuCo]")
        {

        }

        private static ModBaoCaoHoTroPhoiHopSuCoService _Instance = null;
        public static ModBaoCaoHoTroPhoiHopSuCoService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModBaoCaoHoTroPhoiHopSuCoService();

                return _Instance;
            }
        }

        #endregion

        public ModBaoCaoHoTroPhoiHopSuCoEntity GetByID(int id)
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
