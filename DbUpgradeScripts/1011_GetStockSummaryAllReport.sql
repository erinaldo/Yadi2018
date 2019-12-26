set ANSI_NULLS ON
set QUOTED_IDENTIFIER ON
GO
alter Procedure [dbo].[GetStockSummaryAllReport] -- exec [GetStockSummaryAllReport] 1,'1-Jan-2019','21-Jan-2019','139,946,140,742,49,139,940',1
@CompNo		           numeric(18),
@FromDate	           datetime,
@ToDate		           datetime,
@ItStr		           varchar(max),
@EsFlag                int
As
declare @VType varchar(100),@SVType varchar(100),@SRVType varchar(100),@PVType varchar(100),@PRVType varchar(100)
declare @OPVType varchar(100),@PhVType varchar(100),@ProdVType varchar(100)
if(@EsFlag=0)
begin
        set @VType='15,9,12,13,8,36'
		set @SVType='15'
		set @SRVType='12'
		set @PVType='9'
		set @PRVType='13'
      set @OPVType='36'
       set @PhVType='8'
      set @ProdVType='0'
end
else if(@EsFlag=1)
begin
        set @VType='115,109,112,113,108,136'
        set @SVType='115'
        set @SRVType='112'
		set @PVType='109'
		set @PRVType='113'
  set @OPVType='136'
       set @PhVType='108'
      set @ProdVType='1'

end

SELECT   ItemNo,sum(PurQty) AS PurQty, sum(SaleQty)  AS SaleQty,sum(PurReturnQty) AS PurReturnQty,sum(SalesReturnQty) AS SalesReturnQty,
sum(OpnOutQty) AS OpnOutQty,sum (OpnInQty) AS OpnInQty,sum (PhyOutQty) AS PhyOutQty,sum (PhyInQty) AS PhyInQty,
ItemGroupName, ItemName, Barcode,UOMH,UOMName_H,UOML,UOMName_L,HSNCode ,sum(ProdOutQty) AS ProdOutQty,sum(ProdInQty) AS ProdInQty from
(
--------Opening Stock for Out or minus---------------

SELECT     0 as StockType,   b.ItemNo, 0 AS PurQty, 0  AS SaleQty,0 AS PurReturnQty,0 AS SalesReturnQty,b.FkUomNo, MUOM_S.UOMName AS UOMName_S,   
MItemGroup.ItemGroupName,MItemMASter.ItemName,MItemMASter.Barcode,MItemMASter.UOMH,MUOM_H.UOMName AS UOMName_H,  
MItemMASter.UOML, MUOM_L.UOMName AS UOMName_L,MItemMASter.HSNCode,VoucherDate,
CASe When  MUOM_H.UOMName='KG' and MUOM_L.UOMName='GRAM' and MUOM_S.UOMName!='GRAM'  then SUM(b.Quantity)   
When  MUOM_H.UOMName='KG' and MUOM_L.UOMName='GRAM' and MUOM_S.UOMName='GRAM' then SUM(b.Quantity)/1000   
Else   SUM(b.Quantity*r.stockconversion) End AS OpnOutQty,0 AS OpnInQty,0 AS PhyOutQty,0 AS PhyInQty,0 AS ProdOutQty,0 AS ProdInQty
FROM              TStock AS b INNER JOIN
                           TVoucherEntry AS a ON b.FKVoucherNo = a.PkVoucherNo INNER JOIN
                           MRateSetting AS r ON r.PkSrNo = b.FkRateSettingNo AND b.ItemNo = r.ItemNo INNER JOIN
                           MItemMASter ON b.ItemNo =   MItemMASter.ItemNo INNER JOIN
                           MItemGroup ON   MItemMASter.GroupNo =   MItemGroup.ItemGroupNo INNER JOIN
                           MUOM AS MUOM_H ON   MItemMASter.UOMH = MUOM_H.UOMNo INNER JOIN
                           MUOM AS MUOM_L ON   MItemMASter.UOML = MUOM_L.UOMNo INNER JOIN
                           MUOM AS MUOM_S ON b.FkUomNo = MUOM_S.UOMNo 
INNER JOIN fn_Split (@ItStr,  ',') AS Bill_Itemno on b.ItemNo= CAST(Bill_Itemno.value AS numeric) 
INNER JOIN fn_Split (@VType,  ',') AS Vch on a.VoucherTypeCode= CAST(vch.value AS varchar) 
WHERE     a.VoucherDate < @FromDate AND a.IsCancel = 'False' --AND a.VoucherTypeCode IN (cast (@VType)
 and b.trncode=2
GROUP BY b.ItemNo, b.FkUomNo,MUOM_S.UOMName,MItemGroup.ItemGroupName,MItemMASter.ItemName,MItemMASter.Barcode,   
MItemMASter.UOMH, MUOM_H.UOMName,MItemMASter.UOML, MUOM_L.UOMName,MItemMASter.HSNCode,VoucherDate

--------Opening Stock in or plus---------------
union all 

SELECT     0 as StockType,   b.ItemNo, 0 AS PurQty, 0  AS SaleQty,0 AS PurReturnQty,0 AS SalesReturnQty,b.FkUomNo, MUOM_S.UOMName AS UOMName_S,   
MItemGroup.ItemGroupName,MItemMASter.ItemName,MItemMASter.Barcode,MItemMASter.UOMH,MUOM_H.UOMName AS UOMName_H,  
MItemMASter.UOML, MUOM_L.UOMName AS UOMName_L,MItemMASter.HSNCode,VoucherDate,0 AS OpnOutQty,
CASe When  MUOM_H.UOMName='KG' and MUOM_L.UOMName='GRAM' and MUOM_S.UOMName!='GRAM'  then SUM(b.Quantity)   
When  MUOM_H.UOMName='KG' and MUOM_L.UOMName='GRAM' and MUOM_S.UOMName='GRAM' then SUM(b.Quantity)/1000   
Else   SUM(b.Quantity*r.stockconversion) End AS OpnInQty,0 AS PhyOutQty,0 AS PhyInQty,0 AS ProdOutQty,0 AS ProdInQty
FROM              TStock AS b INNER JOIN
                           TVoucherEntry AS a ON b.FKVoucherNo = a.PkVoucherNo INNER JOIN
                           MRateSetting AS r ON r.PkSrNo = b.FkRateSettingNo AND b.ItemNo = r.ItemNo INNER JOIN
                           MItemMASter ON b.ItemNo =   MItemMASter.ItemNo INNER JOIN
                           MItemGroup ON   MItemMASter.GroupNo =   MItemGroup.ItemGroupNo INNER JOIN
                           MUOM AS MUOM_H ON   MItemMASter.UOMH = MUOM_H.UOMNo INNER JOIN
                           MUOM AS MUOM_L ON   MItemMASter.UOML = MUOM_L.UOMNo INNER JOIN
                           MUOM AS MUOM_S ON b.FkUomNo = MUOM_S.UOMNo 
INNER JOIN fn_Split (@ItStr,  ',') AS Bill_Itemno on b.ItemNo= CAST(Bill_Itemno.value AS numeric) 
INNER JOIN fn_Split (@VType,  ',') AS Vch on a.VoucherTypeCode= CAST(vch.value AS varchar) 
WHERE     a.VoucherDate < @FromDate AND a.IsCancel = 'False'-- AND a.VoucherTypeCode IN  (CAST(@VType as numeric)   ) 
 and b.trncode=1
GROUP BY b.ItemNo, b.FkUomNo,MUOM_S.UOMName,MItemGroup.ItemGroupName,MItemMASter.ItemName,MItemMASter.Barcode,   
MItemMASter.UOMH, MUOM_H.UOMName,MItemMASter.UOML, MUOM_L.UOMName,MItemMASter.HSNCode,VoucherDate


Union All

------------------- Sales -------------------
SELECT   1 as StockType,     b.ItemNo, 0 AS PurQty, 
CASe When  MUOM_H.UOMName='KG' and MUOM_L.UOMName='GRAM' and MUOM_S.UOMName!='GRAM'  then SUM(b.Quantity)   
When  MUOM_H.UOMName='KG' and MUOM_L.UOMName='GRAM' and MUOM_S.UOMName='GRAM' then SUM(b.Quantity)/1000   
Else   SUM(b.Quantity*r.stockconversion) End  AS SaleQty,0 AS PurReturnQty,0 AS SalesReturnQty,b.FkUomNo,MUOM_S.UOMName AS UOMName_S,
MItemGroup.ItemGroupName,MItemMASter.ItemName,MItemMASter.Barcode,MItemMASter.UOMH, MUOM_H.UOMName AS UOMName_H, 
MItemMASter.UOML, MUOM_L.UOMName AS UOMName_L,MItemMASter.HSNCode,VoucherDate,0 AS OpnOutQty,0 AS OpnInQty,0 AS PhyOutQty,0 AS PhyInQty,0 AS ProdOutQty,0 AS ProdInQty
FROM              TStock AS b INNER JOIN
                           TVoucherEntry AS a ON b.FKVoucherNo = a.PkVoucherNo INNER JOIN
                           MRateSetting AS r ON r.PkSrNo = b.FkRateSettingNo AND b.ItemNo = r.ItemNo INNER JOIN
                           MItemMASter ON b.ItemNo =   MItemMASter.ItemNo INNER JOIN
                           MItemGroup ON   MItemMASter.GroupNo =   MItemGroup.ItemGroupNo INNER JOIN
                           MUOM AS MUOM_H ON   MItemMASter.UOMH = MUOM_H.UOMNo INNER JOIN
                           MUOM AS MUOM_L ON   MItemMASter.UOML = MUOM_L.UOMNo INNER JOIN
                           MUOM AS MUOM_S ON b.FkUomNo = MUOM_S.UOMNo
INNER JOIN fn_Split (@ItStr,  ',') AS Bill_Itemno on b.ItemNo= CAST(Bill_Itemno.value AS numeric) 
INNER JOIN fn_Split (@SVType,  ',') AS Vch on a.VoucherTypeCode= CAST(vch.value AS varchar) 
WHERE        (a.VoucherDate >= @FromDate) AND (a.VoucherDate <= @ToDate) AND (a.IsCancel = 'False') --AND (a.VoucherTypeCode IN (15))
GROUP BY b.ItemNo, b.FkUomNo,MUOM_S.UOMName,   MItemGroup.ItemGroupName,MItemMASter.ItemName,MItemMASter.Barcode,
MItemMASter.UOMH, MUOM_H.UOMName,MItemMASter.UOML, MUOM_L.UOMName,MItemMASter.HSNCode,VoucherDate

Union All

------------------- Pur Return -------------------
SELECT    1 as StockType,     b.ItemNo, 0 AS PurQty, 0 AS SaleQty, 
CASe When  MUOM_H.UOMName='KG' and MUOM_L.UOMName='GRAM' and MUOM_S.UOMName!='GRAM'  then SUM(b.Quantity)   
When  MUOM_H.UOMName='KG' and MUOM_L.UOMName='GRAM' and MUOM_S.UOMName='GRAM' then SUM(b.Quantity)/1000   
Else   SUM(b.Quantity*r.stockconversion) End AS PurReturnQty,0 AS SalesReturnQty,b.FkUomNo,MUOM_S.UOMName AS UOMName_S, 
MItemGroup.ItemGroupName,MItemMASter.ItemName,MItemMASter.Barcode,MItemMASter.UOMH,MUOM_H.UOMName AS UOMName_H, 
MItemMASter.UOML, MUOM_L.UOMName AS UOMName_L,MItemMASter.HSNCode,VoucherDate,0 AS OpnOutQty,0 AS OpnInQty,0 AS PhyOutQty,0 AS PhyInQty,0 AS ProdOutQty,0 AS ProdInQty
FROM              TStock AS b INNER JOIN
                           TVoucherEntry AS a ON b.FKVoucherNo = a.PkVoucherNo INNER JOIN
                           MRateSetting AS r ON r.PkSrNo = b.FkRateSettingNo AND b.ItemNo = r.ItemNo INNER JOIN
                           MItemMASter ON b.ItemNo =   MItemMASter.ItemNo INNER JOIN
                           MItemGroup ON   MItemMASter.GroupNo =   MItemGroup.ItemGroupNo INNER JOIN
                           MUOM AS MUOM_H ON   MItemMASter.UOMH = MUOM_H.UOMNo INNER JOIN
                           MUOM AS MUOM_L ON   MItemMASter.UOML = MUOM_L.UOMNo INNER JOIN
                           MUOM AS MUOM_S ON b.FkUomNo = MUOM_S.UOMNo
INNER JOIN fn_Split (@ItStr,  ',') AS Bill_Itemno on b.ItemNo= CAST(Bill_Itemno.value AS numeric) 
INNER JOIN fn_Split (@PRVType,  ',') AS Vch on a.VoucherTypeCode= CAST(vch.value AS varchar) 
WHERE     (a.VoucherDate >= @FromDate) AND (a.VoucherDate <= @ToDate) AND (a.IsCancel = 'False') --AND (a.VoucherTypeCode IN (13))
GROUP BY b.ItemNo, b.FkUomNo,MUOM_S.UOMName,MItemGroup.ItemGroupName,MItemMASter.ItemName,MItemMASter.Barcode,
MItemMASter.UOMH, MUOM_H.UOMName,MItemMASter.UOML, MUOM_L.UOMName,MItemMASter.HSNCode,VoucherDate

Union All
------------------- Purchase -------------------
SELECT   1 as StockType, b.ItemNo, CASe When  MUOM_H.UOMName='KG' and MUOM_L.UOMName='GRAM' and MUOM_S.UOMName!='GRAM'  then SUM(b.Quantity)   
When  MUOM_H.UOMName='KG' and MUOM_L.UOMName='GRAM' and MUOM_S.UOMName='GRAM' then SUM(b.Quantity)/1000   
Else   SUM(b.Quantity*r.stockconversion) End AS PurQty, 
0 AS SaleQty,0 AS PurReturnQty, 0 AS SalesReturnQty,b.FkUomNo, MUOM_S.UOMName AS UOMName_S,MItemGroup.ItemGroupName,
MItemMASter.ItemName,MItemMASter.Barcode,MItemMASter.UOMH, MUOM_H.UOMName AS UOMName_H,MItemMASter.UOML,
MUOM_L.UOMName AS UOMName_L,MItemMASter.HSNCode,VoucherDate,0 AS OpnOutQty,0 AS OpnInQty,0 AS PhyOutQty,0 AS PhyInQty,0 AS ProdOutQty,0 AS ProdInQty
FROM              TStock AS b INNER JOIN
                           TVoucherEntry AS a ON b.FKVoucherNo = a.PkVoucherNo INNER JOIN
                           MRateSetting AS r ON r.PkSrNo = b.FkRateSettingNo AND b.ItemNo = r.ItemNo INNER JOIN
                           MItemMASter ON b.ItemNo =   MItemMASter.ItemNo INNER JOIN
                           MItemGroup ON   MItemMASter.GroupNo =   MItemGroup.ItemGroupNo INNER JOIN
                           MUOM AS MUOM_H ON   MItemMASter.UOMH = MUOM_H.UOMNo INNER JOIN
                           MUOM AS MUOM_L ON   MItemMASter.UOML = MUOM_L.UOMNo INNER JOIN
                           MUOM AS MUOM_S ON b.FkUomNo = MUOM_S.UOMNo
INNER JOIN fn_Split (@ItStr,  ',') AS Bill_Itemno on b.ItemNo= CAST(Bill_Itemno.value AS numeric) 
INNER JOIN fn_Split (@PVType,  ',') AS Vch on a.VoucherTypeCode= CAST(vch.value AS varchar) 
WHERE     (a.VoucherDate >= @FromDate) AND (a.VoucherDate <= @ToDate) AND (a.IsCancel = 'False')-- AND (a.VoucherTypeCode IN (9))
GROUP BY b.ItemNo, b.FkUomNo,MUOM_S.UOMName,MItemGroup.ItemGroupName,MItemMASter.ItemName,MItemMASter.Barcode,
MItemMASter.UOMH, MUOM_H.UOMName,MItemMASter.UOML,MUOM_L.UOMName,MItemMASter.HSNCode,VoucherDate

Union All
------------------- Sales Return -------------------
SELECT    1 as StockType,  b.ItemNo, 0 AS PurQty, 0 AS SaleQty,0 AS PurReturnQty, 
CASe When  MUOM_H.UOMName='KG' and MUOM_L.UOMName='GRAM' and MUOM_S.UOMName!='GRAM'  then SUM(b.Quantity)   
When  MUOM_H.UOMName='KG' and MUOM_L.UOMName='GRAM' and MUOM_S.UOMName='GRAM' then SUM(b.Quantity)/1000   
Else   SUM(b.Quantity*r.stockconversion) End AS SalesReturnQty,b.FkUomNo, MUOM_S.UOMName AS UOMName_S,
MItemGroup.ItemGroupName,   MItemMASter.ItemName,MItemMASter.Barcode,MItemMASter.UOMH, MUOM_H.UOMName AS UOMName_H, 
MItemMASter.UOML, MUOM_L.UOMName AS UOMName_L,MItemMASter.HSNCode,VoucherDate,0 AS OpnOutQty,0 AS OpnInQty,0 AS PhyOutQty,0 AS PhyInQty,0 AS ProdOutQty,0 AS ProdInQty
FROM              TStock AS b INNER JOIN
                           TVoucherEntry AS a ON b.FKVoucherNo = a.PkVoucherNo INNER JOIN
                           MRateSetting AS r ON r.PkSrNo = b.FkRateSettingNo AND b.ItemNo = r.ItemNo INNER JOIN
                           MItemMASter ON b.ItemNo =   MItemMASter.ItemNo INNER JOIN
                           MItemGroup ON   MItemMASter.GroupNo =   MItemGroup.ItemGroupNo INNER JOIN
                           MUOM AS MUOM_H ON   MItemMASter.UOMH = MUOM_H.UOMNo INNER JOIN
                           MUOM AS MUOM_L ON   MItemMASter.UOML = MUOM_L.UOMNo INNER JOIN
                           MUOM AS MUOM_S ON b.FkUomNo = MUOM_S.UOMNo
INNER JOIN fn_Split (@ItStr,  ',') AS Bill_Itemno on b.ItemNo= CAST(Bill_Itemno.value AS numeric) 
INNER JOIN fn_Split (@SRVType,  ',') AS Vch on a.VoucherTypeCode= CAST(vch.value AS varchar) 
WHERE         (a.VoucherDate >= @FromDate) AND (a.VoucherDate <= @ToDate) AND (a.IsCancel = 'False')-- AND (a.VoucherTypeCode IN (12))
GROUP BY b.ItemNo,b.FkUomNo,MUOM_S.UOMName,MItemGroup.ItemGroupName,MItemMASter.ItemName,MItemMASter.Barcode, 
MItemMASter.UOMH,MUOM_H.UOMName,MItemMASter.UOML, MUOM_L.UOMName,MItemMASter.HSNCode,VoucherDate

Union All
------------------- Physical stock entry minus Return -------------------
SELECT    1 as StockType,  b.ItemNo, 0 AS PurQty, 0 AS SaleQty,0 AS PurReturnQty, 
0 AS SalesReturnQty,b.FkUomNo, MUOM_S.UOMName AS UOMName_S,
MItemGroup.ItemGroupName,   MItemMASter.ItemName,MItemMASter.Barcode,MItemMASter.UOMH, MUOM_H.UOMName AS UOMName_H, 
MItemMASter.UOML, MUOM_L.UOMName AS UOMName_L,MItemMASter.HSNCode,VoucherDate,0 AS OpnOutQty,0 AS OpnInQty,CASe When  MUOM_H.UOMName='KG' and MUOM_L.UOMName='GRAM' and MUOM_S.UOMName!='GRAM'  then SUM(b.Quantity)   
When  MUOM_H.UOMName='KG' and MUOM_L.UOMName='GRAM' and MUOM_S.UOMName='GRAM' then SUM(b.Quantity)/1000   
Else   SUM(b.Quantity*r.stockconversion) End AS PhyOutQty,0 AS PhyInQty,0 AS ProdOutQty,0 AS ProdInQty
FROM              TStock AS b INNER JOIN
                           TVoucherEntry AS a ON b.FKVoucherNo = a.PkVoucherNo INNER JOIN
                           MRateSetting AS r ON r.PkSrNo = b.FkRateSettingNo AND b.ItemNo = r.ItemNo INNER JOIN
                           MItemMASter ON b.ItemNo =   MItemMASter.ItemNo INNER JOIN
                           MItemGroup ON   MItemMASter.GroupNo =   MItemGroup.ItemGroupNo INNER JOIN
                           MUOM AS MUOM_H ON   MItemMASter.UOMH = MUOM_H.UOMNo INNER JOIN
                           MUOM AS MUOM_L ON   MItemMASter.UOML = MUOM_L.UOMNo INNER JOIN
                           MUOM AS MUOM_S ON b.FkUomNo = MUOM_S.UOMNo
INNER JOIN fn_Split (@ItStr,  ',') AS Bill_Itemno on b.ItemNo= CAST(Bill_Itemno.value AS numeric) 
INNER JOIN fn_Split (@PhVType,  ',') AS Vch on a.VoucherTypeCode= CAST(vch.value AS varchar) 

WHERE         (a.VoucherDate >= @FromDate) AND (a.VoucherDate <= @ToDate) AND (a.IsCancel = 'False') --AND (a.VoucherTypeCode IN (8)) 
and b.trncode=2
GROUP BY b.ItemNo,b.FkUomNo,MUOM_S.UOMName,MItemGroup.ItemGroupName,MItemMASter.ItemName,MItemMASter.Barcode, 
MItemMASter.UOMH,MUOM_H.UOMName,MItemMASter.UOML, MUOM_L.UOMName,MItemMASter.HSNCode,VoucherDate
Union All
------------------- Physical stock entry plus Return -------------------
SELECT    1 as StockType,  b.ItemNo, 0 AS PurQty, 0 AS SaleQty,0 AS PurReturnQty, 
0 AS SalesReturnQty,b.FkUomNo, MUOM_S.UOMName AS UOMName_S,
MItemGroup.ItemGroupName,   MItemMASter.ItemName,MItemMASter.Barcode,MItemMASter.UOMH, MUOM_H.UOMName AS UOMName_H, 
MItemMASter.UOML, MUOM_L.UOMName AS UOMName_L,MItemMASter.HSNCode,VoucherDate,0 AS OpnOutQty,0 AS OpnInQty,0 AS PhyOutQty,CASe When  MUOM_H.UOMName='KG' and MUOM_L.UOMName='GRAM' and MUOM_S.UOMName!='GRAM'  then SUM(b.Quantity)   
When  MUOM_H.UOMName='KG' and MUOM_L.UOMName='GRAM' and MUOM_S.UOMName='GRAM' then SUM(b.Quantity)/1000   
Else   SUM(b.Quantity*r.stockconversion) End  AS PhyInQty,0 AS ProdOutQty,0 AS ProdInQty
FROM              TStock AS b INNER JOIN
                           TVoucherEntry AS a ON b.FKVoucherNo = a.PkVoucherNo INNER JOIN
                           MRateSetting AS r ON r.PkSrNo = b.FkRateSettingNo AND b.ItemNo = r.ItemNo INNER JOIN
                           MItemMASter ON b.ItemNo =   MItemMASter.ItemNo INNER JOIN
                           MItemGroup ON   MItemMASter.GroupNo =   MItemGroup.ItemGroupNo INNER JOIN
                           MUOM AS MUOM_H ON   MItemMASter.UOMH = MUOM_H.UOMNo INNER JOIN
                           MUOM AS MUOM_L ON   MItemMASter.UOML = MUOM_L.UOMNo INNER JOIN
                           MUOM AS MUOM_S ON b.FkUomNo = MUOM_S.UOMNo
INNER JOIN fn_Split (@ItStr,  ',') AS Bill_Itemno on b.ItemNo= CAST(Bill_Itemno.value AS numeric) 
INNER JOIN fn_Split (@PhVType,  ',') AS Vch on a.VoucherTypeCode= CAST(vch.value AS varchar) 

WHERE         (a.VoucherDate >= @FromDate) AND (a.VoucherDate <= @ToDate) AND (a.IsCancel = 'False') --AND (a.VoucherTypeCode IN (8))
 and b.trncode=1
GROUP BY b.ItemNo,b.FkUomNo,MUOM_S.UOMName,MItemGroup.ItemGroupName,MItemMASter.ItemName,MItemMASter.Barcode, 
MItemMASter.UOMH,MUOM_H.UOMName,MItemMASter.UOML, MUOM_L.UOMName,MItemMASter.HSNCode,VoucherDate


union all 
SELECT     1 AS StockType, MItemMaster.ItemNo, 0 AS PurQty, 0 AS SaleQty, 0 AS PurReturnQty, 0 AS SalesReturnQty,0 as FkUomNo,'' AS UOMName_S,
                      MItemGroup.ItemGroupName, MItemMaster.ItemName, MItemMaster.Barcode, MItemMaster.UOMH, MUOM_H.UOMName AS UOMName_H, MItemMaster.UOML, 
                      MUOM_L.UOMName AS UOMName_L,
MItemMASter.HSNCode,RDate as VoucherDate,0 AS OpnOutQty,0 AS OpnInQty,0 AS PhyOutQty,0 AS PhyInQty,
 0 AS ProdOutQty,sum( MRecipeMain.ProdQty ) AS ProdInQty
FROM         MItemGroup INNER JOIN
                      MItemMaster ON MItemGroup.ItemGroupNo = MItemMaster.GroupNo INNER JOIN
                      MUOM ON MItemMaster.UOML = MUOM.UOMNo INNER JOIN
                      MUOM AS MUOM_H ON MItemMaster.UOMH = MUOM_H.UOMNo INNER JOIN
                      MUOM AS MUOM_L ON MItemMaster.UOML = MUOM_L.UOMNo INNER JOIN
                      MRecipeMain ON MItemMaster.ItemNo = MRecipeMain.FinishItemID
INNER JOIN fn_Split (@ItStr,  ',') AS Bill_Itemno on MRecipeMain.FinishItemID= CAST(Bill_Itemno.value AS numeric) 
INNER JOIN fn_Split (@ProdVType,  ',') AS Vch on MRecipeMain.esflag= CAST(vch.value AS varchar)
WHERE     (MRecipeMain.RecipeType = 2)-- and (MRecipeMain.RDate >= @FromDate) AND (MRecipeMain.RDate  <= @ToDate)
 AND (MRecipeMain.IsActive = 'True') 
GROUP BY MItemMaster.ItemNo, MItemMaster.UOML, MItemMaster.ItemName, MItemGroup.ItemGroupName, MUOM.UOMName, MItemMaster.Barcode, MItemMaster.UOMH, 
                      MUOM_H.UOMName, MItemMaster.UOML, MUOM_L.UOMName,MItemMASter.HSNCode,RDate

union all 

SELECT     1 AS StockType, MItemMaster.ItemNo, 0 AS PurQty, 0 AS SaleQty, 0 AS PurReturnQty, 0 AS SalesReturnQty, 0 AS FkUomNo, '' AS UOMName_S, 
                      MItemGroup.ItemGroupName, MItemMaster.ItemName, MItemMaster.Barcode, MItemMaster.UOMH, MUOM_H.UOMName AS UOMName_H, MItemMaster.UOML, 
                      MUOM_L.UOMName AS UOMName_L, MItemMaster.HSNCode, MRecipeMain.RDate AS VoucherDate, 0 AS OpnOutQty, 0 AS OpnInQty, 0 AS PhyOutQty, 0 AS PhyInQty, 
                      sum(MRecipeSub.FinalQty) AS ProdOutQty,0 AS ProdInQty
FROM         MItemGroup INNER JOIN
                      MItemMaster ON MItemGroup.ItemGroupNo = MItemMaster.GroupNo INNER JOIN
                      MUOM ON MItemMaster.UOML = MUOM.UOMNo INNER JOIN
                      MUOM AS MUOM_H ON MItemMaster.UOMH = MUOM_H.UOMNo INNER JOIN
                      MUOM AS MUOM_L ON MItemMaster.UOML = MUOM_L.UOMNo INNER JOIN
                      MRecipeSub ON MItemMaster.ItemNo = MRecipeSub.RawProductID INNER JOIN
                      MRecipeMain ON MRecipeMain.MRecipeID = MRecipeSub.FKMRecipeID
INNER JOIN fn_Split (@ItStr,  ',') AS Bill_Itemno on MRecipeSub.RawProductID= CAST(Bill_Itemno.value AS numeric) 
INNER JOIN fn_Split (@ProdVType,  ',') AS Vch on MRecipeMain.esflag= CAST(vch.value AS varchar)
WHERE     (MRecipeMain.RecipeType = 2) and (MRecipeMain.RDate >= @FromDate) AND (MRecipeMain.RDate  <= @ToDate) AND (MRecipeMain.IsActive = 'True') 
GROUP BY MItemMaster.ItemNo, MItemMaster.UOML, MItemMaster.ItemName, MItemGroup.ItemGroupName, MUOM.UOMName, MItemMaster.Barcode, MItemMaster.UOMH, 
                      MUOM_H.UOMName, MItemMaster.UOML, MUOM_L.UOMName, MItemMaster.HSNCode, MRecipeMain.RDate


)AS tbl
GROUP BY ItemNo,ItemGroupName, ItemName, Barcode, UOMH,UOMName_H,UOML,UOMName_L,HSNCode
Order BY ItemGroupName, ItemName











