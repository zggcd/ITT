<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModFeedbackEntity;
    if (item == null)
        item = new ModFeedbackEntity();

    var detail = ViewBag.Detail as ModNewsEntity;
%>

<div class="row-fluid titleContainer">
    <span><%=ViewPage.CurrentPage.Name %></span>
</div>
<div class="row-fluid contentNews">
    <div>
        <div id="details">
            <%if (detail != null)
                { %> <%=detail.Content%> <%} %>
        </div>

        <form method="post">
            <div class="form-group row">
                <label for="example-text-input" class="col-2 col-form-label">{RS:Web_FB_Title} (*)</label>
                <div class="col-10">
                    <input class="form-control" type="text" name="Title" value="<%=item.Title %>" id="Title">
                </div>
            </div>
            <div class="form-group row">
                <label for="example-text-input" class="col-2 col-form-label">{RS:Web_FB_Content} (*)</label>
                <div class="col-10">
                    <textarea class="form-control" name="Content" id="Content" rows="3"><%=item.Content %></textarea>
                </div>
            </div>
            <div class="form-group row">
                <label for="example-text-input" class="col-2 col-form-label">{RS:Web_FB_Name} (*)</label>
                <div class="col-10">
                    <input class="form-control" type="text" name="Name" value="<%=item.Name %>" id="Name">
                </div>
            </div>
            <div class="form-group row">
                <label for="example-text-input" class="col-2 col-form-label">{RS:Web_FB_Phone} (*)</label>
                <div class="col-10">
                    <input class="form-control" type="text" name="Phone" value="<%=item.Phone %>" id="Phone">
                </div>
            </div>
            <div class="form-group row">
                <label for="example-text-input" class="col-2 col-form-label">{RS:Web_FB_Email} (*)</label>
                <div class="col-10">
                    <input class="form-control" type="text" name="Email" value="<%=item.Email %>" id="Email">
                </div>
            </div>
            <div class="form-group row">
                <label for="example-text-input" class="col-2 col-form-label"></label>
                <div class="col-10">
                    <button name="_hl_action[AddPOST]" type="submit" class="btn btn-primary">{RS:Web_FB_Submit}</button>
                </div>
            </div>
        </form>
        <hr>
    </div>
</div>
