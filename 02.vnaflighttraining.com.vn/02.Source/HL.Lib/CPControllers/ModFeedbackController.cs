using HL.Lib.MVC;
using HL.Lib.Models;

namespace HL.Lib.CPControllers
{
    public class ModFeedbackController : CPController
    {
        public ModFeedbackController()
        {
            //khoi tao Service
            DataService = ModFeedbackService.Instance;
            CheckPermissions = true;
        }

        public void ActionIndex(ModFeedbackModel model)
        {
            // sap xep tu dong
            string orderBy = AutoSort(model.Sort);

            // tao danh sach
            var dbQuery = ModFeedbackService.Instance.CreateQuery()
                                .Take(model.PageSize)
                                .OrderBy(orderBy)
                                .Skip(model.PageIndex * model.PageSize);

            ViewBag.Data = dbQuery.ToList();
            model.TotalRecord = dbQuery.TotalRecord;
            ViewBag.Model = model;
        }

        public void ActionAdd(ModFeedbackModel model)
        {
            if (model.RecordID > 0)
            {
                entity = ModFeedbackService.Instance.GetByID(model.RecordID);

                // khoi tao gia tri mac dinh khi update
            }
            else
            {
                entity = new ModFeedbackEntity();

                // khoi tao gia tri mac dinh khi insert
            }

            ViewBag.Data = entity;
            ViewBag.Model = model;
        }

        #region private func

        private ModFeedbackEntity entity = null;

        #endregion
    }

    public class ModFeedbackModel : DefaultModel
    {
    }
}
