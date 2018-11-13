using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class ModBaoCaoBanDauSuCoController : CPController
    {
        public ModBaoCaoBanDauSuCoController()
        {
            //khoi tao Service
            DataService = ModBaoCaoBanDauSuCoService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModBaoCaoBanDauSuCoModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModBaoCaoBanDauSuCoService.Instance.CreateQuery()
                                .Where(!string.IsNullOrEmpty(model.SearchText), o => o.Name.Contains(model.SearchText))
                                .Where(model.State > 0, o => (o.State & model.State) == model.State)
                                .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForCP("BaoCaoBanDauSuCo", model.MenuID, model.LangID))
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModBaoCaoBanDauSuCoModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModBaoCaoBanDauSuCoService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
                entity.UserID1 = Lib.Global.CPLogin.UserID;

                ViewBag.CachThuc = ModInfoMagicService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == entity.ID)
                    .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("CachThuc", model.MenuID, model.LangID))
                    .ToList();

                ViewBag.ThongBao = ModInfoMagicService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == entity.ID)
                    .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("GuiThongBaoSuCo", model.MenuID, model.LangID))
                    .ToList();

                ViewBag.DichVu = ModInfoMagicService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == entity.ID)
                    .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("DichVu", model.MenuID, model.LangID))
                    .ToList();

                ViewBag.BienPhap = ModInfoMagicService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == entity.ID)
                    .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("BienPhapATTT", model.MenuID, model.LangID))
                    .ToList();

                ViewBag.ThongTinGuiKem = ModInfoMagicService.Instance.CreateQuery()
                    .Where(o => o.Activity == true && o.BaoCaoBanDauSuCoID == entity.ID)
                    .WhereIn(o => o.MenuID, WebMenuService.Instance.GetChildIDForWeb_Cache("ThongTinGuiKem", model.MenuID, model.LangID))
                    .ToList();
            }
            else
            {
                entity = new ModBaoCaoBanDauSuCoEntity();

                // khoi tao gia tri mac dinh khi insert
                entity.MenuID = model.MenuID;
                entity.UserID = Lib.Global.CPLogin.UserID;
                DateTime d = DateTime.Now;
                entity.ChiTiet_NgayGioPhatHien = d;
                entity.ThoiGianThucHien = d;
                entity.Published = d;
                entity.Activity = CPViewPage.UserPermissions.Approve;
                entity.Order = GetMaxOrder(model);
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        public override void ActionDelete(int[] arrID)
        {
            if (CheckPermissions && !CPViewPage.UserPermissions.Delete)
            {
                //thong bao
                CPViewPage.Message.MessageType = Message.MessageTypeEnum.Error;
                CPViewPage.Message.ListMessage.Add("Quyền hạn chế.");
                return;
            }

            DataService.Delete("[ID] IN (" + HL.Core.Global.Array.ToString(arrID) + ")");
            var query = ModInfoMagicService.Instance.CreateQuery().WhereIn(o => o.BaoCaoBanDauSuCoID, HL.Core.Global.Array.ToString(arrID)).ToList();
            ModInfoMagicService.Instance.Delete(query);

            //thong bao
            CPViewPage.SetMessage("Đã xóa thành công.");
            CPViewPage.RefreshPage();
        }

        public void ActionSave(ModBaoCaoBanDauSuCoModel model, MInfoMagicModel modelInfo, MAppend append)
        {
            if (ValidSave(model, modelInfo, append))
                SaveRedirect();
        }

        public void ActionApply(ModBaoCaoBanDauSuCoModel model, MInfoMagicModel modelInfo, MAppend append)
        {
            if (ValidSave(model, modelInfo, append))
                ApplyRedirect(model.RecordID, entity.ID);
        }

        public void ActionSaveNew(ModBaoCaoBanDauSuCoModel model, MInfoMagicModel modelInfo, MAppend append)
        {
            if (ValidSave(model, modelInfo, append))
                SaveNewRedirect(model.RecordID, entity.ID);
        }

        #region private func

        private ModBaoCaoBanDauSuCoEntity entity = null;

        private bool ValidSave(ModBaoCaoBanDauSuCoModel model, MInfoMagicModel modelInfo, MAppend append)
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

            //kiem tra ten 
            if (entity.Name.Trim() == string.Empty)
                CPViewPage.Message.ListMessage.Add("Nhập tên.");

            //kiem tra chuyen muc
            //if (entity.MenuID < 1)
            //    CPViewPage.Message.ListMessage.Add("Chọn chuyên mục.");

            if (CPViewPage.Message.ListMessage.Count == 0)
            {
                //neu khong nhap code -> tu sinh
                if (entity.Code.Trim() == string.Empty)
                    entity.Code = Data.GetCode(entity.Name);

                //cap nhat state
                entity.State = GetState(model.ArrState);

                //save
                int id = ModBaoCaoBanDauSuCoService.Instance.Save(entity);
                if (model.RecordID > 0) UpdateOther(entity, modelInfo, append);
                else SaveOther(id, modelInfo, append);

                return true;
            }

            return false;
        }

        private int GetMaxOrder(ModBaoCaoBanDauSuCoModel model)
        {
            return ModBaoCaoBanDauSuCoService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        private void SaveOther(int id, MInfoMagicModel modelInfo, MAppend append)
        {
            DateTime date = DateTime.Now;
            string ngayGioPhatHien = append.Ngay + " " + append.GioPhut;
            string[] arr = append.ThoiGian.Split('/');
            string thoiGianThucHien = "";
            if (arr.Length == 5) thoiGianThucHien = arr[0] + "/" + arr[1] + "/" + arr[2] + " " + arr[3] + ":" + arr[4];
            string code = "BCBDSC" + ModBaoCaoBanDauSuCoService.Instance.GetMaxID();

            //Cach thuc phat hien
            int num = modelInfo.chkCachThuc != null ? modelInfo.chkCachThuc.Length : 0;
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkCachThuc[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                    {
                        BaoCaoBanDauSuCoID = id,
                        Order = GetMaxOrder_InfoMagic(),
                        Published = date,
                        Activity = true
                    };
                    entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                    if (tmp[0] == "1")
                    {
                        int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                        if (modelInfo.txtCachThuc != null && modelInfo.txtCachThuc.Length >= idx)
                        {
                            entityTmp.Name = modelInfo.txtCachThuc[idx];
                            entityTmp.Code = Data.GetCode(modelInfo.txtCachThuc[idx]);
                        }
                    }
                    ModInfoMagicService.Instance.Save(entityTmp);
                }
            }

            //Da gui thong bao su co
            num = modelInfo.chkThongBao != null ? modelInfo.chkThongBao.Length : 0;
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkThongBao[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                    {
                        BaoCaoBanDauSuCoID = id,
                        Order = GetMaxOrder_InfoMagic(),
                        Published = date,
                        Activity = true
                    };
                    entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                    if (tmp[0] == "1")
                    {
                        int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                        if (modelInfo.txtThongBao != null && modelInfo.txtThongBao.Length >= idx)
                        {
                            entityTmp.Name = modelInfo.txtThongBao[idx];
                            entityTmp.Code = Data.GetCode(modelInfo.txtThongBao[idx]);
                        }
                    }
                    ModInfoMagicService.Instance.Save(entityTmp);
                }
            }

            //Dich vu
            num = modelInfo.chkDichVu != null ? modelInfo.chkDichVu.Length : 0;
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkDichVu[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                    {
                        BaoCaoBanDauSuCoID = id,
                        Order = GetMaxOrder_InfoMagic(),
                        Published = date,
                        Activity = true
                    };
                    entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                    if (tmp[0] == "1")
                    {
                        int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                        if (modelInfo.txtDichVu != null && modelInfo.txtDichVu.Length >= idx)
                        {
                            entityTmp.Name = modelInfo.txtDichVu[idx];
                            entityTmp.Code = Data.GetCode(modelInfo.txtDichVu[idx]);
                        }
                    }
                    ModInfoMagicService.Instance.Save(entityTmp);
                }
            }

            //Bien phap
            num = modelInfo.chkBienPhap != null ? modelInfo.chkBienPhap.Length : 0;
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkBienPhap[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                    {
                        BaoCaoBanDauSuCoID = id,
                        Order = GetMaxOrder_InfoMagic(),
                        Published = date,
                        Activity = true
                    };
                    entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                    if (tmp[0] == "1")
                    {
                        int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                        if (modelInfo.txtBienPhap != null && modelInfo.txtBienPhap.Length >= idx)
                        {
                            entityTmp.Name = modelInfo.txtBienPhap[idx];
                            entityTmp.Code = Data.GetCode(modelInfo.txtBienPhap[idx]);
                        }
                    }
                    ModInfoMagicService.Instance.Save(entityTmp);
                }
            }

            //Thong tin gui kem
            num = modelInfo.chkThongTinGuiKem != null ? modelInfo.chkThongTinGuiKem.Length : 0;
            for (int i = 0; i < num; i++)
            {
                string[] tmp = modelInfo.chkThongTinGuiKem[i].Split('_');
                if (tmp.Length == 3)
                {
                    ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                    {
                        BaoCaoBanDauSuCoID = id,
                        Order = GetMaxOrder_InfoMagic(),
                        Published = date,
                        Activity = true
                    };
                    entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                    if (tmp[0] == "1")
                    {
                        int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                        if (modelInfo.txtThongTinGuiKem != null && modelInfo.txtThongTinGuiKem.Length >= idx)
                        {
                            entityTmp.Name = modelInfo.txtThongTinGuiKem[idx];
                            entityTmp.Code = Data.GetCode(modelInfo.txtThongTinGuiKem[idx]);
                        }
                        ModInfoMagicService.Instance.Save(entityTmp);
                    }
                }
            }

            ViewBag.BaoCao = entity;
        }

        public void UpdateOther(ModBaoCaoBanDauSuCoEntity entityBc, MInfoMagicModel modelInfo, MAppend append)
        {
            int userId = HL.Lib.Global.CPLogin.UserID;
            var entity = ModBaoCaoBanDauSuCoService.Instance.CreateQuery()
                        //.Where(userId > 0, o => o.UserID == userId)
                        .Where(o => o.Code == entityBc.Code)
                        .ToSingle();
            if (entity != null)
            {
                DateTime date = DateTime.Now;
                string ngayGioPhatHien = append.Ngay + " " + append.GioPhut;
                string[] arr = append.ThoiGian.Split('/');
                string thoiGianThucHien = "";
                if (arr.Length == 5) thoiGianThucHien = arr[0] + "/" + arr[1] + "/" + arr[2] + " " + arr[3] + ":" + arr[4];
                if (!string.IsNullOrEmpty(ngayGioPhatHien)) entityBc.ChiTiet_NgayGioPhatHien = HL.Core.Global.Convert.ToDateTime(ngayGioPhatHien);
                else entityBc.ChiTiet_NgayGioPhatHien = DateTime.MinValue;
                if (!string.IsNullOrEmpty(thoiGianThucHien)) entityBc.ThoiGianThucHien = HL.Core.Global.Convert.ToDateTime(thoiGianThucHien);
                else entityBc.ThoiGianThucHien = DateTime.MinValue;

                entityBc.ID = entity.ID;
                entityBc.UserID = entity.UserID;
                entityBc.UserID1 = userId;
                entityBc.MenuID = entity.MenuID;
                entityBc.State = entity.State;
                entityBc.Name = entity.Name;
                entityBc.Code = entity.Code;
                entityBc.Order = entity.Order;
                entityBc.Published = entity.Published;
                entityBc.Published1 = date;
                entityBc.Activity = false;
                ModBaoCaoBanDauSuCoService.Instance.Save(entityBc);

                //Xoa toan bo thong tin InfoMagic cua Bao cao ban dau su co
                var lstInfoMagic = ModInfoMagicService.Instance.CreateQuery()
                        .Where(o => o.BaoCaoBanDauSuCoID == entity.ID)
                        .ToList();
                if (lstInfoMagic != null) ModInfoMagicService.Instance.Delete(lstInfoMagic);

                //Cach thuc phat hien
                int num = modelInfo.chkCachThuc != null ? modelInfo.chkCachThuc.Length : 0;
                for (int i = 0; i < num; i++)
                {
                    string[] tmp = modelInfo.chkCachThuc[i].Split('_');
                    if (tmp.Length == 3)
                    {
                        ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                        {
                            BaoCaoBanDauSuCoID = entity.ID,
                            Order = GetMaxOrder_InfoMagic(),
                            Published = date,
                            Activity = true
                        };
                        entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                        if (tmp[0] == "1")
                        {
                            int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                            if (modelInfo.txtCachThuc != null && modelInfo.txtCachThuc.Length >= idx)
                            {
                                entityTmp.Name = modelInfo.txtCachThuc[idx];
                                entityTmp.Code = Data.GetCode(modelInfo.txtCachThuc[idx]);
                            }
                        }
                        ModInfoMagicService.Instance.Save(entityTmp);
                    }
                }

                //Da gui thong bao su co
                num = modelInfo.chkThongBao != null ? modelInfo.chkThongBao.Length : 0;
                for (int i = 0; i < num; i++)
                {
                    string[] tmp = modelInfo.chkThongBao[i].Split('_');
                    if (tmp.Length == 3)
                    {
                        ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                        {
                            BaoCaoBanDauSuCoID = entity.ID,
                            Order = GetMaxOrder_InfoMagic(),
                            Published = date,
                            Activity = true
                        };
                        entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                        if (tmp[0] == "1")
                        {
                            int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                            if (modelInfo.txtThongBao != null && modelInfo.txtThongBao.Length >= idx)
                            {
                                entityTmp.Name = modelInfo.txtThongBao[idx];
                                entityTmp.Code = Data.GetCode(modelInfo.txtThongBao[idx]);
                            }
                        }
                        ModInfoMagicService.Instance.Save(entityTmp);
                    }
                }

                //Dich vu
                num = modelInfo.chkDichVu != null ? modelInfo.chkDichVu.Length : 0;
                for (int i = 0; i < num; i++)
                {
                    string[] tmp = modelInfo.chkDichVu[i].Split('_');
                    if (tmp.Length == 3)
                    {
                        ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                        {
                            BaoCaoBanDauSuCoID = entity.ID,
                            Order = GetMaxOrder_InfoMagic(),
                            Published = date,
                            Activity = true
                        };
                        entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                        if (tmp[0] == "1")
                        {
                            int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                            if (modelInfo.txtDichVu != null && modelInfo.txtDichVu.Length >= idx)
                            {
                                entityTmp.Name = modelInfo.txtDichVu[idx];
                                entityTmp.Code = Data.GetCode(modelInfo.txtDichVu[idx]);
                            }
                        }
                        ModInfoMagicService.Instance.Save(entityTmp);
                    }
                }

                //Bien phap
                num = modelInfo.chkBienPhap != null ? modelInfo.chkBienPhap.Length : 0;
                for (int i = 0; i < num; i++)
                {
                    string[] tmp = modelInfo.chkBienPhap[i].Split('_');
                    if (tmp.Length == 3)
                    {
                        ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                        {
                            BaoCaoBanDauSuCoID = entity.ID,
                            Order = GetMaxOrder_InfoMagic(),
                            Published = date,
                            Activity = true
                        };
                        entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                        if (tmp[0] == "1")
                        {
                            int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                            if (modelInfo.txtBienPhap != null && modelInfo.txtBienPhap.Length >= idx)
                            {
                                entityTmp.Name = modelInfo.txtBienPhap[idx];
                                entityTmp.Code = Data.GetCode(modelInfo.txtBienPhap[idx]);
                            }
                        }
                        ModInfoMagicService.Instance.Save(entityTmp);
                    }
                }

                //Thong tin gui kem
                num = modelInfo.chkThongTinGuiKem != null ? modelInfo.chkThongTinGuiKem.Length : 0;
                for (int i = 0; i < num; i++)
                {
                    string[] tmp = modelInfo.chkThongTinGuiKem[i].Split('_');
                    if (tmp.Length == 3)
                    {
                        ModInfoMagicEntity entityTmp = new ModInfoMagicEntity()
                        {
                            BaoCaoBanDauSuCoID = entity.ID,
                            Order = GetMaxOrder_InfoMagic(),
                            Published = date,
                            Activity = true
                        };
                        entityTmp.MenuID = HL.Core.Global.Convert.ToInt(tmp[2]);
                        if (tmp[0] == "1")
                        {
                            int idx = HL.Core.Global.Convert.ToInt(tmp[1]);
                            if (modelInfo.txtThongTinGuiKem != null && modelInfo.txtThongTinGuiKem.Length >= idx)
                            {
                                entityTmp.Name = modelInfo.txtThongTinGuiKem[idx];
                                entityTmp.Code = Data.GetCode(modelInfo.txtThongTinGuiKem[idx]);
                            }
                        }
                        ModInfoMagicService.Instance.Save(entityTmp);
                    }
                }

                ViewBag.BaoCao = entityBc;
            }
        }

        private int GetMaxOrder_InfoMagic()
        {
            return ModInfoMagicService.Instance.CreateQuery()
                    .Max(o => o.Order)
                    .ToValue().ToInt(0) + 1;
        }

        #endregion
    }

    public class ModBaoCaoBanDauSuCoModel : DefaultModel
    {
        private int _LangID = 1;
        public int LangID
        {
            get { return _LangID; }
            set { _LangID = value; }
        }

        public int MenuID { get; set; }
        public int State { get; set; }
        public string SearchText { get; set; }

        public int[] ArrState { get; set; }
    }

    /// <summary>
    /// Model bo sung them cac item dac biet
    /// </summary>
    public class MAppend
    {
        public string Ngay { get; set; }
        public int Gio { get; set; }
        public int Phut { get; set; }
        public string GioPhut { get; set; }    //Dinh dang: HH:MM
        public string ThoiGian { get; set; }    //Dinh dang: dd/MM/yyyy/HH/mm
        public string M { get; set; }
        //public string Name1 { get; set; }
        public string NhanLuc { get; set; }
        public string TongHopNhanLucLVDT { get; set; }
        public string TongHopNhanLucTDDT { get; set; }
        public string TongHopNhanLucCC { get; set; }
        public string TongHopNhanLucNhomATTT { get; set; }
        public string TongHopNhanLucNhomKTPT { get; set; }
        public string TongHopNhanLucNhomKTBV { get; set; }
        public string TongHopNhanLucNhomKTKT { get; set; }

        public string Name1 { get; set; }
        public string ChucVu1 { get; set; }
        public string DiaChi1 { get; set; }
        public string DienThoai1 { get; set; }
        public string DienThoaiDD1 { get; set; }
        public string Fax1 { get; set; }
        public string Email1 { get; set; }
    }

    public class MInfoMagicModel
    {
        //Cac gia tri cua chk duoc luu duoi dinh dang: Co nhap text (bool)/Index tuong ung voi txt/MenuID
        public string[] chkCachThuc { get; set; }
        public string[] txtCachThuc { get; set; }
        public string[] chkThongBao { get; set; }
        public string[] txtThongBao { get; set; }
        public string[] chkDichVu { get; set; }
        public string[] txtDichVu { get; set; }
        public string[] chkBienPhap { get; set; }
        public string[] txtBienPhap { get; set; }
        public string[] chkThongTinGuiKem { get; set; }
        public string[] txtThongTinGuiKem { get; set; }
    }
}

