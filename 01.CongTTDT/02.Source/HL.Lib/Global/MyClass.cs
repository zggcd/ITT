using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using HL.Lib.Models;
using HL.Core.Models;
using HL.Lib.Global.ListItem;
using System.IO;
namespace HL.Lib.Global
{
    public class MyClass
    {
        //
        public static string GetCusTomPage(string keyCusTom, string custom)
        {
            string[] array = null;
            string design = string.Empty;
            array = custom.Split('\n');
            if (array != null)
                for (int u = 0; u < array.Length; u++)
                {
                    string s = array[u].Trim();
                    if (string.IsNullOrEmpty(s)) continue;
                    if (s.StartsWith("\\")) continue;
                    int index = s.IndexOf("=");
                    if (index == -1) continue;
                    string key = s.Substring(0, index).Trim();
                    string value = s.Substring(index + 1).Trim();
                    if (key == keyCusTom) design = value;
                }
            return design;
        }
    }
}
