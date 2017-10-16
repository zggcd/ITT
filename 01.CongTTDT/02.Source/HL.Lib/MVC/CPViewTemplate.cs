using System;
using System.Web.UI;

namespace HL.Lib.MVC
{
    public class CPViewTemplate : MasterPage
    {
        public HL.Lib.MVC.CPViewPage CPViewPage
        {
            get { return ((HL.Lib.MVC.CPViewPage)this.Page); }
        }

        protected override void OnLoad(EventArgs e)
        {
            base.OnLoad(e);

            if (CPViewPage.ViewControl != null)
                FindControl("cphMain").Controls.Add(CPViewPage.ViewControl);
        }
    }
}
