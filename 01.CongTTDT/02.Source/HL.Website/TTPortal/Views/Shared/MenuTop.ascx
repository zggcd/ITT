<%@ Control Language="C#" AutoEventWireup="true" %>
<ul id="menu">
    <li class="node"><a href="/TTPortal/">Home</a>
    <li class="node"><a>{RS:MenuTop_Management}</a>
        <ul>
            <li><a class="icon-16-article" href="/{CPPath}/ModNews/Index.aspx">{RS:MenuTop_News}</a></li>
            <li><a class="icon-16-article" href="/{CPPath}/ModTag/Index.aspx">Tags</a></li>
            <li><a class="icon-16-article" href="/{CPPath}/ModRSS/Index.aspx">RSS</a></li>
            <li><a class="icon-16-article" href="/{CPPath}/ModDuThao/Index.aspx">Dự thảo</a></li>
            <li><a class="icon-16-article" href="/{CPPath}/ModVanBan/Index.aspx">Văn bản</a></li>
            <li><a class="icon-16-media" href="/{CPPath}/ModAdv/Index.aspx">{RS:MenuTop_Adv}</a></li>
            <li><a class="icon-16-massmail" href="/{CPPath}/ModFeedback/Index.aspx">{RS:MenuTop_Feedback}</a></li>
            <li><a class="icon-16-massmail" href="/{CPPath}/ModGopY/Index.aspx">Góp ý</a></li>
            <li><a class="icon-16-component" href="/{CPPath}/ModFile/Index.aspx">{RS:MenuTop_FileManagement}</a></li>
            <li><a class="icon-16-article" href="/{CPPath}/ModUser/Index.aspx">Cán bộ Nhà nước</a></li>
            <li class="node"><a class="icon-16-themes">Hình ảnh/Video</a>
                <ul>
                    <li><a class="icon-16-article" href="/{CPPath}/ModAlbum/Index.aspx">Tin Ảnh</a></li>
                    <li><a class="icon-16-article" href="/{CPPath}/ModVideo/Index.aspx">Tin Video</a></li>
                </ul>
            </li>
            <li><a class="icon-16-massmail" href="/{CPPath}/ModConfigSendMail/Index.aspx">Cấu hình Email</a></li>
        </ul>
    </li>
    <li class="node"><a>Báo cáo sự cố</a>
        <ul>
            <li><a class="icon-16-article" href="/{CPPath}/ModHSThanhVienUCSC/Index.aspx">Bản khai hồ sơ thành viên UCSC</a></li>
            <li><a class="icon-16-article" href="/{CPPath}/ModDonDangKyUCSC/Index.aspx">Đăng ký tham gia mạng lưới UCSC</a></li>
            <li><a class="icon-16-article" href="/{CPPath}/ModBaoCaoBanDauSuCo/Index.aspx">Báo cáo ban đầu sự cố mạng</a></li>
            <li><a class="icon-16-article" href="/{CPPath}/ModBaoCaoKetThucSuCo/Index.aspx">Báo cáo kết thúc sự cố mạng</a></li>
            <li><a class="icon-16-article" href="/{CPPath}/ModBaoCaoTongHop/Index.aspx">Báo cáo tổng hợp</a></li>
        </ul>
    </li>
    <li class="node"><a href="/{CPPath}/ModIncident/Index.aspx">Quản lý sự cố</a>
        <%--<ul>
            <li><a class="icon-16-article" href="/{CPPath}/ModIncident/Index.aspx">Deface</a></li>
            <li><a class="icon-16-article" href="/{CPPath}/ModIncident/Index.aspx">Phishing</a></li>
            <li><a class="icon-16-article" href="/{CPPath}/ModIncident/Index.aspx">Malware</a></li>
            <li><a class="icon-16-article" href="/{CPPath}/ModIncident/Index.aspx">C&C botnet</a></li>
            <li><a class="icon-16-article" href="/{CPPath}/ModIncident/Index.aspx">Attack</a></li>
        </ul>--%>
    </li>
    <li class="node"><a>{RS:MenuTop_Design}</a>
        <ul>
            <li><a class="icon-16-menu" href="/{CPPath}/SysPage/Index.aspx">{RS:MenuTop_Page}</a></li>
            <li><a class="icon-16-themes" href="/{CPPath}/SysTemplate/Index.aspx">{RS:MenuTop_Template}</a></li>
            <li><a class="icon-16-module" href="/{CPPath}/SysSite/Index.aspx">Site</a></li>
            <li><a class="icon-16-plugin" href="/{CPPath}/SysModule/Index.aspx">{RS:MenuTop_Function}</a></li>
        </ul>
    </li>
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

    <li class="node"><a>Cá nhân</a>
        <ul>
            <li><a class="icon-16-component" href="/{CPPath}/UserChangePass.aspx">Thay đổi mật khẩu</a></li>
            <li><a class="icon-16-component" href="/{CPPath}/UserChangeInfo.aspx">Thay đổi thông tin</a></li>
        </ul>
    </li>
</ul>
