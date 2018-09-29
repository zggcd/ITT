using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.Controllers
{
    public class MSearchController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 20;

        public void ActionIndex(MSearchModel model)
        {
            // Lay thong tin user dang nhap
            int loaiTV = 0, userId = 0;
            CPUserEntity user = CPLogin.CurrentUserOnWeb;
            if (user != null)
            {
                loaiTV = user.MenuID;
                userId = user.ID;
            }

            // Lay id chuyen muc la "Tin noi bo"
            int tinNoiBoId = 0;
            WebMenuEntity menu = WebMenuService.Instance.CreateQuery()
                .Where(o => o.Activity == true && o.Code == "TinNoiBo")
                .ToSingle();
            if (menu != null) tinNoiBoId = menu.ID;

            var dbQuery = ModNewsService.Instance.CreateQuery()
                    .Where(o => o.Activity == true)
                    .Where(!string.IsNullOrEmpty(model.Keyword), o => o.Name.Contains(model.Keyword))
                    .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("News", 0, ViewPage.CurrentLang.ID));

            if (userId == 0)
            {   // Neu khong dang nhap thi khong cho phep tim kiem tin noi bo va tin canh bao
                dbQuery = dbQuery
                    .Where(o => o.MenuID != tinNoiBoId && o.WarnNews == false);
            }
            else
            {   // Neu dang nhap thi cho phep tim kiem tin noi bo va tin canh bao ung voi user duoc phep xem
                string userIds = userId.ToString();

                if (loaiTV > 0)
                {
                    dbQuery = dbQuery.Where(o => o.LoaiThanhVienID == 0 || o.LoaiThanhVienID == null || (o.LoaiThanhVienID > 0 && o.LoaiThanhVienID == loaiTV));
                }
                dbQuery = dbQuery.Where(o => o.WarnNews == false || (o.WarnNews == true && o.WarnUserIDs.Contains(userIds)));
            }

            dbQuery = dbQuery
                    .OrderByDesc(o => o.Order)
                    .Take(PageSize)
                    .Skip(PageSize * model.Page);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            model.PageSize = PageSize;
            ViewBag.Model = model;
        }
    }

    public class MSearchModel
    {
        private int _Page = 0;
        public int Page
        {
            get { return _Page; }
            set { _Page = value - 1; }
        }

        public int TotalRecord { get; set; }
        public int PageSize { get; set; }

        public string Keyword { get; set; }
    }
}
