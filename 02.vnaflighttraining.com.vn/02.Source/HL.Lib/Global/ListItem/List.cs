using System.Collections.Generic;
using System.Data;

namespace HL.Lib.Global.ListItem
{
    public class List
    {
        public static List<Item> GetListByConfigkey(string Configkey)
        {
            return GetListByText(HL.Core.Global.Config.GetValue(Configkey).ToString());
        }

        public static List<Item> GetListByText(string ListText)
        {
            List<Item> list = new List<Item>();

            string[] _Items = ListText.Split(',');
            for (int i = 0; i < _Items.Length; i++)
            {
                if (_Items[i].IndexOf('|') == -1)
                    list.Add(new Item(_Items[i], _Items[i]));
                else
                {
                    string _Name = _Items[i].Split('|')[0];
                    string _Value = _Items[i].Split('|')[1];

                    list.Add(new Item(_Name, _Value));
                }
            }

            return list;
        }

        public static int GetLevel(string _text)
        {
            int level = 0;
            for (int i = 0; i < _text.Length; i++)
            {
                if ((int)_text[i] == 45)
                    level++;
                else
                    break;
            }
            return level / 4;
        }

        public static List<Item> GetListForEdit(List<Item> list, int parent_id)
        {
            List<Item> _list = new List<Item>();

            bool _found = false;
            int level = 0;
            for (int i = 0; i < list.Count; i++)
            {
                if (_found && level < GetLevel(list[i].Name))
                    continue;

                if (!_found && list[i].Value == parent_id.ToString())
                {
                    _found = true;
                    level = GetLevel(list[i].Name);

                    continue;
                }

                _list.Add(list[i]);
            }

            return _list;
        }

        public static Item FindByName(List<Item> list, string name)
        {
            Item obj = list.Find(s => s.Name == name);

            return obj ?? new Item(string.Empty, string.Empty);
        }

        private static List<Item> _list = null;
        public static List<Item> GetList(object serviceBase)
        {
            return GetList(serviceBase, 0, string.Empty, string.Empty);
        }

        public static List<Item> GetList(object serviceBase, int langID)
        {
            return GetList(serviceBase, langID, string.Empty, string.Empty);
        }

        public static List<Item> GetList(object serviceBase, int langID, string type)
        {
            return GetList(serviceBase, langID, type, string.Empty);
        }

        public static List<Item> GetList(dynamic serviceBase,
            int langID,
            string type,
            string where)
        {
            _list = new List<Item>();

            bool langUnAbc = HL.Core.Global.Config.GetValue("Mod.LangUnABC").ToBool();

            string sSQL = "SELECT [ID],[Name] " + (langUnAbc ? "+ ' [' + ISNULL([Code],'-') + ']' AS [Name]" : "") + ",[ParentID],[Order] FROM " + serviceBase.TableName + " WHERE 1=1";

            if (langID > 0)
                sSQL += " AND [LangID]=" + langID;

            if (type != string.Empty)
                sSQL += " AND [Type]='" + type + "'";

            if (where != string.Empty)
                sSQL += " AND " + where;

            sSQL += " ORDER BY [ID]";

            DataTable dtData = serviceBase.ExecuteDataTable(sSQL);

            BuildItem(dtData, 0, string.Empty);

            return _list;
        }

        private static void BuildItem(DataTable dtData, int parentID, string space)
        {
            DataRow[] dr = dtData.Select("ParentID=" + parentID, "Order");

            for (int i = 0; i < dr.Length; i++)
            {
                string _text = space + " " + dr[i]["Name"].ToString().Trim();

                parentID = HL.Core.Global.Convert.ToInt(dr[i]["ID"]);

                _list.Add(new Item(_text, parentID.ToString()));

                BuildItem(dtData, parentID, space + "----");
            }
        }
    }
}
