@RevokeFreezeCustomerAccount
Feature: Revoke Freeze Customer Account Functionality

@RevokeFreezeCustomerAccount @setUp 
Scenario Outline: 1.Revoke Freeze Customer Account Screen Setup
Scenario : 1.Revoke Freeze Customer Account Screen Setup
Given User creates a parentReport "<parentReport>"
Then setup Revoke Freeze Customer Account Screen

Examples:
|parentReport|
|Revoke Freeze Customer Account|

############################################################### Revoke Freeze Customer Account Entry ########################################################################################

@RevokeFreezeCustomerAccount 
Scenario Outline: 2. Revoke Customer Freeze Account Entry 
Scenario : 2.Revoke Customer Freeze Account Entry
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
Then store Account_Master table customer number "<CustNumber>" Status & freeze value before entry
Then verify Account_Master table customer number "<CustNumber>" & FreezeStatus "<AccountFreezeStatus>" & freeze "<AccountFreezeValue>" value after entry
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|BatchNumber|SelectForRevoke|CustType|FreezeType|FreezeReason|successMessage|CustStatus|CustFreeze|RevokeFreezeStatus|AccountFreezeStatus|AccountFreezeValue|
|Individual Customer Account Total Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001959|1|Account|Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|T|
|Individual Customer Account Credit Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001721|1|Account|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|C|
|Individual Customer Account Debit Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001722|1|Account|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|D|

|Non Individual Customer Account Total Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001780|1|Account|Non Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|T|
|Non Individual Customer Account Credit Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001781|1|Account|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|C|
|Non Individual Customer Account Debit Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001782|1|Account|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|D|

|Individual Customer Account Total To Credit Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001957|1|Account|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|T|
|Individual Customer Account Total To Debit Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001958|1|Account|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|T|

|Non Individual Customer Account Total To Credit Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001961|1|Account|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|T|
|Non Individual Customer Account Total To Debit Revoke Freeze Entry|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001962|1|Account|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|T|


|Individual Customer Account Total Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001956|1|Account|Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|T|
|Individual Customer Account Credit Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001991|1|Account|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|C|
|Individual Customer Account Debit Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001992|1|Account|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|D|

|Non Individual Customer Account Total Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001994|1|Account|Non Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|T|
|Non Individual Customer Account Credit Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001995|1|Account|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|C|
|Non Individual Customer Account Debit Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001996|1|Account|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|D|

|Individual Customer Account Total To Credit Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001990|1|Account|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|T|
|Individual Customer Account Total To Debit Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001989|1|Account|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|T|

|Non Individual Customer Account Total To Credit Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001960|1|Account|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|T|
|Non Individual Customer Account Total To Debit Revoke Freeze Entry For Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntry|0011000000001993|1|Account|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoked Successfully.|A|N|D|A|T|


############################################################### Revoke Freeze Customer Account Entry Auth ########################################################################################

@RevokeFreezeCustomerAccount 
Scenario Outline: 3. Revoke Customer Account Freeze Entry Auth
Scenario : 3.Revoke Customer Account Freeze Entry Auth
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
Then store Account_Master table customer number "<CustNumber>" Status & freeze value before entry
Then verify Account_Master table customer number "<CustNumber>" & FreezeStatus "<AccountFreezeStatus>" & freeze "<AccountFreezeValue>" value after entry
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|BatchNumber|SelectForRevoke|CustType|FreezeType|FreezeReason|successMessage|CustStatus|CustFreeze|RevokeFreezeStatus|AccountFreezeStatus|AccountFreezeValue|
|Individual Customer Account Total Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001959|1|Account|Individual|Total Freeze|Total Freezed|Customer/Account Freeze Revoke Authorization Successful|A|N|K|A|N|
|Individual Customer Account Credit Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001721|1|Account|Individual|Credit Freeze|Credit Freezed|Customer/Account Freeze Revoke Authorization Successful|A|N|K|A|N|
|Individual Customer Account Debit Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001722|1|Account|Individual|Debit Freeze|Debit Freezed|Customer/Account Freeze Revoke Authorization Successful|A|N|K|A|N|

|Non Individual Customer Account Total Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001780|1|Account|Non Individual|Total Freeze|Total Freezed|Customer/Account Freeze Revoke Authorization Successful|A|N|K|A|N|
|Non Individual Customer Account Credit Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001781|1|Account|Non Individual|Credit Freeze|Credit Freezed|Customer/Account Freeze Revoke Authorization Successful|A|N|K|A|N|
|Non Individual Customer Account Debit Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001782|1|Account|Non Individual|Debit Freeze|Debit Freezed|Customer/Account Freeze Revoke Authorization Successful|A|N|K|A|N|

|Individual Customer Account Total To Credit Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001957|1|Account|Individual|Credit Freeze|Credit Freezed|Customer/Account Freeze Revoke Authorization Successful|A|N|K|A|N|
|Individual Customer Account Total To Debit Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001958|1|Account|Individual|Debit Freeze|Debit Freezed|Customer/Account Freeze Revoke Authorization Successful|A|N|K|A|N|

|Non Individual Customer Account Total To Credit Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001961|1|Account|Non Individual|Credit Freeze|Credit Freezed|Customer/Account Freeze Revoke Authorization Successful|A|N|K|A|N|
|Non Individual Customer Account Total To Debit Revoke Freeze Entry Auth|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001962|1|Account|Non Individual|Debit Freeze|Debit Freezed|Customer/Account Freeze Revoke Authorization Successful|A|N|K|A|N|



############################################################### Revoke Freeze Customer Account Entry Rejection ########################################################################################

@RevokeFreezeCustomerAccount
Scenario Outline: 4. Revoke Customer Account Freeze Entry Rejection
Scenario : 4.Revoke Customer Account Freeze Entry Rejection
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
Then store Account_Master table customer number "<CustNumber>" Status & freeze value before entry
Then verify Account_Master table customer number "<CustNumber>" & FreezeStatus "<AccountFreezeStatus>" & freeze "<AccountFreezeValue>" value after entry
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|BatchNumber|SelectForRevoke|CustType|FreezeType|FreezeReason|successMessage|CustStatus|CustFreeze|RevokeFreezeStatus|AccountFreezeStatus|AccountFreezeValue|
|Individual Customer Account Total Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001956|1|Account|Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|N|A|A|T|
|Individual Customer Account Credit Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001991|1|Account|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|N|A|A|C|
|Individual Customer Account Debit Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001992|1|Account|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|N|A|A|D|

|Non Individual Customer Account Total Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001994|1|Account|Non Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|N|A|A|T|
|Non Individual Customer Account Credit Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001995|1|Account|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|N|A|A|C|
|Non Individual Customer Account Debit Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001996|1|Account|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|N|A|A|D|

|Individual Customer Account Total To Credit Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001990|1|Account|Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|N|A|A|T|
|Individual Customer Account Total To Debit Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001989|1|Account|Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|N|A|A|T|

|Non Individual Customer Account Total To Credit Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001960|1|Account|Non Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|N|A|A|T|
|Non Individual Customer Account Total To Debit Revoke Freeze Rejection|Revoke Freeze On Customer Account|Menu_RevokeFreezeCustomerAccountEntryAuth|0011000000001993|1|Account|Non Individual|Total Freeze|Total Freezed|Customer Account Freeze Revoke Rejected Successfully.|A|N|A|A|T|

