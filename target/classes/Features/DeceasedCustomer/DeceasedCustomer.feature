@DeceasedCust
Feature: Deceased Customer Functionality

@DeceasedCust @setUp @sanityNN
Scenario Outline: 1.Deceased Customer Screen Setup
Scenario : 1.Deceased Customer Screen Setup
Given User creates a parentReport "<parentReport>"
Then setup Deceased Customer Screen

Examples:
|parentReport|
|Deceased Customer|

############################################################### Deceased Customer Entry ########################################################################################


Scenario Outline: 2.Check Validation Message with Customer Status
Scenario : 2.Check Validation Message with Customer Status
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Deceased Customer Entry Screen
Then verify validation Message on Get Call "<Xpath>" "<ExpectedMessage>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|Xpath|ExpectedMessage|
|Closed Customer Deceased Customer Entry|Deceased Customer|Menu_DeathMarkCustomerMarkEntry|0011000000001829|DeathMarkCustomerScreen_invalidCustNum|Customer is Closed.|



Scenario Outline: 3.Invalid Date of Death
Scenario : 3.Invalid Date of Death
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Deceased Customer Entry Screen
Then user verify Cust Name & DOB On Ui of Deceased Customer Entry Screen where customer number "<CustNumber>"
Then user enters date of death "<DateOfDeath>"
Then user select document from dropdown
Then user verify cust category On Ui where customer number "<CustNumber>"
Then user click on Claimant Detail tab
Then user select existing customer "<ExistingCustomer>" or Non Customer "<NonCustomer>" radio button
Then user enters cust number of Claimant where customer number "<ClaimantCustNumber>"
And user enters remark "<Remark>" on Deceased Customer Entry Screen
Then user click on Submit button of Deceased Customer Entry Screen
Then user finds successMessage "<successMessage>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|DateOfDeath|ExistingCustomer|ClaimantCustNumber|Remark|successMessage|
|Invalid Date of Death|Deceased Customer|Menu_DeathMarkCustomerMarkEntry|0011000000002005|15/06/2020|Existing Customer|0011000000002004|Dead|invalid date of death.|


@DeceasedCust @sanityNN
Scenario Outline: 4.Deceased Customer Entry With Non Customer Claimant
Scenario : 4.Deceased Customer Entry With Non Customer Claimant
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Deceased Customer Entry Screen
Then verify customer Accounts Details Ui Verification where xpath "<Axpath>" & customer number "<CustNumber>"
Then verify customer Documents Details Ui Verification where xpath "<Dxpath>" & customer number "<CustNumber>"
Then user verify Cust Name & DOB On Ui of Deceased Customer Entry Screen where customer number "<CustNumber>"
Then user enters date of death "<DateOfDeath>"
Then user select document from dropdown
Then user verify cust category On Ui where customer number "<CustNumber>"
Then user click on Claimant Detail tab
Then user select existing customer "<ExistingCustomer>" or Non Customer "<NonCustomer>" radio button
Then user enters cust name of Claimant where customer name "<ClaimantCustName>"
And user enters remark "<Remark>" on Deceased Customer Entry Screen
Then user enters cust address of Claimant where customer address "<ClaimantCustAddress>"
Then user enters cust contact of Claimant where customer contact "<ClaimantCustContact>"
Then user click on Submit button of Deceased Customer Entry Screen
Then user finds successMessage "<successMessage>"
Then verify DEATH_MARKING & DEATH_CLAIM_DETAILS & ACCOUNT_MASTER table where customer number "<CustNumber>" and claimant "<Claimant>"
Then verify FREEZE_DETAILS where customer number "<CustNumber>"
Then verify SP_INSTRUCTION_DETAILS table where customer number "<CustNumber>" after Deceased Customer Entry
Then store Account Status Freeze Value Before Deceased Entry where customer number "<CustNumber>"
Then verify Account_Master table customer number "<CustNumber>" & FreezeStatus "<AccountFreezeStatus>" & freeze "<AccountFreezeValue>" value after Deceased entry

Examples:
|testCase|MenuName|MenuPath|CustNumber|Axpath|Dxpath|DateOfDeath|NonCustomer|ClaimantCustName|ClaimantCustAddress|Remark|ClaimantCustContact|AccountFreezeStatus|AccountFreezeValue|Claimant|successMessage|
|Deceased Customer Entry With Non Customer Claimant|Deceased Customer|Menu_DeathMarkCustomerMarkEntry|0011000000001735|//div[@id='accountdetails']|//div[@id='documentDetails']|25/10/2013|Non Customer|SAGAR JOSHI|145 Om Colony, Near Dange Chowk, Pune 411030|Dead|9855345689|D|T|Non Customer|Customer Death Entry Added Successfully|
|Deceased Customer Entry For Rejection With Non Customer Claimant|Deceased Customer|Menu_DeathMarkCustomerMarkEntry|0011000000001737|//div[@id='accountdetails']|//div[@id='documentDetails']|25/10/2013|Non Customer|SAGAR JOSHI|145 Om Colony, Near Dange Chowk, Pune 411030|Dead|9855345689|D|T|Non Customer|Customer Death Entry Added Successfully|


@DeceasedCust  @sanityNN
Scenario Outline: 5.Deceased Customer Entry With Existing Customer Claimant
Scenario : 5.Deceased Customer Entry With Existing Customer Claimant
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Deceased Customer Entry Screen
Then verify customer Accounts Details Ui Verification where xpath "<Axpath>" & customer number "<CustNumber>"
Then verify customer Documents Details Ui Verification where xpath "<Dxpath>" & customer number "<CustNumber>"
Then user verify Cust Name & DOB On Ui of Deceased Customer Entry Screen where customer number "<CustNumber>"
Then user enters date of death "<DateOfDeath>"
Then user select document from dropdown
Then user verify cust category On Ui where customer number "<CustNumber>"
Then user click on Claimant Detail tab
Then user select existing customer "<ExistingCustomer>" or Non Customer "<NonCustomer>" radio button
Then user enters cust number of Claimant where customer number "<ClaimantCustNumber>"
And user enters remark "<Remark>" on Deceased Customer Entry Screen
Then user click on Submit button of Deceased Customer Entry Screen
Then user finds successMessage "<successMessage>"
Then verify DEATH_MARKING & DEATH_CLAIM_DETAILS & ACCOUNT_MASTER table where customer number "<CustNumber>" and claimant "<Claimant>"
Then verify FREEZE_DETAILS where customer number "<CustNumber>"
Then verify SP_INSTRUCTION_DETAILS table where customer number "<CustNumber>" after Deceased Customer Entry
Then store Account Status Freeze Value Before Deceased Entry where customer number "<CustNumber>"
Then verify Account_Master table customer number "<CustNumber>" & FreezeStatus "<AccountFreezeStatus>" & freeze "<AccountFreezeValue>" value after Deceased entry

Examples:
|testCase|MenuName|MenuPath|CustNumber|Axpath|Dxpath|DateOfDeath|ExistingCustomer|ClaimantCustNumber|Remark|AccountFreezeStatus|AccountFreezeValue|Claimant|successMessage|
|Deceased Customer Entry With Existing Customer Claimant|Deceased Customer|Menu_DeathMarkCustomerMarkEntry|0011000000001734|//div[@id='accountdetails']|//div[@id='documentDetails']|25/10/2013|Existing Customer|0011000000002006|Dead|D|T|Existing Customer|Customer Death Entry Added Successfully|
|Deceased Customer Entry For Rejection With Existing Customer Claimant|Deceased Customer|Menu_DeathMarkCustomerMarkEntry|0011000000001736|//div[@id='accountdetails']|//div[@id='documentDetails']|25/10/2013|Existing Customer|0011000000002006|Dead|D|T|Existing Customer|Customer Death Entry Added Successfully|


############################################################### Deceased Customer Entry Auth ########################################################################################


@DeceasedCust @sanityNN
Scenario Outline: 6.Deceased Customer Auth With Existing Customer Claimant
Scenario : 6.Deceased Customer Auth Existing Customer Claimant
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" on Deceased Customer Entry Auth Screen
Then verify customer Accounts Details Ui Verification where xpath "<Axpath>" & customer number "<CustNumber>"
Then verify customer Documents Details Ui Verification where xpath "<Dxpath>" & customer number "<CustNumber>"
Then user verify Cust Name & DOB On Ui of Deceased Customer Entry Screen where customer number "<CustNumber>"
Then user verify cust death date "<DateOfDeath>" On Ui where customer number "<CustNumber>"
Then user verify cust category On Ui where customer number "<CustNumber>"
Then user click on Claimant Detail tab
Then verify select existing customer "<ExistingCustomer>" or Non Customer "<NonCustomer>" On Ui
Then verify cust number of Claimant where customer number "<ClaimantCustNumber>" & remark "<Remark>" On Ui
Then user click on Authorize button of Deceased Customer Entry Auth Screen
Then user finds successMessage "<successMessage>"
Then verify DEATH_MARKING & DEATH_CLAIM_DETAILS & ACCOUNT_MASTER table where customer number "<CustNumber>" & flow "<Flow>"
Then verify FREEZE_DETAILS table where customer number "<CustNumber>" & flow "<Flow>"


Examples:
|testCase|MenuName|MenuPath|CustNumber|Axpath|Dxpath|DateOfDeath|ExistingCustomer|ClaimantCustNumber|Remark|successMessage|Flow|
|Deceased Customer Auth With Existing Customer Claimant|Deceased Customer|Menu_DeathMarkCustomerMarkEntryAuth|0011000000001734|//div[@id='accountdetails']|//div[@id='documentDetails']|2013-10-25|Existing Customer|0011000000002006|Dead|Death Claim Authorized Successfully.|Auth|


@DeceasedCust @sanityNN
Scenario Outline: 7.Deceased Customer Auth With Non Customer Claimant
Scenario : 7.Deceased Customer Auth With Non Customer Claimant
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" on Deceased Customer Entry Auth Screen
Then verify customer Accounts Details Ui Verification where xpath "<Axpath>" & customer number "<CustNumber>"
Then verify customer Documents Details Ui Verification where xpath "<Dxpath>" & customer number "<CustNumber>"
Then user verify Cust Name & DOB On Ui of Deceased Customer Entry Screen where customer number "<CustNumber>"
Then user verify cust death date "<DateOfDeath>" On Ui where customer number "<CustNumber>"
Then user verify cust category On Ui where customer number "<CustNumber>"
Then user click on Claimant Detail tab
Then verify select existing customer "<ExistingCustomer>" or Non Customer "<NonCustomer>" On Ui
Then verify cust name of Claimant where customer name "<ClaimantCustName>" & customer address "<ClaimantCustAddress>" & customer contact "<ClaimantCustContact>" & remark "<Remark>" On Ui
Then user click on Authorize button of Deceased Customer Entry Auth Screen
Then user finds successMessage "<successMessage>"
Then verify DEATH_MARKING & DEATH_CLAIM_DETAILS & ACCOUNT_MASTER table where customer number "<CustNumber>" & flow "<Flow>"
Then verify FREEZE_DETAILS table where customer number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|Axpath|Dxpath|DateOfDeath|NonCustomer|ClaimantCustName|ClaimantCustAddress|ClaimantCustContact|Remark|successMessage|Flow|
|Deceased Customer Auth With Non Customer Claimant|Deceased Customer|Menu_DeathMarkCustomerMarkEntryAuth|0011000000001735|//div[@id='accountdetails']|//div[@id='documentDetails']|2013-10-25|Non Customer|SAGAR JOSHI|145 Om Colony, Near Dange Chowk, Pune 411030|9855345689|Dead|Death Claim Authorized Successfully.|Auth|


############################################################### Deceased Customer Entry Rejection ########################################################################################


@DeceasedCust
Scenario Outline: 8.Deceased Customer Rejection With Existing Customer Claimant
Scenario : 8.Deceased Customer Rejection Existing Customer Claimant
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" on Deceased Customer Entry Auth Screen
Then verify customer Accounts Details Ui Verification where xpath "<Axpath>" & customer number "<CustNumber>"
Then verify customer Documents Details Ui Verification where xpath "<Dxpath>" & customer number "<CustNumber>"
Then user verify Cust Name & DOB On Ui of Deceased Customer Entry Screen where customer number "<CustNumber>"
Then user verify cust death date "<DateOfDeath>" On Ui where customer number "<CustNumber>"
Then user verify cust category On Ui where customer number "<CustNumber>"
Then user click on Claimant Detail tab
Then verify select existing customer "<ExistingCustomer>" or Non Customer "<NonCustomer>" On Ui
Then verify cust number of Claimant where customer number "<ClaimantCustNumber>" & remark "<Remark>" On Ui
Then user click on Reject button of Deceased Customer Entry Auth Screen
Then user finds successMessage "<successMessage>"
Then verify DEATH_MARKING & DEATH_CLAIM_DETAILS & ACCOUNT_MASTER table where customer number "<CustNumber>" & flow "<Flow>"
Then verify FREEZE_DETAILS table where customer number "<CustNumber>" & flow "<Flow>"


Examples:
|testCase|MenuName|MenuPath|CustNumber|Axpath|Dxpath|DateOfDeath|ExistingCustomer|ClaimantCustNumber|Remark|successMessage|Flow|
|Deceased Customer Rejection With Existing Customer Claimant|Deceased Customer|Menu_DeathMarkCustomerMarkEntryAuth|0011000000001736|//div[@id='accountdetails']|//div[@id='documentDetails']|2013-10-25|Existing Customer|0011000000002006|Dead|Death Claim Authorized Successfully.|Reject|


@DeceasedCust
Scenario Outline: 9.Deceased Customer Rejection With Non Customer Claimant
Scenario : 9.Deceased Customer Rejection With Non Customer Claimant
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" on Deceased Customer Entry Auth Screen
Then verify customer Accounts Details Ui Verification where xpath "<Axpath>" & customer number "<CustNumber>"
Then verify customer Documents Details Ui Verification where xpath "<Dxpath>" & customer number "<CustNumber>"
Then user verify Cust Name & DOB On Ui of Deceased Customer Entry Screen where customer number "<CustNumber>"
Then user verify cust death date "<DateOfDeath>" On Ui where customer number "<CustNumber>"
Then user verify cust category On Ui where customer number "<CustNumber>"
Then user click on Claimant Detail tab
Then verify select existing customer "<ExistingCustomer>" or Non Customer "<NonCustomer>" On Ui
Then verify cust name of Claimant where customer name "<ClaimantCustName>" & customer address "<ClaimantCustAddress>" & customer contact "<ClaimantCustContact>" & remark "<Remark>" On Ui
Then user click on Reject button of Deceased Customer Entry Auth Screen
Then user finds successMessage "<successMessage>"
Then verify DEATH_MARKING & DEATH_CLAIM_DETAILS & ACCOUNT_MASTER table where customer number "<CustNumber>" & flow "<Flow>"
Then verify FREEZE_DETAILS table where customer number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|Axpath|Dxpath|DateOfDeath|NonCustomer|ClaimantCustName|ClaimantCustAddress|ClaimantCustContact|Remark|successMessage|Flow|
|Deceased Customer Rejection With Non Customer Claimant|Deceased Customer|Menu_DeathMarkCustomerMarkEntryAuth|0011000000001737|//div[@id='accountdetails']|//div[@id='documentDetails']|2013-10-25|Non Customer|SAGAR JOSHI|145 Om Colony, Near Dange Chowk, Pune 411030|9855345689|Dead|Death Claim Authorized Successfully.|Reject|

