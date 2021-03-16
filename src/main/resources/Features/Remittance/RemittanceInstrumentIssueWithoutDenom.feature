@RemittanceIssueWithoutDenom
Feature: Remittance Instrument Issue Functionality Without Denom

@RemittanceIssueWithoutDenom @setUp
Scenario Outline: 1.Remittance Instrument Issue Screen Setup
Scenario : 1.Remittance Instrument Issue Screen Setup
Given User creates a parentReport "<parentReport>"

Examples:
|parentReport|
|Remittance Instrument Issue Without Denom|

####################################################################### Remittance Instrument Issue Entry ########################################################################################


Scenario Outline: 2.Remittance Instrument Issue Entry With Cash Payment Mode with Denom N
Scenario : 2.Remittance Instrument Issue Entry With Cash Payment Mode with Denom N
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select "<RemittanceType>" PO or DD
Then Verify "<ORIG_RESP>" on Ui Originating
And user select "<PaymentMode>" Cash or Transfer
And user enters "<Amount>" 
Then verify Remittance Commition "<RemittanceCommition>" and CGST "<CGST>" and SGST "<SGST>" where chargeTypeId "<chargeTypeId>"
Then Verify "<PayableAtPar>" Yes or No
And user enters beneficiary name "<BeneficiaryName>" 
Then Verify "<Bank>" is BANKPARAMETERS Logged In Bank BANK_NAME
Then Verify "<City>" is BRANCHPARAMETERS Logged In Branch CITY
Then Verify "<Branch>" is BRANCHPARAMETERS Logged In Branch BRANCHNAME
Then user click on Remittance Instrument Issue Screen submit
When user click on Remittance Instrument Issue Screen confirm
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verify Transaction_Header table TRANS_AMT "<AddingChargesAmount>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomN
Then verify Transaction_Details Table TRANS_AMT "<Amount>" accNo "<accNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" and Remittance Commition "<RemittanceCommition>" and CGST "<CGST>" and SGST "<SGST>" and AddingChargesAmount "<AddingChargesAmount>"  
Then verify REMIT_INSTRUMENT Table Remittance_AMT "<Amount>" Pay_Mode "<PaymentMode>"  where voucher_num "<StoreInCache>" and ORIG_RESP "<ORIG_RESP>"  and tranType "<tranType>" and remittanceType "<RemittanceType>" and beneficiaryName "<BeneficiaryName>" and accNo "<accNo>" Denom N
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|RemittanceType|ORIG_RESP|PaymentMode|Amount|PayableAtPar|BeneficiaryName|BranchId|Bank|City|Branch|StoreInCache|successMessage|KeyInCache|tranType|accNo|RemittanceCommition|CGST|SGST|chargeTypeId|AddingChargesAmount|
|Remittance Instrument Issue Entry For PO Cash |Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|PO - Pay Order|Originating|Cash|1000|Yes|Sonal|2101|SBI|Pune|City Branch|POCashIssue|Remittance Instrument Issued successfully.|RemmitanceScreen_modelVoucherNum|D|0|13.50|2.43|1.22|2|1017.15|
|Remittance Instrument Issue Entry For DD Cash |Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|DD - Demand Draft|Originating|Cash|2000|No|Sahil|2101|SBI|Pune|City Branch|DDCashIssue|Remittance Instrument Issued successfully.|RemmitanceScreen_modelVoucherNum|D|0|13.50|2.43|1.22|2|2017.15|
|Remittance Instrument Issue Entry of PO Cash For Rejection|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|PO - Pay Order|Originating|Cash|2000|Yes|Sonam|2101|SBI|Pune|City Branch|POCashIssueReject|Remittance Instrument Issued successfully.|RemmitanceScreen_modelVoucherNum|D|0|13.50|2.43|1.22|2|2017.15|
|Remittance Instrument Issue Entry of DD Cash For Rejection|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|DD - Demand Draft|Originating|Cash|1000|No|Anil|2101|SBI|Pune|City Branch|DDCashIssueReject|Remittance Instrument Issued successfully.|RemmitanceScreen_modelVoucherNum|D|0|13.50|2.43|1.22|2|1017.15|

############################################################ Authorization ##############################################################################################################################################################################################################################################################################


Scenario Outline: 11.Remittance Instrument Issue Authorization
Scenario : 11.Remittance Instrument Issue Authorization
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select voucher_num "<StoreInCache>" and TypeOfTrans "<TypeOfTrans>" and beneficiary name "<BeneficiaryName>" and TRANS_AMT "<Amount>" and ORIG_RESP "<ORIG_RESP>" and chq_holder "<chq_holder>" and PaymentMode "<PaymentMode>" and InstrumentNumber "<InstrumentNumber>" and  Trans_Type "<Trans_Type>" 
And user click on auhtorizeButton
When user click on Remittance Instrument Issue Screen confirm
Then store number on model with name "<RemitNumStoreInCache>" and "<RemitNumKeyInCache>"
Then user finds successMessage "<successMessage>"
Then verify Transaction_Header table after Auth TRANS_AMT "<AddingChargesAmount>"  where voucher_num "<StoreInCache>" and tranType "<Trans_Type>" with DenomN
Then verify Transactions table after Auth TRANS_AMT "<Amount>" accNo "<accNo>"  where voucher_num "<StoreInCache>" and tranType "<Trans_Type>"  and Remittance Commition "<RemittanceCommition>" and CGST "<CGST>" and SGST "<SGST>" and AddingChargesAmount "<AddingChargesAmount>" 
Then verify REMIT_INSTRUMENT Table voucher_num "<StoreInCache>" and tranType "<Trans_Type>" and Pay_Mode "<PaymentMode>" and RemitNumStoreInCache "<RemitNumStoreInCache>" and accNo "<accNo>" with Denom N 
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|StoreInCache|TypeOfTrans|BeneficiaryName|Amount|ORIG_RESP|chq_holder|PaymentMode|InstrumentNumber|InstrumentType|Trans_Type|successMessage|RemitNumStoreInCache|RemitNumKeyInCache|AddingChargesAmount|accNo|RemittanceCommition|CGST|SGST|
|Remittance Instrument Issue PO Cash Authorization|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntryAuth|POCashIssue|Deposit|Sonal|1000.0|Originating|N|Cash|0|PO|D|Successfully Authorized Remittance Instrument.|POCashRemitSrNumber|RemmitanceScreen_modelRemittanceNum|1017.15|0|13.50|2.43|1.22|
|Remittance Instrument Issue DD Cash Authorization|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntryAuth|DDCashIssue|Deposit|Sahil|2000.0|Originating|N|Cash|0|DD|D|Successfully Authorized Remittance Instrument.|DDCashRemitSrNumber|RemmitanceScreen_modelRemittanceNum|2017.15|0|13.50|2.43|1.22|


############################################################ Rejection #########################################################################################################################################################################################################################################################################################################


Scenario Outline: 13.Remittance Instrument Issue Rejection
Scenario : 13.Remittance Instrument Issue Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select voucher_num "<StoreInCache>" and TypeOfTrans "<TypeOfTrans>" and beneficiary name "<BeneficiaryName>" and TRANS_AMT "<Amount>" and ORIG_RESP "<ORIG_RESP>" and chq_holder "<chq_holder>" and PaymentMode "<PaymentMode>" and InstrumentNumber "<InstrumentNumber>" and  Trans_Type "<Trans_Type>" 
And user click on Remittance Instrument Issue rejectButton
Then user finds successMessage "<successMessage>"
Then verify Transaction_Header table Reject TRANS_AMT "<AddingChargesAmount>"  where voucher_num "<StoreInCache>" and tranType "<Trans_Type>" with DenomN
Then verify Transactions table after Reject TRANS_AMT "<Amount>" accNo "<accNo>"  where voucher_num "<StoreInCache>" and tranType "<Trans_Type>"  and Remittance Commition "<RemittanceCommition>" and CGST "<CGST>" and SGST "<SGST>" and AddingChargesAmount "<AddingChargesAmount>" 
Then verify REMIT_INSTRUMENT Table Remittance_AMT "<Amount>" Pay_Mode "<PaymentMode>"  where voucher_num "<StoreInCache>" and ORIG_RESP "<ORIG_RESP>"  and tranType "<Trans_Type>" and remittanceType "<RemittanceType>" and beneficiaryName "<BeneficiaryName>" and accNo "<accNo>" Denom N  
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|StoreInCache|TypeOfTrans|BeneficiaryName|Amount|ORIG_RESP|chq_holder|PaymentMode|InstrumentNumber|InstrumentType|Trans_Type|successMessage|AddingChargesAmount|accNo|RemittanceCommition|CGST|SGST|
|Remittance Instrument Issue PO Cash Rejection|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntryAuth|POCashIssueReject|Deposit|Sonam|2000.0|Originating|N|Cash|0|PO|D|Remittance Instrument Rejected Successfully.|2017.15|0|13.50|2.43|1.22|
|Remittance Instrument Issue DD Cash Rejection|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntryAuth|DDCashIssueReject|Deposit|Anil|1000.0|Originating|N|Cash|0|DD|D|Remittance Instrument Rejected Successfully.|1017.15|0|13.50|2.43|1.22|



############################################################ Remittance Instrument Issue Entry RTGS & NEFT #######################################################################################

@RemittanceIssueWithoutDenom
Scenario Outline: 6.Remittance Instrument Issue Entry With Transfer Debit Account Chq_Holder='N'
Scenario : 6.Remittance Instrument Issue Entry With Transfer Debit Account Chq_Holder='N'
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select "<RemittanceType>" RTGS or NEFT
And user select "<PaymentMode>" Cash or Transfer of Remittance
And user enters Debit Account Number"<accNo>" 
And user enters "<Amount>" 
Then verify Remittance Commition "<RemittanceCommition>" and CGST "<CGST>" and SGST "<SGST>" where chargeTypeId "<chargeTypeId>"
When user click on Add Beneficiary button
And user enters Beneficiary Name in field"<BeneficiaryName>"
And user enters Account Number in field"<BeneficiaryAcNo>"
And user enters Contact Number in field"<BeneficiaryPhNo>"
And user enters Address Line Number one in field"<BeneficiaryAdd1>"
And user enters Address Line Number two in field"<BeneficiaryAdd2>"
And user enters Address Line Number three in field"<BeneficiaryAdd3>"
And user enters Pin Code in field"<Pin>"
And user enters IFSC Code in field"<IFSC>"
And user enters Bank Name in field"<BankName>"
And user enters City in field"<City>"
When user click Save button
And user verify beneficiary name "<BeneficiaryName>" on Ui
Then Verify "<BankName>" is BANKPARAMETERS Logged In Bank BANK_NAME of RTGS
Then Verify "<City>" is BRANCHPARAMETERS Logged In Branch CITY of RTGS
Then Verify "<Branch>" is BRANCHPARAMETERS Logged In Branch BRANCHNAME of RTGS
Then Verify "<IFSC>" of RTGS
Then user click on Remittance Instrument Issue Screen submit
When user click on Remittance Instrument Issue Screen confirm
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verify Transaction_Header table TRANS_AMT "<Amount>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomN
Then verify Transaction_Details Table TRANS_AMT "<Amount>" accNo "<accNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" and Remittance Commition "<RemittanceCommition>" and CGST "<CGST>" and SGST "<SGST>" and AddingChargesAmount "<AddingChargesAmount>"  
Then verify REMIT_INSTRUMENT Table Remittance_AMT "<Amount>" Pay_Mode "<PaymentMode>"  where voucher_num "<StoreInCache>" and ORIG_RESP "<ORIG_RESP>"  and tranType "<tranType>" and remittanceType "<RemittanceType>" and beneficiaryName "<BeneficiaryName>" and accNo "<accNo>" Denom N for RTGS
Then verify RtgsNeftOutward table where accNo "<accNo>" where voucher_num "<StoreInCache>" and txnType "<TxnType>" and TRANS_AMT "<Amount>" and BeneficiaryAcNo "<BeneficiaryAcNo>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|RemittanceType|PaymentMode|Amount|accNo|BeneficiaryName|BeneficiaryAcNo|BeneficiaryPhNo|BeneficiaryAdd1|BeneficiaryAdd2|BeneficiaryAdd3|Pin|IFSC|City|BankName|Branch|successMessage|StoreInCache|KeyInCache|tranType|RemittanceCommition|CGST|SGST|chargeTypeId|AddingChargesAmount|TxnType|
|Remittance Instrument Issue Entry For RTGS Transfer Chq_Holder 'N'|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|RT - RTGS|Transfer|300000|101210101100000933|Sayali|101210101100000408|9855453423|Sai Plaza|Chakan|Pune|410505|PUN9021356|Karad|axis|Nigdi |Remittance Instrument Issued successfully.|RTGSTransferIssueChqHolderN|RemmitanceScreen_modelVoucherNum|T|150.00|27.00|13.50|2|190.5|RT|
|Remittance Instrument Issue Entry For NEFT Transfer Chq_Holder 'N'|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|NE - NEFT|Transfer|200000|101210101100000934|Sonal|101210101100000408|9855483423|Sai Plaza|Chakan|Pune|410505|PUN9021356|Karad|axis|Nigdi |Remittance Instrument Issued successfully.|NEFTTransferIssueChqHolderN|RemmitanceScreen_modelVoucherNum|T|100.00|18.00|9.00|2|127.00|NE|




Scenario Outline: 6.Remittance Instrument Issue Entry With Transfer Debit Account Chq_Holder='Y'
Scenario : 6.Remittance Instrument Issue Entry With Transfer Debit Account Chq_Holder='Y'
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select "<RemittanceType>" RTGS or NEFT
And user select "<PaymentMode>" Cash or Transfer of Remittance
And user enters Debit Account Number"<accNo>" 
And user enters "<Amount>" 
Then verify Remittance Commition "<RemittanceCommition>" and CGST "<CGST>" and SGST "<SGST>" where chargeTypeId "<chargeTypeId>"
And user select Instrument Type "<InstrumentType>" from Instrument Type dropdown
And user enters Instrument Date "<InstrumentDateUi>"
And user enters Instrument Number"<InstrumentNumber>"
When user click on Add Beneficiary button
And user enters Beneficiary Name in field"<BeneficiaryName>"
And user enters Account Number in field"<BeneficiaryAcNo>"
And user enters Contact Number in field"<BeneficiaryPhNo>"
And user enters Address Line Number one in field"<BeneficiaryAdd1>"
And user enters Address Line Number two in field"<BeneficiaryAdd2>"
And user enters Address Line Number three in field"<BeneficiaryAdd3>"
And user enters Pin Code in field"<Pin>"
And user enters IFSC Code in field"<IFSC>"
And user enters Bank Name in field"<BankName>"
And user enters City in field"<City>"
When user click Save button
And user verify beneficiary name "<BeneficiaryName>" on Ui
Then Verify "<BankName>" is BANKPARAMETERS Logged In Bank BANK_NAME of RTGS
Then Verify "<City>" is BRANCHPARAMETERS Logged In Branch CITY of RTGS
Then Verify "<Branch>" is BRANCHPARAMETERS Logged In Branch BRANCHNAME of RTGS
Then Verify "<IFSC>" of RTGS
Then user click on Remittance Instrument Issue Screen submit
When user click on Remittance Instrument Issue Screen confirm
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verify Transaction_Header table TRANS_AMT "<Amount>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomN
Then verify Transaction_Details Table TRANS_AMT "<Amount>" accNo "<accNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" and Remittance Commition "<RemittanceCommition>" and CGST "<CGST>" and SGST "<SGST>" and AddingChargesAmount "<AddingChargesAmount>"  
Then verify REMIT_INSTRUMENT Table Remittance_AMT "<Amount>" Pay_Mode "<PaymentMode>"  where voucher_num "<StoreInCache>" and ORIG_RESP "<ORIG_RESP>"  and tranType "<tranType>" and remittanceType "<RemittanceType>" and beneficiaryName "<BeneficiaryName>" and accNo "<accNo>" Denom N for RTGS
Then verify RtgsNeftOutward table where accNo "<accNo>" where voucher_num "<StoreInCache>" and txnType "<TxnType>" and TRANS_AMT "<Amount>" and BeneficiaryAcNo "<BeneficiaryAcNo>"
Then verify CHEQUE_BOOK_MASTER & CHEQUE_BOOK_DETAIL table where Account Number "<accNo>" and Instrument Number"<InstrumentNumber>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" 
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|RemittanceType|PaymentMode|Amount|accNo|BeneficiaryName|BeneficiaryAcNo|BeneficiaryPhNo|BeneficiaryAdd1|BeneficiaryAdd2|BeneficiaryAdd3|Pin|IFSC|City|BankName|Branch|successMessage|StoreInCache|KeyInCache|tranType|RemittanceCommition|CGST|SGST|chargeTypeId|AddingChargesAmount|InstrumentType|InstrumentDateUi|InstrumentNumber|TxnType|
|Remittance Instrument Issue Entry For RTGS Transfer Chq_Holder 'Y'|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|RT - RTGS|Transfer|300000|101210101100000935|Sayali|101210101100000408|9855453423|Sai Plaza|Chakan|Pune|410505|PUN9021356|Karad|axis|Nigdi |Remittance Instrument Issued successfully.|RTGSTransferIssueChqHolderY|RemmitanceScreen_modelVoucherNum|T|150.00|27.00|13.50|2|190.5|Saving Account|23/02/2020|11|RT|
|Remittance Instrument Issue Entry For NEFT Transfer Chq_Holder 'Y'|Remittance Instrument Issue|Menu_RemittanceInstrumentIssueEntry|NE - NEFT|Transfer|200000|101210101100000936|Sonal|101210101100000408|9855483423|Sai Plaza|Chakan|Pune|410505|PUN9021356|Karad|axis|Nigdi |Remittance Instrument Issued successfully.|NEFTTransferIssueChqHolderY|RemmitanceScreen_modelVoucherNum|T|100.00|18.00|9.00|2|127.00|Saving Account|23/02/2020|21|NE|

