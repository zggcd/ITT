using System;
using System.Collections.Generic;
using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModThongBaoSuCoEntity : EntityBase
    {

        #region Code by NQT

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int UserID { get; set; }

        [DataInfo]
        public int UserID1 { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public int State { get; set; }

        [DataInfo]
        public string ToChuc_Ten { get; set; }

        [DataInfo]
        public string ToChuc_DiaChi { get; set; }

        [DataInfo]
        public string ChiTiet_TenDonVi { get; set; }

        [DataInfo]
        public string ChiTiet_CoQuan { get; set; }

        [DataInfo]
        public string ChiTiet_TenHeThong { get; set; }

        [DataInfo]
        public string ChiTiet_MoTa { get; set; }

        [DataInfo]
        public DateTime? ChiTiet_NgayGioPhatHien { get; set; }

        [DataInfo]
        public string ChiTiet_KetQua { get; set; }

        [DataInfo]
        public string ChiTiet_KienNghi { get; set; }

        [DataInfo]
        public DateTime CreatedDate { get; set; }

        [DataInfo]
        public DateTime? UpdatedDate { get; set; }

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

        private CPUserEntity _oThanhVien = null;
        public CPUserEntity getThanhVien()
        {
            if (_oThanhVien == null && UserID > 0)
                _oThanhVien = CPUserService.Instance.GetByID(UserID);

            if (_oThanhVien == null)
                _oThanhVien = new CPUserEntity();

            return _oThanhVien;
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

    public class ModThongBaoSuCoService : ServiceBase<ModThongBaoSuCoEntity>
    {

        #region Autogen by HL

        private ModThongBaoSuCoService()
            : base("[Mod_ThongBaoSuCo]")
        {

        }

        private static ModThongBaoSuCoService _Instance = null;
        public static ModThongBaoSuCoService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModThongBaoSuCoService();

                return _Instance;
            }
        }

        #endregion

        public ModThongBaoSuCoEntity GetByID(int id)
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
