using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModDauMoiUCSCEntity : EntityBase
    {

        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int HSThanhVienUCSCID { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public int State { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public string ChucVu { get; set; }

        [DataInfo]
        public string DiaChi { get; set; }

        [DataInfo]
        public string DienThoai { get; set; }

        [DataInfo]
        public string DienThoaiDD { get; set; }

        [DataInfo]
        public string Fax { get; set; }

        [DataInfo]
        public string Email { get; set; }

        [DataInfo]
        public DateTime Published { get; set; }

        [DataInfo]
        public int Order { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        #endregion

        private ModHSThanhVienUCSCEntity _oHs = null;
        public ModHSThanhVienUCSCEntity getHoSo()
        {
            if (_oHs == null && HSThanhVienUCSCID > 0)
                _oHs = ModHSThanhVienUCSCService.Instance.GetByID(HSThanhVienUCSCID);

            if (_oHs == null)
                _oHs = new ModHSThanhVienUCSCEntity();

            return _oHs;
        }

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

    public class ModDauMoiUCSCService : ServiceBase<ModDauMoiUCSCEntity>
    {

        #region Autogen by HL

        private ModDauMoiUCSCService()
            : base("[Mod_DauMoiUCSC]")
        {

        }

        private static ModDauMoiUCSCService _Instance = null;
        public static ModDauMoiUCSCService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModDauMoiUCSCService();

                return _Instance;
            }
        }

        #endregion

        public ModDauMoiUCSCEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}