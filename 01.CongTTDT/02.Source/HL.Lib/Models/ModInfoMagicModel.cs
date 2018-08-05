using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModInfoMagicEntity : EntityBase
    {
        
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int BaoCaoBanDauSuCoID { get; set; }

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
  
        private ModBaoCaoBanDauSuCoEntity _oBaoCaoBanDauSuCo = null;
        public ModBaoCaoBanDauSuCoEntity getBaoCaoBanDauSuCo()
        {
            if (_oBaoCaoBanDauSuCo == null && BaoCaoBanDauSuCoID > 0)
                _oBaoCaoBanDauSuCo = ModBaoCaoBanDauSuCoService.Instance.GetByID(BaoCaoBanDauSuCoID);

            if (_oBaoCaoBanDauSuCo == null)
                _oBaoCaoBanDauSuCo = new ModBaoCaoBanDauSuCoEntity();

            return _oBaoCaoBanDauSuCo;
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

    public class ModInfoMagicService : ServiceBase<ModInfoMagicEntity>
    {

        #region Autogen by HL

        private ModInfoMagicService()
            : base("[Mod_InfoMagic]")
        {

        }

        private static ModInfoMagicService _Instance = null;
        public static ModInfoMagicService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModInfoMagicService();

                return _Instance;
            }
        }

        #endregion

        public ModInfoMagicEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}