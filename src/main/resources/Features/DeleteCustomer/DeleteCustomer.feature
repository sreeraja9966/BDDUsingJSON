@DeleteCust
Feature: Delete Customer Functionality

@DeleteCust @setUp @sanityNN
Scenario Outline: 1.Delete Customer Screen Setup
Scenario : 1.Delete Customer Screen Setup
Given User creates a parentReport "<parentReport>"
Then setup Delete Customer Screen

Examples:
|parentReport|
|Delete Customer|

############################################################### Delete Customer Entry ########################################################################################


Scenario Outline: 2.Check Validation Message with Customer Status
Scenario : 2.Check Validation Message with Customer Status
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Delete Customer Entry Screen
Then verify validation Message on Get Call "<Xpath>" "<ExpectedMessage>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|Xpath|ExpectedMessage|
|Closed Customer Delete Customer Entry|Customer Delete|Menu_CustomerDeleteEntry|0011000000001829|CustomerDeleteScreen_custNumberaccounts|Customer is already deleted or pending for customer delete authorization.|



Scenario Outline: 3.Active Accounts Of Customer Delete Entry
Scenario : 3.Active Accounts Of Customer Delete Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Delete Customer Entry Screen
Then verify validation Message on Get Call "<Xpath>" "<ExpectedMessage>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|Xpath|ExpectedMessage|
|Active Accounts Of Customer Delete Entry|Customer Delete|Menu_CustomerDeleteEntry|0011000000001738|CustomerDeleteScreen_custNumberaccounts|Unable to delete the record because related account of Customer is not Closed.|


@DeleteCust @sanityNN
Scenario Outline: 4.Individual Customer Delete Entry
Scenario : 4.Individual Customer Delete Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Delete Customer Entry Screen
Then verify customer type "<CustType>" On Ui of Delete Customer Entry Screen
Then verify customer category on Ui where customer number "<CustNumber>" of Delete Customer Entry Screen
Then user enters reason "<Reason>" on Delete Customer Entry Screen
Then verify customer Delete Account Info Verification on Ui where customer number "<CustNumber>"
Then user click on Delete button
Then user finds successMessage "<successMessage>"
Then verify CUST_MASTER table where customer number "<CustNumber>" after Delete Customer Entry
Then verify CUSTOMER_DELETE table where customer number "<CustNumber>" & Reason "<Reason>" & Flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustType|Reason|successMessage|Flow|
|Individual Customer Delete Entry|Customer Delete|Menu_CustomerDeleteEntry|0011000000002001|Individual|Invalid|Customer delete successfully.|Entry|
|Individual Customer Delete Entry For Rejection|Customer Delete|Menu_CustomerDeleteEntry|0011000000002004|Individual|Invalid|Customer delete successfully.|Entry|



Scenario Outline: 5.Duplicate Customer Delete Entry
Scenario : 5.Duplicate Customer Delete Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Delete Customer Entry Screen
Then verify validation Message on Get Call "<Xpath>" "<ExpectedMessage>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|Xpath|ExpectedMessage|
|Duplicate Customer Delete Entry|Customer Delete|Menu_CustomerDeleteEntry|0011000000002001|CustomerDeleteScreen_custNumberaccounts|Customer is already deleted or pending for customer delete authorization.|


Scenario Outline: 6.Non-Individual Customer Delete Entry
Scenario : 6.Non-Individual Customer Delete Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Delete Customer Entry Screen
Then verify customer type "<CustType>" On Ui of Delete Customer Entry Screen
Then verify customer category on Ui where customer number "<CustNumber>" of Delete Customer Entry Screen
Then user enters reason "<Reason>" on Delete Customer Entry Screen
Then verify customer Delete Account Info Verification on Ui where customer number "<CustNumber>"
Then user click on Delete button
Then user finds successMessage "<successMessage>"
Then verify CUST_MASTER table where customer number "<CustNumber>" after Delete Customer Entry
Then verify CUSTOMER_DELETE table where customer number "<CustNumber>" & Reason "<Reason>" & Flow "<Flow>"


Examples:
|testCase|MenuName|MenuPath|CustNumber|CustType|Reason|successMessage|Flow|
|Non-Individual Customer Delete Entry|Customer Delete|Menu_CustomerDeleteEntry|0011000000002002|Non Individual|Duplicate|Customer delete successfully.|Entry|
|Non-Individual Customer Delete Entry For Rejection|Customer Delete|Menu_CustomerDeleteEntry|0011000000002003|Non Individual|Duplicate|Customer delete successfully.|Entry|


############################################################### Delete Customer Entry Auth ########################################################################################

@sanityNN
Scenario Outline: 7.Individual Customer Delete Entry Auth
Scenario : 7.Individual Customer Delete Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" on Delete Customer Entry Screen
Then verify reason on Ui where customer number "<Reason>" of Delete Customer Entry Screen
Then verify customer Delete Account Info Verification on Ui where customer number "<CustNumber>"
Then user click on Authorize button
Then user finds successMessage "<successMessage>"
Then verify CUSTOMER_DELETE & CUST_MASTER table where customer number "<CustNumber>" & Reason "<Reason>" & Flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|Reason|successMessage|Flow|
|Individual Customer Delete Entry Authorization|Customer Delete|Menu_CustomerDeleteEntryAuth|0011000000002001|Invalid|Deleted Customer Authorized Successfully.|Auth|


Scenario Outline: 8.Non Individual Customer Delete Entry Auth
Scenario : 8.Non Individual Customer Delete Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" on Delete Customer Entry Screen
Then verify reason on Ui where customer number "<Reason>" of Delete Customer Entry Screen
Then verify customer Delete Account Info Verification on Ui where customer number "<CustNumber>"
Then user click on Authorize button
Then user finds successMessage "<successMessage>"
Then verify CUSTOMER_DELETE & CUST_MASTER table where customer number "<CustNumber>" & Reason "<Reason>" & Flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|Reason|successMessage|Flow|
|Non Individual Customer Delete Entry Authorization|Customer Delete|Menu_CustomerDeleteEntryAuth|0011000000002002|Duplicate|Deleted Customer Authorized Successfully.|Auth|


############################################################### Delete Customer Entry Rejection ########################################################################################

@DeleteCust
Scenario Outline: 9.Individual Customer Delete Entry Rejection
Scenario : 9.Individual Customer Delete Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" on Delete Customer Entry Screen
Then verify reason on Ui where customer number "<Reason>" of Delete Customer Entry Screen
Then verify customer Delete Account Info Verification on Ui where customer number "<CustNumber>"
Then user click on Reject button
Then user finds successMessage "<successMessage>"
Then verify CUSTOMER_DELETE & CUST_MASTER table where customer number "<CustNumber>" & Reason "<Reason>" & Flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|Reason|successMessage|Flow|
|Individual Customer Delete Entry Rejection|Customer Delete|Menu_CustomerDeleteEntryAuth|0011000000002004|Invalid|Delete Customer Authorization Rejected Successfully.|Reject|


Scenario Outline: 10.Non Individual Customer Delete Entry Rejection
Scenario : 10.Non Individual Customer Delete Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" on Delete Customer Entry Screen
Then verify reason on Ui where customer number "<Reason>" of Delete Customer Entry Screen
Then verify customer Delete Account Info Verification on Ui where customer number "<CustNumber>"
Then user click on Reject button
Then user finds successMessage "<successMessage>"
Then verify CUSTOMER_DELETE & CUST_MASTER table where customer number "<CustNumber>" & Reason "<Reason>" & Flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|Reason|successMessage|Flow|
|Non Individual Customer Delete Entry Rejection|Customer Delete|Menu_CustomerDeleteEntryAuth|0011000000002003|Duplicate|Delete Customer Authorization Rejected Successfully.|Reject|



