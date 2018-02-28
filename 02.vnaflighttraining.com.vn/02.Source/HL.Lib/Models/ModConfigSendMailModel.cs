using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModConfigSendMailEntity : EntityBase
    {
        
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int MailType { get; set; }

        [DataInfo]
        public string SmtpUser { get; set; }

        [DataInfo]
        public string SmtpPass { get; set; }

        [DataInfo]
        public string SmtpServer { get; set; }

        [DataInfo]
        public int SmtpPort { get; set; }

        [DataInfo]
        public bool SmtpSSL { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Content { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        [DataInfo]
        public string ToMail { get; set; }

        #endregion

    }

    public class ModConfigSendMailService : ServiceBase<ModConfigSendMailEntity>
    {

        #region Autogen by HL

        private ModConfigSendMailService()
            : base("[Mod_ConfigSendMail]")
        {

        }

        private static ModConfigSendMailService _Instance = null;
        public static ModConfigSendMailService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModConfigSendMailService();

                return _Instance;
            }
        }

        #endregion

        public ModConfigSendMailEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}