
GO
/****** Object:  Table [dbo].[MPrintReportName]    Script Date: 03/06/2019 15:46:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MPrintReportName](
	[PkSrNO] [numeric](18, 0) NOT NULL,
	[ReportName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[LangReportName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ButtonType] [numeric](18, 0) NOT NULL,
	[ButtonName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[VoucherTypecode] [numeric](18, 0) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[UserId] [numeric](18, 0) NULL,
	[UserDate] [datetime] NULL,
 CONSTRAINT [PK_MPrintReportName] PRIMARY KEY CLUSTERED 
(
	[PkSrNO] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF