@RevokeFreezeCustomer
Feature: Revoke Freeze Customer Functionality

@RevokeFreezeCustomer @setUp 
Scenario Outline: 1.Revoke Freeze Customer Screen Setup
Scenario : 1.Revoke Freeze Customer Screen Setup
Given User creates a parentReport "<parentReport>"
Then setup Revoke Freeze Customer Screen

Examples:
|parentReport|
|Revoke Freeze Customer|

############################################################### Revoke Freeze Customer Entry ########################################################################################

@RevokeFreezeCustomer 
Scenario Outline: 2. Revoke Customer Freeze Entry 
Scenario : 2.Revoke Customer Freeze Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Revoke Freeze Customer Screen
Then user select batch number "<BatchNumber>" from dropdown of Revoke Freeze Customer Screen
And user select "<SelectForRevoke>" as Customer or Account on Revoke screen
Then user verify customer type "<CustType>" Individual or Non individual
Then verify customer number "<CustNumber>" & freeze type "<FreezeType>" & freeze reason "<FreezeReason>" on Revoke Entry Ui
And user click on submit button of Revoke Freeze Customer Screen
Then user finds successMessage "<successMessage>"
Then verify Cust_Master table status "<CustStatus>" & Freeze Value "<CustFreeze>" & customer number "<CustNumber>"
Then verify Freeze_Details table Freeze status "<RevokeFreezeStatus>" & customer number "<CustNumber>" after revoke entry
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|BatchNumber|SelectForRevoke|CustType|FreezeType|FreezeReason|successMessage|CustStatus|CustFreeze|RevokeFreezeStatus|
|Individual Customer Total Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001977|1|Customer|Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoked Successfully.|A|T|D|
|Individual Customer Credit Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001715|1|Customer|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoked Successfully.|A|C|D|
|Individual Customer Debit Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001716|1|Customer|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoked Successfully.|A|D|D|

|Non Individual Customer Total Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001980|1|Customer|Non Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoked Successfully.|A|T|D|
|Non Individual Customer Credit Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001778|1|Customer|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoked Successfully.|A|C|D|
|Non Individual Customer Debit Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001779|1|Customer|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoked Successfully.|A|D|D|

|Individual Customer Total To Credit Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001950|1|Customer|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoked Successfully.|A|T|D|
|Individual Customer Total To Debit Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001951|1|Customer|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoked Successfully.|A|T|D|

|Non Individual Customer Total To Credit Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001953|1|Customer|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoked Successfully.|A|T|D|
|Non Individual Customer Total To Debit Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001954|1|Customer|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoked Successfully.|A|T|D|


|Individual Customer Total Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001714|1|Customer|Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoked Successfully.|A|T|D|
|Individual Customer Credit Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001975|1|Customer|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoked Successfully.|A|C|D|
|Individual Customer Debit Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001976|1|Customer|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoked Successfully.|A|D|D|

|Non Individual Customer Total Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001955|1|Customer|Non Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoked Successfully.|A|T|D|
|Non Individual Customer Credit Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001978|1|Customer|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoked Successfully.|A|C|D|
|Non Individual Customer Debit Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001979|1|Customer|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoked Successfully.|A|D|D|

|Individual Customer Total To Credit Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001952|1|Customer|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoked Successfully.|A|T|D|
|Individual Customer Total To Debit Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001981|1|Customer|Individual|Total Freeze|Debit Freezed|Customer Account Freeze Revoked Successfully.|A|T|D|

|Non Individual Customer Total To Credit Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001777|1|Customer|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoked Successfully.|A|T|D|
|Non Individual Customer Total To Debit Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001982|1|Customer|Non Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoked Successfully.|A|T|D|


############################################################### Revoke Freeze Customer Entry Auth ########################################################################################

@RevokeFreezeCustomer 
Scenario Outline: 2. Revoke Customer Freeze Entry Auth
Scenario : 2.Revoke Customer Freeze Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" on Revoke Freeze Customer Auth Screen
Then user select batch number "<BatchNumber>" from dropdown of Revoke Freeze Customer Screen
And user select "<SelectForRevoke>" as Customer or Account on Revoke screen
Then user verify customer type "<CustType>" Individual or Non individual
Then verify customer number "<CustNumber>" & freeze type "<FreezeType>" & freeze reason "<FreezeReason>" & Revoke Date on Revoke Auth Ui
And user click on authorize button of Revoke Freeze Customer Auth Screen
Then user finds successMessage "<successMessage>"
Then verify Cust_Master table status "<CustStatus>" & Freeze Value "<CustFreeze>" & customer number "<CustNumber>"
Then verify Freeze_Details table Freeze status "<RevokeFreezeStatus>" & customer number "<CustNumber>" after revoke entry
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|BatchNumber|SelectForRevoke|CustType|FreezeType|FreezeReason|successMessage|CustStatus|CustFreeze|RevokeFreezeStatus|
|Individual Customer Total Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001977|1|Customer|Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoke Authorized Successfully.|A|N|K|
|Individual Customer Credit Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001715|1|Customer|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoke Authorized Successfully.|A|N|K|
|Individual Customer Debit Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001716|1|Customer|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoke Authorized Successfully.|A|N|K|

|Non Individual Customer Total Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001980|1|Customer|Non Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoke Authorized Successfully.|A|N|K|
|Non Individual Customer Credit Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001778|1|Customer|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoke Authorized Successfully.|A|N|K|
|Non Individual Customer Debit Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001779|1|Customer|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoke Authorized Successfully.|A|N|K|

|Individual Customer Total To Credit Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001950|1|Customer|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoke Authorized Successfully.|A|D|K|
|Individual Customer Total To Debit Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001951|1|Customer|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoke Authorized Successfully.|A|C|K|

|Non Individual Customer Total To Credit Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001953|1|Customer|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoke Authorized Successfully.|A|D|K|
|Non Individual Customer Total To Debit Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001954|1|Customer|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoke Authorized Successfully.|A|C|K|


############################################################### Revoke Freeze Customer Entry Rejection ########################################################################################

@RevokeFreezeCustomer
Scenario Outline: 2. Revoke Customer Freeze Entry Rejection
Scenario : 2.Revoke Customer Freeze Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" on Revoke Freeze Customer Auth Screen
Then user select batch number "<BatchNumber>" from dropdown of Revoke Freeze Customer Screen
And user select "<SelectForRevoke>" as Customer or Account on Revoke screen
Then user verify customer type "<CustType>" Individual or Non individual
Then verify customer number "<CustNumber>" & freeze type "<FreezeType>" & freeze reason "<FreezeReason>" & Revoke Date on Revoke Auth Ui
And user click on reject button of Revoke Freeze Customer Auth Screen
Then user finds successMessage "<successMessage>"
Then verify Cust_Master table status "<CustStatus>" & Freeze Value "<CustFreeze>" & customer number "<CustNumber>"
Then verify Freeze_Details table Freeze status "<RevokeFreezeStatus>" & customer number "<CustNumber>" after revoke entry
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|BatchNumber|SelectForRevoke|CustType|FreezeType|FreezeReason|successMessage|CustStatus|CustFreeze|RevokeFreezeStatus|
|Individual Customer Total Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001714|1|Customer|Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|T|A|
|Individual Customer Credit Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001975|1|Customer|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|C|A|
|Individual Customer Debit Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001976|1|Customer|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|D|A|

|Non Individual Customer Total Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001955|1|Customer|Non Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|T|A|
|Non Individual Customer Credit Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001978|1|Customer|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|C|A|
|Non Individual Customer Debit Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001979|1|Customer|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|D|A|

|Individual Customer Total To Credit Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001952|1|Customer|Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|T|A|
|Individual Customer Total To Debit Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001981|1|Customer|Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|T|A|

|Non Individual Customer Total To Credit Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001777|1|Customer|Non Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|T|A|
|Non Individual Customer Total To Debit Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001982|1|Customer|Non Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|T|A|




