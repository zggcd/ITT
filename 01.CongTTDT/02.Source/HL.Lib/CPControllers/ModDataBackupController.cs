using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web;
using System.Windows.Forms;
using HL.Core.Web;
using HL.Lib.MVC;
using HL.Lib.Models;
using File = System.IO.File;
using Message = HL.Lib.Global.Message;

namespace HL.Lib.CPControllers
{
    public class ModDataBackupController : CPController
    {
        public ModDataBackupController()
        {
            //khoi tao Service
            DataService = ModDataBackupService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModDataBackupModel model)
        {
            FtpWebRequest ftpRequest = (FtpWebRequest)WebRequest.Create("ftp://27.0.12.229");
            ftpRequest.Credentials = new NetworkCredential("backup", "golvn3008");
            ftpRequest.Method = WebRequestMethods.Ftp.ListDirectory;
            FtpWebResponse response = (FtpWebResponse)ftpRequest.GetResponse();
            StreamReader streamReader = new StreamReader(response.GetResponseStream());

            List<ModDataBackupEntity> directories = new List<ModDataBackupEntity>();

            string line = streamReader.ReadLine();
            int i = 0;
            while (!string.IsNullOrEmpty(line))
            {
                if (System.IO.Path.GetExtension(line) != "")
                {
                    ModDataBackupEntity entity = new ModDataBackupEntity();
                    entity.ID = i;
                    entity.Url = line;
                    directories.Add(entity);
                }
                line = streamReader.ReadLine();
                i++;
                entity = null;
            }

            streamReader.Close();

            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModDataBackupService.Instance.CreateQuery()
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = directories.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModDataBackupModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModDataBackupService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new ModDataBackupEntity();

                // khoi tao gia tri mac dinh khi insert
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
            string s = HttpQueryString.GetValues("Url").ToString();
            string rawUrl = HttpContext.Current.Request.RawUrl;
            string[] urls = { };
            if (!string.IsNullOrEmpty(rawUrl))
            {
                urls = rawUrl.Split('/');
            }
            int c = urls.Length;
            string url = urls[c - 1];
            if (!string.IsNullOrEmpty(url))
            {
                SendFileToClient(url);
            }
        }

        private void SendFileToClient(string fileName)
        {
            try
            {
                // Create a new WebClient instance.
                WebClient myWebClient = new WebClient();

                // Setup our credentials
                string remoteUri = "ftp://27.0.12.229/";
                myWebClient.Credentials = new NetworkCredential("backup", "golvn3008");

                // Download the data into a Byte array
                byte[] fileFromFTP = myWebClient.DownloadData(remoteUri + fileName);

                System.Web.HttpContext.Current.Response.AddHeader("content-disposition", "attachment; filename=" + fileName);
                //System.Web.HttpContext.Current.Response.AddHeader("content-disposition", string.Format("{0}; filename=" + fileName + ";", "inline"));
                System.Web.HttpContext.Current.Response.ContentType = "application/*";
                System.Web.HttpContext.Current.Response.BinaryWrite(fileFromFTP);
                System.Web.HttpContext.Current.Response.Close();



                //FtpWebRequest request = (FtpWebRequest)WebRequest.Create("ftp://27.0.12.229/" + fileName);
                //request.Method = WebRequestMethods.Ftp.DownloadFile;

                //request.Credentials = new NetworkCredential("backup", "golvn3008");

                //FtpWebResponse response = (FtpWebResponse)request.GetResponse();

                //Stream responseStream = response.GetResponseStream();
                //FileStream file = File.Create(@"c:\aaa\temp.exe");
                //byte[] buffer = new byte[32 * 1024];
                //int read;
                ////reader.Read(

                //while ((read = responseStream.Read(buffer, 0, buffer.Length)) > 0)
                //{
                //    file.Write(buffer, 0, read);
                //}

                //file.Close();
                //responseStream.Close();
                //response.Close();
            }
            catch (Exception ex)
            {
                CPViewPage.Alert("File không tồn tại!");
            }
        }

        public void ActionTaiVe()
        {
            DownloadFileFromFTP();
        }

        public void DownloadFileFromFTP()
        {
            // Create a new WebClient instance.
            WebClient myWebClient = new WebClient();
            // Setup our credentials
            myWebClient.Credentials = new NetworkCredential("backup", "golvn3008");

            string remoteUri = "ftp://27.0.12.229/";
            string fileName = "header.js", myStringWebResource = null;
            myStringWebResource = remoteUri + fileName;
            // Download the data into a Byte array
            byte[] fileData = myWebClient.DownloadData(myStringWebResource);
            // Create a FileStream that we'll write the byte array to.
            FileStream fileStream = File.Create(@"C:\\a\\gold.zip");
            // Write the full byte array to the file.
            fileStream.Write(fileData, 0, fileData.Length);
            // Close the file so other processes can access it.
            fileStream.Close();

        }

        protected void btnExportFile_Click(object sender, EventArgs e)
        {
            try
            {
                Thread newThread = new Thread(new ThreadStart(ThreadMethod));
                newThread.SetApartmentState(ApartmentState.STA);
                newThread.Start();

                // try using threads as you will get a Current thread must be set to single thread apartment (STA) mode before OLE Exception .


            }
            catch (Exception ex)
            {

            }

        }

        static void ThreadMethod()
        {
            Stream myStream;
            SaveFileDialog saveFileDialog1 = new SaveFileDialog();
            saveFileDialog1.FilterIndex = 2;
            saveFileDialog1.RestoreDirectory = true;

            if (saveFileDialog1.ShowDialog() == DialogResult.OK)
            {
                if ((myStream = saveFileDialog1.OpenFile()) != null)
                {
                    // Code to write the stream goes here.
                    myStream.Close();
                }
            }
        }

        public void ActionSave(ModDataBackupModel model)
        {
            if (ValidSave(model))
                SaveRedirect();
        }

        public void ActionApply(ModDataBackupModel model)
        {
            if (ValidSave(model))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModDataBackupModel model)
        {
            if (ValidSave(model))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModDataBackupEntity entity = null;

        private bool ValidSave(ModDataBackupModel model)
        {
            TryUpdateModel(entity);

            //chong hack
            entity.ID = model.RecordID;

            ViewBag.Data = entity;
            ViewBag.Model = model;

            CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;

            //kiem tra quyen han
            if ((model.RecordID < 1 && !CPViewPage.UserPermissions.Add) || (model.RecordID > 0 && !CPViewPage.UserPermissions.Edit))
                CPViewPage.Message.ListMessage.Add("Quyền hạn chế.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {

                //save
                ModDataBackupService.Instance.Save(entity);

                return true;
            }

            return false;
        }

        #endregion
    }

    public class ModDataBackupModel : DefaultModel
    {
        public string Url { get; set; }
    }
}

