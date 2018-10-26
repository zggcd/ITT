using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;
using System.Linq;
using HL.Core.Models;

namespace HL.Lib.CPControllers
{
    public class ModBaoCaoTKController : CPController
    {
        public ModBaoCaoTKController()
        {
            //khoi tao Service
            DataService = ModIncidentService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModIncidentModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            DateTime dNow = DateTime.Now;
            DateTime? dFrom = null;
            DateTime? dTo = null;
            if (model.KhoangThoiGian == 1)
            {
                dTo = dNow;
                dFrom = dNow.AddMonths(-1);
            }
            if (model.KhoangThoiGian == 3)
            {
                dTo = dNow;
                dFrom = dNow.AddMonths(-3);
            }
            if (model.KhoangThoiGian == 6)
            {
                dTo = dNow;
                dFrom = dNow.AddMonths(-6);
            }
            if (model.KhoangThoiGian == 12)
            {
                dTo = dNow;
                dFrom = dNow.AddMonths(-12);
            }

            DateTime? f = HL.Core.Global.Convert.ToDateTime(model.From, DateTime.MinValue);
            DateTime? t = HL.Core.Global.Convert.ToDateTime(model.To, DateTime.MaxValue);
            DateTime? from = f != DateTime.MinValue ? f : dFrom != null ? dFrom : null;
            DateTime? to = t != DateTime.MaxValue ? t : dTo != null ? dTo : null;
            model.From = from != null ? HL.Core.Global.Convert.ToDateTime(from).ToShortDateString() : "";
            model.To = to != null ? HL.Core.Global.Convert.ToDateTime(to).ToShortDateString() : "";

            // tao danh sach
            var dbQuery = ModIncidentService.Instance.CreateQuery().Where(o => o.ParentID != null)
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .Where(from != null, o => o.AttackOn >= from)
                                .Where(to != null, o => o.AttackOn <= to)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        //public void ActionIndex(ModIncidentModel model)
        //{
        //    // sap xep tu dong
        //    string orderBy = AutoSort(model.Sort);
        //    string orderAdd = string.Empty;
        //    if (model.ISPState == 1)
        //    {
        //        orderAdd += "ChildNum DESC";
        //    }
        //    else if (model.ISPState == 2)
        //    {
        //        orderAdd += "ChildNum ASC";
        //    }
        //    string saperate = "";
        //    if (!string.IsNullOrEmpty(orderAdd))
        //    {
        //        saperate = ",";
        //    }
        //    if (model.DomainState == 1)
        //    {
        //        orderAdd += saperate + "ChildNum DESC";
        //    }
        //    else if (model.DomainState == 2)
        //    {
        //        orderAdd += saperate + "ChildNum ASC";
        //    }

        //    DateTime? f = HL.Core.Global.Convert.ToDateTime(model.From, DateTime.MinValue);
        //    DateTime? t = HL.Core.Global.Convert.ToDateTime(model.To, DateTime.MaxValue);
        //    DateTime? from = f != DateTime.MinValue ? f : null;
        //    DateTime? to = t != DateTime.MaxValue ? t : null;

        //    // tao danh sach
        //    var dbQuery = ModIncidentService.Instance.CreateQuery().Where(o => o.ParentID == null)
        //                        .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
        //                        .Where(model.State > 0, o => (o.State & model.State) == model.State)
        //                        .Where(from != null, o => o.AttackOn >= from)
        //                        .Where(to != null, o => o.AttackOn <= to)
        //                        .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
        //                        .Select(o => new ModIncidentEntity()
        //                        {
        //                            ID = o.ID,
        //                            ParentID = o.ParentID,
        //                            MenuID = o.MenuID,
        //                            State = o.State,
        //                            Name = o.Name,
        //                            Code = o.Code,
        //                            Path = o.Path,
        //                            FakeDestination = o.FakeDestination,
        //                            Source = o.Source,
        //                            AttackOn = o.AttackOn,
        //                            IP = o.IP,
        //                            ISP = o.ISP,
        //                            EmailNo = o.EmailNo,
        //                            Attacker = o.Attacker,
        //                            MalwareName = o.MalwareName,
        //                            AttackerIP = o.AttackerIP,
        //                            NetworkName = o.NetworkName,
        //                            LocalIP = o.LocalIP,
        //                            LocalTCPPort = o.LocalTCPPort,
        //                            Timestamp = o.Timestamp,
        //                            ASN = o.ASN,
        //                            Geo = o.Geo,
        //                            Url = o.Url,
        //                            Type = o.Type,
        //                            HttpAgent = o.HttpAgent,
        //                            SrcPort = o.SrcPort,
        //                            HostName = o.HostName,
        //                            Destinationport = o.Destinationport,
        //                            Protocol = o.Protocol,
        //                            ServerName = o.ServerName,
        //                            Server = o.Server,
        //                            Header = o.Header,
        //                            Tag = o.Tag,
        //                            Region = o.Region,
        //                            City = o.City,
        //                            Sector = o.Sector,
        //                            Published = o.Published,
        //                            Order = o.Order,
        //                            Resolve = o.Resolve,
        //                            Activity = o.Activity,
        //                            ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ParentID == o.ID).ToList().Count
        //                        })
        //                        .OrderBy("ChildNum DESC")
        //                        .Take(model.PageSize)
        //                        .OrderBy(orderBy)
        //                        .Skip(model.PageIndex * model.PageSize);

        //    ViewBag.Data = dbQuery.ToList();
        //    model.TotalRecord = dbQuery.TotalRecord;
        //    ViewBag.Model = model;
        //}

        public void ActionDeface(ModIncidentModel model)
        {
            model.Menu = "Deface";
            var menu = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Code == model.Menu).ToSingle();
            model.MenuID = menu != null ? menu.ID : 0;

            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);
            string orderAdd = string.Empty;
            if (model.ISPState == 1)
            {
                orderAdd += "ChildNum DESC";
            }
            else if (model.ISPState == 2)
            {
                orderAdd += "ChildNum ASC";
            }

            DateTime? f = HL.Core.Global.Convert.ToDateTime(model.From, DateTime.MinValue);
            DateTime? t = HL.Core.Global.Convert.ToDateTime(model.To, DateTime.MaxValue);
            DateTime? from = f != DateTime.MinValue ? f : null;
            DateTime? to = t != DateTime.MaxValue ? t : null;
            var all = ModIncidentService.Instance.CreateQuery()
                                //.Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .Where(from != null, o => o.AttackOn >= from)
                                .Where(to != null, o => o.AttackOn <= to)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                                .ToList();

            // Tao danh sach cha
            var dbQuery = ModIncidentService.Instance.CreateQuery()
                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                .Select(o => o.ISP)
                //.OrderBy("ChildNum DESC")
                //.Take(model.PageSize)
                //.Skip(model.PageIndex * model.PageSize)
                .Distinct();
            if (dbQuery.ToList() == null)
            {
                ViewBag.Data = new List<ModIncidentEntity>();
                ViewBag.All = new List<ModIncidentEntity>();
                model.TotalRecord = 0;
                ViewBag.Model = model;
                return;
            }

            var list = new List<ModIncidentEntity>();
            if (model.ISPState == 1)
            {
                list = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    ISP = o.ISP,
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
                })
                .OrderByDescending(o => o.ChildNum)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }
            else if (model.ISPState == 2)
            {
                list = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    ISP = o.ISP,
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
                })
                .OrderBy(o => o.ChildNum)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }
            else
            {
                list = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    ISP = o.ISP,
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
                })
                .OrderBy(o => o.ISP)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }

            ViewBag.Data = list;
            ViewBag.All = all;
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionBotnet(ModIncidentModel model)
        {
            model.Menu = "Botnet";
            var menu = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Code == model.Menu).ToSingle();
            model.MenuID = menu != null ? menu.ID : 0;

            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);
            string orderAdd = string.Empty;
            if (model.ISPState == 1)
            {
                orderAdd += "ChildNum DESC";
            }
            else if (model.ISPState == 2)
            {
                orderAdd += "ChildNum ASC";
            }

            DateTime? f = HL.Core.Global.Convert.ToDateTime(model.From, DateTime.MinValue);
            DateTime? t = HL.Core.Global.Convert.ToDateTime(model.To, DateTime.MaxValue);
            DateTime? from = f != DateTime.MinValue ? f : null;
            DateTime? to = t != DateTime.MaxValue ? t : null;
            var all = ModIncidentService.Instance.CreateQuery()
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .Where(from != null, o => o.AttackOn >= from)
                                .Where(to != null, o => o.AttackOn <= to)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                                .ToList();

            // Tao danh sach cha
            var dbQuery = ModIncidentService.Instance.CreateQuery()
                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                .Select(o => o.ISP)
                .Distinct();
            if (dbQuery.ToList() == null)
            {
                ViewBag.Data = new List<ModIncidentEntity>();
                ViewBag.All = new List<ModIncidentEntity>();
                model.TotalRecord = 0;
                ViewBag.Model = model;
                return;
            }

            var list = new List<ModIncidentEntity>();
            if (model.ISPState == 1)
            {
                list = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    ISP = o.ISP,
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
                })
                .OrderByDescending(o => o.ChildNum)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }
            else if (model.ISPState == 2)
            {
                list = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    ISP = o.ISP,
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
                })
                .OrderBy(o => o.ChildNum)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }
            else
            {
                list = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    ISP = o.ISP,
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
                })
                .OrderBy(o => o.ISP)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }

            ViewBag.Data = list;
            ViewBag.All = all;
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionPhishing(ModIncidentModel model)
        {
            model.Menu = "Phishing";
            var menu = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Code == model.Menu).ToSingle();
            model.MenuID = menu != null ? menu.ID : 0;

            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);
            string orderAdd = string.Empty;
            if (model.PhishingState == 1 || model.PhishingState == 3)
            {
                orderAdd += "ChildNum DESC";
            }
            else if (model.PhishingState == 2 || model.PhishingState == 4)
            {
                orderAdd += "ChildNum ASC";
            }

            DateTime? f = HL.Core.Global.Convert.ToDateTime(model.From, DateTime.MinValue);
            DateTime? t = HL.Core.Global.Convert.ToDateTime(model.To, DateTime.MaxValue);
            DateTime? from = f != DateTime.MinValue ? f : null;
            DateTime? to = t != DateTime.MaxValue ? t : null;
            var all = ModIncidentService.Instance.CreateQuery()
                                //.Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .Where(from != null, o => o.AttackOn >= from)
                                .Where(to != null, o => o.AttackOn <= to)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                                .ToList();

            // Tao danh sach cha
            DBQuery<ModIncidentEntity> dbQuery = null;
            if (model.PhishingState == 1 || model.PhishingState == 2)
            {
                dbQuery = ModIncidentService.Instance.CreateQuery()
                    .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                    .Select(o => o.Path)
                    .Distinct();
            }
            else
            {
                dbQuery = ModIncidentService.Instance.CreateQuery()
                    .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                    .Select(o => o.ISP)
                    .Distinct();
            }
            if (dbQuery == null || dbQuery.ToList() == null)
            {
                ViewBag.Data = new List<ModIncidentEntity>();
                ViewBag.All = new List<ModIncidentEntity>();
                model.TotalRecord = 0;
                ViewBag.Model = model;
                return;
            }

            var list = new List<ModIncidentEntity>();
            if (model.PhishingState == 1)
            {
                list = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    Path = o.Path,
                    ISP = "",
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.Path == o.Path).ToList().Count
                })
                .OrderByDescending(o => o.ChildNum)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }
            else if (model.PhishingState == 2)
            {
                list = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    Path = o.Path,
                    ISP = "",
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.Path == o.Path).ToList().Count
                })
                .OrderBy(o => o.ChildNum)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }
            else if (model.PhishingState == 3)
            {
                list = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    Path = "",
                    ISP = o.ISP,
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
                })
                .OrderByDescending(o => o.ChildNum)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }
            else if (model.PhishingState == 4)
            {
                list = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    Path = "",
                    ISP = o.ISP,
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
                })
                .OrderBy(o => o.ChildNum)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }
            else
            {
                list = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    Path = o.Path,
                    ISP = "",
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.Path == o.Path).ToList().Count
                })
                .OrderBy(o => o.Path)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }

            ViewBag.Data = list;
            ViewBag.All = all;
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionMalware(ModIncidentModel model)
        {
            model.Menu = "Malware";
            var menu = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Code == model.Menu).ToSingle();
            model.MenuID = menu != null ? menu.ID : 0;

            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);
            string orderAdd = string.Empty;
            if (model.MalwareState == 1 || model.MalwareState == 3)
            {
                orderAdd += "ChildNum DESC";
            }
            else if (model.MalwareState == 2 || model.MalwareState == 4)
            {
                orderAdd += "ChildNum ASC";
            }

            DateTime? f = HL.Core.Global.Convert.ToDateTime(model.From, DateTime.MinValue);
            DateTime? t = HL.Core.Global.Convert.ToDateTime(model.To, DateTime.MaxValue);
            DateTime? from = f != DateTime.MinValue ? f : null;
            DateTime? to = t != DateTime.MaxValue ? t : null;
            var all = ModIncidentService.Instance.CreateQuery()
                                //.Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .Where(from != null, o => o.AttackOn >= from)
                                .Where(to != null, o => o.AttackOn <= to)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                                .ToList();

            // Tao danh sach cha
            DBQuery<ModIncidentEntity> dbQuery = null;
            if (model.MalwareState == 1 || model.MalwareState == 2)
            {
                dbQuery = ModIncidentService.Instance.CreateQuery()
                    .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                    .Select(o => o.MalwareName)
                    .Distinct();
            }
            else
            {
                dbQuery = ModIncidentService.Instance.CreateQuery()
                    .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                    .Select(o => o.ISP)
                    .Distinct();
            }
            if (dbQuery.ToList() == null)
            {
                ViewBag.Data = new List<ModIncidentEntity>();
                ViewBag.All = new List<ModIncidentEntity>();
                model.TotalRecord = 0;
                ViewBag.Model = model;
                return;
            }

            var list = new List<ModIncidentEntity>();
            if (model.MalwareState == 1)
            {
                list = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    MalwareName = o.MalwareName,
                    ISP = "",
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.MalwareName == o.MalwareName).ToList().Count
                })
                .OrderByDescending(o => o.ChildNum)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }
            else if (model.MalwareState == 2)
            {
                list = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    MalwareName = o.MalwareName,
                    ISP = "",
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.MalwareName == o.MalwareName).ToList().Count
                })
                .OrderBy(o => o.ChildNum)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }
            else if (model.MalwareState == 3)
            {
                list = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    MalwareName = "",
                    ISP = o.ISP,
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
                })
                .OrderByDescending(o => o.ChildNum)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }
            else if (model.MalwareState == 4)
            {
                list = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    MalwareName = "",
                    ISP = o.ISP,
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
                })
                .OrderBy(o => o.ChildNum)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }
            else
            {
                list = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    MalwareName = o.MalwareName,
                    ISP = "",
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.MalwareName == o.MalwareName).ToList().Count
                })
                .OrderBy(o => o.MalwareName)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }

            ViewBag.Data = list;
            ViewBag.All = all;
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        #region Export
        public void ActionExport(ModIncidentModel model)
        {
            RenderView(model.Menu);

            //var menu = WebMenuService.Instance.CreateQuery().Where(o => o.Activity == true && o.Code == model.Menu).ToSingle();
            //model.MenuID = menu != null ? menu.ID : 0;

            //lấy danh sách
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);
            string orderAdd = string.Empty;
            if (model.ISPState == 1)
            {
                orderAdd += "ChildNum DESC";
            }
            else if (model.ISPState == 2)
            {
                orderAdd += "ChildNum ASC";
            }

            DateTime? f = HL.Core.Global.Convert.ToDateTime(model.From, DateTime.MinValue);
            DateTime? t = HL.Core.Global.Convert.ToDateTime(model.To, DateTime.MaxValue);
            DateTime? from = f != DateTime.MinValue ? f : null;
            DateTime? to = t != DateTime.MaxValue ? t : null;
            var all = ModIncidentService.Instance.CreateQuery()
                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                .Where(from != null, o => o.AttackOn >= from)
                .Where(to != null, o => o.AttackOn <= to)
                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                .ToList();

            // Tao danh sach cha
            var dbQuery = ModIncidentService.Instance.CreateQuery()
                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                .Select(o => o.ISP)
                .Distinct();
            var lst = dbQuery.ToList();
            if (lst == null || all == null)
            {
                CPViewPage.SetMessage("Không có dữ liệu.");
                return;
            }

            var listEntity = new List<ModIncidentEntity>();
            if (model.ISPState == 1)
            {
                listEntity = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    ISP = o.ISP,
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
                })
                .OrderByDescending(o => o.ChildNum)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }
            else if (model.ISPState == 2)
            {
                listEntity = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    ISP = o.ISP,
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
                })
                .OrderBy(o => o.ChildNum)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }
            else
            {
                listEntity = dbQuery.ToList().Select(o => new ModIncidentEntity
                {
                    ISP = o.ISP,
                    AttackOn = null,
                    ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
                })
                .OrderBy(o => o.ISP)
                .Take(model.PageSize)
                .Skip(model.PageIndex * model.PageSize)
                .ToList();
            }

            //khai báo tập hợp bản ghi excel
            List<List<object>> list = new List<List<object>>();
            //khai báo 1 dòng excel
            List<object> _list = null;
            for (int i = 0; listEntity != null && listEntity.Count > 0 && i < listEntity.Count; i++)
            {
                _list = new List<object>();
                // _list.Add(i + 1);
                _list.Add(listEntity[i].ISP);
                var ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == listEntity[i].ISP).ToList().Count;
                _list.Add(ChildNum);
                list.Add(_list);
            }

            //ghi exel
            string temp_file = CPViewPage.Server.MapPath("~/Data/upload/files/Excel/BaoCaoSuCo_" + model.Menu + "_" +
            string.Format("{0:yyyy_MM_dd}", DateTime.Now) + ".xlsx");
            string filePath = CPViewPage.Server.MapPath("~/TTPortal/Templates/Export_Deface.xlsx");
            Excel.Export(list, 1, filePath, temp_file);
            //CPViewPage.Response.Write("Here!6");


            CPViewPage.Response.Clear();
            CPViewPage.Response.ContentType = "application/excel";
            CPViewPage.Response.AppendHeader("Content-Disposition", "attachment; filename=" + System.IO.Path.GetFileName(temp_file));
            CPViewPage.Response.WriteFile(temp_file);
            CPViewPage.Response.End();

            //CPViewPage.Response.Write("Here!");
        }

        public void ActionExport2(ModIncidentModel model)
        {
            RenderView(model.Menu);

            //lấy danh sách
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);
            string orderAdd = string.Empty;
            if (model.Menu == "Phishing" && (model.PhishingState == 1 || model.PhishingState == 3)
                || model.Menu == "Malware" && (model.MalwareState == 1 || model.MalwareState == 3))
            {
                orderAdd += "ChildNum DESC";
            }
            else if (model.Menu == "Phishing" && (model.PhishingState == 2 || model.PhishingState == 4)
                || model.Menu == "Malware" && (model.MalwareState == 2 || model.MalwareState == 4))
            {
                orderAdd += "ChildNum ASC";
            }

            DateTime? f = HL.Core.Global.Convert.ToDateTime(model.From, DateTime.MinValue);
            DateTime? t = HL.Core.Global.Convert.ToDateTime(model.To, DateTime.MaxValue);
            DateTime? from = f != DateTime.MinValue ? f : null;
            DateTime? to = t != DateTime.MaxValue ? t : null;
            var all = ModIncidentService.Instance.CreateQuery()
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .Where(from != null, o => o.AttackOn >= from)
                                .Where(to != null, o => o.AttackOn <= to)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                                .ToList();

            // Tao danh sach cha
            DBQuery<ModIncidentEntity> dbQuery = null;
            if (model.PhishingState == 1 || model.PhishingState == 2 || model.MalwareState == 1 || model.MalwareState == 2)
            {
                if (model.Menu == "Phishing")
                {
                    dbQuery = ModIncidentService.Instance.CreateQuery()
                        .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                        .Select(o => o.Path)
                        .Distinct();
                }
                if (model.Menu == "Malware")
                {
                    dbQuery = ModIncidentService.Instance.CreateQuery()
                        .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                        .Select(o => o.MalwareName)
                        .Distinct();
                }
            }
            else
            {
                dbQuery = ModIncidentService.Instance.CreateQuery()
                    .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("Incident", model.MenuID, model.LangID))
                    .Select(o => o.ISP)
                    .Distinct();
            }
            var lst = dbQuery.ToList();
            if (lst == null || all == null)
            {
                CPViewPage.SetMessage("Không có dữ liệu.");
                return;
            }

            var listEntity = new List<ModIncidentEntity>();
            if (model.Menu == "Phishing")
            {
                if (model.PhishingState == 1)
                {
                    listEntity = dbQuery.ToList().Select(o => new ModIncidentEntity
                    {
                        Path = o.Path,
                        ISP = "",
                        AttackOn = null,
                        ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ParentID == o.ID).ToList().Count
                    })
                    .OrderByDescending(o => o.ChildNum)
                    .Take(model.PageSize)
                    .Skip(model.PageIndex * model.PageSize)
                    .ToList();
                }
                else if (model.PhishingState == 2)
                {
                    listEntity = dbQuery.ToList().Select(o => new ModIncidentEntity
                    {
                        Path = o.Path,
                        ISP = "",
                        AttackOn = null,
                        ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ParentID == o.ID).ToList().Count
                    })
                    .OrderBy(o => o.ChildNum)
                    .Take(model.PageSize)
                    .Skip(model.PageIndex * model.PageSize)
                    .ToList();
                }
                else if (model.PhishingState == 3)
                {
                    listEntity = dbQuery.ToList().Select(o => new ModIncidentEntity
                    {
                        Path = "",
                        ISP = o.ISP,
                        AttackOn = null,
                        ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
                    })
                    .OrderByDescending(o => o.ChildNum)
                    .Take(model.PageSize)
                    .Skip(model.PageIndex * model.PageSize)
                    .ToList();
                }
                else if (model.PhishingState == 4)
                {
                    listEntity = dbQuery.ToList().Select(o => new ModIncidentEntity
                    {
                        Path = "",
                        ISP = o.ISP,
                        AttackOn = null,
                        ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
                    })
                    .OrderBy(o => o.ChildNum)
                    .Take(model.PageSize)
                    .Skip(model.PageIndex * model.PageSize)
                    .ToList();
                }
                else
                {
                    listEntity = dbQuery.ToList().Select(o => new ModIncidentEntity
                    {
                        Path = o.Path,
                        ISP = "",
                        AttackOn = null,
                        ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ParentID == o.ID).ToList().Count
                    })
                    .OrderBy(o => o.Path)
                    .Take(model.PageSize)
                    .Skip(model.PageIndex * model.PageSize)
                    .ToList();
                }
            }
            if (model.Menu == "Malware")
            {
                if (model.MalwareState == 1)
                {
                    listEntity = dbQuery.ToList().Select(o => new ModIncidentEntity
                    {
                        MalwareName = o.MalwareName,
                        ISP = "",
                        AttackOn = null,
                        ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.MalwareName == o.MalwareName).ToList().Count
                    })
                    .OrderByDescending(o => o.ChildNum)
                    .Take(model.PageSize)
                    .Skip(model.PageIndex * model.PageSize)
                    .ToList();
                }
                else if (model.MalwareState == 2)
                {
                    listEntity = dbQuery.ToList().Select(o => new ModIncidentEntity
                    {
                        MalwareName = o.MalwareName,
                        ISP = "",
                        AttackOn = null,
                        ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.MalwareName == o.MalwareName).ToList().Count
                    })
                    .OrderBy(o => o.ChildNum)
                    .Take(model.PageSize)
                    .Skip(model.PageIndex * model.PageSize)
                    .ToList();
                }
                else if (model.MalwareState == 3)
                {
                    listEntity = dbQuery.ToList().Select(o => new ModIncidentEntity
                    {
                        MalwareName = "",
                        ISP = o.ISP,
                        AttackOn = null,
                        ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
                    })
                    .OrderByDescending(o => o.ChildNum)
                    .Take(model.PageSize)
                    .Skip(model.PageIndex * model.PageSize)
                    .ToList();
                }
                else if (model.MalwareState == 4)
                {
                    listEntity = dbQuery.ToList().Select(o => new ModIncidentEntity
                    {
                        MalwareName = "",
                        ISP = o.ISP,
                        AttackOn = null,
                        ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == o.ISP).ToList().Count
                    })
                    .OrderBy(o => o.ChildNum)
                    .Take(model.PageSize)
                    .Skip(model.PageIndex * model.PageSize)
                    .ToList();
                }
                else
                {
                    listEntity = dbQuery.ToList().Select(o => new ModIncidentEntity
                    {
                        MalwareName = o.MalwareName,
                        ISP = "",
                        AttackOn = null,
                        ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.MalwareName == o.MalwareName).ToList().Count
                    })
                    .OrderBy(o => o.Path)
                    .Take(model.PageSize)
                    .Skip(model.PageIndex * model.PageSize)
                    .ToList();
                }
            }

            //khai báo tập hợp bản ghi excel
            List<List<object>> list = new List<List<object>>();
            //khai báo 1 dòng excel
            List<object> _list = null;
            for (int i = 0; listEntity != null && listEntity.Count > 0 && i < listEntity.Count; i++)
            {
                _list = new List<object>();
                // _list.Add(i + 1);
                if (model.PhishingState == 1)
                {
                    _list.Add(listEntity[i].Path);
                    var ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ParentID == listEntity[i].ID).ToList().Count;
                    _list.Add(ChildNum);
                }
                else if (model.MalwareState == 1)
                {
                    _list.Add(listEntity[i].MalwareName);
                    var ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.MalwareName == listEntity[i].MalwareName).ToList().Count;
                    _list.Add(ChildNum);
                }
                else
                {
                    _list.Add(listEntity[i].ISP);
                    var ChildNum = ModIncidentService.Instance.CreateQuery().Where(a => a.ISP == listEntity[i].ISP).ToList().Count;
                    _list.Add(ChildNum);
                }
                list.Add(_list);
            }

            //ghi exel
            string temp_file = CPViewPage.Server.MapPath("~/Data/upload/files/Excel/BaoCaoSuCo_" + model.Menu + "_" +
            string.Format("{0:yyyy_MM_dd}", DateTime.Now) + ".xlsx");
            string filePath = CPViewPage.Server.MapPath("~/TTPortal/Templates/Export_Deface.xlsx");
            Excel.Export(list, 1, filePath, temp_file);

            CPViewPage.Response.Clear();
            CPViewPage.Response.ContentType = "application/excel";
            CPViewPage.Response.AppendHeader("Content-Disposition", "attachment; filename=" + System.IO.Path.GetFileName(temp_file));
            CPViewPage.Response.WriteFile(temp_file);
            CPViewPage.Response.End();
        }
        #endregion Export

        //public void ExportToPDF(ModIncidentModel model)
        //{
        //    RenderView("Index");

        //    //lấy danh sách thuật ngữ
        //    var listEntity = ModIncidentService.Instance.CreateQuery()
        //                //.Where(o => o.Activity == true)
        //                .ToList();

        //    //khai báo tập hợp bản ghi excel
        //    List<List<object>> list = new List<List<object>>();
        //    //khai báo 1 dòng excel
        //    List<object> _list = null;
        //    string cityname = "";
        //    for (int i = 0; listEntity != null && listEntity.Count > 0 && i < listEntity.Count; i++)
        //    {
        //        _list = new List<object>();
        //        //add 1 dòng excel
        //        // _list.Add(i + 1);
        //        _list.Add(listEntity[i].Name);
        //        _list.Add(cityname);
        //        _list.Add(listEntity[i].Published);
        //        list.Add(_list);
        //    }

        //    //ghi exel
        //    string temp_file = CPViewPage.Server.MapPath("~/Data/upload/files/Excel/DanhSachSuCo_" +
        //    string.Format("{0:dd_MM_yyyy}", DateTime.Now) + ".xls");
        //    string filePath = CPViewPage.Server.MapPath("~/TTPortal/Templates/DanhSachSuCo.xlsx");



        //    CPViewPage.Response.ContentType = "application/pdf";
        //    CPViewPage.Response.AddHeader("content-disposition", "attachment;filename=DataTable.pdf");
        //    CPViewPage.Response.Cache.SetCacheability(HttpCacheability.NoCache);
        //    StringWriter sw = new StringWriter();
        //    HtmlTextWriter hw = new HtmlTextWriter(sw);
        //    GridView1.RenderControl(hw);
        //    StringReader sr = new StringReader(sw.ToString());
        //    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
        //    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        //    PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        //    pdfDoc.Open();
        //    htmlparser.Parse(sr);
        //    pdfDoc.Close();
        //    CPViewPage.Response.Write(pdfDoc);
        //    CPViewPage.Response.End();
        //}

    }

}
