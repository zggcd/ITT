using HL.Core.Interface;
using HL.Core.Models;

namespace HL.Lib.Models
{
    public class SysModuleEntity : EntityBase, IModuleInterface
    {
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public string Layout { get; set; }

        [DataInfo]
        public string Type { get; set; }

        [DataInfo]
        public string TypeName { get; set; }

        [DataInfo]
        public string AssemblyName { get; set; }

        [DataInfo]
        public int Order { get; set; }

        #endregion
    }

    public class SysModuleService : ServiceBase<SysModuleEntity>, IModuleServiceInterface
    {
        #region Autogen by HL

        public SysModuleService() : base("[Sys_Module]")
        {
        }

        private static SysModuleService _Instance = null;
        public static SysModuleService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new SysModuleService();

                return _Instance;
            }
        }

        #endregion

        public SysModuleEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

        #region IModuleServiceInterface Members

        public IModuleInterface HL_Core_GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle_Cache();
        }

        public IModuleInterface HL_Core_GetByCode(string code)
        {
            return base.CreateQuery()
               .Where(o => o.Code == code)
               .ToSingle_Cache();
        }

        #endregion
    }
}
