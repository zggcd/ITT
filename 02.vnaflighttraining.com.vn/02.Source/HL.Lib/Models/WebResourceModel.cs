using System.Collections.Generic;
using HL.Core.Models;

namespace HL.Lib.Models
{
    public class WebResourceEntity : EntityBase
    {
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public int LangID { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public string Value { get; set; }

        #endregion
    }

    public class WebResourceService : ServiceBase<WebResourceEntity>
    {
        #region Autogen by HL

        public WebResourceService() : base("[Web_Resource]")
        {
        }

        private static WebResourceService _Instance = null;
        public static WebResourceService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new WebResourceService();

                return _Instance;
            }
        }


        #endregion

        public WebResourceEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

        public WebResourceEntity GetByCode_Cache(string code, int lang_id)
        {
            return base.CreateQuery()
               .Where(o => o.LangID == lang_id && o.Code == code)
               .ToSingle_Cache();
        }

        public bool CP_HasExists(string code, int lang_id)
        {
            return base.CreateQuery()
              .Where(o => o.LangID == lang_id && o.Code == code)
              .Count()
              .ToValue().ToBool();
        }

        public List<WebResourceEntity> GetAllByLangID_Cache(int lang_id)
        {
            return base.CreateQuery()
               .Where(o => o.LangID == lang_id)
               .ToList_Cache();
        }
    }
}
