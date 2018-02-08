using HL.Core.Interface;
using HL.Core.Models;

namespace HL.Lib.Models
{
    public class SysTemplateEntity : EntityBase, ITemplateInterface
    {
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int LangID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string File { get; set; }

        [DataInfo]
        public string Custom { get; set; }

        [DataInfo]
        public int Order { get; set; }

        #endregion
    }

    public class SysTemplateService : ServiceBase<SysTemplateEntity>, ITemplateServiceInterface
    {
        #region Autogen by HL

        public SysTemplateService() : base("[Sys_Template]")
        {
        }

        private static SysTemplateService _Instance = null;
        public static SysTemplateService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new SysTemplateService();

                return _Instance;
            }
        }

        #endregion

        public SysTemplateEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

        #region ITemplateServiceInterface Members

        public ITemplateInterface HL_Core_GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle_Cache();
        }

        public void HL_Core_CPSave(ITemplateInterface entity)
        {
            base.Save(entity as SysTemplateEntity);
        }

        #endregion
    }
}
