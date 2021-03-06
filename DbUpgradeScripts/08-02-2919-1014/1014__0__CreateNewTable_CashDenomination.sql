
GO
/****** Object:  Table [dbo].[MCashDenomination]    Script Date: 02/13/2019 11:48:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MCashDenomination](
	[CashDenominationNo] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[Note] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RSType] [numeric](18, 0) NULL,
	[SerialNo] [numeric](18, 0) NULL,
	[IsActive] [bit] NULL,
	[UserID] [numeric](18, 0) NULL,
	[UserDate] [datetime] NULL,
	[CompanyNo] [numeric](18, 0) NULL,
 CONSTRAINT [PK_MCashDenomination] PRIMARY KEY CLUSTERED 
(
	[CashDenominationNo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

/*****************************************************************************************************************/

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
--Created on 01/11/2011
Create PROCEDURE [dbo].[AddMCashDenomination]
     @CashDenominationNo              numeric(18),
     @Note                            varchar(50),
     @RSType                          numeric(18),  
     @SerialNo                        numeric(18),  
     @IsActive                        bit,
     @UserID                          numeric(18),
     @UserDate                        datetime,
	 @CompanyNo						  numeric(18)

AS
IF EXISTS(select CashDenominationNo from MCashDenomination
          where
          CashDenominationNo = @CashDenominationNo)
     BEGIN
       --Update existing row
       UPDATE MCashDenomination
       SET
          Note = @Note,
          RSType=@RSType,
          SerialNo = @SerialNo,
          IsActive = @IsActive,
          UserID = @UserID,
          UserDate = @UserDate,
	      CompanyNo=@CompanyNo

       WHERE
          CashDenominationNo = @CashDenominationNo

     END
ELSE
     BEGIN
       --Insert new row
       Declare @Id numeric
       SELECT @Id=IsNull(Max(CashDenominationNo),0) From MCashDenomination
       DBCC CHECKIDENT('MCashDenomination', RESEED, @Id)
       INSERT INTO MCashDenomination(
          Note,
          RSType,
          SerialNo,
          IsActive,
          UserID,
          UserDate,
		  CompanyNo
)
       VALUES(
          @Note,
          @RSType,
          @SerialNo,
          @IsActive,
          @UserID,
          @UserDate,
	      @CompanyNo
)

END


/*****************************************************************************************************************/
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
--Created on 01/11/2011
Create PROCEDURE  [dbo].[DeleteMCashDenomination] 
@CashDenominationNo                             numeric(18)


AS
Update MCashDenomination set IsActive='False' where CashDenominationNo = @CashDenominationNo
--       DELETE FROM MCashDenomination
--       WHERE
--          CashDenominationNo = @CashDenominationNo


/*****************************************************************************************************************/

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[RptTDocketPrinting]
@DocketPrintingNo numeric(18)

As

SELECT     MLedger.LedgerName, TVoucherChqCreditDetails.ChequeNo, TVoucherChqCreditDetails.ChequeDate, MBranch.BranchName, TVoucherEntry.BilledAmount, 
                      TDocketPrintingDetails.Remark, '' AS Status, TDocketPrinting.DocketUserNo, TDocketPrinting.FromDate, TDocketPrinting.ToDate, 
                      MLedger_1.LedgerName AS DepositeTo, MLedgerDetails.AccountNo AS PANNo
FROM         MLedger INNER JOIN
                      TVoucherDetails ON MLedger.LedgerNo = TVoucherDetails.LedgerNo INNER JOIN
                      TVoucherEntry INNER JOIN
                      TVoucherChqCreditDetails ON TVoucherEntry.PkVoucherNo = TVoucherChqCreditDetails.FKVoucherNo ON 
                      TVoucherDetails.PkVoucherTrnNo = TVoucherChqCreditDetails.FkVoucherTrnNo INNER JOIN
                      MBranch ON TVoucherChqCreditDetails.BranchNo = MBranch.BranchNo INNER JOIN
                      TDocketPrintingDetails ON TVoucherEntry.PkVoucherNo = TDocketPrintingDetails.FkVoucherNo INNER JOIN
                      TDocketPrinting ON TDocketPrintingDetails.DocketPrintingNo = TDocketPrinting.DocketPrintingNo INNER JOIN
                      MLedger AS MLedger_1 ON TDocketPrinting.LedgerNo = MLedger_1.LedgerNo LEFT OUTER JOIN
                      MLedgerDetails ON MLedger_1.LedgerNo = MLedgerDetails.LedgerNo
WHERE     (TVoucherEntry.CompanyNo = 1) AND (TVoucherEntry.PayTypeNo = 4) AND (TVoucherDetails.SrNo = 501) AND (TDocketPrintingDetails.DocketPrintingNo = @DocketPrintingNo)
ORDER BY MLedger.LedgerName

/*****************************************************************************************************************/
GO
/****** Object:  Table [dbo].[TCashSlip]  Script Date: 02/14/2019 12:45:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TCashSlip](
	[CashSlipNo] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[DocketUserNo] [numeric](18, 0) NULL,
	[ToDate] [datetime] NULL,
	[LedgerNo] [numeric](18, 0) NULL,
	[UserID] [numeric](18, 0) NULL,
	[UserDate] [datetime] NULL,
	[CompanyNo] [numeric](18, 0) NULL

 CONSTRAINT [PK_TCashSlip] PRIMARY KEY CLUSTERED 
(
	[CashSlipNo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

/*****************************************************************************************************************/

GO
/****** Object:  Table [dbo].[TCashSlipDetails] Script Date: 02/14/2019 12:47:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TCashSlipDetails](
	[CashSlipDetailsNo] [numeric](18, 0) IDENTITY(1,1) NOT NULL,
	[CashSlipNo]  [numeric](18, 0) NULL,
	[Note] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RSType] [numeric](18, 0) NULL,
	[Pieces] [numeric](18, 0) NULL,
	[Amount] [numeric](18, 2) NULL,
    [IsActive] [bit] NULL,
	[UserID] [numeric](18, 0) NULL,
	[UserDate] [datetime] NULL,
	[CompanyNo] [numeric](18, 0) NULL,
	[Status] [numeric](18, 0) NULL,

 CONSTRAINT [PK_TCashSlipDetails] PRIMARY KEY CLUSTERED 
(
	[CashSlipDetailsNo] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF

/*****************************************************************************************************************/
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
--Created on 19/12/2014
Create PROCEDURE [dbo].[AddTCashSlip]
     @CashSlipNo                            numeric(18),
     @DocketUserNo                          numeric(18),
     @ToDate                                datetime,
     @LedgerNo                              numeric(18),
     @UserID                                numeric(18),
     @UserDate                              datetime,
     @CompanyNo                             numeric(18),
     @ReturnID                              int output
AS
IF EXISTS(select CashSlipNo from TCashSlip
          where
          CashSlipNo = @CashSlipNo)
     BEGIN
       --Update existing row
       UPDATE TCashSlip
       SET
          DocketUserNo = @DocketUserNo,
          ToDate = @ToDate,
          LedgerNo = @LedgerNo,
          UserID = @UserID,
          UserDate = @UserDate,
          CompanyNo = @CompanyNo

       WHERE
          CashSlipNo = @CashSlipNo
		  set @ReturnID = @CashSlipNo

     END
ELSE
     BEGIN
       --Insert new row
       Declare @Id numeric
       SELECT @Id=IsNull(Max(CashSlipNo),0) From TCashSlip
       DBCC CHECKIDENT('TCashSlip', RESEED, @Id)
       INSERT INTO TCashSlip(
          DocketUserNo,
          ToDate,
          LedgerNo,
          UserID,
          UserDate,
          CompanyNo
)
       VALUES(
          @DocketUserNo,
          @ToDate,
          @LedgerNo,
          @UserID,
          @UserDate,
          @CompanyNo
)
set @ReturnID = Scope_Identity()
END
GO

/*****************************************************************************************************************/
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
--Created on 19/12/2014
Create PROCEDURE [dbo].[AddTCashSlipDetails]
     @CashSlipDetailsNo               numeric(18),
     @CashSlipNo                      numeric(18),
     @Note                            varchar(50),
     @RSType                          numeric(18),  
     @Pieces                          numeric(18),  
     @Amount                          numeric(18,2),  
     @IsActive                        bit,
     @UserID                          numeric(18),
     @UserDate                        datetime,
     @CompanyNo                       numeric(18)
     
AS
IF EXISTS(select CashSlipDetailsNo from TCashSlipDetails
          where
          CashSlipDetailsNo = @CashSlipDetailsNo)
     BEGIN
       --Update existing row
       UPDATE TCashSlipDetails
       SET
          CashSlipNo = @CashSlipNo,
          Note = @Note,
          RSType=@RSType,
          Pieces = @Pieces,
          Amount=@Amount,
          IsActive = @IsActive,
          UserID = @UserID,
          UserDate = @UserDate,
          CompanyNo = @CompanyNo

       WHERE
          CashSlipDetailsNo = @CashSlipDetailsNo

     END
ELSE
     BEGIN
       --Insert new row
       Declare @Id numeric
       SELECT @Id=IsNull(Max(CashSlipDetailsNo),0) From TCashSlipDetails
       DBCC CHECKIDENT('TCashSlipDetails', RESEED, @Id)
       INSERT INTO TCashSlipDetails(
          CashSlipNo,
          Note,
          RSType,
          Pieces,
          Amount,
          IsActive,
          UserID,
          UserDate,
          CompanyNo
)
       VALUES(
          @CashSlipNo,
          @Note,
          @RSType,
          @Pieces,
          @Amount,
          @IsActive,
          @UserID,
          @UserDate,
          @CompanyNo
)

END

/*****************************************************************************************************************/
set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
create PROCEDURE  [dbo].[DeleteTCashSlip] 
@CashSlipNo                       numeric(18)

AS
DELETE FROM TCashSlipDetails 
       WHERE
          CashSlipNo = @CashSlipNo

DELETE FROM TCashSlip
       WHERE
          CashSlipNo = @CashSlipNo

/*****************************************************************************************************************/

set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
create PROCEDURE  [dbo].[DeleteTCashSlipDetails] 
@CashSlipDetailsNo                     numeric(18)

AS
DELETE FROM TCashSlipDetails 
       WHERE
          CashSlipDetailsNo = @CashSlipDetailsNo

/*****************************************************************************************************************/
