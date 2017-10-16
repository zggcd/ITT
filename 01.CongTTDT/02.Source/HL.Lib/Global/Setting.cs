namespace HL.Lib.Global
{
    public class Setting : HL.Core.Web.Setting
    {
        public static string Mod_DomainCookies = HL.Core.Global.Config.GetValue("Mod.DomainCookies").ToString();
        public static bool Mod_WriteError = HL.Core.Global.Config.GetValue("Mod.WriteError").ToBool(true);
        public static int Mod_CPTimeout = HL.Core.Global.Config.GetValue("Mod.CPTimeout").ToInt();
        public static bool Mod_LangUnABC = HL.Core.Global.Config.GetValue("Mod.LangUnABC").ToBool();
    }
}
