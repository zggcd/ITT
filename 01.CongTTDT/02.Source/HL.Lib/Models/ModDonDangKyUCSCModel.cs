using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModDonDangKyUCSCEntity : EntityBase
    {

        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int ParentID { get; set; }

        [DataInfo]
        public bool IsGOV { get; set; }

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
        public string ToChuc_Fax { get; set; }

        [DataInfo]
        public string ToChuc_Email { get; set; }

        [DataInfo]
        public string Content { get; set; }

        [DataInfo]
        public string File { get; set; }

        [DataInfo]
        public string IPs { get; set; }

        [DataInfo]
        public string ThongTinLL_Web { get; set; }

        [DataInfo]
        public string ThongTinLL_ThuDT_Ten { get; set; }

        [DataInfo]
        public string ThongTinLL_ThuDT_Fingerprint { get; set; }

        [DataInfo]
        public string ThongTinLL_ThuDT_LinkToPublicKey { get; set; }

        [DataInfo]
        public string DauMoiLL_TrongGio_Ten { get; set; }

        [DataInfo]
        public string DauMoiLL_TrongGio_DienThoai { get; set; }

        [DataInfo]
        public string DauMoiLL_TrongGio_DienThoaiDD { get; set; }

        [DataInfo]
        public string DauMoiLL_TrongGio_Fax { get; set; }

        [DataInfo]
        public string DauMoiLL_NgoaiGio_Ten { get; set; }

        [DataInfo]
        public string DauMoiLL_NgoaiGio_DienThoai { get; set; }

        [DataInfo]
        public string DauMoiLL_NgoaiGio_DienThoaiDD { get; set; }

        [DataInfo]
        public string DauMoiLL_NgoaiGio_Fax { get; set; }

        [DataInfo]
        public string DauMoiLanhDao_Ten { get; set; }

        [DataInfo]
        public string DauMoiLanhDao_DienThoai { get; set; }

        [DataInfo]
        public string DauMoiLanhDao_DienThoaiDD { get; set; }

        [DataInfo]
        public string DCNhanThu_TenBoPhan { get; set; }

        [DataInfo]
        public string DCNhanThu_ViTri { get; set; }

        [DataInfo]
        public string DCNhanThu_TenToChuc { get; set; }

        [DataInfo]
        public string DCNhanThu_DiaChi { get; set; }

        [DataInfo]
        public string DCNhanThu_DienThoai { get; set; }

        [DataInfo]
        public string LLKhac_Yahoo { get; set; }

        [DataInfo]
        public string LLKhac_Skype { get; set; }

        [DataInfo]
        public string LLKhac_GoogleTalk { get; set; }

        [DataInfo]
        public string LLKhac_Hotmail { get; set; }

        [DataInfo]
        public string LLKhac_Khac { get; set; }

        [DataInfo]
        public DateTime? Published { get; set; }

        [DataInfo]
        public DateTime? Published1 { get; set; }

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

    }

    public class ModDonDangKyUCSCService : ServiceBase<ModDonDangKyUCSCEntity>
    {

        #region Autogen by HL

        private ModDonDangKyUCSCService()
            : base("[Mod_DonDangKyUCSC]")
        {

        }

        private static ModDonDangKyUCSCService _Instance = null;
        public static ModDonDangKyUCSCService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModDonDangKyUCSCService();

                return _Instance;
            }
        }

        #endregion

        public ModDonDangKyUCSCEntity GetByID(int id)
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