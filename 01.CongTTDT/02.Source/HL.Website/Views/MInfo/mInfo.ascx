<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%CPUserEntity entity = ViewBag.Data as CPUserEntity ?? CPLogin.CurrentUser; %>

<p class="col-xs-12 name-title-nav">
    <a href="/" title="">
        <img style="display: inline;" class="img-responsive" src="/mContent/image/icon-home2.png" /></a>
    Thông tin thành viên
                <a href="javascript:;" onclick="javascript:window.history.back(-1);" title="">
                    <img class="img-responsive" src="/mContent/image/icon-back.png" /></a>
</p>
<div style="clear: both;"></div>
<div class="clear20"></div>


<form method="post" enctype="multipart/form-data">
    <div class="col-xs-12 form-dk">
        <p><strong>Tên để thảo luận</strong></p>
        <input type="text" id="" name="LoginName" value="<%=entity.LoginName %>" />
    </div>
    <div class="clear20"></div>

    <div class="col-xs-12 form-dk">
        <p><strong>Họ tên</strong></p>
        <input type="text" id="" name="Name" value="<%=entity.Name %>" />
    </div>
    <div class="clear20"></div>

    <div class="col-xs-12 form-dk">
        <p><strong>Tỉnh/Thành phố</strong></p>
        <select id="" name="CityID">
            <%=Utils.ShowDDLMenuByType3("City",1,entity.CityID) %>
        </select>
    </div>
    <div class="clear20"></div>

    <div class="col-xs-12 form-dk">
        <p><strong>Email liên lạc hiện tại</strong></p>
        <input readonly="readonly" type="text" id="" name="Email" value="<%=entity.Email %>" />
    </div>
    <div class="clear20"></div>

    <div class="col-xs-12 form-dk">
        <p><strong>Năm sinh và giới tính</strong></p>
        <select id="" name="Year" style="width: 30%;">
            <option value="0">--Chọn năm sinh--</option>
            <%for (int i = 1950; i < DateTime.Now.Year - 10; i++)
              { %>
            <option value="<%=i %>" <%if (entity.Year == i)
                                      { %>
                selected<%} %>>
                <%=i %></option>
            <%} %>
        </select>
        <div class="dk-radio">
            <input type="radio" <%if (entity.Sex)
                                  { %>
                checked="checked" <%} %> id="" name="Sex"
                value="1" /><span>Nam</span>
            <input type="radio" <%if (!entity.Sex)
                                  { %>
                checked="checked" <%} %> id="" name="Sex"
                value="0" /><span>Nữ</span>
        </div>
    </div>
    <div class="clear20"></div>

    <div class="col-xs-12 form-dk">
        <p><strong>Điện thoại</strong></p>
        <input onkeypress="return pkeypress(event);" type="text" id="" name="Phone" value="<%=entity.Phone %>" />
    </div>
    <div class="clear20"></div>

    <div class="col-xs-12 form-dk">
        <p><strong>Lý do tham gia diễn đàn</strong></p>
        <textarea id="" name="Note" rows="5" style="height: auto;"><%=entity.Note %></textarea>
    </div>
    <div class="clear20"></div>

    <div class="col-xs-12 form-dk">
        <p><strong>Cập nhật Avatar</strong></p>
        <%if (!string.IsNullOrEmpty(entity.File))
          { %>
        <img src="<%=entity.File.Replace("~/","/") %>" width="60" />
        <br />
        <%} %>
        <input type="file" id="Avatar" name="Avatar" />
    </div>
    <div class="clear20"></div>

    <div class="col-xs-12 form-dk link-dk btn-thaoluan" style="text-align: center;">
        <input type="submit" id="" name="_hl_action[ChangeInfoPOST]" value="Cập nhật" />
        <input style="margin-left: 10px;" onclick="location.href = '/Thanh-vien/doi-mat-khau.aspx';" type="button" name="" value="Sửa mật khẩu" />
        <input type="hidden" name="File" value="<%=entity.File %>" />

        <div class="clear10"></div>
    </div>

</form>
<div class="clear25">
</div>
