@BlacklistCust
Feature: Blacklist Customer Functionality

@BlacklistCust @setUp 
Scenario Outline: 1.Blacklist Customer Screen Setup
Scenario : 1.Blacklist Customer Screen Setup
Given User creates a parentReport "<parentReport>"
Then setup Blacklist Customer Screen

Examples:
|parentReport|
|Blacklist Customer|

############################################################### Blacklist Customer Entry ########################################################################################


Scenario Outline: 2.Check Validation Message with Customer Status
Scenario : 2.Check Validation Message with Customer Status
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Blacklist Customer Entry Screen
Then verify validation Message on Get Call "<Xpath>" "<ExpectedMessage>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|Xpath|ExpectedMessage|
|Closed Customer Blacklist Customer Entry|Blacklisted Customer Marking|Menu_BlacklistedCustomerMarkEntry|0011000000001829|BlacklistCustomerScreen_custStatus|Customer is Closed.|



Scenario Outline: 3.Check Validation Message with Customer Status
Scenario : 3.Check Validation Message with Customer Status
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Blacklist Customer Entry Screen
Then verify validation Message on Get Call "<Xpath>" "<ExpectedMessage>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|Xpath|ExpectedMessage|
|Deceased Customer Blacklist Customer Entry|Blacklisted Customer Marking|Menu_BlacklistedCustomerMarkEntry|0011000000002000|BlacklistCustomerScreen_custStatus|customer is deceased.|


@BlacklistCust 
Scenario Outline: 4. Blacklist Customer Entry With Document
Scenario : 4.Blacklist Customer Entry With Document
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Blacklist Customer Entry Screen
Then user verify Account Details of Blacklist Customer On Ui where xpath "<xpath>" & customer number "<CustNumber>"
Then user verify Cust Name & DOB & Category where customer number "<CustNumber>"
And user enters blacklist reason "<Reason>"
And user click on Submit button on Blacklist Customer Entry
Then user finds successMessage "<successMessage>"
Then verify BLACK_LIST_MASTER table where customer number "<CustNumber>"
Then verify BLACK_LIST_DETAILS table where customer number "<CustNumber>"
Then verify FREEZE_DETAILS table where customer number "<CustNumber>"
Then verify SP_INSTRUCTION_DETAILS table where customer number "<CustNumber>"
Then store Account_Master table customer number "<CustNumber>" Status & freeze value before blacklist entry
Then verify Account_Master table customer number "<CustNumber>" & FreezeStatus "<AccountFreezeStatus>" & freeze "<AccountFreezeValue>" value after blacklist entry

Examples:
|testCase|MenuName|MenuPath|CustNumber|Reason|xpath|AccountFreezeStatus|AccountFreezeValue|successMessage|
|Blacklist Customer Entry With Document|Blacklisted Customer Marking|Menu_BlacklistedCustomerMarkEntry|0011000000001730|FIU Order|//div[@id='accountDetails']|B|D|Customer Blacklisted Successfully.|
|Blacklist Customer Entry With Document For Rejection|Blacklisted Customer Marking|Menu_BlacklistedCustomerMarkEntry|0011000000001732|FIU Order|//div[@id='accountDetails']|B|D|Customer Blacklisted Successfully.|


@BlacklistCust
Scenario Outline: 5. Blacklist Customer Entry Without Document
Scenario : 5.Blacklist Customer Entry Without Document
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Blacklist Customer Entry Screen
Then user verify Account Details of Blacklist Customer On Ui where xpath "<xpath>" & customer number "<CustNumber>"
Then user verify Cust Name & DOB & Category where customer number "<CustNumber>"
And user enters blacklist reason "<Reason>"
And user click on Submit button on Blacklist Customer Entry
Then user finds successMessage "<successMessage>"
Then verify BLACK_LIST_MASTER table where customer number "<CustNumber>"
Then verify FREEZE_DETAILS table where customer number "<CustNumber>"
Then verify SP_INSTRUCTION_DETAILS table where customer number "<CustNumber>"
Then store Account_Master table customer number "<CustNumber>" Status & freeze value before blacklist entry
Then verify Account_Master table customer number "<CustNumber>" & FreezeStatus "<AccountFreezeStatus>" & freeze "<AccountFreezeValue>" value after blacklist entry

Examples:
|testCase|MenuName|MenuPath|CustNumber|Reason|xpath|AccountFreezeStatus|AccountFreezeValue|successMessage|
|Blacklist Customer Entry Without Document|Blacklisted Customer Marking|Menu_BlacklistedCustomerMarkEntry|0011000000001729|FIU Order|//div[@id='accountDetails']|B|D|Customer Blacklisted Successfully.|
|Blacklist Customer Entry Without Document For Rejection|Blacklisted Customer Marking|Menu_BlacklistedCustomerMarkEntry|0011000000001788|FIU Order|//div[@id='accountDetails']|B|D|Customer Blacklisted Successfully.|


@BlacklistCust
Scenario Outline: 6. Blacklist Customer Entry With Account Credit Freeze
Scenario : 6.Blacklist Customer Entry With Account Credit Freeze
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Blacklist Customer Entry Screen
Then user verify Account Details of Blacklist Customer On Ui where xpath "<xpath>" & customer number "<CustNumber>"
Then user verify Cust Name & DOB & Category where customer number "<CustNumber>"
And user enters blacklist reason "<Reason>"
And user click on Submit button on Blacklist Customer Entry
Then user finds successMessage "<successMessage>"
Then verify BLACK_LIST_MASTER table where customer number "<CustNumber>"
Then verify FREEZE_DETAILS table where customer number "<CustNumber>"
Then verify SP_INSTRUCTION_DETAILS table where customer number "<CustNumber>"
Then store Account_Master table customer number "<CustNumber>" Status & freeze value before blacklist entry
Then verify Account_Master table customer number "<CustNumber>" & FreezeStatus "<AccountFreezeStatus>" & freeze "<AccountFreezeValue>" value after blacklist entry
Then user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|Reason|xpath|AccountFreezeStatus|AccountFreezeValue|successMessage|
|Blacklist Customer Entry With Account Credit Freeze|Blacklisted Customer Marking|Menu_BlacklistedCustomerMarkEntry|0011000000001731|FIU Order|//div[@id='accountDetails']|B|T|Customer Blacklisted Successfully.|
|Blacklist Customer Entry With Account Credit Freeze For Rejection|Blacklisted Customer Marking|Menu_BlacklistedCustomerMarkEntry|0011000000001733|FIU Order|//div[@id='accountDetails']|B|T|Customer Blacklisted Successfully.|


############################################################### Blacklist Customer Entry Authorization ########################################################################################

@BlacklistCust
Scenario Outline: 7. Blacklist Customer Entry Authorization
Scenario : 7.Blacklist Customer Entry Authorization
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" from dropdown of Blacklist Customer Entry Auth
Then user verify Account Details of Blacklist Customer On Ui where xpath "<xpath>" & customer number "<CustNumber>"
Then user verify cust Name & DOB & Category & Reason "<CustNumber>"
And user click on Authorize button of Blacklist Customer Entry Auth
Then user finds successMessage "<successMessage>"
Then verify FREEZE_DETAILS table where customer number "<CustNumber>" & Flow "<Flow>" After Auth & Reject
Then verify BLACK_LIST_MASTER & BLACK_LIST_DETAILS table where customer number "<CustNumber>" & Flag "<DocFlag>" After Auth
Then user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|Reason|xpath|successMessage|DocFlag|Flow|
|Blacklist Customer Entry With Document Authorization|Blacklisted Customer Marking|Menu_BlacklistedCustomerMarkEntryAuth|0011000000001730|FIU Order|//div[@id='accountDetails']|Blacklisting of customer Authorized Successfully.|Y|Auth|
|Blacklist Customer Entry Without Document Authorization|Blacklisted Customer Marking|Menu_BlacklistedCustomerMarkEntryAuth|0011000000001729|FIU Order|//div[@id='accountDetails']|Blacklisting of customer Authorized Successfully.|N|Auth|
|Blacklist Customer Entry With Account Credit Freeze Authorization|Blacklisted Customer Marking|Menu_BlacklistedCustomerMarkEntryAuth|0011000000001731|FIU Order|//div[@id='accountDetails']|Blacklisting of customer Authorized Successfully.|N|Auth|


############################################################### Blacklist Customer Entry Rejection ########################################################################################

@BlacklistCust
Scenario Outline: 8. Blacklist Customer Entry Rejection
Scenario : 8.Blacklist Customer Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" from dropdown of Blacklist Customer Entry Auth
Then user verify Account Details of Blacklist Customer On Ui where xpath "<xpath>" & customer number "<CustNumber>"
Then user verify cust Name & DOB & Category & Reason "<CustNumber>"
And user click on Reject button of Blacklist Customer Entry Auth
Then user finds successMessage "<successMessage>"
Then verify CUST_MASTER table where customer number "<CustNumber>"
Then verify FREEZE_DETAILS table where customer number "<CustNumber>" & Flow "<Flow>" After Auth & Reject
Then verify BLACK_LIST_MASTER & BLACK_LIST_DETAILS table where customer number "<CustNumber>" & Flag "<DocFlag>" After Reject
Then store Account_Master table customer number "<CustNumber>" Status & freeze value before blacklist entry
Then verify Account_Master table customer number "<CustNumber>" & FreezeStatus "<AccountFreezeStatus>" & freeze "<AccountFreezeValue>" value after blacklist entry
Then user closes testCase

Examples:
|testCase|MenuName|MenuPath|CustNumber|Reason|xpath|AccountFreezeStatus|AccountFreezeValue|successMessage|DocFlag|Flow|
|Blacklist Customer Entry With Document Rejection|Blacklisted Customer Marking|Menu_BlacklistedCustomerMarkEntryAuth|0011000000001732|FIU Order|//div[@id='accountDetails']|A|N|Blacklisting of customer Rejected Successfully.|Y|Reject|
|Blacklist Customer Entry Without Document Rejection|Blacklisted Customer Marking|Menu_BlacklistedCustomerMarkEntryAuth|0011000000001788|FIU Order|//div[@id='accountDetails']|A|N|Blacklisting of customer Rejected Successfully.|N|Reject|
|Blacklist Customer Entry With Account Credit Freeze Rejection|Blacklisted Customer Marking|Menu_BlacklistedCustomerMarkEntryAuth|0011000000001733|FIU Order|//div[@id='accountDetails']|A|C|Blacklisting of customer Rejected Successfully.|N|Reject|



