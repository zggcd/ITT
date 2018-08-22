using System;
using System.Collections.Generic;

using HL.Core.Models;

namespace HL.Lib.Models
{
    public class ModCommentEntity : EntityBase
    {
        
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int NewsID { get; set; }

        [DataInfo]
        public int MenuID { get; set; }

        [DataInfo]
        public string HoTen { get; set; }

        [DataInfo]
        public int State { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public string Email { get; set; }

        [DataInfo]
        public string PhoneNum { get; set; }

        [DataInfo]
        public string Content { get; set; }

        [DataInfo]
        public int CreateUser { get; set; }

        [DataInfo]
        public DateTime Published { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        #endregion      
  
        private ModNewsEntity _oNews = null;
        public ModNewsEntity getNews()
        {
            if (_oNews == null && NewsID > 0)
                _oNews = ModNewsService.Instance.GetByID(NewsID);

            if (_oNews == null)
                _oNews = new ModNewsEntity();

            return _oNews;
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

    public class ModCommentService : ServiceBase<ModCommentEntity>
    {

        #region Autogen by HL

        private ModCommentService()
            : base("[Mod_Comment]")
        {

        }

        private static ModCommentService _Instance = null;
        public static ModCommentService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new ModCommentService();

                return _Instance;
            }
        }

        #endregion

        public ModCommentEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

    }
}