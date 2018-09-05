using HL.Core.MVC;
using HL.Lib.Models;

namespace HL.Lib.Global
{
    public class CPLogin
    {
        public static bool isNetwork = false;
        public static void Logout()
        {
            Cookies.Remove("CP.UserID");
        }

        public static void LogoutOnWeb()
        {
            Cookies.Remove("CP.UserIDOnWeb");
        }

        public static bool CheckLogin(string login_name, string password)
        {
            CPUserEntity _User = CPUserService.Instance.GetLogin(login_name, password);

            if (_User != null)
            {
                SetLogin(_User.ID);

                return true;
            }

            return false;
        }

        public static bool CheckLogin0(string login_name, string password, bool isTV = false)
        {
            string role = GetRoleByLoginName(login_name);
            if (isTV == true && !string.IsNullOrEmpty(role) && role != "TV")
            {
                return false;
            }
            else if (isTV == false && (string.IsNullOrEmpty(role) || role == "TV"))
            {
                return false;
            }
            CPUserEntity _User = CPUserService.Instance.GetLogin2(login_name, password);

            if (_User != null)
            {
                SetLogin(_User.ID);

                return true;
            }

            return false;
        }

        public static bool CheckLogin1(string login_name, string password, bool isTV = false)
        {
            string role = GetRoleByLoginName(login_name);
            if (isTV == true && !string.IsNullOrEmpty(role) && role != "TV")
            {
                return false;
            }
            else if (isTV == false && (string.IsNullOrEmpty(role) || role == "TV"))
            {
                return false;
            }
            CPUserEntity _User = CPUserService.Instance.GetLogin2(login_name, password);

            if (_User != null)
            {
                SetLoginOnWeb(_User.ID);

                return true;
            }

            return false;
        }

        public static bool CheckLogin2(string email, string password)
        {
            CPUserEntity _User = CPUserService.Instance.GetForLogin(email, Global.Security.GetPass(password));

            if (_User != null)
            {
                SetLogin(_User.ID);

                return true;
            }

            return false;
        }

        public static bool CheckLogin3(string LoginName, string password)
        {
            CPUserEntity _User = CPUserService.Instance.GetForLogin(LoginName, Global.Security.GetPass(password));

            if (_User != null)
            {
                SetLogin(_User.ID);

                return true;
            }

            return false;
        }

        private static void SetLogin(int user_id)
        {
            Cookies.SetValue("CP.UserID", user_id.ToString(), Setting.Mod_CPTimeout, true);
        }

        private static void SetLoginOnWeb(int user_id)
        {
            Cookies.SetValue("CP.UserIDOnWeb", user_id.ToString(), Setting.Mod_CPTimeout, true);
        }

        public static bool IsLogin()
        {
            return (UserID > 0);
            //return (CurrentUser != null);
        }

        public static bool IsLoginOnWeb()
        {
            return (UserIDOnWeb > 0);
        }

        public static int UserID
        {
            get
            {
                int _UserID = HL.Core.Global.Convert.ToInt(Cookies.GetValue("CP.UserID", true));

                if (_UserID > 0)
                    SetLogin(_UserID);

                return _UserID;
            }
        }

        public static int UserIDOnWeb
        {
            get
            {
                int _UserID = HL.Core.Global.Convert.ToInt(Cookies.GetValue("CP.UserIDOnWeb", true));

                if (_UserID > 0)
                    SetLoginOnWeb(_UserID);

                return _UserID;
            }
        }

        public static CPUserEntity CurrentUser
        {
            get
            {
                if (UserID > 0)
                    return CPUserService.Instance.GetLogin(UserID);

                return null;
            }
        }

        public static CPUserEntity CurrentUserOnWeb
        {
            get
            {
                if (UserIDOnWeb > 0)
                    return CPUserService.Instance.GetLogin(UserIDOnWeb);

                return null;
            }
        }

        public static string GetRoleByLoginName(string loginName)
        {
            string role = string.Empty;

            CPUserEntity u = CPUserService.Instance.CreateQuery().Where(o => o.Activity == true && o.LoginName == loginName).ToSingle();
            if (u == null) return role;
            CPUserRoleEntity r = CPUserRoleService.Instance.CreateQuery().Where(o => o.UserID == u.ID).ToSingle();
            if (r == null) return role;
            CPRoleEntity ur = CPRoleService.Instance.CreateQuery().Where(o => o.ID == r.RoleID).ToSingle();
            if (ur == null) return role;
            role = ur.Code;

            return role;
        }
    }
}
