using HL.Core.Models;

namespace HL.Lib.MVC
{
    public class ViewControl : HL.Core.MVC.ViewControl
    {
        public ViewPage ViewPage
        {
            get { return this.Page as ViewPage; }
        }

        protected string GetPagination(int pageIndex, int pageSize, int totalRecord)
        {
            return GetPagination(ViewPage.CurrentURL, pageIndex, pageSize, totalRecord);
        }

        protected string GetPagination(string url, int pageIndex, int pageSize, int totalRecord)
        {
            Global.Pager _Pager = new Global.Pager()
            {
                URL = url,
                PageIndex = pageIndex,
                PageSize = pageSize,
                TotalRecord = totalRecord,
                DisableMode = true,
                NextText = "<span>Sau&gt;&gt;</span>",
                BackText = "<span>Trước&lt;&lt;</span>",
                NextEndText = "<span>Trang cuối</span>",
                BackEndText = "<span>Trang đầu</span>"
            };
            _Pager.Update();

            return _Pager.HtmlPage;
        }

        public static string GetName(EntityBase entityBase)
        {
            return entityBase == null ? string.Empty : entityBase.Name;
        }
    }
}
