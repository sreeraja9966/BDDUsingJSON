@FreezeCustAccounts
Feature: Freeze Customer Accounts Functionality

@FreezeCustAccounts @setUp 
Scenario Outline: 1.Freeze Customer Screen Setup
Scenario : 1.Freeze Customer Accounts Screen Setup
Given User creates a parentReport "<parentReport>"
Then setup Freeze Customer Accounts Screen

Examples:
|parentReport|
|Freeze Customer Accounts|

############################################################### Freeze Customer Account Entry ########################################################################################

@FreezeCustAccounts 
Scenario Outline: 2. Freeze Customer Account Entry 
Scenario : 2.Freeze Customer Account Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Freeze Customer Screen
Then verify customer number "<CustNumber>" Customer Name & Cust Category
And user select "<SelectForFreeze>" as Customer or Account
Then user verify customer type "<CustType>" Individual or Non individual
And user select freeze type "<FreezeType>" from dropdown
And user enters freeze reason "<FreezeReason>" 
And user select slider button
And user click on submit button
Then user finds successMessage "<successMessage>"
Then verify Cust_Master table status "<CustStatus>" & Freeze Value "<CustFreeze>" & customer number "<CustNumber>"
Then verify Freeze_Details table Freeze status "<FreezeStatus>" & Freeze Type "<FreezeTypeDB>" & Freeze Reason "<FreezeReason>" & customer number "<CustNumber>"
Then store Account_Master table customer number "<CustNumber>" Status & freeze value before entry
Then verify Account_Master table customer number "<CustNumber>" & FreezeStatus "<AccountFreezeStatus>" & freeze "<AccountFreezeValue>" value after entry
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|SelectForFreeze|CustType|FreezeType|FreezeReason|successMessage|CustStatus|CustFreeze|FreezeStatus|FreezeTypeDB|AccountFreezeStatus|AccountFreezeValue|
|Individual Customer Accounts Total Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001959|Account|Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|A|N|E|T|M|T|
|Individual Customer Accounts Credit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001721|Account|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|A|N|E|C|M|C|
|Individual Customer Accounts Debit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001722|Account|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|A|N|E|D|M|D|
|Non Individual Customer Accounts Total Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001780|Account|Non Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|A|N|E|T|M|T|
|Non Individual Customer Accounts Credit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001781|Account|Non Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|A|N|E|C|M|C|
|Non Individual Customer Accounts Debit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001782|Account|Non Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|A|N|E|D|M|D|

|Individual Cust. Accounts Total Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001956|Account|Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|A|N|E|T|M|T|
|Individual Cust. Accounts Credit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001957|Account|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|A|N|E|C|M|C|
|Individual Cust. Accounts Debit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001958|Account|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|A|N|E|D|M|D|

|Non Individual Cust. Accounts Total Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001960|Account|Non Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|A|N|E|T|M|T|
|Non Individual Cust. Accounts Credit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001961|Account|Non Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|A|N|E|C|M|C|
|Non Individual Cust. Accounts Debit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001962|Account|Non Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|A|N|E|D|M|D|

|Individual Customer Accounts Total Freeze Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001983|Account|Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|A|N|E|T|M|T|
|Individual Customer Accounts Credit Freeze Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001984|Account|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|A|N|E|C|M|C|
|Individual Customer Accounts Debit Freeze Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001985|Account|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|A|N|E|D|M|D|
|Non Individual Customer Accounts Total Freeze Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001986|Account|Non Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|A|N|E|T|M|T|
|Non Individual Customer Accounts Credit Freeze Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001987|Account|Non Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|A|N|E|C|M|C|
|Non Individual Customer Accounts Debit Freeze Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001988|Account|Non Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|A|N|E|D|M|D|

|Individual Cust. Accounts Total Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001989|Account|Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|A|N|E|T|M|T|
|Individual Cust. Accounts Total Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001990|Account|Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|A|N|E|T|M|T|
|Individual Cust. Accounts Credit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001991|Account|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|A|N|E|C|M|C|
|Individual Cust. Accounts Debit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001992|Account|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|A|N|E|D|M|D|

|Non Individual Cust. Accounts Total Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001993|Account|Non Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|A|N|E|T|M|T|
|Non Individual Cust. Accounts Total Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001994|Account|Non Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|A|N|E|T|M|T|
|Non Individual Cust. Accounts Credit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001995|Account|Non Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|A|N|E|C|M|C|
|Non Individual Cust. Accounts Debit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001996|Account|Non Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|A|N|E|D|M|D|

############################################################### Freeze Customer Account Entry Auth ########################################################################################################################################################################################################

@FreezeCustAccounts 
Scenario Outline: 3. Freeze Customer Account Entry Auth
Scenario : 3.Freeze Customer Account Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" from dropdown of Freeze Customer Screen
Then user select batch number "<BatchNumber>" from dropdown of Freeze Customer Screen
And user select "<SelectForFreeze>" as Customer or Account on Auth screen
Then user verify customer type "<CustType>" Individual or Non individual
Then verify customer number "<CustNumber>" & freeze type "<FreezeType>" & freeze reason "<FreezeReason>" on Ui
And user click on authorize button of Freeze Customer Screen
Then user finds successMessage "<successMessage>"
Then verify Cust_Master table status "<CustStatus>" & customer number "<CustNumber>"
Then verify Freeze_Details table Freeze status "<FreezeStatus>" & customer number "<CustNumber>"
Then store Account_Master table customer number "<CustNumber>" Status & freeze value before entry
Then verify Account_Master table customer number "<CustNumber>" & FreezeStatus "<AccountFreezeStatus>" & freeze "<AccountFreezeValue>" value after entry
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|BatchNumber|SelectForFreeze|CustType|FreezeType|FreezeReason|successMessage|CustStatus|FreezeStatus|AccountFreezeStatus|AccountFreezeValue|
|Individual Customer Account Total Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001959|1|Account|Individual|Total Freeze|Total Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|T|
|Individual Customer Account Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001721|1|Account|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|C|
|Individual Customer Account Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001722|1|Account|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|D|
|Non Individual Customer Account Total Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001780|1|Account|Non Individual|Total Freeze|Total Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|T|
|Non Individual Customer Account Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001781|1|Account|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|C|
|Non Individual Customer Account Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001782|1|Account|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|D|

|Individual Cust. Account Total Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001956|1|Account|Individual|Total Freeze|Total Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|T|
|Individual Cust. Account Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001957|1|Account|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|C|
|Individual Cust. Account Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001958|1|Account|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|D|

|Non Individual Cust. Account Total Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001960|1|Account|Non Individual|Total Freeze|Total Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|T|
|Non Individual Cust. Account Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001961|1|Account|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|C|
|Non Individual Cust. Account Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001962|1|Account|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|D|

|Individual Cust. Account Total Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001989|1|Account|Individual|Total Freeze|Total Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|T|
|Individual Cust. Account Total Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001990|1|Account|Individual|Total Freeze|Total Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|T|
|Individual Cust. Account Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001991|1|Account|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|C|
|Individual Cust. Account Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001992|1|Account|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|D|

|Non Individual Cust. Account Total Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001993|1|Account|Non Individual|Total Freeze|Total Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|T|
|Non Individual Cust. Account Total Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001994|1|Account|Non Individual|Total Freeze|Total Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|T|
|Non Individual Cust. Account Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001995|1|Account|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|C|
|Non Individual Cust. Account Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001996|1|Account|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|D|


############################################################### Freeze Customer Account Entry Different Sceanrio  #############################################################################################################################################################################################

@FreezeCustAccounts
Scenario Outline: 4. Freeze Customer Account Entry 
Scenario : 4.Freeze Customer Account Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Freeze Customer Screen
Then verify customer number "<CustNumber>" Customer Name & Cust Category
And user select "<SelectForFreeze>" as Customer or Account
Then user verify customer type "<CustType>" Individual or Non individual
And user select freeze type "<FreezeType>" from dropdown
And user enters freeze reason "<FreezeReason>" 
And user select slider button
And user click on submit button
Then user finds successMessage "<successMessage>"
Then verify Cust_Master table status "<CustStatus>" & Freeze Value "<CustFreeze>" & customer number "<CustNumber>"
Then verify Freeze_Details table Freeze status "<FreezeStatus>" & Freeze Type "<FreezeTypeDB>" & Freeze Reason "<FreezeReason>" & customer number "<CustNumber>"
Then store Account_Master table customer number "<CustNumber>" Status & freeze value before entry
Then verify Account_Master table customer number "<CustNumber>" & FreezeStatus "<AccountFreezeStatus>" & freeze "<AccountFreezeValue>" value after entry
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|SelectForFreeze|CustType|FreezeType|FreezeReason|successMessage|CustStatus|CustFreeze|FreezeStatus|FreezeTypeDB|AccountFreezeStatus|AccountFreezeValue|
|Individual Cust. Account Total To Credit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001959|Account|Individual|Credit Freeze|Total Freezed|Customer account has been Freezed successfully.|A|N|A|T|A|T|
|Individual Cust. Account Credit To Debit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001957|Account|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|A|N|E|D|M|C|
|Individual Cust. Account Debit To Credit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001958|Account|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|A|N|E|C|M|D|
|Individual Cust. Account Total To Debit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001956|Account|Individual|Debit Freeze|Total Freezed|Customer account has been Freezed successfully.|A|N|A|T|A|T|

|Non Individual Cust. Account Total To Credit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001780|Account|Non Individual|Credit Freeze|Total Freezed|Customer account has been Freezed successfully.|A|N|A|T|A|T|
|Non Individual Cust. Account Credit To Debit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001961|Account|Non Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|A|N|E|D|M|C|
|Non Individual Cust. Account Debit To Credit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001962|Account|Non Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|A|N|E|C|M|D|
|Non Individual Cust. Account Total To Debit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001960|Account|Non Individual|Debit Freeze|Total Freezed|Customer account has been Freezed successfully.|A|N|A|T|A|T|

|Individual Cust. Account Total To Credit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001989|Account|Individual|Credit Freeze|Total Freezed|Customer account has been Freezed successfully.|A|N|A|T|A|T|
|Individual Cust. Account Total To Debit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001990|Account|Individual|Debit Freeze|Total Freezed|Customer account has been Freezed successfully.|A|N|A|T|A|T|
|Individual Cust. Account Credit To Debit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001991|Account|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|A|N|E|D|M|C|
|Individual Cust. Account Debit To Credit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001992|Account|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|A|N|E|C|M|D|


|Non Individual Cust. Account Total To Credit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001993|Account|Non Individual|Credit Freeze|Total Freezed|Customer account has been Freezed successfully.|A|N|A|T|A|T|
|Non Individual Cust. Account Total To Debit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001994|Account|Non Individual|Debit Freeze|Total Freezed|Customer account has been Freezed successfully.|A|N|A|T|A|T|
|Non Individual Cust. Account Credit To Debit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001995|Account|Non Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|A|N|E|D|M|C|
|Non Individual Cust. Account Debit To Credit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001996|Account|Non Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|A|N|E|C|M|D|



############################################################### Freeze Customer Account Entry Auth Different Sceanrio  #############################################################################################################################################################################################


Scenario Outline: 5. Freeze Customer Account Entry Auth
Scenario : 5.Freeze Customer Account Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" from dropdown of Freeze Customer Screen
Then user select batch number "<BatchNumber>" from dropdown of Freeze Customer Screen
And user select "<SelectForFreeze>" as Customer or Account on Auth screen
Then user verify customer type "<CustType>" Individual or Non individual
Then verify customer number "<CustNumber>" & freeze type "<FreezeType>" & freeze reason "<FreezeReason>" on Ui
And user click on authorize button of Freeze Customer Screen
Then user finds successMessage "<successMessage>"
Then verify Cust_Master table status "<CustStatus>" & customer number "<CustNumber>"
Then verify Freeze_Details table Freeze status "<FreezeStatus>" & customer number "<CustNumber>"
Then store Account_Master table customer number "<CustNumber>" Status & freeze value before entry
Then verify Account_Master table customer number "<CustNumber>" & FreezeStatus "<AccountFreezeStatus>" & freeze "<AccountFreezeValue>" value after entry
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|BatchNumber|SelectForFreeze|CustType|FreezeType|FreezeReason|successMessage|CustStatus|FreezeStatus|AccountFreezeStatus|AccountFreezeValue|
|Individual Cust. Account Credit To Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001957|2|Account|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|T|
|Individual Cust. Account Debit To Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001958|2|Account|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|T|
|Individual Cust. Account Total To Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001959|2|Account|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|T|
|Individual Cust. Account Total To Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001956|2|Account|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|T|

|Non Individual Cust. Account Credit To Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001961|2|Account|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|T|
|Non Individual Cust. Account Debit To Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001962|2|Account|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|T|
|Non Individual Cust. Account Total To Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001780|2|Account|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|T|
|Non Individual Cust. Account Total To Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001960|2|Account|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Authorize Successfully.|A|A|A|T|


############################################################### Freeze Customer Account Entry Rejection ########################################################################################################################################################################################################


Scenario Outline: 3. Freeze Customer Account Entry Rejection
Scenario : 3.Freeze Customer Account Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" from dropdown of Freeze Customer Screen
Then user select batch number "<BatchNumber>" from dropdown of Freeze Customer Screen
And user select "<SelectForFreeze>" as Customer or Account on Auth screen
Then user verify customer type "<CustType>" Individual or Non individual
Then verify customer number "<CustNumber>" & freeze type "<FreezeType>" & freeze reason "<FreezeReason>" on Ui
And user click on reject button of Freeze Customer Screen
Then user finds successMessage "<successMessage>"
Then verify Cust_Master table status "<CustStatus>" & Freeze Value "<CustFreeze>" & customer number "<CustNumber>"
Then verify Freeze_Details table Freeze status "<FreezeStatus>" & customer number "<CustNumber>"
Then store Account_Master table customer number "<CustNumber>" Status & freeze value before entry
Then verify Account_Master table customer number "<CustNumber>" & FreezeStatus "<AccountFreezeStatus>" & freeze "<AccountFreezeValue>" value after entry
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|BatchNumber|SelectForFreeze|CustType|FreezeType|FreezeReason|successMessage|CustStatus|CustFreeze|FreezeStatus|AccountFreezeStatus|AccountFreezeValue|
|Individual Customer Account Total Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001983|1|Account|Individual|Total Freeze|Total Freezed|Customer Account Freeze Reject Successfully.|A|N|R|A|N|
|Individual Customer Account Credit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001984|1|Account|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Reject Successfully.|A|N|R|A|N|
|Individual Customer Account Debit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001985|1|Account|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Reject Successfully.|A|N|R|A|N|
|Non Individual Customer Account Total Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001986|1|Account|Non Individual|Total Freeze|Total Freezed|Customer Account Freeze Reject Successfully.|A|N|R|A|N|
|Non Individual Customer Account Credit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001987|1|Account|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Reject Successfully.|A|N|R|A|N|
|Non Individual Customer Account Debit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001988|1|Account|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Reject Successfully.|A|N|R|A|N|



############################################################### Freeze Customer Account Entry Rejection Different Sceanrio  #############################################################################################################################################################################################

@FreezeCustAccounts
Scenario Outline: 5. Freeze Customer Account Entry Rejection
Scenario : 5.Freeze Customer Account Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" from dropdown of Freeze Customer Screen
Then user select batch number "<BatchNumber>" from dropdown of Freeze Customer Screen
And user select "<SelectForFreeze>" as Customer or Account on Auth screen
Then user verify customer type "<CustType>" Individual or Non individual
Then verify customer number "<CustNumber>" & freeze type "<FreezeType>" & freeze reason "<FreezeReason>" on Ui
And user click on reject button of Freeze Customer Screen
Then user finds successMessage "<successMessage>"
Then verify Cust_Master table status "<CustStatus>" & customer number "<CustNumber>"
Then verify Freeze_Details table Freeze status "<FreezeStatus>" & customer number "<CustNumber>"
Then store Account_Master table customer number "<CustNumber>" Status & freeze value before entry
Then verify Account_Master table customer number "<CustNumber>" & FreezeStatus "<AccountFreezeStatus>" & freeze "<AccountFreezeValue>" value after entry
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|BatchNumber|SelectForFreeze|CustType|FreezeType|FreezeReason|successMessage|CustStatus|FreezeStatus|AccountFreezeStatus|AccountFreezeValue|
|Individual Cust. Account Credit To Debit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001991|2|Account|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Reject Successfully.|A|R|A|C|
|Individual Cust. Account Debit To Credit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001992|2|Account|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Reject Successfully.|A|R|A|D|
|Individual Cust. Account Total To Credit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001989|2|Account|Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Reject Successfully.|A|R|A|T|
|Individual Cust. Account Total To Debit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001990|2|Account|Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Reject Successfully.|A|R|A|T|

|Non Individual Cust. Account Credit To Debit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001995|2|Account|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Reject Successfully.|A|R|A|C|
|Non Individual Cust. Account Debit To Credit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001996|2|Account|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Reject Successfully.|A|R|A|D|
|Non Individual Cust. Account Total To Credit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001993|2|Account|Non Individual|Credit Freeze|Credit Freezed|Customer Account Freeze Reject Successfully.|A|R|A|T|
|Non Individual Cust. Account Total To Debit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001994|2|Account|Non Individual|Debit Freeze|Debit Freezed|Customer Account Freeze Reject Successfully.|A|R|A|T|

