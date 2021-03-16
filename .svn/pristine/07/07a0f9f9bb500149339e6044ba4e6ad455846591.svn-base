Feature: Cash Deposit with denomination

@DepositWithoutDenom
Scenario Outline: CashDeposit Screen Setup
Given User starts a parentReport "<parentReport>"
Then setup CashDeposit Screen
Examples:
|parentReport|
|CashDeposit Without Denomination|

@DepositWithoutDenom
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
|Cash Deposit using Debit Freezed account|Cash deposit Entry|Menu_CashDeposit|101210101100000823|500|CashDepositusingCreditFreezeaccountWithoutDenom|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100000|D|E|CashDeposite|
|Cash Deposit using Debit Freezed Customer|Cash deposit Entry|Menu_CashDeposit|101210101100000824|500|CashDepositusingCreditFreezeaccountWithoutDenom|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100000|D|E|CashDeposite|

@DepositWithoutDenom
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

@DepositWithoutDenom
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
|Cash Deposit using ThirdParty|Cash deposit Entry|Menu_CashDeposit|101210101100000816|500|CashDepositusingThirdPartyWithoutDenom|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|100000|D|E|CashDeposite|Raja|AWEAW1232E|E|

@DepositWithoutDenom
Scenario Outline: 7.Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||
