<%@ Control Language="C#" AutoEventWireup="true" %>

<%
    string modules = CPUserService.Instance.GetAllowAccessModule();
    bool hasMenuTop_Management = false;
    if (modules.Contains("ModNews") || modules.Contains("ModComment") || modules.Contains("ModDuThao") || modules.Contains("ModVanBan") || modules.Contains("ModAdv")
         || modules.Contains("ModGopY") || modules.Contains("ModFile") || modules.Contains("ModUser")
          || modules.Contains("ModAlbum") || modules.Contains("ModVideo") || modules.Contains("ModConfigSendMail")
          || modules.Contains("ModEmailTemplate") || modules.Contains("ModISP"))
    {
        hasMenuTop_Management = true;
    }
%>

<ul id="menu">
    <li class="node"><a href="/TTPortal/">Home</a>
        <%if (hasMenuTop_Management == true)
            {%>
    <li class="node"><a>{RS:MenuTop_Management}</a>
        <ul>
            <%if (modules.Contains("ModNews"))
                {%>
            <li><a class="icon-16-article" href="/{CPPath}/ModNews/Index.aspx">{RS:MenuTop_News}</a></li>
            <%} %>
            <%if (modules.Contains("ModComment"))
                {%>
            <li><a class="icon-16-article" href="/{CPPath}/ModComment/Index.aspx">Quản lý bình luận</a></li>
            <%} %>
            <%--<li><a class="icon-16-article" href="/{CPPath}/ModTag/Index.aspx">Tags</a></li>
            <li><a class="icon-16-article" href="/{CPPath}/ModRSS/Index.aspx">RSS</a></li>--%>
            <%if (modules.Contains("ModDuThao"))
                {%>
            <li><a class="icon-16-article" href="/{CPPath}/ModDuThao/Index.aspx">Dự thảo</a></li>
            <%} %>
            <%if (modules.Contains("ModVanBan"))
                {%>
            <li><a class="icon-16-article" href="/{CPPath}/ModVanBan/Index.aspx">Văn bản</a></li>
            <%} %>
            <%if (modules.Contains("ModAdv"))
                {%>
            <li><a class="icon-16-media" href="/{CPPath}/ModAdv/Index.aspx">{RS:MenuTop_Adv}</a></li>
            <%} %>
            <%if (modules.Contains("ModGopY"))
                {%>
            <%--<li><a class="icon-16-massmail" href="/{CPPath}/ModFeedback/Index.aspx">{RS:MenuTop_Feedback}</a></li>--%>
            <li><a class="icon-16-massmail" href="/{CPPath}/ModGopY/Index.aspx">Góp ý</a></li>
            <%} %>
            <%if (modules.Contains("ModFile"))
                {%>
            <li><a class="icon-16-component" href="/{CPPath}/ModFile/Index.aspx">{RS:MenuTop_FileManagement}</a></li>
            <%} %>
            <%if (modules.Contains("ModUser"))
                {%>
            <li><a class="icon-16-article" href="/{CPPath}/ModUser/Index.aspx">Cán bộ Nhà nước</a></li>
            <%} %>
            <%if (modules.Contains("ModAlbum") || modules.Contains("ModVideo"))
                {%>
            <li class="node"><a class="icon-16-themes">Hình ảnh/Video</a>
                <ul>
                    <%if (modules.Contains("ModAlbum"))
                        {%>
                    <li><a class="icon-16-article" href="/{CPPath}/ModAlbum/Index.aspx">Tin Ảnh</a></li>
                    <%} %>
                    <%if (modules.Contains("ModVideo"))
                        {%>
                    <li><a class="icon-16-article" href="/{CPPath}/ModVideo/Index.aspx">Tin Video</a></li>
                    <%} %>
                </ul>
            </li>
            <%} %>
            <%if (modules.Contains("ModDuThao"))
                {%>
            <li><a class="icon-16-massmail" href="/{CPPath}/ModConfigSendMail/Index.aspx">Cấu hình Email</a></li>
            <%} %>
            <%if (modules.Contains("ModDuThao"))
                {%>
            <li><a class="icon-16-massmail" href="/{CPPath}/ModEmailTemplate/Index.aspx">Cấu hình Email template</a></li>
            <%} %>
            <%if (modules.Contains("ModDuThao"))
                {%>
            <li><a class="icon-16-media" href="/{CPPath}/ModISP/Index.aspx">ISP</a></li>
            <%} %>
        </ul>
    </li>
    <%} %>

    <%if (modules.Contains("ModHSThanhVienUCSC") || modules.Contains("ModDonDangKyUCSC")
        || modules.Contains("ModBaoCaoBanDauSuCo") || modules.Contains("ModBaoCaoKetThucSuCo")
        || modules.Contains("ModBaoCaoTongHop") || modules.Contains("ModIncident")
        || modules.Contains("ModBaoCaoTK")|| modules.Contains("ModDichVuCanhBao"))
        {%>
    <li class="node"><a>Mạng lưới</a>
        <ul>
            <%if (modules.Contains("ModIncident"))
                {%>
            <li><a class="icon-16-article" href="/{CPPath}/ModIncident/Index.aspx">Quản lý sự cố</a></li>
            <%} %>

            <%if (modules.Contains("ModBaoCaoTK"))
                {%>
            <li class="node"><a class="icon-16-article">Thống kê sự cố</a>
                <ul>
                    <li><a class="icon-16-article" href="/{CPPath}/ModBaoCaoTK/Deface.aspx">Deface</a></li>
                    <li><a class="icon-16-article" href="/{CPPath}/ModBaoCaoTK/Phishing.aspx">Phishing</a></li>
                    <li><a class="icon-16-article" href="/{CPPath}/ModBaoCaoTK/Malware.aspx">Malware</a></li>
                    <li><a class="icon-16-article" href="/{CPPath}/ModBaoCaoTK/Botnet.aspx">C&C botnet</a></li>
                    <%--<li><a class="icon-16-article" href="/{CPPath}/ModBaoCaoTK/Attack.aspx">Attack</a></li>--%>
                </ul>
            </li>
            <%} %>

            <%if (modules.Contains("ModBaoCaoSuCo"))
                {%>
            <li><a class="icon-16-article" href="/{CPPath}/ModBaoCaoSuCo/Index.aspx">Báo cáo sự cố</a>
                <%--<ul>
                    <li><a class="icon-16-article" href="/{CPPath}/ModBaoCaoBanDauSuCo/Index.aspx">Báo cáo ban đầu sự cố mạng</a></li>
                    <li><a class="icon-16-article" href="/{CPPath}/ModBaoCaoKetThucSuCo/Index.aspx">Báo cáo kết thúc sự cố mạng</a></li>
                    <li><a class="icon-16-article" href="/{CPPath}/ModBaoCaoTongHop/Index.aspx">Báo cáo tổng hợp</a></li>
                </ul>--%>
            </li>
            <%} %>

            <%if (modules.Contains("ModHSThanhVienUCSC") || modules.Contains("ModDonDangKyUCSC"))
                {%>
            <li class="node"><a class="icon-16-article">Thành viên mạng lưới</a>
                <ul>
                    <li><a class="icon-16-article" href="/{CPPath}/ModHSThanhVienUCSC/Index.aspx">Đăng ký bắt buộc</a></li>
                    <li><a class="icon-16-article" href="/{CPPath}/ModDonDangKyUCSC/Index.aspx">Đăng ký tự nguyện</a></li>
                </ul>
            </li>
            <%} %>

            <%if (modules.Contains("ModDichVuCanhBao"))
                {%>
            <li><a class="icon-16-article" href="/{CPPath}/ModDichVuCanhBao/Index.aspx">Dịch vụ cảnh báo</a></li>
            <%} %>
        </ul>
    </li>
    <%} %>

    <%--<li class="node"><a href="/{CPPath}/ModBaoCaoTK/Index.aspx">Báo cáo TK sự cố</a>
        <ul>
            <li><a class="icon-16-article" href="/{CPPath}/ModIncident/Index.aspx">Deface</a></li>
            <li><a class="icon-16-article" href="/{CPPath}/ModIncident/Index.aspx">Phishing</a></li>
            <li><a class="icon-16-article" href="/{CPPath}/ModIncident/Index.aspx">Malware</a></li>
            <li><a class="icon-16-article" href="/{CPPath}/ModIncident/Index.aspx">C&C botnet</a></li>
            <li><a class="icon-16-article" href="/{CPPath}/ModIncident/Index.aspx">Attack</a></li>
        </ul>
    </li>--%>

    <%if (CPLogin.CurrentUser.IsAdministrator == true)
        {%>
    <li class="node"><a>{RS:MenuTop_Design}</a>
        <ul>
            <li><a class="icon-16-menu" href="/{CPPath}/SysPage/Index.aspx">{RS:MenuTop_Page}</a></li>
            <li><a class="icon-16-themes" href="/{CPPath}/SysTemplate/Index.aspx">{RS:MenuTop_Template}</a></li>
            <li><a class="icon-16-module" href="/{CPPath}/SysSite/Index.aspx">Site</a></li>
            <li><a class="icon-16-plugin" href="/{CPPath}/SysModule/Index.aspx">{RS:MenuTop_Function}</a></li>
        </ul>
    </li>
    <%} %>

    <%--
    <%if (modules.Contains("SysPage") || modules.Contains("SysTemplate") || modules.Contains("SysSite") || modules.Contains("SysModule"))
        {%>
    <li class="node"><a>{RS:MenuTop_Design}</a>
        <ul>
            <%if (modules.Contains("SysPage"))
                {%>
            <li><a class="icon-16-menu" href="/{CPPath}/SysPage/Index.aspx">{RS:MenuTop_Page}</a></li>
            <%} %>
            <%if (modules.Contains("SysTemplate"))
                {%>
            <li><a class="icon-16-themes" href="/{CPPath}/SysTemplate/Index.aspx">{RS:MenuTop_Template}</a></li>
            <%} %>
            <%if (modules.Contains("SysSite"))
                {%>
            <li><a class="icon-16-module" href="/{CPPath}/SysSite/Index.aspx">Site</a></li>
            <%} %>
            <%if (modules.Contains("SysModule"))
                {%>
            <li><a class="icon-16-plugin" href="/{CPPath}/SysModule/Index.aspx">{RS:MenuTop_Function}</a></li>
            <%} %>
        </ul>
    </li>
    <%} %>
        <%if (modules.Contains("SysMenu") || modules.Contains("SysRole") || modules.Contains("SysUser")
                     || modules.Contains("ModDataBackup") || modules.Contains("SysResource") || modules.Contains("SysUserLog"))
        {%>
    <li class="node"><a>Hệ thống</a>
        <ul>
            <%if (modules.Contains("SysMenu"))
                {%>
            <li><a class="icon-16-category" href="/{CPPath}/SysMenu/Index.aspx">Chuyên mục</a></li>
            <%} %>
            <%if (modules.Contains("SysRole"))
                {%>
            <li><a class="icon-16-groups" href="/{CPPath}/SysRole/Index.aspx">Nhóm người sử dụng</a></li>
            <%} %>
            <%if (modules.Contains("SysUser"))
                {%>
            <li><a class="icon-16-user" href="/{CPPath}/SysUser/Index.aspx">Người sử dụng</a></li>
            <%} %>
            <%if (modules.Contains("ModDataBackup"))
                {%>
            <li><a class="icon-16-archive" href="/{CPPath}/ModDataBackup/Index.aspx">Backup dữ liệu</a></li>
            <%} %>
            <%if (modules.Contains("SysResource"))
                {%>
            <li><a class="icon-16-language" href="/{CPPath}/SysResource/Index.aspx">Tài nguyên</a></li>
            <%} %>
            <%if (modules.Contains("SysUserLog"))
                {%>
            <li><a class="icon-16-info" href="/{CPPath}/SysUserLog/Index.aspx">Nhật ký đăng nhập</a></li>
            <%} %>
        </ul>
    </li>
    <%} %>--%>

    <%if (CPLogin.CurrentUser.IsAdministrator == true)
        {%>
    <li class="node"><a>Hệ thống</a>
        <ul>
            <li><a class="icon-16-category" href="/{CPPath}/SysMenu/Index.aspx">Chuyên mục</a></li>
            <li><a class="icon-16-groups" href="/{CPPath}/SysRole/Index.aspx">Nhóm người sử dụng</a></li>
            <li><a class="icon-16-user" href="/{CPPath}/SysUser/Index.aspx">Người sử dụng</a></li>
            <li><a class="icon-16-archive" href="/{CPPath}/ModDataBackup/Index.aspx">Backup dữ liệu</a></li>
            <li><a class="icon-16-language" href="/{CPPath}/SysResource/Index.aspx">Tài nguyên</a></li>
            <li><a class="icon-16-info" href="/{CPPath}/SysUserLog/Index.aspx">Nhật ký đăng nhập</a></li>
        </ul>
    </li>
    <%} %>

    <li class="node"><a>Cá nhân</a>
        <ul>
            <li><a class="icon-16-component" href="/{CPPath}/UserChangePass.aspx">Thay đổi mật khẩu</a></li>
            <li><a class="icon-16-component" href="/{CPPath}/UserChangeInfo.aspx">Thay đổi thông tin</a></li>
        </ul>
    </li>
</ul>
