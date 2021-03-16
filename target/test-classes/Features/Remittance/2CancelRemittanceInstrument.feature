
Feature: Cancel Remittance Instrument Functionality

@RemittanceCancel @setUp
Scenario Outline: 1.Cancel Remittance Instrument Screen Setup
Scenario : 1.Cancel Remittance Instrument Screen Setup
Given User creates a parentReport "<parentReport>"

Examples:
|parentReport|
|Cancel Remittance Instrument|

############################################################# Cancel Remittance Instrument Entry ########################################################################################

@RemittanceCancel
Scenario Outline: 2.Cancel Remittance Instrument Entry
Scenario : 2.Cancel Remittance Instrument Entry With Cash Payment Mode
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select "<RemittanceType>" PO or DD
And user select Remittance Searial Number where "<StoreInCache>" and beneficiary name "<BeneficiaryName>" and instDate "<InstrumentDate>"
And user enters cancel reason "<CancelReason>"
Then verify "<StoreInCache>" and "<ORIG_RESP>" on Ui Originating and Payment Mode "<PaymentMode>" 
Then store number on model with name "<RespondingVoucherStoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verify Transaction_Header table TRANS_AMT "<TRANS_AMT>"  where voucher_num "<RespondingVoucherStoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction_Details table TRANS_AMT "<TRANS_AMT>" accNo "<accNo>"  where voucher_num "<RespondingVoucherStoreInCache>" and tranType "<tranType>"
Then verify REMIT_INSTRUMENT Table After Cancel voucher_num "<RespondingVoucherStoreInCache>" and tranType "<tranType>" and Pay_Mode "<PaymentMode>" and RemitNumStoreInCache "<StoreInCache>" and accNo "<accNo>" and cancelreason "<CancelReason>" 
And  user closes testCase


Examples:
|testCase|MenuName|MenuPath|RemittanceType|StoreInCache|BeneficiaryName|InstrumentDate|CancelReason|ORIG_RESP|PaymentMode|RespondingVoucherStoreInCache|KeyInCache|successMessage|TRANS_AMT|tranType|accNo|
|Cancel Remittance Instrument Entry For PO Cash |Cancel Remittance Instrument|Menu_CancelRemittanceInstrumentEntry|PO|POCashIssueRemitSrNumber|Sonal|23-Feb-2020|Invalid|Originating|Cash|POCashCancel|RemmitanceScreen_modelVoucherNum|Remittance Instrument Cancelled Successfully.|1000|T|0|
|Cancel Remittance Instrument Entry For DD Cash |Cancel Remittance Instrument|Menu_CancelRemittanceInstrumentEntry|DD|DDCashIssueRemitSrNumber|Sahil|23-Feb-2020|Incorrect|Originating|Cash|DDCashCancel|RemmitanceScreen_modelVoucherNum|Remittance Instrument Cancelled Successfully.|2000|T|0|




