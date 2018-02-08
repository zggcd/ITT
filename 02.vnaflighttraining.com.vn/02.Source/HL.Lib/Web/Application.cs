using System;

namespace HL.Lib.Web
{
    public class Application : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            HL.Core.Web.Application.BeginRequest();
        }

        protected void Application_Error(object sender, EventArgs e)
        {
            HL.Lib.Global.Application.OnError();
        }
    }
}
