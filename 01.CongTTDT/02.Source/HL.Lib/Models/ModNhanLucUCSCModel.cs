using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModNhanLucUCSCEntity : EntityBase
    {

        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int DonDangKyUCSCID { get; set; }

        [DataInfo]
        public int HSThanhVienUCSCID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string School { get; set; }

        [DataInfo]
        public string MenuIDs_LinhVucDT { get; set; }

        [DataInfo]
        public string MenuIDs_TrinhDoDT { get; set; }

        [DataInfo]
        public string MenuIDs_ChungChi { get; set; }

        [DataInfo]
        public string MenuIDs_QuanLyATTT { get; set; }

        [DataInfo]
        public string MenuIDs_KyThuatPhongThu { get; set; }

        [DataInfo]
        public string MenuIDs_KyThuatBaoVe { get; set; }

        [DataInfo]
        public string MenuIDs_KyThuatKiemTra { get; set; }

        [DataInfo]
        public int ThangTotNghiep { get; set; }

        [DataInfo]
        public int NamTotNghiep { get; set; }

        [DataInfo]
        public DateTime? Published { get; set; }

        [DataInfo]
        public int Order { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        #endregion

        private ModDonDangKyUCSCEntity _oDonDangKyUCSC = null;
        public ModDonDangKyUCSCEntity getDonDangKyUCSC()
        {
            if (_oDonDangKyUCSC == null && DonDangKyUCSCID > 0)
                _oDonDangKyUCSC = ModDonDangKyUCSCService.Instance.GetByID(DonDangKyUCSCID);

            if (_oDonDangKyUCSC == null)
                _oDonDangKyUCSC = new ModDonDangKyUCSCEntity();

            return _oDonDangKyUCSC;
        }

        private ModHSThanhVienUCSCEntity _oHSThanhVienUCSC = null;
        public ModHSThanhVienUCSCEntity getModHSThanhVienUCSC()
        {
            if (_oHSThanhVienUCSC == null && HSThanhVienUCSCID > 0)
                _oHSThanhVienUCSC = ModHSThanhVienUCSCService.Instance.GetByID(HSThanhVienUCSCID);

            if (_oHSThanhVienUCSC == null)
                _oHSThanhVienUCSC = new ModHSThanhVienUCSCEntity();

            return _oHSThanhVienUCSC;
        }

        private List<WebMenuEntity> _oMenuTrinhDo = null;
        public List<WebMenuEntity> getMenuTrinhDo()
        {
            if (_oMenuTrinhDo == null)
                _oMenuTrinhDo = WebMenuService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && string.IsNullOrEmpty(MenuIDs_TrinhDoDT) == false)
                    .WhereIn(!string.IsNullOrEmpty(MenuIDs_TrinhDoDT), o => o.ID, MenuIDs_TrinhDoDT)
                    .ToList();

            if (_oMenuTrinhDo == null)
                _oMenuTrinhDo = new List<WebMenuEntity>();

            return _oMenuTrinhDo;
        }

        private List<WebMenuEntity> _oMenuChungChi = null;
        public List<WebMenuEntity> getMenuChungChi()
        {
            if (_oMenuChungChi == null)
                _oMenuChungChi = WebMenuService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && string.IsNullOrEmpty(MenuIDs_ChungChi) == false)
                    .WhereIn(!string.IsNullOrEmpty(MenuIDs_ChungChi), o => o.ID, MenuIDs_ChungChi)
                    .ToList();

            if (_oMenuChungChi == null)
                _oMenuChungChi = new List<WebMenuEntity>();

            return _oMenuChungChi;
        }

    }

    public class ModNhanLucUCSCService : ServiceBase<ModNhanLucUCSCEntity>
    {

        #region Autogen by HL

        private ModNhanLucUCSCService()
            : base("[Mod_NhanLucUCSC]")
        {

        }

        private static ModNhanLucUCSCService _Instance = null;
        public static ModNhanLucUCSCService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModNhanLucUCSCService();

                return _Instance;
            }
        }

        #endregion

        public ModNhanLucUCSCEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}