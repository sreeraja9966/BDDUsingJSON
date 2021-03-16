Feature: Fixed Deposit Renewal
@FDOpng @setUp @withDenom
Scenario Outline: FixedDeposit Acc opng Screen Setup
Given User starts a parentReport "<parentReport>"
Examples:
|parentReport|
|FD|

@FDOpng1
Scenario Outline: FD self simple 12M Monthly without TDS account opening Entry
Given user opens a testCase "<testCase>"
Given user opens a scenario for FD Opening "<scenario>"
Given User is on "fd account opening" "Menu_FDAccountOpening"screen
When user select product from product dropdown on FD opening screen
And user enters customer number on FD opening screen
And select nature of account on FD opening screen
And click other deposit details tab on FD opening screen
Then verify category of entered customer on FD opening screen
When user select operating instructions on FD opening screen
And user selects interest calculation type
And user enters deposit amount on FD opening screen
And user enters deposit period in months on FD opening screen
And user enters deopsit period in days on FD opening screen
And user selects insterest payment frequency on FD opening screen
Then verify interestType ROI maturityDate MAturityAmount AddRoi MonthlyOrQuterlyInterest on UI
When user click on renewal policy tab on FD opening screen
And user click on AutoRenewal RadioButton on FD opening screen
And user click on AutoRenewal withInt RadioButton on FD opening screen
And user click on smsNotification on FD opening screen
And user click on emailNotification on FD opening screen
And click on submit button on FD opening screen
Then store number on model with name "<scenario>" and "<KeyInCache>"
Then user finds successMessage on FD acc open Screen
Then verify accountMaster customerAccount acContact tables with level "<level>"
Then verify depositMaster for FD acc opening screen 
Then verify fdIntDetails table for FD acc opening with level "<level>"
Examples:
|testCase|scenario|KeyInCache|level|
|FD Self Simple 12M Monthly Without TDS account opening Entry|FDSelfSimple12MMonthlyWithoutTDSAccountOpeningEntry|FDAcountOpeningScreen_modelRespose|Entry|   

@FDOpng
Scenario Outline: FD Joint O Type Operator simple 12M Monthly without TDS account opening Entry
Given user opens a testCase "<testCase>"
Given user opens a scenario for FD Opening "<scenario>"
Given User is on "fd account opening" "Menu_FDAccountOpening"screen
When user select product from product dropdown on FD opening screen
And user enters customer number on FD opening screen
And select nature of account on FD opening screen
And click other operator details tab on FD opening screen
And enter operator details on FD opening screen
And click other deposit details tab on FD opening screen
Then verify category of entered customer on FD opening screen
When user select operating instructions on FD opening screen
And user selects interest calculation type
And user enters deposit amount on FD opening screen
And user enters deposit period in months on FD opening screen
And user enters deopsit period in days on FD opening screen
And user selects insterest payment frequency on FD opening screen
Then verify interestType ROI maturityDate MAturityAmount AddRoi MonthlyOrQuterlyInterest on UI
When user click on renewal policy tab on FD opening screen
And user click on AutoRenewal RadioButton on FD opening screen
And user click on AutoRenewal withInt RadioButton on FD opening screen
And user click on smsNotification on FD opening screen
And user click on emailNotification on FD opening screen
And click on submit button on FD opening screen
Then store number on model with name "<scenario>" and "<KeyInCache>"
Then user finds successMessage on FD acc open Screen
Then verify accountMaster customerAccount acContact tables with level "<level>"
Then verify depositMaster for FD acc opening screen 
Then verify fdIntDetails table for FD acc opening with level "<level>"
Examples:
|testCase|scenario|KeyInCache|level|
|FD Joint O Type Operator Simple 12M Monthly Without TDS account opening Entry|FDJointOTypeOperatorSimple12MMonthlyWithoutTDSAccountOpeningEntry|FDAcountOpeningScreen_modelRespose|Entry| 


@FDOpng
Scenario Outline: FD Joint P Type Operator simple 12M Monthly without TDS account opening Entry
Given user opens a testCase "<testCase>"
Given user opens a scenario for FD Opening "<scenario>"
Given User is on "fd account opening" "Menu_FDAccountOpening"screen
When user select product from product dropdown on FD opening screen
And user enters customer number on FD opening screen
And select nature of account on FD opening screen
And click other operator details tab on FD opening screen
And enter operator details on FD opening screen
And click other deposit details tab on FD opening screen
Then verify category of entered customer on FD opening screen
When user select operating instructions on FD opening screen
And user selects interest calculation type
And user enters deposit amount on FD opening screen
And user enters deposit period in months on FD opening screen
And user enters deopsit period in days on FD opening screen
And user selects insterest payment frequency on FD opening screen
Then verify interestType ROI maturityDate MAturityAmount AddRoi MonthlyOrQuterlyInterest on UI
When user click on renewal policy tab on FD opening screen
And user click on AutoRenewal RadioButton on FD opening screen
And user click on AutoRenewal withInt RadioButton on FD opening screen
And user click on smsNotification on FD opening screen
And user click on emailNotification on FD opening screen
And click on submit button on FD opening screen
Then store number on model with name "<scenario>" and "<KeyInCache>"
Then user finds successMessage on FD acc open Screen
Then verify accountMaster customerAccount acContact tables with level "<level>"
Then verify depositMaster for FD acc opening screen 
Then verify fdIntDetails table for FD acc opening with level "<level>"
Examples:
|testCase|scenario|KeyInCache|level|
|FD Joint P Type Operator Simple 12M Monthly Without TDS account opening Entry|FDJointPTypeOperatorSimple12MMonthlyWithoutTDSAccountOpeningEntry|FDAcountOpeningScreen_modelRespose|Entry|