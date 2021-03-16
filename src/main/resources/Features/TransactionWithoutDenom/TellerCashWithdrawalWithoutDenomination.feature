Feature: Teller Cash Withdrawal without denomination

@TellerWithWithoutDenom @setUp @withoutDenom
Scenario Outline: Teller CashWithdrawal Screen Setup
Given User starts a parentReport "<parentReport>"
Then setup CashWithdrawal Screen
Examples:
|parentReport|
|Teller CashWithdrawal Without Denomination|

@TellerWithWithoutDenom @withoutDenom
Scenario Outline: Teller Cash Withdrawal 

Given user opens a testCase "<testCase>"
Given User is on "Teller" "Menu_TellerWithdrawal"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on TellerDeposit screen
And user selects "<instrumentType>" and instrument No "<instrNo>"
And user selects currency "<currency>"
And click on submit button on cashDeposit screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "Debited From Account Successfully."
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<AccNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomN
Then verify Transaction_Details table TRANS_AMT "<transAmt>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify AllLimitMaster with "A" "TellCashWith" "<transAmt>"
Then verify CHEQUEBOOKDETAIL table status col "P" transId and paidDate where "<instrumentType>" and instrument No "<instrNo>" and vouchNo "<StoreInCache>" and TransType "W"

And user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|instrumentType|instrNo|currency|tokenNo|StoreInCache|KeyInCache|successMessage|AvailableBal|tranType|activity|transCode|ShadowBal|chqStaus|
|Teller Cash Withdrawal using SB withdrawalSlip|Cash Withdrawal|Menu_CashWithdrawal|101210101100000816|500|Withdrawal Slip - 99|123|INR|51|CashWithdrawalusingSBwithdrawalSlip|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|9500|W|A|CashWthdrwal|0||
|Cash Withdrawal using SB withdrawalSlip Non-Individual Acc Without Denomination|Cash Withdrawal|Menu_CashWithdrawal|101210101100000826|500|Withdrawal Slip - 99|123|INR|52|CashWithdrawalusingSBNonIndividualwithdrawalSlipWithoutDenomination|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|9500|W|A|CashWthdrwal|0||
|Cash Withdrawal using SB Cheque Without Denomination|Cash Withdrawal|Menu_CashWithdrawal|101210101100000865|500|Saving Account - 10|100000|INR|53|CashWithdrawalusingSBChequeWithoutDenomination|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|9500|W|A|CashWthdrwal|0|P|
|Cash Withdrawal using CC Cheque Without Denomination|Cash Withdrawal|Menu_CashWithdrawal|101210102000000420|500|Cash Credit - 13|100050|INR|54|CashWithdrawalusingCCChequeWithoutDenomination|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|-500|W|A|CashWthdrwal|0|P|
|Cash Withdrawal using Non_individual CC Cheque Without Denomination|Cash Withdrawal|Menu_CashWithdrawal|101210102000000391|500|Cash Credit - 13|100101|INR|55|CashWithdrawalusingNonindividualCCChequeWithoutDenomination|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|-500|W|A|CashWthdrwal|0|P|
|Cash Withdrawal using SB Cheque of Non-Individual Acc Without Denomination|Cash Withdrawal|Menu_CashWithdrawal|101210101100000866|500|Saving Account - 10|100025|INR|56|CashWithdrawalusingNonIndiSBChequeWithoutDenomination|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|9500|W|A|CashWthdrwal|0|P|
|Cash Withdrawal using Credit Freeze Acc Without Denomination|Cash Withdrawal|Menu_CashWithdrawal|101210101100000821|500|Withdrawal Slip - 99|123|INR|57|CashWithdrawalusingCreditFreezeAccWithoutDenomination|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|9500|W|A|CashWthdrwal|0||
|Cash Withdrawal using Credit Freeze Customer Without Denomination|Cash Withdrawal|Menu_CashWithdrawal|101210101100000822|500|Withdrawal Slip - 99|123|INR|58|CashWithdrawalusingCreditFreezeCustomerWithoutDenomination|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|9500|W|A|CashWthdrwal|0||




@TellerWithWithoutDenom @withoutDenom
Scenario Outline: Cash Withdrawal IBT transaction

Given user opens a testCase "<testCase>"
Given User is on "Teller" "Menu_TellerWithdrawal"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on TellerDeposit screen
And user selects "<instrumentType>" and instrument No "<instrNo>"
And user selects currency "<currency>"
And click on submit button on cashDeposit screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "Debited From Account Successfully."
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<AccNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomN
Then verify Transaction tables in case of IBT using "<tranType>""<StoreInCache>""<transAmt>""<AccNo>""<IbtStatus>""TellCashWith"
And user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|instrumentType|instrNo|currency|tokenNo|StoreInCache|KeyInCache|successMessage|AvailableBal|tranType|activity|transCode|ShadowBal|chqStaus|IbtStatus|
|Cash Withdrawal using IBT|Cash Withdrawal|Menu_CashWithdrawal|101210201100000013|500|Withdrawal Slip - 99|123|INR|59|CashWithdrawalIBT|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|9500|W|A|CashWthdrwal|0||A|

@TellerWithWithoutDenom @withoutDenom
Scenario Outline: Cash Withdrawal validation messages on GET Call

Given user opens a testCase "<testCase>"
Given User is on "Teller" "Menu_TellerWithdrawal"screen
When user enters accNo "<AccNo>" on cashWithdrawal screen
Then verify validation Message on Get Call "//span[@id='accNocashpaymnettellerlimit1_ExceptionMsg']" "<ExpectedMessage>"
Examples:
|testCase|MenuName|MenuPath|AccNo|xpath|ExpectedMessage|
|Closed Account|Cash Withdrawal|Menu_CashWithdrawal|101210101100000817|//span[@id='accNocashpaymnettellerlimit1_ExceptionMsg']|Account is closed.|
|Closed Customer|Cash Withdrawal|Menu_CashWithdrawal|101210101100000818|//span[@id='accNocashwithdralentry1_ExceptionMsg']|0011000000001829 Customer Is Closed or Deleted|
|Total Freezed Account|Cash Withdrawal|Menu_CashWithdrawal|101210101100000820|//span[@id='accNocashwithdralentry1_ExceptionMsg']|Account is total freeze.|
|Total Freezed Customer|Cash Withdrawal|Menu_CashWithdrawal|101210101100000819|//span[@id='accNocashwithdralentry1_ExceptionMsg']|0011000000001830 Customer Is Debit Freeze|
|Debit Freezed Account|Cash Withdrawal|Menu_CashWithdrawal|101210101100000823|//span[@id='accNocashwithdralentry1_ExceptionMsg']|Account is debit freeze.|
|Debit Freezed Customer|Cash Withdrawal|Menu_CashWithdrawal|101210101100000824|//span[@id='accNocashwithdralentry1_ExceptionMsg']|0011000000001835 Customer Is Debit Freeze|

@TellerWithWithoutDenom @withoutDenom
Scenario Outline: Cash Withdrawal validation messages on GET Call

Given user opens a testCase "<testCase>"
Given User is on "Teller" "Menu_TellerWithdrawal"screen
When user enters accNo "<AccNo>" and transaction Amount "1000" on TellerDeposit screen
Then verify validation Message on Get Call "//span[@id='transAmtcashwithdralentry1_ExceptionMsg']" "<ExpectedMessage>"
Examples:
|testCase|MenuName|MenuPath|AccNo|xpath|ExpectedMessage|
|Low Balance of SB account|Cash Withdrawal|Menu_CashWithdrawal|101210101100000817|//span[@id='transAmtcashwithdralentry1_ExceptionMsg']|Balance is insufficient.|
|Low Balance of CC account|Cash Withdrawal|Menu_CashWithdrawal|101210101100000817|//span[@id='transAmtcashwithdralentry1_ExceptionMsg']|Balance is insufficient.|


@TellerWithWithoutDenom @withoutDenom
Scenario Outline: Cash Withdrawal validation messages on POST Call

Given user opens a testCase "<testCase>"
Given User is on "Teller" "Menu_TellerWithdrawal"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on TellerDeposit screen
And user selects "<instrumentType>" and instrument No "<instrNo>"
And user selects currency "<currency>"
And click on submit button on cashDeposit screen
Then user finds validationMessage"<validationMessage>"

Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|instrumentType|instrNo|currency|tokenNo|validationMessage|
|Low balance|Cash Withdrawal|Menu_CashWithdrawal|101210101100000825|500|Withdrawal Slip - 99|123|INR|57|Balance is insufficient.|
|Balance Freeze|Cash Withdrawal|Menu_CashWithdrawal|101210101100000825|500|Withdrawal Slip - 99|123|INR|58|Balance is insufficient.|
@TellerWithWithoutDenom @setUp @withoutDenom
Scenario Outline: 7.Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||
