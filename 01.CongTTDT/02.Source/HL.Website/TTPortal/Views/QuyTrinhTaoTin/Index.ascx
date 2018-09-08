<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.CPViewControl" %>

<style type="text/css">
    ul {
        list-style-type: none;
    }

    h1 {
        font-size: 26px;
    }

    h2 {
        font-size: 22px;
        margin: 0px
    }

    h3 {
        font-size: 20px;
        margin-top: 5px;
    }
    
    .hdsd {
        font-size: 17px;
    }
</style>

<div class="hdsd">
    <h1 style="text-align: center;"><strong>HƯỚNG DẪN QUY TRÌNH TẠO VÀ ĐĂNG TIN TỨC</strong></h1>
    <h2><strong>A.&nbsp;&nbsp; </strong><strong>Người dùng cấp nhân viên</strong></h2>
    <h3><strong>1.&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>Đăng nhập hệ thống</strong></h3>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;Người dùng điền tên đăng nhập vào ô <strong>Tên đăng nhập</strong>, và mật khẩu vào ô <strong>Mật khẩu</strong>, sau đó chọn ngôn ngữ muốn sử dụng rồi nhấn vào <strong>Đăng</strong> <strong>Nhập</strong> để đăng nhập vào hệ thống.</li>
        <li>-&nbsp;&nbsp;&nbsp;Tên đăng nhập là nhanvien. Mật khẩu: 123456
    <p>
        <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/nv-dang-nhap.png" alt="" />
    </p>
        </li>
        <li>-&nbsp;&nbsp;&nbsp;Đăng nhập không thành công sẽ hiển thị thông báo
         <p>
             <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/nv-dang-nhap-failed.png" alt="" />
         </p>
        </li>
    </ul>
    <h3><strong>2.&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>Home</strong></h3>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;Khi đăng nhập thành công, hệ thống hiển thị giao diện
        <p>
            <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/nv-dashboard.png" alt="" />
        </p>
        </li>
    </ul>
    <h3><strong>3.&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>Quản lý</strong></h3>
    <p>Chọn: &nbsp;Quản lý &gt; Bài viết.</p>
    <p>
        <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/nv-dashboard-menu.png" alt="" />
    </p>
    <p><strong>3.1. Quản lý bài viết</strong></p>
    <p>3.1.1. Hiển thị danh sách các bài viết được tạo</p>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;Hiển thị danh sách các bài viết được tạo, sắp xếp theo thứ tự giảm dần theo thời gian tạo bài viết.</li>
        <li>-&nbsp;&nbsp;&nbsp;Trạng thái của bài viết đó: Chờ duyệt/ sơ duyệt/ được duyệt.</li>
        <li>-&nbsp;&nbsp;&nbsp;Thời gian của bài viết được tạo.</li>
        <li>-&nbsp;&nbsp;&nbsp;Người biên tập, thuộc chuyên mục và tiêu đề của bài viết.
        <p>
            <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/nv-ql-bai-viet.png" alt="" />
        </p>
        </li>
    </ul>
    <p>3.1.2. Thêm mới bài viết</p>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;Trên giao diện danh sách bài viết, người dùng chọn &ldquo;<strong>Thêm</strong>&rdquo; để tạo mới bài viết.</li>
        <p>
            <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/nv-ql-bai-viet-them-moi.png" alt="" />
        </p>
        <li>-&nbsp;&nbsp;&nbsp;Giao diện tạo mới bài viết.</li>
        <li>-&nbsp;&nbsp;&nbsp;Trên giao diện này, cho phép người dùng nhập tin tức.
        <p>
            <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/nv-ql-bai-viet-them-moi-gui.png" alt="" />
        </p>
        </li>
    </ul>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;<strong>Tiêu đề</strong> là tiêu đề bài viết, có giới hạn ký tự, không nhập ký tự đặc biệt. Giới hạn (...) ký tự nhập.</li>
        <li>-&nbsp;&nbsp;&nbsp;<strong>Mược</strong>: Không được chứa ký tự đặc biệt, trường này có thể để trống, không bắt buộc nhập.</li>
        <li>-&nbsp;&nbsp;&nbsp;<strong>Tóm tắt</strong>: Giới hạn (...) ký tự nhập.</li>
        <li>-&nbsp;&nbsp;&nbsp;<strong>Nội dung</strong>: Cho phép nhập nội dung, chèn ảnh, định dạng văn bản,...</li>
        <li>-&nbsp;&nbsp;&nbsp;<strong>Thuộc t&iacute;nh</strong>: Chèn hình ảnh để hiện thị ra ngoài trang tin tức.</li>
        <li>-&nbsp;&nbsp;&nbsp;<strong>Chuyên mục</strong>: Trường bắt buộc, chọn chuyên mục phù hợp với nội dung của người dùng.</li>
    </ul>
    <p>-&nbsp; Sau khi nhập xong, người dùng nhấn <strong>Lưu</strong> để Lưu bài viết và giao diện + bài được viết vẫn giữ nguyên trên màn hình. <strong>Lưu và đóng</strong> để Lưu và đóng tab tạo bài viết lại. <strong>Lưu và thêm</strong> để lưu bài viết và thêm mới tab tạo bài viết. <strong>Đóng</strong> để đóng tab viết bài lại.</p>
    <p>3.1.3. Sửa bài viết</p>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;Lưu ý: chỉ chỉnh sửa được đối với bài viết đang ở trạng thái chờ duyệt, những bài viết ở trạng thái sơ duyệt/ duyệt đều không có quyền chỉnh sửa.
        <ul>
            <li>-&nbsp;&nbsp;&nbsp;Người dùng đang ở giao diện hiển thị danh sách bài viết</li>
            <li>-&nbsp;&nbsp;&nbsp;Nhấn vào icon chọn vào bài viết cần chỉnh sửa.</li>
            <li>-&nbsp;&nbsp;&nbsp;Nhấn chọn button &lsquo;Sửa&rsquo; trên thanh icon chức năng.
                <p>
                    <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/nv-ql-bai-viet-sua-1.png" alt="" />
                </p>
            </li>
        </ul>
        </li>
    </ul>
    <p>Hoặc nhấn trực tiếp vào tên bài viết</p>
    <p>
        <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/nv-ql-bai-viet-sua-2.png" alt="" />
    </p>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;Người dùng sửa trực tiếp trên bài viết, sau đó nhấn Lưu/Lưu và đóng/ Lưu và Thêm để lưu lại phần chỉnh sửa.
        <p>
            <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/nv-ql-bai-viet-sua-gui.png" alt="" />
        </p>
        </li>
        <li>-&nbsp;&nbsp;&nbsp;Sau khi chỉnh sửa và nhấn lưu, hiển thị giao diện</li>
        <li>-&nbsp;&nbsp;&nbsp;Khi được tạo xong, bài viết hiển thị sang trạng thái &lsquo;Chờ duyệt&rsquo; và đợi người dùng cấp trưởng phòng vào sơ duyệt.
         <p>
             <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/nv-ql-bai-viet-sua-success.png" alt="" />
         </p>
        </li>
    </ul>
    <h2><strong>B. Người dùng cấp Trưởng Phòng.</strong></h2>
    <h3><strong>1. Đăng nhập hệ thống</strong></h3>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;Người dùng điền tên đăng nhập vào ô <strong>Tên đăng nhập</strong>, và mật khẩu vào ô <strong>Mật khẩu</strong>, sau đó chọn ngôn ngữ muốn sử dụng rồi nhấn vào&nbsp;<strong>Đăng Nhập</strong> để đăng nhập vào hệ thống.</li>
        <li>-&nbsp;&nbsp;&nbsp;Tên Đăng Nhập là: truongphong; Mật khẩu là: 123456
        <p>
            <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/tp-dang-nhap.png" alt="" />
        </p>
        </li>
        <li>-&nbsp;&nbsp;&nbsp;Giao diện hiển thị khi đăng nhập không thành công.
        <p>
            <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/tp-dang-nhap-failed.png" alt="" />
        </p>
        </li>
    </ul>
    <h3><strong>2. Home</strong></h3>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;Khi đăng nhập thành công, hệ thống đưa người dùng tới giao diện Home
          <p>
              <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/tp-dashboard.png" alt="" />
          </p>
        </li>
    </ul>
    <h3><strong>3. Quản lý</strong></h3>
    <p>Chọn Quản lý &gt; Bài viết.</p>
    <p>
        <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/tp-dashboard-menu.png" alt="" />
    </p>

    <p>3.1. Quản lý bài viết</p>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp; Hiển thị danh sách bài viết của người dùng cấp nhân viên được tạo theo các trạng thái: chờ duyệt, sơ duyệt. được duyệt.
        <p>
            <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/tp-ql-bai-viet.png" alt="" />
        </p>
        </li>
        <li>-&nbsp;&nbsp;&nbsp;Nhấn vào tiêu đề bài viết để xem chi tiết bài viết của người dùng cấp nhân viên tạo.
        <p>
            <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/tp-ql-bai-viet-sua-1.png" alt="" />
        </p>
        </li>
    </ul>
    <p>&nbsp;</p>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;Người dùng cấp trưởng phòng có quyền sửa và xóa bài viết.</li>
        <li>-&nbsp;&nbsp;&nbsp;Sau khi xem xong có thể nhấn Lưu/Lưu và đóng/Đóng.
        <p>
            <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/tp-ql-bai-viet-sua-gui.png" alt="" />
        </p>
        </li>
    </ul>
    <p>&nbsp;</p>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;<strong>Duyệt bài viết</strong></li>
        <li>-&nbsp;&nbsp;&nbsp;Nhấn chọn bài viết muốn duyệt.</li>
        <li>-&nbsp;&nbsp;&nbsp;Nhấn chọn button Duyệt nếu muốn duyệt bài viết đó.
        <p>
            <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/tp-ql-bai-viet-duyet.png" alt="" />
        </p>
        </li>
    </ul>
    <p>&nbsp;</p>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;<strong>Bỏ duyệt bài viết</strong></li>
        <li>-&nbsp;&nbsp;&nbsp;Nhấn chọn bài viết <strong>được sơ duyệt</strong></li>
        <li>-&nbsp;&nbsp;&nbsp;Nhấn chọn button <strong>Bỏ duyệt</strong> nếu không muốn duyệt bài viết đó nữa.
        <p>
            <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/tp-ql-bai-viet-bo-duyet.png" alt="" />
        </p>
        </li>
    </ul>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>3.1.1. Tạo mới, sửa, xóa bài viết.</p>
    <p>- Trên giao diện này, người dùng cấp trưởng phòng cũng có quyền thêm, sửa, xóa bài viết: Thao tác như đối với người dùng cấp nhân viên.</p>
    <p>&nbsp;</p>
    <h2><strong>C. Người dùng cấp Giám đốc.</strong></h2>
    <h3><strong>1. Đăng nhập hệ thống</strong></h3>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;Người dùng điền tên đăng nhập vào ô <strong>Tên đăng nhập</strong>, và mật khẩu vào ô <strong>Mật khẩu</strong>, sau đó chọn ngôn ngữ muốn sử dụng rồi nhấn vào&nbsp;<strong>Đăng Nhập</strong> để đăng nhập vào hệ thống.</li>
        <li>-&nbsp;&nbsp;&nbsp;Tên Đăng Nhập là: giamdoc; mật khẩu: 123456</li>
    </ul>
    <p>
        <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/gd-dang-nhap.png" alt="" />
    </p>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;Giao diện khi đăng nhập không thành công.</li>
    </ul>
    <p>
        <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/gd-dang-nhap-failed.png" alt="" />
    </p>
    <h3><strong>2. Home</strong></h3>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;Khi đăng nhập thành công, hệ thống đưa người dùng tới giao diện.</li>
    </ul>
    <p>
        <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/gd-dashboard.png" alt="" />
    </p>
    <h3><strong>3. Quản lý</strong></h3>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Chọn Quản lý &gt; Bài viết</p>
    <p>
        <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/gd-dashboard-menu.png" alt="" />
    </p>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;Hiển thị giao diện danh sách biết viết khi được được duyệt và bài viết được người dùng cấp trường phòng sơ duyệt.</li>
    </ul>
    <p>
        <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/gd-ql-bai-viet.png" alt="" />
    </p>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;Xem bài viết: Nhấn vào tiêu đề bài viết muốn xem.</li>
    </ul>
    <p>
        <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/gd-ql-bai-viet-sua-1.png" alt="" />
    </p>
    <p>
        <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/gd-ql-bai-viet-sua-gui.png" alt="" />
    </p>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;<strong>Duyệt bài viết</strong>
            <ul>
                <li>-&nbsp;&nbsp;&nbsp;Nhấn vào ô trống trước tiêu đề bài viết</li>
                <li>-&nbsp;&nbsp;&nbsp;Nhấn chọn icon <strong>Duyệt</strong> trên thanh icon chức năng.
                <p>
                    <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/gd-ql-bai-viet-duyet.png" alt="" />
                </p>
                </li>
            </ul>
        </li>
    </ul>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;<strong>Bỏ duyệt bài viết</strong>
            <ul>
                <li>-&nbsp;&nbsp;&nbsp;Nhấn vào ô trống trước tiêu đề bài viết được được duyệt.</li>
                <li>-&nbsp;&nbsp;&nbsp;Nhấn vào icon <strong>Bỏ Duyệt</strong> trên thanh icon chức năng.
                <p>
                    <img style="display: block; margin-top: 10px; margin-left: auto; margin-right: auto; width: 65%;" src="http://qlvb.tinhtinh.com/Data/upload/images/TaiLieuHD/gd-ql-bai-viet-bo-duyet.png" alt="" />
                </p>
                </li>
            </ul>
        </li>
    </ul>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <ul>
        <li>-&nbsp;&nbsp;&nbsp;Bài viết khi được người dùng cấp giám đốc duyệt sẽ được hiển thị lên website.</li>
    </ul>
</div>
