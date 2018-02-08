using HL.Core.Models;

namespace HL.Lib.Models
{
    public class CPUserRoleEntity : EntityBase
    {
        #region Autogen by HL

        [DataInfo]
        public int UserID { get; set; }

        [DataInfo]
        public int RoleID { get; set; }

        #endregion
    }

    public class CPUserRoleService : ServiceBase<CPUserRoleEntity>
    {
        #region Autogen by HL

        public CPUserRoleService() : base("[CP_UserRole]")
        {
        }

        private static CPUserRoleService _Instance = null;
        public static CPUserRoleService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new CPUserRoleService();

                return _Instance;
            }
        }

        #endregion
    }
}
