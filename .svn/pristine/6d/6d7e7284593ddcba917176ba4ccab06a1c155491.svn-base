Feature: Bank Reconcililation File Upload Functionality 

@BRFileupload @setUp
Scenario Outline: BankReconcililation Screen Setup

Given User starts a parentReport "<parentReport>"
Then setup BRFileUploadScreen
Examples:
|parentReport|
|Bank Reconcililation File Upload|



@BRFileupload
Scenario Outline: Upload Bank Reconcilation file for Delimeter 
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user select group and part "<Group>" "<Party>"
Then verify "<Recon date till date>" "<Last data uploded date>" is read only format
When user select Browse option select text file from "<Location>" for "<fileType>"
Then display two record"<noOfRecords>"is display 
When user click on confirm button on model in Bank Reconcilation screen
When user click on Submit button on Bank Reconcilation file upload screen
Then user finds successMessage "<successMessage>"
Then verify Reconc Transaction table status col with "<status>"
And user closes testCase

Examples:
|testCase|MenuName|MenuPath|Group|Party|Recon date till date|Last data uploded date|Location|fileType|noOfRecords|successMessage|status|
|Bank Reconcilation file Upload with Delimeter|Bank Reconciliation|Menu_BankReconciliationFileUpload|1 - ATM|1 - IFSC|22/08/2018|23/02/2020|\\src\\main\\resources\\signature\\Del.txt|D|10|Successfully uploaded file.|E|
|Bank Reconcilation file Upload with Fixed Format|Bank Reconciliation|Menu_BankReconciliationFileUpload|1 - ATM|1 - IFSC|22/08/2018|23/02/2020|\\src\\main\\resources\\signature\\FIXED.txt|F|2|Successfully uploaded file.|E|

@BRFileupload
Scenario Outline: Upload wrong Bank Reconcilation file for Fixed
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user select group and part "<Group>" "<Party>"
When user select Browse option select text file from "<Location>" for "<fileType>"
Then user finds validationMessage"<validationMessage>"
And user closes testCase


Examples:
|testCase|MenuName|MenuPath|Group|Party|Recon date till date|Last data uploded date|Location|fileType|validationMessage|
|Invalid File Format incase of Fixed Format|Bank Reconciliation|Menu_BankReconciliationFileUpload|1 - ATM|1 - IFSC|22/08/2018|22/03/2020|\\src\\main\\resources\\signature\\Wrong Del.txt|D|Error while reading file.|
|Invalid File Format incase of Delimeter|Bank Reconciliation|Menu_BankReconciliationFileUpload|1 - ATM|1 - IFSC|22/08/2018|22/03/2020|\\src\\main\\resources\\signature\\Wrong fix.txt|F|Error while reading file.|



@BRFileupload @setUp
Scenario Outline: 7.Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||
