using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using CsvHelper;
using HL.Lib.Global;
using HL.Lib.Models;
using NLog;

namespace FileTransfer
{
    static class Program
    {
        private static readonly Logger Logger = LogManager.GetCurrentClassLogger();

        static void Main(string[] args)
        {
            // The code provided will print ‘Hello World’ to the console.
            // Press Ctrl+F5 (or go to Debug > Start Without Debugging) to run your app.
            Console.WriteLine("----- Start Import files -----");
            //Console.ReadKey();

            // Go to http://aka.ms/dotnet-get-started-console to continue learning how to build a console app! 

            try
            {
#pragma warning disable CS0618 // Type or member is obsolete
                DateTime dateNow = DateTime.Now.Date;
                string sToday = dateNow.ToString("yyyyMMdd");
                string incidentPath = System.Configuration.ConfigurationSettings.AppSettings["IncidentPath"].ToString() + sToday;
                string botnetFileName = System.Configuration.ConfigurationSettings.AppSettings["BotnetFileName"].ToString();
                string incidentFileExtension = System.Configuration.ConfigurationSettings.AppSettings["IncidentFileExtension"].ToString();
#pragma warning restore CS0618 // Type or member is obsolete

                if (string.IsNullOrEmpty(incidentPath) || string.IsNullOrEmpty(botnetFileName) || string.IsNullOrEmpty(incidentFileExtension))
                {
                    Console.WriteLine("ERROR: Ban chua cau hinh cho mot trong cac key sau: IncidentPath; BotnetFileName; IncidentFileExtension trong file config");
                    Logger.Error($"Failed: Ban chua cau hinh cho mot trong cac key sau: IncidentPath; BotnetFileName; IncidentFileExtension trong file config");
                    return;
                }
                Console.WriteLine("IncidentPath: " + incidentPath);
                Console.WriteLine("BotnetFileName: " + botnetFileName);
                Console.WriteLine("IncidentFileExtension: " + incidentFileExtension);

                string[] incidentFiles = System.IO.Directory.GetFiles(incidentPath);
                int fileCount = incidentFiles.Length;
                int rowCount = 0, colCount = 0, i = 0;

                string[] fieldsInCsv = new string[] { "timestamp", "IP", "asn", "geo", "url", "type", "http_agent", "src_port", "hostname", "dst_port", "protocol", "servername", "server", "header", "tag", "handshake" };
                string[] fields = new string[] { "Timestamp", "IP", "ASN", "Geo", "Url", "Type", "HttpAgent", "SrcPort", "HostName", "Destinationport", "Protocol", "ServerName", "Server", "Header", "Tag", "HandShake" };
                List<ModIncidentEntity> listEntity = new List<ModIncidentEntity>();
                List<ModImportLogsEntity> listimportLogs = new List<ModImportLogsEntity>();
                WebMenuEntity menu = null;
                ModImportLogsEntity importLog = null;
                int attackMenuId = 0, botnetMenuId = 0, menuId = 0;

                menu = WebMenuService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.Code == "Attack")
                    .ToSingle();
                if (menu != null) attackMenuId = menu.ID;

                menu = WebMenuService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.Code == "Bonet")
                    .ToSingle();
                if (menu != null) botnetMenuId = menu.ID;

                int order = ModIncidentService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;

                foreach (string incidentFile in incidentFiles)
                {
                    if (incidentFile.Contains(incidentFileExtension) == false)
                    {
                        Console.WriteLine("WARN: File khong dung dinh dang cho phep (" + incidentFile + ")");
                        Logger.Warn($"File khong dung dinh dang cho phep ({incidentFile})");
                        continue;
                    }

                    importLog = ModImportLogsService.Instance.CreateQuery()
                        .Where(o => o.FileName == incidentFile && o.Publish == dateNow)
                        .ToSingle();

                    if (importLog != null)
                    {
                        Console.WriteLine("WARN: File da duoc import trong ngay (" + incidentFile + ")");
                        Logger.Warn($"File da duoc import trong ngay ({incidentFile})");
                        continue;
                    }

                    Console.WriteLine("INFO: Importing file (" + incidentFile + ")...");

                    listEntity = new List<ModIncidentEntity>();
                    DataTable dt = ConvertCSVtoDataTable(incidentFile);
                    rowCount = dt.Rows.Count;
                    colCount = dt.Columns.Count;
                    Console.WriteLine("INFO: So dong trong file (" + rowCount + ")");
                    Console.WriteLine("INFO: So cot trong file (" + colCount + ")");

                    //print(i,row['timestamp'],row['ip'],row['asn'],row['url'],row['type'],row['src_port'],row['dst_port'],row['http_host'],fname[11:].split('-vietnam-geo.csv')[0]) 
                    // timestamp,IP,asn,geo,url,type,http_agent,src_port,hostname,dst_port,protocol,servername,server,header,tag,handshake
                    /*
                     Cac truong trong cac file import la tuong tu nhau:
                     1) source, cc_dns, channel, http_host, url
                     2) infection, port, md5hash, type
                     3) src_port, port
                     4) cc_port, port, dest_port, dst_port, src_port
                     5) hostname, host, http_host, dst_port
                     */
                    int row = 0;
                    try
                    {
                        menuId = attackMenuId;
                        for (i = 0; i < rowCount; i++)
                        {
                            row += 1;
                            order++;
                            ModIncidentEntity entity = new ModIncidentEntity
                            {
                                MenuID = attackMenuId,
                                Resolve = false,
                                Order = order,
                                Published = dateNow,
                                Activity = true
                            };

                            if (incidentFile.Contains("blacklist-vietnam-geo.csv") == true)
                            {   // blacklist-vietnam-geo.csv
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                //entity.Geo = "";
                                entity.Url = dt.Rows[i]["source"].ToString();
                                entity.Type = " /  ";
                                //entity.HttpAgent = "";
                                entity.SrcPort = " /  ";
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                //entity.Protocol = "";
                                //entity.ServerName = "";
                                //entity.Server = "";
                                //entity.Header = "";
                                //entity.Tag = "";
                                entity.HandShake = "blacklist" + "-" + dt.Rows[i]["reason"].ToString();

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("botnet_drone-vietnam-geo.csv") == true)
                            {   // botnet_drone-vietnam-geo.csv
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = dt.Rows[i]["cc_dns"].ToString();
                                entity.Type = dt.Rows[i]["infection"].ToString();
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = dt.Rows[i]["cc_port"].ToString();
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "botnet_drone";

                                entity.MenuID = botnetMenuId;
                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("cc_ip-vietnam-geo.csv") == true)
                            {   // cc_ip-vietnam-geo.csv
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = dt.Rows[i]["channel"].ToString();
                                entity.Type = dt.Rows[i]["port"].ToString();
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                //entity.Destinationport = dt.Rows[i]["cc_port"].ToString();
                                //entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "cc_ip" + "-" + dt.Rows[i]["reason"].ToString();

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("cisco_smart_install-vietnam-geo.csv") == true)
                            {   // cisco_smart_install-vietnam-geo.csv
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = dt.Rows[i]["port"].ToString();
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "cisco_smart_install";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("compromised_website-vietnam-geo.csv") == true)
                            {   // compromised_website-vietnam-geo.csv
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                var s = dt.Rows[i];
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = dt.Rows[i]["http_host"].ToString() + dt.Rows[i]["url"].ToString();
                                entity.Type = dt.Rows[i]["port"].ToString();
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                //entity.Destinationport = dt.Rows[i]["cc_port"].ToString();
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "compromised_website";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("cwsandbox_url") == true)
                            {   // cwsandbox_url
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i][0]);
                                entity.IP = dt.Rows[i][1].ToString();
                                entity.ASN = dt.Rows[i][2].ToString();
                                entity.Url = dt.Rows[i][5].ToString();
                                entity.Type = dt.Rows[i][4].ToString();
                                entity.SrcPort = " /  ";
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i][7].ToString();
                                entity.HandShake = "cwsandbox_url";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("drone_brute_force") == true)
                            {   // drone_brute_force
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = dt.Rows[i]["dest_port"].ToString();
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "drone_brute_force";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("microsoft_sinkhole") == true)
                            {   // microsoft_sinkhole
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = dt.Rows[i]["url"].ToString();
                                entity.Type = dt.Rows[i]["type"].ToString();
                                entity.SrcPort = dt.Rows[i]["src_port"].ToString();
                                entity.Destinationport = dt.Rows[i]["dst_port"].ToString();
                                entity.HostName = dt.Rows[i]["http_host"].ToString();
                                entity.HandShake = "microsoft_sinkhole";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_chargen") == true)
                            {   // scan_chargen
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_chargen";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_cwmp") == true)
                            {   // scan_cwmp
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_cwmp";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_db2") == true)
                            {   // scan_db2
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i][0]);
                                entity.IP = dt.Rows[i][1].ToString();
                                entity.ASN = dt.Rows[i][6].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i][3].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i][4].ToString() + "\nName DB:" + dt.Rows[i][12].ToString() + "\nServer name:" + dt.Rows[i][13].ToString();
                                entity.HandShake = "scan_db2";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_dns") == true)
                            {   // scan_dns
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_dns";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_elasticsearch") == true)
                            {   // scan_elasticsearch
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i][0]);
                                entity.IP = dt.Rows[i][1].ToString();
                                entity.ASN = dt.Rows[i][7].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i][3].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i][4].ToString();
                                entity.HandShake = "scan_elasticsearch";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_hadoop") == true)
                            {   // scan_hadoop
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_hadoop";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_http") == true)
                            {   // scan_http
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_http";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_ipmi") == true)
                            {   // scan_ipmi
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i][0]);
                                entity.IP = dt.Rows[i][1].ToString();
                                entity.ASN = dt.Rows[i][6].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i][3].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i][4].ToString();
                                entity.HandShake = "scan_ipmi";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_isakmp") == true)
                            {   // scan_isakmp
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_isakmp";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_ldap") == true)
                            {   // scan_ldap
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_ldap";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_mdns") == true)
                            {   // scan_mdns
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_mdns";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_memcached") == true)
                            {   // scan_memcached
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_memcached";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_mongodb") == true)
                            {   // scan_mongodb
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_mongodb";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_mssql") == true)
                            {   // scan_mssql
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString() + "\nServer name:" + dt.Rows[i]["server_name"].ToString() + "\nInstance name:" + dt.Rows[i]["instance_name"].ToString();
                                entity.HandShake = "scan_mssql";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_nat_pmp") == true)
                            {   // scan_nat_pmp
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i][0]);
                                entity.IP = dt.Rows[i][1].ToString();
                                entity.ASN = dt.Rows[i][7].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i][3].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i][4].ToString();
                                entity.HandShake = "scan_nat_pmp";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_netbios") == true)
                            {   // scan_netbios
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString() + "\nMachine name:" + dt.Rows[i]["machine_name"].ToString();
                                entity.HandShake = "scan_netbios";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_ntpmonitor") == true)
                            {   // scan_ntpmonitor
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_ntpmonitor";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_ntp") == true)
                            {   // scan_ntp
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_ntp";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_portmapper") == true)
                            {   // scan_portmapper
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_portmapper";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_qotd") == true)
                            {   // scan_qotd
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i][0]);
                                entity.IP = dt.Rows[i][1].ToString();
                                entity.ASN = dt.Rows[i][7].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i][3].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i][4].ToString();
                                entity.HandShake = "scan_qotd";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_rdp") == true)
                            {   // scan_rdp
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_rdp";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_redis") == true)
                            {   // scan_redis
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_redis";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_smb") == true)
                            {   // scan_smb
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_smb";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_snmp") == true)
                            {   // scan_snmp
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_snmp";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_ssdp") == true)
                            {   // scan_ssdp
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_ssdp";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_ssl_freak") == true)
                            {   // scan_ssl_freak
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_ssl_freak";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_ssl_poodle") == true)
                            {   // scan_ssl_poodle
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_ssl_poodle";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_telnet") == true)
                            {   // scan_telnet
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_telnet";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("can_tftp") == true)
                            {   // can_tftp
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "can_tftp";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_vnc") == true)
                            {   // scan_vnc
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i]["port"].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i]["hostname"].ToString();
                                entity.HandShake = "scan_vnc";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("scan_xdmcp") == true)
                            {   // scan_xdmcp
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i][0]);
                                entity.IP = dt.Rows[i][1].ToString();
                                entity.ASN = dt.Rows[i][6].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i][3].ToString();
                                entity.Destinationport = " /  ";
                                entity.HostName = dt.Rows[i][4].ToString();
                                entity.HandShake = "scan_xdmcp";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("sinkhole6_http") == true)
                            {   // sinkhole6_http
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i][0]);
                                entity.IP = dt.Rows[i][1].ToString();
                                entity.ASN = dt.Rows[i][2].ToString();
                                entity.Url = " /  ";
                                entity.Type = " /  ";
                                entity.SrcPort = dt.Rows[i][5].ToString();
                                entity.Destinationport = dt.Rows[i][10].ToString();
                                entity.HostName = " /  ";
                                entity.HandShake = "sinkhole6_http";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }
                            else if (incidentFile.Contains("sinkhole_http_drone") == true)
                            {   // sinkhole_http_drone
                                entity.Timestamp = HL.Core.Global.Convert.ToDateTime(dt.Rows[i]["timestamp"]);
                                entity.IP = dt.Rows[i]["ip"].ToString();
                                entity.ASN = dt.Rows[i]["asn"].ToString();
                                entity.Url = dt.Rows[i]["http_host"].ToString();
                                entity.Type = dt.Rows[i]["type"].ToString();
                                entity.SrcPort = dt.Rows[i]["src_port"].ToString();
                                entity.Destinationport = dt.Rows[i]["src_port"].ToString();
                                entity.HostName = dt.Rows[i]["dst_port"].ToString();
                                entity.HandShake = "sinkhole_http_drone";

                                entity.Name = entity.Url;
                                entity.Code = Data.GetCode(entity.Url);
                            }

                            listEntity.Add(entity);
                        }


                        //if (incidentFile.Contains(botnetFileName) == false)
                        //{   // Attack: timestamp,IP,asn,geo,url,type,http_agent,src_port,hostname,dst_port,protocol,servername,server,header,tag,handshake
                        //    menuId = attackMenuId;
                        //    for (i = 0; i < rowCount; i++)
                        //    {
                        //        ModIncidentEntity entity = new ModIncidentEntity();

                        //        int fieldCount = fields.Length;
                        //        for (int j = 0; j < fieldCount; j++)
                        //        {
                        //            if (fieldsInCsv[j] == "timestamp")
                        //            {
                        //                entity[fields[j]] = HL.Core.Global.Convert.ToDateTime(dt.Rows[i][fieldsInCsv[j]]);
                        //            }
                        //            else if (fieldsInCsv[j] == "src_port" || fieldsInCsv[j] == "dst_port" || fieldsInCsv[j] == "protocol")
                        //            {
                        //                entity[fields[j]] = HL.Core.Global.Convert.ToInt(dt.Rows[i][fieldsInCsv[j]]);
                        //            }
                        //            else if (dt.Columns[fieldsInCsv[j]] != null)
                        //            {
                        //                entity[fields[j]] = dt.Rows[i][fieldsInCsv[j]];
                        //            }
                        //        }
                        //        order++;
                        //        entity.MenuID = attackMenuId;
                        //        entity.Resolve = false;
                        //        entity.Order = order;
                        //        entity.Published = dateNow;
                        //        entity.Activity = true;

                        //        listEntity.Add(entity);
                        //    }
                        //}
                        //else
                        //{   // Botnet: timestamp,ip,asn,geo,url,type,http_agent,src_port,hostname,dst_port,protocol,servername,server,header,tag
                        //    menuId = botnetMenuId;
                        //    for (i = 0; i < rowCount; i++)
                        //    {
                        //        ModIncidentEntity entity = new ModIncidentEntity();

                        //        int fieldCount = fields.Length;
                        //        for (int j = 0; j < fieldCount; j++)
                        //        {
                        //            if (fieldsInCsv[j] == "timestamp")
                        //            {
                        //                entity[fields[j]] = HL.Core.Global.Convert.ToDateTime(dt.Rows[i][fieldsInCsv[j]]);
                        //            }
                        //            else if (fieldsInCsv[j] == "src_port" || fieldsInCsv[j] == "dst_port" || fieldsInCsv[j] == "protocol")
                        //            {
                        //                entity[fields[j]] = HL.Core.Global.Convert.ToInt(dt.Rows[i][fieldsInCsv[j]]);
                        //            }
                        //            else if (dt.Columns[fieldsInCsv[j]] != null)
                        //            {
                        //                entity[fields[j]] = dt.Rows[i][fieldsInCsv[j]];
                        //            }
                        //        }
                        //        order++;
                        //        entity.MenuID = botnetMenuId;
                        //        entity.Resolve = false;
                        //        entity.Order = order;
                        //        entity.Published = dateNow;
                        //        entity.Activity = true;

                        //        listEntity.Add(entity);
                        //    }

                        //}
                    }
                    catch (Exception ex)
                    {
                        Console.WriteLine("WARN: File khong hop le (" + incidentFile + ")");
                        Logger.Warn($"File khong hop le ({incidentFile})");

                        // Ghi log
                        importLog = new ModImportLogsEntity()
                        {
                            FileName = incidentFile,
                            Messages = "Import fail: " + ex.Message + "==================" + ex.StackTrace,
                            MenuID = menuId,
                            Publish = dateNow,
                            Activity = false,
                            ErrorRows = row.ToString()
                        };
                        ModImportLogsService.Instance.Save(importLog);

                        continue;
                    }

                    // Save datas
                    if (listEntity.Count > 0)
                    {
                        // Ghi log
                        importLog = new ModImportLogsEntity()
                        {
                            FileName = incidentFile,
                            Messages = "Import success",
                            MenuID = menuId,
                            Publish = dateNow,
                            Activity = true,
                        };

                        try
                        {
                            ModIncidentService.Instance.Save(listEntity);
                        }
                        catch (Exception ex)
                        {
                            importLog.Messages = "Import error: " + ex.Message + "==================" + ex.StackTrace;
                            Logger.Error($"Failed: {ex.Message}\n {ex.StackTrace}");
                        }
                        ModImportLogsService.Instance.Save(importLog);
                    }
                }

            }
            catch (Exception ex)
            {
                Logger.Error($"Failed: {ex.Message}\n {ex.StackTrace}");
                Console.WriteLine("Error: " + ex.Message);
            }

            Console.WriteLine("----- End Import files -----");
        }

        public static DataTable ConvertCSVtoDataTable(string strFilePath)
        {
            DataTable dt = new DataTable();
            //using (StreamReader sr = new StreamReader(strFilePath))
            //{
            //    string[] headers = sr.ReadLine().Split(',');
            //    foreach (string header in headers)
            //    {
            //        dt.Columns.Add(header);
            //    }
            //    while (!sr.EndOfStream)
            //    {
            //        string[] rows = sr.ReadLine().Split(',');
            //        DataRow dr = dt.NewRow();
            //        for (int i = 0; i < headers.Length; i++)
            //        {
            //            dr[i] = rows[i];
            //        }
            //        dt.Rows.Add(dr);
            //    }
            //}

            using (CsvFileReader csv = new CsvFileReader(strFilePath))
            {
                string[] headers = csv.ReadLine().Split(',');
                foreach (string header in headers)
                {
                    dt.Columns.Add(header);
                }
                CsvHelper.CsvHelper csvRow = new CsvHelper.CsvHelper();
                while (csv.ReadRow(csvRow))
                {
                    DataRow dr = dt.NewRow();
                    for (int i = 0; i < headers.Length; i++)
                    {
                        if (i > csvRow.Count - 1) dr[i] = "";
                        else dr[i] = csvRow[i];
                    }
                    dt.Rows.Add(dr);
                }
            }

            return dt;
        }

    }
}
