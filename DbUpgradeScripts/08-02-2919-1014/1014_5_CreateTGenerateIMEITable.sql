GO
/****** Object:  Table [dbo].[MCashDenomination]    Script Date: 02/19/2019 11:22:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TGenerateIMEI](
	[PkGenerateIMEIID] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[IMEINo] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[FkVoucherNo]  [numeric](18, 0) NULL,
	[FkStockTrnNo] [numeric](18, 0) NULL,
    [ItemNo]   [numeric](18, 0) NULL,
    [IsSales]  [bit] NULL,
    [SalesStockTrnNo]   [numeric](18, 0) NULL,
    [SalesFkVoucherNo]  [numeric](18, 0) NULL,
	[IsActive] [bit] NULL,
	[UserID] [numeric](18, 0) NULL,
	[UserDate] [datetime] NULL,
	[CompanyNo] [numeric](18, 0) NULL,

 CONSTRAINT [PK_TGenerateIMEI] PRIMARY KEY CLUSTERED 
(
	[PkGenerateIMEIID] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF