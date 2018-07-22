using System;
using System.Collections.Generic;
using Aspose.Cells;
using HL.Lib.Models;
using HL.Lib.Global;
using HL.Lib.CPControllers;
using HL.Lib.Common;

namespace HL.Lib
{
    public class Excel
    {
        public static void Export(List<List<object>> list, int start_row, string oldExcelFile, string newExcelFile)
        {
            if (list == null || !System.IO.File.Exists(oldExcelFile))
                return;

            Workbook workbook = new Workbook();
#pragma warning disable CS0618 // Type or member is obsolete
            workbook.Open(oldExcelFile);
#pragma warning restore CS0618 // Type or member is obsolete

            Cells cells = workbook.Worksheets[0].Cells;

            for (int i = 0; i < list.Count; i++)
            {
                for (int j = 0; j < list[i].Count; j++)
                {
                    cells[start_row + i, j].PutValue(list[i][j]);
                }
            }
            workbook.Save(newExcelFile);
            //Error.Write("sau khi save");
        }

        //        public static int ImportExcel_Incident(ModIncidentModel model, ref string errMsg, ref string succMsg)
        //        {
        //            ModIncidentEntity item = null;
        //            List<ModIncidentEntity> adds = new List<ModIncidentEntity>();
        //            int count = 0;
        //            string apiWhoisDomain = HL.Core.Global.Config.GetValue("Mod.APIWhoIsDomain1").ToString();

        //            try
        //            {
        //                Workbook workbook = new Workbook();
        //#pragma warning disable CS0618 // Type or member is obsolete
        //                workbook.Open(model.FilePath);
        //#pragma warning restore CS0618 // Type or member is obsolete

        //                if (workbook.Worksheets[0] != null)
        //                {
        //                    int rowCount = workbook.Worksheets[0].Cells.Rows.Count;
        //                    int colCount = workbook.Worksheets[0].Cells.Columns.Count;
        //                    int order = 0;
        //                    string rowNumNotValid = string.Empty, rowNotGetAPI = string.Empty, rowExist = string.Empty;
        //                    string host = "", pathAndQuery = "", api = "";
        //                    DateTime d = DateTime.Now;
        //                    var loaiSuCo = WebMenuService.Instance.CreateQuery().Where(o => o.Type == "Incident" && o.ID == model.MenuID).ToSingle();

        //                    errMsg = Valid_Incident_ColNum(loaiSuCo, colCount);
        //                    if (!string.IsNullOrEmpty(errMsg)) return count;

        //                    order = ModIncidentService.Instance.CreateQuery()
        //                        .Max(o => o.Order)
        //                        .ToValue()
        //                        .ToInt(0);

        //                    Worksheet workSheet;
        //                    for (int i = 1; i < rowCount; i++)
        //                    {
        //                        workSheet = workbook.Worksheets[0];
        //                        host = ""; pathAndQuery = "";

        //                        if (colCount >= 4
        //                            && string.IsNullOrEmpty(workSheet.Cells[i, 0].Value.ToString())
        //                            && string.IsNullOrEmpty(workSheet.Cells[i, 1].Value.ToString())
        //                            && string.IsNullOrEmpty(workSheet.Cells[i, 2].Value.ToString())
        //                            && string.IsNullOrEmpty(workSheet.Cells[i, 3].Value.ToString()))
        //                        {
        //                            continue;
        //                        }

        //                        try
        //                        {
        //                            // Deface: Link Deface, Thời gian, Nguồn Thông tin, Nguười tấn công, IP, Thông tin ISP
        //                            // DefaceId, Path, Attacker, Source, AttankOn, IP, ISP, Status, EmailNo
        //                            if (loaiSuCo.Code == Constant.INCIDENT_CODE_DEFACE)
        //                            {
        //                                item = new ModIncidentEntity()
        //                                {
        //                                    Path = workSheet.Cells[i, 0].Value.ToString(), // Link
        //                                    Attacker = workSheet.Cells[i, 1].Value.ToString(), // Nguoi tan cong
        //                                    AttackOn = HL.Core.Global.Convert.ToDateTime(workSheet.Cells[i, 2].Value.ToString()), // Thoi gian
        //                                    Source = workSheet.Cells[i, 3].Value.ToString() // Nguon
        //                                };
        //                            }

        //                            // Phishing: Link phishing, Đích giả mạo, Nguồn Thông tin, Thời gian, IP, Thông tin ISP
        //                            // PhishingId, Path, FakeDestination, Source, AttankOn, IP, ISP, Status, EmailNo
        //                            if (loaiSuCo.Code == Constant.INCIDENT_CODE_PHISHING)
        //                            {
        //                                item = new ModIncidentEntity()
        //                                {
        //                                    Path = workSheet.Cells[i, 0].Value.ToString(), // Link
        //                                    FakeDestination = workSheet.Cells[i, 1].Value.ToString(), // Dich gia mao
        //                                    AttackOn = HL.Core.Global.Convert.ToDateTime(workSheet.Cells[i, 2].Value.ToString()), // Thoi gian
        //                                    Source = workSheet.Cells[i, 3].Value.ToString() // Nguon
        //                                };
        //                            }

        //                            // Malware: Link nhiễm malware, Tên virus, IP, IPS, Thời gian, Nguồn Thông tin
        //                            // MalwareId, Path, MalwareName, Source, AttankOn, IP, ISP, Status, EmailNo
        //                            if (loaiSuCo.Code == Constant.INCIDENT_CODE_MALWARE)
        //                            {
        //                                item = new ModIncidentEntity()
        //                                {
        //                                    Path = workSheet.Cells[i, 0].Value.ToString(), // Link
        //                                    MalwareName = workSheet.Cells[i, 1].Value.ToString(), // Ten virus
        //                                    AttackOn = HL.Core.Global.Convert.ToDateTime(workSheet.Cells[i, 2].Value.ToString()), // Thoi gian
        //                                    Source = workSheet.Cells[i, 3].Value.ToString() // Nguon thong tin
        //                                };
        //                            }

        //                            // C&C botnet: times, attacker IP (tại VN bị nhiễm), network name, local IP, local TCP port
        //                            // BotnetId, AttackerIP, NetwordName, LocalIP, LocalTCPPort, AttankOn, IP, ISP, Status, EmailNo
        //                            if (loaiSuCo.Code == Constant.INCIDENT_CODE_BOTNET)
        //                            {
        //                                item = new ModIncidentEntity()
        //                                {
        //                                    Path = workSheet.Cells[i, 0].Value.ToString(), // Link
        //                                    MalwareName = workSheet.Cells[i, 1].Value.ToString(), // Ten virus
        //                                    AttackOn = HL.Core.Global.Convert.ToDateTime(workSheet.Cells[i, 2].Value.ToString()), // Thoi gian
        //                                    Source = workSheet.Cells[i, 3].Value.ToString() // Nguon thong tin
        //                                };
        //                            }

        //                            // Attack: timestamp,IP,asn,geo,url,type (downadup),http_agent(Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)),src_port(1938,1499 ...),hostname (static.vnpt.vn, localhost ),dst_port (Địa chỉ cổng đích),protocol (udp or tcp),servername,server,header (HTTP/1.1 200 OK),tag (netis_vulnerability,cwmp,memcached,rdp ...),handshake
        //                            // Attack Id, Timestamp, IP, ISP, ASN, Geo, Url, Type , HttpAgent, SrcPort, HostName, Destinationport, Protocol, ServerName, Server, Header, Tag, Region, City, Sector, Status, EmailNo
        //                            //item = new ModIncidentEntity()
        //                            //{
        //                            //    Timestamp         = workSheet.Cells[i, 0].Value.ToString(),
        //                            //    ASN               = workSheet.Cells[i, 0].Value.ToString(),
        //                            //    Geo               = workSheet.Cells[i, 0].Value.ToString(),
        //                            //    Url               = workSheet.Cells[i, 0].Value.ToString(),
        //                            //    Type              = workSheet.Cells[i, 0].Value.ToString(),
        //                            //    HttpAgent         = workSheet.Cells[i, 0].Value.ToString(),
        //                            //    SrcPort           = workSheet.Cells[i, 0].Value.ToString(),
        //                            //    HostName          = workSheet.Cells[i, 0].Value.ToString(),
        //                            //    Destinationport   = workSheet.Cells[i, 0].Value.ToString(),
        //                            //    Protocol          = workSheet.Cells[i, 0].Value.ToString(),
        //                            //    ServerName        = workSheet.Cells[i, 0].Value.ToString(),
        //                            //    Server            = workSheet.Cells[i, 0].Value.ToString(),
        //                            //    Header            = workSheet.Cells[i, 0].Value.ToString(),
        //                            //    Tag               = workSheet.Cells[i, 0].Value.ToString(),
        //                            //    Region            = workSheet.Cells[i, 0].Value.ToString(),
        //                            //    City              = workSheet.Cells[i, 0].Value.ToString(),
        //                            //    Sector            = workSheet.Cells[i, 0].Value.ToString()
        //                            //};

        //                            // CVE: CVE ID,Vulnerability Type(s) (Exec Code,DoS CSRF,+Info, XSS ...),Product ,Publish Date,Update Date,Score,Gained Access Level (None)
        //                            // CVEId, VulnerabilityType, Product , Publish Date, Update Date, Score, GainedAccessLevel, Status, EmailNo
        //                            //item = new ModIncidentEntity()
        //                            //{
        //                            //};

        //                            Uri uri = new Uri(item.Path);
        //                            host = uri.Host; pathAndQuery = uri.PathAndQuery;
        //                            if (!string.IsNullOrEmpty(apiWhoisDomain)) api = apiWhoisDomain.Replace("DOMAIN", host);

        //                        }
        //                        catch
        //                        {
        //                            rowNumNotValid += string.IsNullOrEmpty(rowNumNotValid) ? (i + 1).ToString() : ("," + (i + 1));
        //                            continue;
        //                        }
        //                        item.MenuID = model.MenuID; // Loai su co

        //                        // Kiem tra ton tai trong db
        //                        var exist = ModIncidentService.Instance.CreateQuery().Where(o => o.Activity == true && o.MenuID == item.MenuID && o.Resolve == false && o.Name == item.Path).ToSingle();
        //                        if (exist != null)
        //                        {
        //                            rowExist += string.IsNullOrEmpty(rowExist) ? (i + 1).ToString() : ("," + (i + 1));
        //                            continue;
        //                        }

        //                        // Get IP, ISP from API
        //                        var data = Utils.DownloadJsonToData<WhoiIsDomain>(api, ref errMsg);
        //                        if (data != null && string.IsNullOrEmpty(errMsg))
        //                        {
        //                            item.IP = data.Query;
        //                            item.ISP = data.ISP;
        //                        }
        //                        else
        //                        {
        //                            rowNotGetAPI += string.IsNullOrEmpty(rowNotGetAPI) ? (i + 1).ToString() : ("," + (i + 1));
        //                        }

        //                        item.EmailNo = 0;       // Lan gui mail
        //                        item.State = 0;         // Trang thai: 1 - Da giai quyet; 0 - Chua giai quyet
        //                        item.Resolve = false;   // Trang thai: true - Da giai quyet; false - Chua giai quyet
        //                        item.Published = d;
        //                        item.Order = order;
        //                        item.Activity = true;

        //                        // Save
        //                        order++;
        //                        item.Name = item.Path;
        //                        item.Code = Data.GetCode(item.Path);
        //                        adds.Add(item);
        //                        //ModIncidentService.Instance.Save(item);

        //                        count++;
        //                    }
        //                    ModIncidentService.Instance.Save(adds);

        //                    if (!string.IsNullOrEmpty(rowNumNotValid))
        //                    {
        //                        succMsg += "<br />Các dòng trong file không hợp lệ: " + rowNumNotValid;
        //                    }
        //                    if (!string.IsNullOrEmpty(rowExist))
        //                    {
        //                        succMsg += "<br />Các dòng trong file đã tồn tại: " + rowExist;
        //                    }
        //                    if (!string.IsNullOrEmpty(rowNotGetAPI))
        //                    {
        //                        succMsg += "<br />Các dòng trong file không lấy được IP, ISP từ API: " + rowNotGetAPI;
        //                    }
        //                }
        //            }
        //            catch (Exception ex)
        //            {
        //                Error.Write(ex.Message);
        //                errMsg = "Lỗi import file. Dữ liệu không đúng định dạng.";
        //            }

        //            return count;
        //        }

        public static int ImportExcel_Incident(ModIncidentModel model, ref string errMsg, ref string succMsg)
        {
            WebMenuEntity loaiSuCo = null;
            string rowNumNotValid = string.Empty, rowNotGetAPI = string.Empty, rowExist = string.Empty;
            int j = 0, rowCount = 0, colCount = 0, c = 0, count = 0;

            try
            {
                Workbook workbook = new Workbook();
#pragma warning disable CS0618 // Type or member is obsolete
                workbook.Open(model.FilePath);
#pragma warning restore CS0618 // Type or member is obsolete

                string apiWhoisDomain = HL.Core.Global.Config.GetValue("Mod.APIWhoIsDomain1").ToString();
                c = workbook.Worksheets.Count;
                Worksheet ws = null;
                for (j = 0; j < c; j++)
                {
                    ws = workbook.Worksheets[j];
                    loaiSuCo = WebMenuService.Instance.CreateQuery().Where(o => o.Type == "Incident" && o.ID == model.MenuID).ToSingle();
                    if (ws.Name != loaiSuCo.Code)
                    {
                        ws = null;
                        continue;
                    }
                    else break;
                }

                if (ws == null)
                {
                    errMsg = "Tên sheet không phù hợp với loại sự cố import";
                    return 0;
                }

                rowCount = ws.Cells.Rows.Count;
                colCount = ws.Cells.Columns.Count;
                errMsg = Valid_Incident_ColNum(loaiSuCo, colCount);
                if (!string.IsNullOrEmpty(errMsg)) return count;

                switch (ws.Name)
                {
                    case (Constant.INCIDENT_CODE_DEFACE):
                        count = ImportExcel_Incident_Deface(ws, model, ref errMsg, ref succMsg);
                        break;
                    case (Constant.INCIDENT_CODE_PHISHING):
                        count = ImportExcel_Incident_Phishing(ws, model, ref errMsg, ref succMsg);
                        break;
                    case (Constant.INCIDENT_CODE_MALWARE):
                        count = ImportExcel_Incident_Malware(ws, model, ref errMsg, ref succMsg);
                        break;
                    case (Constant.INCIDENT_CODE_BOTNET):
                        count = ImportExcel_Incident_Botnet(ws, model, ref errMsg, ref succMsg);
                        break;
                    case (Constant.INCIDENT_CODE_ATTACK):
                        count = ImportExcel_Incident_Attack(ws, model, ref errMsg, ref succMsg);
                        break;
                    default:
                        break;
                }
            }
            catch (Exception ex)
            {
                Error.Write(ex.Message);
                errMsg = "Lỗi import file. Dữ liệu không đúng định dạng.";
            }

            return count;
        }

        /// <summary>
        /// Deface: Link Deface, Thời gian, Nguồn Thông tin, Nguười tấn công, IP, Thông tin ISP
        /// DefaceId, Path, Attacker, Source, AttankOn, IP, ISP, Status, EmailNo
        /// </summary>
        /// <param name="ws">Worksheet</param>
        /// <param name="model">ModIncidentModel</param>
        /// <param name="errMsg">Error message</param>
        /// <param name="succMsg">Success message</param>
        private static int ImportExcel_Incident_Deface(Worksheet ws, ModIncidentModel model, ref string errMsg, ref string succMsg)
        {
            int i = 0, order = 0, insertedCount = 0;
            DateTime d = DateTime.Now;
            ModIncidentEntity item = null, p = null;
            int rowCount = ws.Cells.Rows.Count;
            int colCount = ws.Cells.Columns.Count;
            string rowNumNotValid = string.Empty, rowNotGetAPI = string.Empty, rowExist = string.Empty;
            string apiWhoisDomain = HL.Core.Global.Config.GetValue("Mod.APIWhoIsDomain1").ToString();
            string host = "", pathAndQuery = "", api = "";

            order = ModIncidentService.Instance.CreateQuery()
                .Max(o => o.Order)
                .ToValue()
                .ToInt(0);

            for (i = 1; i < rowCount; i++)
            {
                host = ""; pathAndQuery = "";

                if (colCount >= 4
                    && string.IsNullOrEmpty(ws.Cells[i, 0].Value.ToString())
                    && string.IsNullOrEmpty(ws.Cells[i, 1].Value.ToString())
                    && string.IsNullOrEmpty(ws.Cells[i, 2].Value.ToString())
                    && string.IsNullOrEmpty(ws.Cells[i, 3].Value.ToString()))
                {
                    rowNumNotValid += string.IsNullOrEmpty(rowNumNotValid) ? (i + 1).ToString() : ("," + (i + 1));
                    continue;
                }

                try
                {
                    Uri uri = new Uri(ws.Cells[i, 0].Value.ToString());
                    host = uri.Host; pathAndQuery = uri.PathAndQuery;
                    if (!string.IsNullOrEmpty(apiWhoisDomain)) api = apiWhoisDomain.Replace("DOMAIN", host);

                    item = new ModIncidentEntity()
                    {
                        Path = ws.Cells[i, 0].Value.ToString(), // Link
                        Attacker = ws.Cells[i, 1].Value.ToString(), // Nguoi tan cong
                        AttackOn = HL.Core.Global.Convert.ToDateTime(ws.Cells[i, 2].Value.ToString()), // Thoi gian
                        Source = ws.Cells[i, 3].Value.ToString() // Nguon
                    };
                }
                catch
                {
                    rowNumNotValid += string.IsNullOrEmpty(rowNumNotValid) ? (i + 1).ToString() : ("," + (i + 1));
                    continue;
                }
                item.MenuID = model.MenuID; // Loai su co

                // Kiem tra ton tai trong db
                var exist = ModIncidentService.Instance.CreateQuery().Where(o => o.Activity == true && o.MenuID == item.MenuID && o.Resolve == false && o.Name == item.Path).ToSingle();
                if (exist != null)
                {
                    rowExist += string.IsNullOrEmpty(rowExist) ? (i + 1).ToString() : ("," + (i + 1));
                    continue;
                }

                // Get IP, ISP from API
                var data = Utils.DownloadJsonToData<WhoiIsDomain>(api, ref errMsg);
                if (data != null && string.IsNullOrEmpty(errMsg))
                {
                    item.IP = data.Query;
                    item.ISP = data.ISP;
                }
                else
                {
                    rowNotGetAPI += string.IsNullOrEmpty(rowNotGetAPI) ? (i + 1).ToString() : ("," + (i + 1));
                }

                item.EmailNo = 0;       // Lan gui mail
                item.State = 0;         // Trang thai: 1 - Da giai quyet; 0 - Chua giai quyet
                item.Resolve = false;   // Trang thai: true - Da giai quyet; false - Chua giai quyet
                item.Published = d;
                item.Activity = true;

                // Save
                int? parentId = null;
                p = ModIncidentService.Instance.CreateQuery().Where(o => o.Path == host).ToSingle();
                if (p == null)
                {
                    order++;
                    p = new ModIncidentEntity()
                    {
                        Path = host,
                        Name = host,
                        Code = Data.GetCode(host),
                        IP = data.Query,
                        ISP = data.ISP,
                        Published = d,
                        Order = order,
                        Activity = true,
                    };
                    parentId = ModIncidentService.Instance.Save(p);
                }
                else
                {
                    parentId = p.ID;
                }
                string oldPath = item.Path;

                // Save Child
                order++;
                item.Name = oldPath;
                item.Code = Data.GetCode(oldPath);
                item.Path = oldPath;
                item.ParentID = parentId;
                ModIncidentService.Instance.Save(item);

                insertedCount++;
            }

            if (!string.IsNullOrEmpty(rowNumNotValid))
            {
                succMsg += "<br />Dữ liệu không hợp lệ, dòng số: " + rowNumNotValid;
            }
            if (!string.IsNullOrEmpty(rowExist))
            {
                succMsg += "<br />Dữ liệu đã tồn tại, dòng số: " + rowExist;
            }
            if (!string.IsNullOrEmpty(rowNotGetAPI))
            {
                succMsg += "<br />Không lấy được IP, ISP từ API, dòng số: " + rowNotGetAPI;
            }

            return insertedCount;
        }

        /// <summary>
        /// Malware: Link nhiễm malware, Tên virus, IP, IPS, Thời gian, Nguồn Thông tin
        /// MalwareId, Path, MalwareName, Source, AttankOn, IP, ISP, Status, EmailNo
        /// </summary>
        /// <param name="ws">Worksheet</param>
        /// <param name="model">ModIncidentModel</param>
        /// <param name="errMsg">Error message</param>
        /// <param name="succMsg">Success message</param>
        private static int ImportExcel_Incident_Malware(Worksheet ws, ModIncidentModel model, ref string errMsg, ref string succMsg)
        {
            int i = 0, order = 0, insertedCount = 0;
            DateTime d = DateTime.Now;
            ModIncidentEntity item = null, p = null;
            int rowCount = ws.Cells.Rows.Count;
            int colCount = ws.Cells.Columns.Count;
            string rowNumNotValid = string.Empty, rowNotGetAPI = string.Empty, rowExist = string.Empty;
            string apiWhoisDomain = HL.Core.Global.Config.GetValue("Mod.APIWhoIsDomain1").ToString();
            string host = "", pathAndQuery = "", api = "";

            order = ModIncidentService.Instance.CreateQuery()
                .Max(o => o.Order)
                .ToValue()
                .ToInt(0);

            for (i = 1; i < rowCount; i++)
            {
                host = ""; pathAndQuery = "";

                if (colCount >= 4
                    && string.IsNullOrEmpty(ws.Cells[i, 0].Value.ToString())
                    && string.IsNullOrEmpty(ws.Cells[i, 1].Value.ToString())
                    && string.IsNullOrEmpty(ws.Cells[i, 2].Value.ToString())
                    && string.IsNullOrEmpty(ws.Cells[i, 3].Value.ToString()))
                {
                    rowNumNotValid += string.IsNullOrEmpty(rowNumNotValid) ? (i + 1).ToString() : ("," + (i + 1));
                    continue;
                }

                try
                {
                    Uri uri = new Uri(ws.Cells[i, 0].Value.ToString());
                    host = uri.Host; pathAndQuery = uri.PathAndQuery;
                    if (!string.IsNullOrEmpty(apiWhoisDomain)) api = apiWhoisDomain.Replace("DOMAIN", host);

                    item = new ModIncidentEntity()
                    {
                        Path = ws.Cells[i, 0].Value.ToString(), // Link
                        MalwareName = ws.Cells[i, 1].Value.ToString(), // Ten virus
                        AttackOn = HL.Core.Global.Convert.ToDateTime(ws.Cells[i, 2].Value.ToString()), // Thoi gian
                        Source = ws.Cells[i, 3].Value.ToString() // Nguon thong tin
                    };
                }
                catch
                {
                    rowNumNotValid += string.IsNullOrEmpty(rowNumNotValid) ? (i + 1).ToString() : ("," + (i + 1));
                    continue;
                }
                item.MenuID = model.MenuID; // Loai su co

                // Kiem tra ton tai trong db
                var exist = ModIncidentService.Instance.CreateQuery().Where(o => o.Activity == true && o.MenuID == item.MenuID && o.Resolve == false && o.Name == item.Path).ToSingle();
                if (exist != null)
                {
                    rowExist += string.IsNullOrEmpty(rowExist) ? (i + 1).ToString() : ("," + (i + 1));
                    continue;
                }

                // Get IP, ISP from API
                var data = Utils.DownloadJsonToData<WhoiIsDomain>(api, ref errMsg);
                if (data != null && string.IsNullOrEmpty(errMsg))
                {
                    item.IP = data.Query;
                    item.ISP = data.ISP;
                }
                else
                {
                    rowNotGetAPI += string.IsNullOrEmpty(rowNotGetAPI) ? (i + 1).ToString() : ("," + (i + 1));
                }

                item.EmailNo = 0;       // Lan gui mail
                item.State = 0;         // Trang thai: 1 - Da giai quyet; 0 - Chua giai quyet
                item.Resolve = false;   // Trang thai: true - Da giai quyet; false - Chua giai quyet
                item.Published = d;
                item.Activity = true;

                // Save
                int? parentId = null;
                p = ModIncidentService.Instance.CreateQuery().Where(o => o.Path == host).ToSingle();
                if (p == null)
                {
                    order++;
                    p = new ModIncidentEntity()
                    {
                        Path = host,
                        Name = host,
                        Code = Data.GetCode(host),
                        IP = data.Query,
                        ISP = data.ISP,
                        Published = d,
                        Order = order,
                        Activity = true,
                    };
                    parentId = ModIncidentService.Instance.Save(p);
                }
                else
                {
                    parentId = p.ID;
                }
                string oldPath = item.Path;

                // Save Child
                order++;
                item.Name = oldPath;
                item.Code = Data.GetCode(oldPath);
                item.Path = oldPath;
                item.ParentID = parentId;
                ModIncidentService.Instance.Save(item);

                insertedCount++;
            }

            if (!string.IsNullOrEmpty(rowNumNotValid))
            {
                succMsg += "<br />Dữ liệu không hợp lệ, dòng số: " + rowNumNotValid;
            }
            if (!string.IsNullOrEmpty(rowExist))
            {
                succMsg += "<br />Dữ liệu đã tồn tại, dòng số: " + rowExist;
            }
            if (!string.IsNullOrEmpty(rowNotGetAPI))
            {
                succMsg += "<br />Không lấy được IP, ISP từ API, dòng số: " + rowNotGetAPI;
            }

            return insertedCount;
        }

        /// <summary>
        /// Phishing: Link phishing, Đích giả mạo, Nguồn Thông tin, Thời gian, IP, Thông tin ISP
        /// PhishingId, Path, FakeDestination, Source, AttankOn, IP, ISP, Status, EmailNo
        /// </summary>
        /// <param name="ws">Worksheet</param>
        /// <param name="model">ModIncidentModel</param>
        /// <param name="errMsg">Error message</param>
        /// <param name="succMsg">Success message</param>
        private static int ImportExcel_Incident_Phishing(Worksheet ws, ModIncidentModel model, ref string errMsg, ref string succMsg)
        {
            int i = 0, order = 0, insertedCount = 0;
            DateTime d = DateTime.Now;
            ModIncidentEntity item = null, p = null;
            int rowCount = ws.Cells.Rows.Count;
            int colCount = ws.Cells.Columns.Count;
            string rowNumNotValid = string.Empty, rowNotGetAPI = string.Empty, rowExist = string.Empty;
            string apiWhoisDomain = HL.Core.Global.Config.GetValue("Mod.APIWhoIsDomain1").ToString();
            string host = "", pathAndQuery = "", api = "";

            order = ModIncidentService.Instance.CreateQuery()
                .Max(o => o.Order)
                .ToValue()
                .ToInt(0);

            for (i = 1; i < rowCount; i++)
            {
                host = ""; pathAndQuery = "";

                if (colCount >= 4
                    && string.IsNullOrEmpty(ws.Cells[i, 0].Value.ToString())
                    && string.IsNullOrEmpty(ws.Cells[i, 1].Value.ToString())
                    && string.IsNullOrEmpty(ws.Cells[i, 2].Value.ToString())
                    && string.IsNullOrEmpty(ws.Cells[i, 3].Value.ToString()))
                {
                    rowNumNotValid += string.IsNullOrEmpty(rowNumNotValid) ? (i + 1).ToString() : ("," + (i + 1));
                    continue;
                }

                try
                {
                    Uri uri = new Uri(ws.Cells[i, 0].Value.ToString());
                    host = uri.Host; pathAndQuery = uri.PathAndQuery;
                    if (!string.IsNullOrEmpty(apiWhoisDomain)) api = apiWhoisDomain.Replace("DOMAIN", host);

                    item = new ModIncidentEntity()
                    {
                        Path = ws.Cells[i, 0].Value.ToString(), // Link
                        FakeDestination = ws.Cells[i, 1].Value.ToString(), // Dich gia mao
                        AttackOn = HL.Core.Global.Convert.ToDateTime(ws.Cells[i, 2].Value.ToString()), // Thoi gian
                        Source = ws.Cells[i, 3].Value.ToString() // Nguon
                    };
                }
                catch
                {
                    rowNumNotValid += string.IsNullOrEmpty(rowNumNotValid) ? (i + 1).ToString() : ("," + (i + 1));
                    continue;
                }
                item.MenuID = model.MenuID; // Loai su co

                // Kiem tra ton tai trong db
                var exist = ModIncidentService.Instance.CreateQuery().Where(o => o.Activity == true && o.MenuID == item.MenuID && o.Resolve == false && o.Name == item.Path).ToSingle();
                if (exist != null)
                {
                    rowExist += string.IsNullOrEmpty(rowExist) ? (i + 1).ToString() : ("," + (i + 1));
                    continue;
                }

                // Get IP, ISP from API
                var data = Utils.DownloadJsonToData<WhoiIsDomain>(api, ref errMsg);
                if (data != null && string.IsNullOrEmpty(errMsg))
                {
                    item.IP = data.Query;
                    item.ISP = data.ISP;
                }
                else
                {
                    rowNotGetAPI += string.IsNullOrEmpty(rowNotGetAPI) ? (i + 1).ToString() : ("," + (i + 1));
                }

                item.EmailNo = 0;       // Lan gui mail
                item.State = 0;         // Trang thai: 1 - Da giai quyet; 0 - Chua giai quyet
                item.Resolve = false;   // Trang thai: true - Da giai quyet; false - Chua giai quyet
                item.Published = d;
                item.Activity = true;

                // Save
                int? parentId = null;
                p = ModIncidentService.Instance.CreateQuery().Where(o => o.Path == host).ToSingle();
                if (p == null)
                {
                    order++;
                    p = new ModIncidentEntity()
                    {
                        Path = host,
                        Name = host,
                        Code = Data.GetCode(host),
                        IP = data.Query,
                        ISP = data.ISP,
                        Published = d,
                        Order = order,
                        Activity = true,
                    };
                    parentId = ModIncidentService.Instance.Save(p);
                }
                else
                {
                    parentId = p.ID;
                }
                string oldPath = item.Path;

                // Save Child
                order++;
                item.Name = oldPath;
                item.Code = Data.GetCode(oldPath);
                item.Path = oldPath;
                item.ParentID = parentId;
                ModIncidentService.Instance.Save(item);

                insertedCount++;
            }

            if (!string.IsNullOrEmpty(rowNumNotValid))
            {
                succMsg += "<br />Dữ liệu không hợp lệ, dòng số: " + rowNumNotValid;
            }
            if (!string.IsNullOrEmpty(rowExist))
            {
                succMsg += "<br />Dữ liệu đã tồn tại, dòng số: " + rowExist;
            }
            if (!string.IsNullOrEmpty(rowNotGetAPI))
            {
                succMsg += "<br />Không lấy được IP, ISP từ API, dòng số: " + rowNotGetAPI;
            }

            return insertedCount;
        }

        /// <summary>
        /// C&C botnet: times, attacker IP (tại VN bị nhiễm), network name, local IP, local TCP port
        /// BotnetId, AttackerIP, NetwordName, LocalIP, LocalTCPPort, AttankOn, IP, ISP, Status, EmailNo
        /// </summary>
        /// <param name="ws">Worksheet</param>
        /// <param name="model">ModIncidentModel</param>
        /// <param name="errMsg">Error message</param>
        /// <param name="succMsg">Success message</param>
        private static int ImportExcel_Incident_Botnet(Worksheet ws, ModIncidentModel model, ref string errMsg, ref string succMsg)
        {
            int i = 0, order = 0, insertedCount = 0;
            DateTime d = DateTime.Now;
            ModIncidentEntity item = null, p = null;
            int rowCount = ws.Cells.Rows.Count;
            int colCount = ws.Cells.Columns.Count;
            string rowNumNotValid = string.Empty, rowNotGetAPI = string.Empty, rowExist = string.Empty;
            string apiWhoisDomain = HL.Core.Global.Config.GetValue("Mod.APIWhoIsDomain1").ToString();
            string host = "", pathAndQuery = "", api = "";

            order = ModIncidentService.Instance.CreateQuery()
                .Max(o => o.Order)
                .ToValue()
                .ToInt(0);

            for (i = 1; i < rowCount; i++)
            {
                host = ""; pathAndQuery = "";

                if (colCount >= 4
                    && string.IsNullOrEmpty(ws.Cells[i, 0].Value.ToString())
                    && string.IsNullOrEmpty(ws.Cells[i, 1].Value.ToString())
                    && string.IsNullOrEmpty(ws.Cells[i, 2].Value.ToString())
                    && string.IsNullOrEmpty(ws.Cells[i, 3].Value.ToString()))
                {
                    rowNumNotValid += string.IsNullOrEmpty(rowNumNotValid) ? (i + 1).ToString() : ("," + (i + 1));
                    continue;
                }

                try
                {
                    Uri uri = new Uri(ws.Cells[i, 0].Value.ToString());
                    host = uri.Host; pathAndQuery = uri.PathAndQuery;
                    if (!string.IsNullOrEmpty(apiWhoisDomain)) api = apiWhoisDomain.Replace("DOMAIN", host);

                    item = new ModIncidentEntity()
                    {
                        AttackerIP = ws.Cells[i, 0].Value.ToString(),
                        NetworkName = ws.Cells[i, 1].Value.ToString(),
                        LocalIP = ws.Cells[i, 2].Value.ToString(),
                        LocalTCPPort = HL.Core.Global.Convert.ToInt(ws.Cells[i, 3].Value.ToString(), 0),
                        AttackOn = HL.Core.Global.Convert.ToDateTime(ws.Cells[i, 4].Value.ToString()), // Thoi gian
                        IP = ws.Cells[i, 5].Value.ToString(),
                        ISP = ws.Cells[i, 6].Value.ToString()
                    };
                }
                catch
                {
                    rowNumNotValid += string.IsNullOrEmpty(rowNumNotValid) ? (i + 1).ToString() : ("," + (i + 1));
                    continue;
                }
                item.MenuID = model.MenuID; // Loai su co

                // Kiem tra ton tai trong db
                var exist = ModIncidentService.Instance.CreateQuery().Where(o => o.Activity == true && o.MenuID == item.MenuID && o.Resolve == false && o.Name == item.Path).ToSingle();
                if (exist != null)
                {
                    rowExist += string.IsNullOrEmpty(rowExist) ? (i + 1).ToString() : ("," + (i + 1));
                    continue;
                }

                // Get IP, ISP from API
                var data = Utils.DownloadJsonToData<WhoiIsDomain>(api, ref errMsg);
                if (data != null && string.IsNullOrEmpty(errMsg))
                {
                    item.IP = data.Query;
                    item.ISP = data.ISP;
                }
                else
                {
                    rowNotGetAPI += string.IsNullOrEmpty(rowNotGetAPI) ? (i + 1).ToString() : ("," + (i + 1));
                }

                item.EmailNo = 0;       // Lan gui mail
                item.State = 0;         // Trang thai: 1 - Da giai quyet; 0 - Chua giai quyet
                item.Resolve = false;   // Trang thai: true - Da giai quyet; false - Chua giai quyet
                item.Published = d;
                item.Activity = true;

                // Save
                int? parentId = null;
                p = ModIncidentService.Instance.CreateQuery().Where(o => o.Path == host).ToSingle();
                if (p == null)
                {
                    order++;
                    p = new ModIncidentEntity()
                    {
                        Path = host,
                        Name = host,
                        Code = Data.GetCode(host),
                        IP = data.Query,
                        ISP = data.ISP,
                        Published = d,
                        Order = order,
                        Activity = true,
                    };
                    parentId = ModIncidentService.Instance.Save(p);
                }
                else
                {
                    parentId = p.ID;
                }
                string oldPath = item.Path;

                // Save Child
                order++;
                item.Name = oldPath;
                item.Code = Data.GetCode(oldPath);
                item.Path = oldPath;
                item.ParentID = parentId;
                ModIncidentService.Instance.Save(item);

                insertedCount++;
            }

            if (!string.IsNullOrEmpty(rowNumNotValid))
            {
                succMsg += "<br />Dữ liệu không hợp lệ, dòng số: " + rowNumNotValid;
            }
            if (!string.IsNullOrEmpty(rowExist))
            {
                succMsg += "<br />Dữ liệu đã tồn tại, dòng số: " + rowExist;
            }
            if (!string.IsNullOrEmpty(rowNotGetAPI))
            {
                succMsg += "<br />Không lấy được IP, ISP từ API, dòng số: " + rowNotGetAPI;
            }

            return insertedCount;
        }

        /// <summary>
        /// Attack: timestamp,IP,asn,geo,url,type (downadup),http_agent(Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)),src_port(1938,1499 ...),hostname (static.vnpt.vn, localhost ),dst_port (Địa chỉ cổng đích),protocol (udp or tcp),servername,server,header (HTTP/1.1 200 OK),tag (netis_vulnerability,cwmp,memcached,rdp ...),handshake
        /// Attack Id, Timestamp, IP, ISP, ASN, Geo, Url, Type , HttpAgent, SrcPort, HostName, Destinationport, Protocol, ServerName, Server, Header, Tag, Region, City, Sector, Status, EmailNo
        /// </summary>
        /// <param name="ws">Worksheet</param>
        /// <param name="model">ModIncidentModel</param>
        /// <param name="errMsg">Error message</param>
        /// <param name="succMsg">Success message</param>
        private static int ImportExcel_Incident_Attack(Worksheet ws, ModIncidentModel model, ref string errMsg, ref string succMsg)
        {
            int i = 0, order = 0, insertedCount = 0;
            DateTime d = DateTime.Now;
            ModIncidentEntity item = null, p = null;
            int rowCount = ws.Cells.Rows.Count;
            int colCount = ws.Cells.Columns.Count;
            string rowNumNotValid = string.Empty, rowNotGetAPI = string.Empty, rowExist = string.Empty;
            string apiWhoisDomain = HL.Core.Global.Config.GetValue("Mod.APIWhoIsDomain1").ToString();
            string host = "", pathAndQuery = "", api = "";

            order = ModIncidentService.Instance.CreateQuery()
                .Max(o => o.Order)
                .ToValue()
                .ToInt(0);

            for (i = 1; i < rowCount; i++)
            {
                host = ""; pathAndQuery = "";

                if (colCount >= 19
                    && string.IsNullOrEmpty(ws.Cells[i, 0].Value.ToString())
                    && string.IsNullOrEmpty(ws.Cells[i, 1].Value.ToString())
                    && string.IsNullOrEmpty(ws.Cells[i, 2].Value.ToString())
                    && string.IsNullOrEmpty(ws.Cells[i, 3].Value.ToString()))
                {
                    rowNumNotValid += string.IsNullOrEmpty(rowNumNotValid) ? (i + 1).ToString() : ("," + (i + 1));
                    continue;
                }

                //        //item = new ModIncidentEntity()
                //        //{
                //        //};

                //        // CVE: CVE ID,Vulnerability Type(s) (Exec Code,DoS CSRF,+Info, XSS ...),Product ,Publish Date,Update Date,Score,Gained Access Level (None)
                //        // CVEId, VulnerabilityType, Product , Publish Date, Update Date, Score, GainedAccessLevel, Status, EmailNo
                //        //item = new ModIncidentEntity()
                //        //{
                //        //};

                try
                {
                    Uri uri = new Uri(ws.Cells[i, 0].Value.ToString());
                    host = uri.Host; pathAndQuery = uri.PathAndQuery;
                    if (!string.IsNullOrEmpty(apiWhoisDomain)) api = apiWhoisDomain.Replace("DOMAIN", host);

                    item = new ModIncidentEntity()
                    {
                        Timestamp = HL.Core.Global.Convert.ToDateTime(ws.Cells[i, 0].Value.ToString()),
                        IP = ws.Cells[i, 1].Value.ToString(),
                        ISP = ws.Cells[i, 2].Value.ToString(),
                        ASN = ws.Cells[i, 3].Value.ToString(),
                        Geo = ws.Cells[i, 4].Value.ToString(),
                        Url = ws.Cells[i, 5].Value.ToString(),
                        Type = HL.Core.Global.Convert.ToInt(ws.Cells[i, 6].Value.ToString(), 0),
                        HttpAgent = ws.Cells[i, 7].Value.ToString(),
                        SrcPort = HL.Core.Global.Convert.ToInt(ws.Cells[i, 8].Value.ToString(), 0),
                        HostName = ws.Cells[i, 9].Value.ToString(),
                        Destinationport = HL.Core.Global.Convert.ToInt(ws.Cells[i, 10].Value.ToString(), 0),
                        Protocol = HL.Core.Global.Convert.ToInt(ws.Cells[i, 11].Value.ToString(), 0),
                        ServerName = ws.Cells[i, 12].Value.ToString(),
                        Server = ws.Cells[i, 13].Value.ToString(),
                        Header = ws.Cells[i, 14].Value.ToString(),
                        Tag = ws.Cells[i, 15].Value.ToString(),
                        Region = ws.Cells[i, 16].Value.ToString(),
                        City = ws.Cells[i, 17].Value.ToString(),
                        Sector = ws.Cells[i, 0].Value.ToString()
                    };
                }
                catch
                {
                    rowNumNotValid += string.IsNullOrEmpty(rowNumNotValid) ? (i + 1).ToString() : ("," + (i + 1));
                    continue;
                }
                item.MenuID = model.MenuID; // Loai su co

                // Kiem tra ton tai trong db
                var exist = ModIncidentService.Instance.CreateQuery().Where(o => o.Activity == true && o.MenuID == item.MenuID && o.Resolve == false && o.Name == item.Path).ToSingle();
                if (exist != null)
                {
                    rowExist += string.IsNullOrEmpty(rowExist) ? (i + 1).ToString() : ("," + (i + 1));
                    continue;
                }

                // Get IP, ISP from API
                var data = Utils.DownloadJsonToData<WhoiIsDomain>(api, ref errMsg);
                if (data != null && string.IsNullOrEmpty(errMsg))
                {
                    item.IP = data.Query;
                    item.ISP = data.ISP;
                }
                else
                {
                    rowNotGetAPI += string.IsNullOrEmpty(rowNotGetAPI) ? (i + 1).ToString() : ("," + (i + 1));
                }

                item.EmailNo = 0;       // Lan gui mail
                item.State = 0;         // Trang thai: 1 - Da giai quyet; 0 - Chua giai quyet
                item.Resolve = false;   // Trang thai: true - Da giai quyet; false - Chua giai quyet
                item.Published = d;
                item.Activity = true;

                // Save
                int? parentId = null;
                p = ModIncidentService.Instance.CreateQuery().Where(o => o.Path == host).ToSingle();
                if (p == null)
                {
                    order++;
                    p = new ModIncidentEntity()
                    {
                        Path = host,
                        Name = host,
                        Code = Data.GetCode(host),
                        IP = data.Query,
                        ISP = data.ISP,
                        Published = d,
                        Order = order,
                        Activity = true,
                    };
                    parentId = ModIncidentService.Instance.Save(p);
                }
                else
                {
                    parentId = p.ID;
                }
                string oldPath = item.Path;

                // Save Child
                order++;
                item.Name = oldPath;
                item.Code = Data.GetCode(oldPath);
                item.Path = oldPath;
                item.ParentID = parentId;
                ModIncidentService.Instance.Save(item);

                insertedCount++;
            }

            if (!string.IsNullOrEmpty(rowNumNotValid))
            {
                succMsg += "<br />Dữ liệu không hợp lệ, dòng số: " + rowNumNotValid;
            }
            if (!string.IsNullOrEmpty(rowExist))
            {
                succMsg += "<br />Dữ liệu đã tồn tại, dòng số: " + rowExist;
            }
            if (!string.IsNullOrEmpty(rowNotGetAPI))
            {
                succMsg += "<br />Không lấy được IP, ISP từ API, dòng số: " + rowNotGetAPI;
            }

            return insertedCount;
        }

        private static string Valid_Incident_ColNum(WebMenuEntity loaiSuCo, int colCount)
        {
            string errMsg = "";

            if (loaiSuCo.Code == Constant.INCIDENT_CODE_DEFACE)
            {
                if (colCount != 4)
                {
                    errMsg = "Số cột trong file import không hợp lệ";
                }
            }
            else if (loaiSuCo.Code == Constant.INCIDENT_CODE_PHISHING)
            {
                if (colCount != 4)
                {
                    errMsg = "Số cột trong file import không hợp lệ";
                }
            }
            else if (loaiSuCo.Code == Constant.INCIDENT_CODE_MALWARE)
            {
                if (colCount != 6)
                {
                    errMsg = "Số cột trong file import không hợp lệ";
                }
            }
            else if (loaiSuCo.Code == Constant.INCIDENT_CODE_BOTNET)
            {
                if (colCount != 7)
                {
                    errMsg = "Số cột trong file import không hợp lệ";
                }
            }
            else if (loaiSuCo.Code == Constant.INCIDENT_CODE_ATTACK)
            {
                if (colCount != 19)
                {
                    errMsg = "Số cột trong file import không hợp lệ";
                }
            }
            else
            {
                errMsg = "Loại sự cố " + loaiSuCo.Name + " không được hỗ trợ import";
            }

            return errMsg;
        }

        private static bool IsIncidentExist(ModIncidentEntity item)
        {
            bool exist = false;

            var e = ModIncidentService.Instance.CreateQuery().Where(o => o.Activity == true && o.MenuID == item.MenuID && o.Resolve == false && o.Path == item.Path).ToSingle();
            if (e != null) exist = true;

            return exist;
        }

    }

    public class WhoiIsDomain
    {
        // Follow http://ip-api.com API
        public string ISP { get; set; }
        public string Query { get; set; }
    }
}
