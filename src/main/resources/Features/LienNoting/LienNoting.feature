Feature: Lien Noting Functionality 

@LienNoting1 @setUp 
Scenario Outline: 1.Lien Noting Entry Screen Setup
Scenario : Lien Noting Entry Screen Setup
Given User starts a parentReport "<parentReport>"
#Then setup instrument inventory screen

Examples:
|parentReport|
|Lien Noting| 

@LienNoting
Scenario Outline: Validation Messages on Loan Account Field
Given user opens a testCase "<testCase>"
Given User is on "Lien Marking Entry" "Menu_LienNotingEntry"screen
When user enter accNo "<accNo>" on Lien Noting Entry Screen
Then verify validation Message on Get Call "LienNotingScreen_GetValidationMsg" "<ValidationMessage>" 
Examples:
|testCase|accNo|ValidationMessage|
|Other Than Loan Account in Loan AccNo Field|101210105100000268|Record not found in Loan Master.|
|In-Active Loan Account in Loan AccNo Field|101210104100000258|Account is Not Active.|

@LienNoting
Scenario Outline: Validation Messages on Deposit Account Field
Given user opens a testCase "<testCase>"
Given User is on "Lien Marking Entry" "Menu_LienNotingEntry"screen
When user enter accNo "<accNo>" on Lien Noting Entry Screen
When user enter Deposit accNo "<depAccNo>" on Lien Noting Entry Screen
Then verify validation Message on Get Call "LienNotingScreen_GetValidationMsgOnDepAcc" "<ValidationMessage>" 
Examples:
|testCase|accNo|depAccNo|ValidationMessage|
|Other Than Deposit Account in Dep AccNo Field|101210104100000257|101210101100000816|Invalid Deposit Account.|
|In-Active Dep Account in Dep AccNo Field|101210104100000257|101210105100000269|Record Not Authorised.|
|Different Customers for Loan & Dep Accounts|101210104100000257|101210106060000004|Invalid Deposit Account.|
|Already Matured Deposit Account|101210104100000257|101210105100000267|Account is Matured.|

@LienNoting
Scenario Outline: Validation Messages on Lien Amount Field
Given user opens a testCase "<testCase>"
Given User is on "Lien Marking Entry" "Menu_LienNotingEntry"screen
When user enter accNo "<accNo>" on Lien Noting Entry Screen
When user enter Deposit accNo "<depAccNo>" on Lien Noting Entry Screen
When user enter lien Amount "<LienAmount>" on Lien Noting Entry Screen
Then verify validation Message on Get Call "LienNotingScreen_GetValidationMsgOnLienAmount" "<ValidationMessage>" 
Examples:
|testCase|accNo|depAccNo|LienAmount|ValidationMessage|
|Other Than Deposit Account in Dep AccNo Field|101210104100000257|101210105100000268|46000|Invalid Lien Amount|

@LienNoting
Scenario Outline: Lien Noting Using FD& RD Account
Given user opens a testCase "<testCase>"
Given User is on "Lien Marking Entry" "Menu_LienNotingEntry"screen
When user enter accNo "<accNo>" on Lien Noting Entry Screen
Then Verify customer Name on Lien Noting Entry Screen of accNo "<accNo>"
When user enter Deposit accNo "<depAccNo>" on Lien Noting Entry Screen
Then verify Available balance and presentLien "<presentLien>" and LienAmount "<ActualLienAmount>" of depAccNo "<depAccNo>"
When user enter lien Amount "<LienAmount>" on Lien Noting Entry Screen
And user enter Remarks "<Remarks>" on Lien Noting Entry Screen
And user click on AddDetails button on Lien Noting Entry Screen
And user click on submit button on Lien Noting Entry Screen
Then user finds successMessage "<successMessage>"
Then Verify Lien Table status col "E" with depAcc "<depAccNo>" loanAcc "<accNo>"
Examples:
|testCase|accNo|depAccNo|presentLien|ActualLienAmount|LienAmount|Remarks|successMessage|
|Lien Marking Entry with single Fixed Deposit account|101210104100000257|101210105100000268|0|45000|25000|Lien Entry|Lien Noted Successfully.|
|Lien Marking Entry with single RD account|101210104100000259|101210105930000103|0|9000|5000|Lien Entry|Lien Noted Successfully.|

@LienNoting
Scenario Outline: Lien Noting With Un-Authorized Records
Given user opens a testCase "<testCase>"
Given User is on "Lien Marking Entry" "Menu_LienNotingEntry"screen
When user enter accNo "<accNo>" on Lien Noting Entry Screen
When user enter Deposit accNo "<depAccNo>" on Lien Noting Entry Screen
When user enter lien Amount "<LienAmount>" on Lien Noting Entry Screen
And user enter Remarks "<Remarks>" on Lien Noting Entry Screen
And user click on AddDetails button on Lien Noting Entry Screen
And user click on submit button on Lien Noting Entry Screen
Then user finds successMessage "<successMessage>"
Examples:
|testCase|accNo|depAccNo|presentLien|ActualLienAmount|LienAmount|Remarks|successMessage|
|Lien Marking Entry with Un-Authrized Records in LienMaster|101210104100000257|101210105100000268|0|45000|25000|Lien Entry|Unauthorized lien exist, can't proceed for lien noting entry.|

@LienNoting
Scenario Outline: Lien Noting Using Multiple Accounts( FD& RD )
Given user opens a testCase "<testCase>"
Given User is on "Lien Marking Entry" "Menu_LienNotingEntry"screen
When user enter accNo "<accNo>" on Lien Noting Entry Screen
Then Verify customer Name on Lien Noting Entry Screen of accNo "<accNo>"
When user enter Deposit accNo "<depAccNo>" on Lien Noting Entry Screen
Then verify Available balance and presentLien "<presentLien>" and LienAmount "<ActualLienAmount>" of depAccNo "<depAccNo>"
When user enter lien Amount "<LienAmount>" on Lien Noting Entry Screen
And user enter Remarks "<Remarks>" on Lien Noting Entry Screen
And user click on AddDetails button on Lien Noting Entry Screen
When user enter Deposit accNo "<depAccNo2>" on Lien Noting Entry Screen
Then verify Available balance and presentLien "<presentLien2>" and LienAmount "<ActualLienAmount2>" of depAccNo "<depAccNo2>"
When user enter lien Amount "<LienAmount2>" on Lien Noting Entry Screen
And user enter Remarks "<Remarks2>" on Lien Noting Entry Screen
And user click on AddDetails button on Lien Noting Entry Screen
And user click on submit button on Lien Noting Entry Screen
Then user finds successMessage "<successMessage>"
Then Verify Lien Table status col "E" with depAcc "<depAccNo>" loanAcc "<accNo>"
Then Verify Lien Table status col "E" with depAcc "<depAccNo2>" loanAcc "<accNo>"
Examples:
|testCase|accNo|depAccNo|presentLien|ActualLienAmount|LienAmount|Remarks|depAccNo2|presentLien2|ActualLienAmount2|LienAmount2|Remarks2|successMessage|
|Lien Marking Entry with Multiple Deposit accounts(FD & RD)|101210104100000260|101210105930000104|0|9000|5000|Lien Entry|101210105100000270|0|45000|25000|Lien Entry|Lien Noted Successfully.|



@LienNoting 
Scenario Outline: Lien Noting Auth for single Lien
Given user opens a testCase "<testCase>"
Given User is on "lien marking auth" "Menu_LienNotingAuth"screen
When user select accNo "<accNo>" in Lien Noting Auth screen
Then Verify customer Name on Lien Noting Entry Screen of accNo "<accNo>"
Then verify depAccNo "<depAccNo>" depAccBal  presentLien "<presentLien>" LeinAmount "<LeinAmount>" and remarks "<remarks>" of "<1>"
When user click on submit button on Lien Noting Auth screen
Then user finds successMessage "<successMessage>"
Then Verify Lien Table status col "A" with depAcc "<depAccNo>" loanAcc "<accNo>"
Examples:
|testCase|accNo|depAccNo|presentLien|LeinAmount|remarks|successMessage|
|Lien Marking Entry with single Fixed Deposit account Auth|101210104100000257|101210105100000268|25000|25000|Lien Entry|Record Authorized successfully.|
|Lien Marking Entry with single RD account Auth|101210104100000259|101210105930000103|5000|5000|Lien Entry|Record Authorized successfully.|

@LienNoting 
Scenario Outline: Lien Noting Auth for Multiple Deposit Lien
Given user opens a testCase "<testCase>"
Given User is on "lien marking auth" "Menu_LienNotingAuth"screen
When user select accNo "<accNo>" in Lien Noting Auth screen
Then Verify customer Name on Lien Noting Entry Screen of accNo "<accNo>"
Then verify depAccNo "<depAccNo>" depAccBal  presentLien "<presentLien>" LeinAmount "<LeinAmount>" and remarks "<remarks>"
When user click on submit button on Lien Noting Auth screen
Then user finds successMessage "<successMessage>"
Then Verify Lien Table status col "A" with depAcc "<depAccNo>" loanAcc "<accNo>"
Then Verify Lien Table status col "A" with depAcc "<depAccNo2>" loanAcc "<accNo>"
Examples:
|testCase|accNo|depAccNo|presentLien|LienAmount|Remarks|depAccNo2|presentLien2|LienAmount2|Remarks2|successMessage|
|Lien Marking Entry with Multiple Deposit accounts(FD & RD)|101210104100000260|[{101210105930000104,5000,5000},{101210105100000270,25000,25000}]|5000|5000|Lien Entry|101210105100000270|25000|25000|Lien Entry|Lien Noted Successfully.|

@LienNoting1 @setUp
Scenario Outline: 5.Lien Noting Screen Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||

