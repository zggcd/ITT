using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModImportLogsEntity : EntityBase
    {

        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public string FileName { get; set; }

        [DataInfo]
        public string Messages { get; set; }

        [DataInfo]
        public string ErrorRows { get; set; }

        [DataInfo]
        public DateTime Publish { get; set; }

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

    public class ModImportLogsService : ServiceBase<ModImportLogsEntity>
    {

        #region Autogen by HL

        private ModImportLogsService()
            : base("[Mod_ImportLogs]")
        {

        }

        private static ModImportLogsService _Instance = null;
        public static ModImportLogsService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModImportLogsService();

                return _Instance;
            }
        }

        #endregion

        public ModImportLogsEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}