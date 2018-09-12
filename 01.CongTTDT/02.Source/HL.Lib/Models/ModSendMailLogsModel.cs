using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModSendMailLogsEntity : EntityBase
    {
        
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int DichVuCanhBaoID { get; set; }

        [DataInfo]
        public string IncidentIDs { get; set; }

        [DataInfo]
        public string EmailFrom { get; set; }

        [DataInfo]
        public string EmailTo { get; set; }

        [DataInfo]
        public string EmailCc { get; set; }

        [DataInfo]
        public string EmailBcc { get; set; }

        [DataInfo]
        public string AttachFilePath { get; set; }

        [DataInfo]
        public string Subject { get; set; }

        [DataInfo]
        public string Body { get; set; }

        [DataInfo]
        public DateTime Publish { get; set; }

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

    }

    public class ModSendMailLogsService : ServiceBase<ModSendMailLogsEntity>
    {

        #region Autogen by HL

        private ModSendMailLogsService()
            : base("[Mod_SendMailLogs]")
        {

        }

        private static ModSendMailLogsService _Instance = null;
        public static ModSendMailLogsService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModSendMailLogsService();

                return _Instance;
            }
        }

        #endregion

        public ModSendMailLogsEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}