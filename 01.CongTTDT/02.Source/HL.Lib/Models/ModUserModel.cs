using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModUserEntity : EntityBase
    {
        
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public int CoQuanID { get; set; }

        [DataInfo]
        public string Address { get; set; }

        [DataInfo]
        public string Phone { get; set; }

        [DataInfo]
        public string Email { get; set; }

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
  
        private ModCoQuanEntity _oCoQuan = null;
        public ModCoQuanEntity getCoQuan()
        {
            if (_oCoQuan == null && CoQuanID > 0)
                _oCoQuan = ModCoQuanService.Instance.GetByID(CoQuanID);

            if (_oCoQuan == null)
                _oCoQuan = new ModCoQuanEntity();

            return _oCoQuan;
        }

    }

    public class ModUserService : ServiceBase<ModUserEntity>
    {

        #region Autogen by HL

        private ModUserService()
            : base("[Mod_User]")
        {

        }

        private static ModUserService _Instance = null;
        public static ModUserService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModUserService();

                return _Instance;
            }
        }

        #endregion

        public ModUserEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}