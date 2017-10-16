using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModOnlineEntity : EntityBase
    {
        #region Autogen by HL

        [DataInfo]
        public long TimeValue { get; set; }

        [DataInfo]
        public string SessionID { get; set; }

        #endregion

    }

    public class ModOnlineService : ServiceBase<ModOnlineEntity>
    {
        #region Autogen by HL

        public ModOnlineService() : base("[Mod_Online]")
        {
        }

        private static ModOnlineService _Instance = null;
        public static ModOnlineService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModOnlineService();

                return _Instance;
            }
        }

        #endregion

        public ModOnlineEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }
    }
}
