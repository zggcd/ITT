using HL.Core.Models;

namespace HL.Lib.Models
{
    public class WebSettingEntity : EntityBase
    {
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Code { get; set; }

        [DataInfo]
        public string Value { get; set; }

        #endregion
    }

    public class WebSettingService : ServiceBase<WebSettingEntity>
    {
        #region Autogen by HL

        public WebSettingService() : base("[Web_Setting]")
        {
        }

        private static WebSettingService _Instance = null;
        public static WebSettingService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new WebSettingService();

                return _Instance;
            }
        }

        #endregion

        public WebSettingEntity getByCode(string code)
        {
            return WebSettingService.Instance.CreateQuery().Where(o => o.Code == code).ToSingle();
        }

        public object getValueOrCreateDefault(string code, string defaultValue)
        {
            var a = getByCode(code);
            if (a != null) return a.Value;
            else
            {
                //Global.PS<WebSettingEntity>.NonQuery("SaveSetting", new object[] { "@Code", code, "@Value",defaultValue });
                base.Save(new WebSettingEntity() { Code = code, Value = defaultValue });
                return defaultValue;
            }
        }

        public void Update(string code, string value)
        {
            getValueOrCreateDefault(code, value);
        }
        public void Update1(string code, string value)
        {
            Global.PS<WebSettingEntity>.Update("[Value]=" + value, "Web_Setting", "[Code]='" + code + "'");//.NonQuery("UpdateSetting", new object[] { "@Code", code, "@Value", value });
                                                                                                           //base.Save(a);

        }
        public WebSettingEntity GetByID(int id)
        {
            return WebSettingService.Instance.CreateQuery()
                .Where(o => o.ID == id)
                .ToSingle();
        }
        public bool CP_HasExists(string code)
        {
            var entity = WebSettingService.Instance.CreateQuery()
                .Where(o => o.Code == code)
                .ToSingle();
            return entity != null;
        }
    }
}
