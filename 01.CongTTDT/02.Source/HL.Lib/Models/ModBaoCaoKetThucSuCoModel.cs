using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModBaoCaoKetThucSuCoEntity : EntityBase
    {

        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int BaoCaoSuCoID { get; set; }

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
        public string SoKyHieu { get; set; }

        [DataInfo]
        public DateTime NgayBaoCao { get; set; }

        [DataInfo]
        public string ChiTiet_TenDonVi { get; set; }

        [DataInfo]
        public string ChiTiet_CoQuan { get; set; }

        [DataInfo]
        public string ChiTiet_TenHeThong { get; set; }

        [DataInfo]
        public int ChiTiet_PhanLoaiID { get; set; }

        [DataInfo]
        public string Summary { get; set; }

        [DataInfo]
        public DateTime NgayGioPhatHien { get; set; }

        [DataInfo]
        public string KetQua { get; set; }

        [DataInfo]
        public string Files { get; set; }

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

    }

    public class ModBaoCaoKetThucSuCoService : ServiceBase<ModBaoCaoKetThucSuCoEntity>
    {

        #region Autogen by HL

        private ModBaoCaoKetThucSuCoService()
            : base("[Mod_BaoCaoKetThucSuCo]")
        {

        }

        private static ModBaoCaoKetThucSuCoService _Instance = null;
        public static ModBaoCaoKetThucSuCoService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModBaoCaoKetThucSuCoService();

                return _Instance;
            }
        }

        #endregion

        public ModBaoCaoKetThucSuCoEntity GetByID(int id)
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