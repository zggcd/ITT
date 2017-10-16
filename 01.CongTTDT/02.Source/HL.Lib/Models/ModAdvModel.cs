using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModAdvEntity : EntityBase
    {
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string AdvCode { get; set; }

        [DataInfo]
        public string File { get; set; }

        [DataInfo]
        public int Width { get; set; }

        [DataInfo]
        public int Height { get; set; }

        [DataInfo]
        public string AddInTag { get; set; }

        [DataInfo]
        public string URL { get; set; }

        [DataInfo]
        public string Target { get; set; }

        [DataInfo]
        public int Order { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        #endregion

        private WebMenuEntity _oMenu = null;
        public WebMenuEntity getMenu()
        {
            if (_oMenu == null && MenuID > 0)
                _oMenu = WebMenuService.Instance.GetByID_Cache(MenuID);

            if (_oMenu == null)
                _oMenu = new WebMenuEntity();

            return _oMenu;
        }
    }

    public class ModAdvService : ServiceBase<ModAdvEntity>
    {
        #region Autogen by HL

        public ModAdvService() : base("[Mod_Adv]")
        {
        }

        private static ModAdvService _Instance = null;
        public static ModAdvService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModAdvService();

                return _Instance;
            }
        }

        #endregion

        public ModAdvEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }
    }
}
