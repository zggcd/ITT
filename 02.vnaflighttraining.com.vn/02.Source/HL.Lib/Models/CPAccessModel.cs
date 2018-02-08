using HL.Core.Models;

namespace HL.Lib.Models
{
    public class CPAccessEntity : EntityBase
    {
        #region Autogen by HL

        [DataInfo]
        public int RefID { get; set; }

        [DataInfo]
        public int RoleID { get; set; }

        [DataInfo]
        public int UserID { get; set; }

        [DataInfo]
        public string Type { get; set; }

        [DataInfo]
        public int Value { get; set; }

        #endregion
    }

    public class CPAccessService : ServiceBase<CPAccessEntity>
    {
        #region Autogen by HL

        public CPAccessService() : base("[CP_Access]")
        {
        }

        private static CPAccessService _Instance = null;
        public static CPAccessService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new CPAccessService();

                return _Instance;
            }
        }

        #endregion

        public CPAccessEntity GetByUser(string type, int ref_id, int user_id)
        {
            return base.CreateQuery()
                .Where(o => o.UserID == user_id && o.RefID == ref_id && o.Type == type)
                .ToSingle();
        }

        public CPAccessEntity GetByRole(string type, int ref_id, int role_id)
        {
            return base.CreateQuery()
                .Where(o => o.RoleID == role_id && o.RefID == ref_id && o.Type == type)
                .ToSingle();
        }
    }
}
