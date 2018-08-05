using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModVanBanEntity : EntityBase
    {

        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public string MenuIDs { get; set; }

        [DataInfo]
        public int MenuID1 { get; set; }

        [DataInfo]
        public int MenuID2 { get; set; }

        [DataInfo]
        public string UserIDs { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public string Custom { get; set; }

        [DataInfo]
        public string Summary { get; set; }

        [DataInfo]
        public string Content { get; set; }

        [DataInfo]
        public DateTime NgayBanHanh { get; set; }

        [DataInfo]
        public DateTime NgayCoHieuLuc { get; set; }

        [DataInfo]
        public DateTime NgayHetHieuLuc { get; set; }

        [DataInfo]
        public string File { get; set; }

        [DataInfo]
        public string File1 { get; set; }

        [DataInfo]
        public string File2 { get; set; }

        [DataInfo]
        public string File3 { get; set; }

        [DataInfo]
        public string Urls { get; set; }

        [DataInfo]
        public string GhiChu { get; set; }

        [DataInfo]
        public DateTime? Published { get; set; }

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

        private WebMenuEntity _oMenu1 = null;
        //Lay Co quan ban hanh
        public WebMenuEntity getMenu1()
        {
            if (_oMenu1 == null && MenuID1 > 0)
                _oMenu1 = WebMenuService.Instance.GetByID_Cache(MenuID1);

            if (_oMenu1 == null)
                _oMenu1 = new WebMenuEntity();

            return _oMenu1;
        }

        private WebMenuEntity _oMenu2 = null;
        //Lay hinh thuc van ban
        public WebMenuEntity getMenu2()
        {
            if (_oMenu2 == null && MenuID2 > 0)
                _oMenu2 = WebMenuService.Instance.GetByID_Cache(MenuID2);

            if (_oMenu2 == null)
                _oMenu2 = new WebMenuEntity();

            return _oMenu2;
        }

        //Lay nguoi ky duyet
        public string getNguoiKyDuyet()
        {
            string s = "";
            if (!string.IsNullOrEmpty(UserIDs))
            {
                s = UserIDs;
                string[] lstUserId = UserIDs.Split(';');
                for (int i = 0; lstUserId != null && i < lstUserId.Length; i++)
                {
                    if (!string.IsNullOrEmpty(lstUserId[i]))
                    {
                        var id = HL.Core.Global.Convert.ToInt(lstUserId[i], 0);
                        if (id > 0)
                        {
                            var user = ModUserService.Instance.GetByID(id);
                            string ten = user.Name;
                            string chucVu = user.getMenu().Name;
                            string coQuan = user.getCoQuan().Name;
                            s = s.Replace(id.ToString(), ten + " - " + chucVu + " " + coQuan);
                        }
                    }
                }
            }

            return s;
        }

    }

    public class ModVanBanService : ServiceBase<ModVanBanEntity>
    {

        #region Autogen by HL

        private ModVanBanService()
            : base("[Mod_VanBan]")
        {

        }

        private static ModVanBanService _Instance = null;
        public static ModVanBanService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModVanBanService();

                return _Instance;
            }
        }

        #endregion

        public ModVanBanEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}