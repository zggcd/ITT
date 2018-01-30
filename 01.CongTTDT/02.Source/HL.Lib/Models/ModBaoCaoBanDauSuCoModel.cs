using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModBaoCaoBanDauSuCoEntity : EntityBase
    {

        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int UserID { get; set; }

        [DataInfo]
        public int UserID1 { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public int State { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public string ToChuc_Ten { get; set; }

        [DataInfo]
        public string ToChuc_DiaChi { get; set; }

        [DataInfo]
        public string ToChuc_DienThoai { get; set; }

        [DataInfo]
        public string ToChuc_Email { get; set; }

        [DataInfo]
        public string NguoiLienHe_Ten { get; set; }

        [DataInfo]
        public string NguoiLienHe_ChucVu { get; set; }

        [DataInfo]
        public string NguoiLienHe_DienThoai { get; set; }

        [DataInfo]
        public string NguoiLienHe_Email { get; set; }

        [DataInfo]
        public string ChiTiet_TenDonVi { get; set; }

        [DataInfo]
        public string ChiTiet_CoQuan { get; set; }

        [DataInfo]
        public string ChiTiet_TenHeThong { get; set; }

        [DataInfo]
        public int ChiTiet_PhanLoaiID { get; set; }

        [DataInfo]
        public string ChiTiet_TenToChucCungCap { get; set; }

        [DataInfo]
        public string ChiTiet_TenNCC_BenNgoai { get; set; }

        [DataInfo]
        public string ChiTiet_TenNCC { get; set; }

        [DataInfo]
        public string ChiTiet_MoTa { get; set; }

        [DataInfo]
        public DateTime ChiTiet_NgayGioPhatHien { get; set; }

        [DataInfo]
        public int HienTrangID { get; set; }

        [DataInfo]
        public string TTThem_HeDieuHanh { get; set; }

        [DataInfo]
        public string TTThem_Version { get; set; }

        [DataInfo]
        public string TTThem_DanhSachIP { get; set; }

        [DataInfo]
        public string TTThem_DanhSachTenMien { get; set; }

        [DataInfo]
        public string TTThem_MucDichSuDung { get; set; }

        [DataInfo]
        public bool GiuBiMat { get; set; }

        [DataInfo]
        public string Content { get; set; }

        [DataInfo]
        public DateTime ThoiGianThucHien { get; set; }

        [DataInfo]
        public DateTime Published { get; set; }

        [DataInfo]
        public DateTime Published1 { get; set; }

        [DataInfo]
        public int Order { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        #endregion

        private ModUserEntity _oUser = null;
        public ModUserEntity getUser()
        {
            if (_oUser == null && UserID > 0)
                _oUser = ModUserService.Instance.GetByID(UserID);

            if (_oUser == null)
                _oUser = new ModUserEntity();

            return _oUser;
        }

        private CPUserEntity _oUser1 = null;
        public CPUserEntity getUser1()
        {
            if (_oUser1 == null && UserID > 0)
                _oUser1 = CPUserService.Instance.GetByID(UserID);

            if (_oUser1 == null)
                _oUser1 = new CPUserEntity();

            return _oUser1;
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

        private WebMenuEntity _oChiTiet_PhanLoai = null;
        public WebMenuEntity getChiTiet_PhanLoai()
        {
            if (_oChiTiet_PhanLoai == null && ChiTiet_PhanLoaiID > 0)
                _oChiTiet_PhanLoai = WebMenuService.Instance.GetByID_Cache(ChiTiet_PhanLoaiID);

            if (_oChiTiet_PhanLoai == null)
                _oChiTiet_PhanLoai = new WebMenuEntity();

            return _oChiTiet_PhanLoai;
        }

        private WebMenuEntity _oHienTrang = null;
        public WebMenuEntity getHienTrang()
        {
            if (_oHienTrang == null && HienTrangID > 0)
                _oHienTrang = WebMenuService.Instance.GetByID_Cache(HienTrangID);

            if (_oHienTrang == null)
                _oHienTrang = new WebMenuEntity();

            return _oHienTrang;
        }

    }

    public class ModBaoCaoBanDauSuCoService : ServiceBase<ModBaoCaoBanDauSuCoEntity>
    {

        #region Autogen by HL

        private ModBaoCaoBanDauSuCoService()
            : base("[Mod_BaoCaoBanDauSuCo]")
        {

        }

        private static ModBaoCaoBanDauSuCoService _Instance = null;
        public static ModBaoCaoBanDauSuCoService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModBaoCaoBanDauSuCoService();

                return _Instance;
            }
        }

        #endregion

        public ModBaoCaoBanDauSuCoEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

        public int GetMaxID()
        {
            return base.CreateQuery()
                    .Max(o => o.ID)
                    .ToValue().ToInt(0) + 1;
        }

    }
}