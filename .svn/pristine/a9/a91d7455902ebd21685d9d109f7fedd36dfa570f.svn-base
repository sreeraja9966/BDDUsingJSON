Feature: Ac To Ac Transfer Entry
@AcToAcTransfer @setUp @sanity
Scenario Outline: Ac To Ac Transfer Screen Setup
Given User starts a parentReport "<parentReport>"
Then setup CashWithdrawal Screen
Examples:
|parentReport|
|Ac To Ac Transfer|

@AcToAcTransfer @sanity
Scenario Outline: Debit SB using withdrawal slip and Credit SB
Given user opens a testCase "<testCase>"
Given User is on "transfer transaction" "Menu_AcToAcTransfer"screen
When user select "Debit" radio button on transfer screen
And user enter debitAccNo "<DebitAccNo>" on transfer screen
And user enter debitTransAmt "<debitTransAmt>" on transfer screen
And user selects "<instrumentType>" and instrument No "<instrNo>"
And click on addDetails button on cashWithdrawal screen
When user select "credit" radio button on transfer screen
And user enter creditAccNo "<CreditAccNo>" on transfer screen
And user enter creditTransAmt "<creditTransAmt>" on transfer screen
And click on addDetails button on cashWithdrawal screen
When user click on transfer Submit button
Then store number on model with name "<StoreInCache>" and "TellerDepositScreen_ModelNumber"
Then user finds successMessage "Transaction Completed Successfully."
Then verify Transaction_Header table TRANS_AMT "<totalTransAmt>"  where voucher_num "<StoreInCache>" and tranType "T" with DenomN
Then verify Transaction_details table "<debitTransAmt>" "<instrNo>" "<DebitAccNo>" where voucher_num "<StoreInCache>" and tranType "T" and "D"
Then verify Transaction_details table "<creditTransAmt>" "<instrNo>" "<CreditAccNo>" where voucher_num "<StoreInCache>" and tranType "T" and "C"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBalOfDebitAcc>" and ShadowBal "<ShadowBalOfDebitAcc>" where accNo "<DebitAccNo>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBalOfCreditAcc>" and ShadowBal "<ShadowBalOfCreditAcc>" where accNo "<CreditAccNo>"
Then verify AllLimitMaster with "E" "TransfCredit" "<creditTransAmt>"
Then verify AllLimitMaster with "E" "TransfrDebit" "<debitTransAmt>"
Then verify CHEQUEBOOKDETAIL table status col "P" transId and paidDate where "<instrumentType>" and instrument No "<instrNo>" and vouchNo "<StoreInCache>" and TransType "T"

Examples:
|testCase|DebitAccNo|debitTransAmt|instrumentType|instrNo|CreditAccNo|creditTransAmt|StoreInCache|totalTransAmt|AvailableBalOfDebitAcc|AvailableBalOfCreditAcc|ShadowBalOfDebitAcc|ShadowBalOfCreditAcc|
|Debit SB using withdrawal slip and Credit SB|101210101100000816|500|Withdrawal Slip - 99|123|101210101200000146|500|DebitSBusingwithdrawalslipandCreditSB|500|10000|10000|-500|500|
|Credit Freeze Debit Acc and Debit Freezed Credit Acc|101210101100000821|500|Withdrawal Slip - 99|123|101210101100000823|500|CreditFreezeDebitAccandDebitFreezedCreditAcc|500|10000|10000|-500|500|
|Credit FD Acc and Debit SB Acc using cheque|101210101100000865|10000|Saving Account - 10|100000|101210106060000004|10000|CreditFDAccandDebitSBAccusingcheque|10000|10000|0|-10000|10000|
|Debit SB using withdrawal slip and Credit CC|101210101100000826|500|Withdrawal Slip - 99|123|101210102000000379|500|DebitSBusingwithdrawalslipandCreditCC|500|10000|0|-500|500|
|Credit RD Acc and Debit CC Acc using cheque|101210102000000420|5000|Cash Credit - 13|100050|101210105900000242|5000|CreditRDAccandDebitCCAccusingcheque|5000|0|0|-5000|5000|

@AcToAcTransfer 
Scenario Outline: Ac To Ac Validations on GET Call at Credit Acc field
Given user opens a testCase "<testCase>"
Given User is on "transfer transaction" "Menu_AcToAcTransfer"screen
When user select "credit" radio button on transfer screen
And user enter creditAccNo "<CreditAccNo>" on transfer screen
Then verify validation Message on Get Call "//span[@id='accNotransferTransaction1_ExceptionMsg']" "<validationMessage>"
Examples:
|testCase|CreditAccNo|validationMessage|
|Validation Message of Credit Freezed Account at Credit Acc field|101210101100000821|Account is Credit freeze.|
|Validation Message of Credit Freezed Customer at Credit Acc field|101210101100000822|0011000000001833 Customer Is Credit Freeze|
|Validation Message of Closed Account at Credit Acc Field|101210101100000817|Account is Closed.|
|Validation Message of Closed Customer at Credit Acc Field|101210101100000818|Customer is Closed.|
|Validation Message of Total Freezed Account at Credit Acc field|101210101100000820|Account is total freeze.|
|Validation Message of Total Freezed Customer at Credit Acc field|101210101100000819|0011000000001830 Customer Is Credit Freeze|

@AcToAcTransfer 
Scenario Outline: Ac To Ac Validations on GET Call at Debit Acc field
Given user opens a testCase "<testCase>"
Given User is on "transfer transaction" "Menu_AcToAcTransfer"screen
When user select "Debit" radio button on transfer screen
And user enter debitAccNo "<DebitAccNo>" on transfer screen
Then verify validation Message on Get Call "//span[@id='accNotransferTransaction1_ExceptionMsg']" "<validationMessage>"
Examples:
|testCase|DebitAccNo|validationMessage|
|Validation Message of Debit Freezed Account at Debit Acc field|101210101100000823||
|Validation Message of Debit Freezed Customer at Debit Acc field|101210101100000824||
|Validation Message of Closed Account at Debit Acc Field|101210101100000817|Account is Closed.|
|Validation Message of Closed Customer at Debit Acc Field|101210101100000818|Customer is Closed.|
|Validation Message of Total Freezed Account at Debit Acc field|101210101100000820|Account is total freeze.|
|Validation Message of Total Freezed Customer at Debit Acc field|101210101100000819|0011000000001830 Customer Is Credit Freeze|



@AcToAcTransfer
Scenario Outline: Ac To Ac Validations on GET Call Based on Instrumnet Number
Given user opens a testCase "<testCase>"
Given User is on "transfer transaction" "Menu_AcToAcTransfer"screen
When user select "Debit" radio button on transfer screen
And user enter debitAccNo "<DebitAccNo>" on transfer screen
And user selects "<instrumentType>" and instrument No "<instrNo>"
Then verify validation Message on Get Call "//span[@id='instrNumbertransferTransaction1_ExceptionMsg']" "<validationMessage>"
Examples:
|testCase|DebitAccNo|instrumentType|instrNo|validationMessage|
|Already used Instrument Number|101210101100000865|Saving Account - 10|100000|Cheque is already paid.|
|Invalid Instrument Number|101210101100000865|Saving Account - 10|11|No record found for this cheque.|



@AcToAcTransfer
Scenario Outline: Ac To Ac Validations on POST Call
Given user opens a testCase "<testCase>"
Given User is on "transfer transaction" "Menu_AcToAcTransfer"screen
When user select "Debit" radio button on transfer screen
And user enter debitAccNo "<DebitAccNo>" on transfer screen
And user enter debitTransAmt "<debitTransAmt>" on transfer screen
And user selects "<instrumentType>" and instrument No "<instrNo>"
And click on addDetails button on cashWithdrawal screen
When user select "credit" radio button on transfer screen
And user enter creditAccNo "<CreditAccNo>" on transfer screen
And user enter creditTransAmt "<creditTransAmt>" on transfer screen
And click on addDetails button on cashWithdrawal screen
When user click on transfer Submit button
Then user finds successMessage "<ValidationMessage>"

Examples:
|testCase|DebitAccNo|debitTransAmt|instrumentType|instrNo|CreditAccNo|creditTransAmt|ValidationMessage|
|Low Balance SB account|101210101100000825|500|Withdrawal Slip - 99|123|101210101200000146|500|Balance is insufficient.|
|Low Balance CC account|101210102000000390|500|Cash Credit - 13|100126|101210101100000816|500|Balance is insufficient.|
|Already Credit FD account|101210101100000816|10000|Withdrawal Slip - 99|123|101210106060000004|10000|Credit Not Allowed|
|Credit Rd Account Where Trans Amt not in multiples of intallment Amt|101210101100000816|200|Withdrawal Slip - 99|123|101210105900000242|200|Transaction Amount is not matching with Installment Amount|
|Credit Amount and Debit Amount is Not Matched|101210101100000825|500|Withdrawal Slip - 99|123|101210101200000146|50|TRANSACTION AMOUNT MISMATCH|


@AcToAcTransfer @sanity
Scenario Outline: Ac To Ac Transfer Authorization
Given user opens a testCase "<testCase>"
Given User is on "transfer transaction" "Menu_AcToAcTransferAuth"screen
When user select toekn number "<StoreInCache>" from AcToAcTransfer screen
And user lick on Auth button on AcToAcTransfer screen
Then user finds successMessage "Successfully Authorize."
Then verify Transaction_Header table after Auth TRANS_AMT "<totalTransAmt>"  where voucher_num "<StoreInCache>" and tranType "T" with DenomN
Then verify Transaction_details table "<debitTransAmt>" "<instrNo>" "<DebitAccNo>" where voucher_num "<StoreInCache>" and tranType "T" and "D"
Then verify Transaction_details table "<creditTransAmt>" "<instrNo>" "<CreditAccNo>" where voucher_num "<StoreInCache>" and tranType "T" and "C"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBalOfDebitAcc>" and ShadowBal "<ShadowBalOfDebitAcc>" where accNo "<DebitAccNo>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBalOfCreditAcc>" and ShadowBal "<ShadowBalOfCreditAcc>" where accNo "<CreditAccNo>"
Then verify AllLimitMaster with "A" "TransfCredit" "<creditTransAmt>"
Then verify AllLimitMaster with "A" "TransfrDebit" "<debitTransAmt>"
Then verify CHEQUEBOOKDETAIL table status col "P" transId and paidDate where "<instrumentType>" and instrument No "<instrNo>" and vouchNo "<StoreInCache>" and TransType "T"
Examples:
|testCase|DebitAccNo|debitTransAmt|instrumentType|instrNo|CreditAccNo|creditTransAmt|StoreInCache|totalTransAmt|AvailableBalOfDebitAcc|AvailableBalOfCreditAcc|ShadowBalOfDebitAcc|ShadowBalOfCreditAcc|
|Debit SB using withdrawal slip and Credit SB Authorization|101210101100000816|500|Withdrawal Slip - 99|123|101210101200000146|500|DebitSBusingwithdrawalslipandCreditSB|500|9500|10500|0|0|
|Credit Freeze Debit Acc and Debit Freezed Credit Acc Authorization|101210101100000821|500|Withdrawal Slip - 99|123|101210101100000823|500|CreditFreezeDebitAccandDebitFreezedCreditAcc|500|9500|10500|0|0|
|Credit FD Acc and Debit SB Acc using cheque Authorization|101210101100000865|10000|Saving Account - 10|100000|101210106060000004|10000|CreditFDAccandDebitSBAccusingcheque|10000|0|10000|0|0|
|Debit SB using withdrawal slip and Credit CC Authorization|101210101100000826|500|Withdrawal Slip - 99|123|101210102000000379|500|DebitSBusingwithdrawalslipandCreditCC|500|9500|500|0|0|
|Credit RD Acc and Debit CC Acc using cheque Authorization|101210102000000420|5000|Cash Credit - 13|100050|101210105900000242|5000|CreditRDAccandDebitCCAccusingcheque|5000|-5000|5000|0|0|




@AcToAcTransfer @setUp @sanity
Scenario Outline: 7.Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||
