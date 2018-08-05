using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModDichVuCanhBaoIPEntity : EntityBase
    {
        
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int DichVuCanhBaoID { get; set; }

        [DataInfo]
        public int UserID { get; set; }

        [DataInfo]
        public int UserID1 { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public DateTime? Published { get; set; }

        [DataInfo]
        public DateTime? Published1 { get; set; }

        [DataInfo]
        public int Order { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        #endregion      
  
        private ModDichVuCanhBaoEntity _oDichVuCanhBao = null;
        public ModDichVuCanhBaoEntity getDichVuCanhBao()
        {
            if (_oDichVuCanhBao == null && DichVuCanhBaoID > 0)
                _oDichVuCanhBao = ModDichVuCanhBaoService.Instance.GetByID(DichVuCanhBaoID);

            if (_oDichVuCanhBao == null)
                _oDichVuCanhBao = new ModDichVuCanhBaoEntity();

            return _oDichVuCanhBao;
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

    public class ModDichVuCanhBaoIPService : ServiceBase<ModDichVuCanhBaoIPEntity>
    {

        #region Autogen by HL

        private ModDichVuCanhBaoIPService()
            : base("[Mod_DichVuCanhBaoIP]")
        {

        }

        private static ModDichVuCanhBaoIPService _Instance = null;
        public static ModDichVuCanhBaoIPService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModDichVuCanhBaoIPService();

                return _Instance;
            }
        }

        #endregion

        public ModDichVuCanhBaoIPEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}