using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using Aspose.Cells;
using HL.Lib.Models;
using HL.Lib.Global;
using HL.Lib.CPControllers;
using HL.Lib.Common;
using Newtonsoft.Json;
using System.Net;
using System.IO;

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

        //        public static int ImportExcel_Incident(ModIncidentModel model, ref string msg, ref string success)
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

        //                    msg = Valid_Incident_ColNum(loaiSuCo, colCount);
        //                    if (!string.IsNullOrEmpty(msg)) return count;

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
        //                        var data = Utils.DownloadJsonToData<WhoiIsDomain>(api, ref msg);
        //                        if (data != null && string.IsNullOrEmpty(msg))
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
        //                        success += "<br />Các dòng trong file không hợp lệ: " + rowNumNotValid;
        //                    }
        //                    if (!string.IsNullOrEmpty(rowExist))
        //                    {
        //                        success += "<br />Các dòng trong file đã tồn tại: " + rowExist;
        //                    }
        //                    if (!string.IsNullOrEmpty(rowNotGetAPI))
        //                    {
        //                        success += "<br />Các dòng trong file không lấy được IP, ISP từ API: " + rowNotGetAPI;
        //                    }
        //                }
        //            }
        //            catch (Exception ex)
        //            {
        //                Error.Write(ex.Message);
        //                msg = "Lỗi import file. Dữ liệu không đúng định dạng.";
        //            }

        //            return count;
        //        }

        public static int ImportExcel_Incident(ModIncidentModel model, ref string msg, ref string success)
        {
            ModIncidentEntity item = null, p = null;
            int count = 0;
            string apiWhoisDomain = HL.Core.Global.Config.GetValue("Mod.APIWhoIsDomain1").ToString();

            try
            {
                Workbook workbook = new Workbook();
#pragma warning disable CS0618 // Type or member is obsolete
                workbook.Open(model.FilePath);
#pragma warning restore CS0618 // Type or member is obsolete

                if (workbook.Worksheets[0] != null)
                {
                    int rowCount = workbook.Worksheets[0].Cells.Rows.Count;
                    int colCount = workbook.Worksheets[0].Cells.Columns.Count;
                    int order = 0;
                    string rowNumNotValid = string.Empty, rowNotGetAPI = string.Empty, rowExist = string.Empty;
                    string host = "", pathAndQuery = "", api = "";
                    DateTime d = DateTime.Now;
                    var loaiSuCo = WebMenuService.Instance.CreateQuery().Where(o => o.Type == "Incident" && o.ID == model.MenuID).ToSingle();

                    msg = Valid_Incident_ColNum(loaiSuCo, colCount);
                    if (!string.IsNullOrEmpty(msg)) return count;

                    order = ModIncidentService.Instance.CreateQuery()
                        .Max(o => o.Order)
                        .ToValue()
                        .ToInt(0);

                    Worksheet workSheet;
                    for (int i = 1; i < rowCount; i++)
                    {
                        workSheet = workbook.Worksheets[0];
                        host = ""; pathAndQuery = "";

                        if (colCount >= 4
                            && string.IsNullOrEmpty(workSheet.Cells[i, 0].Value.ToString())
                            && string.IsNullOrEmpty(workSheet.Cells[i, 1].Value.ToString())
                            && string.IsNullOrEmpty(workSheet.Cells[i, 2].Value.ToString())
                            && string.IsNullOrEmpty(workSheet.Cells[i, 3].Value.ToString()))
                        {
                            continue;
                        }

                        try
                        {
                            // Deface: Link Deface, Thời gian, Nguồn Thông tin, Nguười tấn công, IP, Thông tin ISP
                            // DefaceId, Path, Attacker, Source, AttankOn, IP, ISP, Status, EmailNo
                            if (loaiSuCo.Code == Constant.INCIDENT_CODE_DEFACE)
                            {
                                item = new ModIncidentEntity()
                                {
                                    Path = workSheet.Cells[i, 0].Value.ToString(), // Link
                                    Attacker = workSheet.Cells[i, 1].Value.ToString(), // Nguoi tan cong
                                    AttackOn = HL.Core.Global.Convert.ToDateTime(workSheet.Cells[i, 2].Value.ToString()), // Thoi gian
                                    Source = workSheet.Cells[i, 3].Value.ToString() // Nguon
                                };

                                p = new ModIncidentEntity()
                                {
                                    Path = workSheet.Cells[i, 0].Value.ToString(), // Link
                                    Attacker = workSheet.Cells[i, 1].Value.ToString(), // Nguoi tan cong
                                    AttackOn = HL.Core.Global.Convert.ToDateTime(workSheet.Cells[i, 2].Value.ToString()), // Thoi gian
                                    Source = workSheet.Cells[i, 3].Value.ToString() // Nguon
                                };
                            }

                            // Phishing: Link phishing, Đích giả mạo, Nguồn Thông tin, Thời gian, IP, Thông tin ISP
                            // PhishingId, Path, FakeDestination, Source, AttankOn, IP, ISP, Status, EmailNo
                            if (loaiSuCo.Code == Constant.INCIDENT_CODE_PHISHING)
                            {
                                item = new ModIncidentEntity()
                                {
                                    Path = workSheet.Cells[i, 0].Value.ToString(), // Link
                                    FakeDestination = workSheet.Cells[i, 1].Value.ToString(), // Dich gia mao
                                    AttackOn = HL.Core.Global.Convert.ToDateTime(workSheet.Cells[i, 2].Value.ToString()), // Thoi gian
                                    Source = workSheet.Cells[i, 3].Value.ToString() // Nguon
                                };

                                p = new ModIncidentEntity()
                                {
                                    Path = workSheet.Cells[i, 0].Value.ToString(), // Link
                                    FakeDestination = workSheet.Cells[i, 1].Value.ToString(), // Dich gia mao
                                    AttackOn = HL.Core.Global.Convert.ToDateTime(workSheet.Cells[i, 2].Value.ToString()), // Thoi gian
                                    Source = workSheet.Cells[i, 3].Value.ToString() // Nguon
                                };
                            }

                            // Malware: Link nhiễm malware, Tên virus, IP, IPS, Thời gian, Nguồn Thông tin
                            // MalwareId, Path, MalwareName, Source, AttankOn, IP, ISP, Status, EmailNo
                            if (loaiSuCo.Code == Constant.INCIDENT_CODE_MALWARE)
                            {
                                item = new ModIncidentEntity()
                                {
                                    Path = workSheet.Cells[i, 0].Value.ToString(), // Link
                                    MalwareName = workSheet.Cells[i, 1].Value.ToString(), // Ten virus
                                    AttackOn = HL.Core.Global.Convert.ToDateTime(workSheet.Cells[i, 2].Value.ToString()), // Thoi gian
                                    Source = workSheet.Cells[i, 3].Value.ToString() // Nguon thong tin
                                };

                                p = new ModIncidentEntity()
                                {
                                    Path = workSheet.Cells[i, 0].Value.ToString(), // Link
                                    MalwareName = workSheet.Cells[i, 1].Value.ToString(), // Ten virus
                                    AttackOn = HL.Core.Global.Convert.ToDateTime(workSheet.Cells[i, 2].Value.ToString()), // Thoi gian
                                    Source = workSheet.Cells[i, 3].Value.ToString() // Nguon thong tin
                                };
                            }

                            // C&C botnet: times, attacker IP (tại VN bị nhiễm), network name, local IP, local TCP port
                            // BotnetId, AttackerIP, NetwordName, LocalIP, LocalTCPPort, AttankOn, IP, ISP, Status, EmailNo
                            if (loaiSuCo.Code == Constant.INCIDENT_CODE_BOTNET)
                            {
                                item = new ModIncidentEntity()
                                {
                                    Path = workSheet.Cells[i, 0].Value.ToString(), // Link
                                    MalwareName = workSheet.Cells[i, 1].Value.ToString(), // Ten virus
                                    AttackOn = HL.Core.Global.Convert.ToDateTime(workSheet.Cells[i, 2].Value.ToString()), // Thoi gian
                                    Source = workSheet.Cells[i, 3].Value.ToString() // Nguon thong tin
                                };

                                p = new ModIncidentEntity()
                                {
                                    Path = workSheet.Cells[i, 0].Value.ToString(), // Link
                                    MalwareName = workSheet.Cells[i, 1].Value.ToString(), // Ten virus
                                    AttackOn = HL.Core.Global.Convert.ToDateTime(workSheet.Cells[i, 2].Value.ToString()), // Thoi gian
                                    Source = workSheet.Cells[i, 3].Value.ToString() // Nguon thong tin
                                };
                            }

                            // Attack: timestamp,IP,asn,geo,url,type (downadup),http_agent(Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)),src_port(1938,1499 ...),hostname (static.vnpt.vn, localhost ),dst_port (Địa chỉ cổng đích),protocol (udp or tcp),servername,server,header (HTTP/1.1 200 OK),tag (netis_vulnerability,cwmp,memcached,rdp ...),handshake
                            // Attack Id, Timestamp, IP, ISP, ASN, Geo, Url, Type , HttpAgent, SrcPort, HostName, Destinationport, Protocol, ServerName, Server, Header, Tag, Region, City, Sector, Status, EmailNo
                            //item = new ModIncidentEntity()
                            //{
                            //    Timestamp         = workSheet.Cells[i, 0].Value.ToString(),
                            //    ASN               = workSheet.Cells[i, 0].Value.ToString(),
                            //    Geo               = workSheet.Cells[i, 0].Value.ToString(),
                            //    Url               = workSheet.Cells[i, 0].Value.ToString(),
                            //    Type              = workSheet.Cells[i, 0].Value.ToString(),
                            //    HttpAgent         = workSheet.Cells[i, 0].Value.ToString(),
                            //    SrcPort           = workSheet.Cells[i, 0].Value.ToString(),
                            //    HostName          = workSheet.Cells[i, 0].Value.ToString(),
                            //    Destinationport   = workSheet.Cells[i, 0].Value.ToString(),
                            //    Protocol          = workSheet.Cells[i, 0].Value.ToString(),
                            //    ServerName        = workSheet.Cells[i, 0].Value.ToString(),
                            //    Server            = workSheet.Cells[i, 0].Value.ToString(),
                            //    Header            = workSheet.Cells[i, 0].Value.ToString(),
                            //    Tag               = workSheet.Cells[i, 0].Value.ToString(),
                            //    Region            = workSheet.Cells[i, 0].Value.ToString(),
                            //    City              = workSheet.Cells[i, 0].Value.ToString(),
                            //    Sector            = workSheet.Cells[i, 0].Value.ToString()
                            //};

                            // CVE: CVE ID,Vulnerability Type(s) (Exec Code,DoS CSRF,+Info, XSS ...),Product ,Publish Date,Update Date,Score,Gained Access Level (None)
                            // CVEId, VulnerabilityType, Product , Publish Date, Update Date, Score, GainedAccessLevel, Status, EmailNo
                            //item = new ModIncidentEntity()
                            //{
                            //};

                            Uri uri = new Uri(item.Path);
                            host = uri.Host; pathAndQuery = uri.PathAndQuery;
                            if (!string.IsNullOrEmpty(apiWhoisDomain)) api = apiWhoisDomain.Replace("DOMAIN", host);

                        }
                        catch
                        {
                            rowNumNotValid += string.IsNullOrEmpty(rowNumNotValid) ? (i + 1).ToString() : ("," + (i + 1));
                            continue;
                        }
                        item.MenuID = model.MenuID; // Loai su co
                        p.MenuID = model.MenuID; // Loai su co

                        // Kiem tra ton tai trong db
                        var exist = ModIncidentService.Instance.CreateQuery().Where(o => o.Activity == true && o.MenuID == item.MenuID && o.Resolve == false && o.Name == item.Path).ToSingle();
                        if (exist != null)
                        {
                            rowExist += string.IsNullOrEmpty(rowExist) ? (i + 1).ToString() : ("," + (i + 1));
                            continue;
                        }

                        // Get IP, ISP from API
                        var data = Utils.DownloadJsonToData<WhoiIsDomain>(api, ref msg);
                        if (data != null && string.IsNullOrEmpty(msg))
                        {
                            item.IP = data.Query;
                            item.ISP = data.ISP;

                            p.IP = data.Query;
                            p.ISP = data.ISP;
                        }
                        else
                        {
                            rowNotGetAPI += string.IsNullOrEmpty(rowNotGetAPI) ? (i + 1).ToString() : ("," + (i + 1));
                        }

                        item.EmailNo = 0;       // Lan gui mail
                        item.State = 0;         // Trang thai: 1 - Da giai quyet; 0 - Chua giai quyet
                        item.Resolve = false;   // Trang thai: true - Da giai quyet; false - Chua giai quyet
                        item.Published = d;
                        item.Order = order;
                        item.Activity = true;

                        p.EmailNo = 0;       // Lan gui mail
                        p.State = 0;         // Trang thai: 1 - Da giai quyet; 0 - Chua giai quyet
                        p.Resolve = false;   // Trang thai: true - Da giai quyet; false - Chua giai quyet
                        p.Published = d;
                        p.Order = order;
                        p.Activity = true;

                        // Save
                        var parent = ModIncidentService.Instance.CreateQuery().Where(o => o.Activity == true && o.MenuID == item.MenuID && o.Resolve == false && o.Path == host).ToSingle();
                        int? parentId = null;
                        string oldPath = item.Path;
                        if (parent != null) parentId = parent.ID;
                        else
                        {
                            // Save Parent
                            order++;
                            p.Name = p.Path;
                            p.Code = Data.GetCode(p.Name);
                            p.Path = host;
                            parentId = ModIncidentService.Instance.Save(p);
                        }

                        if (!string.IsNullOrEmpty(pathAndQuery) && pathAndQuery != "/")
                        {
                            // Save Child
                            order++;
                            item.Name = oldPath;
                            item.Code = Data.GetCode(oldPath);
                            item.Path = oldPath;
                            item.ParentID = parentId;
                            ModIncidentService.Instance.Save(item);
                        }

                        count++;
                    }

                    if (!string.IsNullOrEmpty(rowNumNotValid))
                    {
                        success += "<br />Các dòng trong file không hợp lệ: " + rowNumNotValid;
                    }
                    if (!string.IsNullOrEmpty(rowExist))
                    {
                        success += "<br />Các dòng trong file đã tồn tại: " + rowExist;
                    }
                    if (!string.IsNullOrEmpty(rowNotGetAPI))
                    {
                        success += "<br />Các dòng trong file không lấy được IP, ISP từ API: " + rowNotGetAPI;
                    }
                }
            }
            catch (Exception ex)
            {
                Error.Write(ex.Message);
                msg = "Lỗi import file. Dữ liệu không đúng định dạng.";
            }

            return count;
        }

        private static string Valid_Incident_ColNum(WebMenuEntity loaiSuCo, int colCount)
        {
            string msg = "";

            if (loaiSuCo.Code == Constant.INCIDENT_CODE_DEFACE)
            {
                if (colCount != 4)
                {
                    msg = "Số cột trong file import không hợp lệ";
                }
            }
            else if (loaiSuCo.Code == Constant.INCIDENT_CODE_PHISHING)
            {
                if (colCount != 4)
                {
                    msg = "Số cột trong file import không hợp lệ";
                }
            }
            else if (loaiSuCo.Code == Constant.INCIDENT_CODE_MALWARE)
            {
                if (colCount != 4)
                {
                    msg = "Số cột trong file import không hợp lệ";
                }
            }
            else if (loaiSuCo.Code == Constant.INCIDENT_CODE_BOTNET)
            {
                if (colCount != 4)
                {
                    msg = "Số cột trong file import không hợp lệ";
                }
            }
            else
            {
                msg = "Loại sự cố " + loaiSuCo.Name + " không được hỗ trợ import";
            }

            return msg;
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
