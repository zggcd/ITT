using HL.Core.Models;

namespace HL.Lib.Models
{
    public class CPModuleEntity : EntityBase
    {
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public int Access { get; set; }

        [DataInfo]
        public int Order { get; set; }

        #endregion
    }

    public class CPModuleService : ServiceBase<CPModuleEntity>
    {
        #region Autogen by HL

        public CPModuleService() : base("[CP_Module]")
        {
        }

        private static CPModuleService _Instance = null;
        public static CPModuleService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new CPModuleService();

                return _Instance;
            }
        }

        #endregion
    }
}
