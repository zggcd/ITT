using System;

using HL.Lib.Models;
using HL.Core.Models;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.IO.Compression;
using System.Web.UI;
using HL.Core.Web;
using System.Runtime.InteropServices;
using HL.Core.Interface;

namespace HL.Lib.Global
{
    public class PS<T> where T : EntityBase
    {
        public static string DBCon2 = HL.Core.Data.ConnectionString.GetByConfigKey("DBConnection");
        public static List<T> ToList(string procName, params object[] Params)
        {
            return HL.Core.Global.DAO<T>.Populate(HL.Core.Data.SQLCmd.ExecuteReader(DBCon2, procName, Params));
        }
        public static List<T> ToListPT(string procName,out int TotalRecord, params object[] Params)
        {
            var set = HL.Core.Data.SQLCmd.ExecuteDataSet(DBCon2, procName, Params);
            if (set == null)
            {
                TotalRecord = 0;
                return null;
            }
            TotalRecord = HL.Core.Global.Convert.ToInt(set.Tables[0].Rows[0][0]);
            return HL.Core.Global.DAO<T>.Populate(set.Tables[1]);
        }
        public static T ToSingle(string procName, params object[] Params)
        {
            List<T> list = ToList(procName, Params);
            if (list != null)
            {
                return list[0];
            }
            return default(T);
        }
        public static int NonQuery(string procName, params object[] Params)
        {
            return HL.Core.Data.SQLCmd.ExecuteNonQuery(DBCon2, procName, Params);
        }

        #region Cache
        public static T ToSingle_Cache(string procName, params object[] Params)
        {
            string key = string.Concat(new string[]
			{
				"PS.Single_Cache.",
				method_0(procName, Params)
			});
            object value = Cache.GetValue(key);
            if (value != null)
            {
                if (value is Struct14)
                {
                    return null;
                }
                return (T)value;
            }
            else
            {
                int TimeOut = 0;
                T o = ToSingle(procName, Params);
                if (o == null)
                {
                    Cache.SetValue(key, default(Struct14), TimeOut);
                    return null;
                }
                Cache.SetValue(key, o, TimeOut);
                return o;
            }
        }
        public static List<T> ToList_Cache(string procName,params object[] Params)
        {
            string key = string.Concat(new string[]
			{
				"PS.ToList_Cache.",
				method_0(procName, Params)
			});
            object value = Cache.GetValue(key);
            if (value != null)
            {
                if (value is Struct14)
                {
                    return null;
                }
                return (List<T>)value;
            }
            else
            {
                int TimeOut = 0;
                List<T> list = ToList(procName,Params);
                if (list == null)
                {
                    Cache.SetValue(key, default(Struct14), TimeOut);
                    return null;
                }
                Cache.SetValue(key, list, TimeOut);
                return list;
            }
        }
        internal static string method_0(string string_0, params object[] object_0)
        {
            for (int i = 0; object_0 != null; i++)
            {
                if (i >= object_0.Length)
                {
                    break;
                }
                string_0 = string_0 + object_0[i].ToString();
            }
            return Security.MD5(string_0);
        }
        [StructLayout(LayoutKind.Sequential, Size = 1)]
        private struct Struct14
        {
        }
        #endregion
        public static List<T> PhanTrang(out int tr, int take, int skip, string table, string where)
        {
            return PhanTrang(out tr, take, skip,table, "*", where, "[Order] DESC");
        }
        public static List<T> PhanTrang(out int tr, int take, int skip, string table, string fields, string where)
        {
            return PhanTrang(out tr, take, skip,table, fields, where, "[Order] DESC");
        }
        public static List<T> PhanTrang(out int tr,int take, int skip, string table, string fields, string where, string order)
        {
            return ToListPT("WPhanTrang", out tr, new object[] { 
                    "@Take",take,"@Skip",skip,"@Table",table,"@Fields",fields,"@Where",where,"@Order",order
                    });
        }
        public static T SSingle(string fields, string table, string where)
        {
            return ToSingle("WSelectOne", new object[] { "@Fields", fields, "@Table", table, "@Where", where });
        }
        public static T SSingle_Cache(string fields, string table, string where)
        {
            return ToSingle_Cache("WSelectOne", new object[] { "@Fields", fields, "@Table", table, "@Where", where });
        }
        public static List<T> SList(string fields, string table, string where)
        {
            return ToList("WSelect", new object[] { "@Fields", fields, "@Table", table, "@Where", where });
        }
        public static List<T> SList_Cache(string fields, string table, string where)
        {
            return ToList_Cache("WSelect", new object[] { "@Fields", fields, "@Table", table, "@Where", where });
        }
        public static int Update(string fields, string table, string where)
        {
            return NonQuery("WUpdate", new object[] { "@Fields", fields, "@Table", table, "@Where", where });
        }
    }
}
