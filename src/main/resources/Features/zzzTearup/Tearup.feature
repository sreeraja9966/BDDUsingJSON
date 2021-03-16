Feature: CBS Login Functionality 
@login @setUp @sanity
Scenario Outline: BankReconcililation Screen Setup
Scenario : 1.Bank Reconcililation Screen Setup
Given User starts a parentReport "<parentReport>"
Then setup BRScreen
Examples:
|parentReport|
|Tear Up|

@login @sanity
Scenario: Tearup CBS Application

Given User Should get logoutFrom Cbs application


@login @setUp @sanity
Scenario Outline: 7.Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||