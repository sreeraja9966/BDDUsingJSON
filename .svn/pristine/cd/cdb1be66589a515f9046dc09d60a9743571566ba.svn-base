
Feature: Remittance Instrument Issue Functionality

@RemittanceIssue @setUp
Scenario Outline: 1.Remittance Instrument Issue Screen Setup
Scenario : 1.Remittance Instrument Issue Screen Setup
Given User creates a parentReport "<parentReport>"

Examples:
|parentReport|
|Remittance Instrument Issue|

####################################################################### Remittance Instrument Issue Entry ########################################################################################

@RemittanceIssue
Scenario Outline: 2.Remittance Instrument Issue Entry
Scenario : 2.Remittance Instrument Issue Entry With Cash Payment Mode
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select "<RemittanceType>" PO or DD
Then Verify "<ORIG_RESP>" on Ui Originating
And user select "<PaymentMode>" Cash or Transfer
And user enters "<Amount>" 
Then verify Remittance Commition "<RemittanceCommition>" and CGST "<CGST>" and SGST "<SGST>" where chargeTypeId "<chargeTypeId>"
Then Verify "<PayableAtPar>" Yes or No
And user enters beneficiary name "<BeneficiaryName>" 
Then Verify "<BranchId>" is BRANCHPARAMETERS Logged In Branch Current_DT
Then Verify "<Bank>" is BANKPARAMETERS Logged In Bank BANK_NAME
Then Verify "<City>" is BRANCHPARAMETERS Logged In Branch CITY
Then Verify "<Branch>" is BRANCHPARAMETERS Logged In Branch BRANCHNAME
Then user click on Remittance Instrument Issue Screen submit
When user click on Remittance Instrument Issue Screen confirm
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verify Transaction_Header table TRANS_AMT "<AddingChargesAmount>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction_Details Table TRANS_AMT "<Amount>" accNo "<accNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" and Remittance Commition "<RemittanceCommition>" and CGST "<CGST>" and SGST "<SGST>" and AddingChargesAmount "<AddingChargesAmount>"  
Then verify REMIT_INSTRUMENT Table Remittance_AMT "<Amount>" Pay_Mode "<PaymentMode>"  where voucher_num "<StoreInCache>" and ORIG_RESP "<ORIG_RESP>"  and tranType "<tranType>" and remittanceType "<RemittanceType>" and beneficiaryName "<BeneficiaryName>" and accNo "<accNo>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|RemittanceType|ORIG_RESP|PaymentMode|Amount|PayableAtPar|BeneficiaryName|BranchId|Bank|City|Branch|StoreInCache|successMessage|KeyInCache|tranType|accNo|RemittanceCommition|CGST|SGST|chargeTypeId|AddingChargesAmount|
|Remittance Instrument Issue Entry For PO Cash |Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|PO|Originating|Cash|1000|Yes|Sonal|2101|SBI|Pune|City Branch|POCashIssue|Remittance Instrument Issued successfully.|RemmitanceScreen_modelVoucherNum|D|0|13.50|2.43|1.22|2|1017.15|
|Remittance Instrument Issue Entry For DD Cash |Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|DD|Originating|Cash|2000|No|Sahil|2101|SBI|Pune|City Branch|DDCashIssue|Remittance Instrument Issued successfully.|RemmitanceScreen_modelVoucherNum|D|0|13.50|2.43|1.22|2|2017.15|
|Remittance Instrument Issue Entry of PO Cash For Cash Receipt Rejection |Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|PO|Originating|Cash|2000|Yes|Samir|2101|SBI|Pune|City Branch|POCashIssueCashReceiptReject|Remittance Instrument Issued successfully.|RemmitanceScreen_modelVoucherNum|D|0|13.50|2.43|1.22|2|2017.15|
|Remittance Instrument Issue Entry of DD Cash For Cash Receipt Rejection |Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|DD|Originating|Cash|1000|No|Sunny|2101|SBI|Pune|City Branch|DDCashIssueCashReceiptReject|Remittance Instrument Issued successfully.|RemmitanceScreen_modelVoucherNum|D|0|13.50|2.43|1.22|2|1017.15|
|Remittance Instrument Issue Entry of PO Cash For Rejection|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|PO|Originating|Cash|2000|Yes|Sonam|2101|SBI|Pune|City Branch|POCashIssueReject|Remittance Instrument Issued successfully.|RemmitanceScreen_modelVoucherNum|D|0|13.50|2.43|1.22|2|2017.15|
|Remittance Instrument Issue Entry of DD Cash For Rejection|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|DD|Originating|Cash|1000|No|Anil|2101|SBI|Pune|City Branch|DDCashIssueReject|Remittance Instrument Issued successfully.|RemmitanceScreen_modelVoucherNum|D|0|13.50|2.43|1.22|2|1017.15|
   

Scenario Outline: 3.Cash Receipt Entry Deno_Master
Scenario : 3.Denom Master Verification
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then verify DENO_MASTER Table Denom_Rate "<DenomRateUiXpath>" where bankCode "<bankcode>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|DenomRateUiXpath|bankcode|
|Denom Master Ui Verification|Cash Receipt Entry|Menu_CashReceiptEntry|//div[@id='cashreceiptentry']|101|


Scenario Outline: 4.Cash Receipt Entry Userwise_Denom
Scenario : 4.Userwise_Denom Verification
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then Verify UserwiseDenom table with "<DenomRateUiXpath>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|DenomRateUiXpath|
|Userwise_Denom Ui Verification|Cash Receipt Entry|Menu_CashReceiptEntry|//div[@id='cashreceiptentry']|

@RemittanceIssue
Scenario Outline: 5.Remittance Instrument Issue Cash Receipt Entry
Scenario : 5.PO Cash Receipt Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select VoucherNumber where voucher_num "<StoreInCache>"
Then Verify "<TotalTransactionAmount>" on Ui TotalTransAmount
Given user Enter FromDenom for "<StoreInCache>" with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then Store User Denom Before Transaction with name "<StoreInCache>" where  DenomY_N "<DenomY_N>" and  bankCode "<bankcode>" and userId "<userId>"
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then verify TRANSACTION_HEADER Table where voucher_num "<StoreInCache>" and status "<tranType>" 
And  user closes testCase
Examples:

|testCase|MenuName|MenuPath|StoreInCache|TotalTransactionAmount|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|successMessage|DenomRateUiXpath|bankcode|userId|tranType|DenomY_N|
|PO Cash Receipt Entry|Cash Receipt Entry|Menu_CashReceiptEntry|POCashIssue|1017.15|0|2|0|0|0|0|0|17|15|0|0|0|0|0|0|0|0|0|Denomination Entered Successfully. |//div[@id='userwiseDenominationModel']|101|555|D|Y|
|DD Cash Receipt Entry|Cash Receipt Entry|Menu_CashReceiptEntry|DDCashIssue|2017.15|1|0|0|0|0|0|0|17|15|0|0|0|0|0|0|0|0|0|Denomination Entered Successfully. |//div[@id='userwiseDenominationModel']|101|555|D|Y|
|PO Cash Receipt Entry for Rejection|Cash Receipt Entry|Menu_CashReceiptEntry|POCashIssueReject|2017.15|1|0|0|0|0|0|0|17|15|0|0|0|0|0|0|0|0|0|Denomination Entered Successfully. |//div[@id='userwiseDenominationModel']|101|555|D|Y|
|DD Cash Receipt Entry for Rejection|Cash Receipt Entry|Menu_CashReceiptEntry|DDCashIssueReject|1017.15|0|2|0|0|0|0|0|17|15|0|0|0|0|0|0|0|0|0|Denomination Entered Successfully. |//div[@id='userwiseDenominationModel']|101|555|D|Y|


Scenario Outline: 6.Remittance Instrument Issue Entry
Scenario : 6.Remittance Instrument Issue Entry With Transfer Debit Account Chq_Holder='N'
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select "<RemittanceType>" PO or DD
Then Verify "<ORIG_RESP>" on Ui Originating
And user select "<PaymentMode>" Cash or Transfer
And user enters Debit Account Number"<accNo>" 
And user enters "<Amount>" 
Then verify Remittance Commition "<RemittanceCommition>" and CGST "<CGST>" and SGST "<SGST>" where chargeTypeId "<chargeTypeId>"
Then Verify "<PayableAtPar>" Yes or No
And user enters beneficiary name "<BeneficiaryName>"
Then Verify "<BranchId>" is BRANCHPARAMETERS Logged In Branch Current_DT
Then Verify "<Bank>" is BANKPARAMETERS Logged In Bank BANK_NAME
Then Verify "<City>" is BRANCHPARAMETERS Logged In Branch CITY
Then Verify "<Branch>" is BRANCHPARAMETERS Logged In Branch BRANCHNAME
Then user click on Remittance Instrument Issue Screen submit
When user click on Remittance Instrument Issue Screen confirm
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verify Transaction_Header table TRANS_AMT "<AddingChargesAmount>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction_Details Table TRANS_AMT "<Amount>" accNo "<accNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" and Remittance Commition "<RemittanceCommition>" and CGST "<CGST>" and SGST "<SGST>" and AddingChargesAmount "<AddingChargesAmount>"
Then verify REMIT_INSTRUMENT Table Remittance_AMT "<Amount>" Pay_Mode "<PaymentMode>"  where voucher_num "<StoreInCache>" and ORIG_RESP "<ORIG_RESP>"  and tranType "<tranType>" and remittanceType "<RemittanceType>" and beneficiaryName "<BeneficiaryName>" and accNo "<accNo>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|RemittanceType|ORIG_RESP|PaymentMode|Amount|PayableAtPar|accNo|BeneficiaryName|BranchId|Bank|City|Branch|successMessage|StoreInCache|KeyInCache|tranType|RemittanceCommition|CGST|SGST|chargeTypeId|AddingChargesAmount|
|Remittance Instrument Issue Entry For PO Transfer Chq_Holder 'N'|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|PO|Originating|Transfer|3000|Yes|101210101010000100|Sayali|2101|SBI|Pune|City Branch|Remittance Instrument Issued successfully.|POTransferIssueChqHolderN|RemmitanceScreen_modelVoucherNum|T|10.50|1.89|0.95|2|3013.34|
|Remittance Instrument Issue Entry For DD Transfer Chq_Holder 'N'|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|DD|Originating|Transfer|1000|No|101210101000000560|Sagar|2101|SBI|Pune|City Branch|Remittance Instrument Issued successfully.|DDTransferIssueChqHolderN|RemmitanceScreen_modelVoucherNum|T|10.50|1.89|0.95|2|1013.34|
|Remittance Issue Entry For PO Transfer Chq_Holder 'N' for Rejection|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|PO|Originating|Transfer|3000|Yes|101210101010000100|Sunil|2101|SBI|Pune|City Branch|Remittance Instrument Issued successfully.|POTransferIssueChqHolderNReject|RemmitanceScreen_modelVoucherNum|T|10.50|1.89|0.95|2|3013.34|
|Remittance Issue Entry For DD Transfer Chq_Holder 'N' for Rejection|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|DD|Originating|Transfer|1000|No|101210101000000560|Sapna|2101|SBI|Pune|City Branch|Remittance Instrument Issued successfully.|DDTransferIssueChqHolderNReject|RemmitanceScreen_modelVoucherNum|T|10.50|1.89|0.95|2|1013.34|


Scenario Outline: 7.Remittance Instrument Issue Entry
Scenario : 7.Remittance Instrument Issue Entry With Transfer Debit Account Chq_Holder='Y'
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select "<RemittanceType>" PO or DD
Then Verify "<ORIG_RESP>" on Ui Originating
And user select "<PaymentMode>" Cash or Transfer
And user enters Debit Account Number"<accNo>"
And user enters "<Amount>" 
Then verify Remittance Commition "<RemittanceCommition>" and CGST "<CGST>" and SGST "<SGST>" where chargeTypeId "<chargeTypeId>"
Then Verify "<PayableAtPar>" Yes or No
And user select Instrument Type "<InstrumentType>" from Instrument Type dropdown
And user enters Instrument Date "<InstrumentDateUi>"
And user enters Instrument Number"<InstrumentNumber>"
And user enters beneficiary name "<BeneficiaryName>"
And user enters Create Date "<CreateDate>"
Then Verify "<BranchId>" is BRANCHPARAMETERS Logged In Branch Current_DT
Then Verify "<Bank>" is BANKPARAMETERS Logged In Bank BANK_NAME
Then Verify "<City>" is BRANCHPARAMETERS Logged In Branch CITY
Then Verify "<Branch>" is BRANCHPARAMETERS Logged In Branch BRANCHNAME
Then user click on Remittance Instrument Issue Screen submit
When user click on Remittance Instrument Issue Screen confirm
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verify Transaction_Header table TRANS_AMT "<AddingChargesAmount>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction_Details Table TRANS_AMT "<Amount>" accNo "<accNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" and Remittance Commition "<RemittanceCommition>" and CGST "<CGST>" and SGST "<SGST>" and AddingChargesAmount "<AddingChargesAmount>"
Then Verify Transaction_Details with Instrument Deatils Instrument Type "<InstrumentTypeCode>" Instrument Number "<InstrumentNumber>" Instrument Date "<InstrumentDateDb>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify REMIT_INSTRUMENT Table Remittance_AMT "<Amount>" Pay_Mode "<PaymentMode>"  where voucher_num "<StoreInCache>" and ORIG_RESP "<ORIG_RESP>"  and tranType "<tranType>" and remittanceType "<RemittanceType>" and beneficiaryName "<BeneficiaryName>" and accNo "<accNo>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|RemittanceType|ORIG_RESP|PaymentMode|Amount|PayableAtPar|accNo|InstrumentType|CreateDate|InstrumentNumber|InstrumentTypeCode|InstrumentDateUi|BeneficiaryName|InstrumentDateDb|BranchId|Bank|City|Branch|successMessage|StoreInCache|KeyInCache|tranType|RemittanceCommition|CGST|SGST|chargeTypeId|AddingChargesAmount|
|Remittance Instrument Issue Entry For PO Transfer Chq_Holder 'Y'|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|PO|Originating|Transfer|3000|Yes|101210101100000404|Saving Account|23/02/2020|1|10|21/02/2020|Rahul|2020-02-21|2101|SBI|Pune|City Branch|Remittance Instrument Issued successfully.|POTransferIssueChqHolderY|RemmitanceScreen_modelVoucherNum|T|10.50|1.89|0.95|2|3013.34|
|Remittance Instrument Issue Entry For DD Transfer Chq_Holder 'Y'|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|DD|Originating|Transfer|1000|No|101210101100000405|Saving Account|23/02/2020|5|10|20/02/2020|Radhika|2020-02-20|2101|SBI|Pune|City Branch|Remittance Instrument Issued successfully.|DDTransferIssueChqHolderY|RemmitanceScreen_modelVoucherNum|T|10.50|1.89|0.95|2|1013.34|
|Remittance Issue Entry For PO Transfer Chq_Holder 'Y' for Rejection|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|PO|Originating|Transfer|3000|Yes|101210101100000404|Saving Account|23/02/2020|1|10|21/02/2020|Rishi|2020-02-21|2101|SBI|Pune|City Branch|Remittance Instrument Issued successfully.|POTransferIssueChqHolderYReject|RemmitanceScreen_modelVoucherNum|T|10.50|1.89|0.95|2|3013.34|
|Remittance Issue Entry For DD Transfer Chq_Holder 'Y' for Rejection|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|DD|Originating|Transfer|1000|No|101210101100000405|Saving Account|23/02/2020|5|10|20/02/2020|Vinay|2020-02-20|2101|SBI|Pune|City Branch|Remittance Instrument Issued successfully.|DDTransferIssueChqHolderYReject|RemmitanceScreen_modelVoucherNum|T|10.50|1.89|0.95|2|1013.34|



Scenario Outline: 8.Remittance Instrument Issue Entry
Scenario : 8.Remittance Instrument Issue Entry With Negative Scenario 1
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select "<RemittanceType>" PO or DD
And user select "<PaymentMode>" Cash or Transfer
And user enters Debit Account Number"<accNo>"
And user enters "<Amount>" 
And user enters beneficiary name "<BeneficiaryName>"
And user click on submitButton
Then user finds validationMessage"<ValidationMessage>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|RemittanceType|PaymentMode|Amount|BeneficiaryName|accNo|ValidationMessage|
|Remittance Amount Greater Than Available Balance|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|PO|Transfer|400000|Ganesh|101210101010000100|Remittance amount exceeds available balance.|


Scenario Outline: 9.Remittance Instrument Issue Entry
Scenario : 9.Remittance Instrument Issue Entry With Negative Scenario 2
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select "<RemittanceType>" PO or DD
And user select "<PaymentMode>" Cash or Transfer
And user enters Debit Account Number"<accNo>"
And user enters "<Amount>" 
And user enters Instrument Date "<InstrumentDateUi>"
And user enters Instrument Number"<InstrumentNumber>"
Then verify validation Message of Date "<xpath>" and "<ValidationMessage>"  
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|RemittanceType|PaymentMode|Amount|accNo|ValidationMessage|InstrumentDateUi|InstrumentNumber|xpath|
|Future Cheque Not Allowed|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|PO|Transfer|2000|101210101100000404|Payment not allowed for future cheque.|27/02/2020|1|//span[@id='instrumentNumberremittanceInstrumentIssue_ExceptionMsg']|


Scenario Outline: 10.Remittance Instrument Issue Entry
Scenario : 10.Remittance Instrument Issue Entry With Negative Scenario 3
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select "<RemittanceType>" PO or DD
And user select "<PaymentMode>" Cash or Transfer
And user enters Debit Account Number"<accNo>"
And user enters "<Amount>" 
And user enters Instrument Date "<InstrumentDateUi>"
And user enters Instrument Number"<InstrumentNumber>"
Then verify validation Message of Cheque "<xpath>" and "<ValidationMessage>"  
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|RemittanceType|PaymentMode|Amount|accNo|ValidationMessage|InstrumentDateUi|InstrumentNumber|xpath|
|Already Paid Cheque|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|PO|Transfer|2000|101210101100000404|Cheque is already paid.|23/02/2020|3|//span[@id='instrumentNumberremittanceInstrumentIssue_ExceptionMsg']|


############################################################ Authorization ########################################################################################

@RemittanceIssue
Scenario Outline: 11.Remittance Instrument Issue Authorization
Scenario : 11.Remittance Instrument Issue Authorization
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select voucher_num "<StoreInCache>" and TypeOfTrans "<TypeOfTrans>" and beneficiary name "<BeneficiaryName>" and TRANS_AMT "<Amount>" and ORIG_RESP "<ORIG_RESP>" and chq_holder "<chq_holder>" and PaymentMode "<PaymentMode>" and InstrumentNumber "<InstrumentNumber>" and  Trans_Type "<Trans_Type>" 
And user click on auhtorizeButton
Then store number on model with name "<RemitNumStoreInCache>" and "<RemitNumKeyInCache>"
Then user finds successMessage "<successMessage>"
Then verify Transaction_Header table after Auth TRANS_AMT "<AddingChargesAmount>"  where voucher_num "<StoreInCache>" and tranType "<Trans_Type>" with DenomY
Then verify Transactions table after Auth TRANS_AMT "<Amount>" accNo "<accNo>"  where voucher_num "<StoreInCache>" and tranType "<Trans_Type>"  and Remittance Commition "<RemittanceCommition>" and CGST "<CGST>" and SGST "<SGST>" and AddingChargesAmount "<AddingChargesAmount>" 
Then verify REMIT_INSTRUMENT Table voucher_num "<StoreInCache>" and tranType "<tranType>" and Pay_Mode "<PaymentMode>" and RemitNumStoreInCache "<RemitNumStoreInCache>" and accNo "<accNo>" 
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|StoreInCache|TypeOfTrans|BeneficiaryName|Amount|ORIG_RESP|chq_holder|PaymentMode|InstrumentNumber|InstrumentType|Trans_Type|successMessage|RemitNumStoreInCache|RemitNumKeyInCache|AddingChargesAmount|accNo|RemittanceCommition|CGST|SGST|
|Remittance Instrument Issue PO Cash Authorization|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntryAuth|POCashIssue|Deposit|Sonal|1000.0|Originating|N|Cash|0|PO|D|Successfully Authorized Remittance Instrument.|POCashIssueRemitSrNumber|RemmitanceScreen_modelRemittanceNum|1017.15|0|13.50|2.43|1.22|
|Remittance Instrument Issue DD Cash Authorization|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntryAuth|DDCashIssue|Deposit|Sahil|2000.0|Originating|N|Cash|0|DD|D|Successfully Authorized Remittance Instrument.|DDCashIssueRemitSrNumber|RemmitanceScreen_modelRemittanceNum|2017.15|0|13.50|2.43|1.22|
|Remittance Instrument Issue PO Transfer Authorization Chq_Holder 'N'|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntryAuth|POTransferIssueChqHolderN|Transfer|Sayali|3000.0|Originating|N|Transfer|0|PO|T|Successfully Authorized Remittance Instrument.|POTransferIssueRemitSrNumberChqHolderN|RemmitanceScreen_modelRemittanceNum|3017.15|101210101010000100|10.50|1.89|0.95|
|Remittance Instrument Issue DD Transfer Authorization Chq_Holder 'N'|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntryAuth|DDTransferIssueChqHolderN|Transfer|Sagar|1000.0|Originating|N|Transfer|0|DD|T|Successfully Authorized Remittance Instrument.|DDTransferIssueRemitSrNumberChqHolderN|RemmitanceScreen_modelRemittanceNum|1017.15|101210101000000560|10.50|1.89|0.95|
|Remittance Instrument Issue PO Transfer Authorization Chq_Holder 'Y'|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntryAuth|POTransferIssueChqHolderY|Transfer|Rahul|3000.0|Originating|Y|Transfer|1|PO|T|Successfully Authorized Remittance Instrument.|POTransferIssueRemitSrNumberChqHolderY|RemmitanceScreen_modelRemittanceNum|3017.15|101210101100000404|10.50|1.89|0.95|
|Remittance Instrument Issue DD Transfer Authorization Chq_Holder 'Y'|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntryAuth|DDTransferIssueChqHolderY|Transfer|Radhika|1000.0|Originating|Y|Transfer|5|DD|T|Successfully Authorized Remittance Instrument.|DDTransferIssueRemitSrNumberChqHolderY|RemmitanceScreen_modelRemittanceNum|1017.15|101210101100000405|10.50|1.89|0.95|



############################################################ Rejection ########################################################################################


Scenario Outline: 12.Remittance Instrument Issue Entry
Scenario : 12.Remittance Instrument Issue Entry Cash Receipt Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select VoucherNumber where voucher_num "<StoreInCache>"
Then Verify "<TotalTransactionAmount>" on Ui TotalTransAmount
And user click on rejectButton
Then user finds successMessage "<successMessage>"
Then verify TRANSACTION_HEADER Table where voucher_num "<StoreInCache>" and status "<tranType>" 
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|StoreInCache|TotalTransactionAmount|successMessage|tranType|
|Remittance Instrument Issue of PO Cash Receipt Reject|Cash Receipt Entry|Menu_CashReceiptEntry|POCashIssueCashReceiptReject|2017.15|Successfully Rejected.|D|
|Remittance Instrument Issue of DD Cash Receipt Reject|Cash Receipt Entry|Menu_CashReceiptEntry|DDCashIssueCashReceiptReject|1017.15|Successfully Rejected.|D|


Scenario Outline: 13.Remittance Instrument Issue Rejection
Scenario : 13.Remittance Instrument Issue Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select voucher_num "<StoreInCache>" and TypeOfTrans "<TypeOfTrans>" and beneficiary name "<BeneficiaryName>" and TRANS_AMT "<Amount>" and ORIG_RESP "<ORIG_RESP>" and chq_holder "<chq_holder>" and PaymentMode "<PaymentMode>" and InstrumentNumber "<InstrumentNumber>" and  Trans_Type "<Trans_Type>" 
And user click on Remittance Instrument Issue rejectButton
Then user finds successMessage "<successMessage>"
Then verify Transaction_Header table after Rejection TRANS_AMT "<AddingChargesAmount>"  where voucher_num "<StoreInCache>" and tranType "<Trans_Type>" with DenomY
Then verify Transactions table after Auth TRANS_AMT "<Amount>" accNo "<accNo>"  where voucher_num "<StoreInCache>" and tranType "<Trans_Type>"  and Remittance Commition "<RemittanceCommition>" and CGST "<CGST>" and SGST "<SGST>" and AddingChargesAmount "<AddingChargesAmount>" 
Then verify REMIT_INSTRUMENT Table Remittance_AMT "<Amount>" Pay_Mode "<PaymentMode>"  where voucher_num "<StoreInCache>" and ORIG_RESP "<ORIG_RESP>"  and tranType "<Trans_Type>" and remittanceType "<InstrumentType>" and beneficiaryName "<BeneficiaryName>" and accNo "<accNo>" 
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|StoreInCache|TypeOfTrans|BeneficiaryName|Amount|ORIG_RESP|chq_holder|PaymentMode|InstrumentNumber|InstrumentType|Trans_Type|successMessage|AddingChargesAmount|accNo|RemittanceCommition|CGST|SGST|
|Remittance Instrument Issue PO Cash Rejection|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntryAuth|POCashIssueReject|Deposit|Sonam|2000.0|Originating|N|Cash|0|PO|D|Remittance Instrument Rejected Successfully.|2017.15|0|13.50|2.43|1.22|
|Remittance Instrument Issue DD Cash Rejection|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntryAuth|DDCashIssueReject|Deposit|Anil|1000.0|Originating|N|Cash|0|DD|D|Remittance Instrument Rejected Successfully.|1017.15|0|13.50|2.43|1.22|
|Remittance Instrument Issue PO Transfer Chq_Holder 'N' Rejection|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntryAuth|POTransferIssueChqHolderNReject|Transfer|Sunil|3000.0|Originating|N|Transfer|0|PO|T|Remittance Instrument Rejected Successfully.|3013.34|101210101010000100|10.50|1.89|0.95|
|Remittance Instrument Issue DD Transfer Chq_Holder 'N' Rejection|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntryAuth|DDTransferIssueChqHolderNReject|Transfer|Sapna|1000.0|Originating|N|Transfer|0|DD|T|Remittance Instrument Rejected Successfully.|1013.34|101210101000000560|10.50|1.89|0.95|
|Remittance Instrument Issue PO Transfer Chq_Holder 'Y' Rejection|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntryAuth|POTransferIssueChqHolderYReject|Transfer|Rishi|3000.0|Originating|Y|Transfer|2|PO|T|Remittance Instrument Rejected Successfully.|3013.34|101210101100000404|10.50|1.89|0.95|
|Remittance Instrument Issue DD Transfer Chq_Holder 'Y' Rejection|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntryAuth|DDTransferIssueChqHolderYReject|Transfer|Vinay|1000.0|Originating|Y|Transfer|6|DD|T|Remittance Instrument Rejected Successfully.|1013.34|101210101100000405|10.50|1.89|0.95|


@setUp
Scenario Outline: 14.Remittance Instrument Issue Authorization Screen Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||