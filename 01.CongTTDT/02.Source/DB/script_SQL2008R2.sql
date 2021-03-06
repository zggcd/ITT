USE [nhthi5wa_qlvb]
GO
/****** Object:  Table [dbo].[CP_Access]    Script Date: 8/25/2018 9:36:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CP_Access](
	[RefID] [int] NULL,
	[RoleID] [int] NULL,
	[UserID] [int] NULL,
	[Type] [varchar](50) NULL,
	[Value] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CP_Module]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CP_Module](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Code] [varchar](50) NULL,
	[Access] [int] NULL,
	[Order] [int] NULL,
 CONSTRAINT [PK_T_ADMIN_MODULE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CP_Role]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CP_Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Code] [varchar](50) NULL,
	[Lock] [bit] NULL,
	[MenuIDs] [nvarchar](2000) NULL,
	[Order] [int] NULL,
 CONSTRAINT [PK_T_ROLE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CP_User]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CP_User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LoginName] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](100) NULL,
	[Activity] [bit] NULL,
	[CityID] [nvarchar](50) NULL,
	[Year] [int] NULL,
	[Sex] [bit] NULL,
	[Phone2] [nvarchar](50) NULL,
	[Job] [nvarchar](100) NULL,
	[Note] [nvarchar](500) NULL,
	[IsAdmin] [bit] NULL,
	[Created] [smalldatetime] NULL,
	[NgayActive] [smalldatetime] NULL,
	[IsEditor] [bit] NULL,
	[SoNgayLock] [int] NULL,
	[NgayMoLock] [smalldatetime] NULL,
	[ClientIP] [nchar](20) NULL,
	[File] [nvarchar](150) NULL,
	[NgayLock] [smalldatetime] NULL,
	[State] [int] NULL,
	[NgayReActive] [smalldatetime] NULL,
	[Note2] [nvarchar](300) NULL,
	[TempPassword] [varchar](100) NULL,
 CONSTRAINT [PK_T_USER] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CP_UserLog]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CP_UserLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[IP] [varchar](50) NULL,
	[Note] [nvarchar](100) NULL,
	[Created] [datetime] NULL,
 CONSTRAINT [PK_T_USER_LOG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CP_UserRole]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CP_UserRole](
	[UserID] [int] NULL,
	[RoleID] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mod_Adv]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_Adv](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuID] [int] NULL,
	[Name] [nvarchar](1000) NULL,
	[AdvCode] [nvarchar](1000) NULL,
	[File] [nvarchar](1000) NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[AddInTag] [nvarchar](100) NULL,
	[LinkFile] [nvarchar](1000) NULL,
	[URL] [nvarchar](1000) NULL,
	[Target] [varchar](50) NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_T_ADV] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_Album]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_Album](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [varchar](100) NULL,
	[Summary] [nvarchar](1000) NULL,
	[Content] [ntext] NULL,
	[View] [int] NULL,
	[Published] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_Album] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_AlbumDetail]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_AlbumDetail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AlbumID] [int] NULL,
	[Name] [nvarchar](500) NULL,
	[Code] [varchar](500) NULL,
	[Tags] [nvarchar](1000) NULL,
	[File] [nvarchar](500) NULL,
	[Published] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_AlbumDetail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_BaoCaoBanDauSuCo]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_BaoCaoBanDauSuCo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BaoCaoSuCoID] [int] NULL,
	[UserID] [int] NULL,
	[UserID1] [int] NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](250) NULL,
	[ToChuc_Ten] [nvarchar](250) NULL,
	[ToChuc_DiaChi] [nvarchar](250) NULL,
	[ToChuc_DienThoai] [varchar](20) NULL,
	[ToChuc_Email] [nvarchar](100) NULL,
	[NguoiLienHe_Ten] [nvarchar](250) NULL,
	[NguoiLienHe_ChucVu] [nvarchar](50) NULL,
	[NguoiLienHe_DienThoai] [varchar](20) NULL,
	[NguoiLienHe_Email] [nvarchar](100) NULL,
	[ChiTiet_TenDonVi] [nvarchar](250) NULL,
	[ChiTiet_CoQuan] [nvarchar](250) NULL,
	[ChiTiet_TenHeThong] [nvarchar](250) NULL,
	[ChiTiet_PhanLoaiID] [int] NULL,
	[ChiTiet_TenToChucCungCap] [nvarchar](250) NULL,
	[ChiTiet_TenNCC_BenNgoai] [nvarchar](250) NULL,
	[ChiTiet_TenNCC] [nvarchar](250) NULL,
	[ChiTiet_MoTa] [nvarchar](1000) NULL,
	[ChiTiet_NgayGioPhatHien] [datetime] NULL,
	[HienTrangID] [int] NULL,
	[TTThem_HeDieuHanh] [nvarchar](250) NULL,
	[TTThem_Version] [nvarchar](250) NULL,
	[TTThem_DanhSachIP] [nvarchar](250) NULL,
	[TTThem_DanhSachTenMien] [nvarchar](250) NULL,
	[TTThem_MucDichSuDung] [nvarchar](250) NULL,
	[GiuBiMat] [bit] NULL,
	[Content] [nvarchar](1000) NULL,
	[ThoiGianThucHien] [datetime] NULL,
	[Published] [datetime] NULL,
	[Published1] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_BaoCaoSuCo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_BaoCaoKetThucSuCo]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_BaoCaoKetThucSuCo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BaoCaoSuCoID] [int] NULL,
	[UserID] [int] NULL,
	[UserID1] [int] NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](250) NULL,
	[ToChuc_Ten] [nvarchar](250) NULL,
	[ToChuc_DiaChi] [nvarchar](250) NULL,
	[ToChuc_DienThoai] [varchar](20) NULL,
	[ToChuc_Email] [nvarchar](100) NULL,
	[SoKyHieu] [nvarchar](250) NULL,
	[NgayBaoCao] [datetime] NULL,
	[ChiTiet_TenDonVi] [nvarchar](250) NULL,
	[ChiTiet_CoQuan] [nvarchar](250) NULL,
	[ChiTiet_TenHeThong] [nvarchar](250) NULL,
	[ChiTiet_PhanLoaiID] [int] NULL,
	[Summary] [nvarchar](1000) NULL,
	[NgayGioPhatHien] [datetime] NULL,
	[KetQua] [nvarchar](1000) NULL,
	[Files] [nvarchar](500) NULL,
	[Published] [datetime] NULL,
	[Published1] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_BaoCaoKetThucSuCo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_BaoCaoSuCo]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_BaoCaoSuCo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[UserID1] [int] NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](250) NULL,
	[Address] [nvarchar](500) NULL,
	[Phone] [nvarchar](15) NULL,
	[Email] [nvarchar](250) NULL,
	[Published] [datetime] NULL,
	[Published1] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_BaoCaoSuCo_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_BaoCaoTongHop]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_BaoCaoTongHop](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BaoCaoSuCoID] [int] NULL,
	[UserID] [int] NULL,
	[UserID1] [int] NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](250) NULL,
	[TuNgay] [datetime] NULL,
	[DenNgay] [datetime] NULL,
	[TenToChuc] [nvarchar](250) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[MaThanhVien] [nvarchar](250) NULL,
	[DSToChucHoTro] [nvarchar](1000) NULL,
	[DSToChucNuocNgoaiHoTro] [nvarchar](1000) NULL,
	[DeXuat] [nvarchar](1000) NULL,
	[Published] [datetime] NULL,
	[Published1] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_BaoCaoTongHop] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_Comment]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_Comment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NewsID] [int] NOT NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[HoTen] [nvarchar](250) NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Code] [varchar](500) NULL,
	[Email] [nvarchar](250) NULL,
	[PhoneNum] [varchar](15) NULL,
	[Content] [ntext] NULL,
	[CreateUser] [int] NULL,
	[Published] [datetime] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_Comment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_ConfigSendMail]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_ConfigSendMail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MailType] [int] NULL,
	[SmtpUser] [varchar](150) NULL,
	[SmtpPass] [varchar](150) NULL,
	[SmtpServer] [varchar](50) NULL,
	[SmtpPort] [int] NULL,
	[SmtpSSL] [bit] NULL,
	[Name] [nvarchar](500) NULL,
	[Content] [nvarchar](max) NULL,
	[Activity] [bit] NULL,
	[ToMail] [varchar](1000) NULL,
 CONSTRAINT [PK_Mod_ConfigSendMail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_CoQuan]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mod_CoQuan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuID] [int] NULL,
	[Name] [nvarchar](150) NULL,
	[Code] [nvarchar](150) NULL,
	[Published] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_CoQuan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mod_DataBackup]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mod_DataBackup](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](250) NULL,
	[Published] [datetime] NULL,
 CONSTRAINT [PK_Mod_DataBackup] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mod_DauMoiUCSC]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_DauMoiUCSC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[HSThanhVienUCSCID] [int] NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](250) NULL,
	[ChucVu] [nvarchar](250) NULL,
	[DiaChi] [nvarchar](250) NULL,
	[DienThoai] [varchar](20) NULL,
	[DienThoaiDD] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[Published] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_DauMoiUCSC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_DichVuCanhBao]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_DichVuCanhBao](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[UserID1] [int] NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](250) NULL,
	[ToEmails] [nvarchar](1000) NULL,
	[CcEmails] [nvarchar](1000) NULL,
	[IPs] [nvarchar](1000) NULL,
	[Time] [time](7) NULL,
	[Published] [datetime] NULL,
	[Published1] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_DichVuCanhBao] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_DichVuCanhBaoIP]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mod_DichVuCanhBaoIP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DichVuCanhBaoID] [int] NULL,
	[UserID] [int] NULL,
	[UserID1] [int] NULL,
	[MenuID] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Published] [datetime] NULL,
	[Published1] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_DichVuCanhBaoIP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mod_DonDangKyUCSC]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_DonDangKyUCSC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[UserID1] [int] NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](250) NULL,
	[ToChuc_Ten] [nvarchar](250) NULL,
	[ToChuc_DiaChi] [nvarchar](250) NULL,
	[ToChuc_DienThoai] [varchar](20) NULL,
	[ToChuc_Fax] [varchar](20) NULL,
	[ToChuc_Email] [varchar](50) NULL,
	[Content] [ntext] NULL,
	[File] [nvarchar](250) NULL,
	[ThongTinLL_Web] [nvarchar](250) NULL,
	[ThongTinLL_ThuDT_Ten] [nvarchar](250) NULL,
	[ThongTinLL_ThuDT_Fingerprint] [nvarchar](250) NULL,
	[ThongTinLL_ThuDT_LinkToPublicKey] [nvarchar](250) NULL,
	[DauMoiLL_TrongGio_Ten] [nvarchar](250) NULL,
	[DauMoiLL_TrongGio_DienThoai] [varchar](20) NULL,
	[DauMoiLL_TrongGio_DienThoaiDD] [varchar](20) NULL,
	[DauMoiLL_TrongGio_Fax] [varchar](20) NULL,
	[DauMoiLL_NgoaiGio_Ten] [nvarchar](250) NULL,
	[DauMoiLL_NgoaiGio_DienThoai] [varchar](20) NULL,
	[DauMoiLL_NgoaiGio_DienThoaiDD] [varchar](20) NULL,
	[DauMoiLL_NgoaiGio_Fax] [varchar](20) NULL,
	[DauMoiLanhDao_Ten] [nvarchar](250) NULL,
	[DauMoiLanhDao_DienThoai] [varchar](20) NULL,
	[DauMoiLanhDao_DienThoaiDD] [varchar](20) NULL,
	[DCNhanThu_TenBoPhan] [nvarchar](250) NULL,
	[DCNhanThu_ViTri] [nvarchar](250) NULL,
	[DCNhanThu_TenToChuc] [nvarchar](250) NULL,
	[DCNhanThu_DiaChi] [nvarchar](250) NULL,
	[DCNhanThu_DienThoai] [varchar](20) NULL,
	[LLKhac_Yahoo] [nvarchar](150) NULL,
	[LLKhac_Skype] [nvarchar](150) NULL,
	[LLKhac_GoogleTalk] [nvarchar](150) NULL,
	[LLKhac_Hotmail] [nvarchar](150) NULL,
	[LLKhac_Khac] [nvarchar](150) NULL,
	[Published] [datetime] NULL,
	[Published1] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
	[ParentID] [int] NULL,
	[IsGOV] [bit] NULL,
	[IPs] [ntext] NULL,
 CONSTRAINT [PK_Mod_DonDangKyUCSC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_DuThao]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mod_DuThao](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [nvarchar](255) NULL,
	[Content] [ntext] NULL,
	[File] [nvarchar](255) NULL,
	[StartDate] [datetime] NULL,
	[FinishDate] [datetime] NULL,
	[Published] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_DuThao] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mod_EmailTemplate]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_EmailTemplate](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [varchar](100) NULL,
	[Subject] [nvarchar](500) NULL,
	[Content] [ntext] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_EmailTemplate] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_Feedback]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_Feedback](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Title] [nvarchar](100) NULL,
	[Content] [ntext] NULL,
	[IP] [varchar](50) NULL,
	[Created] [datetime] NULL,
 CONSTRAINT [PK_T_FEEDBACK] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_GopY]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_GopY](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DuThaoID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Address] [nvarchar](100) NULL,
	[Phone] [varchar](50) NULL,
	[Mobile] [varchar](50) NULL,
	[Email] [varchar](100) NULL,
	[Title] [nvarchar](255) NULL,
	[Content] [ntext] NULL,
	[Files] [nvarchar](255) NULL,
	[IP] [varchar](50) NULL,
	[Published] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_GopY] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_HeThongThongTin]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_HeThongThongTin](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DauMoiUCSCID] [int] NULL,
	[DonDangKyUCSCID] [int] NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](250) NULL,
	[Published] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_HeThongThongTin] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_HSThanhVienUCSC]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_HSThanhVienUCSC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[UserID1] [int] NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](250) NULL,
	[ToChuc_Ten] [nvarchar](250) NULL,
	[ToChuc_TenCoQuan] [nvarchar](250) NULL,
	[ToChuc_DiaChi] [nvarchar](250) NULL,
	[ToChuc_DienThoai] [varchar](20) NULL,
	[ToChuc_Fax] [varchar](20) NULL,
	[ToChuc_Email] [varchar](50) NULL,
	[ToChuc_Web] [varchar](50) NULL,
	[ToChuc_LanhDao] [nvarchar](250) NULL,
	[ToChuc_ChucVu] [nvarchar](50) NULL,
	[TTTN_DiaChi] [nvarchar](250) NULL,
	[TTTN_DienThoai] [varchar](20) NULL,
	[TTTN_DienThoaiDD] [varchar](20) NULL,
	[TTTN_Fax] [varchar](20) NULL,
	[TTTN_Email] [varchar](50) NULL,
	[Content] [ntext] NULL,
	[File] [nvarchar](250) NULL,
	[Published] [datetime] NULL,
	[Published1] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_HSTVUCSC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_Incident]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_Incident](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ParentID] [int] NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [varchar](100) NULL,
	[Path] [nvarchar](1000) NULL,
	[FakeDestination] [nvarchar](200) NULL,
	[Source] [nvarchar](200) NULL,
	[AttackOn] [datetime] NULL,
	[IP] [nvarchar](20) NULL,
	[ISP] [nvarchar](200) NULL,
	[EmailNo] [int] NULL,
	[Attacker] [nvarchar](200) NULL,
	[MalwareName] [nvarchar](200) NULL,
	[AttackerIP] [nvarchar](1000) NULL,
	[NetworkName] [nvarchar](200) NULL,
	[LocalIP] [nvarchar](20) NULL,
	[LocalTCPPort] [int] NULL,
	[Timestamp] [datetime] NULL,
	[ASN] [nvarchar](50) NULL,
	[Geo] [nvarchar](20) NULL,
	[Url] [nvarchar](1000) NULL,
	[Type] [int] NULL,
	[HttpAgent] [nvarchar](100) NULL,
	[SrcPort] [int] NULL,
	[HostName] [nvarchar](100) NULL,
	[Destinationport] [int] NULL,
	[Protocol] [int] NULL,
	[ServerName] [nvarchar](50) NULL,
	[Server] [nvarchar](50) NULL,
	[Header] [nvarchar](50) NULL,
	[Tag] [nvarchar](20) NULL,
	[Region] [nvarchar](20) NULL,
	[City] [nvarchar](20) NULL,
	[Sector] [nvarchar](20) NULL,
	[Published] [datetime] NULL,
	[Order] [int] NULL,
	[Resolve] [bit] NULL,
	[Activity] [bit] NULL,
	[ChildNum] [int] NULL,
 CONSTRAINT [PK_Mod_Incident] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_InfoMagic]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_InfoMagic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BaoCaoBanDauSuCoID] [int] NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](250) NULL,
	[Published] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_CachThucPhatHien] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_ISP]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_ISP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [varchar](100) NULL,
	[Email] [nvarchar](250) NULL,
	[Updated] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_ISP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_News]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_News](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [varchar](100) NULL,
	[Tags] [nvarchar](1000) NULL,
	[Summary] [nvarchar](1000) NULL,
	[Content] [ntext] NULL,
	[Content1] [ntext] NULL,
	[Content2] [ntext] NULL,
	[Content3] [ntext] NULL,
	[Custom] [nvarchar](1000) NULL,
	[File] [nvarchar](100) NULL,
	[Audio] [nvarchar](250) NULL,
	[View] [int] NULL,
	[CreateUser] [int] NULL,
	[Published] [datetime] NULL,
	[UpdateUser] [int] NULL,
	[Order] [int] NULL,
	[Updated] [datetime] NULL,
	[Activity1] [bit] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_T_NEWS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_NewsTag]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mod_NewsTag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NewsID] [int] NULL,
	[TagID] [int] NULL,
 CONSTRAINT [PK_Mod_NewsTag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mod_NhanLucUCSC]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mod_NhanLucUCSC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DonDangKyUCSCID] [int] NULL,
	[HSThanhVienUCSCID] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[School] [nvarchar](250) NULL,
	[MenuIDs_LinhVucDT] [nvarchar](250) NULL,
	[MenuIDs_TrinhDoDT] [nvarchar](250) NULL,
	[MenuIDs_ChungChi] [nvarchar](250) NULL,
	[MenuIDs_QuanLyATTT] [nvarchar](250) NULL,
	[MenuIDs_KyThuatPhongThu] [nvarchar](250) NULL,
	[MenuIDs_KyThuatBaoVe] [nvarchar](250) NULL,
	[MenuIDs_KyThuatKiemTra] [nvarchar](250) NULL,
	[ThangTotNghiep] [int] NULL,
	[NamTotNghiep] [int] NULL,
	[Published] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_NhanLucUCSC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mod_NhomThanhVien]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mod_NhomThanhVien](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[Code] [nvarchar](150) NULL,
	[Published] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_NhomThanhVien] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mod_Online]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_Online](
	[SessionID] [varchar](50) NULL,
	[TimeValue] [bigint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_RSS]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_RSS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NULL,
	[Code] [nvarchar](1000) NOT NULL,
	[Url] [nvarchar](1000) NULL,
	[Nguon] [varchar](500) NULL,
	[Summary] [nvarchar](max) NULL,
	[Content] [nvarchar](max) NULL,
	[State] [int] NULL,
	[MenuID] [int] NULL,
	[View] [int] NULL,
	[File] [nvarchar](1000) NULL,
	[Published] [datetime] NULL,
	[NgayLayTin] [datetime] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_RSS] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_SoLuongSuCo]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_SoLuongSuCo](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[UserID1] [int] NULL,
	[BaoCaoTongHopID] [int] NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [varchar](250) NULL,
	[SoLuong] [int] NULL,
	[TuXuLy] [int] NULL,
	[ToChucHoTro] [int] NULL,
	[ToChucNuocNgoaiHoTro] [int] NULL,
	[DeNghi] [int] NULL,
	[ThietHaiUocTinh] [int] NULL,
	[Published] [datetime] NULL,
	[Published1] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_SoLuongSuCo] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_Tag]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_Tag](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Code] [varchar](255) NULL,
	[Title] [nvarchar](255) NULL,
	[Keywords] [nvarchar](1000) NULL,
	[Description] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Mod_Tag] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_User]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mod_User](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Code] [nvarchar](50) NULL,
	[MenuID] [int] NULL,
	[CoQuanID] [int] NULL,
	[Address] [nvarchar](200) NULL,
	[Phone] [nvarchar](50) NULL,
	[Email] [nvarchar](200) NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mod_UserResetPass]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Mod_UserResetPass](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[LoginName] [nvarchar](250) NULL,
	[Email] [nvarchar](150) NULL,
	[Phone] [varchar](15) NULL,
	[TimeReset] [datetime] NULL,
	[PassReset] [varchar](10) NULL,
	[StateSend] [bit] NULL,
 CONSTRAINT [PK_Mod_UserResetPass] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Mod_VanBan]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mod_VanBan](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuID] [int] NULL,
	[MenuIDs] [nvarchar](50) NULL,
	[MenuID1] [int] NULL,
	[MenuID2] [int] NULL,
	[UserIDs] [nvarchar](50) NULL,
	[Name] [nvarchar](200) NULL,
	[Code] [nvarchar](200) NULL,
	[Custom] [nvarchar](1000) NULL,
	[Summary] [nvarchar](1000) NULL,
	[Content] [ntext] NULL,
	[NgayBanHanh] [datetime] NULL,
	[NgayCoHieuLuc] [datetime] NULL,
	[NgayHetHieuLuc] [datetime] NULL,
	[File] [nvarchar](150) NULL,
	[File1] [nvarchar](150) NULL,
	[File2] [nvarchar](150) NULL,
	[File3] [nvarchar](150) NULL,
	[Urls] [ntext] NULL,
	[GhiChu] [nvarchar](1000) NULL,
	[Published] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_VanBan] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Mod_Video]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mod_Video](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[MenuID] [int] NULL,
	[State] [int] NULL,
	[Name] [nvarchar](250) NULL,
	[Code] [nvarchar](250) NULL,
	[Summary] [nvarchar](1000) NULL,
	[Content] [ntext] NULL,
	[File] [nvarchar](250) NULL,
	[File1] [nvarchar](250) NULL,
	[Time] [nvarchar](50) NULL,
	[View] [int] NULL,
	[Published] [datetime] NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_Mod_Video] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Sys_Lang]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Lang](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Code] [varchar](50) NULL,
 CONSTRAINT [PK_T_LANG] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_Module]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Module](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Code] [varchar](50) NULL,
	[Layout] [varchar](255) NULL,
	[Type] [varchar](50) NULL,
	[TypeName] [varchar](50) NULL,
	[AssemblyName] [varchar](100) NULL,
	[Order] [int] NULL,
 CONSTRAINT [PK_T_CONTROL] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_Page]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Page](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[TemplateID] [int] NULL,
	[ModuleID] [int] NULL,
	[LangID] [int] NULL,
	[MenuID] [int] NULL,
	[ParentID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [varchar](100) NULL,
	[Custom] [ntext] NULL,
	[HtmlIcon] [nvarchar](500) NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
 CONSTRAINT [PK_T_PAGE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_Site]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Site](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PageID] [int] NULL,
	[LangID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[Code] [varchar](50) NULL,
	[Custom] [nvarchar](1000) NULL,
	[Default] [bit] NULL,
	[Order] [int] NULL,
 CONSTRAINT [PK_T_APP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Sys_Template]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sys_Template](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LangID] [int] NULL,
	[Name] [nvarchar](50) NULL,
	[File] [varchar](50) NULL,
	[Custom] [ntext] NULL,
	[Order] [int] NULL,
 CONSTRAINT [PK_T_TEMPLATE] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Web_Menu]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Web_Menu](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LangID] [int] NULL,
	[ParentID] [int] NULL,
	[Name] [nvarchar](100) NULL,
	[Code] [varchar](100) NULL,
	[Type] [varchar](50) NULL,
	[IsAddText] [bit] NULL,
	[Custom] [nvarchar](1000) NULL,
	[Order] [int] NULL,
	[Activity] [bit] NULL,
	[SourceID] [int] NULL,
	[RSS] [nvarchar](3000) NULL,
 CONSTRAINT [PK_T_MENU] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Web_Resource]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Web_Resource](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LangID] [int] NOT NULL,
	[Code] [varchar](50) NOT NULL,
	[Value] [ntext] NULL,
 CONSTRAINT [PK_Web_Resource] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Web_Setting]    Script Date: 8/25/2018 9:36:52 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Web_Setting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Code] [varchar](50) NULL,
	[Value] [nvarchar](50) NULL,
 CONSTRAINT [PK_Web_Setting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (1, 1, 0, N'CP.MODULE', 1)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (2, 1, 0, N'CP.MODULE', 15)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (4, 1, 0, N'CP.MODULE', 9)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (5, 1, 0, N'CP.MODULE', 63)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (6, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (7, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (8, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (9, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (10, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (11, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (12, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (13, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (14, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (15, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (16, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (17, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (18, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (19, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (20, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (21, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (22, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (23, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (24, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (25, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (26, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (27, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (3, 1, 0, N'CP.MODULE', 31)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (4, 4, 0, N'CP.MODULE', 1)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (5, 4, 0, N'CP.MODULE', 21)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (2, 2, 0, N'CP.MODULE', 3)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (3, 2, 0, N'CP.MODULE', 15)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (5, 2, 0, N'CP.MODULE', 47)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (2, 3, 0, N'CP.MODULE', 3)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (3, 3, 0, N'CP.MODULE', 15)
GO
INSERT [dbo].[CP_Access] ([RefID], [RoleID], [UserID], [Type], [Value]) VALUES (5, 3, 0, N'CP.MODULE', 15)
GO
SET IDENTITY_INSERT [dbo].[CP_Module] ON 

GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (1, N'QUẢN TRỊ HỆ THỐNG', N'SysAdministrator', 1, 1)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (2, N'Quản lý  -  File tải lên', N'ModFile', 15, 2)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (3, N'Quản lý  - Quảng cáo/Liên kết', N'ModAdv', 31, 3)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (4, N'Quản lý  - Liên hệ', N'ModFeedback', 9, 4)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (5, N'Quản lý  - Bài viết', N'ModNews', 63, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (6, N'Quản lý  - Tags', N'ModTag', 31, 6)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (7, N'Quản lý  - Dự thảo', N'ModDuThao', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (8, N'Quản lý  - Góp ý', N'ModGopY', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (9, N'Quản lý  - Văn bản', N'ModVanBan', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (10, N'Quản lý  - Cán bộ', N'ModUser', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (11, N'Quản lý  - Tin Video', N'ModVideo', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (12, N'Quản lý - Cấu hình Email', N'ModConfigSendMail', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (13, N'Quản lý  - Tin Ảnh', N'ModAlbum', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (14, N'Hồ sơ thành viên UCSC', N'ModHSThanhVienUCSC', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (15, N'Đăng ký tham gia mạng lưới UCSC', N'ModDonDangKyUCSC', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (16, N'Báo cáo ban đầu sự cố mạng', N'ModBaoCaoBanDauSuCo', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (17, N'Báo cáo kết thúc sự cố mạng', N'ModBaoCaoKetThucSuCo', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (18, N'Báo cáo tổng hợp', N'ModBaoCaoTongHop', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (19, N'RSS', N'ModRSS', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (20, N'Backup & Restore', N'ModDataBackup', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (21, N'Quản lý - Sự cố', N'ModIncident', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (22, N'Quản lý - Báo cáo thống kê', N'ModBaoCaoTK', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (23, N'Quản lý - Mẫu Email', N'ModEmailTemplate', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (24, N'Quản lý - ISP', N'ModISP', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (25, N'Quản lý - Báo cáo sự cố', N'ModBaoCaoSuCo', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (26, N'Quản lý - Dịch vụ cảnh báo', N'ModDichVuCanhBao', 31, 5)
GO
INSERT [dbo].[CP_Module] ([ID], [Name], [Code], [Access], [Order]) VALUES (27, N'Quản lý - Bình luận', N'ModComment', 31, 5)
GO
SET IDENTITY_INSERT [dbo].[CP_Module] OFF
GO
SET IDENTITY_INSERT [dbo].[CP_Role] ON 

GO
INSERT [dbo].[CP_Role] ([ID], [Name], [Code], [Lock], [MenuIDs], [Order]) VALUES (1, N'Administrator', N'Admin', 1, N'1,60,61,70,71,72,73,74,75,76,77,87,62,63,246', 1)
GO
INSERT [dbo].[CP_Role] ([ID], [Name], [Code], [Lock], [MenuIDs], [Order]) VALUES (2, N'Trưởng phòng', N'TP', 1, N'1,60,61,70,71,72,73,74,75,76,77,87,62,63,246', 3)
GO
INSERT [dbo].[CP_Role] ([ID], [Name], [Code], [Lock], [MenuIDs], [Order]) VALUES (3, N'Nhân viên', N'NV', 0, N'1,60,61,70,71,72,73,74,75,76,77,87,62,63,246', 4)
GO
INSERT [dbo].[CP_Role] ([ID], [Name], [Code], [Lock], [MenuIDs], [Order]) VALUES (4, N'Giám đốc', N'GD', 0, N'1,60,61,70,71,72,73,74,75,76,77,87,62,63,246', 2)
GO
INSERT [dbo].[CP_Role] ([ID], [Name], [Code], [Lock], [MenuIDs], [Order]) VALUES (5, N'Thành viên', N'TV', 0, NULL, 5)
GO
SET IDENTITY_INSERT [dbo].[CP_Role] OFF
GO
SET IDENTITY_INSERT [dbo].[CP_User] ON 

GO
INSERT [dbo].[CP_User] ([ID], [LoginName], [Password], [Name], [Address], [Phone], [Email], [Activity], [CityID], [Year], [Sex], [Phone2], [Job], [Note], [IsAdmin], [Created], [NgayActive], [IsEditor], [SoNgayLock], [NgayMoLock], [ClientIP], [File], [NgayLock], [State], [NgayReActive], [Note2], [TempPassword]) VALUES (1, N'admin', N'E10ADC3949BA59ABBE56E057F20F883E', N'Lê Hoàng Anh', N'Ninh Giang, Hải Dương', N'0949069822', N'lehoanganhhd@gmail.com', 1, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'~/Data/upload/images/User/lehoanganhhd_gmail.com255902651312380492240872445202007o.jpg', NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[CP_User] ([ID], [LoginName], [Password], [Name], [Address], [Phone], [Email], [Activity], [CityID], [Year], [Sex], [Phone2], [Job], [Note], [IsAdmin], [Created], [NgayActive], [IsEditor], [SoNgayLock], [NgayMoLock], [ClientIP], [File], [NgayLock], [State], [NgayReActive], [Note2], [TempPassword]) VALUES (2, N'anhlh', N'E10ADC3949BA59ABBE56E057F20F883E', N'Lê Hoàng Anh', NULL, N'01663765886', N'nguoinhapcuoc_1987@yahoo.com.vn', 1, NULL, 0, 0, NULL, NULL, NULL, 0, CAST(N'2017-11-04 23:43:00' AS SmallDateTime), CAST(N'2017-11-04 23:43:00' AS SmallDateTime), 0, 0, NULL, N'::1                 ', N'~/Data/upload/images/User/nguoinhapcuoc_1987_yahoo.com.vnlove.png', NULL, 0, NULL, NULL, N'')
GO
INSERT [dbo].[CP_User] ([ID], [LoginName], [Password], [Name], [Address], [Phone], [Email], [Activity], [CityID], [Year], [Sex], [Phone2], [Job], [Note], [IsAdmin], [Created], [NgayActive], [IsEditor], [SoNgayLock], [NgayMoLock], [ClientIP], [File], [NgayLock], [State], [NgayReActive], [Note2], [TempPassword]) VALUES (5, N'truongphong', N'E10ADC3949BA59ABBE56E057F20F883E', N'Nguyễn Quang Tùng', N'', N'', N'', 1, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CP_User] ([ID], [LoginName], [Password], [Name], [Address], [Phone], [Email], [Activity], [CityID], [Year], [Sex], [Phone2], [Job], [Note], [IsAdmin], [Created], [NgayActive], [IsEditor], [SoNgayLock], [NgayMoLock], [ClientIP], [File], [NgayLock], [State], [NgayReActive], [Note2], [TempPassword]) VALUES (6, N'nhanvien', N'E10ADC3949BA59ABBE56E057F20F883E', N'Phạm Quang Trung', N'', N'', N'', 1, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CP_User] ([ID], [LoginName], [Password], [Name], [Address], [Phone], [Email], [Activity], [CityID], [Year], [Sex], [Phone2], [Job], [Note], [IsAdmin], [Created], [NgayActive], [IsEditor], [SoNgayLock], [NgayMoLock], [ClientIP], [File], [NgayLock], [State], [NgayReActive], [Note2], [TempPassword]) VALUES (7, N'giamdoc', N'E10ADC3949BA59ABBE56E057F20F883E', N'Nguyễn Quang Tú', N'', N'', N'', 1, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CP_User] ([ID], [LoginName], [Password], [Name], [Address], [Phone], [Email], [Activity], [CityID], [Year], [Sex], [Phone2], [Job], [Note], [IsAdmin], [Created], [NgayActive], [IsEditor], [SoNgayLock], [NgayMoLock], [ClientIP], [File], [NgayLock], [State], [NgayReActive], [Note2], [TempPassword]) VALUES (17, N'test', N'E10ADC3949BA59ABBE56E057F20F883E', NULL, NULL, NULL, NULL, 1, NULL, 0, 0, NULL, NULL, NULL, 0, CAST(N'2018-08-18 16:15:00' AS SmallDateTime), CAST(N'2018-08-18 16:15:00' AS SmallDateTime), 0, 0, NULL, N'::1                 ', NULL, NULL, 0, NULL, NULL, NULL)
GO
INSERT [dbo].[CP_User] ([ID], [LoginName], [Password], [Name], [Address], [Phone], [Email], [Activity], [CityID], [Year], [Sex], [Phone2], [Job], [Note], [IsAdmin], [Created], [NgayActive], [IsEditor], [SoNgayLock], [NgayMoLock], [ClientIP], [File], [NgayLock], [State], [NgayReActive], [Note2], [TempPassword]) VALUES (18, N'duyetbai', N'E10ADC3949BA59ABBE56E057F20F883E', N'', N'', N'', N'', 1, NULL, 0, 0, NULL, NULL, NULL, 0, NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[CP_User] OFF
GO
SET IDENTITY_INSERT [dbo].[CP_UserLog] ON 

GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-06-25 09:39:42.670' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-06-25 11:21:32.917' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (3, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-06-25 15:35:38.320' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (4, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-07-05 15:29:00.590' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (5, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-07-06 10:50:26.120' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (6, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-07-06 22:25:30.553' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (7, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-07-07 23:21:04.277' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (8, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-07-10 21:27:31.523' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (9, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-07-15 00:40:18.477' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (10, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-08-19 19:57:26.533' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (11, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-08-22 22:20:33.140' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (12, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-08-23 23:00:42.757' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (13, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-08-24 19:36:48.210' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (14, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-08-25 08:17:21.273' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (15, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-08-25 14:13:23.227' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (16, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-08-25 22:39:51.393' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (17, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-08-26 21:52:39.543' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (18, -1, N'::1', N'Tên đăng nhập '''' không thành công.', CAST(N'2017-08-27 08:40:26.740' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (19, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-08-27 08:40:29.110' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (20, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-08-27 15:55:22.530' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (21, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-08-27 21:25:10.887' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (22, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-09-24 08:35:42.333' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (23, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-09-24 15:04:50.710' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (24, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-09-29 19:46:38.547' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (25, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-09-30 15:06:24.083' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (26, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-10-01 08:38:39.440' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (27, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-10-01 14:33:52.550' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (28, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-10-01 19:08:41.977' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (29, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-10-07 16:41:08.453' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (30, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-10-08 08:20:49.717' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (31, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-10-08 15:12:40.083' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (32, 1, N'123.17.142.83', N'Đăng nhập hệ thống.', CAST(N'2017-10-15 16:00:00.077' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (33, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2017-10-15 16:21:00.957' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (34, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-10-15 19:58:36.800' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (35, -1, N'27.72.28.157', N'Tên đăng nhập ''admin'' không thành công.', CAST(N'2017-10-16 09:58:10.017' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (36, -1, N'27.72.28.157', N'Tên đăng nhập ''ttv'' không thành công.', CAST(N'2017-10-16 10:00:41.573' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (37, -1, N'27.72.28.157', N'Tên đăng nhập ''ttv'' không thành công.', CAST(N'2017-10-16 10:00:58.290' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (38, -1, N'27.72.28.157', N'Tên đăng nhập ''ttv'' không thành công.', CAST(N'2017-10-16 10:01:28.157' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (39, -1, N'27.72.28.157', N'Tên đăng nhập ''ttv'' không thành công.', CAST(N'2017-10-16 10:02:36.233' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (40, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2017-10-16 10:02:40.817' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (41, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2017-10-16 10:02:52.347' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (42, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2017-10-16 10:03:16.347' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (43, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2017-10-16 10:20:54.077' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (44, 1, N'14.177.246.106', N'Đăng nhập hệ thống.', CAST(N'2017-10-18 09:14:57.630' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (45, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-10-18 09:16:00.470' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (46, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-10-22 08:32:30.610' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (47, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-10-22 15:02:42.913' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (48, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-10-22 18:31:09.143' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (49, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-10-23 00:01:56.980' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (50, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-11-01 22:19:07.780' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (51, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-11-04 00:09:58.243' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (52, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-11-04 15:36:09.537' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (53, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-11-04 18:15:48.397' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (54, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-11-04 21:07:08.007' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (55, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-11-05 08:35:24.813' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (56, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-11-05 09:38:30.060' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (57, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-11-05 15:20:51.027' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (58, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2017-11-05 18:45:46.030' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (59, 1, N'123.16.229.234', N'Đăng nhập hệ thống.', CAST(N'2017-11-06 13:32:05.910' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (60, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2017-11-22 09:47:21.537' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (61, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2017-11-22 09:47:56.700' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (62, 1, N'14.162.159.220', N'Đăng nhập hệ thống.', CAST(N'2017-11-22 11:02:14.747' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (63, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2017-11-23 08:40:54.830' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (64, 1, N'14.162.159.220', N'Đăng nhập hệ thống.', CAST(N'2017-11-30 09:12:22.497' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (65, -1, N'27.72.28.157', N'Tên đăng nhập ''admin'' không thành công.', CAST(N'2017-11-30 09:22:26.530' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (66, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2017-11-30 09:22:48.717' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (67, -1, N'14.231.236.77', N'Tên đăng nhập ''admin'' không thành công.', CAST(N'2017-12-22 09:39:46.053' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (68, 1, N'14.231.236.77', N'Đăng nhập hệ thống.', CAST(N'2017-12-22 10:57:48.583' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (69, 1, N'58.187.70.23', N'Đăng nhập hệ thống.', CAST(N'2018-01-31 07:06:53.647' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (70, 1, N'14.232.224.5', N'Đăng nhập hệ thống.', CAST(N'2018-02-28 13:09:29.507' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (71, 1, N'14.232.224.5', N'Đăng nhập hệ thống.', CAST(N'2018-02-28 13:52:46.043' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (72, -1, N'118.70.146.246', N'Tên đăng nhập ''trunglq'' không thành công.', CAST(N'2018-03-05 17:17:23.723' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (73, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-03-13 17:51:37.113' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (74, 1, N'101.99.12.203', N'Đăng nhập hệ thống.', CAST(N'2018-03-15 11:58:03.080' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (75, 1, N'183.80.184.64', N'Đăng nhập hệ thống.', CAST(N'2018-03-27 00:37:32.537' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (76, -1, N'222.252.126.47', N'Tên đăng nhập ''admin'' không thành công.', CAST(N'2018-04-03 09:46:08.577' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (77, 1, N'222.252.126.47', N'Đăng nhập hệ thống.', CAST(N'2018-04-03 09:46:13.687' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (78, 1, N'42.115.242.162', N'Đăng nhập hệ thống.', CAST(N'2018-04-04 22:51:23.787' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (79, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-04-09 14:39:03.657' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (80, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-04-09 14:54:07.957' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (81, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-04-10 11:36:13.330' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (82, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-04-10 17:05:43.780' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (83, 1, N'45.122.232.104', N'Đăng nhập hệ thống.', CAST(N'2018-04-10 18:02:41.110' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (84, 1, N'45.122.232.104', N'Đăng nhập hệ thống.', CAST(N'2018-04-10 20:17:46.860' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (85, 1, N'27.67.218.0', N'Đăng nhập hệ thống.', CAST(N'2018-04-13 09:01:31.330' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (86, 1, N'14.162.11.35', N'Đăng nhập hệ thống.', CAST(N'2018-04-15 09:37:01.793' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (87, 1, N'123.24.237.251', N'Đăng nhập hệ thống.', CAST(N'2018-06-12 23:44:05.363' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (88, 1, N'210.245.53.9', N'Đăng nhập hệ thống.', CAST(N'2018-06-13 08:19:53.213' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (89, 1, N'1.55.242.165', N'Đăng nhập hệ thống.', CAST(N'2018-06-13 08:19:58.857' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (90, 1, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-06-13 08:20:37.180' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (91, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-06-19 10:46:44.483' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (92, 1, N'58.187.199.54', N'Đăng nhập hệ thống.', CAST(N'2018-07-09 00:59:58.187' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (93, 1, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-09 11:40:46.157' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (94, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-09 13:38:29.733' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (95, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-09 15:50:19.533' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (96, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-10 08:27:21.113' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (97, 1, N'118.71.244.75', N'Đăng nhập hệ thống.', CAST(N'2018-07-10 23:22:27.937' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (98, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-11 09:55:24.803' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (99, 1, N'113.22.7.80', N'Đăng nhập hệ thống.', CAST(N'2018-07-14 00:12:33.410' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (100, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-14 09:04:52.640' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (101, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-14 10:49:56.170' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (102, 4, N'101.96.121.196', N'Thoát khỏi hệ thống.', CAST(N'2018-07-17 15:39:07.500' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (103, 1, N'101.96.121.196', N'Đăng nhập hệ thống.', CAST(N'2018-07-17 15:39:14.070' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (104, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-19 16:48:55.227' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (105, -1, N'::1', N'Tên đăng nhập ''anhlh2'' không thành công.', CAST(N'2018-07-22 16:39:41.433' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (106, -1, N'::1', N'Tên đăng nhập ''test2'' không thành công.', CAST(N'2018-07-22 16:44:29.690' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (107, -1, N'::1', N'Tên đăng nhập ''test2'' không thành công.', CAST(N'2018-07-22 16:44:37.270' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (108, -1, N'::1', N'Tên đăng nhập ''test2'' không thành công.', CAST(N'2018-07-22 16:44:54.530' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (109, 5, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-22 16:45:14.780' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (110, 5, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-07-22 16:48:02.663' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (111, 6, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-22 16:48:07.970' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (112, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-22 21:03:39.020' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (113, 1, N'118.71.7.4', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 06:58:10.520' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (114, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:27:35.440' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (115, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 08:32:20.653' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (116, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:32:32.093' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (117, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 08:35:42.753' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (118, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:35:50.247' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (119, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 08:36:03.253' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (120, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:36:04.953' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (121, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 08:37:24.620' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (122, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:37:30.723' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (123, 1, N'210.245.53.9', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:40:54.427' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (124, 1, N'210.245.53.9', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:41:05.743' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (125, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:41:37.227' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (126, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 08:41:38.093' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (127, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:41:44.270' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (128, 1, N'1.55.242.165', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:41:47.420' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (129, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:41:59.823' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (130, 1, N'1.55.242.165', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:42:05.037' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (131, -1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:42:08.887' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (132, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:42:09.983' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (133, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 08:42:48.873' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (134, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:42:50.327' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (135, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 08:42:58.783' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (136, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:43:14.283' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (137, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 08:44:38.433' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (138, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:44:42.077' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (139, -1, N'210.245.53.52', N'Tên đăng nhập ''test1'' không thành công.', CAST(N'2018-07-23 08:44:56.970' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (140, 5, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:45:03.290' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (141, 5, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:45:12.500' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (142, 1, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:45:25.010' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (143, 1, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:45:44.253' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (144, 1, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:45:58.340' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (145, 5, N'117.6.162.8', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 08:46:10.607' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (146, 6, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:46:16.843' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (147, 5, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:46:45.283' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (148, 5, N'210.245.53.52', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 08:46:55.743' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (149, 6, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:47:04.200' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (150, 6, N'210.245.53.52', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 08:47:26.387' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (151, 5, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:47:28.370' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (152, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:47:36.803' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (153, 5, N'210.245.53.52', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 08:53:19.477' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (154, 6, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:53:21.340' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (155, 6, N'210.245.53.52', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 08:53:37.847' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (156, 5, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 08:53:39.553' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (157, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 11:36:09.170' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (158, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 13:32:28.487' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (159, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 13:46:23.493' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (160, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 13:46:28.797' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (161, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 13:47:41.303' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (162, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 13:47:55.357' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (163, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 13:52:04.323' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (164, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 13:52:08.527' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (165, 5, N'27.72.28.157', N'Tên đăng nhập ''admin'' không thành công.', CAST(N'2018-07-23 13:59:14.660' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (166, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 13:59:23.920' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (167, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 14:02:00.117' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (168, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 14:02:06.963' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (169, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 14:04:59.240' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (170, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 14:08:03.587' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (171, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 14:09:07.997' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (172, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 14:09:25.020' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (173, 1, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 14:09:37.790' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (174, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 14:12:04.790' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (175, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 14:12:08.743' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (176, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 15:56:43.683' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (177, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 15:56:47.843' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (178, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 16:00:17.867' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (179, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 16:00:21.330' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (180, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 16:03:16.263' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (181, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 16:03:20.567' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (182, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 16:05:45.773' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (183, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 16:05:50.387' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (184, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 16:08:00.943' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (185, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 16:08:05.840' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (186, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 16:12:20.590' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (187, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 16:12:24.170' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (188, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 16:25:16.893' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (189, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 16:25:21.203' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (190, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 16:30:28.590' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (191, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 16:30:33.200' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (192, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 16:36:55.220' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (193, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 16:36:57.127' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (194, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 16:37:42.107' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (195, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 16:37:46.227' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (196, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 16:39:10.387' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (197, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 16:39:14.287' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (198, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 16:45:18.547' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (199, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 17:12:55.887' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (200, 1, N'210.245.53.9', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 17:13:57.857' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (201, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 17:14:05.770' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (202, 1, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 17:42:20.087' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (203, 1, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 17:42:26.037' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (204, 1, N'1.55.242.165', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 17:42:38.530' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (205, 1, N'210.245.53.9', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 17:50:24.670' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (206, 1, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 17:50:35.093' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (207, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 17:50:54.340' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (208, 1, N'118.70.81.83', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 17:50:59.613' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (209, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 17:51:45.920' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (210, 1, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 17:52:14.863' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (211, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 19:52:04.910' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (212, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 19:56:04.173' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (213, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 19:56:07.617' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (214, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 20:03:43.753' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (215, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 20:25:15.920' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (216, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 20:25:19.370' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (217, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 20:28:34.040' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (218, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 20:33:27.503' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (219, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 20:33:39.810' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (220, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 20:34:55.923' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (221, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 20:35:01.463' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (222, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 20:36:23.497' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (223, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 20:36:27.773' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (224, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 20:36:46.467' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (225, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 20:36:54.543' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (226, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 20:38:43.510' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (227, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 20:38:47.853' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (228, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 20:39:18.447' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (229, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 20:39:23.493' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (230, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 20:39:58.023' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (231, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 20:40:01.727' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (232, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 20:43:33.360' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (233, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 20:43:37.423' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (234, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 20:46:21.573' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (235, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 20:46:24.763' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (236, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 20:47:50.180' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (237, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 20:47:54.063' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (238, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 20:51:28.633' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (239, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 20:51:38.543' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (240, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 20:52:23.227' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (241, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 20:52:27.343' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (242, -1, N'27.72.28.157', N'Tên đăng nhập ''admin'' không thành công.', CAST(N'2018-07-23 20:57:18.183' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (243, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 20:57:24.537' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (244, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 21:17:53.597' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (245, -1, N'27.72.28.157', N'Tên đăng nhập ''admin'' không thành công.', CAST(N'2018-07-23 21:12:29.027' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (246, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 21:12:38.510' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (247, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 21:30:10.333' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (248, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 21:30:15.740' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (249, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 21:31:48.110' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (250, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 21:32:06.197' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (251, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 21:36:42.190' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (252, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 21:36:44.690' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (253, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 22:04:10.420' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (254, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 22:04:17.043' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (255, 1, N'118.71.7.4', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 22:13:12.830' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (256, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 22:25:54.930' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (257, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 22:56:09.203' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (258, 1, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-07-23 23:43:07.290' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (259, 5, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-23 23:43:15.160' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (260, 5, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 01:01:15.987' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (261, 6, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 01:01:26.630' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (262, 1, N'118.71.7.4', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 01:40:46.727' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (263, 1, N'118.71.7.4', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 06:57:30.027' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (264, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:02:07.887' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (265, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:26:38.717' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (266, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:27:59.753' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (267, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 08:28:04.960' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (268, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:28:10.210' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (269, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 08:30:19.030' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (270, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:30:25.673' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (271, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 08:30:37.397' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (272, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:30:39.383' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (273, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 08:30:49.913' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (274, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:30:54.023' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (275, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 08:31:34.797' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (276, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:31:38.710' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (277, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 08:32:13.273' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (278, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:32:17.563' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (279, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 08:33:13.257' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (280, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:33:14.833' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (281, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:37:03.313' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (282, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:42:57.317' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (283, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 08:43:14.027' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (284, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:43:23.710' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (285, -1, N'27.72.28.157', N'Tên đăng nhập ''test1'' không thành công.', CAST(N'2018-07-24 08:43:35.643' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (286, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:43:43.497' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (287, 1, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:43:46.297' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (288, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:44:06.393' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (289, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 08:44:42.970' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (290, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 08:44:47.810' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (291, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:44:54.123' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (292, 5, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:47:00.837' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (293, 5, N'117.6.162.8', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 08:47:00.857' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (294, 5, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:47:11.727' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (295, 5, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:47:42.240' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (296, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:48:09.520' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (297, 1, N'210.245.53.52', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 08:48:13.263' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (298, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:48:26.127' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (299, -1, N'27.72.28.157', N'Tên đăng nhập ''admin'' không thành công.', CAST(N'2018-07-24 08:49:41.947' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (300, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:49:47.683' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (301, 1, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:50:34.683' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (302, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:51:48.827' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (303, 1, N'1.55.242.165', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:53:36.390' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (304, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 08:59:43.660' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (305, 1, N'1.55.242.165', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 09:00:17.870' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (306, 1, N'113.185.25.98', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 09:01:55.930' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (307, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 09:06:19.073' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (308, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 09:08:21.880' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (309, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 09:14:25.127' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (310, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 09:14:29.970' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (311, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 09:21:45.180' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (312, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 09:21:51.230' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (313, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 09:22:40.857' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (314, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 09:22:44.600' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (315, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 09:22:50.757' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (316, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 09:22:55.577' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (317, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 09:23:18.577' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (318, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 09:23:22.920' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (319, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 09:23:37.840' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (320, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 09:23:41.953' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (321, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 09:24:18.913' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (322, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 09:24:23.143' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (323, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 09:26:47.033' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (324, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 09:26:50.573' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (325, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 09:27:20.893' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (326, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 09:27:25.833' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (327, -1, N'27.72.28.157', N'Tên đăng nhập ''tester1'' không thành công.', CAST(N'2018-07-24 09:40:54.000' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (328, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 09:41:01.500' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (329, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 09:48:51.437' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (330, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 09:48:53.307' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (331, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 09:51:50.793' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (332, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 09:51:59.110' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (333, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 09:54:52.893' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (334, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 09:54:58.497' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (335, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 12:04:55.717' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (336, 1, N'1.55.242.165', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 12:17:43.987' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (337, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 12:17:57.443' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (338, 1, N'1.55.242.165', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 12:18:30.480' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (339, 1, N'1.55.242.165', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 12:18:31.600' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (340, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 12:18:43.683' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (341, 6, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 12:29:26.327' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (342, 1, N'210.245.53.52', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 12:35:16.370' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (343, 6, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 12:35:21.960' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (344, 6, N'210.245.53.52', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 12:35:48.897' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (345, 5, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 12:35:55.917' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (346, 5, N'210.245.53.52', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 12:36:19.580' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (347, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 12:36:21.497' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (348, 1, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 12:36:27.923' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (349, 1, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 12:36:43.500' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (350, 1, N'113.190.252.57', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 12:36:52.967' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (351, 5, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 12:36:57.747' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (352, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 13:42:50.880' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (353, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 13:43:11.540' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (354, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 13:43:11.560' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (355, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 13:43:15.193' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (356, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 13:43:16.500' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (357, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 13:43:55.633' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (358, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 13:44:01.763' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (359, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 13:44:19.193' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (360, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 13:44:22.527' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (361, 1, N'113.185.11.44', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 13:46:40.297' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (362, 1, N'113.185.25.105', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 13:47:06.110' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (363, 1, N'113.185.11.44', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 13:47:07.530' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (364, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 13:47:59.333' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (365, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 13:48:06.623' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (366, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 13:53:34.750' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (367, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 13:53:39.410' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (368, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 13:53:53.160' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (369, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 13:53:57.307' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (370, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 13:54:12.300' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (371, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 13:56:02.287' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (372, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 13:56:05.747' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (373, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 13:57:14.110' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (374, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 14:03:06.773' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (375, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 14:11:45.607' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (376, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 14:11:50.620' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (377, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 14:12:50.020' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (378, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 14:12:54.253' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (379, 1, N'113.185.11.44', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 14:21:00.203' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (380, 5, N'113.185.25.119', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 14:22:07.867' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (381, 5, N'113.185.11.44', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 14:23:37.077' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (382, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 14:26:17.883' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (383, 5, N'113.185.25.119', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 14:30:19.767' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (384, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 14:31:39.000' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (385, 5, N'113.185.25.119', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 14:31:44.157' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (386, 1, N'113.185.25.119', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 14:31:52.747' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (387, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 14:33:44.363' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (388, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 14:35:24.537' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (389, 1, N'113.185.25.110', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 14:49:52.880' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (390, 1, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 14:52:06.170' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (391, 1, N'118.70.81.83', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 14:52:33.197' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (392, 1, N'113.185.11.44', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 14:53:30.003' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (393, 1, N'113.185.25.110', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 14:54:14.537' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (394, 1, N'118.70.81.83', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 14:55:33.417' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (395, 1, N'113.185.25.110', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 14:58:35.417' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (396, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 14:58:36.670' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (397, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 15:13:46.350' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (398, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 15:13:49.970' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (399, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 15:18:16.747' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (400, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 15:18:22.367' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (401, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 15:18:42.697' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (402, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 15:18:46.807' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (403, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 15:19:31.783' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (404, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 15:19:36.303' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (405, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 15:19:43.653' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (406, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 15:19:47.450' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (407, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 15:20:02.957' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (408, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 15:20:10.057' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (409, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 15:27:41.257' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (410, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 15:27:48.180' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (411, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 15:28:05.437' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (412, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 15:28:09.590' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (413, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 15:28:27.787' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (414, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 15:28:31.937' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (415, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 15:35:10.683' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (416, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 15:35:14.867' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (417, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 15:35:28.433' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (418, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 15:35:32.657' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (419, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 15:36:49.847' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (420, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 15:36:55.193' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (421, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 15:37:46.470' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (422, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 15:37:50.977' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (423, -1, N'27.72.28.157', N'Tên đăng nhập ''admin'' không thành công.', CAST(N'2018-07-24 16:37:03.053' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (424, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 16:37:12.277' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (425, 1, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 16:40:49.723' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (426, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 16:41:13.797' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (427, 1, N'1.55.242.165', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 16:41:24.980' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (428, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 16:41:30.550' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (429, 1, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 16:41:46.743' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (430, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 16:41:58.077' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (431, 1, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 16:42:07.073' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (432, 1, N'118.70.81.83', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 16:42:09.767' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (433, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 17:16:25.863' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (434, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:16:49.437' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (435, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 17:20:10.007' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (436, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:20:14.887' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (437, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 17:20:29.787' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (438, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:20:34.037' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (439, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 17:21:43.330' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (440, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:21:46.960' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (441, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 17:24:12.813' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (442, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:24:17.577' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (443, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 17:24:26.253' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (444, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:24:29.997' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (445, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 17:25:53.250' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (446, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:25:54.973' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (447, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 17:26:02.863' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (448, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:26:07.237' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (449, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 17:27:59.143' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (450, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:28:04.350' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (451, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 17:28:14.350' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (452, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:28:18.353' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (453, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 17:31:17.160' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (454, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:31:22.213' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (455, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 17:35:24.317' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (456, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:35:28.893' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (457, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 17:35:39.490' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (458, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:35:43.557' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (459, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:55:10.087' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (460, 1, N'118.70.81.83', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:55:13.920' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (461, 1, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:55:16.410' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (462, 1, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:55:19.090' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (463, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:55:24.203' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (464, 1, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:55:47.330' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (465, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:58:43.343' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (466, 1, N'1.55.242.165', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:58:46.853' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (467, 1, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:58:48.930' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (468, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:58:51.003' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (469, 1, N'1.55.242.165', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:58:52.993' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (470, 1, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:58:56.177' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (471, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:59:00.033' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (472, 1, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:59:07.620' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (473, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:59:12.150' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (474, 1, N'1.55.242.165', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:59:25.163' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (475, 1, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:59:28.290' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (476, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:59:31.150' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (477, 1, N'1.55.242.165', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:59:33.543' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (478, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 17:59:37.343' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (479, 1, N'113.185.11.44', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 18:00:16.707' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (480, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 20:52:11.163' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (481, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 21:39:45.947' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (482, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 21:39:54.413' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (483, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 21:40:01.260' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (484, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 21:40:10.063' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (485, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 21:40:18.377' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (486, -1, N'27.72.28.157', N'Tên đăng nhập ''giamdoc'' không thành công.', CAST(N'2018-07-24 21:40:25.590' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (487, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 21:40:33.023' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (488, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 21:40:53.333' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (489, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 21:40:59.547' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (490, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 21:41:58.597' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (491, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 21:47:00.940' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (492, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 21:47:08.623' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (493, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 21:49:49.130' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (494, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 21:49:56.293' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (495, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 21:51:23.567' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (496, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 21:52:02.313' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (497, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 21:52:09.457' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (498, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 23:31:40.380' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (499, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-24 23:34:08.520' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (500, 1, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-07-24 23:34:11.443' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (501, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 06:48:19.543' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (502, 6, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 07:39:54.967' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (503, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 07:55:32.810' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (504, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:02:26.213' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (505, -1, N'27.72.28.157', N'Tên đăng nhập ''test2'' không thành công.', CAST(N'2018-07-25 08:02:31.903' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (506, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:03:17.483' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (507, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:03:46.577' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (508, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:03:56.237' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (509, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:05:13.143' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (510, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:05:18.823' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (511, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:06:56.383' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (512, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:06:59.720' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (513, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:07:23.270' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (514, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:07:29.647' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (515, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:07:42.650' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (516, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:07:47.990' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (517, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:09:04.363' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (518, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:09:09.770' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (519, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:09:34.007' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (520, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:09:38.603' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (521, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:10:00.807' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (522, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:10:05.057' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (523, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:11:25.560' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (524, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:11:29.437' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (525, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:12:47.357' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (526, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:12:53.533' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (527, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:13:10.957' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (528, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:13:15.447' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (529, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:18:19.270' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (530, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:18:23.603' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (531, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:18:37.903' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (532, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:18:52.463' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (533, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:19:37.950' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (534, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:19:43.643' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (535, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:20:34.250' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (536, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:20:39.347' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (537, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:21:28.793' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (538, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:21:33.093' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (539, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:21:52.087' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (540, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:21:57.263' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (541, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:25:42.763' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (542, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:25:42.780' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (543, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:25:49.600' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (544, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:35:44.560' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (545, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:35:47.890' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (546, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:52:46.783' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (547, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:52:54.340' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (548, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:54:10.990' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (549, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:54:16.807' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (550, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 08:54:59.377' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (551, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 08:55:02.957' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (552, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 09:00:40.447' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (553, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 09:00:44.110' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (554, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 09:01:55.710' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (555, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 09:01:59.267' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (556, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 09:14:37.810' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (557, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 09:14:43.210' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (558, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 09:15:56.967' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (559, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 09:16:00.253' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (560, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 09:35:55.557' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (561, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 09:35:58.613' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (562, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 09:44:43.437' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (563, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 09:44:46.943' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (564, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 09:47:09.947' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (565, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 09:47:13.177' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (566, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 09:48:50.210' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (567, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 09:48:54.083' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (568, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 09:59:18.190' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (569, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 09:59:22.823' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (570, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:13:35.830' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (571, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:13:38.970' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (572, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:13:53.603' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (573, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:13:58.940' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (574, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:15:23.357' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (575, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:15:27.547' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (576, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:21:39.823' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (577, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:21:43.737' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (578, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:24:25.217' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (579, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:24:35.290' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (580, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:29:10.480' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (581, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:29:14.373' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (582, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:29:39.077' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (583, -1, N'27.72.28.157', N'Tên đăng nhập ''test2'' không thành công.', CAST(N'2018-07-25 10:29:42.723' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (584, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:29:48.347' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (585, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:30:31.863' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (586, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:30:39.563' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (587, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:31:27.453' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (588, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:31:31.527' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (589, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:32:39.157' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (590, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:32:44.273' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (591, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:36:48.293' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (592, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:36:52.070' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (593, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:39:39.733' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (594, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:39:43.640' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (595, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:46:18.753' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (596, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:46:28.450' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (597, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:46:35.190' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (598, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:47:29.067' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (599, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:47:32.057' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (600, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:49:19.320' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (601, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:49:23.720' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (602, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:50:45.500' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (603, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:50:51.637' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (604, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:51:32.803' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (605, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:51:36.403' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (606, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:51:55.637' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (607, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:52:00.000' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (608, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:53:40.760' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (609, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:53:44.017' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (610, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:54:26.617' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (611, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:54:32.210' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (612, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:54:52.570' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (613, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:54:56.783' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (614, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:55:12.543' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (615, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:55:17.170' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (616, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 10:59:37.057' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (617, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 10:59:40.833' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (618, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 11:02:28.997' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (619, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 11:02:33.790' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (620, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 11:21:25.983' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (621, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 11:21:29.387' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (622, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 11:21:52.170' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (623, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 11:27:58.687' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (624, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 11:32:23.013' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (625, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 11:32:26.263' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (626, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 11:32:44.807' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (627, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 11:32:49.620' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (628, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 11:34:54.180' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (629, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 11:34:57.930' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (630, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 11:35:20.023' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (631, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 11:35:24.673' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (632, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 11:36:17.457' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (633, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 11:36:21.513' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (634, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 11:37:41.880' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (635, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 11:37:45.267' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (636, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 11:39:45.193' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (637, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 11:44:05.903' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (638, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 11:44:11.270' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (639, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 11:49:21.503' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (640, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 11:49:28.473' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (641, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 11:56:22.187' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (642, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 11:56:26.363' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (643, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 13:32:05.967' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (644, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 13:39:32.687' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (645, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 13:39:37.280' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (646, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 13:40:14.363' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (647, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 13:40:18.173' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (648, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 13:47:47.180' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (649, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 13:47:50.867' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (650, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 13:49:35.543' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (651, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 13:49:39.190' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (652, 1, N'113.185.11.32', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 13:59:17.147' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (653, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:07:24.817' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (654, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:25:14.213' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (655, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:25:21.903' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (656, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:26:23.337' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (657, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:26:35.290' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (658, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:30:21.607' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (659, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:30:26.100' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (660, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:34:39.257' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (661, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:34:43.080' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (662, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:34:45.957' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (663, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:34:47.687' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (664, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:35:41.877' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (665, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:35:49.343' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (666, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:36:16.257' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (667, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:36:21.767' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (668, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:37:17.063' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (669, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:37:22.820' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (670, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:39:07.017' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (671, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:39:15.227' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (672, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:39:16.387' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (673, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:39:19.493' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (674, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:39:53.220' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (675, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:39:58.393' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (676, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:40:50.120' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (677, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:40:57.360' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (678, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:41:27.837' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (679, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:41:31.613' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (680, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:41:51.287' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (681, -1, N'27.72.28.157', N'Tên đăng nhập ''admin'' không thành công.', CAST(N'2018-07-25 14:41:57.937' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (682, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:42:06.500' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (683, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:44:47.683' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (684, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:44:54.447' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (685, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:45:12.113' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (686, -1, N'27.72.28.157', N'Tên đăng nhập ''admin'' không thành công.', CAST(N'2018-07-25 14:45:17.887' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (687, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:45:25.233' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (688, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:54:24.077' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (689, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:54:31.573' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (690, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:55:23.293' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (691, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:55:28.290' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (692, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 14:55:58.760' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (693, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 14:56:05.847' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (694, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 15:03:09.867' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (695, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 15:03:17.420' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (696, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 15:07:49.203' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (697, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 15:07:53.903' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (698, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 15:08:03.500' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (699, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 15:08:07.580' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (700, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 15:09:00.963' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (701, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 15:09:09.217' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (702, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 15:15:23.633' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (703, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 15:15:26.410' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (704, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 15:51:54.117' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (705, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 15:51:56.300' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (706, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 15:55:44.597' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (707, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 15:55:46.867' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (708, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 15:58:20.767' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (709, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 15:58:28.020' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (710, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 15:59:41.873' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (711, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 15:59:50.380' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (712, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 16:02:19.647' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (713, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 16:02:24.107' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (714, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 16:02:59.833' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (715, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 16:03:04.970' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (716, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 16:05:07.627' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (717, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 16:05:17.637' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (718, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 16:08:06.523' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (719, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 16:08:08.070' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (720, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 16:18:04.893' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (721, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 16:18:09.060' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (722, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 16:26:00.767' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (723, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 16:26:04.040' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (724, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 16:32:32.960' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (725, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 16:32:38.103' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (726, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 17:02:35.120' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (727, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 17:02:37.960' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (728, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 17:05:16.593' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (729, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 17:05:20.823' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (730, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 17:11:49.103' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (731, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 17:11:54.423' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (732, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 17:13:01.400' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (733, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 17:13:07.453' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (734, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 17:13:21.330' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (735, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 17:13:38.707' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (736, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 17:15:48.230' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (737, -1, N'27.72.28.157', N'Tên đăng nhập ''admin'' không thành công.', CAST(N'2018-07-25 17:15:53.630' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (738, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 17:15:59.577' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (739, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 17:17:13.360' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (740, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 17:17:19.727' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (741, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 20:27:35.053' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (742, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 20:27:35.090' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (743, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 20:27:46.700' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (744, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 20:41:04.187' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (745, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 21:02:31.467' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (746, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 21:08:47.830' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (747, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 21:08:58.550' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (748, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 21:09:25.477' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (749, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 21:09:34.410' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (750, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 21:09:54.040' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (751, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 21:09:59.577' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (752, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 21:10:13.330' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (753, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 21:10:19.323' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (754, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 21:10:25.523' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (755, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 21:10:31.783' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (756, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 21:13:34.873' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (757, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 21:13:40.053' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (758, 6, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 21:39:16.533' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (759, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 22:40:39.160' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (760, 1, N'118.71.244.249', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 22:42:12.850' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (761, 6, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 22:55:26.543' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (762, 5, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 22:55:31.680' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (763, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 22:51:22.603' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (764, 5, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 23:11:37.483' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (765, 6, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 23:11:42.007' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (766, 5, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 23:22:45.567' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (767, 5, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 23:23:06.670' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (768, 7, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 23:23:12.670' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (769, 7, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 23:24:53.157' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (770, 5, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 23:24:59.297' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (771, 7, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 23:25:14.560' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (772, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-25 23:31:08.427' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (773, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-25 23:31:13.620' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (774, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 00:06:19.683' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (775, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 00:06:33.600' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (776, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 00:06:39.290' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (777, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 00:07:32.330' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (778, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 00:07:37.393' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (779, 1, N'118.71.7.4', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 00:21:47.370' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (780, 6, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 01:49:01.083' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (781, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:06:02.143' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (782, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:08:43.887' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (783, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:09:16.713' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (784, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:09:22.047' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (785, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:10:47.437' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (786, -1, N'27.72.28.157', N'Tên đăng nhập ''giamdoc'' không thành công.', CAST(N'2018-07-26 08:10:51.283' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (787, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:10:57.743' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (788, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:11:28.440' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (789, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:11:53.843' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (790, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:11:59.307' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (791, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:14:22.000' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (792, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:14:22.020' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (793, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:14:24.660' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (794, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:19:22.627' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (795, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:19:30.300' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (796, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:23:47.993' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (797, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:23:52.670' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (798, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:25:45.110' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (799, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:25:49.967' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (800, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:26:41.500' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (801, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:26:44.103' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (802, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:26:56.983' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (803, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:27:01.637' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (804, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:27:19.593' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (805, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:27:23.897' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (806, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:28:14.093' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (807, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:28:18.393' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (808, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:29:08.930' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (809, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:29:12.850' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (810, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:29:47.947' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (811, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:29:54.217' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (812, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:31:01.477' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (813, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:31:07.817' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (814, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:36:02.023' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (815, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:36:05.920' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (816, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:37:54.533' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (817, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:37:58.677' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (818, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:40:26.010' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (819, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:40:29.647' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (820, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:44:12.207' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (821, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 08:44:18.480' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (822, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 08:59:58.460' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (823, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 09:00:01.267' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (824, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 09:18:14.450' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (825, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 09:20:52.360' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (826, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 09:20:56.607' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (827, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 09:20:59.950' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (828, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 09:21:01.480' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (829, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 09:21:05.150' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (830, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 09:21:19.330' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (831, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 09:21:22.877' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (832, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 09:22:02.587' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (833, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 09:25:00.520' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (834, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 09:25:05.247' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (835, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 09:26:39.880' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (836, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 09:26:51.477' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (837, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 09:27:56.247' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (838, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 09:27:59.047' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (839, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 09:48:46.200' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (840, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 09:48:51.320' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (841, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 09:48:51.430' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (842, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 09:49:00.033' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (843, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 09:53:50.223' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (844, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 09:53:53.560' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (845, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 09:53:55.553' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (846, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 09:54:00.333' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (847, 1, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:11:57.650' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (848, 1, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:12:02.057' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (849, 1, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:12:17.327' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (850, 1, N'117.6.162.8', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:12:17.357' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (851, 1, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:12:20.370' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (852, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:12:27.413' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (853, 1, N'210.245.53.52', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:12:50.823' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (854, 6, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:12:55.210' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (855, 6, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:13:09.313' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (856, 1, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:19:57.917' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (857, 1, N'117.6.162.8', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:20:31.537' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (858, 6, N'117.6.162.8', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:20:36.873' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (859, 5, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:21:10.877' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (860, 5, N'1.55.242.165', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:21:22.357' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (861, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:22:01.363' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (862, 1, N'210.245.53.52', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:22:01.380' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (863, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:22:04.007' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (864, 1, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:22:13.393' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (865, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:22:23.187' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (866, 1, N'1.55.242.165', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:22:48.360' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (867, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:22:53.417' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (868, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:22:54.547' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (869, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:22:59.957' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (870, 1, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:23:01.893' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (871, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:23:04.943' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (872, 1, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:23:09.800' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (873, 1, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:23:17.503' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (874, 1, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:23:20.963' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (875, 1, N'113.190.252.57', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:23:42.850' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (876, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:23:55.237' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (877, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:24:00.307' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (878, 1, N'113.185.11.35', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:24:37.193' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (879, 1, N'113.185.11.35', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:26:22.913' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (880, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:26:31.837' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (881, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:26:35.940' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (882, 5, N'113.185.11.35', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:26:38.140' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (883, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:26:45.277' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (884, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:26:50.263' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (885, 5, N'113.185.11.35', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:27:05.727' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (886, 1, N'113.185.11.35', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:27:14.843' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (887, 1, N'113.185.11.35', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:27:59.527' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (888, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:28:08.630' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (889, 5, N'113.185.11.35', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:28:12.257' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (890, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:28:14.000' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (891, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:28:28.900' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (892, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:28:34.953' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (893, 5, N'113.185.11.35', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:29:07.970' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (894, 7, N'113.185.11.35', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:29:20.857' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (895, 7, N'113.185.11.35', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:29:41.313' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (896, 1, N'113.185.11.35', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:29:51.953' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (897, 1, N'113.185.11.35', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:32:41.427' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (898, 7, N'113.185.11.35', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:32:52.740' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (899, 7, N'113.185.11.35', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:33:51.473' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (900, 5, N'113.185.11.35', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:34:01.260' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (901, 5, N'113.185.11.35', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:35:02.837' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (902, 7, N'113.185.11.35', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:35:13.303' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (903, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:36:26.003' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (904, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:36:30.750' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (905, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 10:55:04.913' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (906, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 10:55:09.037' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (907, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 11:01:10.320' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (908, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 11:01:13.857' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (909, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 11:01:26.697' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (910, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 11:01:31.003' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (911, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 11:19:33.407' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (912, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 11:19:36.873' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (913, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 11:20:23.920' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (914, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 11:20:28.393' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (915, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 11:52:01.070' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (916, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 11:52:04.423' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (917, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 13:32:16.667' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (918, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 13:32:21.437' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (919, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 13:38:54.933' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (920, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 13:39:03.480' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (921, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 13:39:07.020' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (922, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 13:46:13.840' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (923, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 13:46:16.663' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (924, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 13:46:53.253' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (925, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 13:46:57.507' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (926, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 13:47:10.917' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (927, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 13:47:15.253' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (928, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 13:47:23.343' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (929, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 13:47:26.990' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (930, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 13:55:55.183' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (931, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 14:01:59.133' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (932, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 14:02:02.087' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (933, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 15:47:25.787' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (934, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 15:47:25.827' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (935, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 15:47:34.153' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (936, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 15:52:16.737' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (937, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 15:52:53.453' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (938, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 15:53:06.533' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (939, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 15:53:16.480' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (940, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 16:03:18.983' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (941, 5, N'27.72.28.157', N'Tên đăng nhập ''admin'' không thành công.', CAST(N'2018-07-26 16:07:29.210' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (942, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 16:07:37.110' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (943, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 16:10:43.270' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (944, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 16:10:49.450' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (945, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 16:15:16.540' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (946, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 16:15:20.637' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (947, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 16:22:13.613' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (948, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 16:22:22.050' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (949, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 16:41:59.823' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (950, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 16:42:02.017' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (951, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 16:42:18.410' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (952, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 16:42:22.783' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (953, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 16:42:44.717' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (954, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 16:42:47.290' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (955, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 16:48:53.150' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (956, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 16:48:56.017' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (957, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 16:54:11.297' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (958, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 16:54:17.940' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (959, -1, N'27.72.28.157', N'Tên đăng nhập ''admin'' không thành công.', CAST(N'2018-07-26 16:54:24.663' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (960, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 16:54:32.290' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (961, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 17:05:45.797' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (962, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 17:05:47.770' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (963, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 17:09:54.093' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (964, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 17:10:01.437' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (965, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 17:10:19.193' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (966, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 17:10:22.570' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (967, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 17:26:04.230' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (968, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 17:26:09.393' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (969, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 17:26:40.023' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (970, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 17:26:44.870' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (971, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 17:26:55.207' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (972, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 17:26:59.873' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (973, 6, N'118.71.244.249', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 22:24:36.107' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (974, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 22:25:45.720' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (975, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 22:46:12.220' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (976, 1, N'14.248.215.130', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 22:48:46.120' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (977, 1, N'42.113.107.214', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 23:12:54.210' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (978, 1, N'42.113.107.214', N'Thoát khỏi hệ thống.', CAST(N'2018-07-26 23:14:35.557' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (979, 1, N'42.113.107.214', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 23:14:37.827' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (980, 6, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 23:51:46.620' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (981, 7, N'42.113.107.214', N'Đăng nhập hệ thống.', CAST(N'2018-07-26 23:44:31.313' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (982, 7, N'42.113.107.214', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 00:25:36.203' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (983, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 08:08:35.543' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (984, 7, N'210.245.53.52', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 08:23:24.493' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (985, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 09:26:00.563' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (986, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 09:38:16.557' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (987, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 09:41:54.403' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (988, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 09:41:58.613' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (989, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 09:57:50.557' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (990, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 09:57:55.103' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (991, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 10:16:46.820' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (992, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 10:16:50.687' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (993, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 10:17:18.627' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (994, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 10:17:23.130' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (995, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 10:19:12.163' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (996, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 10:19:16.033' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (997, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 10:23:19.980' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (998, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 10:23:24.260' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (999, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 10:23:37.517' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1000, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 10:23:43.270' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1001, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 10:39:17.617' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1002, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 10:39:21.500' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1003, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 10:42:37.700' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1004, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 10:43:31.890' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1005, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 10:43:39.193' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1006, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 10:44:40.920' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1007, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 10:44:47.100' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1008, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 10:45:21.090' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1009, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 10:45:26.537' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1010, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 10:45:37.107' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1011, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 10:45:40.717' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1012, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 10:52:40.380' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1013, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 10:55:25.707' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1014, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 10:55:29.857' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1015, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 10:59:02.450' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1016, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 10:59:07.387' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1017, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 11:33:17.573' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1018, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 11:33:21.103' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1019, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 11:43:16.257' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1020, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 11:43:20.073' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1021, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 12:01:51.330' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1022, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 12:01:54.530' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1023, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 12:02:18.963' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1024, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 12:02:25.370' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1025, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 12:03:42.207' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1026, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 12:03:45.657' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1027, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 12:05:18.400' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1028, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 12:05:22.417' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1029, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 13:40:08.497' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1030, -1, N'27.72.28.157', N'Tên đăng nhập ''nhanvien'' không thành công.', CAST(N'2018-07-27 13:58:35.850' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1031, -1, N'27.72.28.157', N'Tên đăng nhập ''nhanvien'' không thành công.', CAST(N'2018-07-27 14:00:49.683' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1032, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 14:00:53.553' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1033, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 16:17:04.633' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1034, -1, N'27.72.28.157', N'Tên đăng nhập ''truongphong'' không thành công.', CAST(N'2018-07-27 16:21:11.720' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1035, -1, N'27.72.28.157', N'Tên đăng nhập ''nhanvien'' không thành công.', CAST(N'2018-07-27 16:23:00.290' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1036, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 16:23:05.413' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1037, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 16:54:13.553' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1038, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 16:54:17.530' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1039, 1, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 16:55:32.650' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1040, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 16:55:43.837' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1041, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 17:28:55.877' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1042, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 17:29:01.610' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1043, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 21:40:13.160' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1044, 10, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 22:44:55.587' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1045, 10, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-07-27 22:46:41.323' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1046, 12, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 23:50:13.633' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1047, 12, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 23:50:15.573' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1048, 12, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 23:50:21.087' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1049, 12, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 23:50:21.880' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1050, 12, N'::1', N'Tên đăng nhập '''' không thành công.', CAST(N'2018-07-27 23:50:22.183' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1051, 12, N'::1', N'Tên đăng nhập '''' không thành công.', CAST(N'2018-07-27 23:50:25.863' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1052, 12, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 23:50:29.427' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1053, 12, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 23:50:31.210' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1054, 12, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 23:50:43.010' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1055, 12, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 23:50:44.257' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1056, 12, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-27 23:50:44.627' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1057, 12, N'::1', N'Tên đăng nhập '''' không thành công.', CAST(N'2018-07-27 23:50:44.863' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1058, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-28 00:30:44.370' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1059, 1, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-07-28 00:43:52.213' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1060, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-28 00:43:53.827' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1061, 1, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-07-28 00:43:56.537' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1062, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-07-28 00:46:10.683' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1063, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-28 08:11:03.423' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1064, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-28 08:12:46.480' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1065, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-28 08:12:50.133' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1066, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-28 09:01:35.293' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1067, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-28 09:01:39.787' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1068, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-28 09:41:56.733' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1069, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-28 09:42:01.207' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1070, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-28 09:42:27.720' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1071, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-28 09:42:32.253' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1072, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-28 09:44:33.160' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1073, 6, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-28 09:44:47.733' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1074, 6, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-28 09:51:19.337' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1075, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-28 09:51:24.640' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1076, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-28 10:02:19.623' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1077, 7, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-28 10:02:23.603' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1078, 7, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-28 10:18:10.860' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1079, 5, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-28 10:18:15.047' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1080, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-28 10:20:04.770' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1081, 5, N'27.72.28.157', N'Thoát khỏi hệ thống.', CAST(N'2018-07-28 10:24:12.867' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1082, 1, N'27.72.28.157', N'Đăng nhập hệ thống.', CAST(N'2018-07-28 10:24:16.623' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1083, 1, N'58.187.109.50', N'Đăng nhập hệ thống.', CAST(N'2018-07-28 11:00:57.083' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1084, 1, N'58.187.109.50', N'Đăng nhập hệ thống.', CAST(N'2018-07-28 11:08:16.010' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1085, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-01 06:40:46.127' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1086, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-02 23:12:56.617' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1087, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-03 07:20:50.037' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1088, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-03 22:39:04.700' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1089, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-04 07:35:37.427' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1090, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-04 15:25:21.320' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1091, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-05 11:38:43.913' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1092, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-05 18:13:25.923' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (1093, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-05 21:07:08.137' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2091, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-08 00:29:16.350' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2092, 1, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-08-08 00:31:29.880' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2093, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-08 00:31:33.617' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2094, 1, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-08-08 00:31:37.590' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2095, 5, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-08 00:31:48.023' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2096, 5, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-08-08 00:31:50.683' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2097, -1, N'::1', N'Tên đăng nhập ''test'' không thành công.', CAST(N'2018-08-08 00:31:57.903' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2098, 14, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-08 00:36:27.583' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2099, 14, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-08-08 00:36:32.987' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2100, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-08 00:53:57.103' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2101, 1, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-08-08 00:54:02.927' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2102, 5, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-08 00:54:10.410' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2103, 5, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-08-08 00:54:12.347' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2104, -1, N'::1', N'Tên đăng nhập ''test'' không thành công.', CAST(N'2018-08-08 00:54:18.523' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2105, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-08 21:57:22.230' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2106, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-10 00:03:18.770' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2107, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-10 00:19:38.063' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2108, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-10 00:23:05.503' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2109, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-10 06:55:34.557' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2110, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-10 21:47:27.963' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2111, 1, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-08-11 00:17:36.583' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2112, 7, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-11 00:17:44.453' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2113, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-12 15:18:04.777' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2114, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-12 22:34:48.257' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2115, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-13 23:04:47.453' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2116, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-15 01:19:49.770' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2117, 16, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-08-15 01:58:44.617' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2118, 16, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-15 01:58:53.620' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2119, 16, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-08-15 01:59:03.937' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2120, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-15 02:02:08.377' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2121, 16, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-08-15 02:05:19.233' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2122, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-15 02:05:27.377' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2123, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-15 23:37:43.257' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2124, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-17 11:40:15.897' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2125, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-18 16:03:41.777' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2126, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-18 20:29:38.843' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2127, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-19 15:15:19.750' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2128, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-22 20:34:43.557' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2129, 1, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-08-22 21:35:15.723' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2130, -1, N'::1', N'Tên đăng nhập ''test'' không thành công.', CAST(N'2018-08-22 21:35:23.130' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2131, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-22 21:47:40.793' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2132, 1, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-08-22 21:49:14.383' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2133, 18, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-22 21:49:21.790' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2134, 18, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-08-22 21:55:19.783' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2135, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-22 21:55:22.640' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2136, 1, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-08-22 21:58:42.593' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2137, 7, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-22 21:58:55.417' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2138, 7, N'::1', N'Thoát khỏi hệ thống.', CAST(N'2018-08-22 22:18:00.547' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2139, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-22 22:18:02.577' AS DateTime))
GO
INSERT [dbo].[CP_UserLog] ([ID], [UserID], [IP], [Note], [Created]) VALUES (2140, 1, N'::1', N'Đăng nhập hệ thống.', CAST(N'2018-08-24 21:00:41.563' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[CP_UserLog] OFF
GO
INSERT [dbo].[CP_UserRole] ([UserID], [RoleID]) VALUES (1, 1)
GO
INSERT [dbo].[CP_UserRole] ([UserID], [RoleID]) VALUES (2, 2)
GO
INSERT [dbo].[CP_UserRole] ([UserID], [RoleID]) VALUES (3, 2)
GO
INSERT [dbo].[CP_UserRole] ([UserID], [RoleID]) VALUES (4, 2)
GO
INSERT [dbo].[CP_UserRole] ([UserID], [RoleID]) VALUES (5, 2)
GO
INSERT [dbo].[CP_UserRole] ([UserID], [RoleID]) VALUES (6, 3)
GO
INSERT [dbo].[CP_UserRole] ([UserID], [RoleID]) VALUES (7, 4)
GO
INSERT [dbo].[CP_UserRole] ([UserID], [RoleID]) VALUES (18, 4)
GO
SET IDENTITY_INSERT [dbo].[Mod_Adv] ON 

GO
INSERT [dbo].[Mod_Adv] ([ID], [MenuID], [Name], [AdvCode], [File], [Width], [Height], [AddInTag], [LinkFile], [URL], [Target], [Order], [Activity]) VALUES (1, 59, N'Trung tâm ứng cứu khẩn cấp máy tính Việt Nam ', N'', N'~/Data/upload/images/logo_vncert(1).jpg', 0, 0, N'', NULL, N'/', N'', 1, 1)
GO
INSERT [dbo].[Mod_Adv] ([ID], [MenuID], [Name], [AdvCode], [File], [Width], [Height], [AddInTag], [LinkFile], [URL], [Target], [Order], [Activity]) VALUES (12, 245, N'Slide 1', N'', N'~/Data/upload/images/Adv/SlideHome/04.png', 0, 0, N'', NULL, N'', N'', 12, 1)
GO
INSERT [dbo].[Mod_Adv] ([ID], [MenuID], [Name], [AdvCode], [File], [Width], [Height], [AddInTag], [LinkFile], [URL], [Target], [Order], [Activity]) VALUES (13, 245, N'Slide 2', N'', N'~/Data/upload/images/Adv/SlideHome/05.png', 0, 0, N'', NULL, N'', N'', 13, 1)
GO
INSERT [dbo].[Mod_Adv] ([ID], [MenuID], [Name], [AdvCode], [File], [Width], [Height], [AddInTag], [LinkFile], [URL], [Target], [Order], [Activity]) VALUES (14, 245, N'Slide 3', N'', N'~/Data/upload/images/Adv/SlideHome/06.png', 0, 0, N'', NULL, N'', N'', 14, 1)
GO
INSERT [dbo].[Mod_Adv] ([ID], [MenuID], [Name], [AdvCode], [File], [Width], [Height], [AddInTag], [LinkFile], [URL], [Target], [Order], [Activity]) VALUES (15, 245, N'Slide 4', N'', N'~/Data/upload/images/Adv/SlideHome/07.png', 0, 0, N'', NULL, N'', N'', 15, 1)
GO
INSERT [dbo].[Mod_Adv] ([ID], [MenuID], [Name], [AdvCode], [File], [Width], [Height], [AddInTag], [LinkFile], [URL], [Target], [Order], [Activity]) VALUES (16, 247, N'Mã số quản lý', N'', N'', 0, 0, N'', NULL, N'http://qlvb.tinhtinh.com/vn/', N'', 16, 1)
GO
INSERT [dbo].[Mod_Adv] ([ID], [MenuID], [Name], [AdvCode], [File], [Width], [Height], [AddInTag], [LinkFile], [URL], [Target], [Order], [Activity]) VALUES (19, 251, N'Giám sát an toàn mạng', N'', N'', 0, 0, N'', N'', N'http://qlvb.tinhtinh.com/vn/Giam-sat-an-toan-mang/TONG-QUAN-VE-HE-THONG-GIAM-SAT-MANG.aspx', N'', 19, 1)
GO
INSERT [dbo].[Mod_Adv] ([ID], [MenuID], [Name], [AdvCode], [File], [Width], [Height], [AddInTag], [LinkFile], [URL], [Target], [Order], [Activity]) VALUES (20, 250, N'Tổng hợp Văn bản QPPL về ATTT', N'', N'', 0, 0, N'', NULL, N'http://www.vncert.gov.vn/van-ban-quy-pham-phap-luat-linh-vuc-an-toan-thong-tin.php', N'', 20, 1)
GO
INSERT [dbo].[Mod_Adv] ([ID], [MenuID], [Name], [AdvCode], [File], [Width], [Height], [AddInTag], [LinkFile], [URL], [Target], [Order], [Activity]) VALUES (21, 251, N'Sử dụng mất khẩu an toàn', N'', N'', 0, 0, N'', NULL, N'http://www.vncert.gov.vn/files/Huong_dan_su_dung_mat_khau_an_toan.pdf', N'', 21, 1)
GO
INSERT [dbo].[Mod_Adv] ([ID], [MenuID], [Name], [AdvCode], [File], [Width], [Height], [AddInTag], [LinkFile], [URL], [Target], [Order], [Activity]) VALUES (22, 251, N'Sử dụng an toàn email công vụ', N'', N'', 0, 0, N'', NULL, N'http://www.vncert.gov.vn/files/huongdansudungantoanthudientucongvu.pdf', N'', 22, 1)
GO
INSERT [dbo].[Mod_Adv] ([ID], [MenuID], [Name], [AdvCode], [File], [Width], [Height], [AddInTag], [LinkFile], [URL], [Target], [Order], [Activity]) VALUES (23, 250, N'Luật viễn thông 41/2009/QH12', N'', N'', 0, 0, N'', NULL, N'http://www.vncert.gov.vn/files/luatVT.pdf', N'', 23, 1)
GO
INSERT [dbo].[Mod_Adv] ([ID], [MenuID], [Name], [AdvCode], [File], [Width], [Height], [AddInTag], [LinkFile], [URL], [Target], [Order], [Activity]) VALUES (24, 249, N'Quyết định 05/2017/QĐ-TTg', N'', N'', 0, 0, N'', NULL, N'http://www.vncert.gov.vn/files/QD05-2017-Q%C4%90-TTg.signed.pdf', N'', 24, 1)
GO
INSERT [dbo].[Mod_Adv] ([ID], [MenuID], [Name], [AdvCode], [File], [Width], [Height], [AddInTag], [LinkFile], [URL], [Target], [Order], [Activity]) VALUES (25, 249, N'Đề án đẩy mạnh hoạt động mạng lưới ƯCSC', N'', N'', 0, 0, N'', NULL, N'http://www.vncert.gov.vn/files/DeanDPUC.pdf', N'', 25, 1)
GO
SET IDENTITY_INSERT [dbo].[Mod_Adv] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_Album] ON 

GO
INSERT [dbo].[Mod_Album] ([ID], [MenuID], [State], [Name], [Code], [Summary], [Content], [View], [Published], [Order], [Activity]) VALUES (1, 135, 0, N'Thứ trưởng Nguyễn Minh Hồng kiểm tra, đánh giá các Chương trình MTQG tại Quảng Bình', N'Thu-truong-Nguyen-Minh-Hong-kiem-tra-danh-gia-cac-Chuong-trinh-MTQG-tai-Quang-Binh', N'', N'<p>Chiều ng&agrave;y 1/11/2017, Thứ trưởng Bộ TT&amp;TT Nguyễn Minh Hồng dẫn đầu Đo&agrave;n c&ocirc;ng t&aacute;c li&ecirc;n ng&agrave;nh Ban chỉ đạo Trung ương c&aacute;c Chương tr&igrave;nh mục ti&ecirc;u quốc gia (MTQG) giai đoạn 2016-2020 đ&atilde; l&agrave;m việc với UBND tỉnh Quảng B&igrave;nh. Tham gia Đo&agrave;n c&ocirc;ng t&aacute;c c&oacute; đại diện c&aacute;c Bộ, ng&agrave;nh li&ecirc;n quan. Tiếp Đo&agrave;n c&ocirc;ng t&aacute;c c&oacute; đồng ch&iacute; L&ecirc; Minh Ng&acirc;n, Ph&oacute; Chủ tịch UBND tỉnh; c&ugrave;ng đại diện l&atilde;nh đạo c&aacute;c Sở, ban, ng&agrave;nh li&ecirc;n quan thuộc tỉnh.</p>
', 0, CAST(N'2017-11-05 00:00:00.000' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Mod_Album] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_AlbumDetail] ON 

GO
INSERT [dbo].[Mod_AlbumDetail] ([ID], [AlbumID], [Name], [Code], [Tags], [File], [Published], [Order], [Activity]) VALUES (1, 1, N'1', NULL, NULL, N'~/Data/upload/images/TinHinhAnh/Thu-truong-Nguyen-Minh-Hong-kiem-tra-danh-gia-cac-Chuong-trinh-MTQG-tai-Quang-Binh%20(1).jpg', CAST(N'2017-11-05 00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Mod_AlbumDetail] ([ID], [AlbumID], [Name], [Code], [Tags], [File], [Published], [Order], [Activity]) VALUES (2, 1, N'2', NULL, NULL, N'~/Data/upload/images/TinHinhAnh/Thu-truong-Nguyen-Minh-Hong-kiem-tra-danh-gia-cac-Chuong-trinh-MTQG-tai-Quang-Binh%20(2).jpg', CAST(N'2017-11-05 00:00:00.000' AS DateTime), 2, 1)
GO
INSERT [dbo].[Mod_AlbumDetail] ([ID], [AlbumID], [Name], [Code], [Tags], [File], [Published], [Order], [Activity]) VALUES (3, 1, N'3', NULL, NULL, N'~/Data/upload/images/TinHinhAnh/Thu-truong-Nguyen-Minh-Hong-kiem-tra-danh-gia-cac-Chuong-trinh-MTQG-tai-Quang-Binh%20(3).jpg', CAST(N'2017-11-05 00:00:00.000' AS DateTime), 3, 1)
GO
INSERT [dbo].[Mod_AlbumDetail] ([ID], [AlbumID], [Name], [Code], [Tags], [File], [Published], [Order], [Activity]) VALUES (4, 1, N'4', NULL, NULL, N'~/Data/upload/images/TinHinhAnh/Thu-truong-Nguyen-Minh-Hong-kiem-tra-danh-gia-cac-Chuong-trinh-MTQG-tai-Quang-Binh%20(4).jpg', CAST(N'2017-11-05 00:00:00.000' AS DateTime), 4, 1)
GO
INSERT [dbo].[Mod_AlbumDetail] ([ID], [AlbumID], [Name], [Code], [Tags], [File], [Published], [Order], [Activity]) VALUES (5, 1, N'5', NULL, NULL, N'~/Data/upload/images/TinHinhAnh/Thu-truong-Nguyen-Minh-Hong-kiem-tra-danh-gia-cac-Chuong-trinh-MTQG-tai-Quang-Binh%20(5).jpg', CAST(N'2017-11-05 00:00:00.000' AS DateTime), 5, 1)
GO
INSERT [dbo].[Mod_AlbumDetail] ([ID], [AlbumID], [Name], [Code], [Tags], [File], [Published], [Order], [Activity]) VALUES (6, 1, N'6', NULL, NULL, N'~/Data/upload/images/TinHinhAnh/Thu-truong-Nguyen-Minh-Hong-kiem-tra-danh-gia-cac-Chuong-trinh-MTQG-tai-Quang-Binh%20(6).jpg', CAST(N'2017-11-05 00:00:00.000' AS DateTime), 6, 1)
GO
INSERT [dbo].[Mod_AlbumDetail] ([ID], [AlbumID], [Name], [Code], [Tags], [File], [Published], [Order], [Activity]) VALUES (7, 1, N'7', NULL, NULL, N'~/Data/upload/images/TinHinhAnh/Thu-truong-Nguyen-Minh-Hong-kiem-tra-danh-gia-cac-Chuong-trinh-MTQG-tai-Quang-Binh%20(7).jpg', CAST(N'2017-11-05 00:00:00.000' AS DateTime), 7, 1)
GO
INSERT [dbo].[Mod_AlbumDetail] ([ID], [AlbumID], [Name], [Code], [Tags], [File], [Published], [Order], [Activity]) VALUES (8, 1, N'8', NULL, NULL, N'~/Data/upload/images/TinHinhAnh/Thu-truong-Nguyen-Minh-Hong-kiem-tra-danh-gia-cac-Chuong-trinh-MTQG-tai-Quang-Binh%20(8).jpg', CAST(N'2017-11-05 00:00:00.000' AS DateTime), 8, 1)
GO
SET IDENTITY_INSERT [dbo].[Mod_AlbumDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_BaoCaoBanDauSuCo] ON 

GO
INSERT [dbo].[Mod_BaoCaoBanDauSuCo] ([ID], [BaoCaoSuCoID], [UserID], [UserID1], [MenuID], [State], [Name], [Code], [ToChuc_Ten], [ToChuc_DiaChi], [ToChuc_DienThoai], [ToChuc_Email], [NguoiLienHe_Ten], [NguoiLienHe_ChucVu], [NguoiLienHe_DienThoai], [NguoiLienHe_Email], [ChiTiet_TenDonVi], [ChiTiet_CoQuan], [ChiTiet_TenHeThong], [ChiTiet_PhanLoaiID], [ChiTiet_TenToChucCungCap], [ChiTiet_TenNCC_BenNgoai], [ChiTiet_TenNCC], [ChiTiet_MoTa], [ChiTiet_NgayGioPhatHien], [HienTrangID], [TTThem_HeDieuHanh], [TTThem_Version], [TTThem_DanhSachIP], [TTThem_DanhSachTenMien], [TTThem_MucDichSuDung], [GiuBiMat], [Content], [ThoiGianThucHien], [Published], [Published1], [Order], [Activity]) VALUES (1, 1, 17, 17, 0, 0, N'BCBDSC1', N'BCBDSC1', NULL, NULL, NULL, NULL, N'Nguyen Van AB', N'Chức vụ:', N'0949069822', N'email@gmail.com', N'Tên đơn vị vận hành hệ thống thông tin', N'Cơ quan chủ quản:', N'Tên hệ thống bị sự cố', 168, N'Tổ chức cung cấp dịch vụ an toàn thông tin (nếu có):', N'Tên nhà cung cấp dịch vụ kết nối bên ngoài (nếu có)', N'Điền tên nhà cung cấp ở đây', N'các nguy cơ dẫn đến khả năng phá hoại hoặc gián đoạn dịch vụ. Cũng vui lòng xác định mức độ nhạy cảm của thông tin liên quan ho', CAST(N'2018-08-20 00:01:00.000' AS DateTime), 185, N'Hệ điều hành', N'Version', N'ác địa chỉ IP của hệ thống (Liệt ', N'Các tên miền của hệ thống ', N' Mục đích chính sử dụng hệ thống', 0, N' nghị cung cấp tóm lược về các kiến nghị và đề xuất hỗ trợ ứng cứu (nếu có)', CAST(N'2018-08-20 00:01:00.000' AS DateTime), CAST(N'2018-08-20 00:02:34.623' AS DateTime), CAST(N'2018-08-20 00:03:46.580' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Mod_BaoCaoBanDauSuCo] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_BaoCaoSuCo] ON 

GO
INSERT [dbo].[Mod_BaoCaoSuCo] ([ID], [UserID], [UserID1], [MenuID], [State], [Name], [Code], [Address], [Phone], [Email], [Published], [Published1], [Order], [Activity]) VALUES (1, 17, 17, 254, 0, N'Tổ chức 1', N'BCSC1', N'Hà Nội', N'01663765886', N'nguyenvana@gmail.com', CAST(N'2018-08-18 17:27:58.303' AS DateTime), CAST(N'2018-08-18 17:46:37.157' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Mod_BaoCaoSuCo] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_Comment] ON 

GO
INSERT [dbo].[Mod_Comment] ([ID], [NewsID], [MenuID], [State], [HoTen], [Name], [Code], [Email], [PhoneNum], [Content], [CreateUser], [Published], [Activity]) VALUES (1, 56, 0, 0, N'lê hoàng anh', N'asdasd', NULL, N'assad@gmail.com', N'0949069822', N'<p>sadasdasdasdasdasdsds sdsdsd sdsds</p>
', 0, CAST(N'2018-08-22 23:57:44.087' AS DateTime), 1)
GO
SET IDENTITY_INSERT [dbo].[Mod_Comment] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_ConfigSendMail] ON 

GO
INSERT [dbo].[Mod_ConfigSendMail] ([ID], [MailType], [SmtpUser], [SmtpPass], [SmtpServer], [SmtpPort], [SmtpSSL], [Name], [Content], [Activity], [ToMail]) VALUES (1, 137, N'lehoanganhhd@gmail.com', N'nguoitoiyeu87', N'smtp.gmail.com', 587, 1, N'', N'', 1, N'nguoinhapcuoc_1987@yahoo.com.vn')
GO
SET IDENTITY_INSERT [dbo].[Mod_ConfigSendMail] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_CoQuan] ON 

GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (132, 48, N'Văn phòng Chủ tịch nước ', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (133, 48, N'Văn phòng Quốc hội', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (134, 48, N'Văn phòng Chính phủ', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (135, 48, N'Tòa án Nhân dân Tối cao', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (136, 48, N'Viện Kiểm sát Nhân dân Tối cao', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (137, 48, N'Bộ Thông tin và Truyền thông', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (138, 48, N'Bộ Công an', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (139, 48, N'Bộ Công thương', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (140, 48, N'Bộ Giáo dục và Đào tạo', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (141, 48, N'Bộ Giao thông Vận tải', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (142, 48, N'Bộ Khoa học và Công nghệ', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (143, 48, N'Bộ Kế hoạch và Đầu tư', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (144, 48, N'Bộ Lao động - Thương binh và Xã hội', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (145, 48, N'Bộ Nông nghiệp và Phát triển Nông thôn', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (146, 48, N'Bộ Nội vụ', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (147, 48, N'Bộ Ngoại giao', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (148, 48, N'Bộ Quốc phòng', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (149, 48, N'Bộ Tài chính', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (150, 48, N'Bộ Tài nguyên và Môi trường', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (151, 48, N'Bộ Văn hóa – Thể thao và Du lịch', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (152, 48, N'Bộ Xây dựng', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (153, 48, N'Bộ Y tế', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (154, 48, N'Ngân hàng Nhà nước Việt Nam', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (155, 48, N'Thanh tra Chính phủ', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (156, 48, N'Ủy ban Dân tộc', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (157, 48, N'Tổng cục Thể dục Thể Thao (Bộ Văn hóa, Thể thao và Du lịch)', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (158, 48, N'Ban Cơ yếu Chính phủ (Bộ Quốc Phòng)', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (159, 48, N'Ban Thi đua Chính phủ (Bộ Nội Vụ)', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (160, 48, N'Ban Tôn giáo Chính phủ (Bộ Nội vụ)', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (161, 48, N'Ban quản lý Lăng Chủ tịch Hồ Chí Minh', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (162, 48, N'Bảo hiểm Xã hội Việt Nam', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (163, 48, N'Đài Tiếng nói Việt Nam ', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (164, 48, N'Đài Truyền hình Việt Nam', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (165, 48, N'Thông tấn xã Việt Nam', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (166, 48, N'Tổng cục Du lịch (Bộ Văn hóa, Thể thao và Du lịch)', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (167, 48, N'Học viện Chính trị - Hành chính quốc gia Hồ Chí Minh', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (168, 48, N'Viện Khoa học và Công nghệ Việt Nam', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (169, 48, N'Viện Khoa học xã hội Việt Nam', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (170, 48, N'Tổng cục Thống kê (Bộ Kế hoạch và Đầu tư)', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (171, 48, N'Tổng cục Hải quan (Bộ Tài chính)', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (172, 48, N'Tổng cục Thuế (Bộ Tài chính)', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (173, 48, N'Ủy ban Chứng khoán Nhà nước (Bộ Tài chính)', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (174, 48, N'Kiểm toán Nhà nước (trực thuộc Quốc hội)', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (175, 49, N'Văn phòng Trung ương Đảng', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (176, 49, N'Ban Tổ chức Trung ương', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (177, 49, N'Ban Dân vận Trung ương', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (178, 49, N'Ban Tuyên giáo Trung ương', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (179, 49, N'Ban Đối ngoại Trung ương', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (180, 49, N'Ủy ban Kiểm tra Trung ương Đảng', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (181, 49, N'Đảng ủy Khối các doanh nghiệp Trung ương', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (182, 49, N'Đảng ủy Khối các cơ quan Kinh tế Trung ương', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (183, 50, N'Trung ương hội Cựu chiến binh Việt Nam', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (184, 50, N'Trung ương hội Nông dân Việt Nam', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (185, 50, N'Tổng Liên đoàn lao động Việt Nam', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (186, 50, N'Trung ương Đoàn Thanh niên Cộng sản Hồ Chí Minh', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (187, 50, N'Trung ương hội Liên hiệp Phụ nữ Việt Nam', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (188, 50, N'Ủy ban Trung ương Mặt trận Tổ quốc Việt Nam', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (189, 51, N'Hội đồng Nhân dân', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (190, 51, N'Ủy ban Nhân dân', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (191, 51, N'Tòa án Nhân dân', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (192, 51, N'Viện Kiểm sát Nhân dân', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (193, 51, N'Sở Thông tin và Truyền thông', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (194, 51, N'Sở Công Thương', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (195, 51, N'Sở Giáo dục và Đào tạo', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (196, 51, N'Sở Giao thông Vận tải', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (197, 51, N'Sở Khoa học - Công nghệ', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (198, 51, N'Sở Kế hoạch và Đầu tư', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (199, 51, N'Sở Lao động - Thương binh và Xã hội', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (200, 51, N'Sở Nông nghiệp và Phát triển nông thôn', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (201, 51, N'Sở Ngoại vụ', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (202, 51, N'Sở Nội vụ', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (203, 51, N'Sở Tài chính', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (204, 51, N'Sở Tài nguyên Môi trường', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (205, 51, N'Sở Tư pháp', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (206, 51, N'Sở Văn hóa Thể thao và Du lịch', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (207, 51, N'Sở Xây dựng', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (208, 51, N'Sở Y tế', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (209, 51, N'Ban Dân tộc ', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (210, 51, N'Ban Tôn giáo chính quyền (Sở Nội vụ)', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (211, 51, N'Bộ Chỉ huy Quân sự tỉnh, thành phố', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (212, 51, N'Công an tỉnh, thành phố', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (213, 51, N'Thanh tra tỉnh, thành phố', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (214, 51, N'Bảo hiểm xã hội tỉnh, thành phố', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (215, 51, N'Cục Thống kê', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (216, 51, N'Cục Hải quan', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (217, 51, N'Cục Thuế', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (218, 51, N'Chi cục Kiểm lâm', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (219, 51, N'Đài phát thanh, truyền hỉnh tỉnh, thành phố', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (220, 51, N'Kho bạc Nhà nước tỉnh, thành phố', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (221, 51, N'Ngân hàng Nhà nước tỉnh, thành phố', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (222, 51, N'Phân viện Chính trị quốc gia Hồ Chí Minh tỉnh, thành phố', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (223, 52, N'Ban Dân vận', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (224, 52, N'Ban Kiểm tra Đảng', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (225, 52, N'Phòng tài chính quản trị (thuộc Văn phòng Tỉnh ủy)', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (226, 52, N'Ban Tổ chức Đảng', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (227, 52, N'Ban Tuyên giáo', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (228, 52, N'Văn phòng Tỉnh ủy, Thành ủy', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (229, 53, N'Hội Cựu chiến binh tỉnh, thành phố', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (230, 53, N'Hội Nông dân tỉnh, thành phố', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (231, 53, N'Hội liên hiệp Phụ nữ tỉnh, thành phố', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (232, 53, N'Liên đoàn lao động tỉnh, thành phố', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (233, 53, N'Mặt trận Tổ quốc tỉnh, thành phố', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (234, 53, N'Tỉnh đoàn, thành đoàn Thanh niên Cộng sản Hồ Chí Minh', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (235, 55, N'Văn phòng Hội đồng Nhân dân - Ủy ban Nhân dân', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (236, 55, N'Tòa án Nhân dân', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (237, 55, N'Viện kiểm sát Nhân dân', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (238, 55, N'Phòng Tài chính', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (239, 55, N'Phòng Kế hoạch, Kinh tế', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (240, 55, N'Phòng Xây dựng Đô thị', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (241, 55, N'Phòng Tài nguyên Môi trường', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (242, 55, N'Phòng Văn hóa Thể thao', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (243, 55, N'Phòng Lao động Thương binh Xã hội', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (244, 55, N'Phòng Giáo dục', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (245, 55, N'Phòng Nội vụ', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (246, 55, N'Phòng Y tế', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (247, 55, N'Phòng Tư pháp', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (248, 55, N'Thanh tra quận/huyện', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (249, 55, N'Ban Quản lý Dự án', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (250, 55, N'Công an quận/huyện', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (251, 55, N'Bảo hiểm Xã hội quận/huyện', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (252, 55, N'Chi Cục Thuế', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (253, 55, N'Chi cục Thống kê', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (254, 55, N'Kho bạc Nhà nước quận/huyện', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (255, 55, N'Ngân hàng Nhà nước quận/huyện ', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (256, 56, N'Văn phòng Quận ủy/Huyện ủy (phiếu điều tra thực hiện chung cho các Ban của Đảng ở cấp quận, huyện)', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (257, 57, N'Hội Cựu chiến binh ', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (258, 57, N'Hội Nông dân ', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (259, 57, N'Hội Phụ nữ ', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (260, 57, N'Liên đoàn lao động ', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (261, 57, N'Mặt trận Tổ quốc ', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
INSERT [dbo].[Mod_CoQuan] ([ID], [MenuID], [Name], [Code], [Published], [Order], [Activity]) VALUES (262, 57, N'Quận đoàn/Huyện đoàn Thanh niên Cộng sản Hồ Chí Minh', NULL, CAST(N'2017-09-24 00:00:00.000' AS DateTime), NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Mod_CoQuan] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_DuThao] ON 

GO
INSERT [dbo].[Mod_DuThao] ([ID], [Name], [Code], [Content], [File], [StartDate], [FinishDate], [Published], [Order], [Activity]) VALUES (1, N'Dự thảo Thông tư quy định sử dụng chữ ký số cho văn bản điện tử trong cơ quan nhà nước ', N'Du-thao-Thong-tu-quy-dinh-su-dung-chu-ky-so-cho-van-ban-dien-tu-trong-co-quan-nha-nuoc', N'', N'~/Data/upload/files/DuThao/D%E1%BB%B1-th%E1%BA%A3o-TTCKS.rar', CAST(N'2017-06-28 00:00:00.000' AS DateTime), CAST(N'2017-08-28 00:00:00.000' AS DateTime), CAST(N'2017-08-24 00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Mod_DuThao] ([ID], [Name], [Code], [Content], [File], [StartDate], [FinishDate], [Published], [Order], [Activity]) VALUES (2, N'Dự thảo Thông tư ban hành giá cước sử dụng dịch vụ mạng truyền số liệu chuyên dùng của các cơ quan Đảng và Nhà nước', N'Du-thao-Thong-tu-ban-hanh-gia-cuoc-su-dung-dich-vu-mang-truyen-so-lieu-chuyen-dung-cua-cac-co-quan-Dang-va-Nha-nuoc', N'<div>
<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td style="vertical-align:top">
			<div style="text-align:center"><strong>BỘ TH&Ocirc;NG TIN V&Agrave; TRUYỀN TH&Ocirc;NG</strong></div>
			</td>
			<td style="vertical-align:top">
			<div style="text-align:center"><strong>CỘNG HO&Agrave; X&Atilde; HỘI CHỦ NGHĨA VIỆT NAM</strong></div>

			<div style="text-align:center"><strong>Độc lập - Tự do - Hạnh ph&uacute;c</strong></div>
			</td>
		</tr>
		<tr>
			<td style="vertical-align:top">
			<div style="text-align:center">Số:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /2017/TT-BTTTT</div>
			</td>
			<td style="vertical-align:top">
			<div style="text-align:center"><em>&nbsp;H&agrave; Nội, ng&agrave;y &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;th&aacute;ng &nbsp;&nbsp;&nbsp;&nbsp;năm 2017</em></div>
			</td>
		</tr>
	</tbody>
</table>
</div>

<table cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td>
			<div>
			<div style="text-align:center"><strong>DỰ THẢO LẦN 1</strong></div>
			</div>
			</td>
		</tr>
	</tbody>
</table>

<div><strong>&nbsp;</strong></div>

<div style="text-align:center"><strong>TH&Ocirc;NG TƯ</strong></div>

<div><strong>&nbsp;</strong></div>

<div><strong>&nbsp;Ban h&agrave;nh gi&aacute; cước sử dụng dịch vụ mạng truyền số liệu chuy&ecirc;n d&ugrave;ng</strong></div>

<div><strong>của c&aacute;c cơ quan Đảng v&agrave; Nh&agrave; nước</strong></div>

<div><em>&nbsp;</em></div>

<div><em>Căn cứ Luật C&ocirc;ng nghệ Th&ocirc;ng tin ng&agrave;y 29 th&aacute;ng 6 năm 2006;</em></div>

<div><em>Căn cứ Luật Viễn th&ocirc;ng ng&agrave;y 23 th&aacute;ng 11 năm 2009;</em></div>

<div><em>Căn cứ Luật Gi&aacute; ng&agrave;y 20 th&aacute;ng 6 năm 2012;</em></div>

<div><em>Căn cứ Luật An to&agrave;n th&ocirc;ng tin mạng ng&agrave;y 19 th&aacute;ng 11 năm 2015;</em></div>

<div><em>Căn cứ Nghị định số 17/2017/NĐ-CP ng&agrave;y 17 th&aacute;ng 02 năm 2017 của Ch&iacute;nh phủ quy định chức năng, nhiệm vụ, quyền hạn v&agrave; cơ cấu tổ chức của Bộ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng;</em></div>

<div><em>Căn cứ Quyết định số 39/2007/QĐ-TTg ng&agrave;y 21 th&aacute;ng 3 năm 2007 của Thủ tướng Ch&iacute;nh phủ về quản l&yacute; gi&aacute; cước dịch vụ bưu ch&iacute;nh, viễn th&ocirc;ng;</em></div>

<div><em>Căn cứ Quyết định số 632/QĐ-TTg ng&agrave;y 10 th&aacute;ng 5 năm 2017 của Thủ tướng Ch&iacute;nh phủ Ban h&agrave;nh Danh mục lĩnh vực quan trọng cần ưu ti&ecirc;n an to&agrave;n th&ocirc;ng tin mạng v&agrave; hệ thống th&ocirc;ng tin quan trọng quốc gia;</em></div>

<div><em>Theo đề nghị của Cục trưởng Cục Bưu điện Trung ương,</em></div>

<div><em>Bộ trưởng Bộ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng ban h&agrave;nh Th&ocirc;ng tư Ban h&agrave;nh gi&aacute; cước sử dụng dịch vụ Mạng Truyền số liệu chuy&ecirc;n d&ugrave;ng của c&aacute;c cơ quan Đảng v&agrave; Nh&agrave; nước.</em></div>

<div><strong>&nbsp;</strong></div>

<div><strong>CHƯƠNG I</strong></div>

<div><strong>C&Aacute;C QUY ĐỊNH CHUNG</strong></div>

<div><strong>Điều 1.</strong><strong>&nbsp;Phạm vi điều chỉnh</strong></div>

<div>&nbsp;</div>

<div>Th&ocirc;ng tư n&agrave;y quy định gi&aacute; cước sử dụng dịch vụ tr&ecirc;n mạng Truyền số liệu chuy&ecirc;n d&ugrave;ng của c&aacute;c cơ quan Đảng v&agrave; Nh&agrave; nước. Trong đ&oacute;:</div>

<div>-&nbsp;Quy định gi&aacute; cước dịch vụ gi&aacute; trị gia tăng, dịch vụ c&ocirc;ng th&ecirc;m với c&aacute;c đối tượng sử dụng mạng truyền số liệu chuy&ecirc;n d&ugrave;ng cấp I.</div>

<div>-&nbsp;Quy định gi&aacute; cước dịch vụ cơ bản, dịch vụ gi&aacute; trị gia tăng, dịch vụ c&ocirc;ng th&ecirc;m với c&aacute;c đối tượng sử dụng mạng truyền số liệu chuy&ecirc;n d&ugrave;ng cấp II.</div>

<div>...</div>
', N'~/Data/upload/files/DuThao/D%E1%BB%B1-th%E1%BA%A3o-TT-CUCB%C4%90TW.rar', CAST(N'2017-06-30 00:00:00.000' AS DateTime), CAST(N'2017-08-30 00:00:00.000' AS DateTime), CAST(N'2017-08-24 00:31:51.713' AS DateTime), 2, 1)
GO
INSERT [dbo].[Mod_DuThao] ([ID], [Name], [Code], [Content], [File], [StartDate], [FinishDate], [Published], [Order], [Activity]) VALUES (3, N'Dự thảo Luật hành chính công ', N'Du-thao-Luat-hanh-chinh-cong', N'<table border="0" cellpadding="5" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td style="vertical-align:top">
			<div style="text-align:center"><strong>QUỐC HỘI</strong></div>

			<div style="text-align:center"><strong>---------</strong></div>

			<div style="text-align:center">Luật số: &hellip;&hellip;/2018/QH14</div>
			</td>
			<td style="vertical-align:top">
			<div style="text-align:center"><strong>CỘNG HO&Agrave; X&Atilde; HỘI CHỦ NGHĨA VIỆT NAM</strong></div>

			<div style="text-align:center"><strong>Độc lập - Tự do - Hạnh ph&uacute;c</strong></div>

			<div style="text-align:center"><strong>-------------------------------------</strong></div>

			<div style="float:right; text-align:center"><em>&nbsp;</em></div>

			<div style="float:right; text-align:center">&nbsp;</div>
			</td>
		</tr>
	</tbody>
</table>

<div><em>&nbsp;(Dự thảo ng&agrave;y 12/7/2017)</em></div>

<div>&nbsp;</div>

<div style="text-align:center"><strong>LUẬT</strong></div>

<div style="text-align:center"><strong>&nbsp;H&Agrave;NH CH&Iacute;NH C&Ocirc;NG </strong></div>

<div><strong>&nbsp;</strong></div>

<div>Căn cứ Hiến ph&aacute;p nước Cộng ho&agrave; x&atilde; hội chủ nghĩa Việt Nam năm 2013.</div>

<div>Quốc hội ban h&agrave;nh Luật h&agrave;nh ch&iacute;nh c&ocirc;ng.</div>

<div>&nbsp;</div>

<div><strong>Chương </strong><strong>I</strong></div>

<div><strong>NHỮNG QUY ĐỊNH CHUNG</strong></div>

<div style="text-align:justify"><strong>&nbsp;</strong></div>

<div style="text-align:justify"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong><strong>Điều 1. Phạm vi điều chỉnh</strong></div>

<div style="text-align:justify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Luật n&agrave;y quy định nguy&ecirc;n tắc chung của h&agrave;nh ch&iacute;nh c&ocirc;ng; thủ tục h&agrave;nh ch&iacute;nh c&ocirc;ng; quản l&yacute; dịch vụ c&ocirc;ng v&agrave; cung ứng dịch vụ h&agrave;nh ch&iacute;nh c&ocirc;ng; cải c&aacute;ch h&agrave;nh ch&iacute;nh v&agrave; x&acirc;y dựng ch&iacute;nh phủ điện tử; kiểm so&aacute;t h&agrave;nh ch&iacute;nh c&ocirc;ng<em>;</em> mối quan hệ v&agrave; tr&aacute;ch nhiệm của cơ quan, tổ chức, c&aacute; nh&acirc;n trong thực hiện h&agrave;nh ch&iacute;nh c&ocirc;ng. &nbsp;</div>

<div style="text-align:justify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <strong>Điều 2. Đối tượng &aacute;p dụng </strong></div>

<div style="text-align:justify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Luật n&agrave;y &aacute;p dụng đối với cơ quan, tổ chức, c&aacute; nh&acirc;n c&oacute; li&ecirc;n quan trong thực hiện h&agrave;nh ch&iacute;nh c&ocirc;ng.</div>

<div style="text-align:justify"><strong>Điều 3. Giải th&iacute;ch từ ngữ</strong></div>

<div style="text-align:justify">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Trong Luật n&agrave;y, c&aacute;c từ ngữ được hiểu như sau:</div>

<div style="text-align:justify"><strong><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 1. H&agrave;nh ch&iacute;nh c&ocirc;ng</em></strong> l&agrave; hoạt động của cơ quan, tổ chức, c&aacute; nh&acirc;n c&oacute; thẩm quyền sử dụng nguồn lực c&ocirc;ng để thực hiện nhiệm vụ quản l&yacute; nh&agrave; nước, cung cấp dịch vụ h&agrave;nh ch&iacute;nh c&ocirc;ng theo quy định của ph&aacute;p luật.</div>

<div style="text-align:justify"><strong><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 2.</em></strong><strong> <em>Dịch vụ c&ocirc;ng</em> </strong>l&agrave; hoạt động phục vụ lợi &iacute;ch chung thiết yếu do tổ chức, c&aacute; nh&acirc;n c&oacute; thẩm quyền thực hiện theo quy định của ph&aacute;p luật, bảo đảm c&aacute;c quyền, nghĩa vụ, lợi &iacute;ch hợp ph&aacute;p của c&aacute; nh&acirc;n, tổ chức; gồm dịch vụ h&agrave;nh ch&iacute;nh c&ocirc;ng, dịch vụ sự nghiệp c&ocirc;ng v&agrave; dịch vụ c&ocirc;ng &iacute;ch.</div>

<div style="text-align:justify"><strong><em>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp; 3. Nguồn lực c&ocirc;ng</em></strong> bao gồm t&agrave;i sản c&ocirc;ng v&agrave; nguồn nh&acirc;n lực c&ocirc;ng.</div>

<div style="text-align:justify"><strong><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.</em></strong> <strong><em>Nguồn nh&acirc;n lực c&ocirc;ng</em></strong> l&agrave; c&aacute;n bộ, c&ocirc;ng chức, vi&ecirc;n chức v&agrave; người được giao thực hiện nhiệm vụ theo hợp đồng h&agrave;nh ch&iacute;nh. &nbsp;</div>

<div style="text-align:justify"><strong><em>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 5. </em></strong><strong><em>Thủ tục h&agrave;nh ch&iacute;nh</em></strong><strong><em> c&ocirc;ng </em></strong>l&agrave; tr&igrave;nh tự, c&aacute;ch thức thực hiện, hồ sơ v&agrave; c&aacute;c điều kiện bảo đảm được quy định trong văn bản quy phạm ph&aacute;p luật để cơ quan nh&agrave; nước, người c&oacute; thẩm quyền giải quyết c&ocirc;ng việc cụ thể li&ecirc;n quan đến c&aacute; nh&acirc;n, tổ chức.</div>

<p style="text-align:justify">---------------------------------</p>
', N'~/Data/upload/files/DuThao/dtLuatHCC-12_7_2017-.doc', CAST(N'2017-07-05 00:00:00.000' AS DateTime), CAST(N'2017-08-05 00:00:00.000' AS DateTime), CAST(N'2017-08-24 00:33:54.903' AS DateTime), 3, 1)
GO
INSERT [dbo].[Mod_DuThao] ([ID], [Name], [Code], [Content], [File], [StartDate], [FinishDate], [Published], [Order], [Activity]) VALUES (4, N'Dự thảo Thông tư hướng dẫn chi tiết quản lý xuất bản và phát hành xuất bản phẩm điện tử', N'Du-thao-Thong-tu-huong-dan-chi-tiet-quan-ly-xuat-ban-va-phat-hanh-xuat-ban-pham-dien-tu', N'<table border="0" cellpadding="0" cellspacing="0" style="width:100%">
	<tbody>
		<tr>
			<td style="vertical-align:top">
			<div style="text-align:center"><strong>BỘ TH&Ocirc;NG TIN V&Agrave; TRUYỀN TH&Ocirc;NG</strong><br />
			&nbsp;</div>

			<div style="text-align:center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Số:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /2017/TT-BTTTT</div>
			</td>
			<td style="vertical-align:top">
			<div style="text-align:center"><strong>CỘNG H&Ograve;A X&Atilde; HỘI CHỦ NGHĨA VIỆT NAM<br />
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Độc lập - Tự do - Hạnh ph&uacute;c </strong><br />
			&nbsp;</div>

			<div><em>H&agrave; Nội, ng&agrave;y&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;th&aacute;ng&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; năm 2017</em></div>
			</td>
		</tr>
	</tbody>
</table>

<div><strong><u>Dự thảo 2</u></strong></div>

<div><strong>TH&Ocirc;NG TƯ</strong></div>

<div><strong>Th&ocirc;ng tư hướng dẫn chi tiết quản l&yacute; xuất bản v&agrave; ph&aacute;t h&agrave;nh xuất bản phẩm điện tử</strong></div>

<p>&nbsp;</p>

<div><em>Căn cứ Luật Xuất bản ng&agrave;y 20 th&aacute;ng 11 năm 2012;</em></div>

<div><em>Căn cứ Nghị định số 195/2013/NĐ-CP ng&agrave;y 21 th&aacute;ng 11 năm 2013 của Ch&iacute;nh phủ quy định chi tiết một số điều v&agrave; biện ph&aacute;p thi h&agrave;nh Luật Xuất bản;</em></div>

<div><em>Căn cứ Nghị định số 17/2017/NĐ-CP ng&agrave;y 17 th&aacute;ng 02 năm 2017 của Ch&iacute;nh phủ quy định chức năng, nhiệm vụ, quyền hạn v&agrave; cơ cấu tổ chức của Bộ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng;</em></div>

<div><em>Theo đề nghị của Cục trưởng Cục Xuất bản, In v&agrave; Ph&aacute;t h&agrave;nh;</em></div>

<div><em>Bộ trưởng Bộ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng ban h&agrave;nh Th&ocirc;ng tư hướng dẫn chi tiết quản l&yacute; xuất bản v&agrave; ph&aacute;t h&agrave;nh xuất bản phẩm điện tử.</em></div>

<div>&nbsp;</div>

<div><strong>Chương I</strong></div>

<div><strong>QUY ĐỊNH CHUNG</strong></div>

<div><strong>Điều 1. Phạm vi điều chỉnh</strong></div>

<div>1. Th&ocirc;ng tư n&agrave;y hướng dẫn chi tiết việc lập, thẩm định đề &aacute;n v&agrave; quản l&yacute; &nbsp;&nbsp;hoạt động xuất bản, ph&aacute;t h&agrave;nh xuất bản phẩm điện tử, gồm:</div>

<div>a) Xuất bản phẩm điện tử của nh&agrave; xuất bản được xuất bản, ph&aacute;t h&agrave;nh tr&ecirc;n c&aacute;c phương tiện điện tử (m&ocirc;i trường mạng viễn th&ocirc;ng, Internet v&agrave; c&aacute;c thiết bị điện tử);</div>

<div>b) T&aacute;c phẩm, t&agrave;i liệu của cơ quan, tổ chức, c&aacute; nh&acirc;n c&oacute; nội dung về ch&iacute;nh trị, ngoại giao, kinh tế, lịch sử, t&ocirc;n gi&aacute;o, địa l&yacute;, văn h&oacute;a, x&atilde; hội, gi&aacute;o dục, khoa học, c&ocirc;ng nghệ, văn học, nghệ thuật ph&aacute;t h&agrave;nh tr&ecirc;n c&aacute;c phương tiện điện tử (m&ocirc;i trường mạng viễn th&ocirc;ng, Internet v&agrave; c&aacute;c thiết bị điện tử) nhằm mục đ&iacute;ch kinh doanh, tuy&ecirc;n truyền, phổ biến đến nhiều người.</div>

<div>2. &nbsp;T&aacute;c phẩm, t&agrave;i liệu quy định tại Điểm b Khoản 1 Điều n&agrave;y được đăng ph&aacute;t tr&ecirc;n b&aacute;o điện tử, trang th&ocirc;ng tin điện tử tổng hợp, mạng x&atilde; hội v&agrave; blog c&aacute; nh&acirc;n thực hiện theo quy định của ph&aacute;p luật về cung cấp th&ocirc;ng tin tr&ecirc;n mạng viễn th&ocirc;ng, Internet.</div>

<div><strong>Điều 2. Đối tượng &aacute;p dụng</strong></div>

<div>1. C&aacute;c cơ quan quản l&yacute; nh&agrave; nước c&oacute; li&ecirc;n quan về hoạt động xuất bản, ph&aacute;t h&agrave;nh xuất bản phẩm điện tử.</div>

<div>2. Nh&agrave; xuất bản tham gia xuất bản; tổ chức, c&aacute; nh&acirc;n tham gia ph&aacute;t h&agrave;nh xuất bản phẩm điện tử, t&aacute;c phẩm, t&agrave;i liệu quy định tại Điểm b Khoản 1 Điều 1 Th&ocirc;ng tư n&agrave;y tr&ecirc;n m&ocirc;i trường mạng viễn th&ocirc;ng, Internet v&agrave; c&aacute;c thiết bị điện tử.</div>

<div>...</div>
', N'~/Data/upload/files/DuThao/Du-thaoTT-CUCXB.doc', CAST(N'2017-08-16 00:00:00.000' AS DateTime), CAST(N'2018-09-16 00:00:00.000' AS DateTime), CAST(N'2017-10-08 19:01:00.070' AS DateTime), 4, 1)
GO
SET IDENTITY_INSERT [dbo].[Mod_DuThao] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_EmailTemplate] ON 

GO
INSERT [dbo].[Mod_EmailTemplate] ([ID], [MenuID], [Name], [Code], [Subject], [Content], [Order], [Activity]) VALUES (1, 244, N'Loại 1', N'Type1', N'Đề nghị xử lý sự cố trên dịch vụ của {0}', N'<p><span style="font-size:14px"><span style="font-family:Arial,Helvetica,sans-serif"><span style="background-color:white"><span style="color:black">K&iacute;nh gửi {0}</span></span><br />
<span style="background-color:white"><span style="color:black">Trung t&acirc;m Ứng cứu khẩn cấp m&aacute;y t&iacute;nh Việt Nam, Bộ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng (VNCERT) ghi nhận, hiện c&oacute; những domain</span></span></span></span></p>

<p><span style="font-size:14px"><span style="font-family:Arial,Helvetica,sans-serif"><span style="background-color:white"><span style="color:black">{1}</span></span></span></span></p>

<p style="margin-left:0in; margin-right:0in; text-align:justify"><span style="font-size:14px"><span style="font-family:Arial,Helvetica,sans-serif"><span style="background-color:white">IP n&agrave;y&nbsp; thu<span style="color:black">ộc </span></span>{0}<br />
<br />
<span style="color:black"><span style="background-color:white">Thực hiện Quyết định số 05/2017/QĐ-TTg của Thủ tướng Ch&iacute;nh phủ v&agrave; Th&ocirc;ng tư số 20/2017/TT-BTTTT </span></span><span style="background-color:white">ng&agrave;y&nbsp;12/9/2017 của <span style="color:black">Bộ trưởng Bộ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng quy định điều phối, ứng cứu sự cố an to&agrave;n th&ocirc;ng tin mạng tr&ecirc;n to&agrave;n quốc, Trung t&acirc;m VNCERT đề nghị Qu&yacute; C&ocirc;ng ty xử l&yacute; sự cố {2}{3}</span> <span style="color:black">trong v&ograve;ng 24 giờ kể từ khi nhận được Email n&agrave;y nhằm ngăn chặn website cố {4}.</span></span><br />
<br />
<span style="color:black"><span style="background-color:white">Sau khi ho&agrave;n th&agrave;nh việc x&oacute;a c&aacute;c website cố {4}</span></span><span style="background-color:white"><span style="color:black">, đề nghị C&ocirc;ng ty gửi b&aacute;o c&aacute;o kết th&uacute;c sự cố (ban h&agrave;nh k&egrave;m theo Th&ocirc;ng tư số 20/2017/TT-BTTTT, c&oacute; thể tải tại địa chỉ:</span></span><span style="color:#0563c1"><u><span style="background-color:white"><span style="color:#005a95"><a href="http://vncert.vn/" style="color:#0563c1; text-decoration:underline" target="_blank"><span style="color:#005a95">http://vncert.vn</span></a></span></span></u></span><span style="background-color:white"><span style="color:black">) về Đầu mối tiếp nhận sự cố của Trung t&acirc;m VNCERT qua địa chỉ&nbsp;</span></span><span style="color:#0563c1"><u><span style="background-color:white"><span style="color:#005a95"><a href="mailto:ir@vncert.vn" style="color:#0563c1; text-decoration:underline" target="_blank"><span style="color:#005a95">ir@vncert.vn</span></a></span></span></u></span><br />
<br />
<span style="color:black"><span style="background-color:white">Cảm ơn sự hợp t&aacute;c của Qu&yacute; C&ocirc;ng ty.</span></span></span></span></p>

<p><span style="font-size:14px"><span style="font-family:Arial,Helvetica,sans-serif"><span style="background-color:white"><span style="color:black">--------------------------------------------<br />
Nguyen Thanh Chuong (Mr)<br />
VNCERT, MIC<br />
Mobile:&nbsp;</span></span><span style="color:#0563c1"><u><span style="background-color:white"><span style="color:#005a95"><a href="callto:+84%2091%208228%20754" style="color:#0563c1; text-decoration:underline" target="_blank"><span style="color:#005a95">+84 91 8228 754</span></a></span></span></u></span><span style="background-color:white"><span style="color:black">&nbsp;&nbsp;<br />
Website:&nbsp;</span></span><span style="color:#0563c1"><u><span style="background-color:white"><span style="color:#005a95"><a href="http://www.vncert.gov.vn/" style="color:#0563c1; text-decoration:underline" target="_blank"><span style="color:#005a95">www.vncert.gov.vn</span></a></span></span></u></span></span></span></p>

<p>&nbsp;</p>
', 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Mod_EmailTemplate] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_Feedback] ON 

GO
INSERT [dbo].[Mod_Feedback] ([ID], [Name], [Address], [Phone], [Mobile], [Email], [Title], [Content], [IP], [Created]) VALUES (1, N'Lê Hoàng Anh', NULL, N'0949069822', N'0949069822', N'lehoanganhhd@gmail.com', N'Test liên hệ', N'Nội dung liên hệ....', N'::1', CAST(N'2017-06-25 15:43:57.307' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Mod_Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_GopY] ON 

GO
INSERT [dbo].[Mod_GopY] ([ID], [DuThaoID], [Name], [Address], [Phone], [Mobile], [Email], [Title], [Content], [Files], [IP], [Published], [Order], [Activity]) VALUES (3, 3, N'Nguyễn Thị Hương', NULL, NULL, NULL, N'shophoatphcm@gmail.com', N'Góp ý dự thảo: Dự thảo Luật hành chính công', N'<p>Dự thảo Luật h&agrave;nh ch&iacute;nh c&ocirc;ng n&ecirc;n được ban h&agrave;nh để nh&acirc;n d&acirc;n hiểu r&otilde; quyền v&agrave; tr&aacute;ch nhiệm đối với nh&agrave; nước đồng thời ng&agrave;y c&agrave;ng n&acirc;ng cao chất lượng phục vụ của đảng v&agrave; nh&agrave; nước đối với nh&acirc;n d&acirc;n<a href="https://hoatuoishop.net/danh-muc/vong-hoa-tang-le/">.</a> Th&uacute;c đảy hơn nữa sự ph&aacute;t triển xa hội trong tương lai c&ocirc;ng cuộc đổi mới đất nước<a href="https://hoatuoishop.net/">.</a></p>
', NULL, N'::1', CAST(N'2017-08-25 15:52:20.993' AS DateTime), 0, 1)
GO
INSERT [dbo].[Mod_GopY] ([ID], [DuThaoID], [Name], [Address], [Phone], [Mobile], [Email], [Title], [Content], [Files], [IP], [Published], [Order], [Activity]) VALUES (4, 2, N'Lê Minh Tâm', NULL, NULL, NULL, N'phungnguyen1003@gmail.com', N'Góp ý dự thảo: Dự thảo Thông tư ban hành giá cước sử dụng dịch vụ mạng truyền số liệu chuyên dùng của các cơ quan Đảng và Nhà nước', N'<p>T&ocirc;i nghĩ n&ecirc;n l&agrave;m điều n&agrave;y một c&aacute;ch nhanh ch&oacute;ng v&igrave; n&oacute; sẽ mang đến sự phục vụ v&agrave; động th&aacute;i gần gũi với d&acirc;n hơn, n&acirc;ng cao sự phục vụ v&agrave; tr&aacute;ch nhiệm của nh&agrave; được đối với d&acirc;n<a href="https://hoatuoishop.net/danh-muc/hoa-tang-sinh-nhat/">,</a> để d&acirc;n hiểu được những lợi &iacute;ch v&agrave; quyền phục vụ đất nước của mỗi người<a href="https://hoatuoishop.net/danh-muc/vong-hoa-tang-le/">.</a></p>', NULL, N'::1', CAST(N'2017-08-25 16:16:38.813' AS DateTime), 0, 1)
GO
INSERT [dbo].[Mod_GopY] ([ID], [DuThaoID], [Name], [Address], [Phone], [Mobile], [Email], [Title], [Content], [Files], [IP], [Published], [Order], [Activity]) VALUES (21, 3, N'Sản phẩm đặc biệt', NULL, NULL, NULL, N'sdfsd@sdf.gh', N'Góp ý dự thảo: Dự thảo Luật hành chính công ', N'<p>sd fsdfds fdsf</p>', N'E:\JOB\ITT\Demo\HL.Website\\Data\upload\files\GopY\3\sdfsd_sdf.gh\2017827_21524\sdfsd_sdf.gh_2017827_21524.zip', N'::1', CAST(N'2017-08-27 21:52:04.017' AS DateTime), 0, 0)
GO
INSERT [dbo].[Mod_GopY] ([ID], [DuThaoID], [Name], [Address], [Phone], [Mobile], [Email], [Title], [Content], [Files], [IP], [Published], [Order], [Activity]) VALUES (22, 4, N'Lê Hoàng Anh', NULL, NULL, NULL, N'lehoanganhhd@gmail.com', N'Góp ý dự thảo: Dự thảo Thông tư hướng dẫn chi tiết quản lý xuất bản và phát hành xuất bản phẩm điện tử', N'<p>T&ocirc;i test g&oacute;p &yacute;...</p>', N'/Data/upload/files/GopY/4/lehoanganhhd_gmail.com/2017108_20256/Lenh hay ve Dos.txt', N'::1', CAST(N'2017-10-08 20:02:56.207' AS DateTime), 0, 1)
GO
INSERT [dbo].[Mod_GopY] ([ID], [DuThaoID], [Name], [Address], [Phone], [Mobile], [Email], [Title], [Content], [Files], [IP], [Published], [Order], [Activity]) VALUES (23, 4, N'Lê Hoàng Anh', NULL, NULL, NULL, N'lehoanganhhd@gmail.com', N'Góp ý dự thảo: Dự thảo Thông tư hướng dẫn chi tiết quản lý xuất bản và phát hành xuất bản phẩm điện tử', N'<p>Test g&oacute;p &yacute; lần 2....</p>', N'/Data/upload/files/GopY/4/lehoanganhhd_gmail.com/2017108_20844/lehoanganhhd_gmail.com_2017108_20844.zip', N'::1', CAST(N'2017-10-08 20:08:44.637' AS DateTime), 0, 1)
GO
INSERT [dbo].[Mod_GopY] ([ID], [DuThaoID], [Name], [Address], [Phone], [Mobile], [Email], [Title], [Content], [Files], [IP], [Published], [Order], [Activity]) VALUES (24, 4, N'Nguyen Van A', NULL, NULL, NULL, N'nguyenvana@gmail.com', N'Góp ý dự thảo: Dự thảo Thông tư hướng dẫn chi tiết quản lý xuất bản và phát hành xuất bản phẩm điện tử', N'<p>Toi dong gop y kien nhu sau:</p><p>abc xyz....</p>', N'/Data/upload/files/GopY/4/nguyenvana_gmail.com/2018722_235641/nguyenvana_gmail.com_2018722_235641.zip', N'::1', CAST(N'2018-07-22 23:56:41.510' AS DateTime), 0, 1)
GO
SET IDENTITY_INSERT [dbo].[Mod_GopY] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_Incident] ON 

GO
INSERT [dbo].[Mod_Incident] ([ID], [ParentID], [MenuID], [State], [Name], [Code], [Path], [FakeDestination], [Source], [AttackOn], [IP], [ISP], [EmailNo], [Attacker], [MalwareName], [AttackerIP], [NetworkName], [LocalIP], [LocalTCPPort], [Timestamp], [ASN], [Geo], [Url], [Type], [HttpAgent], [SrcPort], [HostName], [Destinationport], [Protocol], [ServerName], [Server], [Header], [Tag], [Region], [City], [Sector], [Published], [Order], [Resolve], [Activity], [ChildNum]) VALUES (7, NULL, 191, 0, N'http://somaco.vn', N'httpsomacovn', N'somaco.vn', NULL, N'defacer.id', CAST(N'2018-01-31 07:17:00.000' AS DateTime), N'112.78.2.130', N'Online data services', 0, N'4RNN0Ts', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-14 00:17:28.530' AS DateTime), 0, 1, 1, 0)
GO
INSERT [dbo].[Mod_Incident] ([ID], [ParentID], [MenuID], [State], [Name], [Code], [Path], [FakeDestination], [Source], [AttackOn], [IP], [ISP], [EmailNo], [Attacker], [MalwareName], [AttackerIP], [NetworkName], [LocalIP], [LocalTCPPort], [Timestamp], [ASN], [Geo], [Url], [Type], [HttpAgent], [SrcPort], [HostName], [Destinationport], [Protocol], [ServerName], [Server], [Header], [Tag], [Region], [City], [Sector], [Published], [Order], [Resolve], [Activity], [ChildNum]) VALUES (8, NULL, 191, 0, N'http://htec.edu.vn', N'httphteceduvn', N'htec.edu.vn', NULL, N'defacer.id', CAST(N'2018-01-31 09:38:00.000' AS DateTime), N'150.95.111.85', N'Gmo Runsystem Jsc', 0, N'Aphrodite_army', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-14 00:17:28.530' AS DateTime), 1, 1, 1, 0)
GO
INSERT [dbo].[Mod_Incident] ([ID], [ParentID], [MenuID], [State], [Name], [Code], [Path], [FakeDestination], [Source], [AttackOn], [IP], [ISP], [EmailNo], [Attacker], [MalwareName], [AttackerIP], [NetworkName], [LocalIP], [LocalTCPPort], [Timestamp], [ASN], [Geo], [Url], [Type], [HttpAgent], [SrcPort], [HostName], [Destinationport], [Protocol], [ServerName], [Server], [Header], [Tag], [Region], [City], [Sector], [Published], [Order], [Resolve], [Activity], [ChildNum]) VALUES (9, NULL, 191, 0, N'http://congtynamlimxanh.vn/index.html', N'httpcongtynamlimxanhvnindexhtml', N'congtynamlimxanh.vn', NULL, N'defacer.id', CAST(N'2018-01-31 21:21:00.000' AS DateTime), N'210.211.116.150', N'Viettel - CHT Company', 0, N'ANTI-HERO', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-14 00:17:28.530' AS DateTime), 2, 0, 1, 0)
GO
INSERT [dbo].[Mod_Incident] ([ID], [ParentID], [MenuID], [State], [Name], [Code], [Path], [FakeDestination], [Source], [AttackOn], [IP], [ISP], [EmailNo], [Attacker], [MalwareName], [AttackerIP], [NetworkName], [LocalIP], [LocalTCPPort], [Timestamp], [ASN], [Geo], [Url], [Type], [HttpAgent], [SrcPort], [HostName], [Destinationport], [Protocol], [ServerName], [Server], [Header], [Tag], [Region], [City], [Sector], [Published], [Order], [Resolve], [Activity], [ChildNum]) VALUES (10, 9, 191, 0, N'http://congtynamlimxanh.vn/index.html', N'httpcongtynamlimxanhvnindexhtml', N'http://congtynamlimxanh.vn/index.html', NULL, N'defacer.id', CAST(N'2018-01-31 21:21:00.000' AS DateTime), N'210.211.116.150', N'Viettel - CHT Company', 0, N'ANTI-HERO', NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2018-07-14 00:17:28.530' AS DateTime), 2, 1, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Mod_Incident] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_InfoMagic] ON 

GO
INSERT [dbo].[Mod_InfoMagic] ([ID], [BaoCaoBanDauSuCoID], [MenuID], [State], [Name], [Code], [Published], [Order], [Activity]) VALUES (33, 1, 144, 0, NULL, NULL, CAST(N'2018-08-20 00:03:46.580' AS DateTime), 1, 1)
GO
INSERT [dbo].[Mod_InfoMagic] ([ID], [BaoCaoBanDauSuCoID], [MenuID], [State], [Name], [Code], [Published], [Order], [Activity]) VALUES (34, 1, 145, 0, NULL, NULL, CAST(N'2018-08-20 00:03:46.580' AS DateTime), 2, 1)
GO
INSERT [dbo].[Mod_InfoMagic] ([ID], [BaoCaoBanDauSuCoID], [MenuID], [State], [Name], [Code], [Published], [Order], [Activity]) VALUES (35, 1, 146, 0, N'Nhận được thông báo từ', N'Nhan-duoc-thong-bao-tu', CAST(N'2018-08-20 00:03:46.580' AS DateTime), 3, 1)
GO
INSERT [dbo].[Mod_InfoMagic] ([ID], [BaoCaoBanDauSuCoID], [MenuID], [State], [Name], [Code], [Published], [Order], [Activity]) VALUES (36, 1, 147, 0, N'Khác', N'Khac', CAST(N'2018-08-20 00:03:46.580' AS DateTime), 4, 1)
GO
INSERT [dbo].[Mod_InfoMagic] ([ID], [BaoCaoBanDauSuCoID], [MenuID], [State], [Name], [Code], [Published], [Order], [Activity]) VALUES (37, 1, 149, 0, NULL, NULL, CAST(N'2018-08-20 00:03:46.580' AS DateTime), 5, 1)
GO
INSERT [dbo].[Mod_InfoMagic] ([ID], [BaoCaoBanDauSuCoID], [MenuID], [State], [Name], [Code], [Published], [Order], [Activity]) VALUES (38, 1, 150, 0, NULL, NULL, CAST(N'2018-08-20 00:03:46.580' AS DateTime), 6, 1)
GO
INSERT [dbo].[Mod_InfoMagic] ([ID], [BaoCaoBanDauSuCoID], [MenuID], [State], [Name], [Code], [Published], [Order], [Activity]) VALUES (39, 1, 151, 0, NULL, NULL, CAST(N'2018-08-20 00:03:46.580' AS DateTime), 7, 1)
GO
INSERT [dbo].[Mod_InfoMagic] ([ID], [BaoCaoBanDauSuCoID], [MenuID], [State], [Name], [Code], [Published], [Order], [Activity]) VALUES (40, 1, 153, 0, NULL, NULL, CAST(N'2018-08-20 00:03:46.580' AS DateTime), 8, 1)
GO
INSERT [dbo].[Mod_InfoMagic] ([ID], [BaoCaoBanDauSuCoID], [MenuID], [State], [Name], [Code], [Published], [Order], [Activity]) VALUES (41, 1, 154, 0, NULL, NULL, CAST(N'2018-08-20 00:03:46.580' AS DateTime), 9, 1)
GO
INSERT [dbo].[Mod_InfoMagic] ([ID], [BaoCaoBanDauSuCoID], [MenuID], [State], [Name], [Code], [Published], [Order], [Activity]) VALUES (42, 1, 155, 0, NULL, NULL, CAST(N'2018-08-20 00:03:46.580' AS DateTime), 10, 1)
GO
INSERT [dbo].[Mod_InfoMagic] ([ID], [BaoCaoBanDauSuCoID], [MenuID], [State], [Name], [Code], [Published], [Order], [Activity]) VALUES (43, 1, 156, 0, N'Dịch vụ khác', N'Dich-vu-khac', CAST(N'2018-08-20 00:03:46.580' AS DateTime), 11, 1)
GO
INSERT [dbo].[Mod_InfoMagic] ([ID], [BaoCaoBanDauSuCoID], [MenuID], [State], [Name], [Code], [Published], [Order], [Activity]) VALUES (44, 1, 158, 0, NULL, NULL, CAST(N'2018-08-20 00:03:46.580' AS DateTime), 12, 1)
GO
INSERT [dbo].[Mod_InfoMagic] ([ID], [BaoCaoBanDauSuCoID], [MenuID], [State], [Name], [Code], [Published], [Order], [Activity]) VALUES (45, 1, 159, 0, NULL, NULL, CAST(N'2018-08-20 00:03:46.580' AS DateTime), 13, 1)
GO
INSERT [dbo].[Mod_InfoMagic] ([ID], [BaoCaoBanDauSuCoID], [MenuID], [State], [Name], [Code], [Published], [Order], [Activity]) VALUES (46, 1, 160, 0, NULL, NULL, CAST(N'2018-08-20 00:03:46.580' AS DateTime), 14, 1)
GO
INSERT [dbo].[Mod_InfoMagic] ([ID], [BaoCaoBanDauSuCoID], [MenuID], [State], [Name], [Code], [Published], [Order], [Activity]) VALUES (47, 1, 161, 0, N'Khác', N'Khac', CAST(N'2018-08-20 00:03:46.580' AS DateTime), 15, 1)
GO
INSERT [dbo].[Mod_InfoMagic] ([ID], [BaoCaoBanDauSuCoID], [MenuID], [State], [Name], [Code], [Published], [Order], [Activity]) VALUES (48, 1, 163, 0, NULL, NULL, CAST(N'2018-08-20 00:03:46.580' AS DateTime), 16, 1)
GO
INSERT [dbo].[Mod_InfoMagic] ([ID], [BaoCaoBanDauSuCoID], [MenuID], [State], [Name], [Code], [Published], [Order], [Activity]) VALUES (49, 1, 164, 0, NULL, NULL, CAST(N'2018-08-20 00:03:46.580' AS DateTime), 17, 1)
GO
INSERT [dbo].[Mod_InfoMagic] ([ID], [BaoCaoBanDauSuCoID], [MenuID], [State], [Name], [Code], [Published], [Order], [Activity]) VALUES (50, 1, 165, 0, N'Khác', N'Khac', CAST(N'2018-08-20 00:03:46.580' AS DateTime), 18, 1)
GO
SET IDENTITY_INSERT [dbo].[Mod_InfoMagic] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_ISP] ON 

GO
INSERT [dbo].[Mod_ISP] ([ID], [Name], [Code], [Email], [Updated], [Order], [Activity]) VALUES (1, N'Gmo Runsystem Jsc', N'Gmo', N'support@gmo.com', NULL, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Mod_ISP] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_News] ON 

GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (1, 70, 2, N'Gần 800 đại biểu dự Hội thảo hợp tác phát triển CNTT-TT Việt Nam lần thứ 21', N'Gan-800-dai-bieu-du-Hoi-thao-hop-tac-phat-trien-CNTTTT-Viet-Nam-lan-thu-21', N'', N'<p>S&aacute;ng 6/10/2017, tại L&agrave;o Cai, Bộ TT&amp;TT phối hợp với UBND tỉnh L&agrave;o Cai v&agrave; Hội Tin học Việt Nam tổ chức khai mạc Hội thảo hợp t&aacute;c ph&aacute;t triển CNTT-TT Việt Nam lần thứ 21. Tham dự lễ khai mạc c&oacute; đồng ch&iacute; L&ecirc; Mạnh H&agrave;, Ph&oacute; Chủ nhiệm Văn ph&ograve;ng Ch&iacute;nh phủ; Thứ trưởng Bộ TT&amp;TT Nguyễn Th&agrave;nh Hưng; Chủ tịch Hội Tin học Việt Nam B&ugrave;i Mạnh Hải.&nbsp;</p>
', N'<div>
<div class="news_detail">
<div class="news_detail" id="divArticleContent">
<div style="text-align:justify">Về ph&iacute;a tỉnh L&agrave;o Cai c&oacute; đồng ch&iacute; H&agrave; Thị Nga, Ph&oacute; B&iacute; thư Thường trực Tỉnh ủy; Chủ tịch UBND tỉnh Đặng Xu&acirc;n Phong; l&atilde;nh đạo một số ban, ng&agrave;nh Trung ương v&agrave; địa phương c&ugrave;ng gần 800 đại biểu đến từ 63 tỉnh, th&agrave;nh của cả nước.</div>

<div style="text-align:center">&nbsp;</div>

<div style="text-align:center">&nbsp;<img alt="20171006-DH06.jpg" src="https://mic.gov.vn/Upload/TinTuc/Chuyen_muc_Tieng_Viet/TinTucSuKien/Tin_hoat_dong_cua_Bo/2017/20171006-DH06.jpg" style="height:507px; width:760px" title="20171006-DH06.jpg" /></div>

<div>&nbsp;</div>

<div style="text-align:center"><em>Thứ trưởng Bộ TT&amp;TT Nguyễn Th&agrave;nh Hưng ph&aacute;t biểu khai mạc Hội thảo</em></div>

<div>&nbsp;</div>

<div style="text-align:justify">Với chủ đề &ldquo;N&acirc;ng cao hiệu quả ch&iacute;nh quyền điện tử, ph&aacute;t triển đ&ocirc; thị th&ocirc;ng minh trong xu thế c&aacute;ch mạng c&ocirc;ng nghiệp 4.0&rdquo;, Hội thảo l&agrave; diễn đ&agrave;n để c&aacute;c nh&agrave; hoạch định ch&iacute;nh s&aacute;ch, c&aacute;c nh&agrave; quản l&yacute; v&agrave; chuy&ecirc;n gia chia sẻ kinh nghiệm v&agrave; tạo cơ hội hợp t&aacute;c ph&aacute;t triển CNTT-TT c&aacute;c Bộ, ng&agrave;nh Trung ương v&agrave; c&aacute;c tỉnh, th&agrave;nh trong cả nước. Hội thảo cũng l&agrave; dịp để c&aacute;c nh&agrave; quản l&yacute;, c&aacute;c tổ chức, doanh nghiệp v&agrave; c&aacute; nh&acirc;n hoạt động trong lĩnh vực CNTT-TT c&oacute; cơ hội tiếp x&uacute;c, trao đổi, nắm bắt về hiện trạng, nhu cầu, giới thiệu về hoạt động, năng lực của đơn vị m&igrave;nh, t&igrave;m kiếm hợp t&aacute;c, giới thiệu, tư vấn những giải ph&aacute;p, sản phẩm, kỹ thuật c&ocirc;ng nghệ mới.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Hội thảo với c&aacute;c chủ đề ch&iacute;nh bao gồm: Ch&iacute;nh phủ điện tử, những th&agrave;nh tựu đạt được, c&aacute;c giải ph&aacute;p, định hướng trong những năm tiếp theo; Khung kiến tr&uacute;c Ch&iacute;nh phủ điện tử; hệ thống nền tảng kết nối, li&ecirc;n th&ocirc;ng, chia sẻ dữ liệu; định hướng ph&aacute;t triển đ&ocirc; thị th&ocirc;ng minh; Cơ sở dữ liệu (CSDL) quốc gia tạo nền tảng ph&aacute;t triển Ch&iacute;nh phủ điện tử, kết nối c&aacute;c ứng dụng cấp quốc gia với c&aacute;c ứng dụng tại địa phương; Cổng dịch vụ c&ocirc;ng Quốc gia; Hiện trạng v&agrave; định hướng n&acirc;ng cao an to&agrave;n th&ocirc;ng tin trong c&aacute;c cơ quan nh&agrave; nước; Ch&iacute;nh s&aacute;ch đảm bảo nguồn lực, nguồn nh&acirc;n lực cho ph&aacute;t triển CNTT-TT.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Ngo&agrave;i ra, l&agrave; một trong những tỉnh nằm trong tốp đầu cả nước về ph&aacute;t triển v&agrave; ứng dụng CNTT trong quản l&yacute; nh&agrave; nước, L&agrave;o Cai cũng c&oacute; nhiều m&ocirc; h&igrave;nh nổi bật nhằm chia sẻ kinh nghiệm với c&aacute;c đại biểu. Trong đ&oacute; c&oacute; m&ocirc; h&igrave;nh Kiến tr&uacute;c Ch&iacute;nh quyền điện tử của tỉnh; hệ thống kết nối, li&ecirc;n th&ocirc;ng chia sẻ dữ liệu cấp tỉnh; CSDL d&ugrave;ng chung nền tảng phục vụ ch&iacute;nh quyền điện tử; c&aacute;c giải ph&aacute;p tương t&aacute;c giữa người d&acirc;n với ch&iacute;nh quyền c&aacute;c cấp như: triển khai dịch vụ bưu ch&iacute;nh c&ocirc;ng &iacute;ch trong tiếp nhận hồ sơ, trả kết quả thủ tục h&agrave;nh ch&iacute;nh; thanh to&aacute;n dịch vụ h&agrave;nh ch&iacute;nh c&ocirc;ng kh&ocirc;ng d&ugrave;ng tiền mặt; đ&aacute;nh gi&aacute; sự h&agrave;i l&ograve;ng của người d&acirc;n với c&aacute;n bộ &ldquo;một cửa&rdquo;, ứng dụng chữ k&yacute; số trong văn bản điện tử&hellip;</div>

<div>&nbsp;</div>

<div style="text-align:justify">Ph&aacute;t biểu khai mạc Hội thảo, Thứ trưởng Bộ TT&amp;TT Nguyễn Th&agrave;nh Hưng cho biết, trong những năm qua, c&ocirc;ng t&aacute;c ph&aacute;t triển v&agrave; ứng dụng CNTT nhận được nhiều sự quan t&acirc;m của Đảng, Nh&agrave; nước v&agrave; được x&aacute;c định l&agrave; nhiệm vụ của to&agrave;n bộ hệ thống ch&iacute;nh trị từ Trung ương tới địa phương. Ch&uacute;ng ta đ&atilde; đạt được nhiều kết quả t&iacute;ch cực, xếp hạng của Việt Nam về chỉ số ph&aacute;t triển Ch&iacute;nh phủ điện tử năm 2016 cũng đ&atilde; c&oacute; nhiều cải thiện, tăng 10 hạng so với năm 2014 v&agrave; ch&iacute;nh thức gia nhập nh&oacute;m c&aacute;c nước c&oacute; chỉ số ph&aacute;t triển Ch&iacute;nh phủ điện tử cao.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Thứ trưởng chia sẻ, đặt vấn đề ph&aacute;t triển Ch&iacute;nh phủ điện tử v&agrave; x&acirc;y dựng th&agrave;nh phố th&ocirc;ng minh trong xu thế của cuộc c&aacute;ch mạng c&ocirc;ng nghiệp 4.0, ch&uacute;ng ta phải thấy được Việt Nam hiện nay đang phải đối mặt với những th&aacute;ch thức to lớn. C&aacute;c nước đang ph&aacute;t triển như Việt Nam kh&ocirc;ng thể chỉ dựa v&agrave;o khai th&aacute;c t&agrave;i nguy&ecirc;n, lao động giản đơn, m&agrave; cần mở rộng đầu tư mạnh mẽ v&agrave;o đổi mới s&aacute;ng tạo, n&acirc;ng cao năng lực cạnh tranh, tham gia chuỗi sản xuất to&agrave;n cầu. Ch&uacute;ng ta cần t&iacute;ch cực đổi mới m&ocirc; h&igrave;nh tăng trưởng để n&acirc;ng cao tr&igrave;nh độ ph&aacute;t triển của nền kinh tế; ph&aacute;t triển chủ yếu dựa tr&ecirc;n s&aacute;ng tạo, c&ocirc;ng nghệ ti&ecirc;n tiến, năng suất cao v&agrave; tranh thủ thời cơ của cuộc c&aacute;ch mạng c&ocirc;ng nghiệp 4.0.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Thứ trưởng cũng mong muốn, để tận dụng tốt những thuận lợi v&agrave; vượt qua được c&aacute;c th&aacute;ch thức m&agrave; cuộc c&aacute;ch mạng số mang lại, ngo&agrave;i vai tr&ograve; chỉ đạo, điều h&agrave;nh của Đảng, Nh&agrave; nước v&agrave; Ch&iacute;nh phủ, sự tham gia ủng hộ t&iacute;ch cực của cộng đồng CNTT-TT l&agrave; hết sức quan trọng. Bộ TT&amp;TT cũng k&ecirc;u gọi c&aacute;c c&aacute; nh&acirc;n, doanh nghiệp, hội/hiệp hội CNTT-TT nỗ lực tham gia, đồng h&agrave;nh c&ugrave;ng Ch&iacute;nh phủ trong hoạt động th&uacute;c đẩy cũng như đảm bảo an to&agrave;n cho sự ph&aacute;t triển của lĩnh vực CNTT-TT tại Việt Nam.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:center"><img alt="20171006-DH01.jpg" src="https://mic.gov.vn/Upload/TinTuc/Chuyen_muc_Tieng_Viet/TinTucSuKien/Tin_hoat_dong_cua_Bo/2017/20171006-DH01.jpg" style="height:507px; width:760px" title="20171006-DH01.jpg" /></div>

<div style="text-align:center">&nbsp;</div>

<div style="text-align:center"><em>Ph&oacute; Chủ nhiệm Văn ph&ograve;ng Ch&iacute;nh phủ L&ecirc; Mạnh H&agrave; ph&aacute;t biểu tại Hội thảo</em></div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Ph&aacute;t biểu tại Hội thảo, Ph&oacute; Chủ nhiệm Văn ph&ograve;ng Ch&iacute;nh phủ L&ecirc; Mạnh H&agrave; cho biết, c&aacute;c doanh nghiệp Việt Nam chủ yếu ứng dụng CNTT v&agrave; sản xuất phần mềm. Trong lĩnh vực cung ứng phần mềm cho c&aacute;c cơ quan nh&agrave; nước, v&igrave; nhiều l&yacute; do n&ecirc;n chỉ c&oacute; doanh nghiệp trong nước mới cung ứng được c&aacute;c sản phẩm phần mềm phục vụ c&ocirc;ng t&aacute;c chỉ đạo, điều h&agrave;nh. Một phần cũng bởi l&yacute; do quản l&yacute; đầu tư trong c&aacute;c cơ quan nh&agrave; nước c&ograve;n chậm, phức tạp n&ecirc;n dẫn đến hạn chế trong việc triển khai &aacute;p dụng c&aacute;c sản phẩm ứng dụng c&ocirc;ng nghệ cao. Do đ&oacute;, Văn ph&ograve;ng Ch&iacute;nh phủ đang phối hợp với Bộ TT&amp;TT x&acirc;y dựng Nghị định thay thế Nghị định 102/2009/NĐ-CP nhằm ph&ugrave; hợp với đặc th&ugrave; CNTT.&nbsp;</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Qua Hội thảo n&agrave;y, &ocirc;ng L&ecirc; Mạnh H&agrave; cũng mong muốn c&aacute;c nh&agrave; hoạch định ch&iacute;nh s&aacute;ch, c&aacute;c địa phương ủng hộ cho c&aacute;c sản phẩm của Việt Nam, đặc biệt l&agrave; c&aacute;c sản phẩm phần cứng. &Ocirc;ng cũng mong muốn c&aacute;c đại biểu tham dự Hội thảo đạt được nhiều kết quả tốt, chia sẻ nhiều kinh nghiệm qu&yacute; b&aacute;u &aacute;p dụng trong lĩnh vực cũng như địa phương của m&igrave;nh.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:center"><img alt="20171006-DH03.jpg" src="https://mic.gov.vn/Upload/TinTuc/Chuyen_muc_Tieng_Viet/TinTucSuKien/Tin_hoat_dong_cua_Bo/2017/20171006-DH03.jpg" style="height:507px; width:760px" title="20171006-DH03.jpg" /></div>

<div style="text-align:center">&nbsp;</div>

<div style="text-align:center"><em>Chủ tịch UBND tỉnh L&agrave;o Cai Đặng Xu&acirc;n Phong ph&aacute;t biểu tại Hội thảo</em></div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Ph&aacute;t biểu tại Hội thảo, Chủ tịch UBND tỉnh L&agrave;o Cai Đặng Xu&acirc;n Phong đ&atilde; gửi lời cảm ơn đến l&atilde;nh đạo Đảng, Nh&agrave; nước, Bộ TT&amp;TT, Hội Tin học Việt Nam đ&atilde; hỗ trợ tỉnh trong suốt thời gian qua cũng như c&aacute;c địa phương, tổ chức, doanh nghiệp, đ&atilde; đồng h&agrave;nh c&ugrave;ng Hội thảo.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Chủ tịch UBND tỉnh L&agrave;o Cai hi vọng Hội thảo hợp t&aacute;c ph&aacute;t triển CNTT-TT Việt Nam lần thứ 21 sẽ l&agrave; dịp để c&aacute;c đại biểu c&oacute; c&aacute;i nh&igrave;n to&agrave;n diện hơn về L&agrave;o Cai, cảm nhận s&acirc;u sắc hơn về những nỗ&nbsp;lực vượt kh&oacute; v&agrave; t&igrave;nh cảm nồng thắm của con người L&agrave;o Cai. Đồng thời, L&agrave;o Cai cũng lu&ocirc;n mong muốn cộng đồng du kh&aacute;ch h&atilde;y đến với L&agrave;o Cai - một v&ugrave;ng đất tiềm năng của Việt Nam l&agrave; điểm đến hấp dẫn của c&aacute;c nh&agrave; đầu tư v&agrave; du kh&aacute;ch trong, ngo&agrave;i nước.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">B&ecirc;n lề Hội thảo cũng diễn ra Triển l&atilde;m CNTT-TT với sự g&oacute;p mặt của c&aacute;c doanh nghiệp h&agrave;ng đầu trong lĩnh vực CNTT-TT. Hội thảo v&agrave; Triển l&atilde;m diễn ra trong hai ng&agrave;y (05 - 06/10/2017) tại Trung t&acirc;m Hội nghị tỉnh L&agrave;o Cai, đại lộ Trần Hưng Đạo, th&agrave;nh phố L&agrave;o Cai./.</div>
</div>
</div>
</div>

<p style="text-align:right"><strong>Đức Huy</strong></p>
', NULL, NULL, NULL, N'', N'~/Data/upload/images/TinTuc/HoatDongCuaBo/20171006-DH07.jpg', N'', 0, 6, CAST(N'2017-10-08 09:44:58.353' AS DateTime), 6, 1, CAST(N'2018-07-25 13:30:42.573' AS DateTime), 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (2, 70, 2, N'Tập trung hoàn thành Chiến lược phát triển thông tin quốc gia đến năm 2025, tầm nhìn 2030', N'Tap-trung-hoan-thanh-Chien-luoc-phat-trien-thong-tin-quoc-gia-den-nam-2025-tam-nhin-2030', N'', N'<p>Theo dự thảo, Chiến lược ph&aacute;t triển th&ocirc;ng tin quốc gia tập trung<em> </em>định hướng ph&aacute;t triển<strong> </strong>tr&ecirc;n phạm vi cả nước c&aacute;c lĩnh vực th&ocirc;ng tin như: Th&ocirc;ng tin tr&ecirc;n b&aacute;o ch&iacute; (bao gồm b&aacute;o in, b&aacute;o n&oacute;i, b&aacute;o h&igrave;nh v&agrave; b&aacute;o điện tử); Th&ocirc;ng tin hoạt động xuất bản, bao gồm cả xuất bản điện tử; Th&ocirc;ng tin tr&ecirc;n mạng Internet (bao gồm th&ocirc;ng tin tr&ecirc;n trang th&ocirc;ng tin điện tử v&agrave; c&aacute;c trang mạng x&atilde; hội); Th&ocirc;ng tin qua hệ thống th&ocirc;ng tin cơ sở v&agrave; hệ thống đ&agrave;i truyền thanh &ndash; truyền h&igrave;nh cấp huyện.</p>

<p>&nbsp;</p>
', N'<div>
<div class="news_detail">&nbsp;
<div class="news_detail" id="divArticleContent">
<p style="text-align:center"><img alt="20171006-loc1.jpg" src="https://mic.gov.vn/Upload/TinTuc/Chuyen_muc_Tieng_Viet/TinTucSuKien/Tin_hoat_dong_cua_Bo/2017/20171006-loc1.jpg" style="height:507px; width:760px" title="20171006-loc1.jpg" /></p>

<div style="text-align:center"><em>Thứ trưởng Ho&agrave;ng Vĩnh Bảo ph&aacute;t biểu kết luận cuộc họp.</em></div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Theo dự thảo, Chiến lược ph&aacute;t triển th&ocirc;ng tin quốc gia tập trung<em> </em>định hướng ph&aacute;t triển<strong> </strong>tr&ecirc;n phạm vi cả nước c&aacute;c lĩnh vực th&ocirc;ng tin như: Th&ocirc;ng tin tr&ecirc;n b&aacute;o ch&iacute; (bao gồm b&aacute;o in, b&aacute;o n&oacute;i, b&aacute;o h&igrave;nh v&agrave; b&aacute;o điện tử); Th&ocirc;ng tin hoạt động xuất bản, bao gồm cả xuất bản điện tử; Th&ocirc;ng tin tr&ecirc;n mạng Internet (bao gồm th&ocirc;ng tin tr&ecirc;n trang th&ocirc;ng tin điện tử v&agrave; c&aacute;c trang mạng x&atilde; hội); Th&ocirc;ng tin qua hệ thống th&ocirc;ng tin cơ sở v&agrave; hệ thống đ&agrave;i truyền thanh &ndash; truyền h&igrave;nh cấp huyện.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Về quan điểm ph&aacute;t triển của Chiến lược: Hoạt động th&ocirc;ng tin v&agrave; c&aacute;c loại h&igrave;nh th&ocirc;ng tin ở nước ta đặt dưới sự l&atilde;nh đạo trực tiếp v&agrave; to&agrave;n diện của Đảng, sự quản l&yacute; của Nh&agrave; nước v&agrave; hoạt động theo quy định của ph&aacute;p luật; Ph&aacute;t triển nhanh, mạnh, vững chắc hệ thống th&ocirc;ng tin, đảm bảo ph&aacute;t triển đi đ&ocirc;i với quản l&yacute; tốt, ph&ugrave; hợp với Chiến lược ph&aacute;t triển kinh tế - x&atilde; hội của đất nước, ph&aacute;t triển hệ thống th&ocirc;ng tin theo hướng chuy&ecirc;n nghiệp, hiện đại, chất lượng, hiệu quả gắn với cuộc c&aacute;ch mạng c&ocirc;ng nghiệp 4.0; Kết hợp chặt chẽ giữa th&ocirc;ng tin đối ngoại v&agrave; th&ocirc;ng tin đối nội, giữa đối ngoại của Đảng, ngoại giao Nh&agrave; nước v&agrave; đối ngoại nh&acirc;n d&acirc;n đảm bảo lợi &iacute;ch quốc gia, lợi &iacute;ch d&acirc;n tộc; Th&ocirc;ng tin phải đảm bảo t&iacute;nh gi&aacute;o dục, t&iacute;nh nh&acirc;n văn, t&iacute;nh phản biện, t&iacute;nh chiến đấu, ph&ugrave; hợp với lợi &iacute;ch của đất nước v&agrave; nh&acirc;n d&acirc;n; ph&aacute;t triển th&ocirc;ng tin phải đảm bảo an ninh, an to&agrave;n th&ocirc;ng tin&hellip;</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Theo dự thảo b&aacute;o c&aacute;o, trong những năm qua, hệ thống th&ocirc;ng tin kh&ocirc;ng ngừng được ph&aacute;t triển v&agrave; hiện đại h&oacute;a, chất lượng c&aacute;c sản phẩm, dịch vụ ph&aacute;t thanh, truyền h&igrave;nh, b&aacute;o ch&iacute; xuất bản được n&acirc;ng cao, cơ bản đ&aacute;p ứng nhu cầu th&ocirc;ng tin của người d&acirc;n. Nh&acirc;n lực trong lĩnh vực th&ocirc;ng tin tăng nhanh, tr&igrave;nh độ ch&iacute;nh trị, kỹ năng nghiệp vụ cũng được n&acirc;ng cao.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Cụ thể hơn 10 năm trở lại đ&acirc;y, số lượng b&aacute;o ch&iacute; in đ&atilde; tăng nhanh, từ 486 cơ quan b&aacute;o, tạp ch&iacute; với 606 ấn phẩm năm 2001, đến nay (t&iacute;nh đến th&aacute;ng 12 năm 2016) cả nước đ&atilde; c&oacute; 859 cơ quan b&aacute;o ch&iacute;, trong đ&oacute; c&oacute; 199 b&aacute;o (trung ương 86, địa phương 113); 660 tạp ch&iacute; (trung ương 523, địa phương 137).</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">T&iacute;nh đến hết th&aacute;ng 12/2016, cả nước c&oacute; 135 b&aacute;o, tạp ch&iacute; điện tử, tăng 30 b&aacute;o, tạp ch&iacute; điện tử so với năm 2015, trong đ&oacute; c&oacute; 112 b&aacute;o, tạp ch&iacute; điện tử của cơ quan b&aacute;o ch&iacute; in v&agrave; 23 b&aacute;o, tạp ch&iacute; điện tử độc lập. Ngo&agrave;i hệ thống b&aacute;o, tạp ch&iacute; điện tử c&ograve;n c&oacute; 258 trang th&ocirc;ng tin điện tử tổng hợp của cơ quan b&aacute;o ch&iacute; v&agrave; hơn 1600 trang th&ocirc;ng tin điện tử tổng hợp của c&aacute;c cơ quan, tổ chức, doanh nghiệp.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Đến nay cả nước c&oacute; 71 đơn vị ph&aacute;t thanh, truyền h&igrave;nh, gồm 03 đ&agrave;i Trung ương, 64 đ&agrave;i ph&aacute;t thanh &ndash; truyền h&igrave;nh địa phương v&agrave; 4 đơn vị hoạt động truyền h&igrave;nh kh&ocirc;ng c&oacute; hạ tầng ph&aacute;t s&oacute;ng truyền h&igrave;nh ri&ecirc;ng, với 268 k&ecirc;nh đ&atilde; được cấp ph&eacute;p.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Nh&acirc;n lực l&agrave;m b&aacute;o tăng nhanh trong thời gian vừa qua, từ 31.000 người năm 2010, l&ecirc;n gần 40.000 người năm 2016, tốc độ tăng trưởng trung b&igrave;nh h&agrave;ng năm khoảng 6,5%, tỷ lệ nh&acirc;n lực l&agrave;m b&aacute;o c&oacute; tr&igrave;nh độ dưới đại học đ&atilde; giảm.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Về xuất bản, cả nước hiện c&oacute; 60 nh&agrave; xuất bản (NXB), trong đ&oacute; c&oacute; 49 NXB thuộc c&aacute;c cơ quan Trung ương v&agrave; 11 NXB địa phương.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Việc thu hẹp khoảng c&aacute;ch về thụ hưởng th&ocirc;ng tin của nh&acirc;n d&acirc;n giữa c&aacute;c v&ugrave;ng, miền được ch&uacute; trọng, người d&acirc;n ở v&ugrave;ng s&acirc;u, v&ugrave;ng xa, v&ugrave;ng d&acirc;n tộc thiểu số, bi&ecirc;n giới, hải đảo được tiếp cận với th&ocirc;ng tin ng&agrave;y một tốt hơn.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Tuy nhi&ecirc;n, b&ecirc;n cạnh những th&agrave;nh tựu, hoạt động th&ocirc;ng tin v&agrave; hệ thống th&ocirc;ng tin vẫn c&ograve;n những tồn tại, hạn chế: Tổ chức bộ m&aacute;y v&agrave; m&ocirc; h&igrave;nh hoạt động của một số cơ quan b&aacute;o ch&iacute; v&agrave; hệ thống th&ocirc;ng tin cơ sở chưa thống nhất, hiệu quả c&ocirc;ng t&aacute;c th&ocirc;ng tin chưa cao; Tr&igrave;nh độ chuy&ecirc;n m&ocirc;n, kỹ năng nghiệp vụ, ngoại ngữ của đội ngũ l&agrave;m c&ocirc;ng t&aacute;c th&ocirc;ng tin, quản l&yacute; th&ocirc;ng tin đ&atilde; c&oacute; nhiều tiến bộ nhưng c&ograve;n chưa đ&aacute;p ứng được nhu cầu đặt ra, chưa theo kịp tốc độ ph&aacute;t triển; Đang c&oacute; sự mất c&acirc;n đối giữa khả năng ph&aacute;t s&oacute;ng truyền h&igrave;nh v&agrave; năng lực sản xuất chương tr&igrave;nh truyền h&igrave;nh địa phương, g&acirc;y l&atilde;ng ph&iacute; về v&ugrave;ng phủ s&oacute;ng truyền h&igrave;nh địa phương&hellip;</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Cũng theo dự thảo Chiến lược, mục ti&ecirc;u cụ thể đối với b&aacute;o in, b&aacute;o điện tử đến năm 2025, 90% người d&acirc;n v&ugrave;ng s&acirc;u, v&ugrave;ng xa, bi&ecirc;n giới, hải đảo c&oacute; thể đọc miễn ph&iacute; b&aacute;o in hoặc b&aacute;o điện tử phục vụ nhiệm vụ ch&iacute;nh trị, th&ocirc;ng tin tuy&ecirc;n truyền thiết yếu; Giảm tỷ lệ mất c&acirc;n đối trong thụ hưởng c&aacute;c sản phẩm b&aacute;o in giữa c&aacute;c khu vực th&agrave;nh phố, thị x&atilde; v&agrave; c&aacute;c v&ugrave;ng n&ocirc;ng th&ocirc;n, v&ugrave;ng miền n&uacute;i, v&ugrave;ng s&acirc;u, v&ugrave;ng xa, đạt mức 60%/40%.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Dự kiến mục ti&ecirc;u đến năm 2030, cơ bản c&aacute;c cơ quan b&aacute;o ch&iacute; in, điện tử hoạt động theo m&ocirc; h&igrave;nh t&ograve;a soạn hội tụ, vận h&agrave;nh c&aacute;c hệ thống th&ocirc;ng tin điện tử ph&ugrave; hợp với xu hướng c&ocirc;ng nghệ ti&ecirc;n tiến tr&ecirc;n thế giới, c&aacute;c sản phẩm b&aacute;o ch&iacute; c&oacute; chất lượng cao.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Đối với b&aacute;o n&oacute;i, b&aacute;o h&igrave;nh mục ti&ecirc;u đến năm 2025 tiếp tục n&acirc;ng cao chất lượng s&oacute;ng ph&aacute;t thanh, truyền h&igrave;nh, đảm bảo 100% d&acirc;n số c&oacute; khả năng nghe, xem c&aacute;c k&ecirc;nh ph&aacute;t thanh, k&ecirc;nh truyền h&igrave;nh phục vụ nhiệm vụ ch&iacute;nh trị, th&ocirc;ng tin tuy&ecirc;n truyền thiết yếu với chất lượng cao.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Tăng thời lượng ph&aacute;t s&oacute;ng c&aacute;c chương tr&igrave;nh sản xuất trong nước của k&ecirc;nh ph&aacute;t thanh, k&ecirc;nh truyền h&igrave;nh phục vụ nhiệm vụ ch&iacute;nh trị, th&ocirc;ng tin tuy&ecirc;n truyền thiết yếu của quốc gia v&agrave; địa phương; đạt tỷ lệ tối thiểu 70% tổng thời lượng ph&aacute;t s&oacute;ng trong 1 ng&agrave;y của từng k&ecirc;nh chương tr&igrave;nh (trong đ&oacute;, thời lượng chương tr&igrave;nh tự sản xuất mới phải đạt tối thiểu 50% thời lượng c&aacute;c chương tr&igrave;nh sản xuất trong nước); tỷ lệ thời lượng chương tr&igrave;nh nước ngo&agrave;i khai th&aacute;c tr&ecirc;n một số k&ecirc;nh chương tr&igrave;nh kh&ocirc;ng vượt qu&aacute; 30% tổng thời lượng ph&aacute;t s&oacute;ng trong 1 ng&agrave;y của k&ecirc;nh đ&oacute;&hellip; Đến năm 2030, 100% c&aacute;c đ&agrave;i ph&aacute;t thanh &ndash; truyền h&igrave;nh tự chủ về kinh ph&iacute; chi thường xuy&ecirc;n.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Đối với th&ocirc;ng tin điện tử, đến năm 2025, 100% c&aacute;c website ứng dụng dịch vụ th&ocirc;ng tin mạng đ&aacute;p ứng y&ecirc;u cầu về kỹ thuật, nội dung th&ocirc;ng tin, x&aacute;c thực người d&ugrave;ng, 100% c&aacute;c cơ quan h&agrave;nh ch&iacute;nh Nh&agrave; nước c&oacute; trang th&ocirc;ng tin điện tử th&iacute;ch ứng với c&aacute;c thiết bị di động, dễ d&agrave;ng tra cứu, sử dụng do chương tr&igrave;nh Ch&iacute;nh phủ điện tử cung ứng; đến năm 2030, 100% c&aacute;c trang th&ocirc;ng tin điện tử, mạng x&atilde; hội của cơ quan, tổ chức Việt Nam đảm bảo quy chuẩn về th&ocirc;ng tin, an to&agrave;n th&ocirc;ng tin&hellip;</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Về xuất bản, đảm bảo cơ cấu xuất bản hợp l&yacute;, duy tr&igrave; số lượng xuất bản phẩm, trong đ&oacute; 20-30% l&agrave; xuất bản điện tử, đến năm 2025, đạt khoảng 580 triệu bản, tương đương 6 bản s&aacute;ch/người/năm, năm 2030 đạt khoảng 700 triệu bản, tương đương 7 bản s&aacute;ch/người/năm&hellip;</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Đối với hệ thống th&ocirc;ng tin cơ sở, ứng dụng c&ocirc;ng nghệ hiện đại để tổ chức c&aacute;c hoạt động th&ocirc;ng tin cơ sở, n&acirc;ng cao chất lượng, hiệu quả c&aacute;c hoạt động th&ocirc;ng tin cơ sở ph&ugrave; hợp với từng đối tượng, điều kiện kinh tế - x&atilde; hội từng v&ugrave;ng, miền; tăng cường cơ sở vật chất cho hệ thống th&ocirc;ng tin truyền th&ocirc;ng cơ sở; đưa quy hoạch hạ tầng th&ocirc;ng tin cơ sở v&agrave;o nội dung quy hoạch ph&aacute;t triển kinh tế - x&atilde; hội của c&aacute;c ng&agrave;nh, địa phương&hellip;</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Dự thảo cũng n&ecirc;u một số giải ph&aacute;p về bộ m&aacute;y, nguồn nh&acirc;n lực. Theo đ&oacute;, cần n&acirc;ng cao chất lượng c&ocirc;ng t&aacute;c quy hoạch; ti&ecirc;u chuẩn h&oacute;a c&aacute;c chức danh l&atilde;nh đạo chủ chốt của c&aacute;c cơ quan th&ocirc;ng tin, đặc biệt l&agrave; c&aacute;c cơ quan th&ocirc;ng tin phục vụ c&ocirc;ng t&aacute;c tuy&ecirc;n truyền thiết yếu của Đảng, Nh&agrave; nước. Đầu tư kinh ph&iacute; để tổ chức đ&agrave;o tạo, đ&agrave;o tạo lại, bồi dưỡng định kỳ nhằm n&acirc;ng cao nhận thức, l&yacute; luận ch&iacute;nh trị, ngoại ngữ, tr&igrave;nh độ CNTT, kỹ năng nghiệp vụ chuy&ecirc;n m&ocirc;n cho đội ngũ l&atilde;nh đạo chủ chốt của c&aacute;c cơ quan th&ocirc;ng tin, c&aacute;n bộ ph&oacute;ng vi&ecirc;n, bi&ecirc;n tập vi&ecirc;n, người l&agrave;m c&ocirc;ng t&aacute;c th&ocirc;ng tin cơ sở v&agrave; c&aacute;n bộ, c&ocirc;ng chức trong hệ thống cơ quan quản l&yacute; Nh&agrave; nước. X&acirc;y dựng kế hoạch ph&aacute;t triển nguồn nh&acirc;n lực ứng dụng CNTT v&agrave; truyền th&ocirc;ng, nhằm ph&aacute;t triển th&ocirc;ng tin mạng theo từng giai đoạn cụ thể&hellip;</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Ph&aacute;t biểu kết luận cuộc họp, Thứ trưởng Ho&agrave;ng Vĩnh Bảo đ&aacute;nh gi&aacute; cao c&aacute;c &yacute; kiến đ&oacute;ng g&oacute;p t&acirc;m huyết của c&aacute;c đại biểu nhằm ho&agrave;n thiện dự thảo Chiến lược tr&igrave;nh Ch&iacute;nh phủ trong thời gian tới.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Đồng thời, Thứ trưởng Ho&agrave;ng Vĩnh Bảo cũng y&ecirc;u cầu Thường trực Tổ Bi&ecirc;n tập l&agrave; Cục B&aacute;o ch&iacute; phối hợp c&ugrave;ng với Cục Th&ocirc;ng tin cơ sở, Vụ Ph&aacute;p Chế, Cục Xuất bản, In v&agrave; Ph&aacute;t h&agrave;nh, Cục Ph&aacute;t thanh truyền h&igrave;nh v&agrave; Th&ocirc;ng tin điện tử tiếp thu tối đa những &yacute; kiến đ&oacute;ng g&oacute;p x&aacute;c đ&aacute;ng nhằm bổ sung ho&agrave;n thiện dự thảo tr&igrave;nh L&atilde;nh đạo Bộ trong thời gian tới.</div>

<div style="text-align:justify">&nbsp;</div>

<div style="text-align:justify">Thứ trưởng cũng lưu &yacute;, cần r&agrave; so&aacute;t lại c&aacute;c quy hoạch, chiến lược li&ecirc;n quan xem c&oacute; m&acirc;u thuẫn g&igrave; kh&ocirc;ng; C&aacute;ch tr&igrave;nh b&agrave;y phải ph&ugrave; hợp với t&iacute;nh chất từng loại văn bản; nội dung quyết định ph&ecirc; duyệt Chiến lược phải t&aacute;ch bạch, r&otilde; r&agrave;ng, cụ thể, đảm bảo khoa học, logic; đồng thời cần lưu &yacute; đến&nbsp;vấn đề bản quyền&hellip;/.</div>
</div>
</div>
</div>

<p><strong>Xu&acirc;n Lộc</strong></p>
', NULL, NULL, NULL, N'', N'~/Data/upload/images/TinTuc/HoatDongCuaBo/20171006-loc1.jpg', N'', 0, 6, CAST(N'2017-10-08 09:47:08.237' AS DateTime), 6, 2, CAST(N'2018-07-25 11:57:06.837' AS DateTime), 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (19, 73, 0, N'Áp thấp nhiệt đới đổ bộ vào đảo Hải Nam - Trung Quốc', N'Ap-thap-nhiet-doi-do-bo-vao-dao-Hai-Nam-Trung-Quoc', N'', N'<p>V&ugrave;ng nguy hiểm tr&ecirc;n biển trong 24 giờ tới (gi&oacute; mạnh cấp 6 trở l&ecirc;n): to&agrave;n bộ khu vực Vịnh Bắc Bộ.</p>
', N'<p>Theo Trung t&acirc;m Dự b&aacute;o kh&iacute; tượng thủy văn Quốc gia, dự b&aacute;o trong 24 giờ tới, &aacute;p thấp nhiệt đới di chuyển chủ yếu theo hướng Bắc mỗi giờ đi được 5-10km.</p>

<p>Đến 4h ng&agrave;y 24/7, vị tr&iacute; t&acirc;m &aacute;p thấp nhiệt đới ở khoảng 21,3 độ Vĩ Bắc; 109,7 độ Kinh Đ&ocirc;ng, tr&ecirc;n khu vực ph&iacute;a T&acirc;y b&aacute;n đảo L&ocirc;i Ch&acirc;u. Sức gi&oacute; mạnh nhất v&ugrave;ng gần t&acirc;m &aacute;p thấp nhiệt đới mạnh cấp 6-7 (40-60km/giờ), giật cấp 9. Phạm vi gi&oacute; mạnh cấp 6, giật cấp 8 khoảng 50km t&iacute;nh từ t&acirc;m &aacute;p thấp nhiệt đới.</p>

<p>Do ảnh hưởng của &aacute;p thấp nhiệt đới ở vịnh Bắc Bộ (bao gồm huyện đảo Bạch Long Vĩ) c&oacute; gi&oacute; mạnh cấp 6, giật cấp 8 v&agrave; c&oacute; mưa gi&ocirc;ng mạnh. Biển động. Cấp độ rủi ro thi&ecirc;n tai: cấp 3.</p>

<p>Trong 24 đến 48 giờ tiếp theo, &aacute;p thấp nhiệt đới di chuyển theo hướng Bắc T&acirc;y Bắc, mỗi giờ đi được khoảng 5km v&agrave; suy yếu dần th&agrave;nh một v&ugrave;ng &aacute;p thấp.</p>

<p>Ngo&agrave;i ra, do ảnh hưởng của dải hội tụ nhiệt đới kết hợp với gi&oacute; m&ugrave;a T&acirc;y Nam hoạt động mạnh n&ecirc;n ng&agrave;y v&agrave; đ&ecirc;m nay (23/7), ở khu vực Bắc Biển Đ&ocirc;ng (bao gồm v&ugrave;ng biển quần đảo Ho&agrave;ng Sa), v&ugrave;ng biển từ B&igrave;nh Thuận đến C&agrave; Mau, C&agrave; Mau đến Ki&ecirc;n Giang v&agrave; vịnh Th&aacute;i Lan tiếp tục c&oacute; mưa gi&ocirc;ng mạnh. Khu vực Giữa v&agrave; Nam Biển Đ&ocirc;ng (bao gồm cả v&ugrave;ng biển quần đảo Trường Sa), v&ugrave;ng biển từ B&igrave;nh Thuận đến C&agrave; Mau tiếp tục c&oacute; gi&oacute; T&acirc;y Nam mạnh cấp 6, giật cấp 8, s&oacute;ng biển cao từ 2-3m; biển động. Cấp độ rủi ro thi&ecirc;n tai: cấp 1.</p>
', NULL, NULL, NULL, N'', N'~/Data/upload/files/img20180607101424-15321916513461637113694.jpg', N'', 0, 6, CAST(N'2018-07-23 08:42:39.093' AS DateTime), 0, 19, NULL, 0, 0)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (33, 72, 0, N'ĐẢM BẢO AN TOÀN THÔNG TIN DỊP NGHỈ LỄ TẾT NGUYÊN ĐÁN 2018', N'DAM-BAO-AN-TOAN-THONG-TIN-DIP-NGHI-LE-TET-NGUYEN-DAN-2018', N'', N'<p>Trước thực trạng mất an to&agrave;n th&ocirc;ng tin đang ng&agrave;y một gia tăng cả về mức độ v&agrave; số lượng. Trong năm 2017, tin tặc đ&atilde; g&acirc;y ra nhiều vụ tấn c&ocirc;ng lớn nhỏ tr&ecirc;n phạm vi to&agrave;n cầu g&acirc;y ra những hậu quả nghi&ecirc;m trọng như vụ tấn c&ocirc;ng của&nbsp;m&atilde; độc Ransomware WannaCry. H&igrave;</p>
', N'<p>Trước thực trạng mất an to&agrave;n th&ocirc;ng tin đang ng&agrave;y một gia tăng cả về mức độ v&agrave; số lượng. Trong năm 2017, tin tặc đ&atilde; g&acirc;y ra nhiều vụ tấn c&ocirc;ng lớn nhỏ tr&ecirc;n phạm vi to&agrave;n cầu g&acirc;y ra những hậu quả nghi&ecirc;m trọng như vụ tấn c&ocirc;ng của&nbsp;m&atilde; độc Ransomware WannaCry. H&igrave;nh thức tấn c&ocirc;ng ng&agrave;y c&agrave;ng tinh vi v&agrave; kh&oacute; kiểm so&aacute;t, do vậy cần đề cao cảnh gi&aacute;c.</p>

<p>Trong dịp nghỉ Tết Nguy&ecirc;n đ&aacute;n Mậu Tuất 2018, để sẵn s&agrave;ng ứng ph&oacute; sự cố đối với c&aacute;c cuộc tấn c&ocirc;ng nhằm v&agrave;o c&aacute;c hệ thống th&ocirc;ng tin, dịch vụ c&ocirc;ng nghệ th&ocirc;ng tin, Trung t&acirc;m VNCERT đ&atilde;&nbsp;gửi c&ocirc;ng văn tới tất cả th&agrave;nh vi&ecirc;n Mạng lưới ứng cứu an to&agrave;n th&ocirc;ng tin mạng quốc gia, y&ecirc;u cầu c&aacute;c&nbsp;đơn vị tăng cường theo d&otilde;i, gi&aacute;m s&aacute;t hệ thống để nhanh ch&oacute;ng ph&aacute;t hiện sớm c&aacute;c hoạt động d&ograve; qu&eacute;t tr&aacute;i ph&eacute;p, tấn c&ocirc;ng từ chối dịch vụ, tấn c&ocirc;ng c&oacute; chủ đ&iacute;ch (APT) v&agrave; c&aacute;c h&agrave;nh động tấn c&ocirc;ng kh&aacute;c nhằm v&agrave;o hệ thống th&ocirc;ng tin thuộc thẩm quyền quản l&yacute; của đơn vị. Chuẩn bị sẵn s&agrave;ng c&aacute;c quy tr&igrave;nh, phương &aacute;n ứng cứu v&agrave; kh&ocirc;i phục hệ thống trong trường hợp bị tấn c&ocirc;ng. B&ecirc;n cạnh đ&oacute;, cần bố tr&iacute; nh&acirc;n sự v&agrave; tăng cường theo d&otilde;i 24/7 t&igrave;nh h&igrave;nh an to&agrave;n th&ocirc;ng tin tại đơn vị, khi ph&aacute;t hiện sự cố kh&ocirc;ng tự xử l&yacute; được, trong v&ograve;ng 24h phải th&ocirc;ng b&aacute;o với Cơ quan điều phối ứng cứu sự cố Quốc gia (VNCERT) để kịp thời điều phối ứng cứu sự cố.</p>

<p><strong>Đầu mối Điều phối ứng cứu sự cố Quốc gia:</strong></p>

<p>Trung t&acirc;m Ứng cứu khẩn cấp m&aacute;y t&iacute;nh Việt Nam - VNCERT</p>

<p>- Địa chỉ: Tầng 5, T&ograve;a nh&agrave; 115 Trần Duy Hưng, Cầu Giấy, H&agrave; Nội;</p>

<p>- Điện thoại&nbsp;đường d&acirc;y n&oacute;ng: 0888 609399; số cố định:&nbsp;024 36404423</p>

<p>- H&ograve;m thư điện tử tiếp nhận b&aacute;o c&aacute;o sự cố:&nbsp;<a href="mailto:ir@vncert.gov.vn">ir@vncert.gov.vn</a>.</p>

<p>(C&ocirc;ng văn đ&atilde; được L&atilde;nh đạo Trung t&acirc;m k&yacute; v&agrave; ban h&agrave;nh ng&agrave;y 6/2/2018).</p>

<p><strong>TBT - VNCERT</strong></p>
', NULL, NULL, NULL, N'', N'~/Data/upload/images/2018.jpg', N'', 0, 5, CAST(N'2018-07-23 20:45:35.153' AS DateTime), 0, 24, NULL, 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (34, 75, 0, N'DANH SÁCH ĐỀ TÀI NCKH VNCERT', N'DANH-SACH-DE-TAI-NCKH-VNCERT', N'', N'<p>(VNCERT.GOV.VN) Danh s&aacute;ch đề t&agrave;i nghi&ecirc;n cứu khoa học cấp Bộ tổng hợp từ năm 2007 đến năm 2015 do Trung t&acirc;m VNCERT chủ tr&igrave;, cập nhật đến ng&agrave;y 01/06/2015... LINK TẢI DANH S&Aacute;CH ĐỀ T&Agrave;I TẠI Đ&Acirc;Y ...</p>
', N'<p><em><strong>(VNCERT.GOV.VN) Danh s&aacute;ch đề t&agrave;i nghi&ecirc;n cứu khoa học cấp Bộ tổng hợp từ năm 2007 đến năm 2015 do Trung t&acirc;m VNCERT chủ tr&igrave;, cập nhật đến ng&agrave;y 01/06/2015...</strong></em></p>

<p style="text-align:center"><em><strong><img alt="" src="/Data/upload/images/NCPT/NCPT1.png" style="height:795px; width:653px" /></strong></em></p>

<p style="text-align:center"><em><strong><img alt="" src="/Data/upload/images/NCPT/NCPT2.png" style="height:792px; width:634px" /></strong></em></p>

<p style="text-align:center"><em><strong><img alt="" src="/Data/upload/images/NCPT/NCPT3.png" style="height:728px; width:625px" /></strong></em></p>

<p style="text-align:center"><a href="/Data/upload/files/De_tai_khoa_hoc_vncert.doc"><strong>LINK TẢI DANH S&Aacute;CH ĐỀ T&Agrave;I TẠI Đ&Acirc;Y</strong></a></p>
', NULL, NULL, NULL, N'', N'~/Data/upload/images/NCPT/NCPT4.jpg', N'', 0, 5, CAST(N'2018-07-23 21:36:17.490' AS DateTime), 0, 25, NULL, 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (35, 76, 0, N'VNCERT KHAI GIẢNG KHÓA ĐÀO TẠO PHÂN TÍCH MÃ ĐỘC', N'VNCERT-KHAI-GIANG-KHOA-DAO-TAO-PHAN-TICH-MA-DOC', N'', N'<p>(VNCERT.GOV.VN) Trước b&ocirc;́i cảnh tình hình an toàn mạng trong khu vực và th&ecirc;́ giới có nhi&ecirc;̀u di&ecirc;̃n bi&ecirc;́n phức tạp, mã đ&ocirc;̣c WannaCry bùng phát mạnh mẽ và l&acirc;y nhiễm hơn 300.000 m&aacute;y t&iacute;nh sử dụng h&ecirc;̣ đi&ecirc;̀u hành Windows tại hơn 100 quốc gia, Trung t&acirc;m VNCERT t&amp;...</p>
', N'<p>(VNCERT.GOV.VN) Trước b&ocirc;́i cảnh tình hình an toàn mạng trong khu vực và th&ecirc;́ giới có nhi&ecirc;̀u di&ecirc;̃n bi&ecirc;́n phức tạp, mã đ&ocirc;̣c WannaCry bùng phát mạnh mẽ và l&acirc;y nhiễm hơn 300.000 m&aacute;y t&iacute;nh sử dụng h&ecirc;̣ đi&ecirc;̀u hành Windows tại hơn 100 quốc gia, Trung t&acirc;m VNCERT t&ocirc;̉ chức các Khóa đào tạo Ph&acirc;n tích mã đ&ocirc;̣c từ cơ bản đ&ecirc;́n n&acirc;ng cao dành cho các cán b&ocirc;̣ kỹ thu&acirc;̣t an toàn mạng, đặc bi&ecirc;̣t là các cán b&ocirc;̣ kỹ thu&acirc;̣t thu&ocirc;̣c c&aacute;c cơ quan, t&ocirc;̉ chức là th&agrave;nh vi&ecirc;n Mạng lưới Ứng cứu sự cố an to&agrave;n th&ocirc;ng tin mạng qu&ocirc;́c gia và đào tạo chuy&ecirc;n gia an toàn th&ocirc;ng tin của các nước đ&ocirc;́i tác.</p>

<p style="text-align:center"><img alt="" src="/Data/upload/images/NCPT/TV1_2.jpg" style="height:394px; width:700px" /></p>

<p style="text-align:center"><em>Ti&ecirc;́n sỹ Nguy&ecirc;̃n Khắc Lịch, Phó Giám đ&ocirc;́c VNCERT phát bi&ecirc;̉u khai giảng Khóa đào tạo.</em></p>

<p>Khóa đào tạo Ph&acirc;n tích mã đ&ocirc;̣c đ&acirc;̀u ti&ecirc;n vừa khai giảng vào sáng 29/5/2017 đã tạo đi&ecirc;̀u ki&ecirc;̣n cho hơn 30 cán b&ocirc;̣ kỹ thu&acirc;̣t thu&ocirc;̣c 8 cơ quan, doanh nghi&ecirc;̣p là thành vi&ecirc;n Mạng lưới hoặc là đ&ocirc;́i tác của VNCERT được tham gia đào tạo, n&acirc;ng cao trình đ&ocirc;̣, kỹ năng ph&acirc;n tích mã đ&ocirc;̣c chuy&ecirc;n s&acirc;u đ&ecirc;̉ có khả năng chủ đ&ocirc;̣ng ứng phó với các cu&ocirc;̣c t&acirc;́n c&ocirc;ng sử dụng mã đ&ocirc;̣c có chủ đích.</p>

<p style="text-align:center"><img alt="" src="/Data/upload/images/NCPT/TV1_3.jpg" style="height:475px; width:800px" /></p>

<p style="text-align:center"><em>Cán b&ocirc;̣ LaoCERT phát bi&ecirc;̉u tại L&ecirc;̃ Khai giảng của Khóa đào tạo</em></p>

<p>Tham dự Khóa đào tạo này còn có sự tham gia của 04 cán b&ocirc;̣ Trung t&acirc;m Ứng cứu kh&acirc;̉n c&acirc;́p máy tính Lào (LaoCERT). Đ&acirc;y là cơ h&ocirc;̣i đ&ecirc;̉ các cán b&ocirc;̣ kỹ thu&acirc;̣t của LaoCERT và của Vi&ecirc;̣t Nam được thực hành thực ti&ecirc;̃n các kỹ thu&acirc;̣t ph&acirc;n tích mã đ&ocirc;̣c trong JavaScript, các kỹ thuật thu thập v&agrave; ph&acirc;n t&iacute;ch bộ nhớ m&aacute;y t&iacute;nh (RAM, HDD v&agrave; thẻ nhớ), kỹ thuật ph&acirc;n t&iacute;ch m&atilde; độc Surface Analysis, Runtime Analysis, Static Analysis và một số hệ thống gi&aacute;m s&aacute;t v&agrave; ph&acirc;n t&iacute;ch m&atilde; độc tự động.</p>

<p style="text-align:center"><img alt="" src="/Data/upload/images/NCPT/TV1_4.jpg" style="height:476px; width:700px" /></p>

<p>Theo ghi nh&acirc;̣n của Trung t&acirc;m VNCERT, Tại Vi&ecirc;̣t Nam đã có khoảng hơn 13.000 trang web bị hack trong năm 2016. Trong nửa đ&acirc;̀u năm 2017 (tính đ&ecirc;́n ngày 15/5/2017) có khoảng hơn 5.345 trang web bị hack. Trước tình hình này, Trung t&acirc;m VNCERT dự ki&ecirc;́n sẽ ti&ecirc;́p tục t&ocirc;̉ chức các Khóa đào tạo khác từ cơ bản đ&ecirc;́n n&acirc;ng cao đ&ecirc;̉ ti&ecirc;́p tục trang bị kỹ năng, ki&ecirc;́n thức v&ecirc;̀ Ph&acirc;n tích mã đ&ocirc;̣c cho các cán b&ocirc;̣ kỹ thu&acirc;̣t trong và ngoài nước và đáp ứng nhu c&acirc;̀u của các thành vi&ecirc;n Mạng lưới Ứng cứu sự c&ocirc;́ an toàn th&ocirc;ng tin mạng qu&ocirc;́c gia như:</p>

<ol>
	<li>Basic Malware Analysis (Ph&acirc;n tích mã đ&ocirc;̣c cơ bản).</li>
	<li>Advanced Malware Analysis (Ph&acirc;n tích mã đ&ocirc;̣c n&acirc;ng cao).</li>
	<li>Practical Malware Analysis (Ph&acirc;n tích mã đ&ocirc;̣c thực hành).</li>
</ol>

<p>C&aacute;c đơn vị có nhu c&acirc;̀u cử c&aacute;n bộ kỹ thuật tham gia c&aacute;c Kh&oacute;a đào tạo n&ecirc;u tr&ecirc;n có th&ecirc;̉ li&ecirc;n h&ecirc;̣ chuy&ecirc;n vi&ecirc;n Ng&ocirc; Thị Minh Sử, đi&ecirc;̣n thoại: 01252.046.713, email: suntm@vncert.gov.vn hoặc li&ecirc;n h&ecirc;̣ trực ti&ecirc;́p đến Trụ sở Trung t&acirc;m VNCERT, đi&ecirc;̣n thoại 04.3640.4421 để c&oacute; th&ocirc;ng tin chi tiết.</p>

<p><em>Một số h&igrave;nh ảnh tại lớp đ&agrave;o tạo &ldquo;Ph&acirc;n t&iacute;ch m&atilde; độc&rdquo;:</em></p>

<p style="text-align:center"><em><img alt="" src="/Data/upload/images/NCPT/TV1_6.jpg" style="height:519px; width:800px" /></em></p>

<p style="text-align:center"><em><img alt="" src="/Data/upload/images/NCPT/TV1_7.jpg" style="height:500px; width:800px" /></em></p>

<p style="text-align:right"><strong>TBT - VNCERT</strong></p>
', NULL, NULL, NULL, N'', N'~/Data/upload/images/NCPT/TV1_1.jpg', N'', 0, 1, CAST(N'2018-07-23 21:48:30.457' AS DateTime), 0, 26, NULL, 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (36, 76, 0, N'Đào tạo tập huấn ATTT tại Bắc Kạn 2015', N'Dao-tao-tap-huan-ATTT-tai-Bac-Kan-2015', N'', N'<p>(VNCERT.GOV.VN) Những năm gần đ&acirc;y, Sở Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng tỉnh Bắc Kạn đ&atilde; từng bước thực hiện kế hoạch tăng cường đảm bảo an to&agrave;n th&ocirc;ng tin cho hệ thống th&ocirc;ng tin thuộc địa b&agrave;n tỉnh. Trong đ&oacute; c&oacute; việc triển khai c&aacute;c chương tr&igrave;nh đ&agrave;o tạo ph&aacute;t tri...</p>
', N'<p><em><strong>(VNCERT.GOV.VN) Những năm gần đ&acirc;y, Sở Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng tỉnh Bắc Kạn đ&atilde; từng bước thực hiện kế hoạch tăng cường đảm bảo an to&agrave;n th&ocirc;ng tin cho hệ thống th&ocirc;ng tin thuộc địa b&agrave;n tỉnh. Trong đ&oacute; c&oacute; việc triển khai c&aacute;c chương tr&igrave;nh đ&agrave;o tạo ph&aacute;t triển nguồn nh&acirc;n lực về an to&agrave;n th&ocirc;ng tin (ATTT).</strong></em></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;Tiếp tục triển khai c&aacute;c chương tr&igrave;nh đ&agrave;o tạo về ATTT cho c&aacute;c c&aacute;n bộ chuy&ecirc;n tr&aacute;ch v&agrave; b&aacute;n chuy&ecirc;n tr&aacute;ch về c&ocirc;ng nghệ th&ocirc;ng tin thuộc c&aacute;c sở, ban, ng&agrave;nh v&agrave; c&aacute;c huyện thuộc tỉnh Bắc Kạn được thực hiện từ năm 2014. Trong 4 ng&agrave;y, từ 26 đến 29/5/2015, Sở Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng tỉnh Bắc Kạn tiếp tục phối hợp với Trung t&acirc;m VNCERT tổ chức kh&oacute;a học kỹ thuật về an to&agrave;n th&ocirc;ng tin &ndash; chuy&ecirc;n đề cơ bản về đ&aacute;nh gi&aacute; an to&agrave;n th&ocirc;ng tin.</p>

<p style="text-align:center"><img alt="" src="/Data/upload/images/NCPT/TV2_2.jpg" style="height:300px; width:400px" /></p>

<p style="text-align:center">&nbsp;Đ&acirc;y l&agrave; nội dung mới, hấp dẫn đối với học vi&ecirc;n, n&ecirc;n việc tổ chức dạy v&agrave; học được Sở tổ chức th&agrave;nh c&ocirc;ng tốt đẹp.</p>

<p style="text-align:right"><strong>TBT - VNCERT</strong></p>
', NULL, NULL, NULL, N'', N'~/Data/upload/images/NCPT/TV2_1.jpg', N'', 0, 1, CAST(N'2018-07-23 21:56:31.723' AS DateTime), 0, 27, NULL, 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (37, 74, 0, N'DIỄN ĐÀN CAMP TẠI HÀ NỘI', N'DIEN-DAN-CAMP-TAI-HA-NOI', N'', N'<p>Ng&agrave;y 13 v&agrave; 14 th&aacute;ng 12 năm 2017,&nbsp;Diễn đ&agrave;n khu vực lần thứ 2 của&nbsp;Li&ecirc;n minh An to&agrave;n mạng v&igrave; sự ph&aacute;t triển chung (CAMP) đ&atilde; c&oacute; hai ng&agrave;y l&agrave;m việc hiệu quả tại H&agrave; Nội. Sự kiện n&agrave;y do CAMP phối hợp với Cơ quan An to&agrave;n Mạng v&agrave; Internet H...</p>
', N'<p>Ng&agrave;y 13 v&agrave; 14 th&aacute;ng 12 năm 2017,&nbsp;<strong>Diễn đ&agrave;n khu vực lần thứ 2 của&nbsp;</strong>Li&ecirc;n minh An to&agrave;n mạng v&igrave; sự ph&aacute;t triển chung (CAMP) đ&atilde; c&oacute; hai ng&agrave;y l&agrave;m việc hiệu quả tại H&agrave; Nội. Sự kiện n&agrave;y do CAMP phối hợp với Cơ quan An to&agrave;n Mạng v&agrave; Internet H&agrave;n Quốc (KISA), Trung t&acirc;m Ứng cứu khẩn cấp m&aacute;y t&iacute;nh Việt Nam (VNCERT) đồng tổ chức.</p>

<p><img alt="" src="/Data/upload/images/a1.jpg" style="height:450px; width:800px" /></p>

<p style="text-align:center"><em>Đại biểu tham dự Hội nghị chụp ảnh lưu niệm</em></p>

<p>Ng&agrave;y thứ nhất, Diễn đ&agrave;n trao đổi, chia sẻ kinh nghiệm trong lĩnh vực ứng cứu sự cố m&aacute;y t&iacute;nh, gi&aacute;m s&aacute;t an to&agrave;n mạng, tr&igrave;nh b&agrave;y c&aacute;c biện ph&aacute;p đối ph&oacute; tấn c&ocirc;ng, việc ph&ograve;ng thủ trước c&aacute;c mối đe dọa, hiểm họa tr&ecirc;n mạng v&agrave; c&aacute;c m&ocirc; h&igrave;nh, hoạt động của tổ chức CERT/CSIRT.</p>

<p><img alt="" src="/Data/upload/images/a2.jpg" style="height:561px; width:750px" /></p>

<p style="text-align:center"><em>B&agrave; Lee Miyeon, C&ocirc;ng sứ đặc mệnh to&agrave;n quyền H&agrave;n Quốc tại Việt Nam</em></p>

<p>Ph&aacute;t biểu ch&agrave;o mừng Diễn đ&agrave;n c&oacute; Thứ trưởng Bộ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng Nguyễn Th&agrave;nh Hưng, C&ocirc;ng sứ đặc mệnh to&agrave;n quyền H&agrave;n Quốc tại Việt Nam, b&agrave; Lee Miyeon.</p>

<p><img alt="" src="/Data/upload/images/a3.jpg" style="height:521px; width:750px" /></p>

<p style="text-align:center"><em>Thứ trưởng Nguyễn Th&agrave;nh Hưng ph&aacute;t biểu tại sự kiện</em></p>

<p>Đo&agrave;n c&ocirc;ng t&aacute;c Việt Nam do Tiến sỹ Nguyễn Khắc Lịch, Ph&oacute; Gi&aacute;m đốc VNCERT l&agrave; Trưởng đo&agrave;n. B&ecirc;n cạnh đ&oacute; c&ograve;n c&oacute;: L&atilde;nh đạo Cục An to&agrave;n th&ocirc;ng tin - &Ocirc;ng Nguyễn Huy Dũng, Ph&oacute; Cục trưởng; L&atilde;nh đạo Trung t&acirc;m Chứng thực điện tử quốc gia - &ocirc;ng Đặng Đ&igrave;nh Trường; L&atilde;nh đạo Sở Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng H&agrave; Nội - &ocirc;ng Đặng Vũ Tuấn, Ph&oacute; Gi&aacute;m đốc Sở v&agrave; đại diện nhiều cơ quan bộ, ban, ng&agrave;nh kh&aacute;c đ&atilde; tham gia c&aacute;c buổi l&agrave;m việc.</p>

<p><img alt="" src="/Data/upload/images/a4.jpg" style="height:371px; width:750px" /></p>

<p style="text-align:center"><em>Đại diện cơ quan, ban, ng&agrave;nh tại Việt Nam</em></p>

<p>Tham dự Diễn đ&agrave;n, ngo&agrave;i c&aacute;c đại diện của Việt Nam v&agrave; H&agrave;n Quốc, sự kiện c&ograve;n c&oacute; c&aacute;c đại biểu từ Malaysia, Indonesia, Cambodia, Uganda, Kosovo, Mauritius, M&ocirc;ng Cổ.</p>

<p><img alt="" src="/Data/upload/images/a5.jpg" style="height:458px; width:750px" /></p>

<p style="text-align:center"><em>Đại diện c&aacute;c nước tham dự sự kiện</em></p>

<p>CAMP hiện nay l&agrave; li&ecirc;n minh của hơn 40 tổ chức hoạt động trong lĩnh vực an to&agrave;n th&ocirc;ng tin từ 29 quốc gia tr&ecirc;n to&agrave;n cầu. Li&ecirc;n minh n&agrave;y được th&agrave;nh lập theo s&aacute;ng kiến của H&agrave;n Quốc v&agrave; ch&iacute;nh thức ra mắt v&agrave;o th&aacute;ng 7 năm 2016 tại Seoul, H&agrave;n Quốc.&nbsp;</p>

<p><img alt="" src="/Data/upload/images/a6.jpg" style="height:531px; width:650px" /></p>

<p style="text-align:center"><em>Chuy&ecirc;n gia ATTT H&agrave;n Quốc chia sẻ về th&ocirc;ng tin</em></p>

<p>Ng&agrave;y thứ hai, CAMP đ&atilde; c&oacute; cuộc họp Ban Điều h&agrave;nh tổng kết c&aacute;c hoạt động năm 2017 v&agrave; thống nhất c&aacute;c kế hoạch hoạt động năm 2018 của Li&ecirc;n minh.</p>

<p><img alt="" src="/Data/upload/images/a7.jpg" style="height:486px; width:800px" /></p>

<p>H&igrave;nh ảnh Đo&agrave;n đại&nbsp;biểu c&aacute;c nước đến thăm trụ sở VNCERT, Ph&oacute; Gi&aacute;m đốc Trung t&acirc;m&nbsp;Nguyễn Khắc Lịch trao qu&agrave; v&agrave; chụp ảnh&nbsp;kỷ niệm:</p>

<p><img alt="" src="/Data/upload/images/stt1.jpg" style="height:473px; width:750px" /></p>

<p><img alt="" src="/Data/upload/images/stt2.jpg" style="height:800px; width:600px" /></p>

<p><img alt="" src="/Data/upload/images/stt3.jpg" style="height:836px; width:627px" /></p>

<p><img alt="" src="/Data/upload/images/stt4.jpg" style="height:800px; width:600px" /></p>

<p><img alt="" src="/Data/upload/images/stt5.jpg" style="height:800px; width:600px" /></p>

<p><img alt="" src="/Data/upload/images/stt6.jpg" style="height:800px; width:600px" /></p>

<p><img alt="" src="/Data/upload/images/stt7.jpg" style="height:800px; width:600px" /></p>

<p><img alt="" src="/Data/upload/images/stt8.jpg" style="height:800px; width:600px" /></p>

<p><img alt="" src="/Data/upload/images/stt9.jpg" style="height:799px; width:600px" /></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', NULL, NULL, NULL, N'', N'~/Data/upload/images/q1.jpg', N'', 0, 5, CAST(N'2018-07-23 22:04:02.587' AS DateTime), 0, 28, NULL, 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (38, 74, 0, N'VNCERT VÀ LAOCERT KÝ KẾT BIÊN BẢN THỎA THUẬN HỢP TÁC TRONG LĨNH VỰC ỨNG CỨU KHẨN CẤP MÁY TÍNH', N'VNCERT-VA-LAOCERT-KY-KET-BIEN-BAN-THOA-THUAN-HOP-TAC-TRONG-LINH-VUC-UNG-CUU-KHAN-CAP-MAY-TINH', N'', N'<p>(VNCERT.GOV.VN) -&nbsp;Chiều ng&agrave;y 22/6/2017, tại buổi Hội đ&agrave;m song phương giữa Bộ TT&amp;TT Việt Nam v&agrave; Bộ Bưu ch&iacute;nh v&agrave; Viễn th&ocirc;ng L&agrave;o, Gi&aacute;m đốc Trung t&acirc;m Ứng cứu khẩn cấp m&aacute;y t&iacute;nh Việt Nam (VNCERT) v&agrave; Gi&aacute;m đốc Trung t&acirc;m Ứng cứu khẩn cấp m&aacute;y t&amp;iacu...</p>
', N'<p>(VNCERT.GOV.VN) -&nbsp;Chiều ng&agrave;y 22/6/2017, tại buổi Hội đ&agrave;m song phương giữa Bộ TT&amp;TT Việt Nam v&agrave; Bộ Bưu ch&iacute;nh v&agrave; Viễn th&ocirc;ng L&agrave;o, Gi&aacute;m đốc Trung t&acirc;m Ứng cứu khẩn cấp m&aacute;y t&iacute;nh Việt Nam (VNCERT) v&agrave; Gi&aacute;m đốc Trung t&acirc;m Ứng cứu khẩn cấp m&aacute;y t&iacute;nh L&agrave;o (LaoCERT) đ&atilde; ch&iacute;nh thức k&yacute; kết Bi&ecirc;n bản thỏa thuận hợp t&aacute;c trong lĩnh vực ứng cứu khẩn cấp m&aacute;y t&iacute;nh giữa 02 quốc gia Việt Nam v&agrave; L&agrave;o.</p>

<p style="text-align:center"><img alt="" src="/Data/upload/images/HTQT/HTQT1_2.jpg" style="height:512px; width:760px" /></p>

<p style="text-align:center"><em>K&yacute; kết Bi&ecirc;n bản hợp t&aacute;c giữa VNCERT v&agrave; LAOCERT về ứng cứu khẩn cấp sự cố m&aacute;y t&iacute;nh</em></p>

<p>VNCERT v&agrave; LaoCERT l&agrave; hai tổ chức CERT quốc gia chịu tr&aacute;ch nhiệm điều phối c&ocirc;ng t&aacute;c ứng cứu khẩn cấp sự cố m&aacute;y t&iacute;nh v&agrave; l&agrave; đầu mối quốc gia của Việt Nam v&agrave; L&agrave;o trong c&ocirc;ng t&aacute;c phối hợp với c&aacute;c tổ chức CERT trong khu vực v&agrave; tr&ecirc;n thế giới.</p>

<p>Trong nhiều năm qua khi LaoCERT vẫn l&agrave; đơn vị trực thuộc Trung t&acirc;m Internet L&agrave;o (LANIC), VNCERT v&agrave; LaoCERT đ&atilde; thể hiện mối quan hệ truyền thống tốt đẹp, mang đậm t&igrave;nh cảm, l&ograve;ng tin tưởng v&agrave; sự gắn b&oacute; keo sơn giữa hai quốc gia, hai d&acirc;n tộc.Hai b&ecirc;n thường xuy&ecirc;n trao đổi đo&agrave;n cấp cao, chia sẻ kinh nghiệm x&acirc;y dựng v&agrave; ph&aacute;t triển CERT quốc gia v&agrave; nhiều hoạt động &yacute; nghĩa kh&aacute;c.</p>

<p style="text-align:center"><img alt="" src="/Data/upload/images/HTQT/HTQT1_3.jpg" style="height:538px; width:760px" /></p>

<p style="text-align:center"><em>VNCERT v&agrave; LaoCERT chụp h&igrave;nh lưu niệm tại buổi l&agrave;m việc song phương v&agrave;o th&aacute;ng 11/2016 tại Vi&ecirc;ng Chăn, L&agrave;o</em></p>

<p>Đặc biệt, VNCERT trong những năm đầu mới th&agrave;nh lập d&ugrave; c&ograve;n gặp nhiều kh&oacute; khăn trong qu&aacute; tr&igrave;nh x&acirc;y dựng v&agrave; ph&aacute;t triển đơn vịnhưng do nhận được sự ủng hộ tuyệt đối của L&atilde;nh đạo Bộ TT&amp;TT Việt Nam, Vụ Hợp t&aacute;c quốc tế, Vụ Tổ chức c&aacute;n bộ n&ecirc;n VNCERT vẫn d&agrave;nh cho LaoCERT những sự hỗ trợ tốt nhất m&agrave; VNCERT c&oacute; thể c&oacute;. VNCERT đ&atilde; thường xuy&ecirc;n tổ chức c&aacute;c Kh&oacute;a đ&agrave;o tạo, hỗ trợ n&acirc;ng cao năng lực cho c&aacute;c c&aacute;n bộ kỹ thuật của LaoCERT. VNCERT đ&atilde; cử c&aacute;n bộ hỗ trợ LaoCERT đảm bảo an to&agrave;n th&ocirc;ng tin mạng cho c&aacute;c sự kiện quốc tế diễn ra tại L&agrave;o như Seagame, Hội nghị cấp cao ASEM 9, ASEAN Meeting 2016 v.v&hellip;</p>

<p style="text-align:center"><img alt="" src="/Data/upload/images/HTQT/HTQT1_4.jpg" style="height:382px; width:564px" /></p>

<p style="text-align:center"><em>VNCERT v&agrave; LaoCERT chụp h&igrave;nh lưu niệm sau buổi Lễ Khai giảng Kh&oacute;a đ&agrave;o tạo Ph&acirc;n t&iacute;ch m&atilde; độc do VNCERT tổ chức v&agrave;o th&aacute;ng 05/2017 d&agrave;nh cho c&aacute;c c&aacute;n bộ kỹ thuật của LaoCERT v&agrave; một số đơn vị th&agrave;nh vi&ecirc;n Mạng lưới Ứng cứu sự cố an to&agrave;n th&ocirc;ng tin mạng quốc gia tại H&agrave; Nội, Việt Nam</em></p>

<p style="text-align:center"><em><img alt="" src="/Data/upload/images/HTQT/HTQT1_5.jpg" style="height:428px; width:760px" /></em></p>

<p style="text-align:center"><em>Ký k&ecirc;́t thỏa thu&acirc;̣n hợp tác MoM l&acirc;̀n thứ 3 giữa VNCERT v&agrave; LANIC(LAOCERT)và t&ocirc;̉ chức Khóa đào tạo Giám sát an toàn mạng dành cho các cán b&ocirc;̣ kỹ thu&acirc;̣t của LaoCERTvào tháng 01/2016 tại Vi&ecirc;ng Chăn, Lào</em></p>

<p style="text-align:center"><em><img alt="" src="/Data/upload/images/HTQT/HTQT1_6.jpg" style="height:505px; width:760px" /></em></p>

<p>&nbsp;</p>

<p style="text-align:center"><em>VNCERT v&agrave; LaoCERT chụp h&igrave;nh lưu niệm tại Lễ Khai giảng Kh&oacute;a đ&agrave;o tạo Gi&aacute;m s&aacute;t mạng v&agrave; xử l&yacute; sự cố do VNCERT tổ chức năm 2015 d&agrave;nh cho c&aacute;c c&aacute;n bộ kỹ thuật của LaoCERT tại H&agrave; Nội, Việt Nam</em></p>

<p>Sau nhiều nỗ lực x&acirc;y dựng v&agrave; ph&aacute;t triển c&ugrave;ng với sự đồng h&agrave;nh, hỗ trợ nhiệt t&igrave;nh của VNCERT, đến cuối năm 2016, LaoCERT đ&atilde; ch&iacute;nh thức t&aacute;ch ra khỏi LANICđể trở th&agrave;nh đơn vị độc lập trực thuộc Bộ Bưu ch&iacute;nh v&agrave; Viễn th&ocirc;ng L&agrave;o.</p>

<p>Chứng kiến Lễ k&yacute; kết Thỏa thuận hợp t&aacute;c (MoU) giữa VNCERT v&agrave; LaoCERT, về ph&iacute;a Bộ TT&amp;TT Việt Nam c&oacute;Bộ trưởng Bộ TT&amp;TT Việt Nam Trương Minh Tuấn, đại diện Văn ph&ograve;ng, Vụ Hợp t&aacute;c Quốc tế, Vụ Bưu ch&iacute;nh, Vụ CNTT, Vụ Thi đua Khen thưởng,&nbsp;&nbsp;Cục Viễn th&ocirc;ng, Cục Tần số V&ocirc; tuyến điện, Cục Tin học h&oacute;a, Cục An to&agrave;n th&ocirc;ng tin, Trung t&acirc;m Chứng thực điện tử quốc gia, VNNIC, Học viện C&ocirc;ng nghệ Bưu ch&iacute;nh Viễn th&ocirc;ng v&agrave; đại diện c&aacute;c doanh nghiệp VNPT, Viettel, VTC,&nbsp;&nbsp;Mobifone, FPT, VNPost; Về ph&iacute;a Bộ Bưu ch&iacute;nh v&agrave; Viễn th&ocirc;ng L&agrave;o c&oacute; Bộ trưởng Bộ Bưu ch&iacute;nh v&agrave; Viễn th&ocirc;ng L&agrave;o Thansamay Kommasith<em>,</em>đại diện Cục Tần số, Trung t&acirc;m x&uacute;c tiến CNTT-TT, Trung t&acirc;m Ch&iacute;nh phủ điện tử, Vụ Tổ chức, Học viện C&ocirc;ng nghệ Bưu ch&iacute;nh Viễn th&ocirc;ng, Vụ CNTT &ndash; TT, Vụ Viễn th&ocirc;ng, Vụ Kế hoạch v&agrave; Hợp t&aacute;c quốc tế, Trung t&acirc;m Internet L&agrave;o, C&ocirc;ng ty Viễn th&ocirc;ng SKY, LTC, ETL,&nbsp;Unitel.</p>

<p>Nh&acirc;n dịp n&agrave;y, Bộ trưởng Bộ Bưu ch&iacute;nh v&agrave; Viễn th&ocirc;ng L&agrave;o Thansamay Kommasith cũng đ&atilde; trao Hu&acirc;n chương Lao động cho hai c&aacute;n bộ của VNCERT l&agrave; &ocirc;ng Phạm Hồng Vĩnh v&agrave; &ocirc;ng Phan Ph&uacute; Thuận v&igrave; đ&atilde; c&oacute; th&agrave;nh t&iacute;ch hỗ trợ L&agrave;o trong c&ocirc;ng t&aacute;c đảm bảo an to&agrave;n mạng tại c&aacute;c kỳ họp ASEAN diễn ra tại L&agrave;o trong năm 2016. Hu&acirc;n chương được trao tặng đ&atilde; thể hiện một phần c&aacute;c nỗ lực, hỗ trợ của VNCERT d&agrave;nh cho LaoCERT trong suốt những năm qua.</p>

<p style="text-align:center"><img alt="" src="/Data/upload/images/HTQT/HTQT1_7.jpg" style="height:359px; width:500px" /></p>

<p style="text-align:center"><em>Bộ trưởng Bộ Bưu ch&iacute;nh v&agrave; Viễn th&ocirc;ng L&agrave;o Thansamay Kommasith (đứng giữa) trao Hu&acirc;n chương Lao động cho c&aacute;n bộ VNCERT (&ocirc;ng Phạm Hồng Vĩnh b&ecirc;n phải v&agrave; &ocirc;ng Phan Ph&uacute; Thuận b&ecirc;n tr&aacute;i)</em></p>

<p style="text-align:center">Một số h&igrave;nh ảnh đ&aacute;ng nhớ kh&aacute;c tại buổi Hội đ&agrave;m song phương giữa Bộ TT&amp;TT Việt Nam v&agrave; Bộ Bưu ch&iacute;nh v&agrave; Viễn th&ocirc;ng L&agrave;o đ&atilde; diễn ra v&agrave;o buổi chiều ng&agrave;y 22/6/2017 tại H&agrave; Nội:</p>

<p style="text-align:center"><img alt="" src="/Data/upload/images/HTQT/HTQT1_8.jpg" style="height:512px; width:760px" /></p>

<p style="text-align:center"><em>Bộ trưởng Bộ TT&amp;TT Việt Nam Trương Minh Tuấn ph&aacute;t biểu tại buổi Hội đ&agrave;m</em></p>

<p style="text-align:center"><em><img alt="" src="/Data/upload/images/HTQT/HTQT1_9.jpg" style="height:512px; width:760px" /></em></p>

<p style="text-align:center"><em>Bộ trưởng Bộ&nbsp;Bưu ch&iacute;nh v&agrave; Viễn th&ocirc;ng&nbsp;L&agrave;o&nbsp;Thansamay Kommasith&nbsp;(ngồi giữa) ph&aacute;t biểu tại buổi Hội đ&agrave;m</em></p>

<p style="text-align:center"><em><img alt="" src="/Data/upload/images/HTQT/HTQT1_10.jpg" style="height:512px; width:760px" /></em></p>

<p style="text-align:center"><em>Đo&agrave;n đại biểu Bộ TT&amp;TT Việt Nam v&agrave; Bộ Bưu ch&iacute;nh v&agrave; Viễn th&ocirc;ng L&agrave;o chụp ảnh lưu niệm</em></p>

<p style="text-align:center"><em><img alt="" src="/Data/upload/images/HTQT/HTQT1_11.jpg" style="height:512px; width:760px" /></em></p>

<p style="text-align:center"><em>Bộ trưởng Bộ TT&amp;TT Trương Minh Tuấn v&agrave; Bộ trưởng Bộ Bưu ch&iacute;nh v&agrave; Viễn th&ocirc;ng L&agrave;o Thansamay Kommasith k&yacute; kết Kế hoạch triển khai thỏa thuận hợp t&aacute;c giữa Bộ TT&amp;TT Việt Nam v&agrave; Bộ Bưu ch&iacute;nh v&agrave; Viễn th&ocirc;ng L&agrave;o</em></p>

<p style="text-align:center"><em><img alt="" src="/Data/upload/images/HTQT/HTQT1_12.jpg" style="height:512px; width:760px" /></em></p>

<p>&nbsp;</p>

<p style="text-align:center"><em>Bộ trưởng Trương Minh Tuấn đ&atilde; trao tặng Kỷ niệm chương V&igrave; sự nghiệp TT&amp;TT cho Bộ trưởng Bộ Bưu ch&iacute;nh v&agrave; Viễn th&ocirc;ng L&agrave;o&nbsp;Thansamay Kommasith</em></p>

<p style="text-align:right"><strong>TBT - VNCERT</strong></p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', NULL, NULL, NULL, N'', N'~/Data/upload/images/HTQT/HTQT1_1.jpg', N'', 0, 1, CAST(N'2018-07-23 22:16:52.330' AS DateTime), 0, 29, NULL, 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (40, 60, 0, N'GIỚI THIỆU VNCERT - TRUNG TÂM ỨNG CỨU KHẨN CẤP MÁY TÍNH VIỆT NAM', N'GIOI-THIEU-VNCERT-TRUNG-TAM-UNG-CUU-KHAN-CAP-MAY-TINH-VIET-NAM', N'', N'<p><strong>Giới thiệu về Trung t&acirc;m Ứng cứu khẩn cấp m&aacute;y t&iacute;nh Việt Nam</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;Trung t&acirc;m Ứng cứu khẩn cấp m&aacute;y t&iacute;nh Việt Nam (VNCERT) l&agrave; tổ chức trực thuộc Bộ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng, thực hiện chức năng điều phối hoạt động ứng cứu sự cố m&aacute;y t&iacute;nh tr&ecirc;n to&agrave;n quốc; cảnh b&aacute;o kịp thời c&aacute;c vấn đề về an to&agrave;n mạng m&aacute;y t&iacute;nh; phối hợp x&acirc;y dựng, phối hợp x&acirc;y dựng c&aacute;c ti&ecirc;u chuẩn, quy chuẩn kỹ thuật về an to&agrave;n mạng m&aacute;y t&iacute;nh; th&uacute;c đẩy h&igrave;nh th&agrave;nh hệ thống c&aacute;c CERT trong c&aacute;c cơ quan, tổ chức, doanh nghiệp; l&agrave; đầu mối trong việc hợp t&aacute;c với c&aacute;c tổ chức ứng cứu m&aacute;y t&iacute;nh (CERT) nước ngo&agrave;i.</p>
', N'<p><strong>Giới thiệu về Trung t&acirc;m Ứng cứu khẩn cấp m&aacute;y t&iacute;nh Việt Nam</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;Trung t&acirc;m Ứng cứu khẩn cấp m&aacute;y t&iacute;nh Việt Nam (VNCERT) l&agrave; tổ chức trực thuộc Bộ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng, thực hiện chức năng điều phối hoạt động ứng cứu sự cố m&aacute;y t&iacute;nh tr&ecirc;n to&agrave;n quốc; cảnh b&aacute;o kịp thời c&aacute;c vấn đề về an to&agrave;n mạng m&aacute;y t&iacute;nh; phối hợp x&acirc;y dựng, phối hợp x&acirc;y dựng c&aacute;c ti&ecirc;u chuẩn, quy chuẩn kỹ thuật về an to&agrave;n mạng m&aacute;y t&iacute;nh; th&uacute;c đẩy h&igrave;nh th&agrave;nh hệ thống c&aacute;c CERT trong c&aacute;c cơ quan, tổ chức, doanh nghiệp; l&agrave; đầu mối trong việc hợp t&aacute;c với c&aacute;c tổ chức ứng cứu m&aacute;y t&iacute;nh (CERT) nước ngo&agrave;i.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;Trung t&acirc;m VNCERTl&agrave; đơn vị sự nghiệp c&ocirc;ng lập, c&oacute; tư c&aacute;ch ph&aacute;p nh&acirc;n, c&oacute; con dấu v&agrave; t&agrave;i khoản ri&ecirc;ng để giao dịch theo quy định của ph&aacute;p luật; c&oacute; trụ sở ch&iacute;nh đặt tại th&agrave;nh phố H&agrave; Nội v&agrave; c&aacute;c chi nh&aacute;nh tại th&agrave;nh phố Hồ Ch&iacute; Minh v&agrave; th&agrave;nh phố Đ&agrave; Nẵng</p>

<p><strong>M&ocirc; h&igrave;nh tổ chức Trung t&acirc;m VNCERT</strong></p>

<p><img src="http://www.vncert.gov.vn/images/sodo.jpg" /></p>

<p><strong>Địa chỉ li&ecirc;n hệ:</strong></p>

<p><strong><em>&bull; Trụ sở ch&iacute;nh:</em></strong><br />
- Địa chỉ: Tầng 5 - T&ograve;a nh&agrave; Cục Tần số V&ocirc; tuyến điện - 115 Trần Duy Hưng - Phường Trung Ho&agrave; - Quận Cầu Giấy - TP. H&agrave; Nội.<br />
- Email: vncert@mic.gov.vn / office@vncert.vn<br />
- Website: http://www.vncert.gov.vn<br />
- Điện thoại: 024.6404423</p>

<p><strong><em>&bull; Chi nh&aacute;nh tại Miền Trung:</em></strong><br />
- Địa chỉ: Tầng 3, số 42 đường Trần Quốc Toản, quận Hải Ch&acirc;u, th&agrave;nh phố Đ&agrave; Nẵng<br />
- Điện thoại: 0236.3843228</p>

<p><strong><em>&bull; Chi nh&aacute;nh tại Miền Nam:</em></strong><br />
- Địa chỉ: 27 Nguyễn Bỉnh Khi&ecirc;m, phường Đa Kao, Quận 1, TP Hồ Ch&iacute; Minh.<br />
- Điện thoại: 028.39104925</p>

<p><strong>Gi&aacute;m đốc:</strong><br />
&Ocirc;ng Nguyễn Trọng Đường<br />
Email: ntduong@vncert.vn<br />
<br />
<strong>Ph&oacute; Gi&aacute;m đốc:</strong><br />
&Ocirc;ng Nguyễn Khắc Lịch<br />
Email: nklich@vncert.vn<br />
<br />
<strong>Ph&oacute; Gi&aacute;m đốc:</strong><br />
&Ocirc;ng Ng&ocirc; Quang Huy<br />
Email: nqhuy@vncert.vn&nbsp;<br />
<br />
<strong>Ph&ograve;ng H&agrave;nh ch&iacute;nh - Tổng hợp:</strong><br />
Ph&oacute; trưởng ph&ograve;ng: B&agrave; Phan Li&ecirc;n Hương<br />
Email: plhuong@vncert.vn<br />
<br />
<strong>Ph&ograve;ng Kế hoạch - T&agrave;i ch&iacute;nh:</strong><br />
Kế to&aacute;n trưởng: B&agrave; Dương Thị Minh<br />
Email: dtminh@vncert.vn<br />
<br />
<strong>Ph&ograve;ng Điều phối v&agrave; Ứng cứu sự cố:</strong><br />
Trưởng ph&ograve;ng: &Ocirc;ng Trần Nguy&ecirc;n Chung<br />
Email: tnchung@vncert.vn<br />
<br />
<strong>Ph&ograve;ng Kỹ thuật hệ thống v&agrave; Gi&aacute;m s&aacute;t:</strong><br />
Ph&oacute; trưởng ph&ograve;ng: &Ocirc;ng Ho&agrave;ng Đăng Trị<br />
Email: hdtri@vncert.vn<br />
<br />
<strong>Ph&ograve;ng Tư vấn v&agrave; Bồi dưỡng nghiệp vụ:</strong><br />
Ph&oacute; trưởng ph&ograve;ng ki&ecirc;m Phụ tr&aacute;ch ph&ograve;ng: &Ocirc;ng Cao Huy Phương<br />
Email: chphuong@vncert.vn<br />
Ph&oacute; trưởng ph&ograve;ng: B&agrave; B&ugrave;i Thanh H&agrave;<br />
Email:btha@vncert.vn<br />
<br />
<strong>Ph&ograve;ng Nghi&ecirc;n cứu Ph&aacute;t triển:</strong><br />
Ph&oacute; trưởng ph&ograve;ng ki&ecirc;m Phụ tr&aacute;ch ph&ograve;ng: &Ocirc;ng Nguyễn Đức Tu&acirc;n<br />
Email: ndtuan@vncert.vn<br />
<br />
<strong>Chi nh&aacute;nh tại th&agrave;nh phố Đ&agrave; Nẵng:</strong><br />
Ph&oacute; trưởng chi nh&aacute;nh ki&ecirc;m Phụ tr&aacute;ch chi nh&aacute;nh: &Ocirc;ng Đặng Hải Sơn<br />
ĐT: 0236.3843228<br />
Email: dhson@vncert.vn<br />
<br />
<strong>Chi nh&aacute;nh tại th&agrave;nh phố Hồ Ch&iacute; Minh:</strong><br />
Ph&oacute; trưởng chi nh&aacute;nh ki&ecirc;m Phụ tr&aacute;ch chi nh&aacute;nh: &Ocirc;ng Nguyễn Hữu Nguy&ecirc;n<br />
ĐT: 028.39104925<br />
Email: nhnguyen@vncert.vn<br />
<br />
<strong>Văn thư, tổng hợp:</strong><br />
Email: vanthuvncert@mic.gov.vn</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;Trung t&acirc;m Ứng cứu khẩn cấp m&aacute;y t&iacute;nh Việt Nam được th&agrave;nh lập theo Quyết định&nbsp;<a href="http://www.vncert.gov.vn/files/QD_339_2005_TTCP.pdf">339/2005/QĐ-TTG</a>&nbsp;của Thủ tướng Ch&iacute;nh phủ. L&agrave; đơn vị trực thuộc Bộ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng c&oacute; c&aacute;c nhiệm vụ, quyền hạn v&agrave; cơ cấu tổ chức theo Quyết định số&nbsp;<a href="https://mic.gov.vn/Upload/VanBan/Q%C4%901443.signed.pdf">1443/QĐ-BTTTT</a>&nbsp;ng&agrave;y 30/8/2017 của Bộ trưởng Bộ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng.</p>

<p>Trung t&acirc;m VNCERT</p>
', NULL, NULL, NULL, N'', N'', N'', 0, 1, CAST(N'2018-07-23 22:35:23.660' AS DateTime), 0, 31, NULL, 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (41, 246, 0, N'THÔNG TIN LIÊN HỆ TRUNG TÂM VNCERT', N'THONG-TIN-LIEN-HE-TRUNG-TAM-VNCERT', N'', N'<p>TH&Ocirc;NG TIN LI&Ecirc;N HỆ TRUNG T&Acirc;M VNCERT</p>
', N'<p><strong>ĐỊA CHỈ CƠ QUAN:</strong></p>

<p><strong><em>&bull; Trụ sở ch&iacute;nh:</em></strong><br />
- Địa chỉ: Tầng 5, T&ograve;a nh&agrave; 115 Trần Duy Hưng - Phường Trung Ho&agrave; - Quận Cầu Giấy - Th&agrave;nh phố H&agrave; Nội.<br />
- Email: vncert@mic.gov.vn / office@vncert.vn<br />
- Website: http://www.vncert.gov.vn<br />
- Điện thoại: 024.6404423</p>

<p><strong><em>&bull; Chi nh&aacute;nh tại Miền Trung:</em></strong><br />
- Địa chỉ: Tầng 3, số 42 đường Trần Quốc Toản, quận Hải Ch&acirc;u, th&agrave;nh phố Đ&agrave; Nẵng<br />
- Điện thoại: 0236.3843228</p>

<p><strong><em>&bull; Chi nh&aacute;nh tại Miền Nam:</em></strong><br />
- Địa chỉ: 27 Nguyễn Bỉnh Khi&ecirc;m, phường Đa Kao, Quận 1, TP Hồ Ch&iacute; Minh.<br />
- Điện thoại: 028.39104925</p>

<p><strong>LI&Ecirc;N HỆ QUA EMAIL:</strong><br />
- Văn thư: vanthuvncert@mic.gov.vn / office@vncert.vn</p>

<p><strong>ĐƯỜNG D&Acirc;Y TIẾP NHẬN XỬ L&Yacute; SỰ CỐ:</strong><br />
- Điện thoại cố định: (084)436404421&nbsp;<br />
- Fax: +84-4-36404427<br />
- B&aacute;o sự cố: ir@vncert.vn<br />
- Ph&ograve;ng Điều phối ứng cứu: 0869100319 / 0888 609399&nbsp;<br />
- Ph&ograve;ng Nghi&ecirc;n cứu ph&aacute;t triển: 0869100320&nbsp;<br />
- Ph&ograve;ng Kỹ thuật hệ thống: 0869100317</p>

<p>Trung t&acirc;m VNCERT</p>
', NULL, NULL, NULL, N'', N'', N'', 0, 1, CAST(N'2018-07-23 22:41:43.943' AS DateTime), 1, 32, CAST(N'2018-07-23 22:42:37.270' AS DateTime), 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (42, 73, 0, N'DIỄN TẬP ASEAN-NHẬT BẢN 2018', N'DIEN-TAP-ASEANNHAT-BAN-2018', N'', N'<p>Cũng như mọi năm, Trung t&acirc;m VNCERT đều tham gia c&aacute;c cuộc diễn tập quốc tế do CERT c&aacute;c quốc gia tổ chức thường ni&ecirc;n. Năm nay, với chủ đề &ldquo;Tấn c&ocirc;ng DoS/DDoS v&agrave; hoạt động phối hợp ứng cứu, xử l&yacute; sự cố&rdquo; của diễn tập Asean &ndash; Nhật Bản 2018 đ&atilde; được tổ chức v&agrave;o ng&agrave;y 23/5/2018, Trung t&acirc;m VNCERT tổ chức tham gia diễn tập tr&ecirc;n cả 03 khu vực: miền Bắc (tại H&agrave; Nội), miền Trung (tại Đ&agrave; Nẵng) v&agrave; miền Nam (tại th&agrave;nh phố Hồ Ch&iacute; Minh).</p>
', N'<p>Cũng như mọi năm, Trung t&acirc;m VNCERT đều tham gia c&aacute;c cuộc diễn tập quốc tế do CERT c&aacute;c quốc gia tổ chức thường ni&ecirc;n. Năm nay, với chủ đề &ldquo;Tấn c&ocirc;ng DoS/DDoS v&agrave; hoạt động phối hợp ứng cứu, xử l&yacute; sự cố&rdquo; của diễn tập Asean &ndash; Nhật Bản 2018 đ&atilde; được tổ chức v&agrave;o ng&agrave;y 23/5/2018, Trung t&acirc;m VNCERT tổ chức tham gia diễn tập tr&ecirc;n cả 03 khu vực: miền Bắc (tại H&agrave; Nội), miền Trung (tại Đ&agrave; Nẵng) v&agrave; miền Nam (tại th&agrave;nh phố Hồ Ch&iacute; Minh).</p>

<p><img alt="" src="http://vncert.vn/images/20180524_nloxsfq16h.jpg" /></p>

<p><em>&Ocirc;ng Nguyễn Trọng Đường, GĐ Trung t&acirc;m VNCERT, ph&aacute;t biểu tại buổi diễn tập</em></p>

<p>Tới tham dự khai mạc c&oacute; Thứ trưởng Bộ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng Nguyễn Th&agrave;nh Hưng, c&aacute;c l&atilde;nh đạo VNCERT v&agrave; một số vị l&atilde;nh đạo thuộc c&aacute;c đơn vị li&ecirc;n quan như: Cục trưởng Cục An to&agrave;n th&ocirc;ng tin,&nbsp; Nguyễn Thanh Hải; &Ocirc;ng Đặng Đ&igrave;nh Trường, Ph&oacute; Gi&aacute;m đốc Trung t&acirc;m Chứng thực Điện tử quốc gia; &Ocirc;ng Vũ Quốc Kh&aacute;nh, Ban chấp h&agrave;nh Hiệp hội An to&agrave;n th&ocirc;n tin VNISA &hellip; B&ecirc;n cạnh đ&oacute; c&ograve;n c&oacute; sự tham gia của gần 300 c&aacute;n bộ quản l&yacute; v&agrave; kỹ thuật của c&aacute;c th&agrave;nh Mạng lưới ứng cứu sự cố an to&agrave;n th&ocirc;ng tin mạng quốc gia đại diện của c&aacute;c Bộ v&agrave; cơ quan ngang Bộ, cơ quan thuộc Ch&iacute;nh phủ; một số Sở th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng; c&aacute;c cơ quan, đơn vị nắm giữ hạ tầng trọng yếu quốc gia; c&aacute;c tổ chức t&agrave;i ch&iacute;nh, ng&acirc;n h&agrave;ng v&agrave; c&aacute;c doanh nghiệp an to&agrave;n th&ocirc;ng tin tr&ecirc;n cả 3 khu vực.</p>

<p><img alt="" src="http://vncert.vn/images/20180524_0eh7sr9xpd.jpg" /></p>

<p><em>H&agrave;ng ghế đầu l&agrave; l&atilde;nh đạo c&aacute;c đơn vị c&ugrave;ng Thứ trưởng Nguyễn Th&agrave;nh Hưng (ngồi giữa, đầu b&agrave;n b&ecirc;n phải) tới tham dự khai mạc</em></p>

<p>Qua c&ocirc;ng t&aacute;c theo d&otilde;i, gi&aacute;m s&aacute;t của hệ thống, trong năm 2017, Trung t&acirc;m ghi nhận&nbsp;<strong>13.382</strong>&nbsp;sự cố tấn c&ocirc;ng mạng v&agrave;o Việt Nam của cả 03 loại h&igrave;nh Phishing, malware v&agrave; deface, trong đ&oacute;: tấn c&ocirc;ng m&atilde; độc (malware) l&agrave;&nbsp;<strong>6.400</strong>&nbsp;trường hợp; tấn c&ocirc;ng thay đổi giao diện (deface) l&agrave;&nbsp;<strong>4.377</strong>trường hợp v&agrave; tấn c&ocirc;ng lừa đảo (phishing) l&agrave;&nbsp;<strong>2.605</strong>&nbsp;trường hợp. Số liệu mới nhất t&iacute;nh từ đầu năm 2018 đến ng&agrave;y 19 th&aacute;ng 5 năm 2018, đ&atilde; ghi nhận tổng cộng&nbsp;<strong>4.035</strong>&nbsp;sự cố tấn c&ocirc;ng mạng v&agrave;o Việt Nam, với&nbsp;<strong>2.661</strong>&nbsp;sự cố deface,&nbsp;<strong>766</strong>&nbsp;sự cố tấn c&ocirc;ng m&atilde; độc malware, v&agrave;&nbsp;<strong>608</strong>&nbsp;sự cố lừa đảo Phishing. H&agrave;ng ng&agrave;y c&oacute; khoảng gần&nbsp;<strong>100,000</strong>&nbsp;địa chỉ mạng của Việt Nam truy vấn hoặc kết nối đến mạng lưới m&aacute;y t&iacute;nh ma (Botnet). C&oacute; thể n&oacute;i t&igrave;nh h&igrave;nh an to&agrave;n th&ocirc;ng tin, tấn c&ocirc;ng mạng ng&agrave;y c&agrave;ng tinh vi, phức tạp, v&agrave; xảy ra tr&ecirc;n diện rộng, do vậy, c&aacute;c cuộc diễn tập sẽ vẫn được duy tr&igrave; định kỳ trong c&aacute;c năm tiếp theo.</p>

<p><img alt="" src="http://vncert.vn/images/20180524_g4lij89bax.jpg" /></p>

<p><em>C&aacute;c đội chơi thuộc c&aacute;c đơn vị th&agrave;nh vi&ecirc;n mạng lưới</em></p>

<p>Diễn tập Asean - Nhật Bản lần n&agrave;y kh&ocirc;ng thi&ecirc;n về hướng giải quyết vấn đề kỹ&nbsp;thuật đối với một loại h&igrave;nh tấn c&ocirc;ng cụ thể m&agrave; tập trung v&agrave; hướng tới h&igrave;nh th&agrave;nh Một khung c&aacute;c quy tắc về trao đổi, chia sẻ th&ocirc;ng tin, hỗ trợ ứng cứu sự cố một c&aacute;ch tin cậy v&agrave; th&ocirc;ng suốt giữa c&aacute;c CERTs quốc gia v&agrave; giữa CERT quốc gia với c&aacute;c đơn vị li&ecirc;n quan, CSIRTs tại quốc gia đ&oacute;. Qua đ&oacute; c&oacute; thể nhận&nbsp;biết v&agrave; cảnh b&aacute;o sớm về c&aacute;c đợt tấn c&ocirc;ng, tận dụng được thế mạnh v&agrave; kinh nghiệm của c&aacute;c CERTs quốc gia, c&aacute;c CSIRTs v&agrave; đơn vị li&ecirc;n quan.</p>
', NULL, NULL, NULL, N'', N'~/Data/upload/files/20180524_nloxsfq16h.jpg', N'', 0, 6, CAST(N'2018-07-24 08:30:01.667' AS DateTime), 6, 33, CAST(N'2018-07-25 11:35:16.457' AS DateTime), 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (43, 71, 0, N'CÁC QUỐC GIA CÓ NGUỒN TẤN CÔNG VÀO VIỆT NAM NHIỀU NHẤT', N'CAC-QUOC-GIA-CO-NGUON-TAN-CONG-VAO-VIET-NAM-NHIEU-NHAT', N'', N'<p>&nbsp; (VNCERT.GOV.VN)Ng&agrave;y nay, t&igrave;nh trạng tấn c&ocirc;ng qua mạng giữa c&aacute;c quốc gia diễn ra ng&agrave;y c&agrave;ng nghi&ecirc;m trọng. Việt Nam đang l&agrave; quốc gia c&oacute; tốc độ ph&aacute;t triển về c&ocirc;ng nghệ th&ocirc;ng tin nhanh nhất&nbsp; tại khu vực Đ&ocirc;ng Nam &Aacute;, v&igrave; vậy c&oacute; thể l&agrave; mục ti&ecirc;u tấn c&ocirc;ng của tội phạm mạng to&agrave;n cầu.</p>
', N'<p><strong>&nbsp;(VNCERT.GOV.VN)Ng&agrave;y nay, t&igrave;nh trạng tấn c&ocirc;ng qua mạng giữa c&aacute;c quốc gia diễn ra ng&agrave;y c&agrave;ng nghi&ecirc;m trọng. Việt Nam đang l&agrave; quốc gia c&oacute; tốc độ ph&aacute;t triển về c&ocirc;ng nghệ th&ocirc;ng tin nhanh nhất&nbsp; tại khu vực Đ&ocirc;ng Nam &Aacute;, v&igrave; vậy c&oacute; thể l&agrave; mục ti&ecirc;u tấn c&ocirc;ng của tội phạm mạng to&agrave;n cầu.</strong></p>

<p><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Bằng thiết bị gi&aacute;m s&aacute;t mạng ti&ecirc;n tiến, Trung t&acirc;m đ&atilde; theo d&otilde;i v&agrave; ghi nhận được những cuộc tấn c&ocirc;ng v&agrave;o hệ thống th&ocirc;ng tin của Việt Nam. Dưới đ&acirc;y l&agrave; biểu đồ ghi lại danh s&aacute;ch 05 quốc gia c&oacute; nguồn địa chỉ IP tấn c&ocirc;ng mạng nước ta nhiều nhất năm trong 2015, được chia theo từng qu&yacute;.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<strong>Qu&yacute; I năm 2015:</strong></p>

<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt="" src="/Data/upload/images/User/1(1).jpg" style="height:316px; width:572px" /></strong></p>

<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Qu&yacute; II năm 2015:</strong></p>

<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="/Data/upload/images/User/2.jpg" style="height:333px; width:568px" /></strong></p>

<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Qu&yacute; III năm 2015:</strong></p>

<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="/Data/upload/images/User/3(1).jpg" style="height:316px; width:571px" /></strong></p>

<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Qu&yacute; IV năm 2015:</strong></p>

<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt="" src="/Data/upload/images/User/4.jpg" style="height:318px; width:572px" /></strong></p>

<p><strong>&nbsp;&nbsp;&nbsp;</strong>Thống k&ecirc; tr&ecirc;n cho thấy, hệ thống th&ocirc;ng tin của nước ta bị tấn c&ocirc;ng từ rất nhiều quốc gia, đặc biệt l&agrave; Mỹ, Trung Quốc&hellip; Những quốc gia n&agrave;y c&oacute; nền c&ocirc;ng nghệ th&ocirc;ng tin rất ph&aacute;t triển, do đ&oacute; c&aacute;c đơn vị, tổ chức trong nước cần li&ecirc;n kết chặt chẽ với c&aacute;c nước trong khu vực cũng như tr&ecirc;n thế giới để cập nhật kiến thức, n&acirc;ng cao khả năng ứng ph&oacute; với c&aacute;c lực lượng tấn c&ocirc;ng mạng từ quốc gia nước tr&ecirc;n thế giới.</p>

<p><strong>TBT - VNCERT</strong></p>
', NULL, NULL, NULL, N'', N'~/Data/upload/images/User/3.jpg', N'', 0, 6, CAST(N'2018-07-24 09:21:36.030' AS DateTime), 5, 34, CAST(N'2018-07-25 14:54:48.603' AS DateTime), 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (44, 71, 0, N'TỔNG QUAN VỀ HỆ THỐNG GIÁM SÁT MẠNG', N'TONG-QUAN-VE-HE-THONG-GIAM-SAT-MANG', N'', N'<p><em><strong>&nbsp;</strong></em>(VNCERT.GOV.VN) Hệ thống gi&aacute;m s&aacute;t an to&agrave;n mạng đ&oacute;ng vai tr&ograve; quan trọng, kh&ocirc;ng thể thiếu trong hạ tầng c&ocirc;ng nghệ th&ocirc;ng tin (CNTT) của c&aacute;c cơ quan, đơn vị, tổ chức. Hệ thống n&agrave;y cho ph&eacute;p thu thập, chuẩn h&oacute;a, lưu trữ v&agrave; ph&acirc;n t&iacute;ch tương quan to&agrave;n bộ c&aacute;c sự kiện an to&agrave;n mạng được sinh ra trong hệ thống CNTT của tổ chức.</p>
', N'<p>(VNCERT.GOV.VN) Hệ thống gi&aacute;m s&aacute;t an to&agrave;n mạng đ&oacute;ng vai tr&ograve; quan trọng, kh&ocirc;ng thể thiếu trong hạ tầng c&ocirc;ng nghệ th&ocirc;ng tin (CNTT) của c&aacute;c cơ quan, đơn vị, tổ chức. Hệ thống n&agrave;y cho ph&eacute;p thu thập, chuẩn h&oacute;a, lưu trữ v&agrave; ph&acirc;n t&iacute;ch tương quan to&agrave;n bộ c&aacute;c sự kiện an to&agrave;n mạng được sinh ra trong hệ thống CNTT của tổ chức.</p>

<p>&nbsp;&nbsp;Ngo&agrave;i ra, hệ thống gi&aacute;m s&aacute;t an to&agrave;n mạng ph&aacute;t hiện kịp thời c&aacute;c tấn c&ocirc;ng mạng, c&aacute;c điểm yếu, lỗ hổng bảo mật của c&aacute;c thiết bị, ứng dụng v&agrave; dịch vụ trong hệ thống. Ph&aacute;t hiện kịp thời sự b&ugrave;ng nổ virus trong hệ thống mạng, c&aacute;c m&aacute;y t&iacute;nh bị nhiễm m&atilde; độc, c&aacute;c m&aacute;y t&iacute;nh bị nghi ngờ l&agrave; th&agrave;nh vi&ecirc;n của mạng m&aacute;y t&iacute;nh ma (botnet).</p>

<p><strong>1. C&aacute;c yếu tố cơ bản của gi&aacute;m s&aacute;t</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;Để c&ocirc;ng t&aacute;c gi&aacute;m s&aacute;t an to&agrave;n mạng đạt hiệu quả cần phải x&aacute;c định được c&aacute;c yếu tố cốt l&otilde;i, cơ bản nhất của gi&aacute;m s&aacute;t như:<br />
- X&aacute;c định c&aacute;c đơn vị, hệ thống, thiết bị, dịch vụ cần gi&aacute;m s&aacute;t.<br />
- X&aacute;c định trang thiết bị, giải ph&aacute;p phần mềm thương mại phục vụ gi&aacute;m s&aacute;t.<br />
- X&aacute;c định phần mềm nội bộ v&agrave; phần mềm nguồn mở phục vụ gi&aacute;m s&aacute;t.<br />
- X&aacute;c định c&aacute;c thiết bị, c&ocirc;ng cụ, giải ph&aacute;p hỗ trợ ph&acirc;n t&iacute;ch kết quả gi&aacute;m s&aacute;t: c&ocirc;ng cụ NMAP, TCPDUMP, Wireshark, Nessus...<br />
Ngo&agrave;i c&aacute;c trang thiết bị, c&ocirc;ng cụ, giải ph&aacute;p hỗ trợ th&igrave; yếu tố con người v&agrave; đặc biệt l&agrave; quy tr&igrave;nh phục vụ gi&aacute;m s&aacute;t l&agrave; v&ocirc; c&ugrave;ng quan trọng.</p>

<p><strong>2. C&aacute;c giải ph&aacute;p c&ocirc;ng nghệ gi&aacute;m s&aacute;t an to&agrave;n mạng</strong></p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;Hệ thống gi&aacute;m s&aacute;t an to&agrave;n mạng c&oacute; thể được x&acirc;y dựng theo một trong ba giải ph&aacute;p sau:<br />
- Giải ph&aacute;p quản l&yacute; th&ocirc;ng tin an ninh: tập trung v&agrave;o việc thu thập, lưu trữ v&agrave; biểu diễn nhật k&yacute;.<br />
- Giải ph&aacute;p quản l&yacute; sự kiện an ninh: tập trung v&agrave;o việc ph&acirc;n t&iacute;ch v&agrave; xử l&yacute; c&aacute;c nhật k&yacute; đ&atilde; được thu thập để đưa ra cảnh b&aacute;o cho người d&ugrave;ng.<br />
- Giải ph&aacute;p quản l&yacute; v&agrave; ph&acirc;n t&iacute;ch sự kiện an ninh: l&agrave; sự kết hợp của cả hai giải ph&aacute;p tr&ecirc;n nhằm khắc phục những hạn chế vốn c&oacute;. V&igrave; vậy, t&agrave;i liệu sẽ hướng tới x&acirc;y dựng giải ph&aacute;p n&agrave;y.</p>

<p><strong>3. Giải ph&aacute;p quản l&yacute; v&agrave; ph&acirc;n t&iacute;ch sự kiện an ninh</strong></p>

<p><img alt="" src="/Data/upload/images/User/31.png" style="height:298px; width:450px" /></p>

<p><img alt="" src="/Data/upload/images/User/32.png" style="height:282px; width:454px" /></p>

<p><img alt="" src="/Data/upload/images/User/33.png" style="height:235px; width:313px" /></p>

<p>&nbsp;<strong>M&ocirc; h&igrave;nh giải ph&aacute;p quản l&yacute; v&agrave; ph&acirc;n t&iacute;ch sự kiện an ninh gồm 03 th&agrave;nh phần ch&iacute;nh:</strong><br />
<strong><em>a. Th&agrave;nh phần thu thập nhật k&yacute; an to&agrave;n mạng, bao gồm c&aacute;c giao diện thu thập nhật k&yacute; an to&agrave;n mạng trực tiếp từ c&aacute;c thiết bị, dịch vụ, ứng dụng. Th&agrave;nh phần n&agrave;y c&oacute; c&aacute;c t&iacute;nh năng:</em></strong><br />
- Thu thập to&agrave;n bộ dữ liệu nhật k&yacute; từ c&aacute;c nguồn thiết bị, ứng dụng,&hellip; gồm cả c&aacute;c thiết bị vật l&yacute; v&agrave; thiết bị ảo h&oacute;a.<br />
- Kiểm so&aacute;t băng th&ocirc;ng v&agrave; kh&ocirc;ng gian lưu trữ th&ocirc;ng qua khả năng chọn lọc dữ liệu nhật k&yacute;.<br />
- Ph&acirc;n t&aacute;ch từng sự kiện v&agrave; chuẩn h&oacute;a c&aacute;c sự kiện v&agrave;o một lược đồ chung.<br />
- T&iacute;ch hợp c&aacute;c sự kiện để giảm thiểu số lượng c&aacute;c sự kiện gửi về th&agrave;nh phần ph&acirc;n t&iacute;ch v&agrave; lưu trữ.<br />
- Chuyển to&agrave;n bộ c&aacute;c sự kiện đ&atilde; thu thập về th&agrave;nh phần ph&acirc;n t&iacute;ch v&agrave; lưu trữ.<br />
<strong><em>b. Th&agrave;nh phần ph&acirc;n t&iacute;ch v&agrave; lưu trữ: bao gồm c&aacute;c thiết bị lưu trữ dung lượng lớn v&agrave; cung cấp khả năng tổng hợp, ph&acirc;n t&iacute;ch tự động. Th&agrave;nh phần n&agrave;y c&oacute; c&aacute;c t&iacute;nh năng:</em></strong><br />
- Kết nối với c&aacute;c th&agrave;nh phần thu thập nhật k&yacute; để tập hợp nhật k&yacute; tập trung v&agrave; tiến h&agrave;nh ph&acirc;n t&iacute;ch, so s&aacute;nh tương quan.<br />
- M&ocirc;đun ph&acirc;n t&iacute;ch sẽ được hỗ trợ bởi c&aacute;c luật (được định nghĩa trước) cũng như khả năng tuỳ biến, nhằm đưa ra kết quả ph&acirc;n t&iacute;ch ch&iacute;nh x&aacute;c nhất.<br />
- C&aacute;c nhật k&yacute; an to&agrave;n mạng được tiến h&agrave;nh ph&acirc;n t&iacute;ch, so s&aacute;nh tương quan theo thời gian thực nhằm đưa ra cảnh b&aacute;o tức thời cho người quản trị. Đồng thời cũng cho ph&eacute;p ph&acirc;n t&iacute;ch c&aacute;c dữ liệu trong qu&aacute; khứ, nhằm cung cấp cho người quản trị một bức tranh to&agrave;n cảnh về an to&agrave;n mạng theo thời gian.<br />
- Hỗ trợ kết nối đến c&aacute;c hệ thống lưu trữ dữ liệu (như SAN, NAS) gi&uacute;p n&acirc;ng cao khả năng lưu trữ v&agrave; x&acirc;y dựng kế hoạch dự ph&ograve;ng, chống mất m&aacute;t dữ liệu.<br />
<strong><em>c. Th&agrave;nh phần quản trị tập trung:</em></strong><br />
- Cung cấp giao diện quản trị tập trung cho to&agrave;n bộ hệ thống gi&aacute;m s&aacute;t an to&agrave;n mạng. C&aacute;c giao diện được ph&acirc;n quyền theo vai tr&ograve; của người quản trị.<br />
- Hỗ trợ sẵn h&agrave;ng ngh&igrave;n mẫu b&aacute;o c&aacute;o, c&aacute;c giao diện theo d&otilde;i, điều kiện lọc,... Ngo&agrave;i ra, c&aacute;c c&ocirc;ng cụ n&agrave;y c&ograve;n cho ph&eacute;p t&ugrave;y biến, thay đổi hay tạo mới c&aacute;c b&aacute;o c&aacute;o một c&aacute;ch dễ d&agrave;ng để ph&ugrave; hợp với hệ thống của m&igrave;nh.<br />
- Hỗ trợ c&aacute;c c&ocirc;ng cụ cho việc xử l&yacute; c&aacute;c sự kiện an to&agrave;n mạngxảy ra trong hệ thống.<br />
<strong><em>d. C&aacute;c th&agrave;nh phần kh&aacute;c:</em></strong>&nbsp;th&agrave;nh phần cảnh b&aacute;o, hệ thống DashBoard theo d&otilde;i th&ocirc;ng tin, c&aacute;c b&aacute;o c&aacute;o phong ph&uacute; đ&aacute;p ứng c&aacute;c ti&ecirc;u chuẩn quản l&yacute;, th&agrave;nh phần lưu trữ c&oacute; khả năng lưu trữ dữ liệu l&acirc;u d&agrave;i.</p>

<p><strong>TBT - VNCERT</strong></p>
', NULL, NULL, NULL, N'', N'~/Data/upload/images/User/2(1).png', N'', 0, 6, CAST(N'2018-07-24 15:18:11.307' AS DateTime), 5, 35, CAST(N'2018-07-25 14:55:04.600' AS DateTime), 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (46, 72, 0, N'Ngăn chặn máy chủ điều khiển mã độc GandCrab', N'Ngan-chan-may-chu-dieu-khien-ma-doc-GandCrab', N'', N'<p>Thực thi nhiệm vụ theo d&otilde;i kh&ocirc;ng gian mạng, Trung t&acirc;m Ứng cứu khẩn cấp m&aacute;y t&iacute;nh Việt Nam (VNCERT) ph&aacute;t hiện đang c&oacute; chiến dịch ph&aacute;t t&aacute;n m&atilde; độc tống tiền GandCrab tấn c&ocirc;ng nhiều nước tr&ecirc;n thế giới, trong đ&oacute; c&oacute; Việt Nam. M&atilde; độc tống tiền GandCrab được ph&aacute;t t&aacute;n th&ocirc;ng qua bộ c&ocirc;ng cụ khai th&aacute;c lỗ hổng RIG, khi bị l&acirc;y nhiễm, to&agrave;n bộ c&aacute;c tập tin dữ liệu tr&ecirc;n m&aacute;y người d&ugrave;ng sẽ bị m&atilde; h&oacute;a v&agrave; phần mở rộng của tập tin bị đổi th&agrave;nh *.GDCB hoặc *.CRAB, đồng thời m&atilde; độc sinh ra một tệp CRAB-DECRYPT.txt nhằm y&ecirc;u cầu v&agrave; hướng dẫn người d&ugrave;ng trả tiền chuộc từ 400 - 1.000 USD bằng c&aacute;ch thanh to&aacute;n qua tiền điện tử DASH để giải m&atilde; dữ liệu.</p>
', N'<p>Thực thi nhiệm vụ theo d&otilde;i kh&ocirc;ng gian mạng, Trung t&acirc;m Ứng cứu khẩn cấp m&aacute;y t&iacute;nh Việt Nam (VNCERT) ph&aacute;t hiện đang c&oacute; chiến dịch ph&aacute;t t&aacute;n m&atilde; độc tống tiền GandCrab tấn c&ocirc;ng nhiều nước tr&ecirc;n thế giới, trong đ&oacute; c&oacute; Việt Nam. M&atilde; độc tống tiền GandCrab được ph&aacute;t t&aacute;n th&ocirc;ng qua bộ c&ocirc;ng cụ khai th&aacute;c lỗ hổng RIG, khi bị l&acirc;y nhiễm, to&agrave;n bộ c&aacute;c tập tin dữ liệu tr&ecirc;n m&aacute;y người d&ugrave;ng sẽ bị m&atilde; h&oacute;a v&agrave; phần mở rộng của tập tin bị đổi th&agrave;nh *.GDCB hoặc *.CRAB, đồng thời m&atilde; độc sinh ra một tệp CRAB-DECRYPT.txt nhằm y&ecirc;u cầu v&agrave; hướng dẫn người d&ugrave;ng trả tiền chuộc từ 400 - 1.000 USD bằng c&aacute;ch thanh to&aacute;n qua tiền điện tử DASH để giải m&atilde; dữ liệu.</p>

<p><img alt="" src="/Data/upload/images/User/1.png" style="height:550px; width:736px" /></p>

<p><img alt="" src="/Data/upload/images/User/2.png" style="height:531px; width:693px" /></p>

<p><img alt="" src="/Data/upload/images/User/3.png" style="height:367px; width:670px" /></p>

<p><img alt="" src="/Data/upload/images/User/4.png" style="height:548px; width:665px" /></p>

<p><img alt="" src="/Data/upload/images/User/5.png" style="height:573px; width:679px" /></p>

<p><a href="http://www.vncert.gov.vn/files/CV85_GrandCrab.pdf">Bản c&ocirc;ng văn tại đ&acirc;y!</a></p>
', NULL, NULL, NULL, N'', N'~/Data/upload/images/User/111.png', N'', 0, 6, CAST(N'2018-07-24 17:35:20.030' AS DateTime), 6, 36, CAST(N'2018-07-25 09:46:45.357' AS DateTime), 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (47, 73, 0, N'CẢNH BÁO TĂNG CƯỜNG KIỂM TRA VÀ RÀ SOÁT HỆ THỐNG ĐẢM BẢO AN TOÀN THÔNG TIN', N'CANH-BAO-TANG-CUONG-KIEM-TRA-VA-RA-SOAT-HE-THONG-DAM-BAO-AN-TOAN-THONG-TIN-1', N'', N'<p>(www.vncert.gov.vn) Chiều nay, ng&agrave;y 03 th&aacute;ng 8 năm 2016. Sau khi ph&acirc;n t&iacute;ch một số mẫu m&atilde; độc nhận được từ một số th&agrave;nh vi&ecirc;n cho c&ocirc;ng t&aacute;c ứng cứu sự cố. Trung t&acirc;m VNCERT ph&aacute;t hiện một số dấu hiệu tấn c&ocirc;ng nguy hiểm.ooooooo</p>
', N'<p>Thực hiện Th&ocirc;ng tư 27/2011/TT-BTTTT về điều phối c&aacute;c hoạt động ứng cứu sự cố mạng Internet Việt Nam, Trung t&acirc;m VNCERT ph&aacute;t c&ocirc;ng văn khẩn cấp y&ecirc;u cầu c&aacute;c l&atilde;nh đạo đơn vị chỉ đạo c&aacute;c đơn vị thuộc phạm vi quản l&yacute; thực hiện một số việc n&ecirc;u trong c&ocirc;ng văn số 238/VNCERT-ĐPƯC.</p>

<p><strong>Trong nội dung n&ecirc;u y&ecirc;u cầu:</strong></p>

<p><strong><em>1. R&agrave; qu&eacute;t hệ thống v&agrave; xo&aacute; c&aacute;c thư mục v&agrave; tập tin m&atilde; độc c&oacute; k&iacute;ch thước tương ứng:</em></strong></p>

<p><em>a) C:\Program Files\Common Files\McAfee\McAfee.exe (137.28 KB)</em></p>

<p><em>- MD5: 884D46C01C762AD6DDD2759FD921BF71</em></p>

<p><em>- SHA-1: D201B130232E0EA411DAA23C1BA2892FE6468712</em></p>

<p><em>b) C:\Program Files\Common Files\McAfeeMcUtil.dll (3.50 KB)</em></p>

<p><em>- MD5: C52464E9DF8B3D08FC612A0F11FE53B2</em></p>

<p><em>- SHA-1: E464D10AD93600232D7A24856D69F00510949A40</em></p>

<p><em>c) C:\Windows\system32\DiskMgers.dll (85.00 KB)</em></p>

<p><em>- MD5: 9BF793EF195CC62F8A61093F77B03158</em></p>

<p><em>- SHA-1: 46844B0ACF2BB67ADBF2304A61BE07738D2DDD64</em></p>

<p><em>d) Tập tin &ldquo;diskperf.exe&rdquo;: t&igrave;m tất cả c&aacute;c file trong ổ Hệ điều h&agrave;nh c&oacute;:</em></p>

<p><em>- MD5: 29E656E1256FC998B7CE8494656B3EF8</em></p>

<p><em>- SHA-1: 8C073B63D85CBF48BD742A62C7A59EEB064DA74D</em></p>

<p><strong><em>2. Hướng dẫn kiểm tra m&atilde; MD5, SHA-1 của tập tin v&agrave; c&aacute;ch thức xo&aacute; tập tin chữa m&atilde; độc trong Phụ lục k&egrave;m theo.</em></strong></p>

<p><strong><em>3. Sau khi thực hiện, y&ecirc;u cầu c&aacute;c đơn vị b&aacute;o c&aacute;o t&igrave;nh h&igrave;nh về Đầu mối điều phối ứng cứu sự cố quốc gia (Trung t&acirc;m VNCERT) theo địa chỉ email: ir@vncert.gov.vn / điện thoại: 0934424009 trước 16h ng&agrave;y 05/8/2016.</em></strong></p>

<p><strong><em>4. Tr&ecirc;n đ&acirc;y l&agrave; những m&atilde; độc đặc biệt nguy hiểm, c&oacute; thể đ&aacute;nh cắp th&ocirc;ng tin v&agrave; ph&aacute; huỷ hệ thống, Trung t&acirc;m VNCERT y&ecirc;u cầu L&atilde;nh đạo c&aacute;c đơn vị nghi&ecirc;m t&uacute;c thực hiện lệnh điều phối.</em></strong></p>

<p><strong><a href="http://www.vncert.gov.vn/files/CV238_ChanDomain.docx">Tải bản mềm c&ocirc;ng văn tại đ&acirc;y!</a></strong></p>
', NULL, NULL, NULL, N'', N'~/Data/upload/images/User/21.jpg', N'', 0, 6, CAST(N'2018-07-24 21:49:31.807' AS DateTime), 6, 37, CAST(N'2018-07-25 16:05:37.343' AS DateTime), 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (51, 70, 0, N'  CẢNH BÁO LỖ HỔNG HỆ QUẢN TRỊ NỘI DUNG DRUPAL', N'CANH-BAO-LO-HONG-HE-QUAN-TRI-NOI-DUNG-DRUPAL', N'', N'<p>Hệ quản trị nội dung Drupal (Drupal CMS) m&atilde; nguồn mở hiện l&agrave; một trong c&aacute;c hệ quản trị nội dung được sử dụng kh&aacute; phổ biến để x&acirc;y dựng c&aacute;c trang/ cổng th&ocirc;ng tin điện tử, ứng dụng web (gọi chung l&agrave; Website) cho c&aacute;c cơ quan, đơn vị với c&aacute;c ưu điểm l&agrave; đơn giản, linh hoạt, hỗ trợ nhiều loại CSDL như MySQL, PostgreSQL, SQLite, MS SQL Server, Oracle v&agrave; c&oacute; thể mở rộng để hỗ trợ c&aacute;c CSDL NoSQL.</p>
', N'<p>Hệ quản trị nội dung Drupal (Drupal CMS) m&atilde; nguồn mở hiện l&agrave; một trong c&aacute;c hệ quản trị nội dung được sử dụng kh&aacute; phổ biến để x&acirc;y dựng c&aacute;c trang/ cổng th&ocirc;ng tin điện tử, ứng dụng web (gọi chung l&agrave; Website) cho c&aacute;c cơ quan, đơn vị với c&aacute;c ưu điểm l&agrave; đơn giản, linh hoạt, hỗ trợ nhiều loại CSDL như MySQL, PostgreSQL, SQLite, MS SQL Server, Oracle v&agrave; c&oacute; thể mở rộng để hỗ trợ c&aacute;c CSDL NoSQL.<br />
Qua c&ocirc;ng t&aacute;c gi&aacute;m s&aacute;t, Trung t&acirc;m VNCERT đ&atilde; ph&aacute;t hiện c&aacute;c phương thức mới thực hiện việc tấn c&ocirc;ng c&aacute;c lỗ hổng của Drupal th&ocirc;ng qua việc sử dụng c&aacute;c mạng m&aacute;y t&iacute;nh ma với lượng m&aacute;y t&iacute;nh th&agrave;nh vi&ecirc;n lớn. Đặc biệt, khi sử dụng c&aacute;c hệ thống botnet để tấn c&ocirc;ng th&igrave; phạm vi tấn c&ocirc;ng sẽ mở rộng rất nhanh, đặt c&aacute;c website tr&ecirc;n nền tảng Drupal chưa được bảo mật trong t&igrave;nh trạng hết sức nguy hiểm.&nbsp;<br />
Trước t&igrave;nh h&igrave;nh đ&oacute;, trong 2 ng&agrave;y 23 v&agrave; 24/4/2018, Trung t&acirc;m đ&atilde; li&ecirc;n tiếp ban h&agrave;nh 02 c&ocirc;ng văn cảnh b&aacute;o số 109/VNCERT-KTHT&amp;GS v&agrave; 116/VNCERT-KTHT&amp;GS về sự cố n&agrave;y, hướng dẫn v&agrave; y&ecirc;u cầu c&aacute;c đơn vị, th&agrave;nh vi&ecirc;n c&oacute; li&ecirc;n quan thực hiện c&aacute;c biện ph&aacute;p nhằm đảm bảo an to&agrave;n th&ocirc;ng tin của đơn vị.</p>

<p>Ng&agrave;y 25/4/2018, Drupal tiếp tục c&ocirc;ng bố lỗ hổng an to&agrave;n th&ocirc;ng tin nghi&ecirc;m trọng c&oacute; m&atilde; SA-CORE-004 (m&atilde; quốc tế theo CVF c&oacute; t&ecirc;n CVE-2018-7602), lỗ hổng n&agrave;y đặc biệt nguy hiểm. Trung t&acirc;m VNCERT tiếp tục ra cảnh b&aacute;o số 120/VNCERT-KTHT&amp;GS ng&agrave;y 27/4/2018.<br />
Nội dung 03 c&ocirc;ng văn cảnh b&aacute;o như sau:</p>

<p>C&ocirc;ng văn số 109/VNCERT-KTHT&amp;GS:</p>

<p><img alt="" src="/Data/upload/images/User/11.jpg" style="height:1062px; width:750px" /></p>

<p><img alt="" src="/Data/upload/images/User/22.jpg" style="height:1069px; width:750px" /></p>

<p><img alt="" src="/Data/upload/images/User/33.jpg" style="height:1072px; width:750px" /></p>

<p><img alt="" src="/Data/upload/images/User/44.jpg" style="height:1070px; width:750px" /></p>

<p>C&ocirc;ng văn số 116/VNCERT-KTHT&amp;GS:</p>

<p><img alt="" src="/Data/upload/images/User/55.jpg" style="height:1068px; width:750px" /></p>

<p><img alt="" src="/Data/upload/images/User/66.jpg" style="height:1067px; width:750px" /></p>

<p><img alt="" src="/Data/upload/images/User/77.jpg" style="height:1068px; width:750px" /></p>

<p>C&ocirc;ng văn số 120/VNCERT-KTHT&amp;GS:</p>

<p><img alt="" src="/Data/upload/images/User/88.jpg" style="height:1070px; width:750px" /></p>

<p><img alt="" src="/Data/upload/images/User/99.jpg" style="height:1073px; width:750px" /></p>

<p><img alt="" src="/Data/upload/images/User/10.jpg" style="height:1081px; width:750px" /></p>

<p>&nbsp;</p>
', NULL, NULL, NULL, N'', N'~/Data/upload/images/User/1(2).jpg', N'', 0, 6, CAST(N'2018-07-25 10:13:44.240' AS DateTime), 6, 41, CAST(N'2018-07-25 10:51:03.940' AS DateTime), 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (52, 61, 0, N'DIỄN TẬP TRONG NƯỚC KHU VỰC MIỀN TRUNG, TÂY NGUYÊN NĂM 2018', N'DIEN-TAP-TRONG-NUOC-KHU-VUC-MIEN-TRUNG-TAY-NGUYEN-NAM-2018', N'', N'<p>[vncert.gov.vn] Ngày 29/6/2018 tại Công ty Phát triển Công viên Phần mềm Quang Trung, thành phố Đà Nẵng, Trung tâm Ứng cứu khẩn cấp máy tính Việt Nam (VNCERT) chủ trì, phối hợp với Sở Thông tin và Truyền thông thành phố Đà Nẵng , Tập đoàn Bưu chính Viễn thông Việt Nam (VNPT) tổ chức Hội thảo - Diễn tập Ứng cứu sự cố an toàn thông tin mạng khu vực miền Trung và Tây Nguyên năm 2018. Đây là lần đầu tiên một hoạt động diễn tập an toàn thông tin, an ninh mạng quy mô được tổ chức tại khu vực miền Trung và Tây Nguyên nhằm tăng cường kỹ năng phối hợp, xử lý sự cố, đảm bảo an toàn thông tin mạng cho đội ngũ...</p>
', N'<p>[vncert.gov.vn] Ng&agrave;y 29/6/2018 tại C&ocirc;ng ty Ph&aacute;t triển C&ocirc;ng vi&ecirc;n Phần mềm Quang Trung, th&agrave;nh phố&nbsp;Đ&agrave; Nẵng, Trung t&acirc;m Ứng cứu kh&acirc;̉n c&acirc;́p máy tính Vi&ecirc;̣t Nam (VNCERT) chủ tr&igrave;, phối hợp với Sở Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng thành ph&ocirc;́ Đà Nẵng , Tập đo&agrave;n Bưu ch&iacute;nh Viễn th&ocirc;ng Việt Nam (VNPT) tổ chức H&ocirc;̣i thảo - Di&ecirc;̃n t&acirc;̣p Ứng cứu sự c&ocirc;́ an toàn th&ocirc;ng tin mạng khu vực mi&ecirc;̀n Trung và T&acirc;y Nguy&ecirc;n năm 2018. Đ&acirc;y l&agrave; lần đầu ti&ecirc;n một hoạt động diễn tập an to&agrave;n th&ocirc;ng tin, an ninh mạng quy m&ocirc; được tổ chức tại khu vực miền Trung v&agrave; T&acirc;y Nguy&ecirc;n nhằm tăng cường kỹ năng ph&ocirc;́i hợp, xử lý sự c&ocirc;́, đảm bảo an toàn th&ocirc;ng tin mạng cho đ&ocirc;̣i ngũ&nbsp;cán b&ocirc;̣ kỹ thu&acirc;̣t khu vực n&agrave;y.</p>

<p>Tham gia Hội thảo - Diễn tập với chủ đề &ldquo;<strong><em>Ph&ograve;ng chống tấn c&ocirc;ng APT v&agrave;o hạ tầng th&ocirc;ng tin quan trọng quốc gia</em></strong>&rdquo; gồm c&oacute; c&aacute;c cán b&ocirc;̣ Lãnh đạo, c&aacute;c chuy&ecirc;n gia an to&agrave;n th&ocirc;ng tin đến từ Bộ Tư lệnh T&aacute;c chiến kh&ocirc;ng gian mạng (Bộ Quốc ph&ograve;ng); Cục An ninh mạng, Cục Cảnh sát phòng ch&ocirc;́ng t&ocirc;̣i phạm sử dụng c&ocirc;ng ngh&ecirc;̣ cao&nbsp; - C50 (B&ocirc;̣ C&ocirc;ng an); c&aacute;c Trung t&acirc;m như: C&ocirc;ng nghệ th&ocirc;ng tin, An to&agrave;n th&ocirc;ng tin của Văn ph&ograve;ng Trung ương Đảng, Văn ph&ograve;ng Quốc hội; c&aacute;c Bộ, ng&agrave;nh; các Sở Th&ocirc;ng tin Truyền th&ocirc;ng thuộc khu vực mi&ecirc;̀n Trung và T&acirc;y Nguy&ecirc;n và đặc biệt c&oacute; c&aacute;c chuy&ecirc;n gia an to&agrave;n th&ocirc;ng tin của c&aacute;c đơn vị nắm giữ hạ tầng th&ocirc;ng tin trọng yếu&nbsp;quốc gia gồm: T&acirc;̣p đoàn Điện lực Việt Nam (EVN), Tập đo&agrave;n Bưu chính Vi&ecirc;̃n th&ocirc;ng Việt Nam (VNPT), Tổng C&ocirc;ng ty Cảng H&agrave;ng kh&ocirc;ng Việt Nam (ACV), Tổng c&ocirc;ng ty Quản l&yacute; bay Việt Nam, Tổng c&ocirc;ng ty Hàng kh&ocirc;ng Việt Nam, C&ocirc;ng ty c&ocirc;̉ ph&acirc;̀n Hàng kh&ocirc;ng Vietjet, Ng&acirc;n h&agrave;ng TMCP Đ&acirc;̀u tư và Phát tri&ecirc;̉n Vi&ecirc;̣t Nam (BIDV), v.v&hellip; cùng các chuy&ecirc;n gia hàng đ&acirc;̀u v&ecirc;̀ giải pháp phòng ch&ocirc;́ng t&acirc;́n c&ocirc;ng APT vào hạ t&acirc;̀ng th&ocirc;ng tin quan trọng trong và ngoài nước.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; <img alt="" src="/Data/upload/images/User/3(2).jpg" style="height:452px; width:640px" /></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<em>Thứ trưởng Nguy&ecirc;̃n Thành Hưng phát bi&ecirc;̉u khai mạc H&ocirc;̣i thảo - Di&ecirc;̃n t&acirc;̣p</em></p>

<p>&Ocirc;ng Nguyễn Th&agrave;nh Hưng - Thứ trưởng Bộ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng đ&aacute;nh gi&aacute;: &ldquo;Trong xu hướng của cuộc c&aacute;ch mạng c&ocirc;ng nghiệp lần thứ tư , sự ph&aacute;t triển v&agrave; thay đổi nhanh ch&oacute;ng của khoa học, c&ocirc;ng nghệ b&ecirc;n cạnh cơ hội phát tri&ecirc;̉n cũng mang đến cho ch&uacute;ng ta những th&aacute;ch thức trong hiện tại v&agrave; tương lai trước xu th&ecirc;́ t&ocirc;̣i phạm mạng, t&acirc;́n c&ocirc;ng mạng đang ng&agrave;y c&agrave;ng gia tăng cả về quy m&ocirc; v&agrave; mức độ tinh vi, phức tạp vào các hạ t&acirc;̀ng th&ocirc;ng tin quan trọng qu&ocirc;́c gia. Buổi Hội thảo &ndash; Diễn tập l&agrave; cơ hội để thảo luận, chia sẻ kinh nghiệm, th&ocirc;ng tin v&agrave; r&egrave;n luyện sự phối hợp giữa c&aacute;c đơn vị chuy&ecirc;n tr&aacute;ch về an to&agrave;n th&ocirc;ng tin mạng với Cơ quan đi&ecirc;̀u ph&ocirc;́i qu&ocirc;́c gia (VNCERT) v&agrave; giữa c&aacute;c đơn vị với nhau đ&ecirc;̉ n&acirc;ng cao khả năng sẵn s&agrave;ng trước c&aacute;c tấn c&ocirc;ng mạng, bảo vệ hệ thống mạng, hạ t&acirc;̀ng th&ocirc;ng tin quan trọng; n&acirc;ng cao &yacute; thức, tr&igrave;nh độ cho c&aacute;n bộ kỹ thuật, n&acirc;ng cao nhận thức của cộng đồng về an to&agrave;n th&ocirc;ng tin mạng&rdquo;.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="/Data/upload/images/User/4(1).jpg" style="height:481px; width:640px" /></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<em>&Ocirc;ng H&ocirc;̀ Kỳ Minh, Phó Chủ tịch UBND thành ph&ocirc;́ Đà Nẵng phát bi&ecirc;̉u tại phi&ecirc;n khai mạc H&ocirc;̣i thảo - Di&ecirc;̃n t&acirc;̣p</em></p>

<p>&Ocirc;ng Hồ Kỳ Minh &ndash; Ph&oacute; chủ tịch Ủy ban nh&acirc;n d&acirc;n th&agrave;nh phố Đ&agrave; Nẵng chia sẻ &ldquo;Đối với th&agrave;nh phố Đ&agrave; Nẵng, ch&uacute;ng t&ocirc;i đ&atilde; đưa v&agrave;o vận h&agrave;nh Hệ thống th&ocirc;ng tin Ch&iacute;nh quyền điện tử với đầy đủ c&aacute;c hợp phần theo Luật CNTT v&agrave; khuyến nghị của Ng&acirc;n h&agrave;ng thế giới. Đến nay, hệ thống c&oacute; tr&ecirc;n 12.000 t&agrave;i khoản CBCCVC của 230 cơ quan d&ugrave;ng thường xuy&ecirc;n; khoảng 86.000 t&agrave;i khoản tổ chức, c&aacute; nh&acirc;n sử dụng dịch vụ c&ocirc;ng v&agrave; mỗi năm nhận, xử l&yacute; gần 4 triệu lượt hồ sơ dịch vụ c&ocirc;ng. Để bảo đảm an to&agrave;n, an ninh th&ocirc;ng tin mạng cho c&aacute;c hệ thống CNTT, UBND th&agrave;nh phố đ&atilde; chỉ đạo Sở TT&amp;TT th&agrave;nh lập Đội vận h&agrave;nh v&agrave; xử l&yacute; sự cố Hệ thống th&ocirc;ng tin Ch&iacute;nh quyền điện tử; triển khai nhiều giải ph&aacute;p phần mềm, phần cứng về ATTT; đặc biệt l&agrave; chủ động tham gia Mạng lưới ứng cứu sự cố quốc gia, phối hợp với c&aacute;c cơ quan chuy&ecirc;n tr&aacute;ch về ATTT trong ph&aacute;t hiện, xử l&yacute; sự cố an to&agrave;n th&ocirc;ng tin như: Trung t&acirc;m Ứng cứu khẩn cấp sự cố m&aacute;y t&iacute;nh Việt Nam (VNCERT), Cục An to&agrave;n th&ocirc;ng tin &ndash; Bộ TT&amp;TT; Ban Cơ yếu Ch&iacute;nh Phủ, Bộ Tư lệnh T&aacute;c chiến kh&ocirc;ng gian mạng, Cục An ninh mạng A68- Bộ C&ocirc;ng an, v.v&hellip;&rdquo;</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="/Data/upload/images/User/5.jpg" style="height:366px; width:640px" /></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<em>Toàn cảnh H&ocirc;̣i thảo</em></p>

<p>&nbsp;</p>

<p>Đại diện đơn vị đăng cai, &ocirc;ng Tr&acirc;̀n Ngọc Thạch, Phó Gi&aacute;m đốc Sở TTTT Đ&agrave; Nẵng b&agrave;y tỏ th&ocirc;ng qua c&aacute;c tham luận tr&igrave;nh b&agrave;y tại hội thảo c&ugrave;ng với c&aacute;c phần thảo luận xoay quanh chủ đề &ldquo;<strong><em>Ph&ograve;ng chống tấn c&ocirc;ng APT v&agrave;o hạ tầng th&ocirc;ng tin quan trọng quốc gia</em></strong>&rdquo; đ&atilde; ph&aacute;c họa bức tranh tương đối đầy đủ về thực trạng an to&agrave;n th&ocirc;ng tin tại khu vực miền Trung &ndash; T&acirc;y Nguy&ecirc;n cũng như cập nhật c&aacute;c xu hướng của tấn c&ocirc;ng APT. Qua đ&oacute; gi&uacute;p c&aacute;c đơn vị c&oacute; th&ecirc;m kinh nghiệm trong việc ph&aacute;t hiện sớm v&agrave; ngăn chặn cũng như c&oacute; phương &aacute;n sẵn s&agrave;ng ứng cứu khẩn cấp khi sự.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="/Data/upload/images/User/6.jpg" style="height:401px; width:640px" /></p>

<p>&nbsp; &nbsp;<em>&Ocirc;ng T&ocirc;́ng Vi&ecirc;́t Trung (b&ecirc;n trái), &Ocirc;ng Nguy&ecirc;̃n Khắc Lịch (giữa) và &ocirc;ng Tr&acirc;̀n Ngọc Thạch (b&ecirc;n phải) đi&ecirc;̀u hành phi&ecirc;n tham lu&acirc;̣n tại H&ocirc;̣i thảo</em></p>

<p>&nbsp;</p>

<p>Đặc biệt, chương tr&igrave;nh diễn tập được c&aacute;c đơn vị tham gia đ&aacute;nh gi&aacute; l&agrave; hết sức thiết thực khi kịch bản di&ecirc;̃n t&acirc;̣p t&acirc;́n c&ocirc;ng có chủ đích (APT) được giả l&acirc;̣p các pha t&acirc;́n c&ocirc;ng h&ecirc;́t sức thực t&ecirc;́ nhưng lại khó lường: M&ocirc;̣t máy tính người dùng trong cơ quan nắm giữ hạ tầng quan trọng quốc gia bị lừa đảo (phishing) v&agrave; nhi&ecirc;̃m m&atilde; độc tưởng chừng như v&ocirc; hại nhưng lại trở thành bàn đạp đ&ecirc;̉ hacker t&acirc;́n c&ocirc;ng leo thang sang các h&ecirc;̣ th&ocirc;́ng n&ocirc;̣i b&ocirc;̣ khác, từng bước khai th&aacute;c th&ocirc;ng tin bao gồm cả c&aacute;c dữ liệu mật v&agrave; tối mật, ki&ecirc;̉m soát v&agrave; chiếm quyền điều khiển h&ecirc;̣ th&ocirc;́ng.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt="" src="/Data/upload/images/User/7.jpg" style="height:451px; width:640px" /></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<em>&Ocirc;ng Nguyễn Khắc Lịch, Ph&oacute; Gi&aacute;m đốc VNCERT, Trưởng ban tổ chức phát bi&ecirc;̉u tại H&ocirc;̣i thảo &ndash; Di&ecirc;̃n t&acirc;̣p</em></p>

<p>&nbsp;</p>

<p>Chia sẻ về điều n&agrave;y, &ocirc;ng Nguyễn Khắc Lịch, Ph&oacute; Gi&aacute;m đốc VNCERT, Trưởng ban tổ chức Hội thảo - Diễn tập cho biết: &ldquo;Th&ocirc;ng thường c&aacute;c cuộc Diễn tập về An to&agrave;n th&ocirc;ng tin mạng l&agrave; &quot;diễn&quot; l&agrave; ch&iacute;nh v&agrave; &quot;tập&quot; l&agrave; phụ, tuy nhi&ecirc;n, thực hiện chủ trương của L&atilde;nh đạo Bộ TTTT phải chuyển &quot;tập&quot; l&agrave; ch&iacute;nh v&agrave; &quot;diễn&quot; l&agrave; phụ n&ecirc;n Ban tổ chức đ&atilde; c&acirc;n nhắc v&agrave; quyết định lựa chọn kịch bản di&ecirc;̃n t&acirc;̣p thi&ecirc;́t k&ecirc;́ dưới dạng m&ocirc;̣t cuộc thi trực tiếp tr&ecirc;n mạng m&aacute;y t&iacute;nh, giả lập một hệ thống th&ocirc;ng tin quan trọng quốc gia đ&ecirc;̉ các cán b&ocirc;̣ kỹ thu&acirc;̣t n&acirc;ng cao kỹ năng thực tế về ph&acirc;n t&iacute;ch m&atilde; độc, điều tra số, thực h&agrave;nh ứng cứu sự cố an to&agrave;n th&ocirc;ng tin mạng&quot;.</p>

<p>Kết th&uacute;c diễn tập, trong 35 đội thi, 3 đội c&oacute; th&agrave;nh t&iacute;ch xuất sắc nhất đã đạt được các giải nh&acirc;́t, nhì, ba toàn đ&ocirc;̣i. Đó là, Đ&ocirc;̣i di&ecirc;̃n t&acirc;̣p của T&acirc;̣p đoàn Đi&ecirc;̣n lực Vi&ecirc;̣t Nam đạt giải nh&acirc;́t, Đ&ocirc;̣i di&ecirc;̃n t&acirc;̣p của Sở TTTT thành ph&ocirc;́ Đà Nẵng đạt giải nhì, Đ&ocirc;̣i di&ecirc;̃n t&acirc;̣p của T&ocirc;̉ng c&ocirc;ng ty Cảng Hàng kh&ocirc;ng Vi&ecirc;̣t Nam đạt giải ba với những ph&acirc;̀n quà ý nghĩa từ Ban t&ocirc;̉ chức. Đ&acirc;y cũng l&agrave; một c&aacute;ch để khuyến kh&iacute;ch tinh thần học hỏi, trau d&ocirc;̀i kỹ năng của c&aacute;c đội.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="/Data/upload/images/User/8.jpg" style="height:400px; width:640px" /></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt="" src="/Data/upload/images/User/9.jpg" style="height:423px; width:640px" /></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<em>Toàn cảnh di&ecirc;̃n t&acirc;̣p ứng cứu sự c&ocirc;́ an toàn th&ocirc;ng tin mạng khu vực mi&ecirc;̀n Trung và T&acirc;y Nguy&ecirc;n năm 2018</em></p>

<p>&nbsp;</p>

<p><strong>Tấn c&ocirc;ng APT &ndash; hiểm họa h&agrave;ng đầu về an to&agrave;n, an ninh th&ocirc;ng tin</strong></p>

<p>Bắt đầu xuất hiện từ cuối năm 2010 đầu năm 2011, cho đến nay, tấn c&ocirc;ng APT lu&ocirc;n được xếp trong tốp đầu về hiểm họa an to&agrave;n, an ninh th&ocirc;ng tin. Với phương thức tấn c&ocirc;ng tinh vi, li&ecirc;n tục kh&aacute;c nhau từ kỹ thuật cao đến kỹ thuật khai th&aacute;c t&acirc;m l&yacute; x&atilde; hội (social engineering) tạo ra c&aacute;c biến thể qua mặt c&aacute;c giải ph&aacute;p an toàn, an ninh th&ocirc;ng tin v&agrave; g&acirc;y thiệt hại to lớn đặc biệt l&agrave; c&aacute;c hạ tầng quan trọng quốc gia.</p>

<p>S&ocirc;́ li&ecirc;̣u khảo s&aacute;t cho th&acirc;́y, có hơn 27% c&aacute;c cuộc tấn c&ocirc;ng APT nhắm v&agrave;o tổ chức Ch&iacute;nh phủ. Tiếp theo l&agrave; c&aacute;c t&ocirc;̉ chức t&agrave;i ch&iacute;nh ng&acirc;n h&agrave;ng, doanh nghiệp viễn th&ocirc;ng với dữ liệu kh&aacute;ch h&agrave;ng rất lớn. Trong khi đó, 80 - 90% m&atilde; độc được d&ugrave;ng trong c&aacute;c cuộc tấn c&ocirc;ng APT đều l&agrave; m&atilde; độc được thiết kế ri&ecirc;ng cho mỗi tổ chức v&agrave; dường như việc ngăn ngừa to&agrave;n diện c&aacute;c cuộc tấn c&ocirc;ng APT gặp nhiều kh&oacute; khăn mặc dù các tổ chức, doanh nghi&ecirc;̣p h&agrave;ng năm v&acirc;̃n chi h&agrave;ng tỷ USD cho c&aacute;c biện ph&aacute;p ph&ograve;ng chống.</p>

<p>Thế giới v&agrave; Việt Nam đ&atilde; ghi nhận rất nhiều cuộc tấn c&ocirc;ng có chủ đích sử dụng m&atilde; độc gi&aacute;n điệp (APT), tại Việt Nam minh chứng điển h&igrave;nh nhất l&agrave; cuộc tấn c&ocirc;ng v&agrave;o Tổng c&ocirc;ng ty Cảng h&agrave;ng kh&ocirc;ng Việt Nam (ACV) v&agrave; Tổng c&ocirc;ng ty H&agrave;ng kh&ocirc;ng Việt Nam (Vietnamairlines) chiều ng&agrave;y 29/7/2016. B&ecirc;n cạnh đó, hi&ecirc;̣n v&acirc;̃n còn t&ocirc;̀n tại một khoảng c&aacute;ch lớn về tương quan lực lượng v&agrave; năng lực giữa tội phạm mạng v&agrave; đội ngũ ph&ograve;ng thủ. Hậu quả của m&ocirc;̣t cu&ocirc;̣c tấn c&ocirc;ng APT v&agrave;o c&aacute;c hệ thống th&ocirc;ng tin quan trọng qu&ocirc;́c gia lu&ocirc;n hi&ecirc;̣n hữu v&agrave; kh&ocirc;ng thể lường được, n&oacute; c&ograve;n mang m&agrave;u sắc ch&iacute;nh trị ph&aacute; hoại c&oacute; thể l&agrave;m suy yếu nền kinh tế, ch&iacute;nh trị của một quốc gia m&agrave; kh&ocirc;ng tốn một mũi t&ecirc;n, vi&ecirc;n đạn.</p>

<p>Theo ghi nhận của VNCERT, năm 2017 đ&atilde; c&oacute; 13.382 sự cố tấn c&ocirc;ng mạng v&agrave;o Việt Nam cả 03 loại h&igrave;nh phishing, malware v&agrave; deface, trong đ&oacute; tấn c&ocirc;ng m&atilde; độc (malware) l&agrave; 6.400 trường hợp; tấn c&ocirc;ng thay đổi giao diện (deface) l&agrave; 4.377 trường hợp, v&agrave; tấn c&ocirc;ng lừa đảo (phishing) l&agrave; 2.605 trường hợp. Từ đầu năm đến 25/6/2018, đ&atilde; ghi nhận được tổng cộng 5.179 sự c&ocirc;́ (trong đó: 1122 sự c&ocirc;́ phishing, 3.200 sự c&ocirc;́&nbsp;deface và 857 sự cố ph&aacute;t t&aacute;n m&atilde; độc malware tr&ecirc;n website).</p>

<p><strong>Việt Nam chủ động ph&ograve;ng chống tấn c&ocirc;ng APT</strong></p>

<p>Qu&aacute;n triệt sự chỉ đạo của L&atilde;nh đạo Đảng, Ch&iacute;nh phủ v&agrave; Bộ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng về việc n&acirc;ng cao năng lực an to&agrave;n th&ocirc;ng tin trong t&igrave;nh h&igrave;nh mới, h&agrave;ng năm, VNCERT chủ động điều phối c&aacute;c đơn vị ở Việt Nam tham gia các chương tr&igrave;nh h&ocirc;̣i nghị, hội thảo k&ecirc;́t hợp với các đợt diễn tập quốc t&ecirc;́ như: Di&ecirc;̃n t&acirc;̣p giữa các CERT trong khu vực Đ&ocirc;ng Nam Á -&nbsp;<em>ASEAN CERTs Incident Drill (</em>ACID), diễn tập giữa thành vi&ecirc;n Hiệp hội c&aacute;c Trung t&acirc;m Ứng cứu khẩn cấp m&aacute;y t&iacute;nh Ch&acirc;u &Aacute; - Th&aacute;i B&igrave;nh Dương (APCERT Drill), Diễn tập ASEAN-Japan,... B&ecirc;n cạnh đ&oacute;, H&ocirc;̣i thảo - Di&ecirc;̃n t&acirc;̣p Ứng cứu sự c&ocirc;́ an toàn th&ocirc;ng tin mạng khu vực mi&ecirc;̀n Trung và T&acirc;y Nguy&ecirc;n năm 2018 diễn ra v&agrave;o ng&agrave;y 29/6/2018 tại C&ocirc;ng vi&ecirc;n ph&acirc;̀n m&ecirc;̀m Quang Trung, TP.Đà Nẵng l&agrave; hoạt động thiết thực nhằm triển khai Quyết định số 1622/QĐ-TTg ng&agrave;y 25/10/2017 của Thủ tướng Ch&iacute;nh phủ ph&ecirc; duyệt Đề &aacute;n &ldquo;Đẩy mạnh hoạt động của mạng lưới ứng cứu sự cố, tăng cường năng lực cho c&aacute;c c&aacute;n bộ, bộ phận chuy&ecirc;n tr&aacute;ch ứng cứu sự cố an to&agrave;n th&ocirc;ng tin mạng tr&ecirc;n to&agrave;n quốc đến năm 2020, định hướng đến năm 2025&rdquo;. Theo đ&oacute;, Bộ Th&ocirc;ng tin v&agrave; Truyền th&ocirc;ng giao Trung t&acirc;m Ứng cứu kh&acirc;̉n c&acirc;́p máy tính Vi&ecirc;̣t Nam (VNCERT) chủ tr&igrave; phối hợp với Sở TTTT Đà Nẵng, Tập đo&agrave;n Bưu ch&iacute;nh Viễn th&ocirc;ng Việt Nam (VNPT) tổ chức Hội thảo - Diễn tập &ldquo;<strong><em>Ph&ograve;ng chống tấn c&ocirc;ng APT v&agrave;o hạ tầng th&ocirc;ng tin quan trọng quốc gia</em></strong>&rdquo;.</p>

<p>H&ocirc;̣i thảo &ndash; Diễn tập là cơ h&ocirc;̣i để c&aacute;c c&aacute;n bộ kỹ thuật được c&acirc;̣p nh&acirc;̣t tình hình, phương thức phòng ch&ocirc;́ng t&acirc;́n c&ocirc;ng APT, đảm bảo an toàn th&ocirc;ng tin mạng; thực h&agrave;nh c&aacute;c kỹ năng, kiến thức của m&igrave;nh v&agrave;o giải quyết những t&igrave;nh huống cụ thể, để sẵn s&agrave;ng ứng cứu c&aacute;c sự cố do t&acirc;́n c&ocirc;ng APT g&acirc;y ra đ&ocirc;́i với hạ t&acirc;̀ng th&ocirc;ng tin quan trọng qu&ocirc;́c gia. Đ&acirc;y cũng là bài thực h&agrave;nh quy tr&igrave;nh ứng cứu sự cố trong mạng lưới; &aacute;p dụng c&aacute;c ch&iacute;nh s&aacute;ch quản l&yacute; điều phối trong Quyết định 05/2017/QĐ-TTg v&agrave; Th&ocirc;ng tư 20/2017/TT-BTTTT v&agrave;o thực tiễn, thực h&agrave;nh việc phối hợp giữa c&aacute;c đơn vị chuy&ecirc;n tr&aacute;ch về an to&agrave;n th&ocirc;ng tin mạng với Cơ quan đi&ecirc;̀u ph&ocirc;́i qu&ocirc;́c gia (VNCERT) v&agrave; giữa c&aacute;c đơn vị với nhau đ&ecirc;̉ n&acirc;ng cao khả năng sẵn s&agrave;ng trước c&aacute;c tấn c&ocirc;ng mạng, bảo vệ hệ thống mạng, hạ t&acirc;̀ng th&ocirc;ng tin quan trọng; n&acirc;ng cao &yacute; thức, tr&igrave;nh độ cho c&aacute;n bộ kỹ thuật, n&acirc;ng cao nhận thức của cộng đồng về an to&agrave;n th&ocirc;ng tin mạng.</p>

<p><strong>M&ocirc;̣t s&ocirc;́ hình ảnh tại L&ecirc;̃ trao cup, ph&acirc;̀n thưởng cho 03 đ&ocirc;̣i Nh&acirc;́t, Nhì, Ba có k&ecirc;́t quả di&ecirc;̃n t&acirc;̣p xu&acirc;́t sắc nh&acirc;́t tại Gala Dinner trong bu&ocirc;̉i t&ocirc;́i cùng ngày:</strong></p>

<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="/Data/upload/images/User/10(1).jpg" style="height:437px; width:640px" /></strong></p>

<p><em>&Ocirc;ng Nguy&ecirc;̃n Khắc Lịch, Phó Giám đ&ocirc;́c Trung t&acirc;m VNCERT trao giải thưởng cho đ&ocirc;̣i</em><em>&nbsp;di&ecirc;̃n t&acirc;̣p của</em>&nbsp;<em>T&acirc;̣p đoàn Đi&ecirc;̣n lực Vi&ecirc;̣t Nam đạt giải nh&acirc;́t</em></p>

<p>&nbsp;</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt="" src="/Data/upload/images/User/11(1).jpg" style="height:498px; width:640px" /></p>

<p><em>&Ocirc;ng T&ocirc;́ng Vi&ecirc;́t Trung, Phó Tư l&ecirc;̣nh B&ocirc;̣ Tư l&ecirc;̣nh Tác chi&ecirc;́n kh&ocirc;ng gian mạng trao giải thưởng cho đ&ocirc;̣i</em><em>&nbsp;di&ecirc;̃n t&acirc;̣p của</em>&nbsp;<em>Sở TTTT thành ph&ocirc;́ Đà&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Nẵng đạt giải nhì</em></p>

<p><em>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<img alt="" src="/Data/upload/images/User/12.jpg" style="height:500px; width:640px" /></em></p>

<p><em>&Ocirc;ng Tr&acirc;̀n Ngọc Thạch, Phó Giám đ&ocirc;́c Sở TTTT&nbsp;Đà Nẵng trao giải thưởng cho đ&ocirc;̣i</em><em>&nbsp;di&ecirc;̃n t&acirc;̣p của T&ocirc;̉ng c&ocirc;ng ty Cảng Hàng kh&ocirc;ng Vi&ecirc;̣t Nam&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; đạt giải ba.</em></p>

<p><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</strong></p>
', NULL, NULL, NULL, N'', N'~/Data/upload/images/User/2(1).jpg', N'', 0, 6, CAST(N'2018-07-25 11:21:21.753' AS DateTime), 6, 42, CAST(N'2018-07-26 08:37:37.057' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (53, 75, 0, N'VNCERT có vai trò đặc biệt quan trọng trong việc đối phó với tấn công mạng', N'VNCERT-co-vai-tro-dac-biet-quan-trong-trong-viec-doi-pho-voi-tan-cong-mang', N'', N'<p>Lễ kỷ niệm 10 năm th&agrave;nh lập VNCERT vừa được tổ chức tại H&agrave; Nội v&agrave;o s&aacute;ng nay, 23/12. Ng&agrave;y 20/12/2005, Thủ tướng Ch&iacute;nh phủ đ&atilde; k&yacute; Quyết định số 339/QĐ-TTg th&agrave;nh lập Trung t&acirc;m VNCERT với nhiệm vụ điều phối c&aacute;c hoạt động ứng cứu sự cố m&aacute;y t&iacute;nh trong to&agrave;n quốc, cảnh b&aacute;o kịp thời c&aacute;c vấn đề về an to&agrave;n mạng m&aacute;y t&iacute;nh, th&uacute;c đẩy h&igrave;nh th&agrave;nh hệ thống c&aacute;c đơn vị ứng cứu (CERT) trong c&aacute;c cơ quan, tổ chức, doanh nghiệp v&agrave; l&agrave; đầu mối thực hiện hợp t&aacute;c với c&aacute;c tổ chức ứng cứu nước ngo&agrave;i.</p>
', N'<p>Lễ kỷ niệm 10 năm th&agrave;nh lập VNCERT vừa được tổ chức tại H&agrave; Nội v&agrave;o s&aacute;ng nay, 23/12. Ng&agrave;y 20/12/2005, Thủ tướng Ch&iacute;nh phủ đ&atilde; k&yacute; Quyết định số 339/QĐ-TTg th&agrave;nh lập Trung t&acirc;m VNCERT với nhiệm vụ điều phối c&aacute;c hoạt động ứng cứu sự cố m&aacute;y t&iacute;nh trong to&agrave;n quốc, cảnh b&aacute;o kịp thời c&aacute;c vấn đề về an to&agrave;n mạng m&aacute;y t&iacute;nh, th&uacute;c đẩy h&igrave;nh th&agrave;nh hệ thống c&aacute;c đơn vị ứng cứu (CERT) trong c&aacute;c cơ quan, tổ chức, doanh nghiệp v&agrave; l&agrave; đầu mối thực hiện hợp t&aacute;c với c&aacute;c tổ chức ứng cứu nước ngo&agrave;i.</p>

<p>Ph&aacute;t biểu tại lễ kỷ niệm, Bộ trưởng Bộ TT&amp;TT Nguyễn Bắc Son đ&atilde; đ&aacute;nh gi&aacute;, VNCERT l&agrave; cơ quan nh&agrave; nước đầu ti&ecirc;n chuy&ecirc;n tr&aacute;ch về an to&agrave;n th&ocirc;ng tin, được th&agrave;nh lập vừa để thực hiện c&ocirc;ng t&aacute;c đảm bảo an to&agrave;n th&ocirc;ng tin quốc gia, vừa để triển khai c&aacute;c cam kết quốc tế của Việt Nam về an to&agrave;n th&ocirc;ng tin. Do đ&oacute; VNCERT c&oacute; vị tr&iacute;, vai tr&ograve; đặc biệt quan trọng, l&agrave; cầu nối giữa Việt Nam v&agrave; quốc tế, l&agrave; một mắt x&iacute;ch trong mạng lưới phối hợp đối ph&oacute; với c&aacute;c tấn c&ocirc;ng mạng trong khu vực v&agrave; tr&ecirc;n to&agrave;n cầu.</p>

<p>10 năm trước đ&acirc;y, tại Việt Nam, an to&agrave;n th&ocirc;ng tin l&agrave; một kh&aacute;i niệm, một lĩnh vực v&ocirc; c&ugrave;ng mới mẻ, sơ khai, mọi người vẫn chưa biết nhiều đến an to&agrave;n th&ocirc;ng tin, c&aacute;c cơ quan, tổ chức chưa thấy được tầm quan trọng của an to&agrave;n th&ocirc;ng tin. Trung t&acirc;m VNCERT khi đ&oacute; c&oacute; sứ mệnh ti&ecirc;n phong, hoạt động t&iacute;ch cực để n&acirc;ng cao nhận thức về vai tr&ograve; của an to&agrave;n th&ocirc;ng tin đối với x&atilde; hội. Mặc d&ugrave; gặp rất nhiều kh&oacute; khăn về nh&acirc;n lực, về cơ sở vật chất nhưng VNCERT đ&atilde; vượt kh&oacute; để triển khai nhiều hoạt động đặt nền tảng cho đảm bảo an to&agrave;n th&ocirc;ng tin tại Việt Nam, g&oacute;p phần quan trọng v&agrave;o sự ph&aacute;t triển của ng&agrave;nh th&ocirc;ng tin v&agrave; truyền th&ocirc;ng n&oacute;i chung v&agrave; lĩnh vực an to&agrave;n th&ocirc;ng tin n&oacute;i ri&ecirc;ng, trong đ&oacute; nổi bật.</p>

<p>VNCERT đ&atilde; tham mưu trong t&aacute;c x&acirc;y dựng ch&iacute;nh s&aacute;ch, đề &aacute;n, quy hoạch, kế hoạch về an to&agrave;n th&ocirc;ng tin, qua đ&oacute; định h&igrave;nh nền tảng ph&aacute;p l&yacute; cho lĩnh vực an to&agrave;n th&ocirc;ng tin như c&aacute;c nội dung về an to&agrave;n th&ocirc;ng tin tại Nghị định 64/2007/NĐ-CP về ứng dụng CNTT trong hoạt động của Cơ quan nh&agrave; nước, Nghị định 72/2013/NĐ-CP về quản l&yacute;, cung cấp, sử dụng dịch vụ Internet v&agrave; th&ocirc;ng tin tr&ecirc;n mạng, Nghị định 90/2008/NĐ-CP, 77/2012/NĐ-CP về chống thư r&aacute;c, Quyết định 63/2010/QĐ-TT về quy hoạch phát triển an to&agrave;n th&ocirc;ng tin số quốc gia đến năm 2020.</p>

<p>VNCERT đ&atilde; x&acirc;y dựng v&agrave; ph&aacute;t triển được mạng lưới ứng cứu sự cố với hơn 120 đơn vị th&agrave;nh vi&ecirc;n l&agrave; c&aacute;c bộ phận ứng cứu tại c&aacute;c Bộ, ng&agrave;nh, địa phương, doanh nghiệp v&agrave; li&ecirc;n kết chặt chẽ với c&aacute;c tổ chức ứng cứu quốc tế. Thực hiện điều phối, xử l&yacute; h&agrave;ng chục ngh&igrave;n sự cố an to&agrave;n th&ocirc;ng tin mạng; hỗ trợ t&iacute;ch cực c&aacute;c cơ quan nh&agrave; nước trong c&ocirc;ng t&aacute;c ứng cứu, xử l&yacute; sự cố; duy tr&igrave; hoạt động diễn tập ứng cứu sự cố trong nước v&agrave; quốc tế để sẵn s&agrave;ng đối ph&oacute; với c&aacute;c cuộc tấn c&ocirc;ng mạng.</p>

<p>X&acirc;y dựng, vận h&agrave;nh c&aacute;c hệ thống kỹ thuật quốc gia về đảm bảo an to&agrave;n th&ocirc;ng tin như hệ thống gi&aacute;m s&aacute;t an to&agrave;n mạng, hệ thống ph&ograve;ng, chống thư r&aacute;c,... qua đ&oacute; kh&ocirc;ng chỉ ph&aacute;t hiện c&aacute;c sự cố, m&atilde; độc, mạng m&aacute;y t&iacute;nh ma v&agrave; cảnh b&aacute;o kịp thời cho cơ quan, tổ chức c&oacute; li&ecirc;n quan m&agrave; c&ograve;n hỗ trợ t&iacute;ch cực c&ocirc;ng t&aacute;c thu thập th&ocirc;ng tin về an to&agrave;n th&ocirc;ng tin để thống k&ecirc;, tổng hợp, ph&acirc;n t&iacute;ch c&aacute;c số liệu gi&uacute;p cho c&aacute;c hoạt động quản l&yacute; nh&agrave; nước về an to&agrave;n th&ocirc;ng tin.</p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<img alt="" src="/Data/upload/images/User/%C6%B0.JPG" style="height:386px; width:600px" /></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Bộ trưởng Nguyễn Bắc Son trao tặng Bằng khen của Bộ trưởng Bộ TT&amp;TT cho 7 c&aacute;n bộ vi&ecirc;n chức của VNCERT v&igrave; đ&atilde;&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;c&oacute;&nbsp;những th&agrave;nh t&iacute;ch xuất sắc trong đợt Diễn tập quốc tế về điều tra, ph&acirc;n t&iacute;ch v&agrave; ứng cứu sự cố m&atilde; độc gi&aacute;n điệp&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;(ACID).</p>

<p>&nbsp;</p>

<p>Trung t&acirc;m VNCERT đ&atilde; chủ động, t&iacute;ch cực trao đổi tại c&aacute;c diễn đ&agrave;n quốc tế về an to&agrave;n th&ocirc;ng tin; phối hợp, hợp t&aacute;c chặt chẽ với c&aacute;c tổ chức ứng cứu sự cố quốc tế như APCERT, JPCERT, USCERT,CNCERT v&agrave; CERT tại nhiều quốc gia kh&aacute;c; thường xuy&ecirc;n tham gia, tổ chức c&aacute;c hoạt động diễn tập quốc tế, đặc biệt th&aacute;ng 10/ 2015 đ&atilde; tổ chức được chương tr&igrave;nh tập trận quốc tế tr&ecirc;n quy m&ocirc; lớn với sự tham gia của hơn 100 đội ứng cứu tr&ecirc;n cả nước v&agrave; 13 quốc gia tr&ecirc;n thế giới, đồng thời tuyển chọn v&agrave; dẫn dắt đội tuyển Việt Nam gi&agrave;nh v&ocirc; địch cuộc thi an to&agrave;n mạng Cyber Seagame.</p>

<p>Ng&agrave;y 19/11/2015, Quốc hội đ&atilde; ch&iacute;nh thức th&ocirc;ng qua Luật An to&agrave;n th&ocirc;ng tin để định hướng ph&aacute;t triển, tăng cường hoạt động đảm bảo an to&agrave;n th&ocirc;ng tin tại Việt Nam. Để Luật An to&agrave;n th&ocirc;ng tin được triển khai hiệu quả trong đời sống thực tiễn, Bộ trưởng chỉ đạo: C&aacute;c đơn vị trong Bộ TT&amp;TT, trong đ&oacute; c&oacute; VNCERT cần chủ động, t&iacute;ch cực triển khai c&aacute;c nội dung của Luật An to&agrave;n th&ocirc;ng tin. VNCERT l&agrave; một trong những đơn vị chủ lực của Bộ thực thi c&aacute;c hoạt động đảm bảo an to&agrave;n th&ocirc;ng tin tr&ecirc;n phạm vi to&agrave;n quốc.</p>

<p>Trong thời gian tới, Bộ trưởng y&ecirc;u cầu VNCERT cần tập trung thực hiện một số nhiệm vụ bao gồm: Tổ chức, ph&aacute;t triển mạng lưới ứng cứu sự cố quốc gia theo cả chiều rộng v&agrave; chiều s&acirc;u; Đề xuất, triển khai c&aacute;c biện ph&aacute;p nhằm n&acirc;ng cao tr&igrave;nh độ, năng lực cho đội ngũ ứng cứu sự cố tại c&aacute;c cơ quan, tổ chức, doanh nghiệp; Tăng cường c&aacute;c hoạt động huấn luyện, diễn tập để sẵn s&agrave;ng ứng ph&oacute; với c&aacute;c sự cố mất an to&agrave;n th&ocirc;ng tin mạng. VNCERT cần t&iacute;ch cực triển khai hoạt động gi&aacute;m s&aacute;t an to&agrave;n th&ocirc;ng tin đối với hệ thống, dịch vụ CNTT của Ch&iacute;nh phủ điện tử tại Nghị quyết 36a về Ch&iacute;nh phủ điện tử. B&ecirc;n cạnh đ&oacute;, VNCERT cũng cần tập trung&nbsp; nghi&ecirc;n cứu, đề xuất triển khai c&aacute;c hệ thống đảm bảo an to&agrave;n th&ocirc;ng tin mạng tr&ecirc;n phạm vi quốc gia nhằm thu thập c&aacute;c th&ocirc;ng tin mất an to&agrave;n tr&ecirc;n Internet, qua đ&oacute; đ&aacute;nh gi&aacute; được t&igrave;nh h&igrave;nh an to&agrave;n th&ocirc;ng tin để tham mưu cho L&atilde;nh đạo Bộ chỉ đạo c&aacute;c biện ph&aacute;p cần thiết.</p>

<p>Một nhiệm vụ quan trọng kh&ocirc;ng k&eacute;m của VNCERT l&agrave; tăng cường gi&aacute;m s&aacute;t, thu thập th&ocirc;ng tin về tin nhắn r&aacute;c, thư điện tử r&aacute;c; tổ chức vận h&agrave;nh hiệu quả hệ thống kỹ thuật hỗ trợ ngăn chặn, ph&ograve;ng chống thư điện tử, tin nhắn r&aacute;c; nghi&ecirc;n cứu, triển khai c&aacute;c biện ph&aacute;p nhằm giảm lượng thư điện tử, tin nhắn r&aacute;c tại Việt Nam qua đ&oacute; cải thiện c&aacute;c chỉ số đ&aacute;nh gi&aacute; về thư điện tử, tin nhắn r&aacute;c.</p>

<p>Để thu h&uacute;t nguồn nh&acirc;n lực c&oacute; tr&igrave;nh độ cao cho c&ocirc;ng t&aacute;c đảm bảo an to&agrave;n th&ocirc;ng tin, Bộ trưởng chỉ đạo VNCERT mạnh dạn đề xuất cơ chế đột ph&aacute; thu h&uacute;t nh&acirc;n t&agrave;i; đẩy mạnh hoạt động nghi&ecirc;n cứu, ph&aacute;t triển c&aacute;c c&ocirc;ng nghệ, kỹ thuật, giải ph&aacute;p về an to&agrave;n mạng. VNCERT cần phải tiến tới trở th&agrave;nh một đơn vị đặc th&ugrave;, phản ứng nhanh trong lĩnh vực an to&agrave;n th&ocirc;ng tin.</p>

<p>Chia sẻ tại Lễ kỷ niệm 10 năm ng&agrave;y th&agrave;nh lập, &ocirc;ng Nguyễn Trọng Đường - Gi&aacute;m đốc VNCERT cho biết &ldquo;Trong thời gian tới, VNCERT sẽ tập trung v&agrave;o c&aacute;c giải ph&aacute;p để triển khai Nghị quyết 36A của Ch&iacute;nh Phủ về đảm bảo ATTT trong x&acirc;y dựng Ch&iacute;nh phủ điện tử v&agrave; thực hiện Quyết định 78 của Ch&iacute;nh phủ về chức năng nhiệm vụ của VNCERT.</p>

<p>Cụ thể, VNCERT sẽ triển khai c&aacute;c giải ph&aacute;p để th&uacute;c đẩy tăng cường mạng lưới ứng cứu sự cố, th&uacute;c đẩy tăng cường c&aacute;c kỹ năng cho c&aacute;c đội ứng cứu sự cố của c&aacute;c Bộ, ng&agrave;nh, địa phương th&ocirc;ng qua c&aacute;c hoạt động đ&agrave;o tạo, huấn luyện, diễn tập cho to&agrave;n bộ mạng lưới ứng cứu sự cố cũng như tổ chức c&aacute;c diễn tập về ATTT, chống m&atilde; độc gi&aacute;n điệp, chống tấn c&ocirc;ng c&oacute; chủ đ&iacute;ch ở trong nước v&agrave; quốc tế; Tăng cường gi&aacute;m s&aacute;t hệ thống v&agrave; dịch vụ CPĐT để đảm bảo ATTT trong Ch&iacute;nh phủ điện tử; Tăng cường mở rộng c&aacute;c điểm gi&aacute;m s&aacute;t tr&ecirc;n to&agrave;n quốc để tăng cường gi&aacute;m s&aacute;t c&aacute;c hệ thống quan trọng; Tăng cường kiểm tra đ&aacute;nh gi&aacute; mức độ ATTT cho c&aacute;c hệ thống th&ocirc;ng tin quan trọng của cơ quan ch&iacute;nh phủ; Tăng cường c&aacute;c hoạt động nghi&ecirc;n cứu ph&aacute;t triển để ứng dụng c&aacute;c c&ocirc;ng nghệ mới, c&aacute;c giải ph&aacute;p trong triển khai c&aacute;c chức năng nhiệm vụ của VNCERT; VNCERT cũng sẽ ph&aacute;t triển lực lượng đảm bảo an to&agrave;n mạng ứng cứu sự cố của VNCERT v&agrave; của c&aacute;c cơ quan chuy&ecirc;n tr&aacute;ch trong mạng lưới ứng cứu sự cố.</p>

<p>Tại lễ kỷ niệm, Bộ trưởng Nguyễn Bắc Son đ&atilde; trao tặng bức trướng của Bộ TT&amp;TT cho VNCERT, thể hiện sự ghi nhận của Bộ trưởng v&agrave; Bộ TT&amp;TT đối với c&aacute;c th&agrave;nh t&iacute;ch đ&atilde; đạt được trong 10 năm qua của VNCERT. Bộ trưởng Nguyễn Bắc Son cũng trao tặng Bằng khen của Bộ trưởng Bộ TT&amp;TT cho 7 c&aacute;n bộ vi&ecirc;n chức của VNCERT v&igrave; đ&atilde; c&oacute; những th&agrave;nh t&iacute;ch xuất sắc trong đợt Diễn tập quốc tế về điều tra, ph&acirc;n t&iacute;ch v&agrave; ứng cứu sự cố m&atilde; độc gi&aacute;n điệp (ACID).</p>
', NULL, NULL, NULL, N'', N'~/Data/upload/images/User/q.jpg', N'', 0, 6, CAST(N'2018-07-25 11:49:18.880' AS DateTime), 0, 43, NULL, 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (54, 77, 0, N'CẢNH BÁO VỀ MÃ ĐỘC NGUY HIỂM MUMBLEHARD', N'CANH-BAO-VE-MA-DOC-NGUY-HIEM-MUMBLEHARD', N'', N'<p>Mumblehard l&agrave; một họ m&atilde; độc hướng đến c&aacute;c m&aacute;y chủ tr&ecirc;n nền tảng Linux v&agrave; BSD<strong>&nbsp;</strong>hoạt động &iacute;t nhất từ năm 2009. Mumblehard khi l&acirc;y nhiễm tr&ecirc;n m&aacute;y chủ để lại backdoor v&agrave; cho ph&eacute;p tin tặc kiểm so&aacute;t m&aacute;y chủ, ngo&agrave;i ra n&oacute; c&ograve;n tạo ra một hộp thư ảo (spam daemon) để thực hiện gửi một lượng lớn thư r&aacute;c ra b&ecirc;n ngo&agrave;i.</p>
', N'<p><strong>CẢNH B&Aacute;O VỀ M&Atilde; ĐỘC NGUY HIỂM MUMBLEHARD</strong></p>

<p>T&ecirc;n m&atilde; độc: Mumblehard (Muttering spam from your server)</p>

<p>Mức độ: Nghi&ecirc;m trọng</p>

<p>Ảnh hưởng: Đến hệ điều h&agrave;nh Linux, FreeBSD v&agrave; Windows</p>

<p><strong>1. Th&ocirc;ng tin về m&atilde; độc</strong></p>

<p>Mumblehard l&agrave; một họ m&atilde; độc hướng đến c&aacute;c m&aacute;y chủ tr&ecirc;n nền tảng&nbsp;<strong>Linux v&agrave; BSD&nbsp;</strong>hoạt động &iacute;t nhất từ năm 2009. Mumblehard khi l&acirc;y nhiễm tr&ecirc;n m&aacute;y chủ để lại backdoor v&agrave; cho ph&eacute;p tin tặc kiểm so&aacute;t m&aacute;y chủ, ngo&agrave;i ra n&oacute; c&ograve;n tạo ra một hộp thư ảo (spam daemon) để thực hiện gửi một lượng lớn thư r&aacute;c ra b&ecirc;n ngo&agrave;i.</p>

<p>Mumblehard được k&iacute;ch hoạt v&agrave;o khoảng từ năm 2009. Mẫu Mumblehard đầu ti&ecirc;n được t&igrave;m thấy tr&ecirc;n Virus Total năm 2009 v&agrave; Mumblehard c&oacute; mối li&ecirc;n kết chặt chẽ với Yellsoft- một c&ocirc;ng ty kinh doanh trực tuyến c&aacute;c phần mềm c&oacute; thể thực hiện việc gửi một lượng lớn c&aacute;c email.</p>

<p>Trong khoảng 7 th&aacute;ng nghi&ecirc;n cứu v&agrave; thu thập dữ liệu về Mumblehard, c&aacute;c nh&agrave; nghi&ecirc;n cứu của ESET đ&atilde; thống k&ecirc; c&oacute; tới 8867 địa chỉ IP đ&atilde; bị nhiễm Mumblehard v&agrave; số địa chỉ IP bị nhiễm trong một ng&agrave;y c&oacute; thể l&ecirc;n đến 3292 địa chỉ.</p>

<p><img alt="" src="/Data/upload/images/User/d.png" style="height:458px; width:1070px" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;<em>H&igrave;nh 1: Sơ đồ thống k&ecirc; số lượng IP bị nhiễm m&atilde; độc theo ng&agrave;y</em></p>

<p>&nbsp;</p>

<p><strong>M&atilde; độc Mumblehard gồm 2 th&agrave;nh phần:</strong></p>

<p>- Th&agrave;nh phần backdoor: l&agrave; tập tin thực thi nằm ở thư mục tạm của hệ thống được lập lịch cứ chu kỳ 15 ph&uacute;t sẽ kết nối đến c&aacute;c m&aacute;y chủ C&amp;C để nhận lệnh.</p>

<p>- Th&agrave;nh phần Spammer: l&agrave; một tiến tr&igrave;nh nền (Daemon) kh&ocirc;ng thường xuy&ecirc;n thực hiện chức năng gửi thư r&aacute;c, khi chạy sẽ ẩn dưới c&aacute;c t&ecirc;n tiến tr&igrave;nh httpd, mail hoặc init.</p>

<p><img alt="" src="/Data/upload/images/User/f.png" style="height:832px; width:895px" />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<em>H&igrave;nh 2: Hoạt động của th&agrave;nh phần backdoor v&agrave; Spammer</em></p>

<p>&nbsp;</p>

<p>Cả&nbsp; 2 th&agrave;nh phần n&agrave;y đều được viết bằng Perl, sau đ&oacute; đ&oacute;ng g&oacute;i trong thư viện ELF (Executable and Linkable Format).</p>

<p>Dưới đ&acirc;y l&agrave; danh s&aacute;ch 10 địa chỉ IP, t&ecirc;n miền của m&aacute;y chủ điều khiển t&igrave;m thấy khi ph&acirc;n t&iacute;ch c&aacute;c mẫu m&atilde; độc của mạng botnet n&agrave;y.</p>

<table border="0" cellpadding="0" cellspacing="0">
	<tbody>
		<tr>
			<td>184.106.208.157</td>
		</tr>
		<tr>
			<td>&nbsp;194.54.81.163</td>
		</tr>
		<tr>
			<td>&nbsp;advseedpromoan.com</td>
		</tr>
		<tr>
			<td>&nbsp;50.28.24.79</td>
		</tr>
		<tr>
			<td>&nbsp;67.221.183.105</td>
		</tr>
		<tr>
			<td>&nbsp;seoratingonlyup.net</td>
		</tr>
		<tr>
			<td>&nbsp;advertise.com</td>
		</tr>
		<tr>
			<td>&nbsp;195.242.70.4</td>
		</tr>
		<tr>
			<td>&nbsp;pratioupstudios.org</td>
		</tr>
		<tr>
			<td>&nbsp;behance.net</td>
		</tr>
	</tbody>
</table>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Với sự gi&uacute;p đỡ của cảnh s&aacute;t Ukraine, CysCentrum LLC v&agrave; CertBund, c&aacute;c nh&agrave; nghi&ecirc;n cứu ESET đ&atilde; c&oacute; được th&ocirc;ng tin về c&aacute;c m&aacute;y chủ v&agrave;o th&aacute;ng 10 năm 2015. V&agrave; đến ng&agrave;y 29 th&aacute;ng 2 năm 2016, ESET đ&atilde;&nbsp; kiểm so&aacute;t c&aacute;c m&aacute;y chủ điều khiển mạng botnet Mumblehard. Tuy vậy thời điểm hiện tại vẫn ghi nhận c&aacute;c kết nối từ c&aacute;c m&aacute;y chủ n&agrave;y đến c&aacute;c C&amp;C Sinkhole, do vậy c&oacute; thể khẳng định c&aacute;c m&atilde; độc vẫn đang c&ograve;n tồn tại tr&ecirc;n m&aacute;y v&agrave; vẫn kết nối đến m&aacute;y chủ để đợi lệnh. Do hiện tại kh&ocirc;ng x&aacute;c định c&aacute;ch thức l&acirc;y nhiễm v&agrave;o m&aacute;y v&igrave; vậy kh&ocirc;ng thể đảm bảo c&aacute;c m&aacute;y n&agrave;y kh&ocirc;ng c&ograve;n bị tin tặc kiểm so&aacute;t.</p>

<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Hiện nay c&oacute; khoảng hơn 30 địa chỉ IP ở Việt Nam bị l&acirc;y nhiễm m&atilde; độc Mumblehard.</p>

<p>&nbsp;</p>
', NULL, NULL, NULL, N'', N'~/Data/upload/images/User/ss.jpg', N'', 0, 6, CAST(N'2018-07-25 13:39:29.430' AS DateTime), 6, 44, CAST(N'2018-07-25 13:40:57.253' AS DateTime), 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (56, 77, 1, N'VNCERT yêu cầu chặn khẩn cấp hệ thống máy chủ điều khiển mã độc tấn công APT', N'VNCERT-yeu-cau-chan-khan-cap-he-thong-may-chu-dieu-khien-ma-doc-tan-cong-APT', N'', N'<p>Công văn yêu cầu các cơ quan, đơn vị, doanh nghiệp trong cả nước giám sát, ngăn chặn khẩn cấp hệ thống máy chủ điều khiển mã độc tấn công có chủ đích APT vừa được Trung tâm ứng cứu khẩn cấp máy tính Việt Nam (VNCERT) gửi tới các đơn vị chuyên trách về CNTT, an toàn thông tin (ATTT) của Văn phòng Trung ương Đảng, Văn phòng Chủ tịch nước, Văn phòng Quốc hội, Văn phòng Chính phủ; </p>
', N'<p>C&ocirc;ng văn y&ecirc;u cầu c&aacute;c cơ quan, đơn vị, doanh nghiệp trong cả nước gi&aacute;m s&aacute;t, ngăn chặn khẩn cấp hệ thống m&aacute;y chủ điều khiển m&atilde; độc tấn c&ocirc;ng c&oacute; chủ đ&iacute;ch APT vừa được Trung t&acirc;m ứng cứu khẩn cấp m&aacute;y t&iacute;nh Việt Nam (VNCERT) gửi tới c&aacute;c đơn vị chuy&ecirc;n tr&aacute;ch về CNTT, an to&agrave;n th&ocirc;ng tin (ATTT) của Văn ph&ograve;ng Trung ương Đảng, Văn ph&ograve;ng Chủ tịch nước, Văn ph&ograve;ng Quốc hội, Văn ph&ograve;ng Ch&iacute;nh phủ; c&aacute;c đơn vị chuy&ecirc;n tr&aacute;ch về CNTT, ATTT c&aacute;c bộ, ng&agrave;nh; c&aacute;c đơn vị thuộc Bộ TT&amp;TT; c&aacute;c Sở TT&amp;TT; th&agrave;nh vi&ecirc;n mạng lưới ứng cứu sự cố Internet Việt Nam; v&agrave; c&aacute;c Tổng c&ocirc;ng ty, Tập đo&agrave;n kinh tế; Tổ chức t&agrave;i ch&iacute;nh v&agrave; ng&acirc;n h&agrave;ng; c&aacute;c doanh nghiệp hạ tầng Internet, Viễn th&ocirc;ng, Điện lực, H&agrave;ng kh&ocirc;ng, Giao th&ocirc;ng vận tải.</p>

<p>&Ocirc;ng Nguyễn Khắc Lịch, Ph&oacute; Gi&aacute;m đốc VNCERT cho biết, thực hiện c&ocirc;ng t&aacute;c theo d&otilde;i c&aacute;c sự cố tr&ecirc;n kh&ocirc;ng gian mạng Việt Nam, Trung t&acirc;m đ&atilde; ph&aacute;t hiện ra dấu hiệu của chiến dịch tấn c&ocirc;ng nhằm v&agrave;o c&aacute;c hệ thống th&ocirc;ng tin quan trọng tại Việt Nam th&ocirc;ng qua việc ph&aacute;t t&aacute;n v&agrave; điều khiển m&atilde; độc tấn c&ocirc;ng c&oacute; chủ đ&iacute;ch (APT).</p>

<p>Đại diện l&atilde;nh đạo VNCERT cũng cho biết, m&atilde; độc loại n&agrave;y rất tinh vi, ch&uacute;ng c&oacute; khả năng ph&aacute;t hiện c&aacute;c m&ocirc;i trường ph&acirc;n t&iacute;ch m&atilde; độc nhằm tr&aacute;nh bị ph&aacute;t hiện, đ&aacute;nh cắp dữ liệu, x&acirc;m nhập tr&aacute;i ph&eacute;p, ph&aacute; hủy hệ thốngth&ocirc;ng tin th&ocirc;ng qua c&aacute;c m&aacute;y chủ điều khiển m&atilde; độc (C&amp;C Server) đặt b&ecirc;n ngo&agrave;i l&atilde;nh thổ Việt Nam. &nbsp;&ldquo;Loại m&atilde; độc n&agrave;y rất nguy hiểm. Tin tặc c&oacute; thể tấn c&ocirc;ng leo thang đặc quyền g&acirc;y ra nhiều hậu quả nghi&ecirc;m trọng&rdquo;, đại diện VNCERT nhấn mạnh.</p>

<p>Trong lệnh điều phối mới ph&aacute;t ra, VNCERT đ&atilde; y&ecirc;u cầu l&atilde;nh đạo c&aacute;c cơ quan, đơn vị doanh nghiệp chỉ đạo c&aacute;c đơn vị thuộc phạm vi quản l&yacute; thực hiện khẩn cấp một số nội dung c&ocirc;ng việc để ngăn chặn sự ph&aacute;t t&aacute;n, l&acirc;y lan của m&atilde; độc loại tấn c&ocirc;ng c&oacute; chủ đ&iacute;ch APT.</p>

<p>Cụ thể, c&aacute;c cơ quan, đơn vị, doanh nghiệp được y&ecirc;u cầu phải gi&aacute;m s&aacute;t nghi&ecirc;m ngặt, ngăn chặn kết nối đến c&aacute;c m&aacute;y chủ điều khiển m&atilde; độc APT. Theo hướng dẫn của VNCERT, c&aacute;c th&ocirc;ng tin về domain v&agrave; IP m&aacute;y chủ lien quan đến m&atilde; độc APT gồm c&oacute;: 17 địa chỉ IP m&aacute;y chủ điều khiển m&atilde; độc; 71 t&ecirc;n miền m&aacute;y chủ độc hại v&agrave; 20 m&atilde; băm (HashMD5).</p>

<p><img alt="" src="/Data/upload/images/User/x.gif" style="height:280px; width:550px" /></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;Danh s&aacute;ch địa chỉ IP m&aacute;y chủ điều khiển m&atilde; độc tấn c&ocirc;ng c&oacute; chủ đ&iacute;ch APT.</p>

<p>&nbsp;</p>

<p><img alt="" src="/Data/upload/images/User/c.gif" style="height:423px; width:550px" /></p>

<p><img alt="" src="/Data/upload/images/User/v.gif" style="height:433px; width:550px" /></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; Danh s&aacute;ch t&ecirc;n miền m&aacute;y chủ độc hại.</p>

<p>&nbsp;</p>

<p><img alt="" src="/Data/upload/images/User/b.gif" style="height:436px; width:550px" /></p>

<p>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Danh s&aacute;ch m&atilde; băm (HashMD5)</p>

<p>&nbsp;</p>

<p>VNCERT đề nghị c&aacute;c cơ quan, đơn vị, doanh nghiệp nếu ph&aacute;t hiện m&atilde; độc, cần nhanh ch&oacute;ng c&ocirc; lập v&ugrave;ng/m&aacute;y v&agrave; tiến h&agrave;nh điều tra, xử l&yacute; (c&agrave;i đặt lại hệ điều h&agrave;nh nếu kh&ocirc;ng gỡ bỏ được triệt để).</p>

<p>B&ecirc;n cạnh đ&oacute;, VNCERT cũng y&ecirc;u cầu c&aacute;c đơn vị cập nhật c&aacute;c bản v&aacute; cho hệ điều h&agrave;nh v&agrave; phần mềm, nhất l&agrave; Microsoft Office - nếu sử dụng; đặc biệt, cần cập nhật c&aacute;c lỗ hổng c&oacute; CVE:CVE-2012-0158, CVE-2017-0199, MS17-010.</p>

<p>C&aacute;c cơ quan, đơn vị, doanh nghiệp được đề nghị sau khi thực hiện c&aacute;c c&ocirc;ng việc, b&aacute;o c&aacute;o t&igrave;nh h&igrave;nh l&acirc;y nhiễm v&agrave; kết quả xử l&yacute; (nếu c&oacute;) về Cơ quan điều phối ứng cứu sự cố quốc gia - Trung t&acirc;m VNCERT trước ng&agrave;y 30/9/2017.</p>

<p>Nguy cơ từ c&aacute;c cuộc tấn c&ocirc;ng c&oacute; chủ đ&iacute;ch APT l&agrave; một trong những chủ điểm n&oacute;ng nhất của năm 2016. Vụ việc hệ thống Vietnam Airlines bị tấn c&ocirc;ng ng&agrave;y 29/7 năm ngo&aacute;i được c&aacute;c chuy&ecirc;n gia nhận định l&agrave; hồi chu&ocirc;ng cảnh b&aacute;o mạnh mẽ về nguy cơ c&aacute;c cuộc tấn c&ocirc;ng c&oacute; chủ đ&iacute;ch APT tại Việt Nam sẽ c&ograve;n tiếp tục trong thời gian tới. Với thực trạng nhiều cơ quan, doanh nghiệp đ&atilde; bị nhiễm m&atilde; độc gi&aacute;n điệp nằm v&ugrave;ng, năm 2017 được c&aacute;c chuy&ecirc;n gia dự b&aacute;o sẽ tiếp tục chứng kiến nhiều cuộc tấn c&ocirc;ng c&oacute; chủ đ&iacute;ch APT với quy m&ocirc; từ nhỏ tới lớn.</p>

<p>Theo c&aacute;c chuy&ecirc;n gia, kịch bản tấn c&ocirc;ng APT thường được hacker sử dụng l&agrave; gửi email đ&iacute;nh k&egrave;m file văn bản chứa m&atilde; độc. Với t&acirc;m l&yacute; cho rằng file văn bản th&igrave; an to&agrave;n, rất nhiều người sử dụng đ&atilde; mắc lừa v&agrave; mở file đ&iacute;nh k&egrave;m, sau đ&oacute; m&aacute;y t&iacute;nh đ&atilde; bị nhiễm m&atilde; độc. Theo thống k&ecirc; năm ngo&aacute;i của C&ocirc;ng ty Bkav, c&oacute; tới hơn 50% người d&ugrave;ng cho biết vẫn giữ th&oacute;i quen mở ngay&nbsp;c&aacute;c file được đ&iacute;nh k&egrave;m trong email, kh&ocirc;ng giảm so với năm 2015.</p>

<p>Để ph&ograve;ng ngừa nguy cơ tấn c&ocirc;ng APT, chuy&ecirc;n gia khuyến c&aacute;o người sử dụng n&ecirc;n mở c&aacute;c file văn bản nhận từ Internet trong m&ocirc;i trường c&aacute;ch ly Safe Run v&agrave; c&agrave;i phần mềm diệt virus thường trực tr&ecirc;n m&aacute;y t&iacute;nh để được bảo vệ tự động.</p>
', NULL, NULL, NULL, N'', N'~/Data/upload/images/User/z.gif', N'', 0, 6, CAST(N'2018-07-25 13:47:43.933' AS DateTime), 7, 45, CAST(N'2018-08-22 21:59:16.693' AS DateTime), 1, 1)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (62, 73, 0, N'PwC Việt Nam và VNCERT hợp tác chiến lược về ứng cứu sự cố ATTT', N'PwC-Viet-Nam-va-VNCERT-hop-tac-chien-luoc-ve-ung-cuu-su-co-ATTT', N'', N'Theo đó, PwC Việt Nam và VNCERT sẽ hợp tác cùng nhau thúc đẩy sự phát triển của mạng lưới ứng cứu sự cố an toàn thông tin mạng quốc gia; phối hợp đẩy mạnh các hoạt động đào tạo, huấn luyện nâng cao khả năng ứng cứu kịp thời sự cố an toàn thông tin cho các tổ chức, doanh nghiệp Việt Nam; thúc đẩy phát triển thị trường dịch vụ an toàn thông tin; chia sẻ thông tin về các sự cố an toàn thông tin, các mối đe dọa, tấn công mới.', N'<p>Theo đ&oacute;, PwC Việt Nam v&agrave; VNCERT sẽ hợp t&aacute;c c&ugrave;ng nhau th&uacute;c đẩy sự ph&aacute;t triển của mạng lưới ứng cứu sự cố an to&agrave;n th&ocirc;ng tin mạng quốc gia; phối hợp đẩy mạnh c&aacute;c hoạt động đào tạo, huấn luyện n&acirc;ng cao khả năng ứng cứu kịp thời sự cố an to&agrave;n th&ocirc;ng tin cho c&aacute;c tổ chức, doanh nghiệp Việt Nam; thúc đ&acirc;̉y ph&aacute;t triển thị trường dịch vụ an to&agrave;n th&ocirc;ng tin; chia sẻ th&ocirc;ng tin về c&aacute;c sự cố an to&agrave;n th&ocirc;ng tin, c&aacute;c mối đe dọa, tấn c&ocirc;ng mới.</p>

<p>Ph&aacute;t biểu tại lễ k&yacute; kết, &ocirc;ng Nguyễn Trọng Đường &ndash; Gi&aacute;m đốc VNCERT cho biết: &ldquo;Ứng cứu sự cố l&agrave; một hoạt động rất quan trọng trong c&ocirc;ng t&aacute;c đảm bảo an to&agrave;n th&ocirc;ng tin v&agrave; lu&ocirc;n cần sự phối hợp, chia sẻ th&ocirc;ng tin từ nhiều tổ chức, doanh nghiệp. Việt Nam hiện đ&atilde; c&oacute; mạng lưới ứng cứu sự cố quốc gia về an to&agrave;n th&ocirc;ng tin, VNCERT với vai tr&ograve; l&agrave; cơ quan điều phối quốc gia mong muốn tất cả c&aacute;c tổ chức, doanh nghiệp c&ugrave;ng chung sức, hợp t&aacute;c để ph&aacute;t triển, th&uacute;c đẩy hoạt động ứng cứu sự cố, bảo vệ an to&agrave;n mạng. Việc phối hợp với doanh nghiệp uy t&iacute;n, chuy&ecirc;n nghiệp như PwC Việt Nam sẽ l&agrave; một trong những bước đi đầu ti&ecirc;n trong việc kết nối mạng lưới ứng cứu với mọi tổ chức, doanh nghiệp để tăng cường đảm bảo an to&agrave;n th&ocirc;ng tin tại Việt Nam.&quot;</p>

<p>Về ph&iacute;a PwC Việt Nam, &ocirc;ng Robert Trọng Trần &ndash; L&atilde;nh đạo Dịch vụ An ninh mạng v&agrave; Bảo mật cho biết: &ldquo;Trước bối cảnh c&aacute;c cuộc tấn c&ocirc;ng mạng ng&agrave;y c&agrave;ng gia tăng với mức độ phức tạp v&agrave; tinh vi, th&igrave; việc x&acirc;y dựng được đội ngũ nh&acirc;n lực chuy&ecirc;n nghiệp, quy tr&igrave;nh b&agrave;i bản v&agrave; c&ocirc;ng nghệ ph&ugrave; hợp để xử l&yacute; v&agrave; ứng cứu c&aacute;c sự cố an to&agrave;n th&ocirc;ng tin được xem như l&agrave; một nhiệm vụ chiến lược đối với mọi tổ chức, doanh nghiệp. Ứng cứu sự cố an to&agrave;n th&ocirc;ng tin được xem như l&agrave; tuyến ph&ograve;ng thủ cuối c&ugrave;ng trong hệ thống mạng, gi&uacute;p giảm thiểu tối đa thiệt hại cho tổ chức nếu bị tấn c&ocirc;ng.&rdquo;</p>

<p>Đ&aacute;ng ch&uacute; &yacute;, theo bản ghi nhớ hợp t&aacute;c, PwC Việt Nam sẽ hợp t&aacute;c với VNCERT trong hoạt động huấn luyện, diễn tập theo v&ugrave;ng, miền v&agrave; quốc gia, quốc tế; chuẩn h&oacute;a c&aacute;c hoạt động ứng cứu sự cố; ph&aacute;t triển thị trường sản phẩm, dịch vụ an to&agrave;n th&ocirc;ng tin.</p>

<p>Hai b&ecirc;n cũng sẽ phối hợp c&ugrave;ng nhau chia sẻ nguồn tin nguy cơ (threat intelligence) về c&aacute;c mối đe dọa tr&ecirc;n kh&ocirc;ng gian mạng; x&acirc;y dựng c&aacute;c t&agrave;i liệu hướng dẫn hoạt động cho c&aacute;c đội ứng cứu sự cố (CSIRT/CERT) b&agrave;i bản, chuy&ecirc;n nghiệp; x&acirc;y dựng c&aacute;c ti&ecirc;u ch&iacute; để đ&aacute;nh gi&aacute;, x&aacute;c minh năng lực chuy&ecirc;n m&ocirc;n, nghiệp vụ, phẩm chất đạo đức của c&aacute;c nh&acirc;n sự tham gia c&aacute;c CSIRT/CERT.</p>
', NULL, NULL, NULL, N'', N'~/Data/upload/images/User/1(3).jpg', N'', 0, 6, CAST(N'2018-07-26 09:53:44.090' AS DateTime), 1, 6, CAST(N'2018-08-22 22:38:19.407' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (65, 70, 0, N'Trang chủ', N'Trang-chu', N'', N'', N'', NULL, NULL, NULL, N'', N'', N'', 0, 6, CAST(N'2018-07-27 15:50:24.623' AS DateTime), 6, 51, CAST(N'2018-07-27 15:52:26.453' AS DateTime), NULL, NULL)
GO
INSERT [dbo].[Mod_News] ([ID], [MenuID], [State], [Name], [Code], [Tags], [Summary], [Content], [Content1], [Content2], [Content3], [Custom], [File], [Audio], [View], [CreateUser], [Published], [UpdateUser], [Order], [Updated], [Activity1], [Activity]) VALUES (66, 70, 0, N'A', N'A', N'', N'', N'', NULL, NULL, NULL, N'', N'~/Data/upload/images/a2.jpg', N'', 0, 6, CAST(N'2018-07-28 09:41:53.390' AS DateTime), 6, 52, CAST(N'2018-07-28 09:47:30.630' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Mod_News] OFF
GO
INSERT [dbo].[Mod_Online] ([SessionID], [TimeValue]) VALUES (N'g3ihfgkmn2thyfzehkpzevui', 636707411246029267)
GO
SET IDENTITY_INSERT [dbo].[Mod_RSS] ON 

GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (1, N' Sau 2 tháng tạm ngưng theo chỉ đạo của NHNN, ngân hàng lại tăng phí rút tiền ATM nội mạng theo kế hoạch ban đầu ', N'Sau-2-thang-tam-ngung-theo-chi-dao-cua-NHNN-ngan-hang-lai-tang-phi-rut-tien-ATM-noi-mang-theo-ke-hoach-ban-dau', N' http://cafef.vn/sau-2-thang-tam-ngung-theo-chi-dao-cua-nhnn-ngan-hang-lai-tang-phi-rut-tien-atm-theo-ke-hoach-ban-dau-20180709093525346.chn ', N'Cafef.vn', N'<span>Khách hàng Vietcombank khi rút tiền tại các ATM trong cùng hệ thống sẽ chịu phí 1.650 đồng/giao dịch, thay vì 1.100 đồng như trước kia. So với các ngân hàng khác, Vietcombank là ngân hàng thu phí cao nhất.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/9/photo1531103722859-15311037228591663755235.jpg', CAST(N'2018-07-09 11:24:00.000' AS DateTime), CAST(N'2018-07-09 11:41:15.410' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (2, N' Vietcombank nói gì sau khi ''dội bom'' hàng trăm tin nhắn trừ tiền khách hàng? ', N'Vietcombank-noi-gi-sau-khi-doi-bom-hang-tram-tin-nhan-tru-tien-khach-hang', N' http://cafef.vn/vietcombank-noi-gi-sau-khi-doi-bom-hang-tram-tin-nhan-tru-tien-khach-hang-20180709092633815.chn ', N'Cafef.vn', N'<span>Ngày 8/7, hàng loạt khách hàng của Vietcombank bất ngờ bị ''dội bom'' tin nhắn trừ tiền trong tài khoản. Các tin nhắn này có nội dung trùng lặp, đều là thu phí dịch vụ hàng tháng 11.000 đồng nhưng được gửi liên tục với số lượng lên tới hàng trăm tin nhắn.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/9/photo1531103141103-153110314110433820179.jpg', CAST(N'2018-07-09 09:25:55.000' AS DateTime), CAST(N'2018-07-09 11:41:15.623' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (3, N' Đua nhau hút vốn: Mỗi ngân hàng một cách ', N'Dua-nhau-hut-von-Moi-ngan-hang-mot-cach', N' http://cafef.vn/dua-nhau-hut-von-moi-ngan-hang-mot-cach-2018070909161669.chn ', N'Cafef.vn', N'<span>Trong bối cảnh mặt bằng lãi suất tiền gửi tương đối đồng đều, hàng loạt “chiêu” hút vốn truyền thống nhưng vẫn hiệu quả như bốc thăm trúng thưởng, tặng quà, khuyến mãi… đã được các nhà băng tung ra.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/9/photo1531102490001-1531102490001246681510.jpg', CAST(N'2018-07-09 09:16:36.000' AS DateTime), CAST(N'2018-07-09 11:41:15.657' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (4, N' Hàng loạt cán bộ ngân hàng vướng lao lý vì "mắt nhắm, mắt mở" ', N'Hang-loat-can-bo-ngan-hang-vuong-lao-ly-vi-mat-nham-mat-mo', N' http://cafef.vn/hang-loat-can-bo-ngan-hang-vuong-lao-ly-vi-mat-nham-mat-mo-20180709084049159.chn ', N'Cafef.vn', N'<span>Rơi vào tình trạng nợ nần bê bết, Ngọc chỉ đạo nhân viên lập khống hồ sơ vay hàng trăm tỷ đồng. Quản lý đồng vốn, hàng loạt cán bộ ngân hàng cũng “mắt nhắm, mắt mở” duyệt vay và giải ngân cho các đối tượng lừa đảo</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/9/photo1531100292125-15311002921251351116692.jpg', CAST(N'2018-07-09 08:49:00.000' AS DateTime), CAST(N'2018-07-09 11:41:15.693' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (5, N' Maritime Bank nhận giải thưởng Thẻ tín dụng có ưu đãi tốt nhất cho khách hàng năm 2018 ', N'Maritime-Bank-nhan-giai-thuong-The-tin-dung-co-uu-dai-tot-nhat-cho-khach-hang-nam-2018', N' http://cafef.vn/maritime-bank-nhan-giai-thuong-the-tin-dung-co-uu-dai-tot-nhat-cho-khach-hang-nam-2018-20180708230342909.chn ', N'Cafef.vn', N'<span>Ngân hàng TMCP Hàng Hải Việt Nam (Maritime Bank) vừa vinh dự được Tạp chí Tài chính Quốc tế (International Finance Magazine) bình chọn và trao giải thưởng Ngân hàng có thẻ tín dụng ưu đãi tốt nhất cho khách hàng năm 2018 (Best Credit Card Offerings 2018).</span>', N'', 0, 189, 0, N'http://channel.vcmedia.vn/prupload/270/2018/07/img_20180707095911542.jpg', CAST(N'2018-07-09 08:00:00.000' AS DateTime), CAST(N'2018-07-09 11:41:15.730' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (6, N' 3 "ông lớn" cùng tăng phí rút tiền ATM từ 15-7 ', N'3-ong-lon-cung-tang-phi-rut-tien-ATM-tu-157', N' http://cafef.vn/vietcombank-lai-tang-phi-rut-tien-atm-tu-15-7-20180708174959909.chn ', N'Cafef.vn', N'<span>Từ ngày 15-7, cả 3 ông lớn Vietcombank, VietinBank, BIDV sẽ chính thức áp dụng biểu phí dịch vụ thẻ mới trong đó tăng phí rút tiền ATM nội mạng lên 1.650 đồng/lần, tăng 500 đồng/lần so với trước đó.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/8/photo1531046833197-1531046833198121151672.jpg', CAST(N'2018-07-08 17:49:00.000' AS DateTime), CAST(N'2018-07-09 11:41:15.763' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (7, N' USD vẫn sóng, vàng bị lãng quên ', N'USD-van-song-vang-bi-lang-quen', N' http://cafef.vn/usd-van-song-sanh-vang-bi-lang-quen-20180708173406846.chn ', N'Cafef.vn', N'<span>Hơn 2 tuần qua, thị trường tài chính tiền tệ nước nhà ghi nhận sự quan tâm ở mức rất cao đối với cặp tỷ giá VND/USD.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/8/photo1531045938202-15310459382041885788266.jpg', CAST(N'2018-07-08 17:33:25.000' AS DateTime), CAST(N'2018-07-09 11:41:15.800' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (8, N' Nhiều ngân hàng đang "khát" nhân sự ', N'Nhieu-ngan-hang-dang-khat-nhan-su', N' http://cafef.vn/nhieu-ngan-hang-dang-khat-nhan-su-20180707085942486.chn ', N'Cafef.vn', N'<span>30% TCTD cho biết đang thiếu lao động cần thiết cho nhu cầu hiện tại. 70% TCTD dự kiến sẽ tăng số lao động trong khi 30% còn lại sẽ giữ nguyên hoặc cắt giảm nhân sự so với thời điểm cuối năm 2017.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/7/photo1530928436002-1530928436003105557466.jpg', CAST(N'2018-07-08 08:49:17.000' AS DateTime), CAST(N'2018-07-09 11:41:15.840' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (9, N' TP.HCM: Kỷ luật hình thức “cảnh cáo” đối với cựu Chủ tịch Saigonbank ', N'TPHCM-Ky-luat-hinh-thuc-canh-cao-doi-voi-cuu-Chu-tich-Saigonbank', N' http://cafef.vn/tphcm-ky-luat-hinh-thuc-canh-cao-doi-voi-cuu-chu-tich-saigonbank-20180707215922761.chn ', N'Cafef.vn', N'<span>Ủy ban Kiểm tra Thành ủy quyết định thi hành kỷ luật hình thức cảnh cáo đối với đồng chí Phạm Văn Thông, nguyên Phó Chánh Văn phòng Thành ủy và đề nghị cho thôi giữ chức vụ Chủ tịch Hội đồng Quản trị Ngân hàng thương mại cổ phẩn Sài Gòn Công thương (SaiGonbank).</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/7/photo1530975506399-15309755064001331391790.jpg', CAST(N'2018-07-08 06:47:29.000' AS DateTime), CAST(N'2018-07-09 11:41:15.883' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (10, N' VDSC: Chênh lệch giữa lãi suất VND và USD trên liên ngân hàng có thể áp lực lên tỷ giá ', N'VDSC-Chenh-lech-giua-lai-suat-VND-va-USD-tren-lien-ngan-hang-co-the-ap-luc-len-ty-gia', N' http://cafef.vn/vdsc-chenh-lech-giua-lai-suat-vnd-va-usd-tren-lien-ngan-hang-co-the-ap-luc-len-ty-gia-20180707114114121.chn ', N'Cafef.vn', N'<span>Theo VDSC, mức chênh lệch âm giữa lãi suất VND và USD trên liên ngân hàng đang thúc đẩy các nhà băng nắm giữ ngoại tệ.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/7/photo1530938124896-15309381248971662432339.jpg', CAST(N'2018-07-07 21:20:31.000' AS DateTime), CAST(N'2018-07-09 11:41:15.917' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (11, N' Vụ người đẹp chiếm đoạt 50 tỉ: Chủ tọa nhắc nhở ngân hàng ', N'Vu-nguoi-dep-chiem-doat-50-ti-Chu-toa-nhac-nho-ngan-hang', N' http://cafef.vn/vu-nguoi-dep-chiem-doat-50-ti-chu-toa-nhac-nho-ngan-hang-20180707143022761.chn ', N'Cafef.vn', N'<span>Trước khi nghị án, chủ tọa phiên tòa vụ người đẹp ngân hàng Nguyễn Thị Lam chiếm đoạt 50 tỉ đồng, đã thay mặt hội đồng xét xử nhắc nhở vài lời với ngân hàng Eximbank.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/7/photo1530948518260-1530948518260842305020.jpg', CAST(N'2018-07-07 18:13:33.000' AS DateTime), CAST(N'2018-07-09 11:41:15.953' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (12, N' Chỉ trong chưa đầy nửa tháng, vốn điều lệ hệ thống ngân hàng đã được bổ sung thêm hàng chục nghìn tỷ đồng ', N'Chi-trong-chua-day-nua-thang-von-dieu-le-he-thong-ngan-hang-da-duoc-bo-sung-them-hang-chuc-nghin-ty-dong', N' http://cafef.vn/chi-trong-chua-day-nua-thang-von-dieu-le-he-thong-ngan-hang-da-duoc-bo-sung-them-hang-chuc-nghin-ty-dong-20180707112253496.chn ', N'Cafef.vn', N'<span>Chỉ với đợt tăng vốn của Techcombank và VPBank, hệ thống ngân hàng được bổ sung thêm 32.573 tỷ đồng vốn điều lệ.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/7/photo1530937017098-1530937017098961803342.jpg', CAST(N'2018-07-07 14:16:04.000' AS DateTime), CAST(N'2018-07-09 11:41:15.983' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (13, N' Bí quyết tối đa hóa lợi ích dòng tiền khi gửi tiết kiệm tại ngân hàng ', N'Bi-quyet-toi-da-hoa-loi-ich-dong-tien-khi-gui-tiet-kiem-tai-ngan-hang', N' http://cafef.vn/bi-quyet-toi-da-hoa-loi-ich-dong-tien-khi-gui-tiet-kiem-tai-ngan-hang-20180707094604627.chn ', N'Cafef.vn', N'<span>Nhằm tạo sự linh hoạt cho khách hàng về vấn đề tài chính, cũng như đảm bảo được quyền lợi của khách khi gửi tiết kiệm, mới đây Ngân hàng TMCP Việt Nam Thịnh Vượng (VPBank) đã tung ra thị trường sản phẩm “Tiết kiệm bảo chứng thấu chi”.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/7/httpchannelvcmediavnprupload270201807img201807070844516269-1530931563505549056854.jpg', CAST(N'2018-07-07 13:30:00.000' AS DateTime), CAST(N'2018-07-09 11:41:16.023' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (14, N' Robot Teller có thay thế giao dịch viên? ', N'Robot-Teller-co-thay-the-giao-dich-vien', N' http://cafef.vn/robot-teller-co-thay-the-giao-dich-vien-20180707110745246.chn ', N'Cafef.vn', N'<span>Bên cạnh việc giúp tiết giảm đáng kể chi phí vận hành, cải thiện năng suất – robot Teller được ưa chuộng vì khả năng làm việc 24/7, tính chuẩn xác cao trong thực hiện giao dịch, giảm thiểu các sai sót do con người.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/7/photo1530936362403-1530936362403848545815.jpg', CAST(N'2018-07-07 11:07:56.000' AS DateTime), CAST(N'2018-07-09 11:41:16.067' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (15, N' Tìm sơ hở ‘phá’ hợp đồng vay biến tướng ', N'Tim-so-ho-pha-hop-dong-vay-bien-tuong', N' http://cafef.vn/tim-so-ho-pha-hop-dong-vay-bien-tuong-20180707090700783.chn ', N'Cafef.vn', N'<span>Các hợp đồng mua bán nhà, đất giả cách dù có công chứng nhưng nếu chịu khó, tòa vẫn có thể tìm ra những điểm sơ hở trong giao dịch để tuyên vô hiệu…</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/7/photo1530929139973-1530929139973930341104.jpg', CAST(N'2018-07-07 09:52:36.000' AS DateTime), CAST(N'2018-07-09 11:41:16.100' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (16, N' Tỷ giá VND/USD tăng cao không có lợi cho nền kinh tế Việt Nam ', N'Ty-gia-VNDUSD-tang-cao-khong-co-loi-cho-nen-kinh-te-Viet-Nam', N' http://cafef.vn/ty-gia-vnd-usd-tang-cao-khong-co-loi-cho-nen-kinh-te-viet-nam-20180707081626595.chn ', N'Cafef.vn', N'<span>Với sự can thiệp kịp thời của NHNN vào thị trường ngoại hối, không nên quá lo lắng khi tỷ giá tăng lên.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/7/photo1530926043142-1530926043142587525039.jpg', CAST(N'2018-07-07 08:16:37.000' AS DateTime), CAST(N'2018-07-09 11:41:16.137' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (17, N' Sếp ngân hàng bật khóc khi nói lời nói sau cùng ', N'Sep-ngan-hang-bat-khoc-khi-noi-loi-noi-sau-cung', N' http://cafef.vn/sep-ngan-hang-bat-khoc-khi-noi-loi-noi-sau-cung-20180706225913174.chn ', N'Cafef.vn', N'<span>Khi được nói lời nói sau cùng, Nguyễn Thị Lam và Đặng Đình Hồng cùng các bị cáo trong vụ “rút ruột” 50 tỉ đồng đều bật khóc.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/6/photo1530892670867-15308926708681256036349.jpg', CAST(N'2018-07-06 23:28:55.000' AS DateTime), CAST(N'2018-07-09 11:41:16.187' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (18, N' Ngày 12/7, OCB chốt danh sách cổ đông để trả cổ tức tỷ lệ 14,2% và chào bán cổ phiếu cho cổ đông hiện hữu ', N'Ngay-127-OCB-chot-danh-sach-co-dong-de-tra-co-tuc-ty-le-142-va-chao-ban-co-phieu-cho-co-dong-hien-huu', N' http://cafef.vn/ngay-12-7-ocb-chot-danh-sach-co-dong-de-tra-co-tuc-ty-le-142-va-chao-ban-co-phieu-cho-co-dong-hien-huu-20180706173448611.chn ', N'Cafef.vn', N'<span>OCB dự kiến phát hành 169,95 triệu cổ phần trong đó phát hành hơn 100 triệu cổ phần cho cổ đông hiện hữu với giá 10.000 đồng/cp.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/6/photo1530873032784-1530873032785874711866.jpg', CAST(N'2018-07-06 19:17:33.000' AS DateTime), CAST(N'2018-07-09 11:41:16.343' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (19, N' Cho mượn hơn 10 tỉ đồng, Trưởng Ban BTGPMB quận 1 dính án lừa đảo ', N'Cho-muon-hon-10-ti-dong-Truong-Ban-BTGPMB-quan-1-dinh-an-lua-dao', N' http://cafef.vn/cho-muon-hon-10-ti-dong-truong-ban-btgpmb-quan-1-dinh-an-lua-dao-20180706172115517.chn ', N'Cafef.vn', N'<span>Nguyên Trưởng Ban Bồi thường giải phóng mặt bằng (BTGPMB) quận 1, TP HCM bị truy tố về tội "Lợi dụng chức vụ quyền hạn trong thi hành công vụ".</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/6/photo1530872410948-15308724109491553666356.jpg', CAST(N'2018-07-06 17:22:53.000' AS DateTime), CAST(N'2018-07-09 11:41:16.380' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (20, N' Nâng chất lượng tài sản ngân hàng ', N'Nang-chat-luong-tai-san-ngan-hang', N' http://cafef.vn/nang-chat-luong-tai-san-ngan-hang-20180706162127283.chn ', N'Cafef.vn', N'<span>Chất lượng tín dụng là nhân tố quan trọng nhất quyết định chất lượng tài sản ngân hàng cũng như tạo nền tảng tốt giúp ngân hàng phát triển bền vững.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/6/photo1530868802842-15308688028431699718971.jpg', CAST(N'2018-07-06 17:05:43.000' AS DateTime), CAST(N'2018-07-09 11:41:16.420' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (21, N' Sau 2 tháng tạm ngưng theo chỉ đạo của NHNN, Vietcombank lại tăng phí rút tiền ATM nội mạng theo kế hoạch ban đầu ', N'Sau-2-thang-tam-ngung-theo-chi-dao-cua-NHNN-Vietcombank-lai-tang-phi-rut-tien-ATM-noi-mang-theo-ke-hoach-ban-dau', N' http://cafef.vn/sau-2-thang-tam-ngung-theo-chi-dao-cua-nhnn-ngan-hang-lai-tang-phi-rut-tien-atm-theo-ke-hoach-ban-dau-20180709093525346.chn ', N'Cafef.vn', N'<span>Khách hàng Vietcombank khi rút tiền tại các ATM trong cùng hệ thống sẽ chịu phí 1.650 đồng/giao dịch, thay vì 1.100 đồng như trước kia. So với các ngân hàng khác, Vietcombank là ngân hàng thu phí cao nhất.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/9/photo1531103722859-15311037228591663755235.jpg', CAST(N'2018-07-09 11:24:00.000' AS DateTime), CAST(N'2018-07-09 13:40:05.177' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (22, N' 10 nước dự trữ vàng nhiều nhất thế giới ', N'10-nuoc-du-tru-vang-nhieu-nhat-the-gioi', N' http://cafef.vn/10-nuoc-du-tru-vang-nhieu-nhat-the-gioi-20180711072647673.chn ', N'Cafef.vn', N'<span>Mỹ đứng đầu thế giới về lượng vàng dự trữ với hơn 8.000 tấn, bằng tổng vàng dự trữ của 3 quốc gia tiếp theo trong top 10 cộng lại ...</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/11/photo1531268756761-15312687567612092761945.jpg', CAST(N'2018-07-11 08:36:15.000' AS DateTime), CAST(N'2018-07-11 09:11:05.877' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (23, N' Thanh khoản ngân hàng dồi dào do đâu? ', N'Thanh-khoan-ngan-hang-doi-dao-do-dau', N' http://cafef.vn/thanh-khoan-ngan-hang-doi-dao-do-dau-20180711081941157.chn ', N'Cafef.vn', N'<span>Tính đến ngày 20/6/2018, tăng trưởng tín dụng ước đạt 6,35% so với cuối năm 2017, thấp hơn nhiều so với mức tăng 9,01% của cùng kỳ năm ngoái.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/11/photo1531271742343-15312717423432140768859.jpg', CAST(N'2018-07-11 08:33:27.000' AS DateTime), CAST(N'2018-07-11 09:11:06.037' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (24, N' Lợi nhuận ngân hàng quý 2 chờ…bùng nổ! ', N'Loi-nhuan-ngan-hang-quy-2-chobung-no', N' http://cafef.vn/loi-nhuan-ngan-hang-quy-2-chobung-no-20180711045602548.chn ', N'Cafef.vn', N'<span>Mới đầu tháng 7 nhưng các ngân hàng lớn nhỏ đã bắt đầu tiết lộ những con số lợi nhuận khổng lồ đạt được trong quý 2 cũng như nửa đầu năm 2018.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/11/photo1531259074976-15312590749771011278247.jpg', CAST(N'2018-07-11 04:55:34.000' AS DateTime), CAST(N'2018-07-11 09:11:06.077' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (25, N' Vì sao các ngân hàng lớn vội vàng muốn tăng phí rút tiền ATM? ', N'Vi-sao-cac-ngan-hang-lon-voi-vang-muon-tang-phi-rut-tien-ATM', N' http://cafef.vn/vi-sao-cac-ngan-hang-lon-voi-vang-muon-tang-phi-rut-tien-atm-20180709165304845.chn ', N'Cafef.vn', N'<span>Chỉ sau 2 tháng bị NHNN yêu cầu dừng, 4 "ông lớn" ngân hàng tiếp tục ý định tăng phí rút tiền ATM như trước đó, động thái này cho thấy dường như những nhà băng này đang có phần vội vàng?</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/10/photo1531217665333-15312176653331286763555.jpg', CAST(N'2018-07-10 19:38:30.000' AS DateTime), CAST(N'2018-07-11 09:11:06.117' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (26, N' Vietcombank mua thành công 2,3 triệu cổ phiếu Vietnam Airlines ', N'Vietcombank-mua-thanh-cong-23-trieu-co-phieu-Vietnam-Airlines', N' http://cafef.vn/vietcombank-mua-thanh-cong-23-trieu-co-phieu-vietnam-airlines-20180710134111532.chn ', N'Cafef.vn', N'<span>Ngân hàng nâng số cổ phiếu nắm giữ tại Vietnam Airlines lên 17,1 triệu cổ phiếu, tương đương với 1,4% vốn điều lệ.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/10/photo1531204713635-1531204713636626432813.jpg', CAST(N'2018-07-10 17:54:16.000' AS DateTime), CAST(N'2018-07-11 09:11:06.173' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (27, N' Bị Ngân hàng Nhà nước “tuýt còi”, Vietcombank dừng tăng phí rút tiền ATM nội mạng ', N'Bi-Ngan-hang-Nha-nuoc-tuyt-coi-Vietcombank-dung-tang-phi-rut-tien-ATM-noi-mang', N' http://cafef.vn/bi-ngan-hang-nha-nuoc-tuyt-coi-vietcombank-dung-tang-phi-rut-tien-atm-noi-mang-20180710164826407.chn ', N'Cafef.vn', N'<span>Trước đó, Vietcombank đã quyết định nâng phí rút tiền ATM nội mạng từ 1.100 đồng/giao dịch lên 1.560 đồng/giao dịch từ ngày 15/7.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/10/photo1531215981011-15312159810111065992495.jpg', CAST(N'2018-07-10 16:56:08.000' AS DateTime), CAST(N'2018-07-11 09:11:06.227' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (28, N' Tín dụng cuối năm: Tăng theo “lập trình”, hay tùy biến? ', N'Tin-dung-cuoi-nam-Tang-theo-lap-trinh-hay-tuy-bien', N' http://cafef.vn/tin-dung-cuoi-nam-tang-theo-lap-trinh-hay-tuy-bien-2018071016232411.chn ', N'Cafef.vn', N'<span>Tăng trưởng tín dụng phụ thuộc vào sự hấp thụ nền kinh tế, nhưng đồng thời còn phải "căn chỉnh" với ổn định vĩ mô, kiểm soát lạm phát, ổn định tỷ giá…</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/10/photo1531214597570-15312145975711778128808.jpg', CAST(N'2018-07-10 16:47:45.000' AS DateTime), CAST(N'2018-07-11 09:11:06.293' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (29, N' VPBank đã mua xong hơn 73 triệu cổ phiếu ưu đãi ', N'VPBank-da-mua-xong-hon-73-trieu-co-phieu-uu-dai', N' http://cafef.vn/vpbank-da-mua-xong-hon-73-trieu-co-phieu-uu-dai-20180710162327016.chn ', N'Cafef.vn', N'<span>73 cổ đông, trong đó có 5 cổ đông tổ chức và 68 cổ đông cá nhân, đã chuyển nhượng hơn 73 triệu cổ phần cho VPBank trong ngày 9/7. Giá mua cổ phiếu là gần 34.000 đồng trong khi VPB giao dịch trên sàn chưa đến 28.000 đồng/cổ phiếu.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/10/photo1531214384497-15312143844971710472088.jpg', CAST(N'2018-07-10 16:22:56.000' AS DateTime), CAST(N'2018-07-11 09:11:06.337' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (30, N' Thanh khoản eo hẹp, lãi suất liên ngân hàng rục rịch tăng ', N'Thanh-khoan-eo-hep-lai-suat-lien-ngan-hang-ruc-rich-tang', N' http://cafef.vn/thanh-khoan-eo-hep-lai-suat-lien-ngan-hang-ruc-rich-tang-20180710132746298.chn ', N'Cafef.vn', N'<span>Lãi suất liên ngân hàng trung bình tuần qua có xu hướng tăng đối với các loại kỳ hạn qua đêm, 1 tuần và 2 tuần với biên độ tăng ở mức 0,19% - 0,3%.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/10/photo1531204003621-15312040036221795537806.jpg', CAST(N'2018-07-10 14:39:48.000' AS DateTime), CAST(N'2018-07-11 09:11:06.380' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (31, N' Lợi nhuận OCB tăng trưởng ấn tượng trong 6 tháng đầu năm 2018 ', N'Loi-nhuan-OCB-tang-truong-an-tuong-trong-6-thang-dau-nam-2018', N' http://cafef.vn/loi-nhuan-ocb-tang-truong-an-tuong-trong-6-thang-dau-nam-2018-20180710112059251.chn ', N'Cafef.vn', N'<span>Lợi nhuận trước thuế của OCB đạt 1,302 tỷ đồng cao hơn 163,5% so với cùng kỳ, hoàn thành 65% kế hoạch 2,000 tỷ đồng trong năm 2018, nợ xấu dưới 2%.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/10/httpchannelvcmediavnprupload270201807img201807101031428392-15311964583261998093697.jpg', CAST(N'2018-07-10 13:30:00.000' AS DateTime), CAST(N'2018-07-11 09:11:06.427' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (32, N' Dự báo về tỉ giá giá cuối năm 2018: Tăng nhẹ tỉ giá VND/USD từ 1-1,5% ', N'Du-bao-ve-ti-gia-gia-cuoi-nam-2018-Tang-nhe-ti-gia-VNDUSD-tu-115', N' http://cafef.vn/du-bao-ve-ti-gia-gia-cuoi-nam-2018-tang-nhe-ti-gia-vnd-usd-tu-1-15-20180710111837548.chn ', N'Cafef.vn', N'<span>Dự báo về tỉ giá cuối năm 2018, các chuyên gia của Cty Cổ phần Chứng khoán MB (MBS) cho rằng, NHNN sẽ chỉ tăng nhẹ tỉ giá VND/USD thêm từ 1-1,5% trong nửa cuối 2018 nhằm cân đối hai mục tiêu là ổn định vĩ mô và hỗ trợ xuất khẩu. Cán cân thương mại của Việt Nam tiếp tục thặng dư 2,57 tỉ USD trong 6 tháng đầu năm 2018 tạo thêm dư địa cho ổn định tỉ giá tại Việt Nam.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/10/photo1531196313726-1531196313726262785625.png', CAST(N'2018-07-10 11:34:30.000' AS DateTime), CAST(N'2018-07-11 09:11:06.463' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (33, N' VIB lãi trước thuế 1.151 tỷ trong 6 tháng đầu năm, gấp 3 lần cùng kỳ 2017 ', N'VIB-lai-truoc-thue-1151-ty-trong-6-thang-dau-nam-gap-3-lan-cung-ky-2017', N' http://cafef.vn/vib-lai-truoc-thue-1151-ty-trong-6-thang-dau-nam-gap-3-lan-cung-ky-2017-20180710101509235.chn ', N'Cafef.vn', N'<span>Đóng góp quan trọng nhất vào sự tăng trưởng quy mô và lợi nhuận của VIB là hoạt động ngân hàng bán lẻ, với doanh thu tăng 100% so với cùng kỳ 2017.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/10/photo1531192441426-1531192441428139245759.jpg', CAST(N'2018-07-10 10:56:45.000' AS DateTime), CAST(N'2018-07-11 09:11:06.513' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (34, N' Lần thứ 2 NHNN yêu cầu dừng tăng phí rút tiền nội mạng ATM ', N'Lan-thu-2-NHNN-yeu-cau-dung-tang-phi-rut-tien-noi-mang-ATM', N' http://cafef.vn/lan-thu-2-nhnn-yeu-cau-dung-tang-phi-rut-tien-noi-mang-atm-2018071009313547.chn ', N'Cafef.vn', N'<span>Sau thông báo sẽ tăng phí rút tiền nội mạng ATM từ ngày 15-7 lên 1.650 đồng/giao dịch (gồm thuế GTGT) của Vietinbank, Vietcombank, BIDV, Agribank, Ngân hàng Nhà nước (NHNN) đã “tuýt còi”.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/10/photo1531189881016-15311898810161694156998.jpg', CAST(N'2018-07-10 09:39:39.000' AS DateTime), CAST(N'2018-07-11 09:11:06.573' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (35, N' NHNN tăng tỷ giá trung tâm, giá USD tại ngân hàng thương mại cũng tăng ', N'NHNN-tang-ty-gia-trung-tam-gia-USD-tai-ngan-hang-thuong-mai-cung-tang', N' http://cafef.vn/nhnn-tang-ty-gia-trung-tam-gia-usd-tai-ngan-hang-thuong-mai-cung-tang-20180710093505595.chn ', N'Cafef.vn', N'<span>Các ngân hàng phổ biến báo giá mua vào USD ở mức 23.000 đồng và bán ra tại 23.080 đồng.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/10/photo1531189256548-1531189256548311308997.jpg', CAST(N'2018-07-10 09:34:33.000' AS DateTime), CAST(N'2018-07-11 09:11:06.613' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (36, N' Thẻ tín dụng dành riêng cho doanh nhân, tại sao không? ', N'The-tin-dung-danh-rieng-cho-doanh-nhan-tai-sao-khong', N' http://cafef.vn/the-tin-dung-danh-rieng-cho-doanh-nhan-tai-sao-khong-20180706104134783.chn ', N'Cafef.vn', N'<span>Với những doanh nhân thường đi công tác/du lịch nước ngoài, những nhu cầu họ cần cho chuyến đi từ đặt vé máy bay/khách sạn/mua tour cho đến các dịch vụ ăn uống, mua sắm, chơi golf,... sẽ được đáp ứng một cách dễ dàng và nhanh chóng, kèm nhiều ưu đãi lớn nhờ sự hợp tác của Ngân hàng Quốc tế (VIB) với 400 đối tác trong và ngoài nước.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/6/photo1530848212635-15308482126361991872063.jpg', CAST(N'2018-07-10 08:13:00.000' AS DateTime), CAST(N'2018-07-11 09:11:06.657' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (37, N' “Khả năng trả lãi vay của doanh nghiệp mức 6-9% là phù hợp” ', N'Kha-nang-tra-lai-vay-cua-doanh-nghiep-muc-69-la-phu-hop', N' http://cafef.vn/kha-nang-tra-lai-vay-cua-doanh-nghiep-muc-6-9-la-phu-hop-20180710072342267.chn ', N'Cafef.vn', N'<span>Theo tính toán của Nhóm nghiên cứu Đại học Ngân hàng TP.HCM về khả năng trả lãi vay của các doanh nghiệp trên sàn chứng khoán cho thấy mặt bằng lãi suất ở mức 6-9% là phù hợp.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/10/photo1531182152686-1531182153039185118356.jpg', CAST(N'2018-07-10 07:23:09.000' AS DateTime), CAST(N'2018-07-11 09:11:06.703' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (38, N' NHNN có trách nhiệm thế nào trong việc phát hành và giao dịch công cụ nợ của Chính phủ? ', N'NHNN-co-trach-nhiem-the-nao-trong-viec-phat-hanh-va-giao-dich-cong-cu-no-cua-Chinh-phu', N' http://cafef.vn/nhnn-co-trach-nhiem-the-nao-trong-viec-phat-hanh-va-giao-dich-cong-cu-no-cua-chinh-phu-20180709224352517.chn ', N'Cafef.vn', N'<span>Ngày 30/6/2018, Chính phủ đã ban hành Nghị đinh số 95/2018/NĐ-CP quy định về phát hành đăng ký, lưu ký, niêm yết và giao dịch công cụ nợ của Chính phủ trên thị trường chứng khoán.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/9/photo1531150897509-153115089751191490818.jpg', CAST(N'2018-07-09 22:43:17.000' AS DateTime), CAST(N'2018-07-11 09:11:06.737' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (39, N' Ngân hàng Quân đội bổ nhiệm cán bộ cấp cao Ban điều hành ', N'Ngan-hang-Quan-doi-bo-nhiem-can-bo-cap-cao-Ban-dieu-hanh', N' http://cafef.vn/ngan-hang-quan-doi-bo-nhiem-can-bo-cap-cao-ban-dieu-hanh-2018070917285072.chn ', N'Cafef.vn', N'<span>Ông Lê Hải được bổ nhiệm là thành viên cấp cao Ban điều hành, Giám đốc Khối Thẩm định kể từ ngày 6/7.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/9/photo1531131544409-1531131544410722190357.PNG', CAST(N'2018-07-09 18:42:16.000' AS DateTime), CAST(N'2018-07-11 09:11:06.777' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (40, N' Lãi suất USD liên ngân hàng cao gấp hơn 2 lần so với lãi suất VND ', N'Lai-suat-USD-lien-ngan-hang-cao-gap-hon-2-lan-so-voi-lai-suat-VND', N' http://cafef.vn/lai-suat-usd-lien-ngan-hang-cao-gap-hon-2-lan-so-voi-lai-suat-vnd-20180709151332908.chn ', N'Cafef.vn', N'<span>Lãi suất USD qua đêm và 1 tuần trên liên ngân hàng tới trên dưới 2%/năm trong khi lãi suất tiền đồng chưa đến 1%.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/9/photo1531123897268-15311238972681293593623.jpg', CAST(N'2018-07-09 15:12:00.000' AS DateTime), CAST(N'2018-07-11 09:11:06.847' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (41, N' HDBank cảnh báo chiêu lừa đảo mới qua Internet Banking ', N'HDBank-canh-bao-chieu-lua-dao-moi-qua-Internet-Banking', N' http://cafef.vn/hdbank-canh-bao-chieu-lua-dao-moi-qua-internet-banking-2018070914570247.chn ', N'Cafef.vn', N'<span>Phương thức lừa đảo chiếm đoạt tài sản qua điện thoại bằng hình thức mở tài khoản ngân hàng và đăng ký dịch vụ Internet Banking.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/9/photo1531122868227-1531122868227439861083.jpg', CAST(N'2018-07-09 14:56:25.000' AS DateTime), CAST(N'2018-07-11 09:11:06.887' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (42, N' Ông Nguyễn Văn Thắng không còn đại diện 40% vốn nhà nước, thôi làm chủ tịch VietinBank ', N'Ong-Nguyen-Van-Thang-khong-con-dai-dien-40-von-nha-nuoc-thoi-lam-chu-tich-VietinBank', N' http://cafef.vn/ong-nguyen-van-thang-khong-con-la-dai-dien-40-von-nha-nuoc-tai-vietinbank-20180713224849658.chn ', N'Cafef.vn', N'<span>NHNN miễn nhiệm người đại diện 40% vốn nhà nước tại VietinBank đối với ông Nguyễn Văn Thắng từ ngày 13/7.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/13/photo1531496915543-15314969155441949353380.jpg', CAST(N'2018-07-13 22:48:00.000' AS DateTime), CAST(N'2018-07-13 23:57:17.627' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (43, N' Chủ tịch Vietinbank Nguyễn Văn Thắng được bầu làm tân Phó Chủ tịch UBND tỉnh Quảng Ninh ', N'Chu-tich-Vietinbank-Nguyen-Van-Thang-duoc-bau-lam-tan-Pho-Chu-tich-UBND-tinh-Quang-Ninh', N' http://cafef.vn/chu-tich-vietinbank-nguyen-van-thang-duoc-bau-lam-tan-pho-chu-tich-ubnd-tinh-quang-ninh-2018071321363958.chn ', N'Cafef.vn', N'<span>Ông Nguyễn Văn Thắng, Chủ tịch HĐQT Ngân hàng TMCP Công thương Việt Nam (Vietinbank) vừa được bầu làm Phó Chủ tịch UBND tỉnh Quảng Ninh.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/13/photo1531492469898-1531492469899870869775.jpg', CAST(N'2018-07-13 21:36:26.000' AS DateTime), CAST(N'2018-07-13 23:57:18.307' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (44, N' Không thể để ngân hàng lẻ loi xử lý tài sản bảo đảm ', N'Khong-the-de-ngan-hang-le-loi-xu-ly-tai-san-bao-dam', N' http://cafef.vn/khong-the-de-ngan-hang-le-loi-xu-ly-tai-san-bao-dam-20180713164133002.chn ', N'Cafef.vn', N'<span>TS. Trần Hoàng Ngân: “Không thể để ngân hàng lẻ loi một mình mà cần có sự hỗ trợ của cơ quan tư pháp trong xử lý tài sản thế chấp cầm cố của người đi vay. Đây là yếu tố quan trọng xử lý nhanh nợ xấu”.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/13/photo1531474725163-15314747251631738507572.jpg', CAST(N'2018-07-13 20:33:00.000' AS DateTime), CAST(N'2018-07-13 23:57:18.350' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (45, N' Xét xử vụ Vũ "nhôm" trong tháng 7 ', N'Xet-xu-vu-Vu-nhom-trong-thang-7', N' http://cafef.vn/xet-xu-vu-vu-nhom-trong-thang-7-20180713200557064.chn ', N'Cafef.vn', N'<span>Hai vụ án Út "trọc" Đinh Ngọc Huệ và Vũ "nhôm" sẽ được đưa ra xét xử sơ thẩm trong tháng 7 này. Vụ án xảy ra tại DongABank cũng sắp được xét xử.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/13/photo1531487069955-15314870699571231240248.jpg', CAST(N'2018-07-13 20:05:43.000' AS DateTime), CAST(N'2018-07-13 23:57:18.397' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (46, N' Eximbank nhận giải thưởng Chất lượng thanh toán quốc tế xuất sắc 2017 ', N'Eximbank-nhan-giai-thuong-Chat-luong-thanh-toan-quoc-te-xuat-sac-2017', N' http://cafef.vn/eximbank-nhan-giai-thuong-chat-luong-thanh-toan-quoc-te-xuat-sac-2017-20180713180823517.chn ', N'Cafef.vn', N'<span>Ngân hàng Bank of New York Mellon của Mỹ đã trao giải thưởng Tỷ lệ Điện xử lý xuyên suốt cao - STP Award cho Eximbank hôm 9/7.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/13/httpchannelvcmediavnprupload270201807img201807131555532161-15314801116511657918948.jpg', CAST(N'2018-07-13 19:30:00.000' AS DateTime), CAST(N'2018-07-13 23:57:18.463' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (47, N' Chiều ngày 13/7: USD tự do tăng vọt, USD ngân hàng vượt 23.100 đồng ', N'Chieu-ngay-137-USD-tu-do-tang-vot-USD-ngan-hang-vuot-23100-dong', N' http://cafef.vn/chieu-ngay-13-7-usd-tu-do-tang-vot-usd-ngan-hang-vuot-23100-dong-20180713171656345.chn ', N'Cafef.vn', N'<span>Trong hôm nay, giá bán USD trên thị trường tự do bật tăng 40 đồng lên mức 23.230 VND/USD. Tỷ giá tại ngân hàng khá bình lặng trong phiên giao dịch sáng, nhưng đến chiều lại rục rịch tăng.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/13/photo1531476918479-15314769184792145129889.jpg', CAST(N'2018-07-13 18:17:39.000' AS DateTime), CAST(N'2018-07-13 23:57:18.507' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (48, N' Trải nghiệm tuyệt vời cùng BIDV Visa Infinite ', N'Trai-nghiem-tuyet-voi-cung-BIDV-Visa-Infinite', N' http://cafef.vn/trai-nghiem-tuyet-voi-cung-bidv-visa-infinite-20180713164350595.chn ', N'Cafef.vn', N'<span>Năm 2018, Ngân hàng TMCP Đầu tư và Phát triển Việt Nam (BIDV) chính thức ra mắt thẻ tín dụng quốc tế BIDV Visa Infinite - dòng thẻ siêu cao cấp BIDV dành tặng đến các khách hàng thượng lưu. Với các ưu đãi đặc quyền không giới hạn, BIDV Visa Infinite sẽ mang đến những trải nghiệm tuyệt vời cho các thượng khách.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/13/photo1531474902193-1531474902193905515232.jpg', CAST(N'2018-07-13 18:09:58.000' AS DateTime), CAST(N'2018-07-13 23:57:18.540' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (49, N' VPBank cùng IFC tài trợ 50 triệu USD cho tập đoàn Tân Long ', N'VPBank-cung-IFC-tai-tro-50-trieu-USD-cho-tap-doan-Tan-Long', N' http://cafef.vn/vpbank-cung-ifc-tai-tro-50-trieu-usd-cho-tap-doan-tan-long-20180713143405127.chn ', N'Cafef.vn', N'<span>Ngân hàng Thương mại Cổ phần Việt Nam Thịnh vượng (VPBank) đã phối hợp với IFC, thành viên của Nhóm Ngân hàng Thế giới, cung cấp gói bảo lãnh giao dịch hàng hóa lên đến 50 triệu USD cho một trong những doanh nghiệp xuất nhập khẩu nông sản hàng đầu Việt Nam.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/13/httpchannelvcmediavnprupload270201807img201807131148067268-1531467244125302277221.jpg', CAST(N'2018-07-13 17:30:00.000' AS DateTime), CAST(N'2018-07-13 23:57:18.583' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (50, N' Đến lượt ngân hàng ngoại ồ ạt mở rộng mạng lưới tại Việt Nam ', N'Den-luot-ngan-hang-ngoai-o-at-mo-rong-mang-luoi-tai-Viet-Nam', N' http://cafef.vn/den-luot-ngan-hang-ngoai-o-at-mo-rong-mang-luoi-tai-viet-nam-20180713155317892.chn ', N'Cafef.vn', N'<span>Mở rộng mạng lưới, đặc biệt tập trung tại các thành phố lớn, các tỉnh có khu công nghiệp lớn đang là chiến lược cho thấy cá ngân hàng ngoại sẵn sàng cạnh tranh với các ngân hàng nội để gia thị phần.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/13/photo1531471563383-1531471563383498806140.png', CAST(N'2018-07-13 16:05:39.000' AS DateTime), CAST(N'2018-07-13 23:57:18.633' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (51, N' VND sẽ chuyển biến thế nào trước tác động của cuộc chiến thương mại Mỹ-Trung? ', N'VND-se-chuyen-bien-the-nao-truoc-tac-dong-cua-cuoc-chien-thuong-mai-MyTrung', N' http://cafef.vn/vnd-se-chuyen-bien-the-nao-truoc-tac-dong-cua-cuoc-chien-thuong-mai-my-trung-20180713100841298.chn ', N'Cafef.vn', N'<span>Trong vòng xoáy của cuộc chiến thương mại Mỹ-Trung, tiền đồng sẽ thay đổi như thế nào so với đồng Nhân dân tệ?</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/13/photo1531451132839-153145113284029907039.jpg', CAST(N'2018-07-13 14:23:14.000' AS DateTime), CAST(N'2018-07-13 23:57:18.677' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (52, N' Vẫn cần thêm “quyền” xử lý nợ xấu ', N'Van-can-them-quyen-xu-ly-no-xau', N' http://cafef.vn/van-can-them-quyen-xu-ly-no-xau-20180713113233579.chn ', N'Cafef.vn', N'<span>Ngay từ đầu, khi xây dựng hợp đồng tín dụng, trong hợp đồng phải quy định rất rõ, khách hàng đi vay phải giao quyền tự chủ cho ngân hàng trong vấn đề xử lý tài sản thế chấp. Chứ không để như hiện nay mọi thứ nhùng nhằng do quy định chưa rõ ràng.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/13/photo1531456226673-1531456226673958201869.jpg', CAST(N'2018-07-13 13:14:37.000' AS DateTime), CAST(N'2018-07-13 23:57:18.767' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (53, N' Sau vụ "rút ruột" 50 tỉ đồng, Eximbank khuyến cáo khách hàng không ký khống chứng từ rút tiền ', N'Sau-vu-rut-ruot-50-ti-dong-Eximbank-khuyen-cao-khach-hang-khong-ky-khong-chung-tu-rut-tien', N' http://cafef.vn/sau-vu-rut-ruot-50-ti-dong-eximbank-khuyen-cao-khach-hang-khong-ky-khong-chung-tu-rut-tien-20180713113753985.chn ', N'Cafef.vn', N'<span>Liên quan đến vụ xét xử nguyên nhân viên Eximbank ở Nghệ An “rút ruột” hơn 50 tỉ đồng của khách hàng, Eximbank cho biết NH không từ chối trách nhiệm nhưng mong muốn khách hàng không ký khống trước các chứng từ rút tiền và giao cho nhân viên ngân hàng các chứng từ này dưới bất kỳ hình thức nào để tránh rủi ro.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/13/photo1531456672176-1531456672177218798233.jpg', CAST(N'2018-07-13 11:44:51.000' AS DateTime), CAST(N'2018-07-13 23:57:18.810' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (54, N' BIDV được Asian Banking & Finance vinh danh Ngân hàng SME tốt nhất Việt Nam 2018 ', N'BIDV-duoc-Asian-Banking-Finance-vinh-danh-Ngan-hang-SME-tot-nhat-Viet-Nam-2018', N' http://cafef.vn/bidv-duoc-asian-banking-finance-vinh-danh-ngan-hang-sme-tot-nhat-viet-nam-2018-20180713094559233.chn ', N'Cafef.vn', N'<span>Ngày 12/07/2018, tại Singapore, Ngân hàng TMCP Đầu tư và Phát triển Việt Nam (BIDV) đã được vinh danh với 2 giải thưởng: “Best SME Bank Vietnam 2018” (Ngân hàng SME tốt nhất Việt Nam 2018) và “Corporate Client Initiative of the Year” (Giải pháp sản phẩm dịch vụ khách hàng doanh nghiệp sáng tạo tốt nhất Việt Nam 2018).</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/13/photo1531449700751-15314497007511128401373.jpg', CAST(N'2018-07-13 11:27:40.000' AS DateTime), CAST(N'2018-07-13 23:57:18.853' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (55, N' Ngành ngân hàng bước vào giai đoạn tăng trưởng về chất ', N'Nganh-ngan-hang-buoc-vao-giai-doan-tang-truong-ve-chat', N' http://cafef.vn/nganh-ngan-hang-buoc-vao-giai-doan-tang-truong-ve-chat-20180713105829626.chn ', N'Cafef.vn', N'<span>BVSC cho rằng ngành ngân hàng đang bước vào giai đoạn tăng trưởng về chất, động lực tăng trưởng thời gian tới sẽ đến từ hoạt động và tín dụng và các mảng dịch vụ.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/13/photo1531455329206-1531455329206977709820.jpg', CAST(N'2018-07-13 11:15:27.000' AS DateTime), CAST(N'2018-07-13 23:57:18.897' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (56, N' Tăng phí và dư luận ', N'Tang-phi-va-du-luan', N' http://cafef.vn/tang-phi-va-du-luan-20180713091825718.chn ', N'Cafef.vn', N'<span>Kế hoạch tăng phí rút tiền tại máy ATM của bốn nhà băng lớn (Vietcombank, Vietinbank, BIDV và Agribank) dù bị Ngân hàng Nhà nước “tuýt còi” nhưng không có nghĩa là sẽ bị đình chỉ, bởi Ngân hàng Nhà nước cũng giải thích rõ về chỉ đạo rằng: Các nhà băng phải minh bạch việc tăng phí về cơ sở, lý do tăng; có phương án hài hòa lợi ích giữa bên cung cấp dịch vụ và khách hàng; phải có thời gian giải thích với dư luận người dùng…</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/13/photo1531448291138-1531448291139607482099.jpg', CAST(N'2018-07-13 09:32:29.000' AS DateTime), CAST(N'2018-07-13 23:57:18.937' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (57, N' Củng cố vị thế cho VND ', N'Cung-co-vi-the-cho-VND', N' http://cafef.vn/cung-co-vi-the-cho-vnd-20180713083349452.chn ', N'Cafef.vn', N'<span>Mong muốn giảm thêm lãi suất của cộng đồng doanh nghiệp là hoàn toàn chính đáng, song muốn mặt bằng lãi suất giảm thêm, điều kiện tiên quyết vẫn phải là kiềm chế lạm phát ở mức thấp. Còn trong bối cảnh hiện nay, giữ được lãi suất ổn định đã là một thành công.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/13/photo1531445490827-15314454908271625114669.jpg', CAST(N'2018-07-13 08:40:04.000' AS DateTime), CAST(N'2018-07-13 23:57:18.977' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (58, N' Ngân hàng lại thừa tiền? ', N'Ngan-hang-lai-thua-tien', N' http://cafef.vn/ngan-hang-lai-thua-tien-20180712144731921.chn ', N'Cafef.vn', N'<span>Trong khi tiền gửi vào ngân hàng vẫn đều đều tăng nhanh thì cho vay ra lại đang có dấu hiệu chậm hơn.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/12/photo1531388102120-15313881021201235769431.jpg', CAST(N'2018-07-12 22:11:53.000' AS DateTime), CAST(N'2018-07-13 23:57:19.033' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (59, N' Một ngân hàng nước ngoài vừa được NHNN chấp thuận cho mở thêm 5 chi nhánh, PGD ', N'Mot-ngan-hang-nuoc-ngoai-vua-duoc-NHNN-chap-thuan-cho-mo-them-5-chi-nhanh-PGD', N' http://cafef.vn/mot-ngan-hang-nuoc-ngoai-vua-duoc-nhnn-chap-thuan-cho-mo-them-5-chi-nhanh-pgd-20180712180002249.chn ', N'Cafef.vn', N'<span>Ngân hàng trách nhiệm hữu hạn một thành viên (TNHH MTV) Public Việt Nam vừa được NHNN chấp thuận mở thêm 3 chi nhánh và 2 phòng giao dịch.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/12/photo1531392995144-15313929951452146847516.jpg', CAST(N'2018-07-12 21:32:09.000' AS DateTime), CAST(N'2018-07-13 23:57:19.083' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (60, N' Moody’s tiếp tục nâng hạng tín nhiệm của TPBank ', N'Moodys-tiep-tuc-nang-hang-tin-nhiem-cua-TPBank', N' http://cafef.vn/moodys-tiep-tuc-nang-hang-tin-nhiem-cua-tpbank-20180712173511858.chn ', N'Cafef.vn', N'<span>Theo thông cáo trên website chính thức của Moody’s ngày 9/7, triển vọng xếp hạng tín nhiệm (outlook) của TPBank được nâng mức đánh giá từ ổn định lên tích cực, điểm đánh giá cơ sở (BCA) nâng lên mức B2.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/12/photo1531391583143-15313915831431195762313.jpg', CAST(N'2018-07-12 17:34:52.000' AS DateTime), CAST(N'2018-07-13 23:57:19.137' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (61, N' Công ty tài chính TNHH MTV Ngân hàng TMCP Sài Gòn – Hà Nội bổ nhiệm Tổng giám đốc mới ', N'Cong-ty-tai-chinh-TNHH-MTV-Ngan-hang-TMCP-Sai-Gon-Ha-Noi-bo-nhiem-Tong-giam-doc-moi', N' http://cafef.vn/cong-ty-tai-chinh-tnhh-mtv-ngan-hang-tmcp-sai-gon-ha-noi-bo-nhiem-tong-giam-doc-moi-20180712155138264.chn ', N'Cafef.vn', N'<span>Công ty Tài Chính TNHH MTV Ngân hàng TMCP Sài Gòn - Hà Nội (SHB Finance) vừa công bố bổ nhiệm Ông Đinh Quang Huy làm Tổng Giám Đốc Công ty có hiệu lực từ ngày 01/7/2018.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/12/httpchannelvcmediavnprupload270201807img201807121548558044-1531385496991696118278.jpg', CAST(N'2018-07-12 17:30:00.000' AS DateTime), CAST(N'2018-07-13 23:57:19.227' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (62, N' 90% chi tiêu bằng tiền mặt, đường tới nền kinh tế số còn gian nan ', N'90-chi-tieu-bang-tien-mat-duong-toi-nen-kinh-te-so-con-gian-nan', N' http://cafef.vn/90-chi-tieu-bang-tien-mat-duong-toi-nen-kinh-te-so-con-gian-nan-20180714074624392.chn ', N'Cafef.vn', N'<span>Hiện vẫn có tới 90% chi tiêu hằng ngày tại Việt Nam sử dụng tiền mặt, con đường thực hiện fintech, tiến tới nền kinh tế số còn không ít gian nan.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/14/photo1531529179635-15315291796361978199998.jpg', CAST(N'2018-07-14 08:35:10.000' AS DateTime), CAST(N'2018-07-14 09:06:23.563' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (63, N' Bị tuyên án tù, nguyên phó Thống đốc Đặng Thanh Bình kháng án ', N'Bi-tuyen-an-tu-nguyen-pho-Thong-doc-Dang-Thanh-Binh-khang-an', N' http://cafef.vn/bi-tuyen-an-tu-nguyen-pho-thong-doc-dang-thanh-binh-khang-an-20180714074323939.chn ', N'Cafef.vn', N'<span>Ông Đặng Thanh Bình- nguyên Phó Thống đốc Ngân hàng Nhà nước Việt Nam kháng cáo toàn bộ bản án sơ thẩm của TAND TPHCM tuyên hôm 2/7.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/14/photo1531529000843-15315290008441248141995.jpg', CAST(N'2018-07-14 08:19:14.000' AS DateTime), CAST(N'2018-07-14 09:06:23.973' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (64, N' Tháng cao điểm ra tiền, lãi suất liên ngân hàng thu hẹp chênh lệch ', N'Thang-cao-diem-ra-tien-lai-suat-lien-ngan-hang-thu-hep-chenh-lech', N' http://cafef.vn/thang-cao-diem-ra-tien-lai-suat-lien-ngan-hang-thu-hep-chenh-lech-20180714085632049.chn ', N'Cafef.vn', N'<span>Ước tính trong tháng 7 này Ngân hàng Nhà nước trả ra thị trường khoảng 100.000 tỷ đồng...</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/14/photo1531533334881-1531533335006490387915.jpg', CAST(N'2018-07-14 09:52:25.000' AS DateTime), CAST(N'2018-07-14 10:02:55.867' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (65, N' Chưa thể tuyên án vụ người đẹp chiếm đoạt 50 tỉ ', N'Chua-the-tuyen-an-vu-nguoi-dep-chiem-doat-50-ti', N' http://cafef.vn/chua-the-tuyen-an-vu-nguoi-dep-chiem-doat-50-ti-20180714085822814.chn ', N'Cafef.vn', N'<span>Sau năm ngày nghị án, chiều 13-7, Hội đồng xét xử TAND tỉnh Nghệ An vẫn chưa thể tuyên án vụ “người đẹp” ngân hàng chiếm đoạt 50 tỉ đồng vì đang cần thời gian làm rõ dòng tiền chiếm đoạt được đưa đi những đâu.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/14/photo1531533328871-1531533328871360020215.jpg', CAST(N'2018-07-14 09:03:48.000' AS DateTime), CAST(N'2018-07-14 10:02:55.973' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (66, N' IMF: Cần tăng cường gối đệm để đối phó với các cú sốc ', N'IMF-Can-tang-cuong-goi-dem-de-doi-pho-voi-cac-cu-soc', N' http://cafef.vn/imf-can-tang-cuong-goi-dem-de-doi-pho-voi-cac-cu-soc-20180716133124686.chn ', N'Cafef.vn', N'<span>Mặc dù nền tảng sức mạnh kinh tế gia tăng nhưng hạn chế năng lực vẫn tồn tại, các rủi ro bên trong và bên ngoài cũng như các thách thức dài hạn vẫn hiển hiện phía trước.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/16/photo1531722475916-15317224759171267527061.jpg', CAST(N'2018-07-16 14:32:20.000' AS DateTime), CAST(N'2018-07-16 15:22:47.827' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (67, N' Bạn trai phủ nhận vay 12 tỉ của hotgirl ngân hàng ', N'Ban-trai-phu-nhan-vay-12-ti-cua-hotgirl-ngan-hang', N' http://cafef.vn/ban-trai-phu-nhan-vay-12-ti-cua-hotgirl-ngan-hang-20180716132648952.chn ', N'Cafef.vn', N'<span>Người đẹp ngân hàng đứng trước bục khai báo cho rằng có quan hệ tình cảm với một bạn trai và khi chiếm đoạt được tiền "có cho anh ấy vay 12 tỉ đồng" nhưng người này phủ nhận.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/16/photo1531722340757-1531722340758105089386.jpg', CAST(N'2018-07-16 13:41:39.000' AS DateTime), CAST(N'2018-07-16 15:22:50.030' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (68, N' Tài chính tiêu dùng: Trông người lại ngẫm tới ta ', N'Tai-chinh-tieu-dung-Trong-nguoi-lai-ngam-toi-ta', N' http://cafef.vn/tai-chinh-tieu-dung-trong-nguoi-lai-ngam-toi-ta-20180716115125468.chn ', N'Cafef.vn', N'<span>Cho vay tiêu dùng chiếm tới 70% nền kinh tế Mỹ và vẫn liên tục tăng trưởng, trong khi tỷ lệ này ở Việt Nam, dù tăng mạnh trong những năm vừa qua, cũng mới chỉ dừng ở mức khá khiêm tốn là 18%.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/16/photo1531716472493-1531716472494792932798.jpg', CAST(N'2018-07-16 11:51:27.000' AS DateTime), CAST(N'2018-07-16 15:22:50.080' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (69, N' Cổ phiếu ngân hàng về mức hấp dẫn ', N'Co-phieu-ngan-hang-ve-muc-hap-dan', N' http://cafef.vn/co-phieu-ngan-hang-ve-muc-hap-dan-20180716094153703.chn ', N'Cafef.vn', N'<span>Sau đợt điều chỉnh khá dài, nhóm CP ngân hàng (NH) đang trở về vùng giá hấp dẫn so với thời điểm đầu năm 2018. Càng hấp dẫn hơn với dự báo kết quả kinh doanh (KQKD) quý II của các NH khá sáng sủa.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/16/photo1531708718163-15317087181632019275016.jpg', CAST(N'2018-07-16 10:37:00.000' AS DateTime), CAST(N'2018-07-16 15:22:50.110' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (70, N' Hai ngân hàng lớn nhất Việt Nam đang bỏ trống ghế chủ tịch ', N'Hai-ngan-hang-lon-nhat-Viet-Nam-dang-bo-trong-ghe-chu-tich', N' http://cafef.vn/hai-ngan-hang-lon-nhat-viet-nam-dang-bo-trong-ghe-chu-tich-20180716095440047.chn ', N'Cafef.vn', N'<span>BIDV từ tháng 9/2016 tới nay vẫn chưa có ai ngồi vào vị trí chủ tịch. Tại VietinBank, ông chủ tịch ngân hàng vừa được điều động và bổ nhiệm làm phó chủ tịch tỉnh Quảng Ninh.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/16/photo1531709517077-15317095170771953850211.jpg', CAST(N'2018-07-16 09:54:00.000' AS DateTime), CAST(N'2018-07-16 15:22:50.150' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (71, N' Đầu tuần, tỷ giá trung tâm lại tăng ', N'Dau-tuan-ty-gia-trung-tam-lai-tang', N' http://cafef.vn/dau-tuan-ty-gia-trung-tam-lai-tang-20180716083953765.chn ', N'Cafef.vn', N'<span>Giá bán USD của các ngân hàng vẫn ở quanh vùng 23.100 đồng.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/16/photo1531705127152-15317051271521082502602.jpg', CAST(N'2018-07-16 08:39:54.000' AS DateTime), CAST(N'2018-07-16 15:22:50.190' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (72, N' Lợi nhuận ngân hàng đến giai đoạn bắt nhịp lực đẩy ', N'Loi-nhuan-ngan-hang-den-giai-doan-bat-nhip-luc-day', N' http://cafef.vn/loi-nhuan-ngan-hang-den-giai-doan-bat-nhip-luc-day-20180715224747422.chn ', N'Cafef.vn', N'<span>Một phần lý giải về đột biến lợi nhuận của nhiều ngân hàng thương mại hiện nay...</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/15/photo1531669573028-15316695730281788283058.jpg', CAST(N'2018-07-15 22:47:45.000' AS DateTime), CAST(N'2018-07-16 15:22:50.227' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (73, N' Lãi suất tăng, người mua nhà gặp khó ', N'Lai-suat-tang-nguoi-mua-nha-gap-kho', N' http://cafef.vn/lai-suat-tang-nguoi-mua-nha-gap-kho-20180715223744218.chn ', N'Cafef.vn', N'<span>Trong những ngày qua, việc các ngân thương mại thông báo biểu lãi suất cho vay mua bất động sản (BĐS) điều chỉnh tăng đang khiến cho những người vay mua căn hộ cảm thấy lo lắng về khoản tiền lãi vay bị đội lên hơn so với dự định ban đầu.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/15/photo1531669044164-153166904416494992716.jpg', CAST(N'2018-07-15 22:37:42.000' AS DateTime), CAST(N'2018-07-16 15:22:50.290' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (74, N' Chiến tranh thương mại Mỹ - Trung đẩy giá USD tăng, giá vàng sẽ giảm ', N'Chien-tranh-thuong-mai-My-Trung-day-gia-USD-tang-gia-vang-se-giam', N' http://cafef.vn/chien-tranh-thuong-mai-my-trung-day-gia-usd-tang-gia-vang-se-giam-20180715174326672.chn ', N'Cafef.vn', N'<span>Dự báo về giá vàng tuần tới, đa số chuyên gia phố Wall trả lời khảo sát của Kitco News đoán giá sẽ giảm.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/15/photo1531651387755-15316513877551892021411.jpg', CAST(N'2018-07-15 18:17:21.000' AS DateTime), CAST(N'2018-07-16 15:22:50.353' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (75, N' Tổng tài sản các doanh nghiệp bảo hiểm tăng 27% ', N'Tong-tai-san-cac-doanh-nghiep-bao-hiem-tang-27', N' http://cafef.vn/tong-tai-san-cac-doanh-nghiep-bao-hiem-tang-27-2018071513203539.chn ', N'Cafef.vn', N'<span>Các doanh nghiệp bảo hiểm đã đầu tư trở lại nền kinh tế 277.384 tỷ đồng trong nửa đầu năm 2018, tăng 27,47% so với cùng kỳ năm 2017...</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/15/photo1531635564552-1531635564555873741874.jpg', CAST(N'2018-07-15 15:25:08.000' AS DateTime), CAST(N'2018-07-16 15:22:50.393' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (76, N' Bán nhà thế chấp ngân hàng khi chưa trả hết nợ: Đã đủ yếu tố cấu thành tội phạm? ', N'Ban-nha-the-chap-ngan-hang-khi-chua-tra-het-no-Da-du-yeu-to-cau-thanh-toi-pham', N' http://cafef.vn/ban-nha-the-chap-ngan-hang-khi-chua-tra-het-no-da-du-yeu-to-cau-thanh-toi-pham-201807151000178.chn ', N'Cafef.vn', N'<span>Hoàng Quang H (SN 1975) là Giám đốc Công ty TNHH AC. Do cần tiền làm ăn, H vay của bà Nguyễn Thúy T 1 tỷ đồng (có viết giấy vay). Sau đó, do cần phát triển thêm mặt hàng nên H đã thế chấp nhà để vay của ngân hàng 1 tỷ đồng trong thời hạn 1 năm (trị giá nhà thực tế khoảng 4 tỷ đồng, ngân hàng định giá 3 tỷ 500 triệu đồng), ngân hàng đã giữ Giấy chứng nhận quyền sử dụng đất của H.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/15/photo1531623522061-15316235220611354219933.jpg', CAST(N'2018-07-15 13:25:44.000' AS DateTime), CAST(N'2018-07-16 15:22:50.457' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (77, N' Cán bộ nhân viên VIB chuẩn bị nhận thưởng lớn ', N'Can-bo-nhan-vien-VIB-chuan-bi-nhan-thuong-lon', N' http://cafef.vn/can-bo-nhan-vien-vib-chuan-bi-nhan-thuong-lon-20180709171152674.chn ', N'Cafef.vn', N'<span>Các ngân hàng đang đua nhau tung "chiêu" để thu hút nhân sự, trong đó hình thức phát hành cổ phiếu ESOP cho người lao động đang rất được ưa chuộng. VIB là một trong những ngân hàng sử dụng phương pháp này, thậm chí có phần hào phóng hơn các nhà băng khác.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/14/photo1531532422007-1531532422008543680119.jpg', CAST(N'2018-07-15 10:28:00.000' AS DateTime), CAST(N'2018-07-16 15:22:50.533' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (78, N' USD "chợ đen" liên tục lập đỉnh mới, nỗi lo tỷ giá vẫn chưa dứt ', N'USD-cho-den-lien-tuc-lap-dinh-moi-noi-lo-ty-gia-van-chua-dut', N' http://cafef.vn/usd-cho-den-lien-tuc-lap-dinh-moi-noi-lo-ty-gia-van-chua-dut-20180715013734018.chn ', N'Cafef.vn', N'<span>Giá bán USD trên thị trường tự do ngày 14/7 đã lên mức 23.300 VND/USD, có lúc đạt 23.350 VND/USD, cao nhất từ trước đến nay.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/15/photo1531593269857-15315932698581387943011.jpg', CAST(N'2018-07-15 07:03:00.000' AS DateTime), CAST(N'2018-07-16 15:22:50.597' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (79, N' Dân cư và doanh nghiệp đang gửi bao nhiêu tiền vào ngân hàng? ', N'Dan-cu-va-doanh-nghiep-dang-gui-bao-nhieu-tien-vao-ngan-hang', N' http://cafef.vn/dan-cu-va-doanh-nghiep-dang-gui-bao-nhieu-tien-vao-ngan-hang-20180714105449284.chn ', N'Cafef.vn', N'<span>Đến cuối tháng 3, huy động vốn từ dân cư và tổ chức kinh tế mới chỉ tăng 3%. Song đến cuối tháng 6 đã đạt tới 8%, cao hơn cùng kỳ năm ngoái. Tiền gửi chảy mạnh vào ngân hàng trong 3 tháng gần đây là do đâu?</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/14/photo1531540161161-1531540161161881458634.jpg', CAST(N'2018-07-14 15:57:12.000' AS DateTime), CAST(N'2018-07-16 15:22:50.650' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (80, N' Tín dụng giảm tốc, hàng loạt ngân hàng vẫn lãi lớn nhờ đâu? ', N'Tin-dung-giam-toc-hang-loat-ngan-hang-van-lai-lon-nho-dau', N' http://cafef.vn/tin-dung-giam-toc-hang-loat-ngan-hang-van-lai-lon-nho-dau-20180714085258236.chn ', N'Cafef.vn', N'<span>Mặc dù tăng trưởng tín dụng giảm tốc nhưng sẽ không ảnh hưởng lớn đến lợi nhuận của các ngân hàng. Do yếu tố này đã nằm trong giả định trước đó và các ngân hàng đang hưởng lợi từ tỷ lệ NIM tăng nhờ lãi suất nhìn chung tăng.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/14/photo1531532996592-1531532996592442838093.jpg', CAST(N'2018-07-14 13:07:00.000' AS DateTime), CAST(N'2018-07-16 15:22:50.693' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (81, N' Việt Nam nên ứng xử thế nào trong cuộc chiến thương mại Mỹ - Trung? ', N'Viet-Nam-nen-ung-xu-the-nao-trong-cuoc-chien-thuong-mai-My-Trung', N' http://cafef.vn/viet-nam-nen-ung-xu-the-nao-trong-cuoc-chien-thuong-mai-my-trung-20180714102027675.chn ', N'Cafef.vn', N'<span>Cuộc chiến thương mại Mỹ - Trung đang ngày càng gia tăng và có dấu hiệu lan rộng sang cả cuộc chiến tiền tệ khi đồng yuan của Trung Quốc không biết vô tình hay hữu ý đã giảm giá đáng kể so với USD trong mấy tuần gần đây.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/14/photo1531538199062-15315381990621796797139.jpg', CAST(N'2018-07-14 11:20:00.000' AS DateTime), CAST(N'2018-07-16 15:22:50.743' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (82, N' Ngân hàng Nhà nước bắt đầu bán ra ngoại tệ ', N'Ngan-hang-Nha-nuoc-bat-dau-ban-ra-ngoai-te', N' http://cafef.vn/ngan-hang-nha-nuoc-bat-dau-ban-ra-ngoai-te-20180717082130124.chn ', N'Cafef.vn', N'<span>Nhà điều hành tiếp tục cụ thể hóa việc can thiệp biến động tỷ giá USD/VND...</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/17/photo1531790353679-1531790353679190602080.jpg', CAST(N'2018-07-17 08:23:50.000' AS DateTime), CAST(N'2018-07-17 08:23:45.993' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (83, N' Ngân hàng SCB báo lãi trước thuế 94 tỷ, tổng tài sản hơn 476 nghìn tỷ đồng trong 6 tháng đầu năm ', N'Ngan-hang-SCB-bao-lai-truoc-thue-94-ty-tong-tai-san-hon-476-nghin-ty-dong-trong-6-thang-dau-nam', N' http://cafef.vn/ngan-hang-scb-bao-lai-truoc-thue-94-ty-tong-tai-san-hon-476-nghin-ty-dong-trong-6-thang-dau-nam-20180717070620186.chn ', N'Cafef.vn', N'<span>Tín dụng của SCB tăng trưởng 12% trong 6 tháng còn huy động vốn tăng 8,9%.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/17/photo1531790548355-1531790548542647156424.jpg', CAST(N'2018-07-17 07:06:00.000' AS DateTime), CAST(N'2018-07-17 08:23:46.347' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (84, N' Vụ hot girl ngân hàng "rút ruột" 50 tỷ đồng: Toà tuyên Eximbank phải trả tiền cho khách hàng ', N'Vu-hot-girl-ngan-hang-rut-ruot-50-ty-dong-Toa-tuyen-Eximbank-phai-tra-tien-cho-khach-hang', N' http://cafef.vn/vu-hot-girl-ngan-hang-rut-ruot-50-ty-dong-toa-tuyen-eximbank-phai-tra-tien-cho-khach-hang-20180716205621046.chn ', N'Cafef.vn', N'<span>Trong số 15 bị cáo có 1 bị cáo được miễn trách nhiệm hình sự là Bùi Văn Trường - nguyên kiểm soát viên PGD Đô Lương.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/16/photo1531749310812-1531749310813888815344.jpg', CAST(N'2018-07-16 20:56:24.000' AS DateTime), CAST(N'2018-07-17 08:23:46.397' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (85, N' Hotgirl ngân hàng chiếm đoạt 50 tỉ đồng nhận án tù chung thân ', N'Hotgirl-ngan-hang-chiem-doat-50-ti-dong-nhan-an-tu-chung-than', N' http://cafef.vn/hotgirl-ngan-hang-chiem-doat-50-ti-dong-nhan-an-tu-chung-than-20180716204342858.chn ', N'Cafef.vn', N'<span>Sau khi tuyên án, hotgirl ngân hàng Nguyễn Thị Lam khóc, ngất xỉu, các cảnh sát phải khiêng lên xe bịt thùng chở về trại tạm giam.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/16/photo1531748469433-15317484694342044305085.jpg', CAST(N'2018-07-16 20:43:46.000' AS DateTime), CAST(N'2018-07-17 08:23:46.457' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (86, N' Lãi suất liên ngân hàng tiếp tục tăng ', N'Lai-suat-lien-ngan-hang-tiep-tuc-tang', N' http://cafef.vn/lai-suat-lien-ngan-hang-tiep-tuc-tang-20180716165338577.chn ', N'Cafef.vn', N'<span>Lãi suất USD liên ngân hàng vẫn tiếp tục cao hơn gấp đôi so với lãi suất liên ngân hàng VND ở các kỳ hạn ngắn.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/16/photo1531734749934-1531734749934193585265.jpg', CAST(N'2018-07-16 16:53:41.000' AS DateTime), CAST(N'2018-07-17 08:23:46.520' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (87, N' Xét xử nữ nhân viên “ăn” hàng trăm triệu đồng của công ty tài chính ', N'Xet-xu-nu-nhan-vien-an-hang-tram-trieu-dong-cua-cong-ty-tai-chinh', N' http://cafef.vn/xet-xu-nu-nhan-vien-an-hang-tram-trieu-dong-cua-cong-ty-tai-chinh-20180716161640061.chn ', N'Cafef.vn', N'<span>Nguyễn Hồng Trang (cựu nhân viên Công ty Home Credit) đã lập khống 43 hợp đồng tín dụng để mua hàng và bán ngay lấy tiền tiêu sài cá nhân để chiếm đoạt số tiền hơn 310 triệu đồng.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/16/photo1531732547758-15317325477581167309991.jpg', CAST(N'2018-07-16 16:16:42.000' AS DateTime), CAST(N'2018-07-17 08:23:46.563' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (88, N' USD thị trường tự do đã hạ nhiệt ', N'USD-thi-truong-tu-do-da-ha-nhiet', N' http://cafef.vn/usd-thi-truong-tu-do-da-ha-nhiet-20180717100039436.chn ', N'Cafef.vn', N'<span>Giá bán USD đã giảm mạnh từ mốc 23.300 VND/USD lập được hôm thứ 7 tuần trước xuống còn 23.240 VND/USD</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/17/photo1531796228657-1531796228657878223287.jpg', CAST(N'2018-07-17 10:15:22.000' AS DateTime), CAST(N'2018-07-17 10:39:02.510' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (89, N' Ngành ngân hàng Nhật Bản khủng hoảng, chuyển hướng sang Việt Nam hoạt động ', N'Nganh-ngan-hang-Nhat-Ban-khung-hoang-chuyen-huong-sang-Viet-Nam-hoat-dong', N' http://cafef.vn/nganh-ngan-hang-nhat-ban-khung-hoang-chuyen-huong-sang-viet-nam-hoat-dong-20180717091507921.chn ', N'Cafef.vn', N'<span>Theo chuyên gia J Brian Waterhouse của Windamee Research, các ngân hàng Nhật sẽ mở rộng hoạt động sang thị trường nước ngoài, đặc biệt là khu vực Đông Nam Á như Việt Nam, Thái Lan…</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/17/photo1531793708192-1531793708192150806503.jpg', CAST(N'2018-07-17 09:42:00.000' AS DateTime), CAST(N'2018-07-17 10:39:02.610' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (90, N' Nhiều ngân hàng gom vốn chuẩn bị cho những "trận đánh lớn" ', N'Nhieu-ngan-hang-gom-von-chuan-bi-cho-nhung-tran-danh-lon', N' http://cafef.vn/nhieu-ngan-hang-gom-von-chuan-bi-cho-nhung-tran-danh-lon-20180716170713249.chn ', N'Cafef.vn', N'<span>Nửa đầu năm, bên cạnh huy động tiền gửi từ khách hàng, nhiều nhà băng đã tìm đến nguồn vốn huy động từ phát hành trái phiếu và vay các định chế tài chính nước ngoài với giá trị hàng nghìn tỷ đồng.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/17/photo1531811935446-1531811935447574986842.jpg', CAST(N'2018-07-17 14:21:55.000' AS DateTime), CAST(N'2018-07-17 15:29:04.030' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (91, N' Ngành ngân hàng đang "thấm" cuộc chiến thương mại của ông Trump ', N'Nganh-ngan-hang-dang-tham-cuoc-chien-thuong-mai-cua-ong-Trump', N' http://cafef.vn/nganh-ngan-hang-dang-tham-cuoc-chien-thuong-mai-cua-ong-trump-20180717134436093.chn ', N'Cafef.vn', N'<span>Đối với các ngân hàng chuyên về tài trợ thương mại ở châu Á, cuộc chiến thuế quan giữa Mỹ và Trung Quốc đến vào thời điểm không thể tồi tệ hơn.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/17/photo1531809673269-1531809673269958801649.jpg', CAST(N'2018-07-17 13:47:57.000' AS DateTime), CAST(N'2018-07-17 15:29:04.113' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (92, N' Hơn 2,3 tỷ cổ phiếu TCB dự kiến giao dịch trong tháng 7 ', N'Hon-23-ty-co-phieu-TCB-du-kien-giao-dich-trong-thang-7', N' http://cafef.vn/hon-23-ty-co-phieu-tcb-du-kien-giao-dich-trong-thang-7-20180717112636077.chn ', N'Cafef.vn', N'<span>Đợt chia thưởng cổ phiếu đã nâng gấp 3 lần số lượng cổ phiếu Techcombank từ 1,16 tỷ cổ phiếu lên 3,49 tỷ cổ phiếu. Số lượng cổ đông Techcombank cũng đã tăng gấp hơn 2 lần trong hai tháng qua.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/17/photo1531801539673-15318015396731793752041.jpg', CAST(N'2018-07-17 11:26:43.000' AS DateTime), CAST(N'2018-07-17 15:29:04.167' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (93, N' Áp lực từ cuộc chiến thương mại Mỹ - Trung ', N'Ap-luc-tu-cuoc-chien-thuong-mai-My-Trung', N' http://cafef.vn/ap-luc-tu-cuoc-chien-thuong-mai-my-trung-20180717110356343.chn ', N'Cafef.vn', N'<span>Áp lực tăng tỉ giá USD/VNĐ do tác động từ cuộc chiến thương mại Mỹ - Trung đang căng thẳng là có, song theo các chuyên gia, chưa nhất thiết phải phá giá tiền đồng bởi còn nhiều công cụ ứng phó khác.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/17/photo1531800221308-1531800221309118179477.jpg', CAST(N'2018-07-17 11:25:06.000' AS DateTime), CAST(N'2018-07-17 15:29:04.213' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (94, N' Không “lobby”, khó vay tiền ngân hàng? ', N'Khong-lobby-kho-vay-tien-ngan-hang', N' http://cafef.vn/khong-lobby-kho-vay-tien-ngan-hang-20180719072142786.chn ', N'Cafef.vn', N'<span>“Chúng tôi là những doanh nghiệp mới thành lập, lại siêu nhỏ, nhu cầu vay vốn ngân hàng để kinh doanh, mở rộng sản xuất là cực lớn. Tuy nhiên, nếu không ''lobby'' thì rất khó tiếp cận được nguồn vốn ngân hàng”'', đại diện chủ doanh nghiệp trong lĩnh vực xuất nhập khẩu bộc bạch.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/19/photo1531959697165-15319596971651883791686.jpg', CAST(N'2018-07-19 08:32:42.000' AS DateTime), CAST(N'2018-07-19 08:52:23.470' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (95, N' "Soi lý lịch" của các ngân hàng nước ngoài tại Việt Nam ', N'Soi-ly-lich-cua-cac-ngan-hang-nuoc-ngoai-tai-Viet-Nam', N' http://cafef.vn/soi-ly-lich-cua-cac-ngan-hang-nuoc-ngoai-tai-viet-nam-20180718185034208.chn ', N'Cafef.vn', N'<span>Hầu hết đều là những ngân hàng có được sự hậu thuẫn từ các tập đoàn tài chính, ngân hàng mẹ với lý lịch "khủng" về sự lâu đời, quy mô và danh tiếng lớn mạnh trên thế giới.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/18/photo1531913995962-15319139959631645823932.png', CAST(N'2018-07-19 06:49:39.000' AS DateTime), CAST(N'2018-07-19 08:52:23.670' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (96, N' NHNN nhắc nhở các ngân hàng kiểm soát tăng trưởng tín dụng theo chỉ tiêu được giao ', N'NHNN-nhac-nho-cac-ngan-hang-kiem-soat-tang-truong-tin-dung-theo-chi-tieu-duoc-giao', N' http://cafef.vn/nhnn-nhac-nho-cac-ngan-hang-kiem-soat-tang-truong-tin-dung-theo-chi-tieu-duoc-giao-20180718194011536.chn ', N'Cafef.vn', N'<span>Ngân hàng Nhà nước yêu cầu các TCTD kiểm soát tốc độ tăng trưởng tín dụng phù hợp với khả năng huy động vốn và chỉ tiêu đã được NHNN giao.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/18/photo1531917496212-1531917496213421036553.jpg', CAST(N'2018-07-19 06:30:00.000' AS DateTime), CAST(N'2018-07-19 08:52:23.707' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (97, N' Giá USD tăng nhưng không có căng thẳng ngoại tệ ', N'Gia-USD-tang-nhung-khong-co-cang-thang-ngoai-te', N' http://cafef.vn/gia-usd-tang-nhung-khong-co-cang-thang-ngoai-te-2018071816570513.chn ', N'Cafef.vn', N'<span>Tỉ giá USD/VNĐ đang chịu nhiều sức ép, một phần đến từ việc Mỹ nâng lãi suất và đồng USD tăng giá trên thị trường quốc tế nhưng không có căng thẳng ngoại tệ.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/18/photo1531907817555-1531907817555487788254.jpg', CAST(N'2018-07-18 22:16:00.000' AS DateTime), CAST(N'2018-07-19 08:52:23.767' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (98, N' Không để bị động, bất ngờ trong điều hành chính sách tiền tệ ', N'Khong-de-bi-dong-bat-ngo-trong-dieu-hanh-chinh-sach-tien-te', N' http://cafef.vn/khong-de-bi-dong-bat-ngo-trong-dieu-hanh-chinh-sach-tien-te-20180718213415036.chn ', N'Cafef.vn', N'<span>Chiều 18/7, dự phiên họp định kỳ của Hội đồng tư vấn chính sách tài chính tiền tệ quốc gia, Thủ tướng Nguyễn Xuân Phúc mong muốn lắng nghe các ý kiến về chính sách tỉ giá, lãi suất nên làm gì để vừa bảo đảm mục tiêu tăng trưởng, vừa kiểm soát lạm phát, ổn định kinh tế vĩ mô…</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/18/photo1531924348721-15319243487221855399456.jpg', CAST(N'2018-07-18 21:33:29.000' AS DateTime), CAST(N'2018-07-19 08:52:23.810' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (99, N' Tín hiệu mới trên thị trường ngoại tệ ', N'Tin-hieu-moi-tren-thi-truong-ngoai-te', N' http://cafef.vn/tin-hieu-moi-tren-thi-truong-ngoai-te-20180718172237114.chn ', N'Cafef.vn', N'<span>Trong tháng 6 và đầu tháng 7 tỷ giá đã tăng tổng cộng 1,1% - bật lên khỏi nền giá duy trì suốt hơn 1 năm trước đó.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/18/photo1531909210303-15319092103031736509728.jpg', CAST(N'2018-07-18 19:22:00.000' AS DateTime), CAST(N'2018-07-19 08:52:23.847' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (100, N' Những sếp ngân hàng "vang bóng một thời" nhưng hiện tại…tăm tối ', N'Nhung-sep-ngan-hang-vang-bong-mot-thoi-nhung-hien-taitam-toi', N' http://cafef.vn/nhung-sep-ngan-hang-vang-bong-mot-thoi-nhung-hien-taitam-toi-20180718182625255.chn ', N'Cafef.vn', N'<span>Những cái tên như Trầm Bê, Bầu Kiên, Hà Văn Thắm, Hứa Thị Phấn, Trần Phương Bình, Nguyễn Xuân Sơn, Tạ Bá Long, Đoàn Văn An, Phan Thành Mai, Phan Huy Khang…từng một thời rất đình đám trong giới ngân hàng thì nay lại là bị án hoặc bị cáo ở các phiên tòa xếp vào hàng "đại án" của đất nước.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/18/photo1531913127679-1531913127679165309634.jpg', CAST(N'2018-07-18 18:25:39.000' AS DateTime), CAST(N'2018-07-19 08:52:23.880' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (101, N' Ngân hàng Nhà nước nhất trí tạm dừng nhập khẩu máy đào tiền ảo ', N'Ngan-hang-Nha-nuoc-nhat-tri-tam-dung-nhap-khau-may-dao-tien-ao', N' http://cafef.vn/ngan-hang-nha-nuoc-nhat-tri-tam-dung-nhap-khau-may-dao-tien-ao-20180718165937473.chn ', N'Cafef.vn', N'<span>Ngân hàng Nhà nước đã nhất trí với việc tạm dừng nhập khẩu máy xử lý dữ liệu tự động nhằm mục đích đào tiền ảo.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/18/photo1531907969194-15319079691941919698456.jpg', CAST(N'2018-07-18 17:11:38.000' AS DateTime), CAST(N'2018-07-19 08:52:23.937' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (102, N' Thanh khoản ngân hàng trở lại trạng thái dư thừa ', N'Thanh-khoan-ngan-hang-tro-lai-trang-thai-du-thua', N' http://cafef.vn/thanh-khoan-ngan-hang-tro-lai-trang-thai-du-thua-20180718170902645.chn ', N'Cafef.vn', N'<span>Tăng trưởng tín dụng chậm là một nhân tố hỗ trợ thanh khoản hệ thống ngân hàng.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/18/photo1531908336127-15319083361281197404140.jpg', CAST(N'2018-07-18 17:08:16.000' AS DateTime), CAST(N'2018-07-19 08:52:23.973' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (103, N' Ngân hàng bất ngờ tăng lãi suất chẳng khác nào gài ''bẫy'' ', N'Ngan-hang-bat-ngo-tang-lai-suat-chang-khac-nao-gai-bay', N' http://cafef.vn/ngan-hang-bat-ngo-tang-lai-suat-chang-khac-nao-gai-bay-20180718155739114.chn ', N'Cafef.vn', N'<span>Thiếu tài sản bảo đảm, khó tiếp cận vốn vay ngân hàng, hay làm sao để được hưởng vốn giá rẻ luôn là những “nút thắt” khiến các doanh nghiệp nhỏ và vừa đau đầu nhất.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/18/photo1531904185670-15319041856701546132514.jpg', CAST(N'2018-07-18 16:08:15.000' AS DateTime), CAST(N'2018-07-19 08:52:24.050' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (104, N' Kịch bản nào cho tỷ giá? ', N'Kich-ban-nao-cho-ty-gia', N' http://cafef.vn/kich-ban-nao-cho-ty-gia-20180718155154551.chn ', N'Cafef.vn', N'<span>Chuyên gia cho rằng, tỷ giá năm nay sẽ không có biến động lớn do lạm phát của Việt Nam vẫn ở mức thấp, lãi suất đồng VND tương đối ổn định trong khi dự trữ ngoại hối đang ở mức cao.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/18/photo1531903873847-15319038738471604309317.jpg', CAST(N'2018-07-18 15:54:30.000' AS DateTime), CAST(N'2018-07-19 08:52:24.113' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (105, N' Làm gì để tiền nhàn rỗi sinh lời? ', N'Lam-gi-de-tien-nhan-roi-sinh-loi', N' http://cafef.vn/lam-gi-de-tien-nhan-roi-sinh-loi-20180718110736176.chn ', N'Cafef.vn', N'<span>“Làm gì để tiền nhàn rỗi sinh lời?” luôn là câu hỏi được nhiều người quan tâm. Đặc biệt khi hiện nay, có rất nhiều kênh đầu tư và tiết kiệm đa dạng với những ưu điểm và hạn chế khác nhau, vậy đâu sẽ là hình thức hợp lý và sinh lời hiệu quả nhất?</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/18/httpchannelvcmediavnprupload270201807img201807171639001762-15318868560421290306275.jpg', CAST(N'2018-07-18 13:30:00.000' AS DateTime), CAST(N'2018-07-19 08:52:24.150' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (106, N' Chính sách tiền tệ cần có sự “chia lửa” ', N'Chinh-sach-tien-te-can-co-su-chia-lua', N' http://cafef.vn/chinh-sach-tien-te-can-co-su-chia-lua-20180718111816567.chn ', N'Cafef.vn', N'<span>Trong thời gian tới điều hành CSTT tiếp tục kiên định mục tiêu hỗ trợ tăng trưởng trên nền tảng ổn định kinh tế vĩ mô và phối hợp nhịp nhàng với các chính sách khác như chính sách tài khoá…</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/18/photo1531887404064-1531887404065944082136.jpg', CAST(N'2018-07-18 11:42:24.000' AS DateTime), CAST(N'2018-07-19 08:52:24.207' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (107, N' VPBank tăng phí thường niên thẻ tín dụng thêm gần 100 nghìn đồng ', N'VPBank-tang-phi-thuong-nien-the-tin-dung-them-gan-100-nghin-dong', N' http://cafef.vn/den-luot-vpbank-tang-phi-dich-vu-rieng-phi-thuong-nien-the-tin-dung-tang-gan-100-nghin-dong-20180718105438333.chn ', N'Cafef.vn', N'<span>Ngân hàng này cũng tăng cả phí rút tiền mặt ATM bằng thẻ tín dụng và tăng phí với một số dịch vụ khách hàng cá nhân khác.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/18/photo1531885828156-15318858281572057751384.jpg', CAST(N'2018-07-18 11:17:17.000' AS DateTime), CAST(N'2018-07-19 08:52:24.307' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (108, N' Bắt tay với nhiều “đại gia” Fintech cùng hàng chục ngân hàng lớn nhỏ tại Việt Nam, NAPAS thu về hàng trăm tỷ đồng lợi nhuận mỗi năm ', N'Bat-tay-voi-nhieu-dai-gia-Fintech-cung-hang-chuc-ngan-hang-lon-nho-tai-Viet-Nam-NAPAS-thu-ve-hang-tram-ty-dong-loi-nhuan-moi-nam', N' http://cafef.vn/giao-dich-the-va-thanh-toan-online-bung-no-napas-thu-ve-hang-tram-ty-dong-loi-nhuan-moi-nam-20180718103842817.chn ', N'Cafef.vn', N'<span>Trong năm 2016, tổng giá trị giao dịch của các ngân hàng thực hiện qua hệ thống NAPAS đạt 320 nghìn tỷ đồng, tăng 50% so với năm trước đó. Nguồn thu của NAPAS chủ yếu đến từ việc thu phí các dịch vụ ngân hàng. Bởi vậy, hoạt động giao dịch qua ngân hàng càng nhiều thì NAPAS càng hưởng lợi.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/18/photo1531885020751-15318850207521163279892.jpg', CAST(N'2018-07-18 11:06:00.000' AS DateTime), CAST(N'2018-07-19 08:52:24.363' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (109, N' NHNN bơm ròng 45.200 tỷ đồng vào nền kinh tế, lãi suất liên ngân hàng tăng nhanh ', N'NHNN-bom-rong-45200-ty-dong-vao-nen-kinh-te-lai-suat-lien-ngan-hang-tang-nhanh', N' http://cafef.vn/nhnn-bom-rong-45200-ty-dong-vao-nen-kinh-te-lai-suat-lien-ngan-hang-tang-nhanh-20180718095346718.chn ', N'Cafef.vn', N'<span>Giá trị bơm ròng của NHNN tuần từ 9/7-13/7 cao gấp 3 lần tuần trước. Lãi suất liên ngân hàng bằng VND tiếp tục tăng và đã tăng lên 1,36% vào ngày 16/7 đối với kỳ hạn qua đêm.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/18/photo1531882420760-1531882420760838192689.png', CAST(N'2018-07-18 10:36:54.000' AS DateTime), CAST(N'2018-07-19 08:52:24.410' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (110, N' Chênh lệch giữa vàng trong nước và thế giới bị đẩy lên 2,7 triệu đồng/lượng ', N'Chenh-lech-giua-vang-trong-nuoc-va-the-gioi-bi-day-len-27-trieu-dongluong', N' http://cafef.vn/chenh-lech-giua-vang-trong-nuoc-va-the-gioi-bi-day-len-27-trieu-dong-luong-2018071810013703.chn ', N'Cafef.vn', N'<span>Vàng thế giới rơi xuống mức thấp nhất 1 năm trong khi vàng trong nước vẫn cố thủ ở mức cao.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/18/photo1531882774730-15318827747301346345584.jpg', CAST(N'2018-07-18 10:00:49.000' AS DateTime), CAST(N'2018-07-19 08:52:24.450' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (111, N' VietinBank dẫn đầu về Dịch vụ chăm sóc khách hàng do Global Banking and Finance Review trao tặng ', N'VietinBank-dan-dau-ve-Dich-vu-cham-soc-khach-hang-do-Global-Banking-and-Finance-Review-trao-tang', N' http://cafef.vn/vietinbank-dan-dau-ve-dich-vu-cham-soc-khach-hang-do-global-banking-and-finance-review-trao-tang-20180717154703624.chn ', N'Cafef.vn', N'<span>Chiều ngày 27/6/2018, tại London (Anh Quốc), VietinBank đã nhận giải thưởng “Leading Contact Center Vietnam 2018” do Global Banking &amp; Finance Review trao tặng. VietinBank hiện là ngân hàng đầu tiên và duy nhất tại Việt Nam nhận giải thưởng này.</span>', N'', 0, 189, 0, N'http://channel.vcmedia.vn/prupload/270/2018/07/img_201807171009164317.jpg', CAST(N'2018-07-18 10:00:00.000' AS DateTime), CAST(N'2018-07-19 08:52:24.497' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (112, N' Tỷ giá USD/VND và ám ảnh phá giá Nhân dân tệ ba năm trước ', N'Ty-gia-USDVND-va-am-anh-pha-gia-Nhan-dan-te-ba-nam-truoc', N' http://cafef.vn/ty-gia-usd-vnd-va-am-anh-pha-gia-nhan-dan-te-ba-nam-truoc-20180718084245718.chn ', N'Cafef.vn', N'<span>Diễn biến đồng Nhân dân tệ gần đây gợi lại cú sốc tỷ giá USD/VND ba năm về trước...</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/18/photo1531878018222-15318780183841392221169.jpg', CAST(N'2018-07-18 09:02:19.000' AS DateTime), CAST(N'2018-07-19 08:52:24.587' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (113, N' Hội thao Vietbank khẳng định tinh thần “Hợp sức đồng lòng – Cán đích thành công” ', N'Hoi-thao-Vietbank-khang-dinh-tinh-than-Hop-suc-dong-long-Can-dich-thanh-cong', N' http://cafef.vn/hoi-thao-vietbank-khang-dinh-tinh-than-hop-suc-dong-long-can-dich-thanh-cong-20180717161335186.chn ', N'Cafef.vn', N'<span>Hội thao toàn hàng Ngân hàng Việt Nam Thương Tín (Vietbank) quy tụ trên 700 vận động viên, cổ động viên đến từ các khối, phòng ban hội sở, chi nhánh cả nước và tranh tài ở 5 bộ môn gồm bóng đá, tennis, kéo co, nhảy bao bố, điền kinh.</span>', N'', 0, 189, 0, N'http://channel.vcmedia.vn/prupload/270/2018/07/img_201807171543199722.jpg', CAST(N'2018-07-18 08:00:00.000' AS DateTime), CAST(N'2018-07-19 08:52:24.637' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (114, N' Giảm giá VND để hỗ trợ xuất khẩu: Nên hay không? ', N'Giam-gia-VND-de-ho-tro-xuat-khau-Nen-hay-khong', N' http://cafef.vn/giam-gia-vnd-de-ho-tro-xuat-khau-nen-hay-khong-20180719131401251.chn ', N'Cafef.vn', N'<span>Một số ý kiến chuyên gia cho rằng, Việt Nam cần theo một chính sách tỷ giá mềm dẻo, tức là nên giảm giá đồng VND so với USD nhưng không giảm mạnh như CNY để hỗ trợ xuất khẩu.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/19/photo1531980750713-1531980750713658045276.jpg', CAST(N'2018-07-19 13:13:19.000' AS DateTime), CAST(N'2018-07-19 13:52:33.340' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (115, N' “Kho tiền khủng như ngân hàng” trong đường dây đánh bạc ngàn tỷ ', N'Kho-tien-khung-nhu-ngan-hang-trong-duong-day-danh-bac-ngan-ty', N' http://cafef.vn/kho-tien-khung-nhu-ngan-hang-trong-duong-day-danh-bac-ngan-ty-20180719111243376.chn ', N'Cafef.vn', N'<span>Cơ quan An ninh điều tra Công an tỉnh Phú Thọ đã tống đạt Kết luận điều tra số 829/ANĐT gồm 216 trang, chuyển toàn bộ hồ sơ vụ án và Bản kết luận điều tra đến Viện kiểm sát nhân dân tỉnh Phú Thọ đề nghị truy tố 92 bị can về 07 tội danh.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/19/photo1531973498378-15319734983781800632166.jpg', CAST(N'2018-07-19 11:12:01.000' AS DateTime), CAST(N'2018-07-19 13:52:34.500' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (116, N' Tỷ giá trung tâm bật tăng mạnh trở lại ', N'Ty-gia-trung-tam-bat-tang-manh-tro-lai', N' http://cafef.vn/ty-gia-trung-tam-bat-tang-manh-tro-lai-20180719102500673.chn ', N'Cafef.vn', N'<span>Sáng 19/7, tỷ giá trung tâm tăng đến 19 đồng, trong khi đó giá mua bán USD tại các ngân hàng thương mại không mấy biến động kể từ đầu tuần đến nay.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/19/photo1531970469805-15319704698061345446683.jpg', CAST(N'2018-07-19 10:35:13.000' AS DateTime), CAST(N'2018-07-19 13:52:34.550' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (117, N' Rút tiền tại ATM bằng điện thoại cực kỳ đơn giản với bảo bối này ', N'Rut-tien-tai-ATM-bang-dien-thoai-cuc-ky-don-gian-voi-bao-boi-nay', N' http://cafef.vn/rut-tien-tai-atm-bang-dien-thoai-cuc-ky-don-gian-voi-bao-boi-nay-20180718172410739.chn ', N'Cafef.vn', N'<span>Cuộc sống hối hả ngày nay đang khiến chúng ta có quá nhiều thứ phải lo toan, từ công việc gia đình cho tới tình cảm… Chính những thứ này cũng đôi khi khiến ta tập trung và quên đi một số thứ khác, rồi căn bệnh “não cá vàng” được sinh ra từ đó.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/18/httpchannelvcmediavnprupload270201807img201807181420586453-15319094501901097021918.jpg', CAST(N'2018-07-19 10:00:00.000' AS DateTime), CAST(N'2018-07-19 13:52:34.900' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (118, N' NHNN bơm ròng 27.400 tỷ đồng ra thị trường ', N'NHNN-bom-rong-27400-ty-dong-ra-thi-truong', N' http://cafef.vn/nhnn-bom-rong-27400-ty-dong-ra-thi-truong-20180719090345145.chn ', N'Cafef.vn', N'<span>Theo BVSC, diễn biến bơm ròng tuần vừa qua (9-13/7) của NHNN cho thấy thanh khoản hệ thống đang có phần eo hẹp hơn so với các tuần trước đó.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/19/photo1531969029956-1531969029956506479317.jpg', CAST(N'2018-07-19 09:56:50.000' AS DateTime), CAST(N'2018-07-19 13:52:34.977' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (119, N' Cho vay mua xe máy mang lại lợi nhuận khổng lồ cho các ông lớn ', N'Cho-vay-mua-xe-may-mang-lai-loi-nhuan-khong-lo-cho-cac-ong-lon', N' http://cafef.vn/cho-vay-mua-xe-may-mang-lai-loi-nhuan-khong-lo-cho-cac-ong-lon-2018071909085077.chn ', N'Cafef.vn', N'<span>Ba công ty tài chính tiêu dùng hàng đầu Việt Nam là HD Saison, FE Credit, và Home Credit có các cách thức tiếp cận thận trọng và cho vay khác nhau.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/19/photo1531966119977-15319661199771555769135.jpg', CAST(N'2018-07-19 09:20:00.000' AS DateTime), CAST(N'2018-07-19 13:52:35.023' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (120, N' Bắt khẩn cấp Chủ tịch HĐQT và Tổng Giám đốc Công ty VNCOIN, Thiên Rồng Việt lừa đảo đa cấp ', N'Bat-khan-cap-Chu-tich-HDQT-va-Tong-Giam-doc-Cong-ty-VNCOIN-Thien-Rong-Viet-lua-dao-da-cap', N' http://cafef.vn/bat-khan-cap-chu-tich-hdqt-va-tong-giam-doc-cong-ty-vncoin-thien-rong-viet-lua-dao-da-cap-20180719215827533.chn ', N'Cafef.vn', N'<span>Bắt khẩn cấp Chủ tịch HĐQT và Tổng Giám đốc Công ty VNCOIN, Thiên Rồng Việt lừa đảo đa cấp.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/19/photo1532012254598-15320122545981926180309.jpg', CAST(N'2018-07-19 22:33:45.000' AS DateTime), CAST(N'2018-07-20 08:40:31.137' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (121, N' Cuối tháng này sẽ có thêm hơn 3 tỷ cổ phiếu ngân hàng được giao dịch ', N'Cuoi-thang-nay-se-co-them-hon-3-ty-co-phieu-ngan-hang-duoc-giao-dich', N' http://cafef.vn/cuoi-thang-nay-se-co-them-hon-3-ty-co-phieu-ngan-hang-duoc-giao-dich-20180719145932579.chn ', N'Cafef.vn', N'<span>Hơn 2,3 tỷ cổ phiếu Techcombank và 925 triệu cổ phiếu VPBank sắp được đưa vào giao dịch vào cuối tháng 7 này.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/19/photo1531986792367-1531986792367407005963.png', CAST(N'2018-07-19 19:45:00.000' AS DateTime), CAST(N'2018-07-20 08:40:31.403' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (122, N' Lãi suất có xu hướng xoa dịu tỷ giá USD/VND ', N'Lai-suat-co-xu-huong-xoa-diu-ty-gia-USDVND', N' http://cafef.vn/lai-suat-co-xu-huong-xoa-diu-ty-gia-usd-vnd-2018071915173336.chn ', N'Cafef.vn', N'<span>Cân đối lãi suất đã có những chuyển động mạnh hơn, giảm bớt áp lực đối với tỷ giá USD/VND...</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/19/photo1531988191075-15319881910751158836120.jpg', CAST(N'2018-07-19 17:14:00.000' AS DateTime), CAST(N'2018-07-20 08:40:31.457' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (123, N' Đánh sập đường dây buôn lậu vàng từ Campuchia vào Việt Nam ', N'Danh-sap-duong-day-buon-lau-vang-tu-Campuchia-vao-Viet-Nam', N' http://cafef.vn/danh-sap-duong-day-buon-lau-vang-tu-campuchia-vao-viet-nam-2018071916455511.chn ', N'Cafef.vn', N'<span>Khi các đối tượng đang giao nhận vàng tại 1 quán cà phê, công an ập vào bắt quả tang.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/19/photo1531993543362-15319935433631865648725.jpg', CAST(N'2018-07-19 16:54:22.000' AS DateTime), CAST(N'2018-07-20 08:40:31.500' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (124, N' Kienlongbank: Lãi ròng 121 tỷ đồng trong 6 tháng đầu năm, đang đầu tư hơn 230 tỷ vào cổ phiếu Sacombank và Maritime Bank ', N'Kienlongbank-Lai-rong-121-ty-dong-trong-6-thang-dau-nam-dang-dau-tu-hon-230-ty-vao-co-phieu-Sacombank-va-Maritime-Bank', N' http://cafef.vn/kienlongbank-lai-rong-121-ty-dong-trong-6-thang-dau-nam-dang-dau-tu-hon-230-ty-vao-co-phieu-sacombank-va-maritime-bank-20180719160420626.chn ', N'Cafef.vn', N'<span>Đầu tư chứng khoán là mảng đem lại mức lợi nhuận tăng mạnh nhất cho Kienlongbank trong 6 tháng qua. So với cùng kỳ năm trước, lợi nhuận của ngân hàng tăng đáng kể nhưng so với kế hoạch cả năm thì 6 tháng mới hoàn thành được 30%.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/19/photo1531990955472-15319909554722099857672.jpg', CAST(N'2018-07-19 16:03:00.000' AS DateTime), CAST(N'2018-07-20 08:40:31.547' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (125, N' Lợi nhuận của VietBank tăng đột biến, đạt hơn 200 tỷ đồng trong 6 tháng đầu năm ', N'Loi-nhuan-cua-VietBank-tang-dot-bien-dat-hon-200-ty-dong-trong-6-thang-dau-nam', N' http://cafef.vn/loi-nhuan-cua-vietbank-tang-dot-bien-dat-hon-200-ty-dong-trong-6-thang-dau-nam-20180719154122391.chn ', N'Cafef.vn', N'<span>Riêng quý 2 lợi nhuận của ngân hàng này tăng gấp 6 lần so với cùng kỳ năm 2017.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/19/photo1531989453324-1531989453324467880958.jpg', CAST(N'2018-07-19 15:47:54.000' AS DateTime), CAST(N'2018-07-20 08:40:31.610' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (126, N' 78% ICO “lừa đảo” - tiền ảo đang “lừa đảo” tiền thật ', N'78-ICO-lua-dao-tien-ao-dang-lua-dao-tien-that', N' http://cafef.vn/78-ico-lua-dao-tien-ao-dang-lua-dao-tien-that-20180719142841188.chn ', N'Cafef.vn', N'<span>Ngoài ra, nghiên cứu của Cty tư vấn Satis Group cũng cho thấy 4% dự án ICO đã thất bại, 3% đã "chết" và chỉ có 15% được đưa lên sàn giao dịch tiền ảo.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/19/photo1531985317237-1531985317238677805922.jpg', CAST(N'2018-07-19 14:50:00.000' AS DateTime), CAST(N'2018-07-20 08:40:31.707' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (127, N' TP HCM: Trụ ATM Techcombank bị trộm đục ', N'TP-HCM-Tru-ATM-Techcombank-bi-trom-duc', N' http://cafef.vn/tp-hcm-tru-atm-techcombank-bi-trom-duc-20180719133006282.chn ', N'Cafef.vn', N'<span>Kẻ trộm đã dùng xà beng đục trụ ATM Ngân hàng Techcombank nhằm trộm tiền nhưng bất thành.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/19/photo1531981800064-15319818000641330859271.jpg', CAST(N'2018-07-19 13:45:19.000' AS DateTime), CAST(N'2018-07-20 08:40:31.747' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (128, N' Lợi nhuận hợp nhất của VPBank từ đầu năm đến hết quý II/2018 tăng 34% ', N'Loi-nhuan-hop-nhat-cua-VPBank-tu-dau-nam-den-het-quy-II2018-tang-34', N' http://cafef.vn/loi-nhuan-hop-nhat-cua-vpbank-tu-dau-nam-den-het-quy-ii-2018-tang-34-20180721112424085.chn ', N'Cafef.vn', N'<span>Ngân hàng TMCP Việt Nam Thịnh Vượng (VPBank) công bố báo cáo tài chính quý II/2018, với tổng doanh thu tăng 28% và lợi nhuận tăng 34% so với cùng kỳ, tiếp tục duy trì đà tăng trưởng của một trong những ngân hàng hiệu quả nhất.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/21/httpchannelvcmediavnprupload270201807img201807211100010401-15321470655701906464893.jpg', CAST(N'2018-07-21 13:30:00.000' AS DateTime), CAST(N'2018-07-21 15:36:22.703' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (129, N' Bộ Tài chính đề xuất đặc thù về tài chính với tổ chức tín dụng yếu kém ', N'Bo-Tai-chinh-de-xuat-dac-thu-ve-tai-chinh-voi-to-chuc-tin-dung-yeu-kem', N' http://cafef.vn/bo-tai-chinh-de-xuat-dac-thu-ve-tai-chinh-voi-to-chuc-tin-dung-yeu-kem-20180721100103601.chn ', N'Cafef.vn', N'<span>Bộ Tài chính đang dự thảo Nghị định về một số nội dung đặc thù về chế độ tài chính đối với tổ chức tín dụng yếu kém trong quá trình cơ cấu lại và xử lý nợ xấu.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/21/photo1532143379587-15321433795871820905105.jpg', CAST(N'2018-07-21 10:22:57.000' AS DateTime), CAST(N'2018-07-21 15:36:23.847' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (130, N' TPBank lãi gấp đôi cùng kỳ, thu nhập nhân viên tăng lên gần 23 triệu/tháng ', N'TPBank-lai-gap-doi-cung-ky-thu-nhap-nhan-vien-tang-len-gan-23-trieuthang', N' http://cafef.vn/tpbank-lai-gap-doi-cung-ky-thu-nhap-nhan-vien-tang-len-gan-23-trieu-thang-20180721094408054.chn ', N'Cafef.vn', N'<span>Lợi nhuận trước thuế 6 tháng đầu năm 2018 của TPBank đạt 1.024 tỷ đồng, gấp đôi con số đạt được cùng kỳ và hoàn thành 46,5% kế hoạch năm.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/21/photo1532140073521-15321400735221375715047.JPG', CAST(N'2018-07-21 09:55:45.000' AS DateTime), CAST(N'2018-07-21 15:36:23.890' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (131, N' Lãi từ phi tín dụng tăng mạnh, MB đạt LNTT 3.549 tỷ đồng trong 6 tháng đầu năm ', N'Lai-tu-phi-tin-dung-tang-manh-MB-dat-LNTT-3549-ty-dong-trong-6-thang-dau-nam', N' http://cafef.vn/lai-tu-phi-tin-dung-tang-manh-mb-dat-lntt-3549-ty-dong-trong-6-thang-dau-nam-20180720234145741.chn ', N'Cafef.vn', N'<span>6 tháng đầu năm, các hoạt động phi tín dụng của MB đều có kết quả khả quan, đóng góp 25% tổng thu nhập của ngân hàng trong khi cùng kỳ năm ngoái chỉ đạt 19%.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/20/photo1532104721359-15321047213601418502199.jpg', CAST(N'2018-07-21 08:21:12.000' AS DateTime), CAST(N'2018-07-21 15:36:24.240' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (132, N' MB tham dự sự kiện "Diễn đàn cấp cao và triển lãm Quốc tế về công nghiệp 4.0" ', N'MB-tham-du-su-kien-Dien-dan-cap-cao-va-trien-lam-Quoc-te-ve-cong-nghiep-40', N' http://cafef.vn/mb-tham-du-su-kien-dien-dan-cap-cao-va-trien-lam-quoc-te-ve-cong-nghiep-40-20180721081809194.chn ', N'Cafef.vn', N'<span>Trong sự kiện “Diễn đàn cấp cao và Triển lãm quốc tế về công nghiệp 4.0” do Thủ tướng Nguyễn Xuân Phúc chủ trì vừa qua, bên cạnh sự xuất hiện ấn tượng của Sophia – robot đầu tiên được cấp quyền công dân trên thế giới, các sản phẩm công nghệ cao như: năng lượng tái tạo, công nghệ robot, công nghệ Blockchain…</span>', N'', 0, 189, 0, N'http://channel.vcmedia.vn/prupload/270/2018/07/img_201807201422519504.jpg', CAST(N'2018-07-21 08:00:00.000' AS DateTime), CAST(N'2018-07-21 15:36:24.280' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (133, N' Xét xử kín vụ án làm lộ bí mật Nhà nước liên quan Vũ "nhôm" ', N'Xet-xu-kin-vu-an-lam-lo-bi-mat-Nha-nuoc-lien-quan-Vu-nhom', N' http://cafef.vn/xet-xu-kin-vu-an-lam-lo-bi-mat-nha-nuoc-lien-quan-vu-nhom-20180720202110007.chn ', N'Cafef.vn', N'<span>Theo dự kiến, TAND Hà Nội sẽ xét xử vụ án cố ý làm lộ bí mật Nhà nước liên quan Vũ "nhôm" và 2 đồng phạm vào ngày 30-7 tới.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/20/photo1532092854834-15320928548341009320936.jpg', CAST(N'2018-07-20 21:44:13.000' AS DateTime), CAST(N'2018-07-21 15:36:24.357' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (134, N' BacABank lãi ròng gần 350 tỷ đồng 6 tháng đầu năm ', N'BacABank-lai-rong-gan-350-ty-dong-6-thang-dau-nam', N' http://cafef.vn/bacabank-lai-rong-gan-350-ty-dong-6-thang-dau-nam-20180720094202486.chn ', N'Cafef.vn', N'<span>Cuối tháng 6, tổng tài sản của BacABank giảm 2,2% so với đầu năm xuống còn 89.772 tỷ đồng, chủ yếu do ngân hàng giảm đi vay trên thị trường liên ngân hàng.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/20/photo1532054295183-1532054295183106137697.jpg', CAST(N'2018-07-20 19:50:00.000' AS DateTime), CAST(N'2018-07-21 15:36:24.417' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (135, N' Kiến nghị phá giá VND là "quá vội vàng và thiếu cơ sở" ', N'Kien-nghi-pha-gia-VND-la-qua-voi-vang-va-thieu-co-so', N' http://cafef.vn/kien-nghi-pha-gia-vnd-la-qua-voi-vang-va-thieu-co-so-20180720172101756.chn ', N'Cafef.vn', N'<span>Tỷ giá ở Việt Nam là vấn đề rất nhạy cảm, kiến nghị phá giá VND là quá vội vàng, thiếu cơ sở...</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/20/photo1532081989407-1532081989407660332140.jpg', CAST(N'2018-07-20 18:01:05.000' AS DateTime), CAST(N'2018-07-21 15:36:24.457' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (136, N' Gần ngày sáp nhập với HDBank, PG Bank đang hoạt động ra sao? ', N'Gan-ngay-sap-nhap-voi-HDBank-PG-Bank-dang-hoat-dong-ra-sao', N' http://cafef.vn/gan-ngay-sap-nhap-voi-hdbank-pg-bank-dang-hoat-dong-ra-sao-20180720173041908.chn ', N'Cafef.vn', N'<span>Lợi nhuận có phần chững lại trong quý 2 nhưng trong 6 tháng đầu năm PG Bank vẫn lãi 99 tỷ đồng trước thuế, tăng 71% so với cùng kỳ.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/20/photo1532082286957-15320822869571447542843.jpg', CAST(N'2018-07-20 17:52:24.000' AS DateTime), CAST(N'2018-07-21 15:36:24.493' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (137, N' Vietbank dành hàng trăm quà tặng khách hàng nhân dịp khai trương trụ sở mới PGD Láng Hạ ', N'Vietbank-danh-hang-tram-qua-tang-khach-hang-nhan-dip-khai-truong-tru-so-moi-PGD-Lang-Ha', N' http://cafef.vn/vietbank-danh-hang-tram-qua-tang-khach-hang-nhan-dip-khai-truong-tru-so-moi-pgd-lang-ha-20180720152346002.chn ', N'Cafef.vn', N'<span>Trụ sở mới PGD Láng Hạ được Ngân hàng Việt Nam Thương Tín (Vietbank) đưa vào khai trương hoạt động chính thức từ ngày 18/07/2018 tại số 35 Yên Lãng, Phường Trung Liệt, Quận Đống Đa, Tp. Hà Nội. Dịp này Vietbank – Phòng Giao dịch Láng Hạ dành hàng trăm phần quà tặng quý khách hàng.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/20/httpchannelvcmediavnprupload270201807img201807201039267477-1532075026236407194348.jpg', CAST(N'2018-07-20 17:30:00.000' AS DateTime), CAST(N'2018-07-21 15:36:24.530' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (138, N' Xử lý nghiêm người đứng đầu ngân hàng vi phạm về lãi suất cho vay ', N'Xu-ly-nghiem-nguoi-dung-dau-ngan-hang-vi-pham-ve-lai-suat-cho-vay', N' http://cafef.vn/xu-ly-nghiem-nguoi-dung-dau-ngan-hang-vi-pham-ve-lai-suat-cho-vay-20180720161614689.chn ', N'Cafef.vn', N'<span>Ngân hàng Nhà nước yêu cầu tăng cường kiểm tra, kiểm toán nội bộ, kịp thời phát hiện những sai phạm về mức lãi suất cho vay; chấn chỉnh và xử lý nghiêm người đứng đầu, cá nhân có liên quan tại các chi nhánh, đơn vị của TCTD để xảy ra vi phạm.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/20/photo1532078121186-15320781211871831931046.jpg', CAST(N'2018-07-20 17:03:33.000' AS DateTime), CAST(N'2018-07-21 15:36:24.587' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (139, N' VIB báo lãi đột biến gấp 3 lần cùng kỳ, tỷ lệ nợ xấu giảm xuống 2,33% ', N'VIB-bao-lai-dot-bien-gap-3-lan-cung-ky-ty-le-no-xau-giam-xuong-233', N' http://cafef.vn/vib-bao-lai-dot-bien-gap-3-lan-cung-ky-ty-le-no-xau-giam-xuong-233-20180720154224986.chn ', N'Cafef.vn', N'<span>Cuối tháng 6, nợ xấu tuyệt đối tại VIB là 2.035 tỷ đồng, chiếm 2,33% tổng dư nợ. Ngân hàng cũng đang còn 1.464 tỷ đồng trái phiếu VAMC trong đó đã trích lập dự phòng 746 tỷ đồng.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/20/photo1532075893189-1532075893189914265567.jpg', CAST(N'2018-07-20 15:44:08.000' AS DateTime), CAST(N'2018-07-21 15:36:24.623' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (140, N' Giải pháp từ Ngân hàng cho ngành nhựa Việt Nam cất cánh ', N'Giai-phap-tu-Ngan-hang-cho-nganh-nhua-Viet-Nam-cat-canh', N' http://cafef.vn/giai-phap-tu-ngan-hang-cho-nganh-nhua-viet-nam-cat-canh-20180720133650299.chn ', N'Cafef.vn', N'<span>Với đà phát triển nhanh và mạnh, ngành nhựa Việt Nam đang có cơ hội “cất cánh” nếu tận dụng được những thay đổi thuận lợi trong môi trường kinh doanh. Các DN nhựa cần nâng cao sức cạnh tranh cho chính mình, trong đó các giải pháp tài chính phù hợp từ ngân hàng sẽ đóng vai trò quan trọng.</span>', N'', 0, 189, 0, N'http://channel.vcmedia.vn/prupload/270/2018/07/img_201807191832469553.jpg', CAST(N'2018-07-20 15:30:00.000' AS DateTime), CAST(N'2018-07-21 15:36:24.677' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (141, N' Còn lời cảnh tỉnh nào mạnh mẽ hơn con số 78% dự án tiền ảo lừa đảo? ', N'Con-loi-canh-tinh-nao-manh-me-hon-con-so-78-du-an-tien-ao-lua-dao', N' http://cafef.vn/con-loi-canh-tinh-nao-manh-me-hon-con-so-78-du-an-tien-ao-lua-dao-20180720134423955.chn ', N'Cafef.vn', N'<span>Đây là con số được Cty tư vấn Satis Group (Mỹ) vừa công bố. Ngoài con số 78% dự án tiền ảo ở giai đoạn gọi vốn đầu tư (ICO, tương tự như IPO bên thị trường chứng khoán) đã được xác định lừa đảo, còn có 4% được xác định thất bại, 3% chết yểu, chỉ có 15% thực hiện đúng hứa hẹn lên sàn trong năm 2017.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/20/photo1532069060944-153206906094474478883.jpg', CAST(N'2018-07-20 15:21:45.000' AS DateTime), CAST(N'2018-07-21 15:36:24.753' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (142, N' Sacombank thu hồi được hơn 3.600 tỷ đồng nợ xấu, báo lãi gần 1.000 tỷ đồng trong 6 tháng đầu năm ', N'Sacombank-thu-hoi-duoc-hon-3600-ty-dong-no-xau-bao-lai-gan-1000-ty-dong-trong-6-thang-dau-nam', N' http://cafef.vn/sacombank-thu-hoi-duoc-hon-3600-ty-dong-no-xau-bao-lai-gan-1000-ty-dong-trong-6-thang-dau-nam-20180720145552049.chn ', N'Cafef.vn', N'<span>Với mức lợi nhuận trước thuế đạt gần 1.000 tỷ đồng trong 6 tháng đầu năm, Sacombank hoàn thành được 54% kế hoạch đặt ra cho năm nay.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/20/photo1532073092013-15320730920131970241660.jpg', CAST(N'2018-07-20 15:04:21.000' AS DateTime), CAST(N'2018-07-21 15:36:24.793' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (143, N' Đề nghị tịch thu số tiền ngân hàng hưởng lợi từ đường dây đánh bạc nghìn tỷ ', N'De-nghi-tich-thu-so-tien-ngan-hang-huong-loi-tu-duong-day-danh-bac-nghin-ty', N' http://cafef.vn/de-nghi-tich-thu-so-tien-vietcombank-huong-loi-tu-duong-day-danh-bac-nghin-ty-2018072011083933.chn ', N'Cafef.vn', N'<span>Ngoài việc đề nghị tịch thu toàn bộ số tiền Vietcombank hưởng lợi, Cơ quan An ninh điều tra tiếp tục điều tra, xác minh, làm rõ và xử lý ở giai đoạn 2 đối với 3 nhân viên của Vietcombank.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/20/photo1532059641014-15320596410141443564326.jpg', CAST(N'2018-07-20 13:38:00.000' AS DateTime), CAST(N'2018-07-21 15:36:24.833' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (144, N' Tỷ giá USD diễn biến phức tạp ', N'Ty-gia-USD-dien-bien-phuc-tap', N' http://cafef.vn/ty-gia-usd-dien-bien-phuc-tap-20180720111641049.chn ', N'Cafef.vn', N'<span>NHNN cho rằng, Cục Dự trữ Liên bang Mỹ (FED) tăng lãi suất là nguyên nhân đồng USD có diễn biến phức tạp và tác động lên tỷ giá và thị trường vàng.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/20/photo1532060196725-1532060196726138481218.jpg', CAST(N'2018-07-20 13:12:00.000' AS DateTime), CAST(N'2018-07-21 15:36:24.867' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (145, N' Fe Credit chỉ còn đóng góp 36% vào tổng lợi nhuận của VPBank ', N'Fe-Credit-chi-con-dong-gop-36-vao-tong-loi-nhuan-cua-VPBank', N' http://cafef.vn/fe-credit-chi-con-dong-gop-36-vao-tong-loi-nhuan-cua-vpbank-dieu-gi-dang-xay-ra-2018072012043183.chn ', N'Cafef.vn', N'<span>Trước đây Fe Credit vẫn luôn được ví như "con gà đẻ trứng vàng" cho VPBank khi luôn chiếm trên 50% tổng lợi nhuận của ngân hàng hợp nhất.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/20/photo1532059737065-15320597370661658026889.jpg', CAST(N'2018-07-20 12:03:00.000' AS DateTime), CAST(N'2018-07-21 15:36:24.903' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (146, N' VPBank lãi trước thuế 4.375 tỷ đồng trong 6 tháng đầu năm, hoàn thành 40% kế hoạch năm ', N'VPBank-lai-truoc-thue-4375-ty-dong-trong-6-thang-dau-nam-hoan-thanh-40-ke-hoach-nam', N' http://cafef.vn/vpbank-lai-truoc-thue-4375-ty-dong-trong-6-thang-dau-nam-moi-hoan-thanh-40-ke-hoach-nam-20180720104606971.chn ', N'Cafef.vn', N'<span>Tín dụng tăng trưởng 6,8% còn huy động vốn tăng 8% so với khách hàng. So với cùng kỳ năm trước, lợi nhuận của VPBank 6 tháng tăng 34%.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/20/photo1532056970143-1532056970145162897886.jpg', CAST(N'2018-07-20 10:45:00.000' AS DateTime), CAST(N'2018-07-21 15:36:24.990' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (147, N' Rủi ro từ các trang cho vay ngang hàng ', N'Rui-ro-tu-cac-trang-cho-vay-ngang-hang', N' http://cafef.vn/rui-ro-tu-cac-trang-cho-vay-ngang-hang-20180720091346189.chn ', N'Cafef.vn', N'<span>Nhiều cảnh báo đối với hình thức cho vay ngang hàng - Peer to Peer (P2P) tại Việt Nam khi bỗng nhiên ngành công nghiệp P2P lớn nhất thế giới là Trung Quốc có hàng ngàn người ồ ạt rút tiền từ các trang cho vay ngang hàng.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/20/photo1532052761316-1532052761316974808195.jpg', CAST(N'2018-07-20 09:35:36.000' AS DateTime), CAST(N'2018-07-21 15:36:25.027' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (148, N' Phá giá tiền Đồng, nguồn vốn FDI sẽ bị ảnh hưởng như thế nào? ', N'Pha-gia-tien-Dong-nguon-von-FDI-se-bi-anh-huong-nhu-the-nao', N' http://cafef.vn/pha-gia-tien-dong-nguon-von-fdi-se-bi-anh-huong-nhu-the-nao-20180722004633194.chn ', N'Cafef.vn', N'<span>Phá giá mạnh tiền Đồng sẽ tác động tiêu cực tới tăng trưởng kinh tế thông qua kênh thực hiện giải ngân vốn đầu tư trực tiếp nước ngoài (FDI).</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/22/photo1532195076552-15321950765521617231786.jpg', CAST(N'2018-07-22 13:42:36.000' AS DateTime), CAST(N'2018-07-22 15:44:30.927' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (149, N' Cẩn thận với email lạ giả danh VPBank ', N'Can-than-voi-email-la-gia-danh-VPBank', N' http://cafef.vn/can-than-voi-email-la-gui-tu-vpbank-lien-quan-the-tin-dung-20180722113533772.chn ', N'Cafef.vn', N'<span>Ngân hàng VPBank trong sáng nay đã có thông báo gửi tới người dùng khẳng định chỉ có một địa chỉ web duy nhất, và cảnh báo khách hàng cẩn thận với email lạ giả danh ngân hàng này.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/22/photo1532233442138-15322334421391742090731.jpg', CAST(N'2018-07-22 11:36:40.000' AS DateTime), CAST(N'2018-07-22 15:44:31.093' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (150, N' KienlongBank lên tiếng về việc mua đất công xây dựng trụ sở chi nhánh Cần Thơ ', N'KienlongBank-len-tieng-ve-viec-mua-dat-cong-xay-dung-tru-so-chi-nhanh-Can-Tho', N' http://cafef.vn/kienlongbank-len-tieng-ve-viec-mua-dat-cong-xay-dung-tru-so-chi-nhanh-can-tho-20180722021240788.chn ', N'Cafef.vn', N'<span>Ngân hàng khẳng định thông báo đấu giá được công khai vào thời điểm đó và có rất nhiều đơn vị đăng ký tham gia đấu giá.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/22/photo1532200288612-15322002886131810134039.jpg', CAST(N'2018-07-22 08:13:58.000' AS DateTime), CAST(N'2018-07-22 15:44:31.163' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (151, N' Tổng tài sản của Vietcombank tuột mốc 1 triệu tỷ, lợi nhuận hợp nhất vượt 8.000 tỷ trong 6 tháng đầu năm ', N'Tong-tai-san-cua-Vietcombank-tuot-moc-1-trieu-ty-loi-nhuan-hop-nhat-vuot-8000-ty-trong-6-thang-dau-nam', N' http://cafef.vn/tong-tai-san-cua-vietcombank-tuot-moc-1-trieu-ty-loi-nhuan-hop-nhat-vuot-8000-ty-trong-6-thang-dau-nam-20180722020121569.chn ', N'Cafef.vn', N'<span>Vietcombank tiếp tục dẫn đầu hệ thống ngân hàng về lợi nhuận, đạt mức kỷ lục 8.071 tỷ đồng LNTT trong 6 tháng đầu năm. Trong đó, lãi từ hoạt động kinh doanh khác và thu nhập góp vốn mua cổ phần tăng đột biến.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/22/photo1532199344813-15321993448131838488489.jpg', CAST(N'2018-07-22 07:50:03.000' AS DateTime), CAST(N'2018-07-22 15:44:31.207' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (152, N' Nhiều người Việt Nam chưa sử dụng các dịch vụ tài chính ', N'Nhieu-nguoi-Viet-Nam-chua-su-dung-cac-dich-vu-tai-chinh', N' http://cafef.vn/nhieu-nguoi-viet-nam-chua-su-dung-cac-dich-vu-tai-chinh-20180721204628147.chn ', N'Cafef.vn', N'<span>Tại Việt Nam, người nghèo đang là những đối tượng chưa tiếp cận được với nhiều dịch vụ ngân hàng di động.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/21/photo1532180720357-15321807203571487946716.jpg', CAST(N'2018-07-21 22:55:53.000' AS DateTime), CAST(N'2018-07-22 15:44:31.260' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (153, N' Lợi nhuận tăng gần gấp rưỡi trong 6 tháng, thu nhập của nhân viên Bac A Bank tăng thêm 20% ', N'Loi-nhuan-tang-gan-gap-ruoi-trong-6-thang-thu-nhap-cua-nhan-vien-Bac-A-Bank-tang-them-20', N' http://cafef.vn/nhan-vien-ngan-hang-bac-a-bank-thu-nhap-binh-quan-hon-25-trieu-dong-thang-20180721080252491.chn ', N'Cafef.vn', N'<span>Tổng số cán bộ, công nhân viên của ngân hàng Bắc Á tính đến 30/6 (bao gồm cả hai công ty con) là 1.708 người. Bình quân cả lương, phụ cấp và chi khác cho nhân sự của nhà băng này trong 6 tháng qua là hơn 25 triệu đồng/người/tháng.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/7/21/photo1532134850462-1532134850462754407193.jpg', CAST(N'2018-07-21 15:43:00.000' AS DateTime), CAST(N'2018-07-22 15:44:31.310' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (154, N' Đẩy mạnh thanh toán dịch vụ công qua ngân hàng: Cần thay đổi thói quen dùng tiền mặt của người dân ', N'Day-manh-thanh-toan-dich-vu-cong-qua-ngan-hang-Can-thay-doi-thoi-quen-dung-tien-mat-cua-nguoi-dan', N' http://cafef.vn/day-manh-thanh-toan-dich-vu-cong-qua-ngan-hang-can-thay-doi-thoi-quen-dung-tien-mat-cua-nguoi-dan-20180824072733367.chn ', N'Cafef.vn', N'<span>Thanh toán các dịch vụ công như nộp thuế, điện, nước, học phí, viện phí... qua ngân hàng sẽ giúp hạn chế một khối lượng lớn tiền mặt trong lưu thông, từ đó giảm bớt những phí tổn to lớn của xã hội có liên quan đến việc phát hành và lưu thông tiền.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/24/photo1535070454618-15350704546192032453545.jpg', CAST(N'2018-08-24 19:29:45.000' AS DateTime), CAST(N'2018-08-24 21:23:59.293' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (155, N' Những chuyện buồn sau cơn bão bitcoin: Rút hết tiết kiệm, vay nợ để đầu tư với mong muốn đổi đời để rồi thất nghiệp, trắng tay, lãng phí nhiều tháng cuộc đời cho một thứ được gọi là ''ảo'' ', N'Nhung-chuyen-buon-sau-con-bao-bitcoin-Rut-het-tiet-kiem-vay-no-de-dau-tu-voi-mong-muon-doi-doi-de-roi-that-nghiep-trang-tay-lang-phi-nhieu-thang-cuoc-doi-cho-mot-thu-duoc-goi-la-ao', N' http://cafef.vn/nhung-chuyen-buon-sau-con-bao-bitcoin-rut-het-tiet-kiem-vay-no-de-dau-tu-voi-mong-muon-doi-doi-de-roi-that-nghiep-trang-tay-lang-phi-nhieu-thang-cuoc-doi-cho-mot-thu-duoc-goi-la-ao-20180824142053497.chn ', N'Cafef.vn', N'<span>Sau 8 tháng, 23.000 USD chi ra đầu tư cho rất nhiều loại tiền số khác nhau gồm cả bitcoin của Pete chỉ còn 4.000 USD. Hơn ai hết, Pete thấm thía tất cả những gì đã xảy ra.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/24/photo1535095250184-1535095250184730876678.jpg', CAST(N'2018-08-24 15:53:18.000' AS DateTime), CAST(N'2018-08-24 21:23:59.633' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (156, N' "Ông lớn" BIDV cũng tăng lãi suất huy động, trong khi MB và VPBank lại điều chỉnh giảm mạnh tay ', N'Ong-lon-BIDV-cung-tang-lai-suat-huy-dong-trong-khi-MB-va-VPBank-lai-dieu-chinh-giam-manh-tay', N' http://cafef.vn/ong-lon-bidv-cung-tang-lai-suat-huy-dong-trong-khi-mb-va-vpbank-lai-dieu-chinh-giam-manh-tay-20180824151949153.chn ', N'Cafef.vn', N'<span>Số các ngân hàng tăng lãi suất vẫn chiếm áp đảo trong hệ thống với Viet Capital Bank đang là quán quân với mức 8,6%/năm cho kỳ hạn 24 tháng trở lên. Ngân hàng lớn nhất Việt Nam là BIDV cũng không chịu đứng ngoài xu hướng. Trên liên ngân hàng, các ngân hàng đang phải vay mượn lẫn nhau đắt hơn cả huy động từ dân cư.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/24/photo1535098142718-153509814271820880143.jpg', CAST(N'2018-08-24 15:19:00.000' AS DateTime), CAST(N'2018-08-24 21:23:59.703' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (157, N' Chỉ 13% số người hưởng lương hưu, trợ cấp BHXH nhận tiền qua thẻ ATM ', N'Chi-13-so-nguoi-huong-luong-huu-tro-cap-BHXH-nhan-tien-qua-the-ATM', N' http://cafef.vn/chi-13-so-nguoi-huong-luong-huu-tro-cap-bhxh-nhan-tien-qua-the-atm-20180824144121872.chn ', N'Cafef.vn', N'<span>Lãnh đạo Bảo hiểm xã hội Việt Nam cho biết, đến hết tháng 7/2018, cơ quan Bưu điện đã thực hiện chi trả qua tài khoản cá nhân cho khoảng 468 nghìn người, chiếm khoảng 13% số người hưởng lương hưu, trợ cấp BHXH hàng tháng.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/24/photo1535096292512-15350962925121621466705.jpg', CAST(N'2018-08-24 14:48:05.000' AS DateTime), CAST(N'2018-08-24 21:23:59.777' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (158, N' Tỷ giá ngân hàng bật tăng mạnh ', N'Ty-gia-ngan-hang-bat-tang-manh', N' http://cafef.vn/ty-gia-ngan-hang-bat-tang-manh-20180824133949185.chn ', N'Cafef.vn', N'<span>Giá USD của các ngân hàng tăng phổ biến là 20 đồng, có nơi tăng 30 đồng/USD so với ngày hôm qua.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/24/photo1535092669358-15350926693592066105045.jpg', CAST(N'2018-08-24 13:39:29.000' AS DateTime), CAST(N'2018-08-24 21:24:00.040' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (159, N' Đã có ngân hàng đầu tiên cán đích sớm và vượt kế hoạch lợi nhuận cả năm ', N'Da-co-ngan-hang-dau-tien-can-dich-som-va-vuot-ke-hoach-loi-nhuan-ca-nam', N' http://cafef.vn/da-co-ngan-hang-dau-tien-can-dich-som-va-vuot-ke-hoach-loi-nhuan-ca-nam-20180824110854039.chn ', N'Cafef.vn', N'<span>Nam A Bank có lợi nhuận trước thuế đạt 335 tỷ đồng, gấp 3 lần con số đạt được cùng kỳ 2017. Với mức lãi này, Nam A Bank là ngân hàng đầu tiên cán đích sớm, vượt kế hoạch cả năm (320 tỷ đồng).</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/24/photo1535083629807-1535083629808957980764.jpg', CAST(N'2018-08-24 11:21:51.000' AS DateTime), CAST(N'2018-08-24 21:24:00.117' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (160, N' TPBank miễn hơn 60 loại phí dịch vụ cho khách hàng ', N'TPBank-mien-hon-60-loai-phi-dich-vu-cho-khach-hang', N' http://cafef.vn/tpbank-mien-hon-60-loai-phi-dich-vu-cho-khach-hang-2018082411044818.chn ', N'Cafef.vn', N'<span>TPBank vừa thông báo về việc miễn thêm nhiều loại phí, nâng tổng số dịch vụ được miễn phí tại nhà băng này lên hơn 60 loại, bao gồm cả dịch vụ cho khách hàng cá nhân và doanh nghiệp.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/24/photo1535083801940-1535083801940243226497.jpg', CAST(N'2018-08-24 11:04:00.000' AS DateTime), CAST(N'2018-08-24 21:24:00.387' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (161, N' Các ngân hàng sẽ cung cấp dịch vụ với giá rẻ ', N'Cac-ngan-hang-se-cung-cap-dich-vu-voi-gia-re', N' http://cafef.vn/lanh-dao-nhnn-cong-nghe-hien-nay-cua-ngan-hang-viet-khong-thua-kem-khu-vuc-20180824095651617.chn ', N'Cafef.vn', N'<span>Theo kế hoạch, những người thu nhập thấp và khách hàng ở khu vực vùng sâu, vùng xa cũng có thể tiếp cận sử dụng dịch vụ tài chính ngân hàng nói chung và dịch vụ thanh toán nói riêng.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/24/photo1535078968259-1535078968260372173171.jpg', CAST(N'2018-08-24 10:15:00.000' AS DateTime), CAST(N'2018-08-24 21:24:00.510' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (162, N' OCB được Moody’S tăng mức xếp hạng tín nhiệm đối tác lên B1 ', N'OCB-duoc-MoodyS-tang-muc-xep-hang-tin-nhiem-doi-tac-len-B1', N' http://cafef.vn/ocb-duoc-moodys-tang-muc-xep-hang-tin-nhiem-doi-tac-len-b1-20180823221116173.chn ', N'Cafef.vn', N'<span>Trong tháng 8, tổ chức xếp hạng tín nhiệm Quốc tế Moody’s đã nâng bậc đối với xếp hạng Rủi ro đối tác dài hạn (Long-term Counter party risk rating) và đánh giá rủi ro đối tác của Ngân hàng TMCP Phương Đông (OCB) từ B2 lên B1.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/23/httpchannelvcmediavnprupload270201808img201808231612301681-15350370817471689811558.jpg', CAST(N'2018-08-24 10:00:00.000' AS DateTime), CAST(N'2018-08-24 21:24:00.693' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (163, N' Giá vàng "phi SJC" giảm mạnh ', N'Gia-vang-phi-SJC-giam-manh', N' http://cafef.vn/gia-vang-phi-sjc-giam-manh-20180824091644477.chn ', N'Cafef.vn', N'<span>Giá vàng trong nước hôm nay ngày 24/8 sụt giảm khá mạnh do tác động của giá vàng thế giới.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/24/photo1535076937987-15350769379871566011581.jpg', CAST(N'2018-08-24 09:43:13.000' AS DateTime), CAST(N'2018-08-24 21:24:00.793' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (164, N' 8 ngân hàng lọt top 40 thương hiệu công ty Việt Nam có giá trị nhất ', N'8-ngan-hang-lot-top-40-thuong-hieu-cong-ty-Viet-Nam-co-gia-tri-nhat', N' http://cafef.vn/8-ngan-hang-lot-top-40-thuong-hieu-cong-ty-viet-nam-co-gia-tri-nhat-2018082409175032.chn ', N'Cafef.vn', N'<span>Vietcombank, VietinBank và BIDV là 3 ngân hàng dẫn đầu danh sách nhóm tài chính, trong khi đó VPBank đứng đầu nhóm cổ phần tư nhân còn HDBank là ngân hàng lần đầu tiên lọt vào danh sách xếp hạng.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/24/photo1535076720406-15350767204071961953350.jpg', CAST(N'2018-08-24 09:17:00.000' AS DateTime), CAST(N'2018-08-24 21:24:00.903' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (165, N' Thẻ VinID MB VISA: Sự kết hợp xứng tầm giữa hai thương hiệu lớn ', N'The-VinID-MB-VISA-Su-ket-hop-xung-tam-giua-hai-thuong-hieu-lon', N' http://cafef.vn/the-vinid-mb-visa-su-ket-hop-xung-tam-giua-hai-thuong-hieu-lon-20180823133306579.chn ', N'Cafef.vn', N'<span>Từ nay đến 31/10/2018, Ngân hàng TMCP Quân đội (MB), kết hợp cùng Công ty Cổ phần VinID mang đến cho khách hàng hàng loạt ưu đãi hấp dẫn.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/23/httpchannelvcmediavnprupload270201808img201808230957469191-15350059853581616323734.jpg', CAST(N'2018-08-24 08:00:00.000' AS DateTime), CAST(N'2018-08-24 21:24:01.010' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (166, N' Lãi suất tiền gửi tiết kiệm đột ngột tăng ', N'Lai-suat-tien-gui-tiet-kiem-dot-ngot-tang', N' http://cafef.vn/lai-suat-tien-gui-tiet-kiem-dot-ngot-tang-20180824072041742.chn ', N'Cafef.vn', N'<span>Chiến tranh thương mại Trung-Mỹ sẽ tiếp tục tác động lên thị trường tài chính, từ đó ảnh hưởng lên tỉ giá tiền đồng.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/24/photo1535070039883-1535070039884862212246.jpg', CAST(N'2018-08-24 07:26:29.000' AS DateTime), CAST(N'2018-08-24 21:24:01.093' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (167, N' Kinh doanh và dịch vụ bảo hiểm: Con gà đẻ trứng vàng của các ngân hàng ', N'Kinh-doanh-va-dich-vu-bao-hiem-Con-ga-de-trung-vang-cua-cac-ngan-hang', N' http://cafef.vn/kinh-doanh-va-dich-vu-bao-hiem-con-ga-de-trung-vang-cua-cac-ngan-hang-20180823221609595.chn ', N'Cafef.vn', N'<span>6 tháng đầu năm 2018, thu từ kinh doanh và cung cấp dịch vụ bảo hiểm của các ngân hàng tăng trưởng mạnh mẽ, qua đó đóng góp phần không nhỏ vào doanh thu và lợi nhuận của các tổ chức này.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/23/photo1535037270367-1535037270369875202251.jpg', CAST(N'2018-08-23 22:15:46.000' AS DateTime), CAST(N'2018-08-24 21:24:01.197' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (168, N' Eximbank được Standard & Poor’s nâng triển vọng tín nhiệm ', N'Eximbank-duoc-Standard-Poors-nang-trien-vong-tin-nhiem', N' http://cafef.vn/eximbank-duoc-standard-poors-nang-trien-vong-tin-nhiem-20180823171925579.chn ', N'Cafef.vn', N'<span>Ngày 16/08/2018 vừa qua, Ngân hàng TMCP Xuất Nhập Khẩu Việt Nam (Eximbank) đã được Standard & Poor’s Global Ratings - Tổ chức tín nhiệm hàng đầu thế giới, nâng triển vọng tín nhiệm lên “ổn định”.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/23/httpchannelvcmediavnprupload270201808img201808231455179491-1535019564112589963009.jpg', CAST(N'2018-08-23 19:30:00.000' AS DateTime), CAST(N'2018-08-24 21:24:01.287' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (169, N' Lãi suất thị trường 2 tăng mạnh, các ngân hàng giảm vay mượn lẫn nhau ', N'Lai-suat-thi-truong-2-tang-manh-cac-ngan-hang-giam-vay-muon-lan-nhau', N' http://cafef.vn/lai-suat-thi-truong-2-tang-manh-cac-ngan-hang-giam-vay-muon-lan-nhau-20180823170230032.chn ', N'Cafef.vn', N'<span>Lãi suất trên liên ngân hàng bật tăng trở lại, với lãi suất qua đêm lên tới 3,34%/năm đối với VND và với USD là 2,07%/năm.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/23/photo1535018426635-15350184266351234330336.jpg', CAST(N'2018-08-23 17:02:05.000' AS DateTime), CAST(N'2018-08-24 21:24:01.363' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (170, N' 60 tỷ USD trong dân: Hiểu cho đúng về huy động ', N'60-ty-USD-trong-dan-Hieu-cho-dung-ve-huy-dong', N' http://cafef.vn/60-ty-usd-trong-dan-hieu-cho-dung-ve-huy-dong-20180823155124626.chn ', N'Cafef.vn', N'<span>Có rất nhiều kênh, nhiều giải pháp để “huy động” nguồn lực trong dân, trong đó ngân hàng chỉ là một. Vấn đề là chọn giải pháp nào cho hiệu quả và có lợi nhất đối với nền kinh tế.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/23/photo1535014164121-1535014164121200026405.jpg', CAST(N'2018-08-23 16:16:54.000' AS DateTime), CAST(N'2018-08-24 21:24:01.520' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (171, N' Gửi tiết kiệm trung, dài hạn ngân hàng nào có lãi tốt? ', N'Gui-tiet-kiem-trung-dai-han-ngan-hang-nao-co-lai-tot', N' http://cafef.vn/gui-tiet-kiem-trung-dai-han-ngan-hang-lon-nao-de-co-lai-tot-nhat-20180823084004279.chn ', N'Cafef.vn', N'<span>Lãi suất huy động trung và dài hạn có dấu hiệu tăng trong 2 tháng trở lại đây tại một số nhà băng, sự chênh lệch giữa các nhóm ngân hàng trên thị trường hiện nay cũng ngày một rõ rệt.</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/23/photo1535012759273-15350127592741314976122.jpg', CAST(N'2018-08-23 15:40:01.000' AS DateTime), CAST(N'2018-08-24 21:24:01.677' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (172, N' Thị trường trái phiếu Việt: Bao giờ mới ngang ngửa Hàn Quốc, Malaysia? ', N'Thi-truong-trai-phieu-Viet-Bao-gio-moi-ngang-ngua-Han-Quoc-Malaysia', N' http://cafef.vn/thi-truong-trai-phieu-viet-bao-gio-moi-ngang-ngua-han-quoc-malaysia-20180823133118204.chn ', N'Cafef.vn', N'<span>Quy mô thị trường trái phiếu Việt Nam chưa bằng 1/3 của Hàn Quốc và bằng 1/2 của Malaysia...</span>', N'', 0, 189, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/23/photo1535005813931-15350058139322003211221.jpg', CAST(N'2018-08-23 14:42:23.000' AS DateTime), CAST(N'2018-08-24 21:24:01.947' AS DateTime), 0)
GO
INSERT [dbo].[Mod_RSS] ([ID], [Name], [Code], [Url], [Nguon], [Summary], [Content], [State], [MenuID], [View], [File], [Published], [NgayLayTin], [Activity]) VALUES (173, N' Doanh nghiệp e ngại huy động vốn trái phiếu, thiếu vốn chỉ nghĩ tới vay ngân hàng ', N'Doanh-nghiep-e-ngai-huy-dong-von-trai-phieu-thieu-von-chi-nghi-toi-vay-ngan-hang', N' http://cafef.vn/doanh-nghiep-e-ngai-huy-dong-von-trai-phieu-thieu-von-chi-nghi-toi-vay-ngan-hang-2018082313520122.chn ', N'Cafef.vn', N'<span>Mặc dù quy mô thị trường trái phiếu doanh nghiệp có sự tăng trưởng trong thời gian gần đây nhưng đại diện Bộ Tài chính đánh giá vẫn còn nhỏ so với quy mô của kênh tín dụng ngân hàng (tương đương 130% GDP).</span>', N'', 0, 256, 0, N'http://cafefcdn.com/zoom/100_62/2018/8/23/photo1535007023168-15350070231691329149812.jpg', CAST(N'2018-08-23 14:16:34.000' AS DateTime), CAST(N'2018-08-24 21:24:02.313' AS DateTime), 0)
GO
SET IDENTITY_INSERT [dbo].[Mod_RSS] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_Tag] ON 

GO
INSERT [dbo].[Mod_Tag] ([ID], [Name], [Code], [Title], [Keywords], [Description]) VALUES (1, N'TinhTinh.com', N'TinhTinh.com', NULL, NULL, NULL)
GO
INSERT [dbo].[Mod_Tag] ([ID], [Name], [Code], [Title], [Keywords], [Description]) VALUES (2, N'Web giá rẻ', N'Web-gia-re', NULL, NULL, NULL)
GO
INSERT [dbo].[Mod_Tag] ([ID], [Name], [Code], [Title], [Keywords], [Description]) VALUES (3, N'Thiết kế web', N'Thiet-ke-web', NULL, NULL, NULL)
GO
INSERT [dbo].[Mod_Tag] ([ID], [Name], [Code], [Title], [Keywords], [Description]) VALUES (4, N'Công ty thiết kế web', N'Cong-ty-thiet-ke-web', NULL, NULL, NULL)
GO
INSERT [dbo].[Mod_Tag] ([ID], [Name], [Code], [Title], [Keywords], [Description]) VALUES (5, N'Web trọn gói', N'Web-tron-goi', NULL, NULL, NULL)
GO
INSERT [dbo].[Mod_Tag] ([ID], [Name], [Code], [Title], [Keywords], [Description]) VALUES (6, N'TinhTinh.com', N'TinhTinhcom', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Mod_Tag] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_User] ON 

GO
INSERT [dbo].[Mod_User] ([ID], [Name], [Code], [MenuID], [CoQuanID], [Address], [Phone], [Email], [Activity]) VALUES (1, N'Nguyễn Xuân Phúc', N'Nguyen-Xuan-Phuc', 58, 134, N'', N'', N'', 1)
GO
SET IDENTITY_INSERT [dbo].[Mod_User] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_UserResetPass] ON 

GO
INSERT [dbo].[Mod_UserResetPass] ([ID], [UserID], [LoginName], [Email], [Phone], [TimeReset], [PassReset], [StateSend]) VALUES (1, 2, N'anhlh', N'nguoinhapcuoc_1987@yahoo.com.vn', N'01663765886', CAST(N'2017-11-05 11:30:03.833' AS DateTime), N'2D4B4', 1)
GO
INSERT [dbo].[Mod_UserResetPass] ([ID], [UserID], [LoginName], [Email], [Phone], [TimeReset], [PassReset], [StateSend]) VALUES (2, 2, N'anhlh', N'nguoinhapcuoc_1987@yahoo.com.vn', N'01663765886', CAST(N'2017-11-05 12:04:36.440' AS DateTime), N'EA70C', 1)
GO
INSERT [dbo].[Mod_UserResetPass] ([ID], [UserID], [LoginName], [Email], [Phone], [TimeReset], [PassReset], [StateSend]) VALUES (3, 2, N'anhlh', N'nguoinhapcuoc_1987@yahoo.com.vn', N'01663765886', CAST(N'2017-11-05 12:05:48.173' AS DateTime), N'3C293', 1)
GO
INSERT [dbo].[Mod_UserResetPass] ([ID], [UserID], [LoginName], [Email], [Phone], [TimeReset], [PassReset], [StateSend]) VALUES (4, 2, N'anhlh', N'nguoinhapcuoc_1987@yahoo.com.vn', N'01663765886', CAST(N'2017-11-05 12:06:34.683' AS DateTime), N'54112', 1)
GO
INSERT [dbo].[Mod_UserResetPass] ([ID], [UserID], [LoginName], [Email], [Phone], [TimeReset], [PassReset], [StateSend]) VALUES (5, 2, N'anhlh', N'nguoinhapcuoc_1987@yahoo.com.vn', N'01663765886', CAST(N'2017-11-05 12:08:01.433' AS DateTime), N'9A130', 1)
GO
INSERT [dbo].[Mod_UserResetPass] ([ID], [UserID], [LoginName], [Email], [Phone], [TimeReset], [PassReset], [StateSend]) VALUES (6, 2, N'anhlh', N'nguoinhapcuoc_1987@yahoo.com.vn', N'01663765886', CAST(N'2017-11-05 12:10:35.493' AS DateTime), N'8F15F', 1)
GO
INSERT [dbo].[Mod_UserResetPass] ([ID], [UserID], [LoginName], [Email], [Phone], [TimeReset], [PassReset], [StateSend]) VALUES (7, 2, N'anhlh', N'nguoinhapcuoc_1987@yahoo.com.vn', N'01663765886', CAST(N'2017-11-05 12:11:22.610' AS DateTime), N'FA264', 1)
GO
INSERT [dbo].[Mod_UserResetPass] ([ID], [UserID], [LoginName], [Email], [Phone], [TimeReset], [PassReset], [StateSend]) VALUES (8, 2, N'anhlh', N'nguoinhapcuoc_1987@yahoo.com.vn', N'01663765886', CAST(N'2017-11-05 12:15:20.423' AS DateTime), N'AC2FB', 1)
GO
INSERT [dbo].[Mod_UserResetPass] ([ID], [UserID], [LoginName], [Email], [Phone], [TimeReset], [PassReset], [StateSend]) VALUES (9, 2, N'anhlh', N'nguoinhapcuoc_1987@yahoo.com.vn', N'01663765886', CAST(N'2017-11-05 12:16:14.900' AS DateTime), N'B1108', 1)
GO
INSERT [dbo].[Mod_UserResetPass] ([ID], [UserID], [LoginName], [Email], [Phone], [TimeReset], [PassReset], [StateSend]) VALUES (10, 2, N'anhlh', N'nguoinhapcuoc_1987@yahoo.com.vn', N'01663765886', CAST(N'2017-11-05 15:29:26.587' AS DateTime), N'31600', 1)
GO
INSERT [dbo].[Mod_UserResetPass] ([ID], [UserID], [LoginName], [Email], [Phone], [TimeReset], [PassReset], [StateSend]) VALUES (11, 2, N'anhlh', N'nguoinhapcuoc_1987@yahoo.com.vn', N'01663765886', CAST(N'2017-11-05 15:30:30.017' AS DateTime), N'DB1B7', 1)
GO
SET IDENTITY_INSERT [dbo].[Mod_UserResetPass] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_VanBan] ON 

GO
INSERT [dbo].[Mod_VanBan] ([ID], [MenuID], [MenuIDs], [MenuID1], [MenuID2], [UserIDs], [Name], [Code], [Custom], [Summary], [Content], [NgayBanHanh], [NgayCoHieuLuc], [NgayHetHieuLuc], [File], [File1], [File2], [File3], [Urls], [GhiChu], [Published], [Order], [Activity]) VALUES (1, 8, N'18;19;20;22;23', 27, 36, N'1', N'49/2017/NĐ-CP', N'492017NDCP', NULL, N'Sửa đổi, bổ sung Điều 15 của Nghị định số 25/2011/NĐ-CP ngày 06 tháng 4 năm 2011 của Chính phủ quy định chi tiết và hướng dẫn thi hành một số điều của Luật viễn thông và Điều 30 của Nghị định số 174/2013/NĐ-CP ngày 13 tháng 11 năm 2013 của Chính phủ quy định xử phạt vi phạm hành chính trong lĩnh vực bưu chính, viễn thông, công nghệ thông tin và tần số vô tuyến điện', N'', CAST(N'2017-04-24 00:00:00.000' AS DateTime), CAST(N'2017-04-24 00:00:00.000' AS DateTime), NULL, N'~/Data/upload/files/VanBan/49_signed.pdf', NULL, NULL, NULL, N'', N'', CAST(N'2017-09-30 00:00:00.000' AS DateTime), 1, 1)
GO
SET IDENTITY_INSERT [dbo].[Mod_VanBan] OFF
GO
SET IDENTITY_INSERT [dbo].[Mod_Video] ON 

GO
INSERT [dbo].[Mod_Video] ([ID], [MenuID], [State], [Name], [Code], [Summary], [Content], [File], [File1], [Time], [View], [Published], [Order], [Activity]) VALUES (1, 134, 0, N'Hội nghị Giao ban quản lý nhà nước Bộ TT&TT quý III/2017', N'Hoi-nghi-Giao-ban-quan-ly-nha-nuoc-Bo-TTTT-quy-III2017', NULL, N'<p>(Mic.gov.vn) - Ng&agrave;y 02/10/2017, tại H&agrave; Nội, Bộ TT&amp;TT đ&atilde; tổ chức Hội nghị giao ban quản l&yacute; nh&agrave; nước qu&yacute; III/2017. Bộ trưởng Trương Minh Tuấn chủ tr&igrave; Hội nghị. Tham dự Hội nghị c&oacute; c&aacute;c Thứ trưởng: Nguyễn Minh Hồng, Nguyễn Th&agrave;nh Hưng, Phạm Hồng Hải, Phan T&acirc;m, Ho&agrave;ng Vĩnh Bảo, c&ugrave;ng đại diện c&aacute;c cục, vụ chức năng của Bộ TT&amp;TT. Hội nghị được tổ chức theo h&igrave;nh thức trực tuyến với c&aacute;c điểm cầu H&agrave; Nội (18 Nguyễn Du), Đ&agrave; Nẵng v&agrave; TP. Hồ Ch&iacute; Minh.</p>
', N'~/Data/upload/images/TinVideo/20171002-pg3-BT2.jpg', N'~/Data/upload/files/TinVideo/H%E1%BB%99i%20ngh%E1%BB%8B%20Giao%20ban%20qu%E1%BA%A3n%20l%C3%BD%20nh%C3%A0%20n%C6%B0%E1%BB%9Bc%20B%E1%BB%99%20TT%26TT%20qu%C3%BD%20III_2017.MP4', N'1:42', 96, CAST(N'2017-10-22 00:00:00.000' AS DateTime), 1, 1)
GO
INSERT [dbo].[Mod_Video] ([ID], [MenuID], [State], [Name], [Code], [Summary], [Content], [File], [File1], [Time], [View], [Published], [Order], [Activity]) VALUES (2, 134, 0, N'Cùng Thủ tướng nhắn tin ủng hộ người nghèo', N'Cung-Thu-tuong-nhan-tin-ung-ho-nguoi-ngheo', NULL, N'<p>Hưởng ứng phong tr&agrave;o thi đua &quot;Cả nước chung tay v&igrave; người ngh&egrave;o &ndash; Kh&ocirc;ng để ai bị bỏ lại ph&iacute;a sau&quot; do Thủ tướng Ch&iacute;nh phủ ph&aacute;t động v&agrave; triển khai Th&aacute;ng cao điểm &quot;V&igrave; người ngh&egrave;o&quot; (17/10 &ndash; 18/11), tối 15/10, Ủy ban Trung ương Mặt trận Tổ quốc Việt Nam phối hợp với Bộ LĐ-TB&amp;XH, Bộ TT&amp;TT, Đảng ủy khối Doanh nghiệp Trung ương, Đ&agrave;i Truyền h&igrave;nh Việt Nam v&agrave; c&aacute;c cơ quan c&oacute; li&ecirc;n quan tổ chức Cầu truyền h&igrave;nh &quot;Chung tay v&igrave; người ngh&egrave;o&quot; 2017. Ủy vi&ecirc;n Trung ương Đảng, Bộ trưởng Bộ TT&amp;TT Trương Minh Tuấn&nbsp;đ&atilde; tham dự chương tr&igrave;nh tại điểm cầu H&agrave; Nội.</p>
', N'~/Data/upload/images/TinVideo/20171015-m1.jpg', N'~/Data/upload/files/TinVideo/C%C3%B9ng%20Th%E1%BB%A7%20t%C6%B0%E1%BB%9Bng%20nh%E1%BA%AFn%20tin%20%E1%BB%A7ng%20h%E1%BB%99%20ng%C6%B0%E1%BB%9Di%20ngh%C3%A8o.MP4', N'1:15', 20, CAST(N'2017-10-22 00:00:00.000' AS DateTime), 2, 1)
GO
SET IDENTITY_INSERT [dbo].[Mod_Video] OFF
GO
INSERT [dbo].[Sys_Lang] ([ID], [Name], [Code]) VALUES (1, N'Việt Nam', N'vi-VN')
GO
INSERT [dbo].[Sys_Lang] ([ID], [Name], [Code]) VALUES (2, N'English', N'en-US')
GO
INSERT [dbo].[Sys_Lang] ([ID], [Name], [Code]) VALUES (3, N'Chinese', N'zh-cn')
GO
SET IDENTITY_INSERT [dbo].[Sys_Module] ON 

GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (1, N'MO : Tin tức', N'MNews', N'', N'MODULE', N'HL.Lib.Controllers.MNewsController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 1)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (3, N'ĐK : Tin tức', N'CNews', N'HaiChuyenMuc,HomeCarousel,Hot,MotChuyenMuc,MultiMedia', N'CONTROL', N'HL.Lib.Controllers.CNewsController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 5)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (4, N'ĐK :  Static', N'CStatic', N'Date,Search', N'CONTROL', N'HL.Lib.Controllers.CStaticController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 2)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (5, N'MO : Bài viết', N'MContent', N'', N'MODULE', N'HL.Lib.Controllers.MContentController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 2)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (6, N'MO : Liên hệ', N'MFeedback', N'', N'MODULE', N'HL.Lib.Controllers.MFeedbackController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 3)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (7, N'ĐK : Quảng cáo/Liên kết', N'CAdv', N'Default,Left,LienKet1ChuyenMuc,LienKet3ChuyenMuc,Logo,SlideHome', N'CONTROL', N'HL.Lib.Controllers.CAdvController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 4)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (8, N'ĐK : Menu', N'CMenu', N'Top,TopLeft,TopRight,Left,Left2,TempTop', N'CONTROL', N'HL.Lib.Controllers.CMenuController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 1)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (9, N'ĐK : Văn bản', N'CText', N'Default', N'CONTROL', N'HL.Lib.Controllers.CTextController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 3)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (10, N'MO : Tìm kiếm', N'MSearch', N'', N'MODULE', N'HL.Lib.Controllers.MSearchController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 6)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (11, N'MO : SiteMap', N'MSiteMap', N'', N'MODULE', N'HL.Lib.Controllers.MSiteMapController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 7)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (12, N'MO : Tags', N'MTag', N'', N'MODULE', N'HL.Lib.Controllers.MTagController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 8)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (13, N'ĐK : Liên hệ', N'CFeedback', N'Default,TempDefault', N'CONTROL', N'HL.Lib.Controllers.CFeedbackController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 9)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (17, N'MO : Temp - SiteMap', N'MSiteMapTemp', N'', N'MODULE', N'HL.Lib.Controllers.MSiteMapTempController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 11)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (18, N'MO : Dự thảo', N'MDuThao', N'', N'MODULE', N'HL.Lib.Controllers.MDuThaoController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 12)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (19, N'MO : Góp ý', N'MGopY', N'', N'MODULE', N'HL.Lib.Controllers.MGopYController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 13)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (20, N'MO : Văn bản chuyên ngành', N'MVanBan', N'', N'MODULE', N'HL.Lib.Controllers.MVanBanController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 14)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (21, N'MO : Tin Video', N'MVideo', N'', N'MODULE', N'HL.Lib.Controllers.MVideoController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 15)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (22, N'MO : Thành viên', N'MInfo', N'', N'MODULE', N'HL.Lib.Controllers.MInfoController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 16)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (23, N'ĐK : Thành viên', N'CInfo', N'ChangePass,Info,Login,Register,ResetPass', N'CONTROL', N'HL.Lib.Controllers.CInfoController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 17)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (24, N'MO : Tin Ảnh', N'MAlbum', N'', N'MODULE', N'HL.Lib.Controllers.MAlbumController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 18)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (25, N'MO : Hồ sơ ứng cứu sự cố', N'MHSThanhVienUCSC', N'', N'MODULE', N'HL.Lib.Controllers.MHSThanhVienUCSCController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 19)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (26, N'MO : Đơn đăng ký ứng cứu sự cố', N'MDonDangKyUCSC', N'', N'MODULE', N'HL.Lib.Controllers.MDonDangKyUCSCController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 20)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (27, N'MO : Báo cáo ban đầu sự cố', N'MBaoCaoBanDauSuCo', N'', N'MODULE', N'HL.Lib.Controllers.MBaoCaoBanDauSuCoController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 21)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (28, N'MO : Báo cáo kết thúc sự cố', N'MBaoCaoKetThucSuCo', N'', N'MODULE', N'HL.Lib.Controllers.MBaoCaoKetThucSuCoController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 22)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (29, N'MO : Báo cáo tổng hợp', N'MBaoCaoTongHop', N'', N'MODULE', N'HL.Lib.Controllers.MBaoCaoTongHopController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 23)
GO
INSERT [dbo].[Sys_Module] ([ID], [Name], [Code], [Layout], [Type], [TypeName], [AssemblyName], [Order]) VALUES (30, N'MO : Báo cáo sự cố', N'MBaoCaoSuCo', N'', N'MODULE', N'HL.Lib.Controllers.MBaoCaoSuCoController', N'HLv1.0.MVC.Lib, Version=1.0.0.0, Culture=Neutral,PublicKeyToken=null', 24)
GO
SET IDENTITY_INSERT [dbo].[Sys_Module] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_Page] ON 

GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (1, 0, 0, 1, 0, 0, N'Menu Top', N'-', N'', NULL, 1, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (7, 0, 0, 1, 0, 0, N'Module', N'-', N'', NULL, 5, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (19, 1, 0, 1, 0, 1, N'Trang chủ', N'Trang-chu', N'', N'', 1, 0)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (20, 2, 10, 1, 0, 7, N'Tìm kiếm', N'Tim-kiem', N'', NULL, 1, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (23, 2, 11, 1, 0, 7, N'Site map', N'Site-map', N'MSiteMap.PageID=1', NULL, 2, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (26, 2, 19, 1, 0, 7, N'Góp ý dự thảo', N'Gop-y-du-thao', N'', N'', 3, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (27, 0, 0, 1, 0, 0, N'Menu Top 1', N'-', N'', N'', 2, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (28, 1, 0, 1, 0, 27, N'Trang chủ', N'default', N'', N'', 1, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (29, 2, 5, 1, 0, 27, N'Giới thiệu', N'Gioi-Thieu', N'MNews.PageSize=5
MContent.NewsID=40', N'', 2, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (30, 2, 1, 1, 70, 27, N'Cảnh báo sự cố', N'Canh-bao-su-co', N'', N'', 3, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (31, 2, 1, 1, 72, 27, N'Điều phối sự cố', N'Dieu-phoi-su-co', N'Title=', N'', 4, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (32, 2, 1, 1, 71, 27, N'Giám sát an toàn mạng', N'Giam-sat-an-toan-mang', N'Title=', N'', 5, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (94, 0, 0, 1, 0, 0, N'MenuTop-Left', N'-', N'', NULL, 3, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (95, 0, 0, 1, 0, 0, N'MenuTop-Right', N'-', N'', NULL, 4, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (96, 0, 0, 1, 0, 94, N'Liên hệ', N'Lien-he', N'', N'', 1, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (97, 0, 0, 1, 0, 94, N'Nội bộ', N'Noi-bo', N'', NULL, 2, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (98, 0, 0, 1, 0, 94, N'Thư điện tử', N'https://mail.mic.gov.vn', N'TYPE=HTTP', N'', 3, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (99, 0, 0, 1, 0, 95, N'Sơ đồ cổng', N'/vn/Thong-tin-chung/So-do-cong.aspx', N'TYPE=HTTP', N'<span class=', 1, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (100, 0, 0, 1, 0, 95, N'Liên kết', N'/vn/Thong-tin-chung/Lien-ket.aspx', N'TYPE=HTTP', N'<span class=', 2, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (102, 0, 0, 1, 0, 7, N'Thông tin chung', N'Thong-tin-chung', N'', N'', 4, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (103, 2, 5, 1, 0, 102, N'Điều khoản sử dụng', N'Dieu-khoan-su-dung', N'MContent.NewsID=9', N'', 1, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (104, 2, 1, 1, 83, 102, N'Thông tin tra cứu chuyên ngành Thông tin và Truyền thông', N'Thong-tin-tra-cuu-chuyen-nganh-Thong-tin-va-Truyen-thong', N'', N'', 2, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (105, 2, 1, 1, 84, 102, N'Các chuyên mục lĩnh vực Thông tin & Truyền thông', N'Cac-chuyen-muc-linh-vuc-Thong-tin-Truyen-thong', N'', N'', 3, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (106, 2, 1, 1, 85, 102, N'Liên kết', N'Lien-ket', N'', N'', 4, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (107, 2, 1, 1, 86, 102, N'Sơ đồ cổng', N'So-do-cong', N'', N'', 5, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (108, 2, 21, 1, 134, 7, N'Tin Video', N'Tin-Video', N'MVideo.PageSize=8', N'', 5, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (109, 7, 22, 1, 0, 112, N'Đăng ký', N'Dang-ky', N'Template_Danh sách điều khiển bên phải=HLMODULE,CInfo|cRegister
cRegister.ViewLayout=Register', N'', 6, 0)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (112, 7, 22, 1, 0, 7, N'Thành viên', N'Thanh-vien', N'', N'', 9, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (113, 7, 22, 1, 0, 112, N'Đổi mật khẩu', N'Doi-mat-khau', N'', N'', 7, 0)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (114, 7, 22, 1, 0, 112, N'Thông tin cá nhân', N'Thong-tin-ca-nhan', N'', N'', 8, 0)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (115, 2, 24, 1, 135, 7, N'Tin Hình ảnh', N'Tin-Hinh-anh', N'MAlbum.PageSize=8', N'', 10, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (116, 7, 25, 1, 0, 112, N'Hồ sơ ứng cứu sự cố', N'Ho-so-ung-cuu-su-co', N'', N'', 9, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (117, 7, 26, 1, 0, 112, N'DS đăng ký ứng cứu sự cố', N'DS-dang-ky-ung-cuu-su-co', N'', N'', 10, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (118, 7, 27, 1, 0, 112, N'DS báo cáo ban đầu sự cố', N'DS-bc-ban-dau-su-co', N'', N'', 11, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (119, 7, 28, 1, 0, 112, N'DS báo cáo kết thúc sự cố', N'DS-bc-ket-thuc-su-co', N'', N'', 12, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (120, 7, 29, 1, 0, 112, N'DS báo cáo tổng hợp', N'DS-bc-tong-hop-su-co', N'', N'', 13, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (121, 2, 18, 1, 0, 31, N'Lấy ý kiến nhân dân về Dự thảo VBQPPL', N'Lay-y-kien-nhan-dan-ve-Du-thao-VBQPPL', N'', N'', 1, 0)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (122, 0, 0, 1, 0, 27, N'Dịch vụ', N'mailto:ir@vncert.gov.vn', N'TYPE=HTTP', N'', 6, 0)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (123, 2, 5, 1, 0, 27, N'Liên hệ', N'Lien-he', N'Title=
MContent.NewsID=41', N'', 7, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (124, 0, 0, 1, 0, 0, N'Menu Network', N'-', N'', N'', 6, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (125, 6, 22, 1, 0, 124, N'Dashboard', N'Dashboard', N'', N'', 1, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (126, 7, 30, 1, 0, 124, N'Báo cáo sự cố', N'Bao-cao-su-co', N'', N'', 2, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (127, 7, 22, 1, 0, 124, N'Quản lý tài khoản', N'Quan-ly-tai-khoan', N'', N'', 3, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (128, 2, 1, 1, 73, 7, N'Chống thư rác', N'Chong-thu-rac', N'Title=', N'', 11, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (129, 2, 1, 1, 74, 7, N'Hợp tác quốc tế', N'Hop-tac-quoc-te', N'', N'', 12, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (130, 2, 1, 1, 75, 7, N'Nghiên cứu phát triển', N'Nghien-cuu-phat-trien', N'', N'', 13, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (131, 2, 1, 1, 76, 7, N'Tư vấn - Đào tạo', N'Tu-van-Dao-tao', N'', N'', 14, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (132, 2, 1, 1, 77, 7, N'Tên định danh', N'Ten-dinh-danh', N'', N'', 15, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (135, 2, 1, 1, 0, 27, N'Trang liên kết', N'Lien-ket', N'', N'', 8, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (136, 2, 5, 1, 0, 135, N'Mã số quản lý', N'http://www.vncert.gov.vn/', N'TYPE=HTTP', N'', 1, 1)
GO
INSERT [dbo].[Sys_Page] ([ID], [TemplateID], [ModuleID], [LangID], [MenuID], [ParentID], [Name], [Code], [Custom], [HtmlIcon], [Order], [Activity]) VALUES (138, 7, 30, 1, 0, 7, N'Báo cáo sự cố', N'Bao-cao-su-co', N'', N'', 16, 1)
GO
SET IDENTITY_INSERT [dbo].[Sys_Page] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_Site] ON 

GO
INSERT [dbo].[Sys_Site] ([ID], [PageID], [LangID], [Name], [Code], [Custom], [Default], [Order]) VALUES (1, 28, 1, N'VN', N'vn', N'', 1, 1)
GO
INSERT [dbo].[Sys_Site] ([ID], [PageID], [LangID], [Name], [Code], [Custom], [Default], [Order]) VALUES (2, 97, 2, N'EN', N'en', N'', 0, 2)
GO
INSERT [dbo].[Sys_Site] ([ID], [PageID], [LangID], [Name], [Code], [Custom], [Default], [Order]) VALUES (4, 0, 3, N'CN', N'cn', N'', 0, 3)
GO
SET IDENTITY_INSERT [dbo].[Sys_Site] OFF
GO
SET IDENTITY_INSERT [dbo].[Sys_Template] ON 

GO
INSERT [dbo].[Sys_Template] ([ID], [LangID], [Name], [File], [Custom], [Order]) VALUES (1, 1, N'Trang chủ', N'Default.Master', N'Template_MainContent=CNews|cHaiChuyenMuc,CNews|cTinTucSuKien,CNews|cChongRac,CNews|cHopTac,CNews|cNghienCuu,CAdv|cTaiNguyenVaTaiLieuHD
cLogo.MenuID=59
cLogo.ViewLayout=Logo
cMenuTop.PageID=27
cMenuTop.ViewLayout=Top
cSlideHome.MenuID=245
cSlideHome.ViewLayout=SlideHome
cTinTucSuKien.MenuID=70
cCanhBao.Title=Cảnh báo sự cố
cTinTucSuKien.PageSize=2
cTinTucSuKien.ViewLayout=HaiChuyenMuc
cHaiChuyenMuc.MenuID=61
cTinTuc.Title=Tin tức sự kiện
cHaiChuyenMuc.MenuID2=71
cGiamSat.Title2=Giám sát an toàn mạng
cHaiChuyenMuc.PageSize=2
cHaiChuyenMuc.ViewLayout=MotChuyenMuc

cChongRac.MenuID=72
cChongRac.PageSize=2
cChongRac.ViewLayout=HaiChuyenMuc
cHopTac.MenuID=74
cHopTac.Title=Hợp tác quốc tế
cHopTac.PageSize=2
cHopTac.ViewLayout=HaiChuyenMuc
cNghienCuu.MenuID=76
cTuVan.Title=Tư vấn đào tạo
cNghienCuu.PageSize=2
cNghienCuu.ViewLayout=HaiChuyenMuc
cDieuPhoi.Title=Hoạt động điều phối
cChongRac.MenuID2=73
cChongRac.Title2=Chống thư rác
cHopTac.MenuID2=75
cNghienCuu.Title2=Tên định danh
cNghienCuu.MenuID2=77
cDinhDanh.Title2=Định danh
cTinTucSuKien.MenuID2=71
cTinTucSuKien.Title2=Giám sát an toàn mạng
cTinTucSuKien.Title=Cảnh báo sự cố
cChongRac.Title=Hoạt động điều phối ứng cứu
cHopTac.Title2=Nghiên cứu phát triển
cNghienCuu.Title=Tư vấn - đào tạo
cHaiChuyenMuc.Title=Tin tức sự kiện

cTaiNguyenVaTaiLieuHD.Title=Văn bản và tài liệu hướng dẫn
cTaiNguyenVaTaiLieuHD.MenuID=249
cTaiNguyenVaTaiLieuHD.Title1=Mạng lưới điều phối
cTaiNguyenVaTaiLieuHD.MenuID2=250
cTaiNguyenVaTaiLieuHD.Title2=Văn bản quy phạm pháp luật
cTaiNguyenVaTaiLieuHD.MenuID3=251
cTaiNguyenVaTaiLieuHD.Title3=Tài liệu hướng dẫn và tham khảo
cTaiNguyenVaTaiLieuHD.ViewLayout=LienKet3ChuyenMuc

cHaiChuyenMuc.State=1', 1)
GO
INSERT [dbo].[Sys_Template] ([ID], [LangID], [Name], [File], [Custom], [Order]) VALUES (2, 1, N'Trang con - Mẫu 1', N'Child.Master', N'Template_MainContent=HLMODULE,CAdv|cVanBanvaTaiLieuHD
cLogo.MenuID=59
cLogo.ViewLayout=Logo
cMenuTop.PageID=27
cMenuTop.ViewLayout=Top
cSlideHome.MenuID=245
cSlideHome.ViewLayout=SlideHome


cVanBanvaTaiLieuHD.Title=Mạng lưới điều phối
cVanBanvaTaiLieuHD.MenuID=249
cVanBanvaTaiLieuHD.Title1=Mạng lưới điều phối
cVanBanvaTaiLieuHD.MenuID2=250
cVanBanvaTaiLieuHD.Title2=Văn bản quy phạm pháp luật
cVanBanvaTaiLieuHD.MenuID3=251
cVanBanvaTaiLieuHD.Title3=Tài liệu hướng dẫn và tham khảo
cVanBanvaTaiLieuHD.ViewLayout=LienKet3ChuyenMuc', 2)
GO
INSERT [dbo].[Sys_Template] ([ID], [LangID], [Name], [File], [Custom], [Order]) VALUES (5, 1, N'Trang con - Mẫu 2', N'Child.Master', N'Template_Danh sách điều khiển bên phải=HLMODULE
Template_Danh sách điều khiển bên trái=CMenu|cMenuLeft2,CAdv|cLeft2
hlMenuTop.PageID=1
hlMenuTop.ViewLayout=Top
cMenuLeft2.PageID=30
cMenuLeft2.ViewLayout=Left2
cLogo.MenuID=59
cLogo.ViewLayout=Logo
cSearch.ViewLayout=Search
cMenu_TopLeft.PageID=94
cMenu_TopLeft.ViewLayout=TopLeft
cMenu_TopRight.PageID=95
cMenu_TopRight.ViewLayout=TopRight
cDate.ViewLayout=Date
cLeft2.MenuID=80
cLeft2.ViewLayout=Left', 3)
GO
INSERT [dbo].[Sys_Template] ([ID], [LangID], [Name], [File], [Custom], [Order]) VALUES (6, 1, N'Mạng lưới', N'Network.Master', N'Template_MainContent=HLMODULE,CAdv|cTaiNguyenVaTaiLieuHD
cLogo.MenuID=59
cLogo.ViewLayout=Logo
cMenuTop.PageID=124
cMenuTop.ViewLayout=Top

cTaiNguyenVaTaiLieuHD.Title=VĂN BẢN VÀ TÀI LIỆU HƯỚNG DẪN
cTaiNguyenVaTaiLieuHD.MenuID=249
cTaiNguyenVaTaiLieuHD.Title1=Mạng lưới điều phối
cTaiNguyenVaTaiLieuHD.MenuID2=250
cTaiNguyenVaTaiLieuHD.Title2=Văn bản quy phạm pháp luật
cTaiNguyenVaTaiLieuHD.MenuID3=251
cTaiNguyenVaTaiLieuHD.Title3=Tài liệu hướng dẫn và tham khảo
cTaiNguyenVaTaiLieuHD.ViewLayout=LienKet3ChuyenMuc', 4)
GO
INSERT [dbo].[Sys_Template] ([ID], [LangID], [Name], [File], [Custom], [Order]) VALUES (7, 1, N'Mạng lưới - con', N'NetworkChild.Master', N'Template_MainContent=HLMODULE,CAdv|cTaiNguyenVaTaiLieuHD
cLogo.MenuID=59
cLogo.ViewLayout=Logo
cMenuTop.PageID=124
cMenuTop.ViewLayout=Top

cTaiNguyenVaTaiLieuHD.Title=VĂN BẢN VÀ TÀI LIỆU HƯỚNG DẪN
cTaiNguyenVaTaiLieuHD.MenuID=249
cTaiNguyenVaTaiLieuHD.Title1=Mạng lưới điều phối
cTaiNguyenVaTaiLieuHD.MenuID2=250
cTaiNguyenVaTaiLieuHD.Title2=Văn bản quy phạm pháp luật
cTaiNguyenVaTaiLieuHD.MenuID3=251
cTaiNguyenVaTaiLieuHD.Title3=Tài liệu hướng dẫn và tham khảo
cTaiNguyenVaTaiLieuHD.ViewLayout=LienKet3ChuyenMuc', 5)
GO
SET IDENTITY_INSERT [dbo].[Sys_Template] OFF
GO
SET IDENTITY_INSERT [dbo].[Web_Menu] ON 

GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (1, 1, 0, N'Danh mục Bài viết', N'Danh-muc-Bai-viet', N'News', 0, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (2, 1, 0, N'Danh mục Quảng cáo/Liên kết', N'Danh-muc-Quang-cao', N'Adv', 0, NULL, 2, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (7, 1, 0, N'Danh mục Văn bản quản lý', N'Danh-muc-Van-ban-quan-ly', N'VanBan', NULL, NULL, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (8, 1, 7, N'Văn bản quy phạm pháp luật', N'Van-ban-quy-pham-phap-luat', N'VanBan', NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (9, 1, 7, N'Văn bản chỉ đạo điều hành', N'Van-ban-chi-dao-dieu-hanh', N'VanBan', NULL, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (10, 1, 7, N'Tìm kiếm văn bản', N'Tim-kiem-van-ban', N'VanBan', NULL, NULL, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (11, 1, 7, N'Lấy ý kiến nhân dân về Dự thảo Văn bản quy phạm pháp luật', N'Lay-y-kien-nhan-dan-ve-Du-thao-Van-ban-quy-pham-phap-luat', N'VanBan', NULL, NULL, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (12, 1, 0, N'Danh mục Phân loại Văn bản quản lý', N'Danh-muc-Phan-loai-Van-ban-quan-ly', N'PhanLoaiVanBan', NULL, NULL, 7, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (13, 1, 0, N'Danh mục Lĩnh vực văn bản', N'Danh-muc-Linh-vuc-van-ban', N'VBLinhVuc', NULL, NULL, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (14, 1, 0, N'Danh mục Cơ quan ban hành văn bản', N'Danh-muc-Co-quan-ban-hanh-van-ban', N'VBCoQuan', NULL, NULL, 5, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (15, 1, 0, N'Danh mục Hình thức văn bản', N'Danh-muc-Hinh-thuc-van-ban', N'VBHinhThuc', NULL, NULL, 6, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (16, 1, 13, N'Báo chí', N'Bao-chi', N'VBLinhVuc', NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (17, 1, 13, N'Xuất bản', N'Xuat-ban', N'VBLinhVuc', NULL, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (18, 1, 13, N'Bưu chính', N'Buu-chinh', N'VBLinhVuc', NULL, NULL, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (19, 1, 13, N'Viễn thông', N'Vien-thong', N'VBLinhVuc', NULL, NULL, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (20, 1, 13, N'CNTT, điện tử', N'CNTT-dien-tu', N'VBLinhVuc', NULL, NULL, 5, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (21, 1, 13, N'An toàn thông tin', N'An-toan-thong-tin', N'VBLinhVuc', NULL, NULL, 6, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (22, 1, 13, N'Cơ cấu tổ chức', N'Co-cau-to-chuc', N'VBLinhVuc', NULL, NULL, 7, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (23, 1, 13, N'Lĩnh vực khác', N'Linh-vuc-khac', N'VBLinhVuc', NULL, NULL, 8, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (24, 1, 14, N'Quốc hội', N'Quoc-hoi', N'VBCoQuan', NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (25, 1, 14, N'Chủ tịch nước', N'Chu-tich-nuoc', N'VBCoQuan', NULL, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (26, 1, 14, N'Chính phủ', N'Chinh-phu', N'VBCoQuan', NULL, NULL, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (27, 1, 14, N'Thủ tướng Chính phủ', N'Thu-tuong-Chinh-phu', N'VBCoQuan', NULL, NULL, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (28, 1, 14, N'Bộ Thông tin và Truyền thông', N'Bo-Thong-tin-va-Truyen-thong', N'VBCoQuan', NULL, NULL, 5, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (29, 1, 14, N'Bộ Bưu chính, Viễn thông', N'Bo-Buu-chinh-Vien-thong', N'VBCoQuan', NULL, NULL, 6, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (30, 1, 14, N'Bộ Văn hóa - Thông tin', N'Bo-Van-hoa-Thong-tin', N'VBCoQuan', NULL, NULL, 7, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (31, 1, 14, N'Tổng cục Bưu điện', N'Tong-cuc-Buu-dien', N'VBCoQuan', NULL, NULL, 8, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (32, 1, 14, N'Liên bộ, Ngành', N'Lien-bo-Nganh', N'VBCoQuan', NULL, NULL, 9, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (33, 1, 14, N'Khác', N'Khac', N'VBCoQuan', NULL, NULL, 10, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (34, 1, 15, N'Luật', N'Luat', N'VBHinhThuc', NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (35, 1, 15, N'Pháp lệnh', N'Phap-lenh', N'VBHinhThuc', NULL, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (36, 1, 15, N'Nghị định', N'Nghi-dinh', N'VBHinhThuc', NULL, NULL, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (37, 1, 15, N'Chỉ thị', N'Chi-thi', N'VBHinhThuc', NULL, NULL, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (38, 1, 15, N'Thông tư', N'Thong-tu', N'VBHinhThuc', NULL, NULL, 5, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (39, 1, 15, N'Quyết định', N'Quyet-dinh', N'VBHinhThuc', NULL, NULL, 6, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (40, 1, 15, N'Công văn điều hành', N'Cong-van-dieu-hanh', N'VBHinhThuc', NULL, NULL, 7, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (41, 1, 15, N'Văn bản hợp nhất', N'Van-ban-hop-nhat', N'VBHinhThuc', NULL, NULL, 8, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (42, 1, 15, N'Thông báo', N'Thong-bao', N'VBHinhThuc', NULL, NULL, 9, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (43, 1, 15, N'Nghị quyết', N'Nghi-quyet', N'VBHinhThuc', NULL, NULL, 10, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (44, 1, 0, N'Danh mục Chức vụ', N'Danh-muc-Chuc-vu', N'ChucVu', NULL, NULL, 8, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (45, 1, 0, N'Danh mục Phân loại cơ quan Nhà nước', N'Danh-muc-Phan-loai-co-quan-Nha-nuoc', N'PhanLoaiCoQuan', NULL, NULL, 9, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (46, 1, 45, N'Cấp Trung ương', N'Cap-Trung-uong', N'PhanLoaiCoQuan', NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (47, 1, 45, N'Cấp Tỉnh/Thành phố', N'Cap-TinhThanh-pho', N'PhanLoaiCoQuan', NULL, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (48, 1, 46, N'Cơ quan Nhà nước', N'Co-quan-Nha-nuoc', N'PhanLoaiCoQuan', NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (49, 1, 46, N'Đảng', N'Dang', N'PhanLoaiCoQuan', NULL, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (50, 1, 46, N'Tổ chức Chính trị - Xã hội', N'To-chuc-Chinh-tri-Xa-hoi', N'PhanLoaiCoQuan', NULL, NULL, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (51, 1, 47, N'Cơ quan Nhà nước', N'Co-quan-Nha-nuoc', N'PhanLoaiCoQuan', NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (52, 1, 47, N'Đảng', N'Dang', N'PhanLoaiCoQuan', NULL, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (53, 1, 47, N'Tổ chức Chính trị - Xã hội', N'To-chuc-Chinh-tri-Xa-hoi', N'PhanLoaiCoQuan', NULL, NULL, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (54, 1, 45, N'Cấp Quận/Huyện', N'Cap-QuanHuyen', N'PhanLoaiCoQuan', NULL, NULL, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (55, 1, 54, N'Cơ quan Nhà nước', N'Co-quan-Nha-nuoc', N'PhanLoaiCoQuan', NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (56, 1, 54, N'Đảng', N'Dang', N'PhanLoaiCoQuan', NULL, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (57, 1, 54, N'Tổ chức Chính trị - Xã hội', N'To-chuc-Chinh-tri-Xa-hoi', N'PhanLoaiCoQuan', NULL, NULL, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (58, 1, 44, N'Thủ tướng', N'Thu-tuong', N'ChucVu', NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (59, 1, 2, N'Logo, banner', N'Logo-banner', N'Adv', NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (60, 1, 1, N'Giới thiệu', N'Gioi-thieu', N'News', NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (61, 1, 1, N'Tin tức - Sự kiện', N'Tin-tuc-Su-kien', N'News', NULL, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (62, 1, 1, N'Văn bản quy phạm pháp luật', N'van-ban-quy-pham-phap-luat', N'News', NULL, NULL, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (63, 1, 1, N'Tài liệu hướng dẫn và tham khảo', N'tai-lieu-huong-dan-tham-khao', N'News', NULL, NULL, 5, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (70, 1, 61, N'Cảnh báo sự cố', N'Tin-hoat-dong-cua-Bo', N'News', 0, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (71, 1, 61, N'Giám sát an toàn mạng', N'Giam-sat-an-toan-mang', N'News', 0, NULL, 2, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (72, 1, 61, N'Hoạt động điều phối ứng cứu', N'Hoat-dong-dieu-phoi-ung-cuu', N'News', 0, NULL, 3, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (73, 1, 61, N'Chống thư rác', N'Chong-thu-rac', N'News', 0, NULL, 4, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (74, 1, 61, N'Hợp tác quốc tế', N'Thong-tin-xu-phat', N'News', 0, NULL, 5, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (75, 1, 61, N'Nghiên cứu phát triển', N'Dai-hoi-Dang-toan-quoc-lan-thu-XII', N'News', 0, NULL, 6, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (76, 1, 61, N'Tư vấn - đào tạo', N'Ca-nuoc-chung-tay-vi-nguoi-ngheo', N'News', 0, NULL, 7, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (77, 1, 61, N'Tên định danh', N'Nguoi-tot-Viec-tot', N'News', 0, NULL, 8, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (79, 1, 2, N'Liên kết bên trái - 1', N'Lien-ket-ben-trai-1', N'Adv', NULL, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (80, 1, 2, N'Liên kết bên trái - 2', N'Lien-ket-ben-trai-2', N'Adv', NULL, NULL, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (87, 1, 1, N'Mạng lưới điều phối', N'mang-luoi-dieu-phoi', N'News', NULL, NULL, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (130, 1, 2, N'Banner chuyển đổi mã vùng điện thoại', N'Banner-chuyen-doi-ma-vung-dien-thoai', N'Adv', NULL, NULL, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (131, 1, 2, N'Quảng cáo nhúng - Trang chủ', N'Quang-cao-nhung-Trang-chu', N'Adv', NULL, NULL, 5, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (132, 1, 131, N'Quảng cáo nhúng 1', N'Quang-cao-nhung-1', N'Adv', NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (133, 1, 131, N'Quảng cáo nhúng 2', N'Quang-cao-nhung-2', N'Adv', NULL, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (134, 1, 0, N'Danh mục Video', N'Danh-muc-Video', N'Video', NULL, NULL, 10, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (135, 1, 0, N'Danh mục Album ảnh', N'Danh-muc-Album-anh', N'Album', NULL, NULL, 11, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (136, 1, 0, N'Kiểu mail', N'Kieu-mail', N'MailType', NULL, NULL, 12, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (137, 1, 136, N'Reset mật khẩu', N'Reset-mat-khau', N'MailType', NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (138, 1, 0, N'Smtp Server', N'Smtp-Server', N'SmtpServer', NULL, NULL, 13, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (139, 1, 138, N'Gmail', N'smtp.gmail.com', N'SmtpServer', NULL, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (140, 1, 138, N'Yahoo', N'smtp.mail.yahoo.com', N'SmtpServer', NULL, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (141, 1, 0, N'Danh mục đầu mối ứng cứu sự cố', N'Danh-muc-dau-moi-ung-cuu-su-co', N'DauMoiUCSC', 0, NULL, 14, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (142, 1, 141, N'Chính', N'Chinh', N'DauMoiUCSC', 0, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (143, 1, 0, N'Danh mục cách thức phát hiện', N'Danh-muc-cach-thuc-phat-hien', N'CachThuc', 0, NULL, 15, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (144, 1, 143, N'Qua hệ thống phát hiện xâm nhập', N'Qua-he-thong-phat-hien-xam-nhap', N'CachThuc', 0, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (145, 1, 143, N'Kiểm tra dữ liệu lưu lại (Log File)', N'Kiem-tra-du-lieu-luu-lai-Log-File', N'CachThuc', 0, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (146, 1, 143, N'Nhận được thông báo từ', N'Nhan-duoc-thong-bao-tu', N'CachThuc', 1, NULL, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (147, 1, 143, N'Khác, đó là', N'Khac-do-la', N'CachThuc', 1, NULL, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (148, 1, 0, N'Danh mục gửi thông báo sự cố', N'Danh-muc-gui-thong-bao-su-co', N'GuiThongBaoSuCo', 0, NULL, 16, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (149, 1, 148, N'Thành viên mạng lưới chịu trách nhiệm ứng cứu sự cố cho tổ chức, cá nhân', N'Thanh-vien-mang-luoi-chiu-trach-nhiem-ung-cuu-su-co-cho-to-chuc-ca-nhan', N'GuiThongBaoSuCo', 0, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (150, 1, 148, N'ISP đang trực tiếp cung cấp dịch vụ', N'ISP-dang-truc-tiep-cung-cap-dich-vu', N'GuiThongBaoSuCo', 0, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (151, 1, 148, N'Cơ quan điều phối', N'Co-quan-dieu-phoi', N'GuiThongBaoSuCo', 0, NULL, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (152, 1, 0, N'Danh mục các dịch vụ có trên hệ thống', N'Danh-muc-cac-dich-vu-co-tren-he-thong', N'DichVu', 0, NULL, 17, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (153, 1, 152, N' Web server', N'Web-server', N'DichVu', 0, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (154, 1, 152, N'Mail server', N'Mail-server', N'DichVu', 0, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (155, 1, 152, N'Database server', N'Database-server', N'DichVu', 0, NULL, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (156, 1, 152, N'Dịch vụ khác, đó là', N'Dich-vu-khac-do-la', N'DichVu', 1, NULL, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (157, 1, 0, N'Danh mục Các biện pháp an toàn thông tin đã triển khai', N'Danh-muc-Cac-bien-phap-an-toan-thong-tin-da-trien-khai', N'BienPhapATTT', 0, NULL, 18, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (158, 1, 157, N'Antivirus', N'Antivirus', N'BienPhapATTT', 0, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (159, 1, 157, N'Firewall', N'Firewall', N'BienPhapATTT', 0, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (160, 1, 157, N'Hệ thống phát hiện xâm nhập', N'He-thong-phat-hien-xam-nhap', N'BienPhapATTT', 0, NULL, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (161, 1, 157, N'Khác', N'Khac', N'BienPhapATTT', 1, NULL, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (162, 1, 0, N'Danh mục Thông tin gửi kèm', N'Danh-muc-Thong-tin-gui-kem', N'ThongTinGuiKem', 0, NULL, 19, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (163, 1, 162, N'Nhật ký hệ thống', N'Nhat-ky-he-thong', N'ThongTinGuiKem', 0, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (164, 1, 162, N'Mẫu virus / mã độc', N'Mau-virus-ma-doc', N'ThongTinGuiKem', 0, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (165, 1, 162, N'Khác', N'Khac', N'ThongTinGuiKem', 1, NULL, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (166, 1, 0, N'Danh mục cấp độ', N'Danh-muc-cap-do', N'CapDo', 0, NULL, 20, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (167, 1, 166, N'Cấp 1', N'Cap-1', N'CapDo', 0, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (168, 1, 166, N'Cấp 2', N'Cap-2', N'CapDo', 0, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (169, 1, 166, N'Cấp 3', N'Cap-3', N'CapDo', 0, NULL, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (170, 1, 166, N'Cấp 4', N'Cap-4', N'CapDo', 0, NULL, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (171, 1, 166, N'Cấp 5', N'Cap-5', N'CapDo', 0, NULL, 5, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (172, 1, 0, N'Danh mục loại sự cố', N'Danh-muc-loai-su-co', N'LoaiSuCo', 0, NULL, 21, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (173, 1, 172, N'Từ chối dịch vụ', N'Tu-choi-dich-vu', N'LoaiSuCo', 0, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (174, 1, 172, N'Tấn công giả mạo', N'Tan-cong-gia-mao', N'LoaiSuCo', 0, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (175, 1, 172, N'Tấn công sử dụng mã độc', N'Tan-cong-su-dung-ma-doc', N'LoaiSuCo', 0, NULL, 3, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (176, 1, 172, N'Truy cập trái phép, chiếm quyền điều khiển', N'Truy-cap-trai-phep-chiem-quyen-dieu-khien', N'LoaiSuCo', 0, NULL, 4, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (177, 1, 172, N'Thay đổi giao diện', N'Thay-doi-giao-dien', N'LoaiSuCo', 0, NULL, 5, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (178, 1, 172, N'Mã hóa phần mềm, dữ liệu, thiết bị', N'Ma-hoa-phan-mem-du-lieu-thiet-bi', N'LoaiSuCo', 0, NULL, 6, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (179, 1, 172, N'Phá hoại thông tin, dữ liệu, phần mềm', N'Pha-hoai-thong-tin-du-lieu-phan-mem', N'LoaiSuCo', 0, NULL, 7, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (180, 1, 172, N'Nghe trộm, gián điệp, lấy cắp thông tin, dữ liệu', N'Nghe-trom-gian-diep-lay-cap-thong-tin-du-lieu', N'LoaiSuCo', 0, NULL, 8, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (181, 1, 172, N'Tấn công tổng hợp sử dụng kết hợp nhiều hình thức', N'Tan-cong-tong-hop-su-dung-ket-hop-nhieu-hinh-thuc', N'LoaiSuCo', 0, NULL, 9, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (182, 1, 172, N'Các hình thức tấn công khác', N'Cac-hinh-thuc-tan-cong-khac', N'LoaiSuCo', 0, NULL, 10, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (183, 1, 0, N'Danh mục Hiện trạng sự cố', N'Danh-muc-Hien-trang-su-co', N'HienTrangSuCo', 0, NULL, 22, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (184, 1, 183, N' Đã được xử lý', N'Da-duoc-xu-ly', N'HienTrangSuCo', 0, NULL, 1, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (185, 1, 183, N'Chưa được xử lý', N'Chua-duoc-xu-ly', N'HienTrangSuCo', 0, NULL, 2, 1, NULL, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (186, 1, 0, N'Chuyên mục RSS', N'Chuyen-muc-RSS', N'RSS', 0, NULL, 23, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (187, 1, 0, N'Danh sách kênh RSS', N'Danh-sach-kenh-RSS', N'Org', 0, NULL, 24, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (188, 1, 187, N'Cafef - Tài chính, ngân hàng', N'Cafef.vn', N'Org', 0, N'', 1, 1, 189, N'http://cafef.vn/Tai-chinh-ngan-hang.rss')
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (189, 1, 186, N'Ngân hàng và tiền tệ', N'Ngan-hang-va-tien-te', N'RSS', 0, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (190, 1, 0, N'Danh mục phân hệ sự cố', N'Danh-muc-phan-he-su-co', N'Incident', 0, NULL, 25, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (191, 1, 190, N'Deface', N'Deface', N'Incident', 0, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (192, 1, 190, N'Phishing', N'Phishing', N'Incident', 0, NULL, 2, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (193, 1, 190, N'Malware', N'Malware', N'Incident', 0, NULL, 3, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (194, 1, 190, N'C&C botnet', N'Bonet', N'Incident', 0, NULL, 4, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (195, 1, 190, N'Attack', N'Attack', N'Incident', 0, NULL, 5, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (196, 1, 0, N'Dịch vụ cảnh báo', N'Dich-vu-canh-bao', N'DichVuCanhBao', 0, NULL, 26, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (197, 1, 196, N'Ngày', N'Ngay', N'DichVuCanhBao', 0, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (198, 1, 196, N'Tuần', N'Tuan', N'DichVuCanhBao', 0, NULL, 2, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (199, 1, 196, N'Tháng', N'Thang', N'DichVuCanhBao', 0, NULL, 3, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (200, 1, 196, N'Quý', N'Quy', N'DichVuCanhBao', 0, NULL, 4, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (201, 1, 196, N'Năm', N'Nam', N'DichVuCanhBao', 0, NULL, 5, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (202, 1, 0, N'Lĩnh vực đào tạo', N'Linh-vuc-dao-tao', N'LinhVucDaoDao', 0, NULL, 27, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (203, 1, 0, N'Trình độ đào tạo', N'Trinh-do-dao-tao', N'TrinhDoDaoTao', 0, NULL, 28, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (204, 1, 0, N'Chứng chỉ về CNTT, ATTT hoặc tương đương', N'Chung-chi-ve-CNTT-ATTT-hoac-tuong-duong', N'ChungChi', 0, NULL, 29, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (205, 1, 0, N'Quản lý ATTT', N'Quan-ly-ATTT', N'QuanLyATTT', 0, NULL, 30, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (206, 1, 0, N'Kỹ thuật phòng thủ, chống tấn công', N'Ky-thuat-phong-thu-chong-tan-cong', N'KyThuatPhongThu', 0, NULL, 31, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (207, 1, 0, N'Kỹ thuật bảo vệ an toàn hệ thống và ứng dụng', N'Ky-thuat-bao-ve-an-toan-he-thong-va-ung-dung', N'KyThuatBaoVe', 0, NULL, 32, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (208, 1, 0, N'Kỹ thuật kiểm tra, đánh giá ATTT', N'Ky-thuat-kiem-tra-danh-gia-ATTT', N'KyThuatKiemTra', 0, NULL, 33, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (209, 1, 202, N'Chuyên ngành về CNTT', N'Chuyen-nganh-ve-CNTT', N'LinhVucDaoDao', 0, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (210, 1, 202, N'Chuyên ngành về ATTT', N'Chuyen-nganh-ve-ATTT', N'LinhVucDaoDao', 0, NULL, 2, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (211, 1, 202, N'Chuyên ngành tương đương', N'Chuyen-nganh-tuong-duong', N'LinhVucDaoDao', 0, NULL, 3, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (212, 1, 203, N'Trên đại học', N'Tren-dai-hoc', N'TrinhDoDaoTao', 0, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (213, 1, 203, N'Đại học', N'Dai-hoc', N'TrinhDoDaoTao', 0, NULL, 2, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (214, 1, 203, N'Cao đẳng', N'Cao-dang', N'TrinhDoDaoTao', 0, NULL, 3, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (215, 1, 203, N'Trung cấp', N'Trung-cap', N'TrinhDoDaoTao', 0, NULL, 4, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (216, 1, 204, N'Chứng chỉ quốc tế', N'Chung-chi-quoc-te', N'ChungChi', 0, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (217, 1, 204, N'Chứng chỉ trong nước', N'Chung-chi-trong-nuoc', N'ChungChi', 0, NULL, 2, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (218, 1, 205, N'Quản lý ATTT cấp cao', N'Quan-ly-ATTT-cap-cao', N'QuanLyATTT', 0, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (219, 1, 205, N'Hệ thống quản lý ATTT', N'He-thong-quan-ly-ATTT', N'QuanLyATTT', 0, NULL, 2, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (220, 1, 205, N'Quản trị hệ thống thông tin (hệ điều hành, ứng dụng)', N'Quan-tri-he-thong-thong-tin-he-dieu-hanh-ung-dung', N'QuanLyATTT', 0, NULL, 3, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (221, 1, 205, N'Quản trị an toàn mạng và hạ tầng mạng', N'Quan-tri-an-toan-mang-va-ha-tang-mang', N'QuanLyATTT', 0, NULL, 4, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (222, 1, 205, N'Xây dựng chính sách đảm bảo ATTT', N'Xay-dung-chinh-sach-dam-bao-ATTT', N'QuanLyATTT', 0, NULL, 5, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (223, 1, 206, N'Kỹ thuật tấn công và chống tấn công mạng, chống khủng bố, chống chiến tranh mạng', N'Ky-thuat-tan-cong-va-chong-tan-cong-mang-chong-khung-bo-chong-chien-tranh-mang', N'KyThuatPhongThu', 0, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (224, 1, 206, N'Phân tích mã độc, phòng chống mã độc và phần mềm gián điệp', N'Phan-tich-ma-doc-phong-chong-ma-doc-va-phan-mem-gian-diep', N'KyThuatPhongThu', 0, NULL, 2, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (225, 1, 206, N'Ứng cứu xử lý sự cố ATTT', N'Ung-cuu-xu-ly-su-co-ATTT', N'KyThuatPhongThu', 0, NULL, 3, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (226, 1, 206, N'Kiểm tra, giám sát và phân tích hệ thống, dò quét lỗ hổng bảo mật', N'Kiem-tra-giam-sat-va-phan-tich-he-thong-do-quet-lo-hong-bao-mat', N'KyThuatPhongThu', 0, NULL, 4, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (227, 1, 206, N'Phân tích sự cố ATTT', N'Phan-tich-su-co-ATTT', N'KyThuatPhongThu', 0, NULL, 5, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (228, 1, 206, N'Điều tra, thu thập thông tin sự cố và chứng cứ điện tử', N'Dieu-tra-thu-thap-thong-tin-su-co-va-chung-cu-dien-tu', N'KyThuatPhongThu', 0, NULL, 6, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (229, 1, 206, N'Giám sát, lọc nội dung thông tin trên mạng', N'Giam-sat-loc-noi-dung-thong-tin-tren-mang', N'KyThuatPhongThu', 0, NULL, 7, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (230, 1, 206, N'Theo dõi, kiểm soát luồng thông tin trên mạng', N'Theo-doi-kiem-soat-luong-thong-tin-tren-mang', N'KyThuatPhongThu', 0, NULL, 8, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (231, 1, 207, N'Mã hóa, thám mã, che dấu và bảo mật nội dung thông tin', N'Ma-hoa-tham-ma-che-dau-va-bao-mat-noi-dung-thong-tin', N'KyThuatBaoVe', 0, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (232, 1, 207, N'Chữ ký số, nhận dạng, xác thực', N'Chu-ky-so-nhan-dang-xac-thuc', N'KyThuatBaoVe', 0, NULL, 2, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (233, 1, 207, N'Tích hợp hệ thống ATTT', N'Tich-hop-he-thong-ATTT', N'KyThuatBaoVe', 0, NULL, 3, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (234, 1, 207, N'Tư vấn, thiết kế, xây dựng hệ thống mạng an toàn', N'Tu-van-thiet-ke-xay-dung-he-thong-mang-an-toan', N'KyThuatBaoVe', 0, NULL, 4, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (235, 1, 207, N'Lập trình đảm bảo an toàn (ứng dụng Web, cổng thông tin điện tử)', N'Lap-trinh-dam-bao-an-toan-ung-dung-Web-cong-thong-tin-dien-tu', N'KyThuatBaoVe', 0, NULL, 5, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (236, 1, 207, N'Đảm bảo an toàn hệ thống viễn thông, mạng di động, mạng không dây', N'Dam-bao-an-toan-he-thong-vien-thong-mang-di-dong-mang-khong-day', N'KyThuatBaoVe', 0, NULL, 6, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (237, 1, 207, N'Đảm bảo an toàn giao dịch điện tử, thanh toán trực tuyến, thương mại điện tử', N'Dam-bao-an-toan-giao-dich-dien-tu-thanh-toan-truc-tuyen-thuong-mai-dien-tu', N'KyThuatBaoVe', 0, NULL, 7, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (238, 1, 207, N'Đảm bảo an toàn cơ sở dữ liệu', N'Dam-bao-an-toan-co-so-du-lieu', N'KyThuatBaoVe', 0, NULL, 8, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (239, 1, 208, N'Tư vấn hợp chuẩn ATTT', N'Tu-van-hop-chuan-ATTT', N'KyThuatKiemTra', 0, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (240, 1, 208, N'Phân tích, quản lý rủi ro, duy trì hoạt động hệ thống thông tin', N'Phan-tich-quan-ly-rui-ro-duy-tri-hoat-dong-he-thong-thong-tin', N'KyThuatKiemTra', 0, NULL, 2, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (241, 1, 208, N'Đánh giá an toàn hệ thống và sản phẩm công nghệ thông tin', N'Danh-gia-an-toan-he-thong-va-san-pham-cong-nghe-thong-tin', N'KyThuatKiemTra', 0, NULL, 3, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (242, 1, 208, N'Kiểm tra, đánh giá an toàn ứng dụng Web và cổng thông tin điện tử', N'Kiem-tra-danh-gia-an-toan-ung-dung-Web-va-cong-thong-tin-dien-tu', N'KyThuatKiemTra', 0, NULL, 4, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (243, 1, 0, N'Danh mục Email template', N'Danh-muc-Email-template', N'EmailTemplate', 0, NULL, 34, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (244, 1, 243, N'Mẫu 1', N'Mau-1', N'EmailTemplate', 0, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (245, 1, 2, N'Slide home', N'Slide-home', N'Adv', 0, NULL, 6, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (246, 1, 1, N'Liên hệ', N'Lien-he', N'News', 0, NULL, 6, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (247, 1, 2, N'Liên kết ', N'Lien-ket', N'Adv', 0, NULL, 7, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (248, 1, 2, N'Văn bản và tài liệu hướng dẫn', N'Tai-nguyen-va-tai-lieu-huong-dan', N'Adv', 0, NULL, 8, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (249, 1, 248, N'Mạng lưới điều phối', N'Mang-luoi-dieu-phoi', N'Adv', 0, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (250, 1, 248, N'Văn bản quy phạm pháp luật', N'Van-ban-quy-pham-phap-luat', N'Adv', 0, NULL, 2, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (251, 1, 248, N'Tài liệu hướng dẫn và tham khảo', N'Tai-lieu-huong-dan-va-tham-khao', N'Adv', 0, NULL, 3, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (252, 1, 0, N'Danh mục Trạng thái xử lý báo cáo sự cố', N'-', N'BaoCaoSuCo', 0, NULL, 35, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (253, 1, 252, N'Chờ', N'Cho', N'BaoCaoSuCo', 0, NULL, 1, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (254, 1, 252, N'Đang xử lý', N'DangXL', N'BaoCaoSuCo', 0, NULL, 2, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (255, 1, 252, N'Kết thúc', N'KetThuc', N'BaoCaoSuCo', 0, NULL, 3, 1, 0, NULL)
GO
INSERT [dbo].[Web_Menu] ([ID], [LangID], [ParentID], [Name], [Code], [Type], [IsAddText], [Custom], [Order], [Activity], [SourceID], [RSS]) VALUES (256, 1, 186, N'Vàng và Dầu', N'Vang-va-Dau', N'RSS', 0, NULL, 2, 1, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Web_Menu] OFF
GO
SET IDENTITY_INSERT [dbo].[Web_Resource] ON 

GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (1, 1, N'Web_HOME', N'TRANG CHỦ')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (2, 1, N'Contact_Locate', N'Hà Nội, Việt Nam')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (3, 1, N'Contact_Phone', N'0949 069 822')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (4, 1, N'Contact_Email', N'lehoanganhhd@gmail.com')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (5, 1, N'Web_FB_Title', N'Tiêu đề')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (6, 1, N'Web_FB_Content', N'Nội dung')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (7, 1, N'Web_FB_Name', N'Họ tên')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (8, 1, N'Web_FB_Phone', N'Điện thoại')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (9, 1, N'Web_FBE_Mess', N'Bạn vui lòng điền đầy đủ thông tin bắt buộc:')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (10, 1, N'Web_FB_SuccessMess', N'Gửi liên hệ thành công!')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (11, 1, N'Web_FB_Email', N'Email')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (12, 1, N'Web_FBE_Title', N'Bạn chưa nhập tiêu đề')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (13, 1, N'Web_FBE_Content', N'Bạn chưa nhập nội dung')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (14, 1, N'Web_FBE_Name', N'Bạn chưa nhập họ tên')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (15, 1, N'Web_FBE_Phone', N'Bạn chưa nhập số điện thoại')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (16, 1, N'Web_FB_Submit', N'GỬI LIÊN HỆ')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (17, 1, N'Web_FBE_Email', N'Bạn chưa nhập Email')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (18, 1, N'Web_Search', N'Tìm kiếm')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (19, 1, N'Web_SearchPlaceHolder', N'Tìm kiếm...')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (20, 1, N'Web_Footer', N'Cơ quan chủ quản: <span class="text-uppercase"><b>TRUNG TÂM ỨNG CỨU KHẨN CẤP MÁY TÍNH VIỆT NAM</b></span>
                    <div>Giấy phép số: 303/GP-BC do Cục Báo chí - Bộ Văn hoá Thông tin cấp ngày 4/10/2006</div>
                    <div>Trưởng Ban biên tập: Ông Nguyễn Trọng Đường, Giám đốc | Phó Ban biên tập: Ông Nguyễn Khắc Lịch, Phó Giám đốc</div>
                    <div>Địa chỉ: Tầng 5, Tòa nhà 115 Trần Duy Hưng - Phường Trung Hoà - Quận Cầu Giấy - TP. Hà Nội</div>
                    <div>Điện thoại: 84.24.36404421; 36404424; Fax: 84.24.36404425 | Email: office@vncert.vn; Website: www.vncert.gov.vn </div>')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (21, 1, N'Web_GuiGopY', N'Gửi góp ý')
GO
INSERT [dbo].[Web_Resource] ([ID], [LangID], [Code], [Value]) VALUES (22, 1, N'View', N'Lượt truy cập:')
GO
SET IDENTITY_INSERT [dbo].[Web_Resource] OFF
GO
SET IDENTITY_INSERT [dbo].[Web_Setting] ON 

GO
INSERT [dbo].[Web_Setting] ([ID], [Name], [Code], [Value]) VALUES (1, N'So lan truy cap', N'VISIT', N'2172')
GO
INSERT [dbo].[Web_Setting] ([ID], [Name], [Code], [Value]) VALUES (2, N'Thoi gian Cache', N'TIMECACHE', N'120')
GO
INSERT [dbo].[Web_Setting] ([ID], [Name], [Code], [Value]) VALUES (3, NULL, N'MaxPageSiteMap', N'0')
GO
INSERT [dbo].[Web_Setting] ([ID], [Name], [Code], [Value]) VALUES (4, NULL, N'MaxNewsSiteMap', N'0')
GO
INSERT [dbo].[Web_Setting] ([ID], [Name], [Code], [Value]) VALUES (5, NULL, N'MaxTagSiteMap', N'0')
GO
SET IDENTITY_INSERT [dbo].[Web_Setting] OFF
GO
ALTER TABLE [dbo].[CP_Access]  WITH NOCHECK ADD  CONSTRAINT [FK_Sys.CP.Access_Sys.CP.User] FOREIGN KEY([UserID])
REFERENCES [dbo].[CP_User] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CP_Access] NOCHECK CONSTRAINT [FK_Sys.CP.Access_Sys.CP.User]
GO
ALTER TABLE [dbo].[CP_Access]  WITH NOCHECK ADD  CONSTRAINT [FK_T_USER_ACCESS_T_ROLE] FOREIGN KEY([RoleID])
REFERENCES [dbo].[CP_Role] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CP_Access] NOCHECK CONSTRAINT [FK_T_USER_ACCESS_T_ROLE]
GO
ALTER TABLE [dbo].[CP_Access]  WITH NOCHECK ADD  CONSTRAINT [FK_T_USER_ACCESS_T_USER_MODULE] FOREIGN KEY([RefID])
REFERENCES [dbo].[CP_Module] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CP_Access] NOCHECK CONSTRAINT [FK_T_USER_ACCESS_T_USER_MODULE]
GO
ALTER TABLE [dbo].[CP_UserLog]  WITH NOCHECK ADD  CONSTRAINT [FK_Sys.CP.UserLog_Sys.CP.User] FOREIGN KEY([UserID])
REFERENCES [dbo].[CP_User] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CP_UserLog] NOCHECK CONSTRAINT [FK_Sys.CP.UserLog_Sys.CP.User]
GO
ALTER TABLE [dbo].[CP_UserRole]  WITH NOCHECK ADD  CONSTRAINT [FK_T_USER_ROLE_T_ROLE] FOREIGN KEY([RoleID])
REFERENCES [dbo].[CP_Role] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CP_UserRole] NOCHECK CONSTRAINT [FK_T_USER_ROLE_T_ROLE]
GO
ALTER TABLE [dbo].[CP_UserRole]  WITH NOCHECK ADD  CONSTRAINT [FK_T_USER_ROLE_T_USER] FOREIGN KEY([UserID])
REFERENCES [dbo].[CP_User] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[CP_UserRole] NOCHECK CONSTRAINT [FK_T_USER_ROLE_T_USER]
GO
ALTER TABLE [dbo].[Mod_Adv]  WITH NOCHECK ADD  CONSTRAINT [FK_T_ADV_T_MENU] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Web_Menu] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Mod_Adv] NOCHECK CONSTRAINT [FK_T_ADV_T_MENU]
GO
ALTER TABLE [dbo].[Mod_News]  WITH NOCHECK ADD  CONSTRAINT [FK_T_NEWS_T_MENU] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Web_Menu] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Mod_News] CHECK CONSTRAINT [FK_T_NEWS_T_MENU]
GO
ALTER TABLE [dbo].[Sys_Page]  WITH NOCHECK ADD  CONSTRAINT [FK_T_PAGE_T_CONTROL] FOREIGN KEY([ModuleID])
REFERENCES [dbo].[Sys_Module] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Sys_Page] NOCHECK CONSTRAINT [FK_T_PAGE_T_CONTROL]
GO
ALTER TABLE [dbo].[Sys_Page]  WITH NOCHECK ADD  CONSTRAINT [FK_T_PAGE_T_LANG] FOREIGN KEY([LangID])
REFERENCES [dbo].[Sys_Lang] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Sys_Page] NOCHECK CONSTRAINT [FK_T_PAGE_T_LANG]
GO
ALTER TABLE [dbo].[Sys_Page]  WITH NOCHECK ADD  CONSTRAINT [FK_T_PAGE_T_MENU] FOREIGN KEY([MenuID])
REFERENCES [dbo].[Web_Menu] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Sys_Page] NOCHECK CONSTRAINT [FK_T_PAGE_T_MENU]
GO
ALTER TABLE [dbo].[Sys_Page]  WITH NOCHECK ADD  CONSTRAINT [FK_T_PAGE_T_TEMPLATE] FOREIGN KEY([TemplateID])
REFERENCES [dbo].[Sys_Template] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Sys_Page] NOCHECK CONSTRAINT [FK_T_PAGE_T_TEMPLATE]
GO
ALTER TABLE [dbo].[Sys_Site]  WITH NOCHECK ADD  CONSTRAINT [FK_T_APP_T_PAGE] FOREIGN KEY([PageID])
REFERENCES [dbo].[Sys_Page] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Sys_Site] NOCHECK CONSTRAINT [FK_T_APP_T_PAGE]
GO
ALTER TABLE [dbo].[Sys_Site]  WITH NOCHECK ADD  CONSTRAINT [FK_T_SITE_T_LANG] FOREIGN KEY([LangID])
REFERENCES [dbo].[Sys_Lang] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Sys_Site] NOCHECK CONSTRAINT [FK_T_SITE_T_LANG]
GO
ALTER TABLE [dbo].[Sys_Template]  WITH NOCHECK ADD  CONSTRAINT [FK_T_TEMPLATE_T_LANG] FOREIGN KEY([LangID])
REFERENCES [dbo].[Sys_Lang] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Sys_Template] NOCHECK CONSTRAINT [FK_T_TEMPLATE_T_LANG]
GO
ALTER TABLE [dbo].[Web_Menu]  WITH NOCHECK ADD  CONSTRAINT [FK_T_MENU_T_LANG] FOREIGN KEY([LangID])
REFERENCES [dbo].[Sys_Lang] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Web_Menu] NOCHECK CONSTRAINT [FK_T_MENU_T_LANG]
GO
ALTER TABLE [dbo].[Web_Menu]  WITH CHECK ADD  CONSTRAINT [FK_Web_Menu_Web_Menu] FOREIGN KEY([ID])
REFERENCES [dbo].[Web_Menu] ([ID])
GO
ALTER TABLE [dbo].[Web_Menu] CHECK CONSTRAINT [FK_Web_Menu_Web_Menu]
GO
ALTER TABLE [dbo].[Web_Resource]  WITH NOCHECK ADD  CONSTRAINT [FK_T_RESOURCE_T_LANG] FOREIGN KEY([LangID])
REFERENCES [dbo].[Sys_Lang] ([ID])
NOT FOR REPLICATION 
GO
ALTER TABLE [dbo].[Web_Resource] NOCHECK CONSTRAINT [FK_T_RESOURCE_T_LANG]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nguoi sua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoBanDauSuCo', @level2type=N'COLUMN',@level2name=N'UserID1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ten To chuc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoBanDauSuCo', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoBanDauSuCo', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lay tu chuyen muc (MenuID)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoBanDauSuCo', @level2type=N'COLUMN',@level2name=N'ChiTiet_PhanLoaiID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lay tu chuyen muc (MenuID): Da xu ly; Chua xu ly' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoBanDauSuCo', @level2type=N'COLUMN',@level2name=N'HienTrangID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Giu bi mat cho cac thong tin trong bao cao nay: Co; Khong' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoBanDauSuCo', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kien nghi, de xuat ho tro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoBanDauSuCo', @level2type=N'COLUMN',@level2name=N'ThoiGianThucHien'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kien nghi, de xuat ho tro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoBanDauSuCo', @level2type=N'COLUMN',@level2name=N'Published'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kien nghi, de xuat ho tro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoBanDauSuCo', @level2type=N'COLUMN',@level2name=N'Published1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngay sua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoBanDauSuCo', @level2type=N'COLUMN',@level2name=N'Order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nguoi sua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoKetThucSuCo', @level2type=N'COLUMN',@level2name=N'UserID1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ten To chuc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoKetThucSuCo', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoKetThucSuCo', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Lay tu chuyen muc (MenuID)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoKetThucSuCo', @level2type=N'COLUMN',@level2name=N'ChiTiet_PhanLoaiID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ten/Mo ta ve su co' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoKetThucSuCo', @level2type=N'COLUMN',@level2name=N'Summary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ket qua xu ly su co' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoKetThucSuCo', @level2type=N'COLUMN',@level2name=N'KetQua'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cac tai lieu dinh kem' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoKetThucSuCo', @level2type=N'COLUMN',@level2name=N'Files'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kien nghi, de xuat ho tro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoKetThucSuCo', @level2type=N'COLUMN',@level2name=N'Published'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kien nghi, de xuat ho tro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoKetThucSuCo', @level2type=N'COLUMN',@level2name=N'Published1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngay sua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoKetThucSuCo', @level2type=N'COLUMN',@level2name=N'Order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nguoi tao' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoSuCo', @level2type=N'COLUMN',@level2name=N'UserID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nguoi sua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoSuCo', @level2type=N'COLUMN',@level2name=N'UserID1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Trang thai: Cho; Dang xu ly; Ket thuc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoSuCo', @level2type=N'COLUMN',@level2name=N'State'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ten To chuc, ca nhan bao cao (co the lay dong tu chuc nang dang ky thanh vien mang luoi)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoSuCo', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoSuCo', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngay tao' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoSuCo', @level2type=N'COLUMN',@level2name=N'Published'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngay sua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoSuCo', @level2type=N'COLUMN',@level2name=N'Published1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngay sua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_BaoCaoSuCo', @level2type=N'COLUMN',@level2name=N'Order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Noi dung hien thi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_Comment', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DANH MỤC
CƠ QUAN NHÀ NƯỚC, ĐẢNG, TỔ CHỨC CHÍNH TRỊ - XÃ HỘI 
CẤP TRUNG ƯƠNG, TỈNH/THÀNH PHỐ, QUẬN/HUYỆN' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_CoQuan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Phan loai dau moi UCSC: Chinh; Phu...' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_DauMoiUCSC', @level2type=N'COLUMN',@level2name=N'MenuID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ten To chuc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_DauMoiUCSC', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_DauMoiUCSC', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ten Co quan chu quan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_DauMoiUCSC', @level2type=N'COLUMN',@level2name=N'ChucVu'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ten don vi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_DichVuCanhBao', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Dai IP. Moi IP tren 1 dong' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_DichVuCanhBao', @level2type=N'COLUMN',@level2name=N'IPs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nguoi sua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_DonDangKyUCSC', @level2type=N'COLUMN',@level2name=N'UserID1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ten To chuc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_DonDangKyUCSC', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_DonDangKyUCSC', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ten Co quan chu quan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_DonDangKyUCSC', @level2type=N'COLUMN',@level2name=N'ToChuc_Ten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gioi thieu hoat dong cua to chuc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_DonDangKyUCSC', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DS nhan luc, chuyen gia an toan TT, CNTT va tuong duong' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_DonDangKyUCSC', @level2type=N'COLUMN',@level2name=N'File'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngay sua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_DonDangKyUCSC', @level2type=N'COLUMN',@level2name=N'Order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cap: 1, 2, 3....' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_HeThongThongTin', @level2type=N'COLUMN',@level2name=N'MenuID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ten To chuc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_HeThongThongTin', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_HeThongThongTin', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nguoi sua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_HSThanhVienUCSC', @level2type=N'COLUMN',@level2name=N'UserID1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nguoi sua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_HSThanhVienUCSC', @level2type=N'COLUMN',@level2name=N'MenuID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ten To chuc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_HSThanhVienUCSC', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_HSThanhVienUCSC', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ten Co quan chu quan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_HSThanhVienUCSC', @level2type=N'COLUMN',@level2name=N'ToChuc_Ten'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ten Co quan chu quan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_HSThanhVienUCSC', @level2type=N'COLUMN',@level2name=N'ToChuc_TenCoQuan'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Gioi thieu hoat dong cua to chuc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_HSThanhVienUCSC', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'DS nhan luc, chuyen gia an toan TT, CNTT va tuong duong' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_HSThanhVienUCSC', @level2type=N'COLUMN',@level2name=N'File'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngay sua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_HSThanhVienUCSC', @level2type=N'COLUMN',@level2name=N'Order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chon cach thuc tu chuyen muc: Neu MenuID nay co them lua chon dang text thi phai nhap noi dung vao truong Name' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_InfoMagic', @level2type=N'COLUMN',@level2name=N'MenuID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ten To chuc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_InfoMagic', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_InfoMagic', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Bang luu cac thong tin dang ma tran, gom cac thong tin chinh:
- Danh cho ban bao cao ban dau su co nao (BaoCaoBanDauSuCoID)
- Thuoc loai nao (MenuID)
- Mo ta neu co yeu cau (Name)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_InfoMagic'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Noi dung hien thi' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_News', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Noi dung Giam Doc sua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_News', @level2type=N'COLUMN',@level2name=N'Content1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Noi dung Truong phong sua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_News', @level2type=N'COLUMN',@level2name=N'Content2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Noi dung Nhan vien viet' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_News', @level2type=N'COLUMN',@level2name=N'Custom'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nguoi sua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_SoLuongSuCo', @level2type=N'COLUMN',@level2name=N'UserID1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nguoi sua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_SoLuongSuCo', @level2type=N'COLUMN',@level2name=N'BaoCaoTongHopID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Loai su co (lay trong chuyen muc)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_SoLuongSuCo', @level2type=N'COLUMN',@level2name=N'MenuID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ten To chuc' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_SoLuongSuCo', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_SoLuongSuCo', @level2type=N'COLUMN',@level2name=N'Code'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'So su co tu xu ly' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_SoLuongSuCo', @level2type=N'COLUMN',@level2name=N'TuXuLy'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'So su co co su ho tro xu ly tu to chuc khac' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_SoLuongSuCo', @level2type=N'COLUMN',@level2name=N'ToChucHoTro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'So su co co su ho tro xu ly tu to chuc nuoc ngoai' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_SoLuongSuCo', @level2type=N'COLUMN',@level2name=N'ToChucNuocNgoaiHoTro'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'So su co de nghi VNCERT ho tro xu ly' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_SoLuongSuCo', @level2type=N'COLUMN',@level2name=N'DeNghi'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kien nghi, de xuat ho tro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_SoLuongSuCo', @level2type=N'COLUMN',@level2name=N'Published'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Kien nghi, de xuat ho tro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_SoLuongSuCo', @level2type=N'COLUMN',@level2name=N'Published1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ngay sua' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_SoLuongSuCo', @level2type=N'COLUMN',@level2name=N'Order'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chức vụ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_User', @level2type=N'COLUMN',@level2name=N'MenuID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cơ quan ban hành' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_User', @level2type=N'COLUMN',@level2name=N'CoQuanID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Danh sách cán bộ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_User'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Danh mục văn bản' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_VanBan', @level2type=N'COLUMN',@level2name=N'MenuID'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Danh sách Lĩnh vực' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_VanBan', @level2type=N'COLUMN',@level2name=N'MenuIDs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cơ quan ban hành' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_VanBan', @level2type=N'COLUMN',@level2name=N'MenuID1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Hình thức văn bản' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_VanBan', @level2type=N'COLUMN',@level2name=N'MenuID2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Danh sách Người ký duyệt (Mod_User)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_VanBan', @level2type=N'COLUMN',@level2name=N'UserIDs'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Số hiệu' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_VanBan', @level2type=N'COLUMN',@level2name=N'Name'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Trích yếu nội dung' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_VanBan', @level2type=N'COLUMN',@level2name=N'Summary'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Chi tiết văn bản' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_VanBan', @level2type=N'COLUMN',@level2name=N'Content'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Link các file Văn bản' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_VanBan', @level2type=N'COLUMN',@level2name=N'File'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Link các file Văn bản' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_VanBan', @level2type=N'COLUMN',@level2name=N'File1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Link các file Văn bản' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_VanBan', @level2type=N'COLUMN',@level2name=N'File2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Link các file Văn bản' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_VanBan', @level2type=N'COLUMN',@level2name=N'File3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Link các Văn bản liên quan' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Mod_VanBan', @level2type=N'COLUMN',@level2name=N'Urls'
GO
