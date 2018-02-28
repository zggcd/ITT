using System.Collections.Generic;
using HL.Core.Models;
using HL.Lib.Global;
using System;

namespace HL.Lib.Models
{
    public class CPUserEntity : EntityBase
    {
        #region Autogen by HL

        [DataInfo]
        public override int ID { get; set; }

        [DataInfo]
        public string LoginName { get; set; }

        [DataInfo]
        public string Password { get; set; }

        [DataInfo]
        public override string Name { get; set; }

        [DataInfo]
        public string Address { get; set; }

        [DataInfo]
        public string Phone { get; set; }

        [DataInfo]
        public string Email { get; set; }

        [DataInfo]
        public bool Activity { get; set; }

        [DataInfo]
        public string CityID { get; set; }

        [DataInfo]
        public int Year { get; set; }

        [DataInfo]
        public bool Sex { get; set; }

        [DataInfo]
        public string Phone2 { get; set; }

        [DataInfo]
        public string Job { get; set; }

        [DataInfo]
        public string Note { get; set; }

        [DataInfo]
        public bool IsAdmin { get; set; }

        [DataInfo]
        public DateTime Created { get; set; }

        [DataInfo]
        public DateTime NgayActive { get; set; }

        [DataInfo]
        public bool IsEditor { get; set; }

        [DataInfo]
        public int SoNgayLock { get; set; }

        [DataInfo]
        public DateTime NgayMoLock { get; set; }

        [DataInfo]
        public string ClientIP { get; set; }

        [DataInfo]
        public string File { get; set; }

        //[DataInfo]
        //public string OldFile { get; set; }

        [DataInfo]
        public DateTime NgayLock { get; set; }

        [DataInfo]
        public int State { get; set; }

        [DataInfo]
        public DateTime NgayReActive { get; set; }

        [DataInfo]
        public string Note2 { get; set; }

        [DataInfo]
        public string TempPassword { get; set; }

        #endregion

        List<CPRoleEntity> _GetRole = null;
        public List<CPRoleEntity> GetRole()
        {
            if (_GetRole == null)
                _GetRole = CPRoleService.Instance.GetByUserID(ID);

            if (_GetRole == null)
                _GetRole = new List<CPRoleEntity>();

            return _GetRole;
        }

        public bool HasRole(string role_code)
        {
            return GetRole().Find(o => o.Code == role_code) != null;
        }

        public bool HasRoleAdministrator()
        {
            return HasRole("Administrator");
        }

        public bool IsCPDesign
        {
            get { return IsAdministrator; }
        }

        public bool IsAdministrator
        {
            get { return GetPermissionsByModule("SysAdministrator").Any; }
        }

        private Dictionary<string, Permissions> _dicModulePermissions = null;
        public Permissions GetPermissionsByModule(string module_code)
        {
            if (_dicModulePermissions == null)
                _dicModulePermissions = new Dictionary<string, Permissions>();

            if (_dicModulePermissions.ContainsKey(module_code))
                return _dicModulePermissions[module_code];

            Permissions _Permissions = new Permissions();
            CPModuleEntity _Module = CPModuleService.Instance.CreateQuery()
                                        .Where(o => o.Code == module_code)
                                        .ToSingle();

            if (_Module == null)
            {
                _dicModulePermissions[module_code] = _Permissions;

                return _Permissions;
            }

            return GetPermissionsByRef("CP.MODULE", _Module.ID);
        }

        private Dictionary<string, Permissions> _dicRefPermissions = null;
        public Permissions GetPermissionsByRef(string type, int ref_id)
        {
            if (_dicRefPermissions == null)
                _dicRefPermissions = new Dictionary<string, Permissions>();

            string cache_key = type + "." + ref_id;

            if (_dicRefPermissions.ContainsKey(cache_key))
                return _dicRefPermissions[cache_key];

            Permissions _Permissions = new Permissions();

            CPAccessEntity _Access = CPAccessService.Instance.GetByUser(type, ref_id, ID);

            if (_Access != null)
                _Permissions = new Permissions(_Access.Value);

            if (_Permissions.Full)
            {
                _dicRefPermissions[cache_key] = _Permissions;

                return _Permissions;
            }

            List<CPRoleEntity> _GetRole = GetRole();
            for (int i = 0; _GetRole != null && i < _GetRole.Count; i++)
            {
                _Access = CPAccessService.Instance.GetByRole(type, ref_id, _GetRole[i].ID);

                if (_Access != null)
                    _Permissions.ORAccess(_Access.Value);

                if (_Permissions.Full)
                    break;
            }

            _dicRefPermissions[cache_key] = _Permissions;

            return _Permissions;
        }
    }

    public class CPUserService : ServiceBase<CPUserEntity>
    {
        #region Autogen by HL

        public CPUserService() : base("[CP_User]")
        {
        }

        private static CPUserService _Instance = null;
        public static CPUserService Instance
        {
            get
            {
                if (_Instance == null)
                    _Instance = new CPUserService();

                return _Instance;
            }
        }

        #endregion

        public CPUserEntity GetByID(int id)
        {
            return base.CreateQuery()
               .Where(o => o.ID == id)
               .ToSingle();
        }

        public string GetListIDByLoginName(string loginname)
        {
            var list = new List<int>();
            var search = string.IsNullOrEmpty(loginname) ? "" : loginname;
            var list_user = base.CreateQuery()
                      .Where(o => o.Activity == true && o.LoginName.Contains(search))
                      .Select(o => new { o.ID })
                      .ToList();
            for (int i = 0; list_user != null && i < list_user.Count; i++)
            {
                list.Add(list_user[i].ID);
            }

            return HL.Core.Global.Array.ToString(list.ToArray());
        }

        public CPUserEntity GetByEmail(string email)
        {
            return base.CreateQuery()
                .Where(o => o.Email == email)
                .ToSingle();
        }

        public CPUserEntity GetLogin(int id)
        {
            return base.CreateQuery()
                .Where(o => o.ID == id && o.Activity == true)
                .ToSingle();
        }

        public CPUserEntity GetLogin(string login_name, string password)
        {
            return GetLoginMd5(login_name, HL.Lib.Global.Security.MD5(password));
        }

        public CPUserEntity GetLogin2(string login_name, string password)
        {
            return GetLoginMd5(login_name, Global.Security.GetPass(password));
        }

        public CPUserEntity GetLoginMd5(string login_name, string password)
        {
            return base.CreateQuery()
                .Where(o => o.LoginName == login_name && o.Password == password && o.Activity == true)
                .ToSingle();
        }
        //danh cho thanh vien ngoai web
        public bool exits(string email)
        {
            int i = CPUserService.Instance.CreateQuery().Where(o => o.Email == email).Select(o => o.ID).ToValue().ToInt(0);

            return i > 0;
        }
        public bool exitsloginname(string tentl)
        {
            int i = CPUserService.Instance.CreateQuery().Where(o => o.LoginName == tentl).Select(o => o.ID).ToValue().ToInt(0);

            return i > 0;
        }

        public bool checkadmin(int userid)
        {
            int i =
                CPUserRoleService.Instance.CreateQuery()
                    .Where(o => o.UserID == userid && o.RoleID == 1)
                    .ToValue()
                    .ToInt(0);
            return i > 0;
        }

        public bool checkeditor(int userid)
        {
            int i =
                CPUserRoleService.Instance.CreateQuery()
                    .Where(o => o.UserID == userid && o.RoleID == 3)
                    .ToValue()
                    .ToInt(0);
            return i > 0;
        }
        public CPUserEntity GetForLogin(string LoginName, string md5_pass)
        {
            string where = "[Activity]=1 AND [LoginName]='" + LoginName + "' AND ([Password]='" + md5_pass + "' OR [TempPassword]='" + md5_pass + "')";
            CPUserEntity entity = CreateQuery().Where(where).ToSingle();
            if (entity != null && !string.IsNullOrEmpty(entity.TempPassword))
            {
                if (entity.TempPassword == md5_pass)
                {
                    entity.Password = entity.TempPassword;
                    entity.TempPassword = string.Empty;
                    Save(entity, o => new { o.Password, o.TempPassword });
                }
                else
                {
                    entity.TempPassword = string.Empty;
                    Save(entity, o => new { o.TempPassword });
                }
            }
            return entity;
        }
        public CPUserEntity GetForLogin(int id)
        {
            if (id < 0) return null;
            return CreateQuery().Where(o => o.Activity == true && o.ID == id).ToSingle();
            //return Global.PS<ModUserEntity>.SSingle("*", "Mod_User", "[Activity]=1 AND [ID]=" + id);
        }
        //public override void Delete(int entity_id)
        //{
        //    ModThaoLuanService.Instance.Delete(o => o.UserID == entity_id);
        //    base.Delete(entity_id);
        //}
    }
}
