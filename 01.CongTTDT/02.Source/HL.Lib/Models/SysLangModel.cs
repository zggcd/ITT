using HL.Core.Interface;
using HL.Core.Models;

namespace HL.Lib.Models
{
    public class SysLangEntity : EntityBase, ILangInterface
    {
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        #endregion
    }

    public class SysLangService : ServiceBase<SysLangEntity>, ILangServiceInterface
    {
        #region Autogen by HL

        public SysLangService() : base("[Sys_Lang]")
        {
        }

        private static SysLangService _Instance = null;
        public static SysLangService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new SysLangService();

                return _Instance;
            }
        }

        #endregion

        public SysLangEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

        #region ILangServiceInterface Members

        public ILangInterface HL_Core_GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle_Cache();
        }

        #endregion
    }
}
