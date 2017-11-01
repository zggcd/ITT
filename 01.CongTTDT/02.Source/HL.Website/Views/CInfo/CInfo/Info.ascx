<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%CPUserEntity entity = ViewBag.Data as CPUserEntity ?? CPLogin.CurrentUser; %>
<div class="row dk-banner">
    <a href="/" title="">
        <img src="/Content/image/dk-logo.png" alt="" /></a>
</div>
<div class="row tv-title">
    <div class="col-xs-12">
    </div>
</div>
<form method="post" enctype="multipart/form-data">
    <div class="row">
        <div class="col-xs-5 dk-left">
            <p>
                Tên để thảo luận:
            </p>
        </div>
        <div class="col-xs-7 dk-right">
            <input type="text" id="" name="LoginName" value="<%=entity.LoginName %>" readonly="readonly" />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 dk-left">
            <p>
                Họ tên:
            </p>
        </div>
        <div class="col-xs-7 dk-right">
            <input type="text" id="" name="Name" value="<%=entity.Name %>" />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 dk-left">
            <p>
                Tỉnh/Thành phố:
            </p>
        </div>
        <div class="col-xs-7 dk-right">
            <select id="" name="CityID">
                <%=Utils.ShowDDLMenuByType3("City",1,entity.CityID) %>
            </select>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 dk-left">
            <p>
                Email liên lạc hiện tại:
            </p>
        </div>
        <div class="col-xs-7 dk-right">
            <input type="text" id="" name="Email" value="<%=entity.Email %>" />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 dk-left">
            <p>
                Năm sinh và giới tính:
            </p>
        </div>
        <div class="col-xs-7 dk-right">
            <select id="" name="Year" style="width: 30%;">
                <option value="0">--Chọn năm sinh--</option>
                <%for (int i = 1950; i < DateTime.Now.Year - 10; i++)
                  { %>
                <option value="<%=i %>" <%if (entity.Year == i)
                                          { %> selected<%} %>>
                    <%=i %></option>
                <%} %>
            </select>
            <div class="dk-radio">
                <input type="radio" <%if (entity.Sex)
                                      { %> checked="checked" <%} %> id="" name="Sex"
                    value="1" /><span>Nam</span>
                <input type="radio" <%if (!entity.Sex)
                                      { %> checked="checked" <%} %> id="" name="Sex"
                    value="0" /><span>Nữ</span>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 dk-left">
            <p>
                Điện thoại:
            </p>
        </div>
        <div class="col-xs-7 dk-right">
            <input onkeypress="return pkeypress(event);" type="text" id="" name="Phone" value="<%=entity.Phone %>" />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 dk-left">
            <p>
                Lý do tham gia diễn đàn:
            </p>
        </div>
        <div class="col-xs-7 dk-right">
            <textarea id="" name="Note" rows="5" style="height: auto;"><%=entity.Note %></textarea>
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 dk-left">
            <p>
                Cập nhật avatar:
            </p>
        </div>
        <div class="col-xs-7 dk-right">
            <%if (!string.IsNullOrEmpty(entity.File))
              { %>
            <img src="<%=entity.File.Replace("~/","/") %>" width="60" style="margin: 0;" />
            <br />
            <%} %>
            <input type="file" id="Avatar" name="Avatar" style="clear: left; padding-top: 10px;" />
        </div>
    </div>
    <div class="row">
        <div class="col-xs-5 dk-left">
        </div>
        <div class="col-xs-7 dk-right">
            <input type="submit" id="" name="_hl_action[ChangeInfoPOST]" value="Cập nhật" />
            <input style="margin-left: 10px;" onclick="location.href = '/Thanh-vien/Doi-mat-khau.aspx';" type="button" name="" value="Sửa mật khẩu" />
            <input type="hidden" name="File" value="<%=entity.File %>" />
        </div>
    </div>
</form>
<div class="clear25">
</div>
