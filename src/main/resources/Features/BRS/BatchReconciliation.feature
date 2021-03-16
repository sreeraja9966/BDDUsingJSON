Feature: Batch Reconcililation File Upload Functionality 

@BatchRecon @setUp
Scenario Outline: BatchReconcililation Screen Setup

Given User starts a parentReport "<parentReport>"
Then setup BatchReconScreen
Examples:
|parentReport|
|Batch Reconcililation|



@BatchRecon

Scenario Outline: Batch Reconcilation 
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user select group  " <Group>" 
Then verify "<Recon up to Date(DD/MM/YYYY)>" is read only format
When user click on Submit button on Batch Reconcilation Screen
Then user finds successMessage "<successMessage>"
Then verify Reconcile Transaction table status col with "<status>"
And user closes testCase

Examples:
|testCase|MenuName|MenuPath|Group|Recon up to Date(DD/MM/YYYY)|successMessage|no of Reconciled record|status|
|Batch Reconcilation |Batch Reconciliation|Menu_Batch Reconciliation|1 - ATM|22/02/2020|Reconcilation Successfully Done|15|A|


@BatchRecon @setUp
Scenario Outline: 7.Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||
