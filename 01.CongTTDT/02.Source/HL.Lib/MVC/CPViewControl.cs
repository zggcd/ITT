using System;
using HL.Core.Models;
using System.Collections.Generic;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.MVC
{
    public class CPViewControl : HL.Core.MVC.ViewControl
    {
        public CPViewPage CPViewPage
        {
            get { return this.Page as CPViewPage; }
        }

        protected string GetName(EntityBase entityBase)
        {
            return entityBase == null ? string.Empty : entityBase.Name;
        }

        protected string GetOrder(int id, int order)
        {
            return "<input type=\"text\" id=\"order[" + id + "]\" size=\"10\" value=\"" + order + "\" class=\"text-area-order\" style=\"text-align: center\" />";
        }

        protected string GetCheckbox(int id, int index)
        {
            return "<input type=\"checkbox\" id=\"cb" + index + "\" name=\"cid\" value=\"" + id + "\" onclick=\"isChecked(this.checked);\" />";
        }

        protected string GetPublish(int id, bool activity)
        {
            return "<a class=\"jgrid hasTip\" href=\"javascript:void(0);\" onclick=\"hl_exec_cmd('[publishgx][" + id + "," + !activity + "]');return false;\" title=\"Click để duyệt và hủy duyệt\"><span class=\"state " + (activity ? "publish" : "unpublish") + "\"></span></a>";
        }

        protected string GetSortLink(string name, string key)
        {
            return "<a href=\"javascript:HLRedirect('Index', '" + key + "-" + GetSortTypeDesc(key) + "', 'Sort');\">" + name + " " + GetImgSortTypeDesc(key) + "</a>";
        }

        protected string GetDefaultAddCommand()
        {
            return GetListCommand("apply|Lưu,save|Lưu  &amp; đóng,save-new|Lưu &amp; thêm,space,cancel|Đóng");
        }

        protected string GetDefaultListCommand()
        {
            return GetListCommand("new|Thêm,edit|Sửa,space,publish|Duyệt,unpublish|Bỏ duyệt,space,delete|Xóa,copy|Sao chép,space,config|Xóa cache");
        }

        protected string GetListCommand(string commands)
        {
            string[] ArrCommand = commands.Split(',');

            string s = "<ul style='float: right;'>";
            for (int i = 0; i < ArrCommand.Length; i++)
            {
                if (ArrCommand[i] == "space")
                {
                    s += "<li class=\"divider\"></li>";
                    continue;
                }

                string key = ArrCommand[i].Split('|')[0];
                string name = ArrCommand[i].Split('|')[1];

                s += "<li class=\"button\" id=\"toolbar-" + key + "\">";

                if (key == "delete")
                    s += "<a href=\"#\" onclick=\"javascript:if(document.hlForm.boxchecked.value>0){if(confirm('Bạn chắc là mình muốn xóa chứ !')){hl_exec_cmd('delete')}}\" class=\"toolbar\"><span class=\"icon-32-delete\" title=\"" + name + "\"></span>" + name + " </a>";
                else if (key == "new")
                    s += "<a href=\"#\" onclick=\"javascript:HLRedirect('Add')\" class=\"toolbar\"><span class=\"icon-32-new\" title=\"" + name + "\"></span>" + name + " </a>";
                else if (key == "publish" || key == "unpublish" || key == "edit" || key == "copy")
                    s += "<a href=\"#\" onclick=\"javascript:if(document.hlForm.boxchecked.value>0){hl_exec_cmd('" + key + "')}\" class=\"toolbar\"><span class=\"icon-32-" + key + "\" title=\"" + name + "\"></span>" + name + " </a>";
                else
                    s += "<a href=\"#\" onclick=\"hl_exec_cmd('" + key + "')\" class=\"toolbar\"><span class=\"icon-32-" + key + "\" title=\"" + name + "\"></span>" + name + " </a>";

                s += "</li>";
            }
            s += "</ul>";

            return s;
        }

        protected string GetPagination(int pageIndex, int pageSize, int totalRecord)
        {
            Global.Pager _Pager = new Global.Pager();

            _Pager.IsCPLayout = true;
            _Pager.ActionName = "Index";
            _Pager.ParamName = "PageIndex";
            _Pager.PageIndex = pageIndex;
            _Pager.PageSize = pageSize;
            _Pager.TotalRecord = totalRecord;

            _Pager.Update();

            string s = "<div class=\"pagination\">";
            s += "<div class=\"limit\">Hiển thị #" + ShowDDLLimit(_Pager.PageSize) + "</div>";
            s += _Pager.HtmlPage;
            s += "<div class=\"limit\">Trang " + (_Pager.PageIndex + 1) + " của " + _Pager.TotalPage + "</div>";
            s += "</div>";
            return s;
        }

        protected string ShowDDLLimit(int pageSize)
        {
            return ShowDDLLimit(pageSize, "Index");
        }

        protected string ShowDDLLimit(int pageSize, string key)
        {
            int[] Arr = new int[] { 5, 10, 15, 20, 30, 50, 100 };

            string s = "<select name=\"limit\" id=\"limit\" onchange=\"HLRedirect('" + key + "')\" class=\"inputbox\" size=\"1\">";
            for (int i = 0; i < Arr.Length; i++)
            {
                s += "<option " + (Arr[i] == pageSize ? "selected" : string.Empty) + " value=\"" + Arr[i] + "\">" + Arr[i] + "</option>";
            }
            s += "</select>";

            return s;
        }

        protected string ShowDDLLang(int langID)
        {
            return ShowDDLLang(langID, "Index");
        }

        protected string ShowDDLLang(int langID, string key)
        {
            List<SysLangEntity> list = SysLangService.Instance.CreateQuery().ToList_Cache();

            string s = "<select name=\"filter_lang\" id=\"filter_lang\" onchange=\"HLRedirect('" + key + "','0','parent_id')\" class=\"inputbox\" size=\"1\">";
            for (int i = 0; list != null && i < list.Count; i++)
            {
                s += "<option " + (list[i].ID == langID ? "selected" : string.Empty) + " value=\"" + list[i].ID + "\">" + list[i].Name + "</option>";
            }
            s += "</select>";

            return s;
        }

        protected string ShowMap(List<EntityBase> listMap)
        {
            string s = "<a href=\"javascript:HLRedirect('Index', '0', 'ParentID');\">Root</a>";
            for (int i = 0; listMap != null && i < listMap.Count; i++)
            {
                s += ">> <a href=\"javascript:HLRedirect('Index', '" + listMap[i].ID + "', 'ParentID');\">" + listMap[i].Name + "</a>";
            }

            return s;
        }

        protected string ShowMessage()
        {
            string s = string.Empty;

            if (Cookies.GetValue("message") != string.Empty)
            {
                s += "<dl id=\"system-message\">";
                s += "<dd class=\"message message\"><ul>";
                s += "<li>" + Data.Base64Decode(Cookies.GetValue("message")) + "</li>";
                s += "</ul></dd>";
                s += "</dl>";

                Cookies.Remove("message");
            }
            else
            {
                Message _Message = CPViewPage.Message;

                if (_Message != null && _Message.ListMessage.Count > 0)
                {
                    s += "<dl id=\"system-message\">";
                    s += "<dd class=\"message " + _Message.MessageTypeName + "\"><ul>";
                    for (int i = 0; i < _Message.ListMessage.Count; i++)
                    {
                        s += "<li>" + _Message.ListMessage[i] + "</li>";
                    }
                    s += "</ul></dd>";
                    s += "</dl>";
                }
            }

            return s;
        }

        protected void CreatePathUpload(string pathChild)
        {
            try
            {
                Directory.Create(Server.MapPath("~/Data/upload/" + pathChild));
            }
            catch{ }
        }

        #region private 

        private string SortType
        {
            get
            {
                return CPViewPage.PageViewState.GetValue("Sort").ToString().Trim().Split('-')[0]
                    .Replace("'", string.Empty)
                    .Replace("-", string.Empty)
                    .Replace(";", string.Empty);
            }
        }

        private bool SortDesc
        {
            get
            {
                try
                {
                    return "desc" == CPViewPage.PageViewState.GetValue("Sort").ToString().Trim().Split('-')[1].ToLower();
                }
                catch { }

                return false;
            }
        }

        private string GetSortTypeDesc(string type)
        {
            if (type != SortType)
                return "desc";

            return SortDesc ? "asc" : "desc";
        }

        private string GetImgSortTypeDesc(string type)
        {
            if (type != SortType)
                return string.Empty;

            return "<img src=\"/{CPPath}/Content/media/system/images/sort_" + (SortDesc ? "desc" : "asc") + ".png\" alt=\"\">";
        }

        #endregion
    }
}
