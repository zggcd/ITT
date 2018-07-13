using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModEmailTemplateEntity : EntityBase
    {
        
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public string Subject { get; set; }

        [DataInfo]
        public string Content { get; set; }

        [DataInfo]
        public int Order { get; set; }

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

    }

    public class ModEmailTemplateService : ServiceBase<ModEmailTemplateEntity>
    {

        #region Autogen by HL

        private ModEmailTemplateService()
            : base("[Mod_EmailTemplate]")
        {

        }

        private static ModEmailTemplateService _Instance = null;
        public static ModEmailTemplateService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModEmailTemplateService();

                return _Instance;
            }
        }

        #endregion

        public ModEmailTemplateEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}