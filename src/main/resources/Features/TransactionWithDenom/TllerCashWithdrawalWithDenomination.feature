Feature: Teller withdrawal with denomination

@TellerDepWithDenom @setUp @withDenom @sanity
Scenario Outline: TellerDeposit Screen Setup
Given User starts a parentReport "<parentReport>"
Then setup CashDeposit Screen
Examples:
|parentReport|
|Teller Withdrawal With Denomination|
@TellerDepWithDenom  @withDenom @sanity
Scenario Outline: Teller Cash Withdrawal 

Given user opens a testCase "<testCase>"
Given User is on "Teller" "Menu_TellerWithdrawal"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on TellerDeposit screen
And user selects "<instrumentType>" and instrument No "<instrNo>"
And user selects currency "<currency>"
When user click on denomination tab of teller screen
When user enter denominations "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
And click on submit button on TellerDeposit with Denom screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<AccNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction_Details table TRANS_AMT "<transAmt>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify AllLimitMaster with "A" "TellCshDepst" "<transAmt>"
Then verify CHEQUEBOOKDETAIL table status col "<chqStaus>" transId and paidDate where "<instrumentType>" and instrument No "<instrNo>" and vouchNo "<StoreInCache>" and TransType "W"
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"

And user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|instrumentType|instrNo|currency|tokenNo|StoreInCache|KeyInCache|successMessage|AvailableBal|tranType|activity|transCode|ShadowBal|chqStaus|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|
|Teller Cash Withdrawal using SB withdrawalSlip|Cash Withdrawal|Menu_CashWithdrawal|101210101100000816|500|Withdrawal Slip - 99|123|INR|51|CashWithdrawalusingSBwithdrawalSlip|TellerDepositScreen_ModelNumber|Debited From Account Successfully.|10000|W|E|CashWthdrwal|-500||0|3|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|



@TellerDepWithDenom  @withDenom 
Scenario Outline: Cash Withdrawal IBT transaction

Given user opens a testCase "<testCase>"
Given User is on "Teller" "Menu_TellerWithdrawal"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on TellerDeposit screen
And user selects "<instrumentType>" and instrument No "<instrNo>"
And user selects currency "<currency>"
When user click on denomination tab of teller screen
When user enter denominations "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
And click on submit button on TellerDeposit with Denom screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<AccNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction tables in case of IBT using "<tranType>""<StoreInCache>""<transAmt>""<AccNo>""<IbtStatus>""CashWthdrwal"
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"

And user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|instrumentType|instrNo|currency|tokenNo|StoreInCache|KeyInCache|successMessage|AvailableBal|tranType|activity|transCode|ShadowBal|chqStaus|IbtStatus|
|Cash Withdrawal using IBT|Cash Withdrawal|Menu_CashWithdrawal|101210201100000013|500|Withdrawal Slip - 99|123|INR|59|CashWithdrawalIBT|TellerDepositScreen_ModelNumber|Debited From Account Successfully.|10000|W|E|CashWthdrwal|-500||A|

@TellerDepWithDenom  @withDenom
Scenario Outline: Cash Withdrawal validation messages on GET Call

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters accNo "<AccNo>" on cashWithdrawal screen
Then verify validation Message on Get Call "<xpath>" "<ExpectedMessage>"
Examples:
|testCase|MenuName|MenuPath|AccNo|xpath|ExpectedMessage|
|Closed Account|Cash Withdrawal|Menu_CashWithdrawal|101210101100000817|//span[@id='accNocashwithdralentry1_ExceptionMsg']|Account is closed.|
|Closed Customer|Cash Withdrawal|Menu_CashWithdrawal|101210101100000818|//span[@id='accNocashwithdralentry1_ExceptionMsg']|0011000000001829 Customer Is Closed or Deleted|
|Total Freezed Account|Cash Withdrawal|Menu_CashWithdrawal|101210101100000820|//span[@id='accNocashwithdralentry1_ExceptionMsg']|Account is total freeze.|
|Total Freezed Customer|Cash Withdrawal|Menu_CashWithdrawal|101210101100000819|//span[@id='accNocashwithdralentry1_ExceptionMsg']|0011000000001830 Customer Is Debit Freeze|
|Debit Freezed Account|Cash Withdrawal|Menu_CashWithdrawal|101210101100000823|//span[@id='accNocashwithdralentry1_ExceptionMsg']|Account is debit freeze.|
|Debit Freezed Customer|Cash Withdrawal|Menu_CashWithdrawal|101210101100000824|//span[@id='accNocashwithdralentry1_ExceptionMsg']|0011000000001835 Customer Is Debit Freeze|

@TellerDepWithDenom  @withDenom
Scenario Outline: Cash Withdrawal validation messages of Transaction Amount GET Call

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on TellerDeposit screen
Then verify validation Message on Get Call "<xpath>" "Balance is insufficient."
Examples:
|testCase|MenuName|MenuPath|AccNo|xpath|ExpectedMessage|transAmt|
|Closed Account|Cash Withdrawal|Menu_CashWithdrawal|101210101100000817|//span[@id='transAmtcashwithdralentry1_ExceptionMsg']|1000|
|Closed Customer|Cash Withdrawal|Menu_CashWithdrawal|101210101100000818|//span[@id='transAmtcashwithdralentry1_ExceptionMsg']|1000|



@TellerDepWithDenom  @withDenom
Scenario Outline: Cash Withdrawal validation messages on POST Call
Given user opens a testCase "<testCase>"
Given User is on "Teller" "Menu_TellerWithdrawal"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on TellerDeposit screen
And user selects "<instrumentType>" and instrument No "<instrNo>"
And user selects currency "<currency>"
When user click on denomination tab of teller screen
When user enter denominations "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
And click on submit button on TellerDeposit with Denom screen
Then user finds validationMessage"<validationMessage>"

Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|instrumentType|instrNo|currency|tokenNo|validationMessage|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|
|Low balance|Cash Withdrawal|Menu_CashWithdrawal|101210101100000825|500|Withdrawal Slip - 99|123|INR|57|Balance is insufficient.|0|3|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|
|Balance Freeze|Cash Withdrawal|Menu_CashWithdrawal|101210101100000825|500|Withdrawal Slip - 99|123|INR|57|Balance is insufficient.|0|3|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|

@TellerDepWithDenom @setUp @withDenom @sanity
Scenario Outline: 7.Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||