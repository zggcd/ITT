using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModISPEntity : EntityBase
    {
        
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public string Email { get; set; }

        [DataInfo]
        public DateTime Updated { get; set; }

        [DataInfo]
        public int Order { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        #endregion

    }

    public class ModISPService : ServiceBase<ModISPEntity>
    {

        #region Autogen by HL

        private ModISPService()
            : base("[Mod_ISP]")
        {

        }

        private static ModISPService _Instance = null;
        public static ModISPService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModISPService();

                return _Instance;
            }
        }

        #endregion

        public ModISPEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}