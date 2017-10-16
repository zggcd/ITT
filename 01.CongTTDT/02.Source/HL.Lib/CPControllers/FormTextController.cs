using HL.Lib.MVC;

namespace HL.Lib.CPControllers
{
    public class FormTextController : CPController
    {
        public void ActionIndex(FormTextModel model)
        {
            if (!CPViewPage.IsPostBack && !string.IsNullOrEmpty(model.Value))
                model.Value = Global.Data.Base64Decode(model.Value.Replace(" ", "+"));

            ViewBag.Model = model;
        }

        public void ActionApply(FormTextModel model)
        {
            if (string.IsNullOrEmpty(model.Value))
            {
                CPViewPage.Alert("Nhập nội dung");
                return;
            }

            CPViewPage.Script("Close", "Close('" + Global.Data.Base64Encode(model.Value) + "')");
        }

        public override void ActionCancel()
        {
            CPViewPage.Script("Cancel", "Cancel()");
        }
    }

    public class FormTextModel : DefaultModel
    {
        public string Value { get; set; }
    }
}
