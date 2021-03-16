Feature: Teller Deposit with denomination

@DepositDDD @setUp
Scenario Outline: TellerDeposit Screen Setup
Given User starts a parentReport "<parentReport>"
Then setup CashDeposit Screen
Examples:
|parentReport|
|Teller Deposit With Denomination|

@DepositDDD
Scenario Outline: Cash Deposit Entry As Account Holder

Given user opens a testCase "<testCase>"
Given User is on "Teller" "Menu_TellerDeposit"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on TellerDeposit screen
When user click on denomination tab of teller screen
When user enter denominations "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
And click on submit button on TellerDeposit with Denom screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "Credited to Account Successfully."
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "0" where accNo "<AccNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction_Details table TRANS_AMT "<transAmt>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify AllLimitMaster with "A" "TellCshDepst" "<transAmt>"
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"

And user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|StoreInCache|KeyInCache|successMessage|AvailableBal|tranType|activity|transCode|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|
|Cash Deposit using SB account|Cash deposit Entry|Menu_CashDeposit|101210101100000816|500|CashDepositusingSBaccount|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100500|D|E|CashDeposite|1|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|
|Cash Deposit using CA account|Cash deposit Entry|Menu_CashDeposit|101210101200000146|500|CashDepositusingCAaccount|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100500|D|E|CashDeposite|1|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|
|Cash Deposit using FD account|Cash deposit Entry|Menu_CashDeposit|101210106060000004|10000|CashDepositusingFDaccount|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|10000|D|E|CashDeposite|5|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|
|Cash Deposit using RD account|Cash deposit Entry|Menu_CashDeposit|101210105900000242|5000|CashDepositusingRDaccount|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|5000|D|E|CashDeposite|2|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|
|Cash Deposit using RD account with multiple of Insta Amount|Cash deposit Entry|Menu_CashDeposit|101210105930000100|20000|CashDepositusingRDaccountMultiInsta|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|20000|D|E|CashDeposite|10|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|
|Cash Deposit using CC account|Cash deposit Entry|Menu_CashDeposit|101210102000000379|5000|CashDepositusingCCaccount|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|5000|D|E|CashDeposite|2|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|
|Cash Deposit using Debit Freezed account|Cash deposit Entry|Menu_CashDeposit|101210101100000823|500|CashDepositusingdebitditFreezeaccount|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100500|D|E|CashDeposite|1|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|
|Cash Deposit using Debit Freezed Customer|Cash deposit Entry|Menu_CashDeposit|101210101100000824|500|CashDepositusingdebitFreezecustomer|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100500|D|E|CashDeposite|1|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|




@DepositD
Scenario Outline: Cash Deposit Validation Check

Given user opens a testCase "<testCase>"
Given User is on "Teller" "Menu_TellerDeposit"screen
When user enters accNo "<AccNo>" on cashDeposit screen
Then verify validation Message on Get Call "//span[@id='accNocashpaymnettellerlimit1_ExceptionMsg']" "<validationMessage>"
And user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|validationMessage|ValidationXpath|
|Cash Deposit using Closed account|Cash deposit Entry|Menu_CashDeposit|101210101100000817|Account is closed.|CashDepositScreen_GetCallValidation|
|Cash Deposit using Closed Customer|Cash deposit Entry|Menu_CashDeposit|101210101100000818|0011000000001829 Customer Is Closed or Deleted|CashDepositScreen_GetCallValidation|
|Cash Deposit using Total Freezed Customer|Cash deposit Entry|Menu_CashDeposit|101210101100000819|0011000000001830 Customer Is Credit Freeze|CashDepositScreen_GetCallValidation|
|Cash Deposit using Total Freezed Account|Cash deposit Entry|Menu_CashDeposit|101210101100000820|Account is credit freeze.|CashDepositScreen_GetCallValidation|
|Cash Deposit using Credit Freezed Account|Cash deposit Entry|Menu_CashDeposit|101210101100000821|Account is credit freeze.|CashDepositScreen_GetCallValidation|
|Cash Deposit using Credit Freezed Customer|Cash deposit Entry|Menu_CashDeposit|101210101100000822|0011000000001833 Customer Is Credit Freeze|CashDepositScreen_GetCallValidation|

@Deposit
Scenario Outline: Cash Deposit Entry As ThirdParty

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on TellerDeposit screen
And user click on ThirdPartyDepositor option
And user enter depositorName "<depositorName>"
And user enter document number "<docNo>"
And user upload a document
And click on addDetails button on cashDeposit screen
And click on submit button on cashDeposit screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<transAmt>" where accNo "<AccNo>"
Then verify Transaction_Header table TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction_Details table TRANS_AMT "<transAmt>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify AllLimitMaster with "<activity>" "<transCode>" "<transAmt>"
Then verify TRANSDOCUMENTDETAILS table status "<status>" docno "<docNo>" depositorName "<depositorName>" where voucher_num "<StoreInCache>" and tranType "<tranType>"
And user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|StoreInCache|KeyInCache|successMessage|AvailableBal|tranType|activity|transCode|depositorName|docNo|status|
|Cash Deposit using ThirdParty|Cash deposit Entry|Menu_CashDeposit|101210101100000863|500|CashDepositusingThirdParty|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100000|D|E|CashDeposite|Raja|AWEAW1232E|E|
@DepositD
Scenario Outline: Cash Deposit Entry IBT

Given user opens a testCase "<testCase>"
Given User is on "Teller" "Menu_TellerDeposit"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on TellerDeposit screen
When user click on denomination tab of teller screen
When user enter denominations "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
And click on submit button on TellerDeposit with Denom screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "Credited to Account Successfully."
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "0" where accNo "<AccNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomN
Then verify Transaction tables in case of IBT using "<tranType>""<StoreInCache>""<transAmt>""<AccNo>""<IbtStatus>""TellCshDepst"
Then verify AllLimitMaster with "A" "TellCshDepst" "<transAmt>"
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
And user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|StoreInCache|KeyInCache|successMessage|AvailableBal|tranType|activity|transCode|IbtStatus|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|
|Cash Deposit using IBT account|Cash deposit Entry|Menu_CashDeposit|101210201100000013|500|CashDepositusingSBaccount|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100500|D|CashDeposite|A|1|0|0|0|0|0|0|0|0|0|3|0|0|0|0|0|0|0|

@DepositD @setUp
Scenario Outline: 7.Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||
