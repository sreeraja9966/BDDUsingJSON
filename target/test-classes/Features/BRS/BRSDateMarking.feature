Feature: Bank Reconciliation Date Marking

@BRSDate @setUp
Scenario Outline: BankReconcililationDate Change Screen Setup

Given User starts a parentReport "<parentReport>"
Then setup BRSDateChange Screen
Examples:
|parentReport|
|Bank Reconcililation Date Marking|

@BRSDate
Scenario Outline: Bank Reconciliation Date Marking

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user select group "<Group>"
Then verify ReconTillDate with GROUP_MASTER table col RECON_UPTO "<GroupName>" 
And user select new recon date from calender "<NewReconTillDate>"
When user click on submit on bank reconciliation date marking Screen
Then user finds successMessage "<successMessage>"
Then verfiy GROUP_MASTER table col RECON_UPTO "<NewReconTillDate>" where GroupID "<GroupName>"

And user closes testCase

Examples:
|testCase|MenuName|MenuPath|Group|ReconTillDate|NewReconTillDate|successMessage|GroupName|
|Bank Reconciliation Date Marking|Bank Reconciliation|Menu_BankReconciliationDateMarking|1 - ATM|25/08/2018|Reconciliation Date Marking Successfully Submitted|ATM|



@BRSDate
Scenario Outline: Date Marking NewReconTillDatte validation

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user select group "<Group>"
And user select new recon date from calender "<NewReconTillDate>"
When user click on submit on bank reconciliation date marking Screen
Then user finds validationMessage"<validationMessage>"
And user closes testCase

Examples:
|testCase|MenuName|MenuPath|Group|ReconTillDate|NewReconTillDate|validationMessage|
|Bank Reconciliation Date Marking With Same Date|Bank Reconciliation|Menu_BankReconciliationDateMarking|1 - ATM|21/08/2018|21/08/2018|Invalid New recon till date|
|Bank Reconciliation Date Marking With Below Date|Bank Reconciliation|Menu_BankReconciliationDateMarking|1 - ATM|21/08/2018|20/08/2018|Invalid New recon till date|




@BRSDate @setUp
Scenario Outline: 7.Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||


