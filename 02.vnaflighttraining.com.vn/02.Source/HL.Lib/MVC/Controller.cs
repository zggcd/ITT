using System;

namespace HL.Lib.MVC
{
    public class Controller : HL.Core.MVC.Controller
    {
        public new ViewPage ViewPage { get { return base.ViewPageBase as ViewPage; } }
        public new ViewControl ViewControl { get { return base.ViewControl as ViewControl; } }
    }
}
