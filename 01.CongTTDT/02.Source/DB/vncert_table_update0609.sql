
IF NOT EXISTS ( SELECT  * FROM    syscolumns WHERE   id = OBJECT_ID('Mod_HSThanhVienUCSC') AND name = 'ToChuc_TenKhac' )
ALTER TABLE Mod_HSThanhVienUCSC  ADD  ToChuc_TenKhac nvarchar(250) NULL
GO 
IF NOT EXISTS ( SELECT  * FROM    syscolumns WHERE   id = OBJECT_ID('Mod_HSThanhVienUCSC') AND name = 'ToChuc_TenCoQuanKhac' )
ALTER TABLE Mod_HSThanhVienUCSC  ADD  ToChuc_TenCoQuanKhac nvarchar(250) NULL
GO 
IF NOT EXISTS ( SELECT  * FROM    syscolumns WHERE   id = OBJECT_ID('Mod_HSThanhVienUCSC') AND name = 'ToChuc_SoVanBan' )
ALTER TABLE Mod_HSThanhVienUCSC  ADD  ToChuc_SoVanBan nvarchar(250) NULL
GO
IF NOT EXISTS ( SELECT  * FROM    syscolumns WHERE   id = OBJECT_ID('Web_Menu') AND name = 'Alias' )
ALTER TABLE Web_Menu  ADD  Alias nvarchar(100) NULL
GO

CREATE TABLE [dbo].[Mod_TongHopNhanLucUCSC](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[DonDangKyUCSCID] [int] NOT NULL,
	[HSThanhVienUCSCID] [int] NOT NULL,
	[MenuID] [int] NOT NULL,
	[MenuID_Value] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[UpdatedDate] [datetime] NULL,
 CONSTRAINT [PK_Mod_TongHopNhanLucUCSC] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[Mod_TongHopNhanLucUCSC] ADD  CONSTRAINT [DF_Mod_TongHopNhanLucUCSC_DonDangKyUCSCID]  DEFAULT ((0)) FOR [DonDangKyUCSCID]
GO

ALTER TABLE [dbo].[Mod_TongHopNhanLucUCSC] ADD  CONSTRAINT [DF_Mod_TongHopNhanLucUCSC_HSThanhVienUCSCID]  DEFAULT ((0)) FOR [HSThanhVienUCSCID]
GO

ALTER TABLE [dbo].[Mod_TongHopNhanLucUCSC] ADD  CONSTRAINT [DF_Mod_TongHopNhanLucUCSC_MenuID]  DEFAULT ((0)) FOR [MenuID]
GO

ALTER TABLE [dbo].[Mod_TongHopNhanLucUCSC] ADD  CONSTRAINT [DF_Table_1_MenuIDs_TrinhDoDT]  DEFAULT ((0)) FOR [MenuID_Value]
GO

ALTER TABLE [dbo].[Mod_TongHopNhanLucUCSC] ADD  CONSTRAINT [DF_Mod_TongHopNhanLucUCSC_CreatedDate]  DEFAULT (getdate()) FOR [CreatedDate]
GO

