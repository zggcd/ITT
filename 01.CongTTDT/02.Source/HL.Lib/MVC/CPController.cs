using System;
using HL.Lib.Global;

namespace HL.Lib.MVC
{
    public class CPController : HL.Core.MVC.Controller
    {
        public CPViewPage CPViewPage { get { return base.ViewPageBase as CPViewPage; } }
        public CPViewControl CPViewControl { get { return base.ViewControl as CPViewControl; } }

        protected dynamic DataService { get; set; }
        protected bool CheckPermissions { get; set; }

        protected string AutoSort(string sort)
        {
            return AutoSort(sort, "[ID] DESC");
        }

        protected string AutoSort(string sort, string orderDefault)
        {
            if (string.IsNullOrEmpty(sort))
                return orderDefault;

            string sortType = sort.Split('-')[0]
                                  .Replace("'", string.Empty)
                                  .Replace("-", string.Empty)
                                  .Replace(";", string.Empty);

            bool sortDesc = "desc" == sort.Split('-')[1].ToLower();

            return "[" + sortType + "] " + (sortDesc ? "DESC" : "ASC");
        }

        protected int GetState(int[] arrState)
        {
            int state = 0;

            for (int i = 0; arrState != null && i < arrState.Length; i++)
                if (arrState[i] > 0) state ^= arrState[i];

            return state;
        }

        protected string GetMenuIDs(int[] arrMenuID)
        {
            string menuIds = "";
            string split = ";";

            for (int i = 0; arrMenuID != null && i < arrMenuID.Length; i++)
            {
                if (i == arrMenuID.Length - 1) split = "";
                if (arrMenuID[i] > 0) menuIds += arrMenuID[i] + split;
            }

            return menuIds;
        }

        protected void SaveRedirect()
        {
            CPViewPage.SetMessage("Thông tin đã cập nhật.");
            CPViewPage.Response.Redirect(CPViewPage.Request.RawUrl.Replace("Add.aspx", "Index.aspx"));
        }

        protected void ApplyRedirect(int RecordID, int EntityID)
        {
            CPViewPage.SetMessage("Thông tin đã cập nhật.");

            if (RecordID > 0)
                CPViewPage.RefreshPage();
            else
                CPViewPage.Response.Redirect(CPViewPage.Request.RawUrl + "/RecordID/" + EntityID);
        }

        protected void SaveNewRedirect(int RecordID, int EntityID)
        {
            CPViewPage.SetMessage("Thông tin đã cập nhật.");

            if (RecordID > 0)
                CPViewPage.Response.Redirect(CPViewPage.Request.RawUrl.Replace("/RecordID/" + EntityID, string.Empty));
            else
                CPViewPage.Response.Redirect(CPViewPage.Request.RawUrl);
        }

        public virtual void ActionCancel()
        {
            CPViewPage.Response.Redirect(CPViewPage.Request.RawUrl.Replace("Add.aspx", "Index.aspx"));
        }

        public virtual void ActionConfig()
        {
            Global.Utils.Clear_Cache();

            //thong bao
            CPViewPage.SetMessage("Xóa cache thành công.");
            CPViewPage.RefreshPage();
        }

        public virtual void ActionCopy(int id)
        {
            if (CheckPermissions && !CPViewPage.UserPermissions.Approve)
            {
                //thong bao
                CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;
                CPViewPage.Message.ListMessage.Add("Quyền hạn chế.");
                return;
            }

            dynamic entity = DataService.GetByID(id);

            entity.ID = 0;
            entity.Name = entity.Name + " - (Bản sao)";

            DataService.Save(entity);

            //thong bao
            CPViewPage.SetMessage("Sao chép thành công.");
            CPViewPage.RefreshPage();
        }

        public virtual void ActionPublish(int[] arrID)
        {
            if (CheckPermissions && !CPViewPage.UserPermissions.Approve)
            {
                //thong bao
                CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;
                CPViewPage.Message.ListMessage.Add("Quyền hạn chế.");
                return;
            }

            DataService.Update("[ID] IN (" + HL.Core.Global.Array.ToString(arrID) + ")",
                    "@Activity", 1);

            //thong bao
            CPViewPage.SetMessage("Đã duyệt thành công.");
            CPViewPage.RefreshPage();
        }

        public virtual void ActionUnPublish(int[] arrID)
        {
            if (CheckPermissions && !CPViewPage.UserPermissions.Approve)
            {
                //thong bao
                CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;
                CPViewPage.Message.ListMessage.Add("Quyền hạn chế.");
                return;
            }

            DataService.Update("[ID] IN (" + HL.Core.Global.Array.ToString(arrID) + ")",
                    "@Activity", 0);

            //thong bao
            CPViewPage.SetMessage("Đã bỏ duyệt thành công.");
            CPViewPage.RefreshPage();
        }

        public virtual void ActionDelete(int[] arrID)
        {
            if (CheckPermissions && !CPViewPage.UserPermissions.Delete)
            {
                //thong bao
                CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;
                CPViewPage.Message.ListMessage.Add("Quyền hạn chế.");
                return;
            }

            DataService.Delete("[ID] IN (" + HL.Core.Global.Array.ToString(arrID) + ")");

            //thong bao
            CPViewPage.SetMessage("Đã xóa thành công.");
            CPViewPage.RefreshPage();
        }

        public virtual void ActionSaveOrder(int[] arrID)
        {
            if (CheckPermissions && !CPViewPage.UserPermissions.Approve)
            {
                //thong bao
                CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;
                CPViewPage.Message.ListMessage.Add("Quyền hạn chế.");
                return;
            }

            for (int i = 0; i < arrID.Length - 1; i = i + 2)
            {
                DataService.Update("[ID]=" + arrID[i],
                        "@Order", arrID[i + 1]);
            }

            //thong bao
            CPViewPage.SetMessage("Đã sắp xếp thành công.");
            CPViewPage.RefreshPage();
        }

        public virtual void ActionPublishGX(int[] arrID)
        {
            if (CheckPermissions && !CPViewPage.UserPermissions.Approve)
            {
                //thong bao
                CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;
                CPViewPage.Message.ListMessage.Add("Quyền hạn chế.");
                return;
            }

            DataService.Update("[ID]=" + arrID[0],
                        "@Activity", arrID[1]);

            //thong bao
            CPViewPage.SetMessage(arrID[1] == 0 ? "Đã bỏ duyệt thành công." : "Đã duyệt thành công.");
            CPViewPage.RefreshPage();
        }
    }

    public class DefaultModel
    {
        private int _PageIndex = 0;
        public int PageIndex
        {
            get { return _PageIndex; }
            set { _PageIndex = value - 1; }
        }

        private int _PageSize = 20;
        public int PageSize
        {
            get { return _PageSize; }
            set { _PageSize = value; }
        }

        public int TotalRecord { get; set; }

        public string Sort { get; set; }

        public int RecordID { get; set; }
    }
}
