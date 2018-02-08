using System.Collections.Generic;
using System.Web;
using HL.Lib.Models;
using HL.Core.Interface;

namespace HL.Lib.Global
{
    public class IniSqlResourceService : IResourceServiceInterface
    {
        string lang_code;
        Dictionary<string, string> listResource;
        public IniSqlResourceService(SysLangEntity langEntity)
        {
            lang_code = langEntity.Code;

            string Key_Cache = "Lib.App.IniSqlResourceService." + langEntity.ID + "." + langEntity.Code;

            object obj = HL.Core.Web.Cache.GetValue(Key_Cache);
            if (obj != null)
                listResource = (Dictionary<string, string>)obj;
            else
            {
                listResource = new Dictionary<string, string>();

                List<WebResourceEntity> listSqlResource = WebResourceService.Instance.GetAllByLangID_Cache(langEntity.ID);
                for (int i = 0; listSqlResource != null && i < listSqlResource.Count; i++)
                {
                    listResource[listSqlResource[i].Code] = listSqlResource[i].Value;
                }

                HL.Core.Web.Cache.SetValue(Key_Cache, listResource);
            }
        }

        private IniResourceService _IniResourceService = null;
        public string HL_Core_GetByCode(string code, string defalt)
        {
            if (listResource.ContainsKey(code))
                return listResource[code];
            else
            {
                if (_IniResourceService == null)
                    _IniResourceService = new IniResourceService(HttpContext.Current.Server.MapPath("~/Views/Lang/" + lang_code + ".ini"));

                return _IniResourceService.HL_Core_GetByCode(code, defalt);
            }
        }
    }
}
