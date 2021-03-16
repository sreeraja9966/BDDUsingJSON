Feature: Lien Noting Functionality 

@LienNoting1 @setUp 
Scenario Outline: 1.Lien Noting Entry Screen Setup
Scenario : Lien Noting Entry Screen Setup
Given User starts a parentReport "<parentReport>"
#Then setup instrument inventory screen

Examples:
|parentReport|
|Lien Noting| 

@LienNoting1 
Scenario Outline: Validation Messages on Loan Account Field
Given user opens a scenario "<scenario>"
Given user opens a testCase "<testCase>"
Given User is on "Lien Marking Entry" "Menu_LienNotingEntry"screen
When user enter accNo on Lien Noting Entry Screen
Then verify validation Message on Get Call "LienNotingScreen_GetValidationMsg" "<ValidationMessage>"  
Examples:
|testCase|ValidationMessage|scenario|
|Other Than Loan Account in Loan AccNo Field|Record not found in Loan Master.|OtherThanLoanAccountInLoanAccNoField|
|InActive Loan Account in Loan AccNo Field|Account is Not Active.|InActiveLoanAccountInLoanAccNoField|

@LienNoting1
Scenario Outline: Validation Messages on Deposit Account Field
Given user opens a scenario "<scenario>"
Given user opens a testCase "<testCase>"
Given User is on "Lien Marking Entry" "Menu_LienNotingEntry"screen
When user enter accNo on Lien Noting Entry Screen
When user enter Deposit accNo on Lien Noting Entry Screen
Then verify validation Message on Get Call "LienNotingScreen_GetValidationMsgOnDepAcc" "<ValidationMessage>"
Examples:
|testCase|ValidationMessage|scenario|
|Other Than Deposit Account in Dep AccNo Field|Invalid Deposit Account.|OtherThanDepositAccountInDepAccNoField|
|In-Active Dep Account in Dep AccNo Field|Record Not Authorised.|InActiveDepAccountInDepAccNoField|
|Different Customers for Loan & Dep Accounts|Invalid Deposit Account.|DifferentCustomersForLoan&DepAccounts|
|Already Matured Deposit Account|Account is Matured.|AlreadyMaturedDepositAccount|

@LienNoting1
Scenario Outline: Validation Messages on Lien Amount Field
Given user opens a scenario "<scenario>"
Given user opens a testCase "<testCase>"
Given User is on "Lien Marking Entry" "Menu_LienNotingEntry"screen
When user enter accNo on Lien Noting Entry Screen
When user enter Deposit accNo on Lien Noting Entry Screen
When user enter lien Amount on Lien Noting Entry Screen
Then verify validation Message on Get Call "LienNotingScreen_GetValidationMsgOnLienAmount" "<ValidationMessage>" 
Examples:
|testCase|ValidationMessage|scenario|
|Invalid Lien Amount|Invalid Lien Amount|InvalidLienAmount|

@LienNoting1 
Scenario Outline: Lien Noting Using FD& RD Account
Given user opens a testCase "<testCase>"
Given user opens a scenario "<scenario>"
Given User is on "Lien Marking Entry" "Menu_LienNotingEntry"screen
When user enter accNo on Lien Noting Entry Screen
Then Verify customer Name on Lien Noting Entry Screen of accNo
When user enter Deposit accNo on Lien Noting Entry Screen with validation
And user click on submit button on Lien Noting Entry Screen
Then user finds successMessage
Then Verify Lien Table status col with depAcc loanAcc
Examples:
|testCase|scenario|
|Lien Marking Entry with single Fixed Deposit account|LienMarkingEntryWithSingleFixedDepositaccount|
|Lien Marking Entry with single RD account|LienMarkingEntryWithSingleRDAccount|

@LienNoting1
Scenario Outline: Lien Noting With Un-Authorized Records
Given user opens a testCase "<testCase>"
Given user opens a scenario "<scenario>"
Given User is on "Lien Marking Entry" "Menu_LienNotingEntry"screen
When user enter accNo on Lien Noting Entry Screen
When user enter Deposit accNo on Lien Noting Entry Screen with validation
And user click on submit button on Lien Noting Entry Screen
Then user finds successMessage
Examples:
|testCase|scenario|
|Lien Marking Entry with Un-Authrized Records in LienMaster|LienNotingWithUnAuthorizedRecords|

@LienNoting1
Scenario Outline: Lien Noting Using Multiple Accounts( FD& RD )
Given user opens a testCase "<testCase>"
Given user opens a scenario "<scenario>"
Given User is on "Lien Marking Entry" "Menu_LienNotingEntry"screen
When user enter accNo on Lien Noting Entry Screen
When user enter Deposit accNo on Lien Noting Entry Screen with validation
And user click on submit button on Lien Noting Entry Screen
Then user finds successMessage
Then Verify Lien Table status col with depAcc loanAcc
Examples:
|testCase|scenario|
|Lien Marking Entry with Multiple Deposit accounts(FD & RD)|LienMarkingEntryWithMultipleDepositAccounts|



@LienNoting1 
Scenario Outline: Lien Noting Auth for single Lien
Given user opens a testCase "<testCase>"
Given user opens a scenario "<scenario>"
Given User is on "lien marking auth" "Menu_LienNotingAuth"screen
When user select accNo in Lien Noting Auth screen
Then Verify customer Name on Lien Noting Entry Screen of accNo
Then verify depAccNo depAccBal  presentLien LeinAmount and remarks
When user click on submit button on Lien Noting Auth screen
Then user finds successMessage
Then Verify Lien Table status col with depAcc loanAcc
Examples:
|testCase|scenario|
|Lien Marking Entry with single Fixed Deposit account Auth|LienNotingAuthForSingleFDLien|
|Lien Marking Entry with single RD account Auth|LienNotingAuthForSingleRDLien|

@LienNoting1 
Scenario Outline: Lien Noting Auth for Multiple Deposit Lien
Given user opens a testCase "<testCase>"
Given user opens a scenario "<scenario>"
Given User is on "lien marking auth" "Menu_LienNotingAuth"screen
When user select accNo in Lien Noting Auth screen
Then Verify customer Name on Lien Noting Entry Screen of accNo
Then verify depAccNo depAccBal  presentLien LeinAmount and remarks
When user click on submit button on Lien Noting Auth screen
Then user finds successMessage
Then Verify Lien Table status col with depAcc loanAcc
Examples:
|testCase|scenario|
|Lien Noting Auth for Multiple Deposit Lien|LienNotingAuthForMultipleDepositLien|



@LienNoting1
Scenario Outline: Adding Lien On Existing Lien
Given user opens a testCase "<testCase>"
Given user opens a scenario "<scenario>"
Given User is on "Lien Marking Entry" "Menu_LienNotingEntry"screen
When user enter accNo on Lien Noting Entry Screen
Then Verify customer Name on Lien Noting Entry Screen of accNo
When user enter Deposit accNo on Lien Noting Entry Screen with validation
And user click on submit button on Lien Noting Entry Screen
Then user finds successMessage
Then Verify Lien Table status col with depAcc loanAcc
Examples:
|testCase|scenario|
|Adding Lien On Existing Lien Using FD & TL Entry|AddingLienOnExistingLienUsingFD&TLEntry|
|Adding Lien On Existing Lien Using RD & TL Entry|AddingLienOnExistingLienUsingRD&TLEntry|


@LienNoting1 
Scenario Outline: Lien Noting Auth for single Lien
Given user opens a testCase "<testCase>"
Given user opens a scenario "<scenario>"
Given User is on "lien marking auth" "Menu_LienNotingAuth"screen
When user select accNo in Lien Noting Auth screen
Then Verify customer Name on Lien Noting Entry Screen of accNo
Then verify depAccNo depAccBal  presentLien LeinAmount and remarks
When user click on submit button on Lien Noting Auth screen
Then user finds successMessage
Then Verify Lien Table status col with depAcc loanAcc
Examples:
|testCase|scenario|
|Adding Lien On Existing Lien Using FD & TL Auth|AddingLienOnExistingLienUsingFD&TLAuth|
|Adding Lien On Existing Lien Using RD & TL Auth|AddingLienOnExistingLienUsingRD&TLAuth|

@LienNoting1 @setUp 
Scenario Outline: 5.Lien Noting Screen Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||

