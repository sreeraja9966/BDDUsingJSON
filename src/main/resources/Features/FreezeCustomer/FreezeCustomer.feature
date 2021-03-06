@FreezeCustomer
Feature: Freeze Customer Functionality

@FreezeCustomer @setUp 
Scenario Outline: 1.Freeze Customer Screen Setup
Scenario : 1.Freeze Customer Screen Setup
Given User creates a parentReport "<parentReport>"
Then setup Freeze Customer Screen

Examples:
|parentReport|
|Freeze Customer|

############################################################### Freeze Customer Entry ########################################################################################

@FreezeCustomer 
Scenario Outline: 2. Customer Freeze Entry 
Scenario : 2.Customer Freeze Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Freeze Customer Screen
Then verify customer number "<CustNumber>" Customer Name & Cust Category
And user select "<SelectForFreeze>" as Customer or Account
Then user verify customer type "<CustType>" Individual or Non individual
And user select freeze type "<FreezeType>" from dropdown
And user enters freeze reason "<FreezeReason>" 
And user click on submit button
Then user finds successMessage "<successMessage>"
Then verify Cust_Master table status "<CustStatus>" & Freeze Value "<CustFreeze>" & customer number "<CustNumber>"
Then verify Freeze_Details table Freeze status "<FreezeStatus>" & Freeze Type "<FreezeTypeDB>" & Freeze Reason "<FreezeReason>" & customer number "<CustNumber>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|SelectForFreeze|CustType|FreezeType|FreezeReason|successMessage|CustStatus|CustFreeze|FreezeStatus|FreezeTypeDB|
|Individual Customer Total Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001714|Customer|Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|M|T|E|T|
|Individual Customer Credit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001715|Customer|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|M|C|E|C|
|Individual Customer Debit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001716|Customer|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|M|D|E|D|
|Non Individual Customer Total Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001777|Customer|Non Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|M|T|E|T|
|Non Individual Customer Credit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001778|Customer|Non Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|M|C|E|C|
|Non Individual Customer Debit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001779|Customer|Non Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|M|D|E|D|

|Individual Cust. Credit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001950|Customer|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|M|C|E|C|
|Individual Cust. Debit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001951|Customer|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|M|D|E|D|
|Individual Cust. Total Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001952|Customer|Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|M|T|E|T|

|Non Individual Cust. Credit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001953|Customer|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|M|C|E|C|
|Non Individual Cust. Debit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001954|Customer|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|M|D|E|D|
|Non Individual Cust. Total Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001955|Customer|Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|M|T|E|T|


|Individual Customer Total Freeze Entry for Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001963|Customer|Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|M|T|E|T|
|Individual Customer Credit Freeze Entry for Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001964|Customer|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|M|C|E|C|
|Individual Customer Debit Freeze Entry for Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001965|Customer|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|M|D|E|D|
|Non Individual Customer Total Freeze Entry for Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001966|Customer|Non Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|M|T|E|T|
|Non Individual Customer Credit Freeze Entry for Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001967|Customer|Non Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|M|C|E|C|
|Non Individual Customer Debit Freeze Entry for Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001968|Customer|Non Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|M|D|E|D|

|Individual Cust. Credit Freeze Entry for Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001969|Customer|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|M|C|E|C|
|Individual Cust. Debit Freeze Entry for Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001970|Customer|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|M|D|E|D|
|Individual Cust. Total Freeze Entry for Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001971|Customer|Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|M|T|E|T|

|Non Individual Cust. Credit Freeze Entry for Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001972|Customer|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|M|C|E|C|
|Non Individual Cust. Debit Freeze Entry for Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001973|Customer|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|M|D|E|D|
|Non Individual Cust. Total Freeze Entry for Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001974|Customer|Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|M|T|E|T|


|Individual Cust. Credit Freeze Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001975|Customer|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|M|C|E|C|
|Individual Cust. Debit Freeze Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001976|Customer|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|M|D|E|D|
|Individual Cust. Total Freeze Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001977|Customer|Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|M|T|E|T|
|Individual Cust. Total Freeze Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001981|Customer|Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|M|T|E|T|

|Non Individual Cust. Credit Freeze Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001978|Customer|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|M|C|E|C|
|Non Individual Cust. Debit Freeze Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001979|Customer|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|M|D|E|D|
|Non Individual Cust. Total Freeze Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001980|Customer|Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|M|T|E|T|
|Non Individual Cust. Total Freeze Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001982|Customer|Individual|Total Freeze|Total Freezed|Customer account has been Freezed successfully.|M|T|E|T|

############################################################### Freeze Customer Entry  Auth ########################################################################################################################################################################################################

@FreezeCustomer 
Scenario Outline: 3. Customer Freeze Entry Auth
Scenario : 3.Customer Freeze Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" from dropdown of Freeze Customer Screen
Then user select batch number "<BatchNumber>" from dropdown of Freeze Customer Screen
Then verify customer number "<CustNumber>" & freeze type "<FreezeType>" & freeze reason "<FreezeReason>" on Ui
And user click on authorize button of Freeze Customer Screen
Then user finds successMessage "<successMessage>"
Then verify Cust_Master table status "<CustStatus>" & customer number "<CustNumber>"
Then verify Freeze_Details table Freeze status "<FreezeStatus>" & customer number "<CustNumber>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|BatchNumber|FreezeType|FreezeReason|successMessage|CustStatus|FreezeStatus|
|Individual Customer Total Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001714|1|Total Freeze|Total Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Individual Customer Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001715|1|Credit Freeze|Credit Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Individual Customer Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001716|1|Debit Freeze|Debit Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Non Individual Customer Total Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001777|1|Total Freeze|Total Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Non Individual Customer Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001778|1|Credit Freeze|Credit Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Non Individual Customer Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001779|1|Debit Freeze|Debit Freezed|Freeze Customer Account Authorized Successfully.|A|A|

|Individual Cust. Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001950|1|Credit Freeze|Credit Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Individual Cust. Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001951|1|Debit Freeze|Debit Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Individual Cust. Total Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001952|1|Total Freeze|Total Freezed|Freeze Customer Account Authorized Successfully.|A|A|

|Non Individual Cust. Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001953|1|Credit Freeze|Credit Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Non Individual Cust. Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001954|1|Debit Freeze|Debit Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Non Individual Cust. Total Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001955|1|Total Freeze|Total Freezed|Freeze Customer Account Authorized Successfully.|A|A|

|Individual Cust. Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001975|1|Credit Freeze|Credit Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Individual Cust. Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001976|1|Debit Freeze|Debit Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Individual Cust. Total Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001977|1|Total Freeze|Total Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Individual Cust. Total Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001981|1|Total Freeze|Total Freezed|Freeze Customer Account Authorized Successfully.|A|A|

|Non Individual Cust. Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001978|1|Credit Freeze|Credit Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Non Individual Cust. Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001979|1|Debit Freeze|Debit Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Non Individual Cust. Total Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001980|1|Total Freeze|Total Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Non Individual Cust. Total Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001982|1|Total Freeze|Total Freezed|Freeze Customer Account Authorized Successfully.|A|A|


############################################################### Freeze Customer Entry Different Sceanrio  #############################################################################################################################################################################################

@FreezeCustomer 
Scenario Outline: 4.Customer Freeze Entry Different Sceanrio
Scenario : 4.Customer Freeze Entry Different Sceanrio
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Freeze Customer Screen
Then verify customer number "<CustNumber>" Customer Name & Cust Category
And user select "<SelectForFreeze>" as Customer or Account
Then user verify customer type "<CustType>" Individual or Non individual
And user select freeze type "<FreezeType>" from dropdown
And user enters freeze reason "<FreezeReason>" 
And user click on submit button
Then user finds successMessage "<successMessage>"
Then verify Cust_Master table status "<CustStatus>" & Freeze Value "<CustFreeze>" & customer number "<CustNumber>"
Then verify Freeze_Details table Freeze status "<FreezeStatus>" & Freeze Type "<FreezeTypeDB>" & Freeze Reason "<FreezeReason>" & customer number "<CustNumber>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|SelectForFreeze|CustType|FreezeType|FreezeReason|successMessage|CustStatus|CustFreeze|FreezeStatus|FreezeTypeDB|
|Individual Cust. Credit To Debit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001950|Customer|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|M|T|E|D|
|Individual Cust. Debit To Credit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001951|Customer|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|M|T|E|C|
|Individual Cust. Total To Credit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001714|Customer|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|M|T|E|C|
|Individual Cust. Total To Debit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001952|Customer|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|M|T|E|D|

|Non Individual Cust. Credit To Debit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001953|Customer|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|M|T|E|D|
|Non Individual Cust. Debit To Credit Freeze Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001954|Customer|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|M|T|E|C|
|Non Individual Cust. Total To Credit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001777|Customer|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|M|T|E|C|
|Non Individual Cust. Total To Debit Entry|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001955|Customer|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|M|T|E|D|


|Individual Cust. Credit To Debit Freeze Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001975|Customer|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|M|T|E|D|
|Individual Cust. Debit To Credit Freeze Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001976|Customer|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|M|T|E|C|
|Individual Cust. Total To Credit Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001977|Customer|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|M|T|E|C|
|Individual Cust. Total To Debit Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001981|Customer|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|M|T|E|D|

|Non Individual Cust. Credit To Debit Freeze Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001978|Customer|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|M|T|E|D|
|Non Individual Cust. Debit To Credit Freeze Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001979|Customer|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|M|T|E|C|
|Non Individual Cust. Total To Credit Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001982|Customer|Individual|Credit Freeze|Credit Freezed|Customer account has been Freezed successfully.|M|T|E|C|
|Non Individual Cust. Total To Debit Entry For Rejection|Freeze Customer Account|Menu_FreezeCustomerAccount|0011000000001980|Customer|Individual|Debit Freeze|Debit Freezed|Customer account has been Freezed successfully.|M|T|E|D|


############################################################### Freeze Customer Entry Auth Of Different Sceanrio  #############################################################################################################################################################################################

@FreezeCustomer 
Scenario Outline: 5. Customer Freeze Entry Auth Different Sceanrio
Scenario : 5.Customer Freeze Entry Auth Different Sceanrio
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" from dropdown of Freeze Customer Screen
Then user select batch number "<BatchNumber>" from dropdown of Freeze Customer Screen
Then verify customer number "<CustNumber>" & freeze type "<FreezeType>" & freeze reason "<FreezeReason>" on Ui
And user click on authorize button of Freeze Customer Screen
Then user finds successMessage "<successMessage>"
Then verify Cust_Master table status "<CustStatus>" & customer number "<CustNumber>"
Then verify Freeze_Details table Freeze status "<FreezeStatus>" & customer number "<CustNumber>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|BatchNumber|FreezeType|FreezeReason|successMessage|CustStatus|FreezeStatus|
|Individual Cust. Credit To Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001950|2|Debit Freeze|Debit Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Individual Cust. Debit To Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001951|2|Credit Freeze|Credit Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Individual Cust. Total To Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001714|2|Credit Freeze|Credit Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Individual Cust. Total To Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001952|2|Debit Freeze|Debit Freezed|Freeze Customer Account Authorized Successfully.|A|A|

|Non Individual Cust. Credit To Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001953|2|Debit Freeze|Debit Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Non Individual Cust. Debit To Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001954|2|Credit Freeze|Credit Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Non Individual Cust. Total To Credit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001777|2|Credit Freeze|Credit Freezed|Freeze Customer Account Authorized Successfully.|A|A|
|Non Individual Cust. Total To Debit Freeze Entry Auth|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001955|2|Debit Freeze|Debit Freezed|Freeze Customer Account Authorized Successfully.|A|A|


############################################################### Freeze Customer Entry Rejection ########################################################################################################################################################################################################

@FreezeCustomer 
Scenario Outline: 3. Customer Freeze Entry Rejection
Scenario : 3.Customer Freeze Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" from dropdown of Freeze Customer Screen
Then user select batch number "<BatchNumber>" from dropdown of Freeze Customer Screen
Then verify customer number "<CustNumber>" & freeze type "<FreezeType>" & freeze reason "<FreezeReason>" on Ui
And user click on reject button of Freeze Customer Screen
Then user finds successMessage "<successMessage>"
Then verify Cust_Master table status "<CustStatus>" & Freeze Value "<CustFreeze>" & customer number "<CustNumber>"
Then verify Freeze_Details table Freeze status "<FreezeStatus>" & customer number "<CustNumber>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|BatchNumber|FreezeType|FreezeReason|successMessage|CustStatus|FreezeStatus|CustFreeze|
|Individual Customer Total Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001963|1|Total Freeze|Total Freezed|Customer Account Freeze Rejected Successfully.|A|R|N|
|Individual Customer Credit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001964|1|Credit Freeze|Credit Freezed|Customer Account Freeze Rejected Successfully.|A|R|N|
|Individual Customer Debit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001965|1|Debit Freeze|Debit Freezed|Customer Account Freeze Rejected Successfully.|A|R|N|
|Non Individual Customer Total Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001966|1|Total Freeze|Total Freezed|Customer Account Freeze Rejected Successfully.|A|R|N|
|Non Individual Customer Credit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001967|1|Credit Freeze|Credit Freezed|Customer Account Freeze Rejected Successfully.|A|R|N|
|Non Individual Customer Debit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001968|1|Debit Freeze|Debit Freezed|Customer Account Freeze Rejected Successfully.|A|R|N|

|Individual Cust. Credit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001969|1|Credit Freeze|Credit Freezed|Customer Account Freeze Rejected Successfully.|A|R|N|
|Individual Cust. Debit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001970|1|Debit Freeze|Debit Freezed|Customer Account Freeze Rejected Successfully.|A|R|N|
|Individual Cust. Total Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001971|1|Total Freeze|Total Freezed|Customer Account Freeze Rejected Successfully.|A|R|N|

|Non Individual Cust. Credit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001972|1|Credit Freeze|Credit Freezed|Customer Account Freeze Rejected Successfully.|A|R|N|
|Non Individual Cust. Debit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001973|1|Debit Freeze|Debit Freezed|Customer Account Freeze Rejected Successfully.|A|R|N|
|Non Individual Cust. Total Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001974|1|Total Freeze|Total Freezed|Customer Account Freeze Rejected Successfully.|A|R|N|


############################################################### Freeze Customer Entry Rejection Of Different Sceanrio  #############################################################################################################################################################################################

@FreezeCustomer
Scenario Outline: 3. Customer Freeze Entry Rejection Different Sceanrio
Scenario : 3.Customer Freeze Entry Rejection Different Sceanrio
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" from dropdown of Freeze Customer Screen
Then user select batch number "<BatchNumber>" from dropdown of Freeze Customer Screen
Then verify customer number "<CustNumber>" & freeze type "<FreezeType>" & freeze reason "<FreezeReason>" on Ui
And user click on reject button of Freeze Customer Screen
Then user finds successMessage "<successMessage>"
Then verify Cust_Master table status "<CustStatus>" & Freeze Value "<CustFreeze>" & customer number "<CustNumber>"
Then verify Freeze_Details table Freeze status "<FreezeStatus>" & customer number "<CustNumber>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|BatchNumber|FreezeType|FreezeReason|successMessage|CustStatus|FreezeStatus|CustFreeze|
|Individual Cust. Credit To Debit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001975|2|Debit Freeze|Debit Freezed|Customer Account Freeze Rejected Successfully.|A|R|C|
|Individual Cust. Debit To Credit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001976|2|Credit Freeze|Credit Freezed|Customer Account Freeze Rejected Successfully.|A|R|D|
|Individual Cust. Total To Credit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001977|2|Credit Freeze|Credit Freezed|Customer Account Freeze Rejected Successfully.|A|R|T|
|Individual Cust. Total To Debit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001981|2|Debit Freeze|Debit Freezed|Customer Account Freeze Rejected Successfully.|A|R|T|

|Non Individual Cust. Credit To Debit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001978|2|Debit Freeze|Debit Freezed|Customer Account Freeze Rejected Successfully.|A|R|C|
|Non Individual Cust. Debit To Credit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001979|2|Credit Freeze|Credit Freezed|Customer Account Freeze Rejected Successfully.|A|R|D|
|Non Individual Cust. Total To Credit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001982|2|Credit Freeze|Credit Freezed|Customer Account Freeze Rejected Successfully.|A|R|T|
|Non Individual Cust. Total To Debit Freeze Entry Rejection|Freeze Customer Account|Menu_FreezeCustomerAccountAuth|0011000000001980|2|Debit Freeze|Debit Freezed|Customer Account Freeze Rejected Successfully.|A|R|T|


