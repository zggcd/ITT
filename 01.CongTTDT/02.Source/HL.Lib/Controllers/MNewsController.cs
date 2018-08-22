using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;
using System;

namespace HL.Lib.Controllers
{
    public class MNewsController : Controller
    {
        [HL.Core.MVC.PropertyInfo("Chuyên mục", "Type|News")]
        public int MenuID;

        //[HL.Core.MVC.PropertyInfo("Vị trí", "ConfigKey|Mod.NewsState")]
        public int State;

        [HL.Core.MVC.PropertyInfo("Số lượng")]
        public int PageSize = 5;

        //[HL.Core.MVC.PropertyInfo("View")]
        //public string LayoutView = string.Empty;

        public void ActionIndex(MNewsModel model)
        {
            //if (!string.IsNullOrEmpty(LayoutView))
            //    RenderView(LayoutView);

            if (ViewPage.CurrentPage.MenuID > 0)
                MenuID = ViewPage.CurrentPage.MenuID;

            var dbQuery = ModNewsService.Instance.CreateQuery()
                            .Where(o => o.Activity == true)
                            .WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("News", MenuID, ViewPage.CurrentLang.ID))
                            .OrderByDesc(o => o.Order)
                            .Take(PageSize)
                            .Skip(PageSize * model.Page);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            model.PageSize = PageSize;
            ViewBag.Model = model;
        }

        public void ActionDetail(string endCode)
        {
            var entity = ModNewsService.Instance.CreateQuery()
                            .Where(o => o.Activity == true && o.Code == endCode)
                            //.WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("News", MenuID, ViewPage.CurrentLang.ID))
                            .ToSingle();

            if (entity != null)
            {
                ViewBag.Other = ModNewsService.Instance.CreateQuery()
                                        .Where(o => o.Activity == true && o.Order != entity.Order)
                                        //.WhereIn(MenuID > 0, o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("News", MenuID, ViewPage.CurrentLang.ID))
                                        .Where(o => o.MenuID == entity.MenuID)
                                        .OrderByDesc(o => o.Order)
                                        .Take(PageSize)
                                        .ToList();

                ViewBag.Data = entity;
                ViewBag.Comment = new ModCommentEntity();
                SetObject["view.Meta"] = entity;
            }
            else
            {
                ViewPage.Error404();
            }
        }

        public void ActionComment(ModCommentEntity entity)
        {
            ViewBag.Comment = entity;

            // Ho va ten
            if (string.IsNullOrEmpty(entity.HoTen))
            {
                ViewPage.Message.ListMessage.Add("Bạn chưa nhập Họ và tên.");
            }

            // Dien thoai
            if (string.IsNullOrEmpty(entity.PhoneNum))
            {
                ViewPage.Message.ListMessage.Add("Bạn chưa nhập Điện thoại.");
            }
            else
            {
                string checkPhone = Utils.GetMobilePhone(entity.PhoneNum);
                if (string.IsNullOrEmpty(checkPhone))
                {
                    ViewPage.Message.ListMessage.Add("Số điện thoại không hợp lệ.");
                }
            }

            // Email
            if (!string.IsNullOrEmpty(entity.Email))
            {
                string checkEmail = Utils.GetEmailAddress(entity.Email);
                if (string.IsNullOrEmpty(checkEmail))
                {
                    ViewPage.Message.ListMessage.Add("Email không hợp lệ.");
                }
            }

            // Tieu de
            if (string.IsNullOrEmpty(entity.Name))
            {
                ViewPage.Message.ListMessage.Add("Bạn chưa nhập Tiêu đề.");
            }

            // Noi dung
            if (string.IsNullOrEmpty(entity.Content))
            {
                ViewPage.Message.ListMessage.Add("Bạn chưa nhập Nội dung.");
            }

            if (ViewPage.Message.ListMessage.Count > 0)
            {
                string message = @"Thông tin còn thiếu hoặc chưa hợp lệ: \r\n";

                for (int i = 0; i < ViewPage.Message.ListMessage.Count; i++)
                    message += @"\r\n + " + ViewPage.Message.ListMessage[i];

                ViewPage.Alert(message);
            }
            else
            {
                entity.Published = DateTime.Now;
                entity.Activity = true;
                if (CPLogin.IsLoginOnWeb())
                {
                    entity.CreateUser = CPLogin.CurrentUserOnWeb.ID;
                }

                ModCommentService.Instance.Save(entity);
                ViewBag.Comment = new ModCommentEntity();
                ViewPage.Alert("Cám ơn bạn đã gửi bình luận.");
            }
        }
    }

    public class MNewsModel
    {
        private int _Page = 0;
        public int Page
        {
            get { return _Page; }
            set { _Page = value - 1; }
        }

        public int TotalRecord { get; set; }
        public int PageSize { get; set; }
    }
}
