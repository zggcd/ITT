using System;
using System.Collections.Generic;

using HL.Lib.MVC;
using HL.Lib.Models;
using HL.Lib.Global;

namespace HL.Lib.CPControllers
{
    public class QuyTrinhTaoTinController : CPController
    {
        public QuyTrinhTaoTinController()
        {
            CheckPermissions = false;
        }

        public void ActionIndex(QuyTrinhTaoTinModel model)
        {
            ViewBag.Model = model;
        }
    }

    public class QuyTrinhTaoTinModel : DefaultModel
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
}
