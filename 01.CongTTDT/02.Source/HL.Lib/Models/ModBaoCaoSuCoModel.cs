using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModBaoCaoSuCoEntity : EntityBase
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
        public string Address { get; set; }

        [DataInfo]
        public string Phone { get; set; }

        [DataInfo]
        public string Email { get; set; }

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

    public class ModBaoCaoSuCoService : ServiceBase<ModBaoCaoSuCoEntity>
    {

        #region Autogen by HL

        private ModBaoCaoSuCoService()
            : base("[Mod_BaoCaoSuCo]")
        {

        }

        private static ModBaoCaoSuCoService _Instance = null;
        public static ModBaoCaoSuCoService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModBaoCaoSuCoService();

                return _Instance;
            }
        }

        #endregion

        public ModBaoCaoSuCoEntity GetByID(int id)
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