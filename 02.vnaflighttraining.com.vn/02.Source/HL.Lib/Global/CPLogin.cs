﻿using HL.Lib.Models;

namespace HL.Lib.Global
{
    public class CPLogin
    {
        public static void Logout()
        {
            Cookies.Remove("CP.UserID");
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

        public static bool CheckLogin1(string login_name, string password)
        {
            CPUserEntity _User = CPUserService.Instance.GetLogin2(login_name, password);

            if (_User != null)
            {
                SetLogin(_User.ID);

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

        public static bool IsLogin()
        {
            return (UserID > 0);
            //return (CurrentUser != null);
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

        public static CPUserEntity CurrentUser
        {
            get
            {
                if (UserID > 0)
                    return CPUserService.Instance.GetLogin(UserID);

                return null;
            }
        }
    }
}
