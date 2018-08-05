using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModDataBackupEntity : EntityBase
    {
        
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public string Url { get; set; }

        [DataInfo]
        public DateTime? Published { get; set; }

        #endregion

    }

    public class ModDataBackupService : ServiceBase<ModDataBackupEntity>
    {

        #region Autogen by HL

        private ModDataBackupService()
            : base("[Mod_DataBackup]")
        {

        }

        private static ModDataBackupService _Instance = null;
        public static ModDataBackupService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModDataBackupService();

                return _Instance;
            }
        }

        #endregion

        public ModDataBackupEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}