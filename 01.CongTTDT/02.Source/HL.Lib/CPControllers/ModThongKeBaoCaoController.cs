using System;
using System.Collections.Generic;
using System.Linq;
using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;
using System.Collections;

namespace HL.Lib.CPControllers
{
    public class ModThongKeBaoCaoController : CPController
    {
        public ModThongKeBaoCaoController()
        {
            CheckPermissions = false;
        }

        public void ActionIndex(ModThongKeBaoCaoModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            int userId = CPLogin.CurrentUser.ID;
            CPUserRoleEntity userRole = CPUserRoleService.Instance.CreateQuery().Where(o => o.UserID == userId).ToSingle();
            string roleCode = string.Empty;
            string menuIds = WebMenuService.Instance.GetChildIDForCP("News", model.MenuID, model.LangID);
            ArrayList menuIdsTemp = new ArrayList();
            if (userRole != null)
            {
                var role = CPRoleService.Instance.CreateQuery().Where(o => o.ID == userRole.RoleID).ToSingle();
                if (role != null)
                {
                    roleCode = role.Code;
                    string roleMenu = role.MenuIDs;
                    string[] menuArr = menuIds.Split(',');
                    foreach (string m in menuArr)
                    {
                        if (!string.IsNullOrEmpty(roleMenu))
                        {
                            if (roleMenu.Contains(m)) menuIdsTemp.Add(m);
                        }
                    }
                    menuIds = string.Join(",", menuIdsTemp.ToArray());
                }
            }

            // tao danh sach
            if (!string.IsNullOrEmpty(menuIds))
            {
                var dbQuery = ModNewsService.Instance.CreateQuery()
                    .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                    .Where(model.State > 0, o => (o.State & model.State) == model.State)
                    .Where(roleCode == "NV", o => o.CreateUser == userId)
                    .Where(roleCode == "Admin" || roleCode == "GD", o => o.Activity1 == true)
                    .WhereIn(o => o.MenuID, menuIds)
                    .Take(model.PageSize)
                    .OrderBy(orderBy)
                    .Skip(model.PageIndex * model.PageSize);

                List<ModNewsEntity> lstNews = dbQuery.ToList();

                // Thống kê theo tác giả
                List<ReportResultLine> reportByAuthor = lstNews
                                            .GroupBy(n => n.CreateUser)
                                            .Select(cl => new ReportResultLine
                                            {
                                                CreateUserId = cl.First().CreateUser,
                                                NewsNumber = cl.Count(),
                                                ViewNumber = cl.Sum(c => c.View)
                                            }).ToList();

                // Thống kê theo danh mục
                List<ReportResultLine> reportByMenuId = lstNews
                                            .GroupBy(n => n.MenuID)
                                            .Select(cl => new ReportResultLine
                                            {
                                                MenuID = cl.First().MenuID,
                                                NewsNumber = cl.Count(),
                                                ViewNumber = cl.Sum(c => c.View)
                                            }).ToList();


                ViewBag.ReportByAuthor = reportByAuthor;
                ViewBag.ReportByMenuId = reportByMenuId;
                ViewBag.TotalRecord = dbQuery.TotalRecord;
            }
            ViewBag.Model = model;
        }
    }

    public class ModThongKeBaoCaoModel : DefaultModel
    {
        private int _LangID = 1;
        public int LangID
        {
            get { return _LangID; }
            set { _LangID = value; }
        }

        public int MenuID { get; set; }
        public int State { get; set; }
        public string SearchText { get; set; }

        public int[] ArrState { get; set; }
    }

    public class ReportResultLine
    {
        public ReportResultLine() { }

        // Theo chuyên mục
        public int MenuID { get; set; }

        // Theo tác giả
        public int CreateUserId { get; set; }

        // Số lượng bài viết
        public int NewsNumber { get; set; }

        // Số lượng View
        public int ViewNumber { get; set; }

        private WebMenuEntity _oMenu = null;
        public WebMenuEntity getMenu()
        {
            if (_oMenu == null && MenuID > 0)
                _oMenu = WebMenuService.Instance.GetByID_Cache(MenuID);

            if (_oMenu == null)
                _oMenu = new WebMenuEntity();

            return _oMenu;
        }

        private CPUserEntity _oUser = null;
        public CPUserEntity getUser()
        {
            if (_oUser == null && CreateUserId > 0)
                _oUser = CPUserService.Instance.GetByID(CreateUserId);

            if (_oUser == null)
                _oUser = new CPUserEntity();

            return _oUser;
        }
    }
}
