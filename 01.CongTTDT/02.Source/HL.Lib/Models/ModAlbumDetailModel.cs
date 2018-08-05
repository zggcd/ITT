using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModAlbumDetailEntity : EntityBase
    {

        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int AlbumID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public string Tags { get; set; }

        [DataInfo]
        public string File { get; set; }

        [DataInfo]
        public DateTime? Published { get; set; }

        [DataInfo]
        public int Order { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        #endregion

        private ModAlbumEntity _oAlbum = null;
        public ModAlbumEntity getAlbum()
        {
            if (_oAlbum == null && AlbumID > 0)
                _oAlbum = ModAlbumService.Instance.GetByID(AlbumID);

            if (_oAlbum == null)
                _oAlbum = new ModAlbumEntity();

            return _oAlbum;
        }

    }

    public class ModAlbumDetailService : ServiceBase<ModAlbumDetailEntity>
    {

        #region Autogen by HL

        private ModAlbumDetailService()
            : base("[Mod_AlbumDetail]")
        {

        }

        private static ModAlbumDetailService _Instance = null;
        public static ModAlbumDetailService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModAlbumDetailService();

                return _Instance;
            }
        }

        #endregion

        public ModAlbumDetailEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}