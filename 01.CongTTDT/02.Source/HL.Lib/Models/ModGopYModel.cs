using System;
using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModGopYEntity : EntityBase
    {

        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int DuThaoID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Address { get; set; }

        [DataInfo]
        public string Phone { get; set; }

        [DataInfo]
        public string Mobile { get; set; }

        [DataInfo]
        public string Email { get; set; }

        [DataInfo]
        public string Title { get; set; }

        [DataInfo]
        public string Content { get; set; }

        [DataInfo]
        public string Files { get; set; }

        [DataInfo]
        public string IP { get; set; }

        [DataInfo]
        public DateTime? Published { get; set; }

        [DataInfo]
        public int Order { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        #endregion

        private ModDuThaoEntity _oDuThao = null;
        public ModDuThaoEntity getDuThao()
        {
            if (_oDuThao == null && DuThaoID > 0)
                _oDuThao = ModDuThaoService.Instance.GetByID(DuThaoID);

            if (_oDuThao == null)
                _oDuThao = new ModDuThaoEntity();

            return _oDuThao;
        }

    }

    public class ModGopYService : ServiceBase<ModGopYEntity>
    {

        #region Autogen by HL

        private ModGopYService()
            : base("[Mod_GopY]")
        {

        }

        private static ModGopYService _Instance = null;
        public static ModGopYService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModGopYService();

                return _Instance;
            }
        }

        #endregion

        public ModGopYEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}