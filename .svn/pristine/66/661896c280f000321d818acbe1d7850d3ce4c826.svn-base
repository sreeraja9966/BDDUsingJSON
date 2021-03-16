@SI
Feature: Loan Disbursement Functionality

@SI @setUp @sanity
Scenario Outline: 1.Standing Instruction Screen Setup
Scenario : 1.Standing Instruction Screen Setup
Given User creates a parentReport "<parentReport>"
Then setup Standing Instruction Screen

Examples:
|parentReport|
|Standing Instruction|

############################################################### Standing Instruction Entry ########################################################################################

@sanity
Scenario Outline: 2. Validate Account Status of Credit & Debit Account Number 
Scenario : 2.Validate Account Status of Credit & Debit Account Number
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters "<DebitAccountNumber>" Debit Account Number
Then verify validation Message on Get Call "<Debitxpath>" "<ExpectedMessage>"
And user enters "<CreditAccountNumber>" Credit Account Number
Then verify validation Message on Get Call "<Creditxpath>" "<ExpectedMessage>"

Examples:
|testCase|MenuName|MenuPath|DebitAccountNumber|Debitxpath|ExpectedMessage|CreditAccountNumber|Creditxpath|
|Validate Account Status of Credit & Debit Account Number|Standing Instruction|Menu_SIEntry|101210101200000152|//span[@id='fromAccNoaccountAmountDetails_ExceptionMsg']|Account is closed.|101210101100000817|//span[@id='toAccNoaccountAmountDetails_ExceptionMsg']|

@sanity
Scenario Outline: 3. Validate Next Due Date Based On SI Frequency
Scenario : 3.Validate Next Due Date Based On SI Frequency
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters "<DebitAccountNumber>" Debit Account Number
And user enters "<CreditAccountNumber>" Credit Account Number
Then user select SI Type "<SIType>" Fixed or Floating 
And user enters SI "<Amount>" 
Then user click on Date & SI Settings tab
And user select Frequency from dropdown "<Frequency>"
Then verify Next Due Date "<NextDueDateUi>" in Important Dates table of SI
Examples:
|testCase|MenuName|MenuPath|DebitAccountNumber|CreditAccountNumber|SIType|Amount|Frequency|NextDueDateUi|
|Validate Next Due Date Based On Monthly SI Frequency|Standing Instruction|Menu_SIEntry|101210101200000153|101210101200000153|F|2000|Monthly|23/03/2020|
|Validate Next Due Date Based On Half Yearly SI Frequency|Standing Instruction|Menu_SIEntry|101210101200000153|101210101200000153|F|3000|Half Yearly|23/08/2020|
|Validate Next Due Date Based On Daily SI Frequency|Standing Instruction|Menu_SIEntry|101210101200000153|101210101200000153|F|000|Daily|24/02/2020|
|Validate Next Due Date Based On Bimonthly SI Frequency|Standing Instruction|Menu_SIEntry|101210101200000153|101210101200000153|F|4000|Bimonthly|09/03/2020|
|Validate Next Due Date Based On Quarterly SI Frequency|Standing Instruction|Menu_SIEntry|101210101200000153|101210101200000153|F|3000|Quarterly|23/05/2020|
|Validate Next Due Date Based On Yearly SI Frequency|Standing Instruction|Menu_SIEntry|101210101200000153|101210101200000153|F|2000|Yearly|23/02/2021|

@sanity
Scenario Outline: 4. Validate Expiry Date Based On Period & Frequency
Scenario : 4.Validate Expiry Date Based On Period & Frequency
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters "<DebitAccountNumber>" Debit Account Number
And user enters "<CreditAccountNumber>" Credit Account Number
Then user select SI Type "<SIType>" Fixed or Floating 
And user enters SI "<Amount>" 
Then user click on Date & SI Settings tab
And user select Frequency from dropdown "<Frequency>"
And user enters Period "<Period>" 
Then verify Expiry Date "<ExpiryDateUi>" in Important Dates table of SI

Examples:
|testCase|MenuName|MenuPath|DebitAccountNumber|CreditAccountNumber|SIType|Amount|Frequency|Period|ExpiryDateUi|
|Validate Expiry Date Based On 12 Months Period & Monthly Frequency|Standing Instruction|Menu_SIEntry|101210101000000561|101210101000000561|F|2000|Monthly|12|23/02/2021|
|Validate Expiry Date Based On 24 Months Period & Half Yearly Frequency|Standing Instruction|Menu_SIEntry|101210101000000561|101210101000000561|F|3000|Half Yearly|24|23/02/2032|
|Validate Expiry Date Based On 12 Months Period & Daily Frequency|Standing Instruction|Menu_SIEntry|101210101000000561|101210101000000561|F|2000|Daily|12|06/03/2020|
|Validate Expiry Date Based On 36 Months Period & Bimonthly Frequency|Standing Instruction|Menu_SIEntry|101210101000000561|101210101000000561|F|4000|Bimonthly|36|16/08/2021|
|Validate Expiry Date Based On 24 Months Period & Quarterly Frequency|Standing Instruction|Menu_SIEntry|101210101000000561|101210101000000561|F|3000|Quarterly|24|23/02/2026|
|Validate Expiry Date Based On 12 Months Period & Yearly Frequency|Standing Instruction|Menu_SIEntry|101210101000000561|101210101000000561|F|2000|Yearly|12|23/02/2032|

@sanity
Scenario Outline: 5. Invalid Debit & Credit Account Type Verification
Scenario : 5.Invalid Debit & Credit Account Type Verification
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters "<DebitAccountNumber>" Debit Account Number
And user enters "<CreditAccountNumber>" Credit Account Number
Then user select SI Type "<SIType>" Fixed or Floating 
And user enters SI "<Amount>" 
Then user click on Date & SI Settings tab
And user select Frequency from dropdown "<Frequency>"
And user enters Period "<Period>" 
And user enters GraceDays "<GraceDays>" 
Then user click on Submit of SI button 
Then user finds validationMessage"<ErrorMessage>"
Examples:
|testCase|MenuName|MenuPath|DebitAccountNumber|CreditAccountNumber|SIType|Amount|Frequency|Period|GraceDays|ErrorMessage|
|Credit FD Account|Standing Instruction|Menu_SIEntry|101210101000000561|101210108890000350|F|2000|Monthly|12|0|Invalid credit account type.|
|Debit RD Account|Standing Instruction|Menu_SIEntry|101210105930000102|101210101000000561|F|3000|Bimonthly|24|0|Invalid debit account type.|
|Debit TL Account|Standing Instruction|Menu_SIEntry|101210104000000026|101210101000000561|F|3000|Daily|12|0|Invalid debit account type.|
|Debit FD Account|Standing Instruction|Menu_SIEntry|101210108890000350|101210101000000561|F|3000|Daily|12|0|Invalid debit account type.|


@sanity
Scenario Outline: 6. Fixed SI Type Standing Instruction Entry
Scenario : 6.Fixed SI Type Standing Instruction Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters "<DebitAccountNumber>" Debit Account Number
And user enters "<CreditAccountNumber>" Credit Account Number
Then user select SI Type "<SIType>" Fixed or Floating 
Then verify Debit Customer Name On Ui "<DebitCustomerName>"
Then verify Credit Customer Name On Ui "<CreditAccountNumber>"
And user enters SI "<Amount>" 
Then user verify Todays date "<AccountOpeningDate>" with Branchparameteres
Then user click on Date & SI Settings tab
And user select Frequency from dropdown "<Frequency>"
And user enters Period "<Period>" 
And user enters GraceDays "<GraceDays>" 
Then verify From Narration  "<FromNarration>" and To Narration "<ToNarration>" 
Then user select Freeze SI amount as Yes or No "<FreezeSIamount>" 
Then verify Next Due Date "<NextDueDateUi>" in Important Dates table of SI
Then verify Expiry Date "<ExpiryDateUi>" in Important Dates table of SI
Then user select Execute when enough credit available as Yes or No "<Executewhenenoughcreditavailable>" 
Then user click on Submit of SI button 
Then store number on model with name "<SINumStoreInCache>" and "<KeyInCache>"
Then user finds validationMessage"<SuccessMessage>"
Then verify SI_MASTER table col Credit Account Num "<CreditAccountNumber>" and NextDueDate "<NextDueDate>" and ExpiryDate "<ExpiryDate>" and SiType "<SIType>" and Amount "<Amount>" and DebitAccountNumber "<DebitAccountNumber>" and Flow "<Flow>" and DebitAccountBaseAmount "<DebitAccountBaseAmount>" and MinimumSIAmount "<MinimumSIAmount>" and CreditAccountBaseAmount "<CreditAccountBaseAmount>" and MaximumSIAmount "<MaximumSIAmount>" 

Examples:
|testCase|MenuName|MenuPath|DebitAccountNumber|CreditAccountNumber|SIType|DebitCustomerName|Amount|AccountOpeningDate|Frequency|Period|GraceDays|FromNarration|ToNarration|FreezeSIamount|Executewhenenoughcreditavailable|NextDueDateUi|ExpiryDateUi|SuccessMessage|SINumStoreInCache|KeyInCache|NextDueDate|ExpiryDate|Flow|DebitAccountBaseAmount|MinimumSIAmount|CreditAccountBaseAmount|MaximumSIAmount|
|Standing Instruction Entry With Fixed SI Type|Standing Instruction|Menu_SIEntry|101210101000000561|101210101200000153|F|SAGAR RAM PAWAR|2000|23/02/2020|Monthly|12|0|To SI|From Account|No|Yes|23/03/2020|23/02/2021|SI Entry Save Successfully.|SINum_Fixed|SIEntryScreen_SINumberValue|2020-03-23|2021-02-23|Entry|0|0|0|0|
|SI Entry With Fixed SI Type For Rejection|Standing Instruction|Menu_SIEntry|101210101200000154|101210101010000122|F|SAGAR RAM PAWAR|2000|23/02/2020|Monthly|12|0|To SI|From Account|No|Yes|23/03/2020|23/02/2021|SI Entry Save Successfully.|SINum_FixedRejection|SIEntryScreen_SINumberValue|2020-03-23|2021-02-23|RejectEntry|0|0|0|0|


@SI @sanity
Scenario Outline: 7. Floating SI Type Standing Instruction Entry
Scenario : 7.Floating SI Type Standing Instruction Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters "<DebitAccountNumber>" Debit Account Number
And user enters "<CreditAccountNumber>" Credit Account Number
Then user select SI Type "<SIType>" Fixed or Floating on SI Screen
Then verify Debit Customer Name On Ui "<DebitCustomerName>"
Then verify Credit Customer Name On Ui "<CreditAccountNumber>"
And user enters SI Debit Account Base Amount "<DebitAccountBaseAmount>"
And user enters Minimum SI Amount "<MinimumSIAmount>"
And user enters SI Credit Account Base Amount "<CreditAccountBaseAmount>" 
And user enters Maximum SI Amount "<MaximumSIAmount>"
Then user verify Todays date "<AccountOpeningDate>" with Branchparameteres
Then user click on Date & SI Settings tab
And user select Frequency from dropdown "<Frequency>"
And user enters Period "<Period>" 
And user enters GraceDays "<GraceDays>" 
Then verify From Narration  "<FromNarration>" and To Narration "<ToNarration>" 
Then user select Freeze SI amount as Yes or No "<FreezeSIamount>" 
Then verify Next Due Date "<NextDueDateUi>" in Important Dates table of SI
Then verify Expiry Date "<ExpiryDateUi>" in Important Dates table of SI
Then user select Execute when enough credit available as Yes or No "<Executewhenenoughcreditavailable>" 
Then user click on Submit of SI button 
Then store number on model with name "<SINumStoreInCache>" and "<KeyInCache>"
Then user finds validationMessage"<SuccessMessage>"
Then verify SI_MASTER table col Credit Account Num "<CreditAccountNumber>" and NextDueDate "<NextDueDate>" and ExpiryDate "<ExpiryDate>" and SiType "<SIType>" and Amount "<Amount>" and DebitAccountNumber "<DebitAccountNumber>" and Flow "<Flow>" and DebitAccountBaseAmount "<DebitAccountBaseAmount>" and MinimumSIAmount "<MinimumSIAmount>" and CreditAccountBaseAmount "<CreditAccountBaseAmount>" and MaximumSIAmount "<MaximumSIAmount>"   

Examples:
|testCase|MenuName|MenuPath|DebitAccountNumber|CreditAccountNumber|SIType|DebitCustomerName|DebitAccountBaseAmount|MinimumSIAmount|CreditAccountBaseAmount|MaximumSIAmount|AccountOpeningDate|Frequency|Period|GraceDays|FromNarration|ToNarration|FreezeSIamount|Executewhenenoughcreditavailable|NextDueDateUi|ExpiryDateUi|SuccessMessage|SINumStoreInCache|KeyInCache|NextDueDate|ExpiryDate|Flow|
|Standing Instruction Entry With Floating SI Type|Standing Instruction|Menu_SIEntry|101210101200000153|101210101000000561|V|SAGAR RAM PAWAR|5000|1000|3000|5000|23/02/2020|Quarterly|12|0|To SI|From Account|No|Yes|23/05/2020|23/02/2023|SI Entry Save Successfully.|SINum_Floating|SIEntryScreen_SINumberValue|2020-05-23|2023-02-23|Entry|
|SI Entry With Floating SI Type For Rejection|Standing Instruction|Menu_SIEntry|101210101010000122|101210101200000154|V|SAGAR RAM PAWAR|5000|1000|3000|5000|23/02/2020|Quarterly|12|0|To SI|From Account|No|Yes|23/05/2020|23/02/2023|SI Entry Save Successfully.|SINum_FloatingRejection|SIEntryScreen_SINumberValue|2020-05-23|2023-02-23|RejectEntry|


############################################################### Fixed Standing Instruction Auth ########################################################################################

@sanity
Scenario Outline: 8. Fixed SI Type Standing Instruction Entry Auth
Scenario : 8.Fixed SI Type Standing Instruction Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select Si Number from Dropdown "<SINumStoreInCache>" and verify SI Number Modal Details and SiType "<SIType>" and Next Due Date "<NextDueDateUi>" and Expiry Date "<ExpiryDateUi>" and Entered Date "<AccountOpeningDate>" and Frequency "<Frequency>" and Credit Account Num "<CreditAccountNumber>" and Amount "<Amount>" and DebitAccountNumber "<DebitAccountNumber>"
And user click on Authorize Button
Then user finds validationMessage"<SuccessMessage>"     
Then verify SI_MASTER table where Si Number "<SINumStoreInCache>" and Flow "<Flow>" and SiType "<SIType>"

Examples:
|testCase|MenuName|MenuPath|SINumStoreInCache|SIType|NextDueDateUi|ExpiryDateUi|AccountOpeningDate|Frequency|CreditAccountNumber|Amount|DebitAccountNumber|Flow|SuccessMessage|
|Fixed Standing Instruction Entry Authorization|Standing Instruction|Menu_SIEntryAuth|SINum_Fixed|F|23/03/2020|23/02/2021|23/02/2020|M1|101210101200000153|2,000.00|101210101000000561|Auth|SI Number Authorized Successfully|


############################################################### Floating Standing Instruction Auth ########################################################################################

@SI @sanity
Scenario Outline: 9. Floating SI Type Standing Instruction Entry Auth
Scenario : 9.Floating SI Type Standing Instruction Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select Si Number from Dropdown "<SINumStoreInCache>" and verify Floating SI Number Modal Details and SiType "<SIType>" and Next Due Date "<NextDueDateUi>" and Expiry Date "<ExpiryDateUi>" and Entered Date "<AccountOpeningDate>" and Frequency "<Frequency>" and Credit Account Num "<CreditAccountNumber>" and Amount "<Amount>" and DebitAccountNumber "<DebitAccountNumber>" and DebitAccountBaseAmount "<DebitAccountBaseAmount>" and MinimumSIAmount "<MinimumSIAmount>" and CreditAccountBaseAmount "<CreditAccountBaseAmount>" and MaximumSIAmount "<MaximumSIAmount>"
And user click on Authorize Button
Then user finds validationMessage"<SuccessMessage>"     
Then verify SI_MASTER table where Si Number "<SINumStoreInCache>" and Flow "<Flow>" and SiType "<SIType>"

Examples:
|testCase|MenuName|MenuPath|SINumStoreInCache|SIType|NextDueDateUi|ExpiryDateUi|AccountOpeningDate|Frequency|CreditAccountNumber|Amount|DebitAccountNumber|Flow|SuccessMessage|DebitAccountBaseAmount|MinimumSIAmount|CreditAccountBaseAmount|MaximumSIAmount|
|Floating Standing Instruction Entry Authorization|Standing Instruction|Menu_SIEntryAuth|SINum_Floating|V|23/05/2020|23/02/2023|23/02/2020|M3|101210101000000561|0|101210101200000153|Auth|SI Number Authorized Successfully|5,000.00|1,000.00|3,000.00|5,000.00|


############################################################### Fixed Standing Instruction Rejection ########################################################################################

@sanity
Scenario Outline: 10. Fixed SI Type Standing Instruction Entry Rejection
Scenario : 10.Fixed SI Type Standing Instruction Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select Si Number from Dropdown "<SINumStoreInCache>" and verify SI Number Modal Details and SiType "<SIType>" and Next Due Date "<NextDueDateUi>" and Expiry Date "<ExpiryDateUi>" and Entered Date "<AccountOpeningDate>" and Frequency "<Frequency>" and Credit Account Num "<CreditAccountNumber>" and Amount "<Amount>" and DebitAccountNumber "<DebitAccountNumber>"
And user select reject reason "<RejectReason>" from dropdown
And user click on Reject Button
Then user finds validationMessage"<SuccessMessage>"     
Then verify SI_MASTER table where Si Number "<SINumStoreInCache>" and Flow "<Flow>" and SiType "<SIType>"

Examples:
|testCase|MenuName|MenuPath|SINumStoreInCache|SIType|NextDueDateUi|ExpiryDateUi|AccountOpeningDate|Frequency|CreditAccountNumber|Amount|DebitAccountNumber|Flow|SuccessMessage|RejectReason|
|Fixed Standing Instruction Entry Rejection|Standing Instruction|Menu_SIEntryAuth|SINum_FixedRejection|F|23/03/2020|23/02/2021|23/02/2020|M1|101210101010000122|2,000.00|101210101200000154|Reject|SI Number Rejected Successfully| DUPLICATE ACCOUNT |


############################################################### Floating Standing Instruction Rejection ########################################################################################

@SI @sanity
Scenario Outline: 11. Floating SI Type Standing Instruction Entry Rejection
Scenario : 11.Floating SI Type Standing Instruction Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select Si Number from Dropdown "<SINumStoreInCache>" and verify Floating SI Number Modal Details and SiType "<SIType>" and Next Due Date "<NextDueDateUi>" and Expiry Date "<ExpiryDateUi>" and Entered Date "<AccountOpeningDate>" and Frequency "<Frequency>" and Credit Account Num "<CreditAccountNumber>" and Amount "<Amount>" and DebitAccountNumber "<DebitAccountNumber>" and DebitAccountBaseAmount "<DebitAccountBaseAmount>" and MinimumSIAmount "<MinimumSIAmount>" and CreditAccountBaseAmount "<CreditAccountBaseAmount>" and MaximumSIAmount "<MaximumSIAmount>"
And user select reject reason "<RejectReason>" from dropdown
And user click on Reject Button
Then user finds validationMessage"<SuccessMessage>"     
Then verify SI_MASTER table where Si Number "<SINumStoreInCache>" and Flow "<Flow>" and SiType "<SIType>"

Examples:
|testCase|MenuName|MenuPath|SINumStoreInCache|SIType|NextDueDateUi|ExpiryDateUi|AccountOpeningDate|Frequency|CreditAccountNumber|Amount|DebitAccountNumber|Flow|SuccessMessage|DebitAccountBaseAmount|MinimumSIAmount|CreditAccountBaseAmount|MaximumSIAmount|RejectReason|
|Floating Standing Instruction Entry Rejection|Standing Instruction|Menu_SIEntryAuth|SINum_FloatingRejection|V|23/05/2020|23/02/2023|23/02/2020|M3|101210101200000154|0|101210101010000122|Reject|SI Number Rejected Successfully|5,000.00|1,000.00|3,000.00|5,000.00| INOPERATIVE ACCOUNT |



@SI @setUp @sanity
Scenario Outline: 12.Standing Instruction Screen Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||


