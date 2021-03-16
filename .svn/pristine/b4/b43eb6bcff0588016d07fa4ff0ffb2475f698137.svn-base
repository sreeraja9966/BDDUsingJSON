Feature: Bank Reconcililation Functionality 

@BR @setUp @sanity
Scenario Outline: BankReconcililation Screen Setup
Scenario : 1.Bank Reconcililation Screen Setup
Given User starts a parentReport "<parentReport>"
Then setup BRScreen
Examples:
|parentReport|
|Bank Reconcililation|

@BR @sanity
Scenario Outline: 1.Bank Reconciliation Entry

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user select group and part "<Group>" "<Party>"
And user enters following on bank reconciliation screen "<CBSDate>" "<InputBranch>" "<InstrumentNo>" "<TransID>" "<Amount>" "<EnteredAcntDrCrIndicator>" "<CustomerBranchCode>" "<CustomerAccountNo>" "<TransactionDate>" "<TransactionTime>" "<ATMID>" "<Particulars>"
And click on ADD record button on bank reconciliation Screen
When user click on submit on bank reconciliation Screen
Then user finds successMessage "Data Entered Successfully"
Then verfiy RECONC_TRANSACTION table verify "<CBSDate>" "<InputBranch>" "<InstrumentNo>" "<TransID>" "<Amount>" "<EnteredAcntDrCrIndicator>" "<CustomerBranchCode>" "<CustomerAccountNo>" "<TransactionDate>" "<TransactionTime>" "<ATMID>" "<Particulars>"

And user closes testCase

Examples:
|testCase|MenuName|MenuPath|Group|Party|CBSDate|InputBranch|InstrumentNo|TransID|Amount|EnteredAcntDrCrIndicator|CustomerBranchCode|CustomerAccountNo|TransactionDate|TransactionTime|ATMID|Particulars|successMessage|
|Bank Reconciliation Entry|Bank Reconciliation|Menu_BankReconciliation|1 - ATM|1 - IFSC|22/02/2020|2102|36|fg66|400.00|cr|2104|789654123|01/12/2019|8|gh78|pou89|Data Saved Successfully|

@BR
Scenario Outline: 2.Checking Field Validation For Field

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user select group and part "<Group>" "<Party>"
When user enter invalid value in "<colName>" "<invalidValue>"
Then verify validation Message on Get Call "<FieldXpath>" "<ValidationMessage>"
And user closes testCase

Examples:
|testCase|MenuName|MenuPath|Group|Party|colName|invalidValue|FieldXpath|ValidationMessage|
|Checking Field Validation For InputBranch Field|Bank Reconciliation|Menu_BankReconciliation|1 - ATM|1 - IFSC|BankReconciliation_InputBranch|B2102|BankReconciliation_FieldValidation|Input Branch not a valid input.|
|Checking Field Validation For InstrumentNo Field|Bank Reconciliation|Menu_BankReconciliation|1 - ATM|1 - IFSC|BankReconciliation_InstrNo|Insr78|BankReconciliation_FieldValidation|Instruments No not a valid input.|
|Checking Field Validation For TransID Field|Bank Reconciliation|Menu_BankReconciliation|1 - ATM|1 - IFSC|BankReconciliation_TransId|AS@5|BankReconciliation_FieldValidation|Trans ID not a valid input.|
|Checking Field Validation For EnteredAcntDrCrIndicator Field|Bank Reconciliation|Menu_BankReconciliation|1 - ATM|1 - IFSC|BankReconciliation_DrCrIndicator| Cr2|BankReconciliation_FieldValidation|EnteredAcntDrCrIndicator not a valid input.|
|Checking Field Validation For CustomerBranchCode Field|Bank Reconciliation|Menu_BankReconciliation|1 - ATM|1 - IFSC|BankReconciliation_BranchCode|CB2105|BankReconciliation_FieldValidation|CustomerBranchCode not a valid input.|
|Checking Field Validation For CustomerAccountNo Field|Bank Reconciliation|Menu_BankReconciliation|1 - ATM|1 - IFSC|BankReconciliation_AccNo|Acc785214963|BankReconciliation_FieldValidation|CustomerAccountNo not a valid input.|
|Checking Field Validation For TransactionTime Field|Bank Reconciliation|Menu_BankReconciliation|1 - ATM|1 - IFSC|BankReconciliation_TransTime|8AM|BankReconciliation_FieldValidation|TransactionTime not a valid input.|
|Checking Field Validation For ATMID Field|Bank Reconciliation|Menu_BankReconciliation|1 - ATM|1 - IFSC|BankReconciliation_ATMId|ATM4%|BankReconciliation_FieldValidation|ATMID not a valid input.|





@BR @setUp @sanity
Scenario Outline: 7.Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||