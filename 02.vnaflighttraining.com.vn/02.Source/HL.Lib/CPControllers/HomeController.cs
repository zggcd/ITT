using HL.Lib.MVC;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class HomeController : CPController
    {
        public void ActionIndex()
        {
        }

        public void ActionLogout()
        {
            CPViewPage.SetLog("Thoát khỏi hệ thống.");
            CPLogin.Logout();
            CPViewPage.CPRedirect("Login.aspx");
        }
    }
}
