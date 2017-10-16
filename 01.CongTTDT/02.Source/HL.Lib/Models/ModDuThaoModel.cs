using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModDuThaoEntity : EntityBase
    {
        
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public string Content { get; set; }

        [DataInfo]
        public string File { get; set; }

        [DataInfo]
        public DateTime StartDate { get; set; }

        [DataInfo]
        public DateTime FinishDate { get; set; }

        [DataInfo]
        public DateTime Published { get; set; }

        [DataInfo]
        public int Order { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        #endregion

    }

    public class ModDuThaoService : ServiceBase<ModDuThaoEntity>
    {

        #region Autogen by HL

        private ModDuThaoService()
            : base("[Mod_DuThao]")
        {

        }

        private static ModDuThaoService _Instance = null;
        public static ModDuThaoService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModDuThaoService();

                return _Instance;
            }
        }

        #endregion

        public ModDuThaoEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}