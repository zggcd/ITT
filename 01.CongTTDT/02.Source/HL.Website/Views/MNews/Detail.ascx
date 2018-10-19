<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<% 
    var item = ViewBag.Data as ModNewsEntity;
    var listOther = ViewBag.Other as List<ModNewsEntity>;
    int c = listOther != null ? listOther.Count : 0;
    int i = 0;

    string langCode = "", urlHome = "/";
    if (ViewPage.CurrentLang.ID == 1)
    {
        langCode = "vn";
    }
    else if (ViewPage.CurrentLang.ID == 2)
    {
        langCode = "en";
        urlHome = "/en/Home.aspx";
    }
    else if (ViewPage.CurrentLang.ID == 3)
    {
        langCode = "cn";
        urlHome = "/cn/Home.aspx";
    }

    int menuId = ViewPage.CurrentPage.MenuID;
    var comment = ViewBag.Comment as ModCommentEntity;
%>

<div class="row-fluid titleContainer">
    <span><%=item.Name %></span>
    <span class="pull-right"><%=string.Format("{0:dd/MM/yyyy HH:mm:ss}", item.Published) %></span>
</div>
<div class="row-fluid contentNews">
    <div>
        <%=item.Content %>
        <hr>
    </div>
    <%if (ViewBag.ShowBinhLuan == 1)
        {%>
    <div>
        <p>Bình luận bài viết:</p>
        <form class="form-horizontal" action="{ActionForm}" method="post">
            <div class="form-group">
                <label for="txtHoTen" class="col-sm-2 control-label">Họ và tên <span class="required">*</span></label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="txtHoTen" name="HoTen" placeholder="Họ và tên" value="<%=comment.HoTen %>">
                </div>
            </div>
            <div class="form-group">
                <label for="txtEmail" class="col-sm-2 control-label">Email</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="txtEmail" name="Email" placeholder="Email" value="<%=comment.Email %>">
                </div>
            </div>
            <div class="form-group">
                <label for="txtPhoneNumber" class="col-sm-2 control-label">Số điện thoại <span class="required">*</span></label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="txtPhoneNumber" name="PhoneNum" placeholder="Số điện thoại" value="<%=comment.PhoneNum %>">
                </div>
            </div>
            <div class="form-group">
                <label for="txtTitle" class="col-sm-2 control-label">Tiêu đề <span class="required">*</span></label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" id="txtTitle" name="Name" placeholder="Tiêu đề" value="<%=comment.Name %>">
                </div>
            </div>
            <div class="form-group">
                <label for="txtTitle" class="col-sm-2 control-label">Nội dung</label>
                <div class="col-sm-10">
                    <textarea rows="5" class="form-control" id="txtContent" name="Content" placeholder="Nội dung" style="max-width: 100%; max-height: 300px; min-width: 150px; min-height: 100px;"><%=comment.Content %></textarea>
                </div>
            </div>
            <input type="hidden" name="NewsID" value="<%=item.ID %>" />
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default" name="_hl_action[Comment]">Gửi bình luận</button>
                </div>
            </div>
        </form>
        <hr>
    </div>
    <%}  %>

    <%if (c > 0)
        {%>
    <div class="sameCate">
        <p>Bài cùng chuyên mục:</p>
        <ul class="list-unstyled">
            <%for (i = 0; i < c; i++)
                {%>
            <li><a href="<%=ViewPage.GetURL(listOther[i].MenuID, listOther[i].Code) %>">- <%=listOther[i].Name %></a> (<%=string.Format("{0:dd/MM/yyyy}", listOther[i].Published) %>)</li>
            <%} %>
        </ul>
    </div>
    <%} %>
</div>
