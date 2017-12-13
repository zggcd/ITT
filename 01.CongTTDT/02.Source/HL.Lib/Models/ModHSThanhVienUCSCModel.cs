using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModHSThanhVienUCSCEntity : EntityBase
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
        public string ToChuc_TenCoQuan { get; set; }

        [DataInfo]
        public string ToChuc_DiaChi { get; set; }

        [DataInfo]
        public string ToChuc_DienThoai { get; set; }

        [DataInfo]
        public string ToChuc_Fax { get; set; }

        [DataInfo]
        public string ToChuc_Email { get; set; }

        [DataInfo]
        public string ToChuc_Web { get; set; }

        [DataInfo]
        public string ToChuc_LanhDao { get; set; }

        [DataInfo]
        public string ToChuc_ChucVu { get; set; }

        [DataInfo]
        public string TTTN_DiaChi { get; set; }

        [DataInfo]
        public string TTTN_DienThoai { get; set; }

        [DataInfo]
        public string TTTN_DienThoaiDD { get; set; }

        [DataInfo]
        public string TTTN_Fax { get; set; }

        [DataInfo]
        public string TTTN_Email { get; set; }

        [DataInfo]
        public string HeThongThongTinIDs { get; set; }

        [DataInfo]
        public string Content { get; set; }

        [DataInfo]
        public string File { get; set; }

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

    public class ModHSThanhVienUCSCService : ServiceBase<ModHSThanhVienUCSCEntity>
    {

        #region Autogen by HL

        private ModHSThanhVienUCSCService()
            : base("[Mod_HSThanhVienUCSC]")
        {

        }

        private static ModHSThanhVienUCSCService _Instance = null;
        public static ModHSThanhVienUCSCService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModHSThanhVienUCSCService();

                return _Instance;
            }
        }

        #endregion

        public ModHSThanhVienUCSCEntity GetByID(int id)
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