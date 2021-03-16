Feature: Teller Deposit without denomination

@LoanRecoveryUsingTeller @setUp @withoutDenom 
Scenario Outline: TellerDeposit Screen Setup
Given User starts a parentReport "<parentReport>"
Then setup LoanRecoveryCashDeposit Screen
Examples:
|parentReport|
|Loan Receovery using Teller Deposit Without Denomination|

@LoanRecoveryUsingTeller @withoutDenom 
Scenario Outline: Cash Deposit Entry As Account Holder

Given user opens a testCase "<testCase>"
Given User is on "Teller" "Menu_TellerDeposit"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on TellerDeposit screen
And click on submit button on cashDeposit screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "Credited to Account Successfully."
Then verify Transaction_Header table after Auth TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction_Details table TRANS_AMT "<transAmt>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify AllLimitMaster with "A" "TellCshDepst" "<transAmt>"
Then loan_master table after loan recovery by using intType "<IntType>" and accNo "<AccNo>" and trasAmt "<transAmt>"
And user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|StoreInCache|KeyInCache|successMessage|tranType|activity|transCode|IntType|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|
|Recover Cap Int Using Captilised Account|Cash deposit Entry|Menu_CashDeposit|101210104100000243|500|usingCaptilisedAccount|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|D|A|CashDeposite|Captilised|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|
|Recover Rec Int Using Receivable Account|Cash deposit Entry|Menu_CashDeposit|101210104200000069|500|usingReceivableAccount|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|D|A|CashDeposite|Recivable|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|
|Recover Int Due Using AsOnWhen Account|Cash deposit Entry|Menu_CashDeposit|101210104000000059|500|usingAsOnWhenAccount|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|D|A|CashDeposite|AsOnWhen|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|
|Recover Int & Principal Using Captilised Account|Cash deposit Entry|Menu_CashDeposit|101210104100000244|1000|usingCaptilisedAccount|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|D|A|CashDeposite|Captilised|0|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|
|Recover Int & Principal  Using Receivable Account|Cash deposit Entry|Menu_CashDeposit|101210104200000070|1000|usingReceivableAccount|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|D|A|CashDeposite|Recivable|0|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|
|Recover Int & Principal  Using AsOnWhen Account|Cash deposit Entry|Menu_CashDeposit|101210104000000060|1000|usingAsOnWhenAccount|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|D|A|CashDeposite|AsOnWhen|0|2|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|
|Recover total amount Using Captilised Account|Cash deposit Entry|Menu_CashDeposit|101210104100000245|500200|usingCaptilisedAccount|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|D|A|CashDeposite|Captilised|250|0|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|
|Recover total amount Using Receivable Account|Cash deposit Entry|Menu_CashDeposit|101210104200000071|500700|usingReceivableAccount|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|D|A|CashDeposite|Recivable|250|1|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|
|Recover total amount Using AsOnWhen Account|Cash deposit Entry|Menu_CashDeposit|101210104000000061|500500|usingAsOnWhenAccount|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|D|A|CashDeposite|AsOnWhen|250|1|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|0|


@LoanRecoveryUsingTeller @setUp @withoutDenom 
Scenario Outline: 7.Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||
