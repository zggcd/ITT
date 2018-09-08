using System;
using System.Collections.Generic;
using System.Linq;
using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModTongHopNhanLucUCSCEntity : EntityBase
    {

        #region Code by NQT

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int DonDangKyUCSCID { get; set; }

        [DataInfo]
        public int HSThanhVienUCSCID { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public int MenuID_Value { get; set; }

        [DataInfo]
        public DateTime CreatedDate { get; set; }

        [DataInfo]
        public DateTime? UpdatedDate { get; set; }
        
        #endregion



        private ModDonDangKyUCSCEntity _oDonDangKyUCSC = null;
        private ModHSThanhVienUCSCEntity _oHSThanhVienUCSC = null;

        public ModDonDangKyUCSCEntity getDonDangKyUCSC()
        {
            if (_oDonDangKyUCSC == null && DonDangKyUCSCID > 0)
                _oDonDangKyUCSC = ModDonDangKyUCSCService.Instance.GetByID(DonDangKyUCSCID);

            if (_oDonDangKyUCSC == null)
                _oDonDangKyUCSC = new ModDonDangKyUCSCEntity();

            return _oDonDangKyUCSC;
        }

        public ModHSThanhVienUCSCEntity getHSThanhVienUCSC()
        {
            if (_oHSThanhVienUCSC == null && HSThanhVienUCSCID > 0)
                _oHSThanhVienUCSC = ModHSThanhVienUCSCService.Instance.GetByID(HSThanhVienUCSCID);

            if (_oHSThanhVienUCSC == null)
                _oHSThanhVienUCSC = new ModHSThanhVienUCSCEntity();

            return _oHSThanhVienUCSC;
        }
    }

    public class ModTongHopNhanLucUCSCService : ServiceBase<ModTongHopNhanLucUCSCEntity>
    {

        #region Code by NQT

        private ModTongHopNhanLucUCSCService()
            : base("[Mod_TongHopNhanLucUCSC]")
        {

        }

        private static ModTongHopNhanLucUCSCService _Instance = null;
        public static ModTongHopNhanLucUCSCService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModTongHopNhanLucUCSCService();

                return _Instance;
            }
        }

        #endregion

        public ModTongHopNhanLucUCSCEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

        public List<ModTongHopNhanLucUCSCEntity> GetByHSThanhVienID(int HSThanhVienUCSCId)
        {
            return base.CreateQuery().Where(o => (o.HSThanhVienUCSCID == HSThanhVienUCSCId)).ToList();
        }

        public List<ModTongHopNhanLucUCSCEntity> GetByDonDangKyUCSCID(int DonDangKyUCSCId)
        {
            return base.CreateQuery().Where(o => (o.DonDangKyUCSCID == DonDangKyUCSCId)).ToList();
        }

        public List<ModTongHopNhanLucUCSCEntity> GetTongHopNhanLucByHSThanhVienID(int HSThanhVienUCSCId, string Type)
        {
            List<WebMenuEntity> listChildMenuByType = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == Type && o.ParentID > 0).OrderByAsc(o=>o.Order).ToList();
            List<ModTongHopNhanLucUCSCEntity> listThongHopNhanLuc = base.CreateQuery().Where(o => (o.HSThanhVienUCSCID > 0 && o.HSThanhVienUCSCID == HSThanhVienUCSCId)).ToList();
            if (listThongHopNhanLuc == null) listThongHopNhanLuc = new List<ModTongHopNhanLucUCSCEntity>();

            List<ModTongHopNhanLucUCSCEntity> lstResults =
                (from menu in listChildMenuByType
                 join thnl in listThongHopNhanLuc on menu.ID equals thnl.MenuID into menu_thnl
                 from thnl in menu_thnl.DefaultIfEmpty()
                 select new ModTongHopNhanLucUCSCEntity
                 {
                     MenuID = menu.ID,
                     Name = String.IsNullOrEmpty(menu.Alias) ? menu.Name : menu.Alias,
                     DonDangKyUCSCID = 0,
                     HSThanhVienUCSCID = HSThanhVienUCSCId,
                     ID = thnl == null ? 0 : thnl.ID, 
                     MenuID_Value = thnl == null ? 0 : thnl.MenuID_Value,
                     CreatedDate = thnl == null ? DateTime.Now : thnl.CreatedDate,
                     UpdatedDate = thnl == null ? null : thnl.UpdatedDate,
                 }).ToList();


            if (lstResults == null) lstResults = new List<ModTongHopNhanLucUCSCEntity>();
            return lstResults;
        }

        public List<ModTongHopNhanLucUCSCEntity> GetTongHopNhanLucByDonDangKyUCSCID(int DonDangKyUCSCId, string Type)
        {
            List<WebMenuEntity> listChildMenuByType = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Type == Type && o.ParentID > 0).OrderByAsc(o => o.Order).ToList();
            List<ModTongHopNhanLucUCSCEntity> listThongHopNhanLuc = base.CreateQuery().Where(o => (o.DonDangKyUCSCID > 0 && o.DonDangKyUCSCID == DonDangKyUCSCId)).ToList();
            if (listThongHopNhanLuc == null) listThongHopNhanLuc = new List<ModTongHopNhanLucUCSCEntity>();


            List<ModTongHopNhanLucUCSCEntity> lstResults =
                (from menu in listChildMenuByType
                 join thnl in listThongHopNhanLuc on menu.ID equals thnl.MenuID into menu_thnl
                 from thnl in menu_thnl.DefaultIfEmpty()
                 select new ModTongHopNhanLucUCSCEntity
                 {
                     MenuID = menu.ID,
                     Name = String.IsNullOrEmpty(menu.Alias) ? menu.Name : menu.Alias,
                     DonDangKyUCSCID = DonDangKyUCSCId,
                     HSThanhVienUCSCID = 0,
                     ID = thnl == null ? 0 : thnl.ID,
                     MenuID_Value = thnl == null ? 0 : thnl.MenuID_Value,
                     CreatedDate = thnl == null ? DateTime.Now : thnl.CreatedDate,
                     UpdatedDate = thnl == null ? null : thnl.UpdatedDate,
                 }).ToList();

            if (lstResults == null) lstResults = new List<ModTongHopNhanLucUCSCEntity>();
            return lstResults;
        }
    }
}