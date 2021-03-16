Feature: Teller Deposit with denomination

@TellerDepWithDenom @setUp @withDenom @sanity
Scenario Outline: TellerDeposit Screen Setup
Given User starts a parentReport "<parentReport>"
Then setup CashDeposit Screen
Examples:
|parentReport|
|Teller Deposit With Denomination|

@TellerDepWithDenom  @withDenom @sanity
Scenario Outline: Cash Deposit Entry As Account Holder

Given user opens a testCase "<testCase>"
Given User is on "Teller" "Menu_TellerDeposit"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on TellerDeposit screen
When user click on denomination tab of teller screen
When user enter denominations "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
And click on submit button on TellerDeposit with Denom screen
Then store number on model with name "<StoreInCache>" and "TellerDepositScreen_ModelNumber"
Then user finds successMessage "Credited to Account Successfully."
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "0" where accNo "<AccNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction_Details table TRANS_AMT "<transAmt>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify AllLimitMaster with "A" "TellCshDepst" "<transAmt>"
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
And user closes testCase
Examples:
|testCase|AccNo|transAmt|StoreInCache|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|AvailableBal|tranType|
|Cash Deposit using SB account|101210101100000816|500|CashDepositusingSBaccount|1|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|10500|D|
|Cash Deposit using CA account|101210101200000146|500|CashDepositusingCAaccount|1|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|10500|D|
|Cash Deposit using FD account|101210106060000004|10000|CashDepositusingFDaccount|5|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|10000|D|
|Cash Deposit using RD account|101210105900000242|5000|CashDepositusingRDaccount|2|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|5000|D|
|Cash Deposit using RD account with multiple of Insta Amount|101210105930000100|20000|CashDepositusingRDaccountWithMultiple|10|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|20000|D|
|Cash Deposit using CC account|101210102000000379|5000|CashDepositusingCCaccount|2|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|5000|D|
|Cash Deposit using Debit Freezed account|101210101100000823|500|CashDepositusingDebitFreezedaccount|1|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|10500|D|
|Cash Deposit using Debit Freezed Customer|101210101100000824|500|CashDepositusingDebitFreezedCustomer|1|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|10500|D|

@TellerDepWithDenom  @withDenom 
Scenario Outline: Cash Deposit Entry IBT

Given user opens a testCase "<testCase>"
Given User is on "Teller" "Menu_TellerDeposit"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on TellerDeposit screen
When user click on denomination tab of teller screen
When user enter denominations "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
And click on submit button on TellerDeposit with Denom screen
Then store number on model with name "<StoreInCache>" and "TellerDepositScreen_ModelNumber"
Then user finds successMessage "Credited to Account Successfully."
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "0" where accNo "<AccNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction tables in case of IBT using "<tranType>""<StoreInCache>""<transAmt>""<AccNo>""A""TellCshDepst"
Then verify AllLimitMaster with "A" "TellCshDepst" "<transAmt>"
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
And user closes testCase
Examples:
|testCase|AccNo|transAmt|StoreInCache|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|AvailableBal|tranType|
|Cash Deposit IBT using SB account|101210101100000816|500|CashDepositusingSBaccount|1|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|10500|D|

@TellerDepWithDenom  @withDenom
Scenario Outline: Cash Deposit Validation Check

Given user opens a testCase "<testCase>"
Given User is on "Teller" "Menu_TellerDeposit"screen
When user enters accNo "<AccNo>" on cashDeposit screen
Then verify validation Message on Get Call "//span[@id='accNocashpaymnettellerlimit1_ExceptionMsg']" "<validationMessage>"
And user closes testCase
Examples:
|testCase|AccNo|validationMessage|
|Cash Deposit using Closed account|101210101100000817|Account is closed.|
|Cash Deposit using Closed Customer|101210101100000818|0011000000001829 Customer Is Closed or Deleted|
|Cash Deposit using Total Freezed Customer|101210101100000819|0011000000001830 Customer Is Credit Freeze|
|Cash Deposit using Total Freezed Account|101210101100000820|Account is credit freeze.|
|Cash Deposit using Credit Freezed Account|101210101100000821|Account is credit freeze.|
|Cash Deposit using Credit Freezed Customer|101210101100000822|0011000000001833 Customer Is Credit Freeze|

@TellerDepWithDenom1  @withDenom
Scenario Outline: Cash Deposit Entry AS Third Party
Given user opens a testCase "<testCase>"
Given User is on "Teller" "Menu_TellerDeposit"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on TellerDeposit screen
And user click on ThirdPartyDepositor option
And user enter depositorName "<depositorName>"
And user enter document number "<docNo>" on Teller Screen
And user upload a document
When user click on denomination tab of teller screen
When user enter denominations "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
And click on submit button on TellerDeposit with Denom screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "Credited to Account Successfully."
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "0" where accNo "<AccNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction_Details table TRANS_AMT "<transAmt>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify AllLimitMaster with "A" "TellCshDepst" "<transAmt>"
Then verify TRANSDOCUMENTDETAILS table status "<status>" docno "<docNo>" depositorName "<depositorName>" where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
And user closes testCase
Examples:
|testCase|AccNo|transAmt|depositorName|docNo|StoreInCache|KeyInCache|AvailableBal|tranType|status|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|
|Cash Deposit As Third Party Using Teller|101210101100000863|500|Raja|AXQPG2123M|CashDepositAsThirdPartyUsingTeller|TellerDepositScreen_ModelNumber|10500|D|A|1|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|

@TellerDepWithDenom @setUp @withDenom @sanity
Scenario Outline: 7.Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||

