<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>
<%CPUserEntity entity = ViewBag.Data as CPUserEntity ?? new CPUserEntity(); %>

<p class="col-xs-12 name-title-nav">
    <a href="/" title="">
        <img style="display: inline;" class="img-responsive" src="/mContent/image/icon-home2.png" /></a>
    Đăng ký
                <a href="javascript:;" onclick="javascript:window.history.back(-1);" title="">
                    <img class="img-responsive" src="/mContent/image/icon-back.png" /></a>
</p>
<div style="clear: both;"></div>
<div class="clear20"></div>
<form method="post">
    <div class="col-xs-12 form-dk">
        <p><strong>Tên thảo luận</strong></p>
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
        <input type="text" id="" name="Email" value="<%=entity.Email %>" />
    </div>
    <div class="clear20"></div>
    <div class="col-xs-12 form-dk">
        <p><strong>Năm sinh</strong></p>
        <select id="" name="Year" style="width: 30%;">
            <option value="0">--Chọn năm sinh--</option>
            <%for (int i = 1950; i < DateTime.Now.Year - 10; i++)
              { %>
            <option value="<%=i %>" <%if (entity.Year == i)
                                      { %>
                selected<%} %>><%=i %></option>
            <%} %>
        </select>
    </div>
    <div class="clear20"></div>
    <div class="col-xs-12 form-dk">
        <p><strong>Giới tính</strong></p>
        <input type="radio" <%if (entity.Sex)
                              { %>
            checked<%} %> id="" name="Sex" value="1" /><span>Nam</span>
        <input type="radio" <%if (!entity.Sex)
                              { %>
            checked<%} %> id="" name="Sex" value="0" /><span>Nữ</span>
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
        <p><strong>Mật khẩu</strong></p>
        <input type="password" id="" name="Password" value="<%=entity.Password %>" />
    </div>
    <div class="clear20"></div>
    <div class="col-xs-12 form-dk">
        <p><strong>Xác nhận lại mật khẩu</strong></p>
        <input type="password" id="" name="RePassword" />
    </div>
    <div class="clear20"></div>
    <div class="col-xs-12 form-dk">
        <p><strong>Nhập mã bảo vệ</strong></p>
        <input type="text" name="ValidCode" value="" style="width: 20%;" />
        <img class="sec_img" title="Click để thay hình khác" style="height: 35px;" src="/Tools/Security.aspx" name="imgValidCode" id="imgValidCode" alt="ValidCode" />
        <a href="javascript:;" onclick="ChangeImage();">
            <img src="/Content/image/dk-refresh.png" /></a>
       <%-- <input type="text" name="safeCode " id="safeCode" value="<%=Utils.GetRandString()%>" style="font-size: 18px;font-style: italic;letter-spacing: 3px;line-height: 30px;margin-left: 10px;"/>
                
            <a id="changeimg" href="javascript:;" onclick="refreshSafeCode2();">
                <img src="/Content/image/dk-refresh.png" /></a>--%>
    </div>
<%--    <div class="clear20"></div>
    <div class="col-xs-12 form-dk">
        <p><strong>Avatar</strong></p>
        <input class="upload" type="button" id="" name="" value="Upload file" />
    </div>--%>
    <div class="clear20"></div>
    <div class="col-xs-12 form-dk">
        <p><strong><a class="noiquy" href="/Noi-Quy.aspx" title="" target="_blank"><span class="dk-note">Nội quy diễn đàn</span></a></strong></p>
        <input type="checkbox" id="" name="Agree" value="1" />
        <span>Tôi đồng ý chấp nhận nội quy</span>
    </div>
    <div class="clear20"></div>
    <div class="col-xs-12 form-dk link-dk" style="text-align: center;">
        <input type="submit" id="" name="_hl_action[RegisterPOST]" value="ĐĂNG KÝ" />
        <div class="clear10"></div>
        <p>
            <a href="/Thanh-vien/dang-nhap.aspx" title="">Đăng nhập</a> | 
                    <a href="/Thanh-vien/quen-mat-khau.aspx" title="">Quên mật khẩu</a>
        </p>
    </div>
</form>
<div class="clear20"></div>
