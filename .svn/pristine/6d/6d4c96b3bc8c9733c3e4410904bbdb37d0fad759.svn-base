Feature: Cash Deposit with denomination

@DepositWithoutDenom @setUp @withoutDenom
Scenario Outline: CashDeposit Screen Setup
Given User starts a parentReport "<parentReport>"
Then setup CashDeposit Screen
Examples:
|parentReport|
|CashDeposit Without Denomination|

@DepositWithoutDenom @withoutDenom
Scenario Outline: Cash Deposit Entry As Account Holder

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on cashDeposit screen
And click on addDetails button on cashDeposit screen
And click on submit button on cashDeposit screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<transAmt>" where accNo "<AccNo>"
Then verify Transaction_Header table TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomN
Then verify Transaction_Details table TRANS_AMT "<transAmt>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify AllLimitMaster with "<activity>" "<transCode>" "<transAmt>"
And user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|StoreInCache|KeyInCache|successMessage|AvailableBal|tranType|activity|transCode|
|Cash Deposit using SB account|Cash deposit Entry|Menu_CashDeposit|101210101100000816|500|CashDepositusingSBaccountWithoutDenom|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100000|D|E|CashDeposite|
|Cash Deposit using CA account|Cash deposit Entry|Menu_CashDeposit|101210101200000146|500|CashDepositusingCAaccountWithoutDenom|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100000|D|E|CashDeposite|
|Cash Deposit using FD account|Cash deposit Entry|Menu_CashDeposit|101210106060000004|10000|CashDepositusingFDaccountWithoutDenom|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|0|D|E|CashDeposite|
|Cash Deposit using RD account|Cash deposit Entry|Menu_CashDeposit|101210105900000242|5000|CashDepositusingRDaccountWithoutDenom|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|0|D|E|CashDeposite|
|Cash Deposit using RD account with multiple of Insta Amount|Cash deposit Entry|Menu_CashDeposit|101210105930000100|20000|CashDepositusingRDaccountMultiInstaWithoutDenom|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|0|D|E|CashDeposite|
|Cash Deposit using CC account|Cash deposit Entry|Menu_CashDeposit|101210102000000379|5000|CashDepositusingCCaccountWithoutDenom|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|0|D|E|CashDeposite|
|Cash Deposit using Debit Freezed account|Cash deposit Entry|Menu_CashDeposit|101210101100000823|500|CashDepositusingdebitFreezeaccountWithoutDenom|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100000|D|E|CashDeposite|
|Cash Deposit using Debit Freezed Customer|Cash deposit Entry|Menu_CashDeposit|101210101100000824|500|CashDepositusingdebitFreezecustomerWithoutDenom|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100000|D|E|CashDeposite|

@DepositWithoutDenom @withoutDenom
Scenario Outline: Cash Deposit Authroization
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When enter voucher No on deposit auth screen "<StoreInCache>"
Then verfiy branchCode "<branchCode>" accNo "<accNo>" transAmt "<transAmt>" name "<name>" docNo "<docNo>" DrCr "<DrCr>" on deposit auth screen
When user click on auth button on deposit auth screen
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<accNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomN
Then verify Transaction_Details table TRANS_AMT "<transAmt>" accNo "<accNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify AllLimitMaster with "<activity>" "<transCode>" "<transAmt>"
And user closes testCase

Examples:
|testCase|StoreInCache|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|MenuName|MenuPath|branchCode|accNo|transAmt|name|docNo|DrCr|successMessage|activity|transCode|tranType|ShadowBal|AvailableBal|
|Cash Deposit Auth using SB acc|CashDepositusingSBaccountWithoutDenom|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210101100000816|500|Automation Customer G||C|Successfully Authorize.|A|CashDeposite|D|0|100500|
|Cash Deposit Auth using CA acc|CashDepositusingCAaccountWithoutDenom|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210101200000146|500|Automation Customer G||C|Successfully Authorize.|A|CashDeposite|D|0|100500|
|Cash Deposit Auth using FD acc|CashDepositusingFDaccountWithoutDenom|5|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210106060000004|10000|Automation Customer G||C|Successfully Authorize.|A|CashDeposite|D|0|10000|
|Cash Deposit Auth using RD acc|CashDepositusingRDaccountWithoutDenom|2|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210105900000242|5000|Automation Customer G||C|Successfully Authorize.|A|CashDeposite|D|0|5000|
|Cash Deposit Auth using RD Multiple of InstaAmt|CashDepositusingRDaccountMultiInstaWithoutDenom|10|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210105930000100|20000|Automation Customer G||C|Successfully Authorize.|A|CashDeposite|D|0|20000|
|Cash Deposit Auth using CC acc|CashDepositusingCCaccountWithoutDenom|2|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210102000000379|5000|Automation Customer G||C|Successfully Authorize.|A|CashDeposite|D|0|5000|
|Cash Deposit Auth using Debit Freezed acc|CashDepositusingdebitFreezeaccountWithoutDenom|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210101100000823|500|Automation Customer G||C|Successfully Authorize.|A|CashDeposite|D|0|100500|
|Cash Deposit Auth using Debit Freezed Customer|CashDepositusingdebitFreezecustomerWithoutDenom|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210101100000824|500|Automation Customer G||C|Successfully Authorize.|A|CashDeposite|D|0|100500|

@DepositWithoutDenom @withoutDenom
Scenario Outline: Cash Deposit Entry As ThirdParty

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on cashDeposit screen
And user click on ThirdPartyDepositor option
And user enter depositorName "<depositorName>"
And user enter document number "<docNo>"
And user upload a document
And click on addDetails button on cashDeposit screen
And click on submit button on cashDeposit screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<transAmt>" where accNo "<AccNo>"
Then verify Transaction_Header table TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomN
Then verify Transaction_Details table TRANS_AMT "<transAmt>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify AllLimitMaster with "<activity>" "<transCode>" "<transAmt>"
Then verify TRANSDOCUMENTDETAILS table status "<status>" docno "<docNo>" depositorName "<depositorName>" where voucher_num "<StoreInCache>" and tranType "<tranType>"
And user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|StoreInCache|KeyInCache|successMessage|AvailableBal|tranType|activity|transCode|depositorName|docNo|status|
|Cash Deposit using ThirdParty|Cash deposit Entry|Menu_CashDeposit|101210101100000863|500|CashDepositusingThirdPartyWithoutDenom|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100000|D|E|CashDeposite|Raja|AWEAW1232E|E|
@DepositWithoutDenom @withoutDenom
Scenario Outline: Cash Deposit Authroization using ThirdParty
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When enter voucher No on deposit auth screen "<StoreInCache>"
Then verfiy branchCode "<branchCode>" accNo "<accNo>" transAmt "<transAmt>" name "<name>" docNo "<docNo>" DrCr "<DrCr>" on deposit auth screen
When user click on auth button on deposit auth screen
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<accNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomN
Then verify Transaction_Details table TRANS_AMT "<transAmt>" accNo "<accNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify AllLimitMaster with "<activity>" "<transCode>" "<transAmt>"
Then verify TRANSDOCUMENTDETAILS table status "<status>" docno "<docNo>" depositorName "<depositorName>" where voucher_num "<StoreInCache>" and tranType "<tranType>"
And user closes testCase

Examples:
|testCase|StoreInCache|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|MenuName|MenuPath|branchCode|accNo|transAmt|name|docNo|DrCr|successMessage|activity|transCode|tranType|ShadowBal|AvailableBal|depositorName|status|
|Cash Deposit Auth using ThirdParty|CashDepositusingThirdPartyWithoutDenom|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210101100000863|500|Automation Customer G|AWEAW1232E|C|Successfully Authorize.|A|CashDeposite|D|0|100500|Raja|A|

@DepositWithoutDenom @withoutDenom
Scenario Outline: Cash Deposit Entry As ThirdParty For Rejection

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on cashDeposit screen
And user click on ThirdPartyDepositor option
And user enter depositorName "<depositorName>"
And user enter document number "<docNo>"
And user upload a document
And click on addDetails button on cashDeposit screen
And click on submit button on cashDeposit screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<transAmt>" where accNo "<AccNo>"
Then verify Transaction_Header table TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomN
Then verify Transaction_Details table TRANS_AMT "<transAmt>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify AllLimitMaster with "<activity>" "<transCode>" "<transAmt>"
Then verify TRANSDOCUMENTDETAILS table status "<status>" docno "<docNo>" depositorName "<depositorName>" where voucher_num "<StoreInCache>" and tranType "<tranType>"
And user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|StoreInCache|KeyInCache|successMessage|AvailableBal|tranType|activity|transCode|depositorName|docNo|status|
|Cash Deposit using ThirdParty Entry for Rejection|Cash deposit Entry|Menu_CashDeposit|101210101100000864|500|CashDepositusingThirdPartyRejectionWithoutDenom|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100000|D|E|CashDeposite|Raja|AWEAW1232E|E|
@DepositWithoutDenom @withoutDenom
Scenario Outline: Cash Deposit Rejection using ThirdParty
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When enter voucher No on deposit auth screen "<StoreInCache>"
Then verfiy branchCode "<branchCode>" accNo "<accNo>" transAmt "<transAmt>" name "<name>" docNo "<docNo>" DrCr "<DrCr>" on deposit auth screen
When user click on reject button on deposit auth screen
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<accNo>"
Then verify Transaction_Header table after Rejection TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomN
Then verify Transaction_Details table TRANS_AMT "<transAmt>" accNo "<accNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify TRANSDOCUMENTDETAILS table status "<status>" docno "<docNo>" depositorName "<depositorName>" where voucher_num "<StoreInCache>" and tranType "<tranType>"
And user closes testCase

Examples:
|testCase|StoreInCache|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|MenuName|MenuPath|branchCode|accNo|transAmt|name|docNo|DrCr|successMessage|activity|transCode|tranType|ShadowBal|AvailableBal|depositorName|status|
|Cash Deposit Rejection using ThirdParty|CashDepositusingThirdPartyRejectionWithoutDenom|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210101100000864|500|Automation Customer G|AWEAW1232E|C|Successfully Rejected.|A|CashDeposite|D|0|100000|Raja|R|


@DepositWithoutDenom @withoutDenom
Scenario Outline: Cash Deposit Entry For Rejection

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on cashDeposit screen
And click on addDetails button on cashDeposit screen
And click on submit button on cashDeposit screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
And user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|StoreInCache|KeyInCache|successMessage|AvailableBal|tranType|activity|transCode|
|Cash Deposit using SB account Rejection Entry|Cash deposit Entry|Menu_CashDeposit|101210101100000860|500|CashDepositusingSBaccountRejection|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100000|D|E|CashDeposite|
|Cash Deposit using CA account Rejection Entry|Cash deposit Entry|Menu_CashDeposit|101210101200000151|500|CashDepositusingCAaccountRejection|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100000|D|E|CashDeposite|
|Cash Deposit using FD account Rejection Entry|Cash deposit Entry|Menu_CashDeposit|101210105200000226|10000|CashDepositusingFDaccountRejection|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|0|D|E|CashDeposite|
|Cash Deposit using RD account Rejection Entry|Cash deposit Entry|Menu_CashDeposit|101210105930000101|5000|CashDepositusingRDaccountRejection|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|0|D|E|CashDeposite|
|Cash Deposit using RD account with multiple of Insta Amount Rejection Entry|Cash deposit Entry|Menu_CashDeposit|101210105930000102|20000|CashDepositusingRDaccountMultiInstaRejection|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|0|D|E|CashDeposite|
|Cash Deposit using CC account Rejection Entry|Cash deposit Entry|Menu_CashDeposit|101210102000000419|5000|CashDepositusingCCaccountRejection|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|0|D|E|CashDeposite|
|Cash Deposit using Debit Freezed account Rejection Entry|Cash deposit Entry|Menu_CashDeposit|101210101100000861|500|CashDepositusingdebitditFreezeaccountRejection|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100000|D|E|CashDeposite|
|Cash Deposit using Debit Freezed Customer Rejection Entry|Cash deposit Entry|Menu_CashDeposit|101210101100000862|500|CashDepositusingdebitFreezecustomerRejection|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100000|D|E|CashDeposite|

@DepositWithoutDenom @withoutDenom
Scenario Outline: Cash Deposit Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When enter voucher No on deposit auth screen "<StoreInCache>"
Then verfiy branchCode "<branchCode>" accNo "<accNo>" transAmt "<transAmt>" name "<name>" docNo "<docNo>" DrCr "<DrCr>" on deposit auth screen
When user click on reject button on deposit auth screen
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<accNo>"
Then verify Transaction_Header table after Rejection TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomN
Then verify Transaction_Details table TRANS_AMT "<transAmt>" accNo "<accNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
And user closes testCase

Examples:
|testCase|StoreInCache|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|MenuName|MenuPath|branchCode|accNo|transAmt|name|docNo|DrCr|successMessage|activity|transCode|tranType|ShadowBal|AvailableBal|
|Cash Deposit Rejection using SB acc|CashDepositusingSBaccountRejection|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210101100000860|500|Automation Customer G||C|Successfully Rejected.|A|CashDeposite|D|0|100000|
|Cash Deposit Rejection using CA acc|CashDepositusingCAaccountRejection|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210101200000151|500|Automation Customer G||C|Successfully Rejected.|A|CashDeposite|D|0|100000|
|Cash Deposit Rejection using FD acc|CashDepositusingFDaccountRejection|5|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210105200000226|10000|Automation Customer G||C|Successfully Rejected.|A|CashDeposite|D|0|0|
|Cash Deposit Rejection using RD acc|CashDepositusingRDaccountRejection|2|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210105930000101|5000|Automation Customer G||C|Successfully Rejected.|A|CashDeposite|D|0|0|
|Cash Deposit Rejection using RD Multiple of InstaAmt|CashDepositusingRDaccountMultiInstaRejection|10|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210105930000102|20000|Automation Customer G||C|Successfully Rejected.|A|CashDeposite|D|0|0|
|Cash Deposit Rejection using CC acc|CashDepositusingCCaccountRejection|2|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210102000000419|5000|Automation Customer G||C|Successfully Rejected.|A|CashDeposite|D|0|0|
|Cash Deposit Rejection using Debit Freezed acc|CashDepositusingdebitditFreezeaccountRejection|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210101100000861|500|Automation Customer G||C|Successfully Rejected.|A|CashDeposite|D|0|100000|
|Cash Deposit Rejection using Debit Freezed Customer|CashDepositusingdebitFreezecustomerRejection|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210101100000862|500|Automation Customer G||C|Successfully Rejected.|A|CashDeposite|D|0|100000|


@DepositWithoutDenom @withoutDenom
Scenario Outline: Cash Deposit Validation Check

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters accNo "<AccNo>" on cashDeposit screen
Then verify validation Message on Get Call "<ValidationXpath>" "<validationMessage>"
And user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|validationMessage|ValidationXpath|
|Cash Deposit using Closed account|Cash deposit Entry|Menu_CashDeposit|101210101100000817|Account is closed.|CashDepositScreen_GetCallValidation|
|Cash Deposit using Closed Customer|Cash deposit Entry|Menu_CashDeposit|101210101100000818|0011000000001829 Customer Is Closed or Deleted|CashDepositScreen_GetCallValidation|
|Cash Deposit using Total Freezed Customer|Cash deposit Entry|Menu_CashDeposit|101210101100000819|0011000000001830 Customer Is Credit Freeze|CashDepositScreen_GetCallValidation|
|Cash Deposit using Total Freezed Account|Cash deposit Entry|Menu_CashDeposit|101210101100000820|Account is credit freeze.|CashDepositScreen_GetCallValidation|
|Cash Deposit using Credit Freezed Account|Cash deposit Entry|Menu_CashDeposit|101210101100000821|Account is credit freeze.|CashDepositScreen_GetCallValidation|
|Cash Deposit using Credit Freezed Customer|Cash deposit Entry|Menu_CashDeposit|101210101100000822|0011000000001833 Customer Is Credit Freeze|CashDepositScreen_GetCallValidation|

@DepositWithoutDenom @withoutDenom
Scenario Outline: Cash Deposit IBT Transaction Entry 

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on cashDeposit screen
And click on addDetails button on cashDeposit screen
And click on submit button on cashDeposit screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<transAmt>" where accNo "<AccNo>"
Then verify Transaction_Header table TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomN
Then verify Transaction tables in case of IBT using "<tranType>""<StoreInCache>""<transAmt>""<AccNo>""<IbtStatus>""<transCode>"
Then verify AllLimitMaster with "<activity>" "<transCode>" "<transAmt>"
And user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|StoreInCache|KeyInCache|successMessage|AvailableBal|tranType|activity|transCode|IbtStatus|
|Cash Deposit IBT Entry|Cash deposit Entry|Menu_CashDeposit|101210201100000013|500|CashDepositusingSBaccountWithoutDenom|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100000|D|E|CashDeposite|E|

@DepositWithoutDenom @withoutDenom
Scenario Outline: Cash Deposit IBT Authroization
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When enter voucher No on deposit auth screen "<StoreInCache>"
Then verfiy branchCode "<branchCode>" accNo "<accNo>" transAmt "<transAmt>" name "<name>" docNo "<docNo>" DrCr "<DrCr>" on deposit auth screen
When user click on auth button on deposit auth screen
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<accNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomN
Then verify Transaction tables in case of IBT using "<tranType>""<StoreInCache>""<transAmt>""<AccNo>""<IbtStatus>""<transCode>"
Then verify AllLimitMaster with "<activity>" "<transCode>" "<transAmt>"
And user closes testCase

Examples:
|testCase|StoreInCache|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|MenuName|MenuPath|branchCode|accNo|transAmt|name|docNo|DrCr|successMessage|activity|transCode|tranType|ShadowBal|AvailableBal|IbtStatus|
|Cash Deposit IBT Authroization|CashDepositusingSBaccountWithoutDenom|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|Cash deposit auth|Menu_CashDepositAuth|2101|101210101100000816|500|Automation Customer G||C|Successfully Authorize.|A|CashDeposite|D|0|100500|A|

@DepositWithoutDenom @setUp @withoutDenom
Scenario Outline: 7.Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||
