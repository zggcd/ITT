using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModUserResetPassEntity : EntityBase
    {
        
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int UserID { get; set; }

        [DataInfo]
        public string LoginName { get; set; }

        [DataInfo]
        public string Email { get; set; }

        [DataInfo]
        public string Phone { get; set; }

        [DataInfo]
        public DateTime TimeReset { get; set; }

        [DataInfo]
        public string PassReset { get; set; }

        [DataInfo]
        public bool StateSend { get; set; }

        #endregion      
  
        //private ModUserEntity _oUser = null;
        //public ModUserEntity getUser()
        //{
        //    if (_oUser == null && UserID > 0)
        //        _oUser = ModUserService.Instance.GetByID(UserID);

        //    if (_oUser == null)
        //        _oUser = new ModUserEntity();

        //    return _oUser;
        //}

    }

    public class ModUserResetPassService : ServiceBase<ModUserResetPassEntity>
    {

        #region Autogen by HL

        private ModUserResetPassService()
            : base("[Mod_UserResetPass]")
        {

        }

        private static ModUserResetPassService _Instance = null;
        public static ModUserResetPassService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModUserResetPassService();

                return _Instance;
            }
        }

        #endregion

        public ModUserResetPassEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}