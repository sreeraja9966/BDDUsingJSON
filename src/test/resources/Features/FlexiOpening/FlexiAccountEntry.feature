@FlexiAccount
Feature: Flexi Account Functionality

@FlexiAccount @setUp
Scenario Outline: 1.Flexi Account Screen Setup
Scenario : 1.Flexi Account Screen Setup
Given User creates a parentReport "<parentReport>"
Then setup Flexi Account Screen

Examples:
|parentReport|
|Flexi Account|

############################################################### Flexi Account Opening ########################################################################################


Scenario Outline: 2.Flexi Account Opening SB & CA Self Nature of Account
Scenario : 2.Flexi Account Opening SB & CA Self Nature of Account
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then verify product "<ProductId>" STATUS is active or not with PRODUCT table col STATUS "<STATUS>" and Flexi Applicable falg "<FLEXI_APPLICABLE>" 
Then verify Link Flexi Product For SB / CA with FLEXI_UNIT_PARAMETER  table UNIT_OF_PERIOD "<UNIT_OF_PERIOD>" and  col  PRD_ID "<PRD_ID>"  and  BASE_PRD_ID "<ProductId>"
And user select Account Type from dropdown as Saving or Current "<AccountType>"
And user select Product Type from dropdown as Flexi Product "<ProductType>"
And user enters "<CustomerNumber>" active Customer Number
Then verify Account opening Date "<AccountOpeningDate>" with BRANCHPARAMETERS table col CURRENT_DT
And user enters "<IntroducerNumber>" active Introducer Number
Then Verify "<IntroducerNumber>" introducer Is Customer "<INTRODUCERISCUSTOMER>"  in CUST_MASTER table 
And user select "<NatureofAccount>" from Nature of Account dropdown
When user click on Opening Details tab
Then Verify cust Category "<Category>" where Customer Number "<CustomerNumber>"
And user select "<OperatingInstruction>" from Operating Instruction
Then Verify Currency "<Currency>" 
When user click on Notification Details tab
Then user select ATM facility  as Yes  "<ATMfacility>" 
Then user select SMS facility  as Yes  "<SMSfacility>" 
Then user select Email Notification as Yes  "<EmailNotification>" 
Then user select ChequeBook facility  as Yes  "<ChequeBookfacility>" 
Then user select Email Address from drop down "<EmailAddress>" when Email Notification as select Yes
Then user select Mobile from drop down "<Mobile>" when SMS facility  as select Yes
When user click on Flexi Account Details tab
Then Verify Flexi Account Details tab ProductId "<ProductId>" ProductName "<ProductType>" MinimumBaseAmount "<MinimumBaseAmount>" MaximumBaseAmount "<MaximumBaseAmount>" UnitAmount "<UnitAmount>"
Then verify ProductId "<ProductId>" with FLEXI_UNIT_PARAMETER table col CUT_OFF_LIMIT "<MinimumBaseAmount>" and MAX_FLEXI_AMOUNT "<MaximumBaseAmount>" and AMOUNT_PER_UNIT "<UnitAmount>" 
When user click on Submit button
Then store number on model with name "<UserAccNumStoreInCache>" and "<UserAccNumKeyInCache>"
Then store number on model with name "<InternalAccNumStoreInCache>" and "<InternalAccNumKeyInCache>"
Then store number on model with name "<FlexiAccNumStoreInCache>" and "<FlexiAccNumKeyInCache>"
Then user finds successMessage "<successMessage>"  
Then verify AccountType "<AccountType>" of ACCOUNT_MASTER col  STATUS "<STATUS>" & Customer Account & DEPOSIT_MASTER & SIFlag "<SIFlag>" & Flow "<Flow>"
Then user closes testCase


Examples:
|testCase|MenuName|MenuPath|ProductId|STATUS|FLEXI_APPLICABLE|PRD_ID|AccountType|ProductType|CustomerNumber|AccountOpeningDate|IntroducerNumber|INTRODUCERISCUSTOMER|NatureofAccount|Category|OperatingInstruction|Currency|ATMfacility|SMSfacility|EmailNotification|ChequeBookfacility|EmailAddress|Mobile|successMessage|UNIT_OF_PERIOD|UserAccNumStoreInCache|UserAccNumKeyInCache|InternalAccNumStoreInCache|InternalAccNumKeyInCache|FlexiAccNumStoreInCache|FlexiAccNumKeyInCache|MinimumBaseAmount|MaximumBaseAmount|UnitAmount|SIFlag|Flow|
|Flexi account Opening SB Self Nature Of Account|Account Opening|Menu_CASAAccountOpening|170|A|Y|888|Saving Account|Flexi-Saving Account|0011000000001930|23/02/2020|0011000000001937|Y|Self|SENR|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|Saving Account Created Successfully.|B|UserAccNumSB|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumSB|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumSB|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|N|Entry|
|Flexi account Opening CA Self Nature Of Account|Account Opening|Menu_CASAAccountOpening|171|A|Y|889|Current Account|Flexi-Current Account|0011000000001930|23/02/2020|0011000000001937|Y|Self|SENR|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|Current Account created successfully.|B|UserAccNumCA|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumCA|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumCA|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|N|Entry|

|SB Flexi Entry Self Nature Of Account for Rejection|Account Opening|Menu_CASAAccountOpening|170|A|Y|888|Saving Account|Flexi-Saving Account|0011000000001930|23/02/2020|0011000000001937|Y|Self|SENR|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|Saving Account Created Successfully.|B|UserAccNumSBRejection|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumSBRejection|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumSBRejection|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|N|RejectEntry|
|CA Flexi Entry Self Nature Of Account for Rejection|Account Opening|Menu_CASAAccountOpening|171|A|Y|889|Current Account|Flexi-Current Account|0011000000001930|23/02/2020|0011000000001937|Y|Self|SENR|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|Current Account created successfully.|B|UserAccNumCARejection|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumCARejection|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumCARejection|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|N|RejectEntry|


Scenario Outline: 3.Flexi Account Opening SB & CA Joint Nature of Account
Scenario : 3.Flexi Account Opening SB & CA Joint Nature of Account
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then verify product "<ProductId>" STATUS is active or not with PRODUCT table col STATUS "<STATUS>" and Flexi Applicable falg "<FLEXI_APPLICABLE>" 
Then verify Link Flexi Product For SB / CA with FLEXI_UNIT_PARAMETER  table UNIT_OF_PERIOD "<UNIT_OF_PERIOD>" and  col  PRD_ID "<PRD_ID>"  and  BASE_PRD_ID "<ProductId>"
And user select Account Type from dropdown as Saving or Current "<AccountType>"
And user select Product Type from dropdown as Flexi Product "<ProductType>"
And user enters "<CustomerNumber>" active Customer Number
Then verify Account opening Date "<AccountOpeningDate>" with BRANCHPARAMETERS table col CURRENT_DT
And user enters "<IntroducerNumber>" active Introducer Number
Then Verify "<IntroducerNumber>" introducer Is Customer "<INTRODUCERISCUSTOMER>"  in CUST_MASTER table 
And user select "<NatureofAccount>" from Nature of Account dropdown
When user click on Operator Details tab
And user enters OtherOperatorNumber"<OtherOperatorNumber>" active Customer Number
Then user select Other Operator as Partner or Official "<PatOff>" and  Authorized Signatory  as Yes or No  "<AuthorizedSignatory>"
When user click on Add Operator button
When user click on Opening Details tab
Then Verify cust Category "<Category>" where Customer Number "<CustomerNumber>"
And user select "<OperatingInstruction>" from Operating Instruction
Then Verify Currency "<Currency>" 
When user click on Notification Details tab
Then user select ATM facility  as Yes  "<ATMfacility>" 
Then user select SMS facility  as Yes  "<SMSfacility>" 
Then user select Email Notification as Yes  "<EmailNotification>" 
Then user select ChequeBook facility  as Yes  "<ChequeBookfacility>" 
Then user select Email Address from drop down "<EmailAddress>" when Email Notification as select Yes
Then user select Mobile from drop down "<Mobile>" when SMS facility  as select Yes
When user click on Flexi Account Details tab
Then Verify Flexi Account Details tab ProductId "<ProductId>" ProductName "<ProductType>" MinimumBaseAmount "<MinimumBaseAmount>" MaximumBaseAmount "<MaximumBaseAmount>" UnitAmount "<UnitAmount>"
Then verify ProductId "<ProductId>" with FLEXI_UNIT_PARAMETER table col CUT_OFF_LIMIT "<MinimumBaseAmount>" and MAX_FLEXI_AMOUNT "<MaximumBaseAmount>" and AMOUNT_PER_UNIT "<UnitAmount>" 
When user click on Submit button
Then store number on model with name "<UserAccNumStoreInCache>" and "<UserAccNumKeyInCache>"
Then store number on model with name "<InternalAccNumStoreInCache>" and "<InternalAccNumKeyInCache>"
Then store number on model with name "<FlexiAccNumStoreInCache>" and "<FlexiAccNumKeyInCache>"
Then user finds successMessage "<successMessage>"  
Then verify AccountType "<AccountType>" of ACCOUNT_MASTER STATUS "<STATUS>" & Customer Account & DEPOSIT_MASTER of joint account & OtherOperator "<OtherOperator>" & PartOff "<PatOff>" & AuthorizedSignatory "<AuthorizedSignatory>" & SIFlag "<SIFlag>"  & Flow "<Flow>"  
Then user closes testCase

Examples:
|testCase|MenuName|MenuPath|ProductId|STATUS|FLEXI_APPLICABLE|PRD_ID|AccountType|ProductType|CustomerNumber|AccountOpeningDate|IntroducerNumber|INTRODUCERISCUSTOMER|NatureofAccount|Category|OperatingInstruction|Currency|ATMfacility|SMSfacility|EmailNotification|ChequeBookfacility|EmailAddress|Mobile|successMessage|UNIT_OF_PERIOD|UserAccNumStoreInCache|UserAccNumKeyInCache|InternalAccNumStoreInCache|InternalAccNumKeyInCache|FlexiAccNumStoreInCache|FlexiAccNumKeyInCache|MinimumBaseAmount|MaximumBaseAmount|UnitAmount|OtherOperatorNumber|OtherOperator|PatOff|AuthorizedSignatory|SIFlag|Flow|
|Flexi account Opening SB Joint Nature Of Account|Account Opening|Menu_CASAAccountOpening|170|A|Y|888|Saving Account|Flexi-Saving Account|0011000000001930|23/02/2020|0011000000001937|Y|Joint Stock Company|SENR|Both Jointly|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|Saving Account Created Successfully.|B|UserAccNumSBWithOperator|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumSBWithOperator|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumSBWithOperator|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|0011000000001946|O|O|Y|N|Entry|
|Flexi account Opening CA Joint Nature Of Account|Account Opening|Menu_CASAAccountOpening|171|A|Y|889|Current Account|Flexi-Current Account|0011000000001930|23/02/2020|0011000000001937|Y|Joint Stock Company|SENR|Both Jointly|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|Current Account created successfully.|B|UserAccNumCAWithOperator|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumCAWithOperator|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumCAWithOperator|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|0011000000001947|O|P|N|N|Entry|

|SB Flexi Entry Joint Nature Of Account for Rejection|Account Opening|Menu_CASAAccountOpening|170|A|Y|888|Saving Account|Flexi-Saving Account|0011000000001930|23/02/2020|0011000000001937|Y|Joint Stock Company|SENR|Both Jointly|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|Saving Account Created Successfully.|B|UserAccNumSBWithOperatorRejection|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumSBWithOperatorRejection|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumSBWithOperatorRejection|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|0011000000001946|O|O|Y|N|RejectEntry|
|CA Flexi Entry Joint Nature Of Account for Rejection|Account Opening|Menu_CASAAccountOpening|171|A|Y|889|Current Account|Flexi-Current Account|0011000000001930|23/02/2020|0011000000001937|Y|Joint Stock Company|SENR|Both Jointly|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|Current Account created successfully.|B|UserAccNumCAWithOperatorRejection|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumCAWithOperatorRejection|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumCAWithOperatorRejection|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|0011000000001947|O|P|N|N|RejectEntry|


################################################################# With SI ###################################################################


Scenario Outline: 4. Flexi account Opening for Self With SI
Scenario : 4.Flexi account Opening for Self With SI
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then verify product "<ProductId>" STATUS is active or not with PRODUCT table col STATUS "<STATUS>" and Flexi Applicable falg "<FLEXI_APPLICABLE>" 
Then verify Link Flexi Product For SB / CA with FLEXI_UNIT_PARAMETER  table UNIT_OF_PERIOD "<UNIT_OF_PERIOD>" and  col  PRD_ID "<PRD_ID>"  and  BASE_PRD_ID "<ProductId>"
And user select Account Type from dropdown as Saving or Current "<AccountType>"
And user select Product Type from dropdown as Flexi Product "<ProductType>"
And user enters "<CustomerNumber>" active Customer Number
Then verify Account opening Date "<AccountOpeningDate>" with BRANCHPARAMETERS table col CURRENT_DT
And user enters "<IntroducerNumber>" active Introducer Number
Then Verify "<IntroducerNumber>" introducer Is Customer "<INTRODUCERISCUSTOMER>"  in CUST_MASTER table 
And user select "<NatureofAccount>" from Nature of Account dropdown
When user click on Opening Details tab
Then Verify cust Category "<Category>" where Customer Number "<CustomerNumber>"
And user select "<OperatingInstruction>" from Operating Instruction
Then Verify Currency "<Currency>" 
When user click on Notification Details tab
Then user select ATM facility  as Yes  "<ATMfacility>" 
Then user select SMS facility  as Yes  "<SMSfacility>" 
Then user select Email Notification as Yes  "<EmailNotification>" 
Then user select ChequeBook facility  as Yes  "<ChequeBookfacility>" 
Then user select Email Address from drop down "<EmailAddress>" when Email Notification as select Yes
Then user select Mobile from drop down "<Mobile>" when SMS facility  as select Yes
When user click on Flexi Account Details tab
Then Verify Flexi Account Details tab ProductId "<ProductId>" ProductName "<ProductType>" MinimumBaseAmount "<MinimumBaseAmount>" MaximumBaseAmount "<MaximumBaseAmount>" UnitAmount "<UnitAmount>"
Then verify ProductId "<ProductId>" with FLEXI_UNIT_PARAMETER table col CUT_OFF_LIMIT "<MinimumBaseAmount>" and MAX_FLEXI_AMOUNT "<MaximumBaseAmount>" and AMOUNT_PER_UNIT "<UnitAmount>" 
When user click on Submit button
Then store number on model with name "<UserAccNumStoreInCache>" and "<UserAccNumKeyInCache>"
Then store number on model with name "<InternalAccNumStoreInCache>" and "<InternalAccNumKeyInCache>"
Then store number on model with name "<FlexiAccNumStoreInCache>" and "<FlexiAccNumKeyInCache>"
Then user click SI "<ProceedforSINoOrYes>" Yes or No
And user fetched Name of Debit Acc Num 
And user enters "<CreditAccountNumber>" active Credit Account Number
Then user select SI Type "<SIType>" Fixed or Floating 
Then verify Debit Customer Name On Ui for Self of Account Type "<AccountType>" and flow "<Flow>"
Then verify Credit Customer Name On Ui "<CreditAccountNumber>"
And user enters SI "<Amount>" 
Then user verify Todays date "<AccountOpeningDate>" with Branchparameteres
Then user click on Date & SI Settings tab
And user select Frequency from dropdown "<Frequency>"
And user enters Period "<Period>" 
And user enters GraceDays "<GraceDays>" 
Then verify From Narration  "<FromNarration>" and To Narration "<ToNarration>" 
Then user select Freeze SI amount as Yes or No "<FreezeSIamount>" 
Then user select Execute when enough credit available as Yes or No "<Executewhenenoughcreditavailable>" 
Then verify Next Due Date "<NextDueDateUi>" in Important Dates table of SI
Then verify Expiry Date "<ExpiryDateUi>" in Important Dates table of SI
Then user click on Submit of SI button 
Then store number on model with name "<SINumStoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"  
Then verify AccountType "<AccountType>" of ACCOUNT_MASTER col  STATUS "<STATUS>" & Customer Account & DEPOSIT_MASTER & SIFlag "<SIFlag>" & Flow "<Flow>"
Then verify SI_MASTER table col Credit Account Num "<CreditAccountNumber>" and NextDueDate "<NextDueDate>" and ExpiryDate "<ExpiryDate>" and SiType "<SIType>" and Amount "<Amount>" and NatureofAccount "<NatureofAccount>" and AccountType "<AccountType>" & Flow "<Flow>" 
Then user closes testCase

Examples:
|testCase|MenuName|MenuPath|ProductId|STATUS|FLEXI_APPLICABLE|PRD_ID|AccountType|ProductType|CustomerNumber|AccountOpeningDate|IntroducerNumber|INTRODUCERISCUSTOMER|NatureofAccount|Category|OperatingInstruction|Currency|ATMfacility|SMSfacility|EmailNotification|ChequeBookfacility|EmailAddress|Mobile|UNIT_OF_PERIOD|UserAccNumStoreInCache|UserAccNumKeyInCache|InternalAccNumStoreInCache|InternalAccNumKeyInCache|FlexiAccNumStoreInCache|FlexiAccNumKeyInCache|MinimumBaseAmount|MaximumBaseAmount|UnitAmount|ProceedforSINoOrYes|CreditAccountNumber|SIType|Amount|Frequency|Period|GraceDays|FromNarration|ToNarration|FreezeSIamount|Executewhenenoughcreditavailable|NextDueDate|ExpiryDate|NextDueDateUi|ExpiryDateUi|successMessage|SINumStoreInCache|KeyInCache|SIFlag|Flow|
|Flexi account Opening SB Self Nature Of Account With SI|Account Opening|Menu_CASAAccountOpening|170|A|Y|888|Saving Account|Flexi-Saving Account|0011000000001930|23/02/2020|0011000000001937|Y|Self|SENR|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|B|UserAccNumSBWithSI|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumSBWithSI|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumSBWithSI|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|Yes|101210101010000120|F|1000|M1|12|0|To SI|From Account|No|Yes|2020-03-23|2021-02-23|23/03/2020|23/02/2021|SI Entry Save Successfully.|SINum_SB|SIEntryScreen_SINumberValue|Y|Entry|
|Flexi account Opening CA Self Nature Of Account With SI|Account Opening|Menu_CASAAccountOpening|171|A|Y|889|Current Account|Flexi-Current Account|0011000000001930|23/02/2020|0011000000001937|Y|Self|SENR|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|B|UserAccNumCAWithSI|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumCAWithSI|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumCAWithSI|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|Yes|101210101010000120|F|2000|M1|24|0|To SI|From Account|No|Yes|2020-03-23|2022-02-23|23/03/2020|23/02/2022|SI Entry Save Successfully.|SINum_CA|SIEntryScreen_SINumberValue|Y|Entry|

|SB Flexi Entry Self Nature Of Account With SI for Rejection|Account Opening|Menu_CASAAccountOpening|170|A|Y|888|Saving Account|Flexi-Saving Account|0011000000001930|23/02/2020|0011000000001937|Y|Self|SENR|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|B|UserAccNumSBWithSIRejection|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumSBWithSIRejection|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumSBWithSIRejection|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|Yes|101210101010000120|F|1000|M1|12|0|To SI|From Account|No|Yes|2020-03-23|2021-02-23|23/03/2020|23/02/2021|SI Entry Save Successfully.|SINum_SBRejection|SIEntryScreen_SINumberValue|Y|RejectEntry|
|CA Flexi Entry Self Nature Of Account With SI for Rejection|Account Opening|Menu_CASAAccountOpening|171|A|Y|889|Current Account|Flexi-Current Account|0011000000001930|23/02/2020|0011000000001937|Y|Self|SENR|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|B|UserAccNumCAWithSIRejection|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumCAWithSIRejection|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumCAWithSIRejection|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|Yes|101210101010000120|F|2000|M1|24|0|To SI|From Account|No|Yes|2020-03-23|2022-02-23|23/03/2020|23/02/2022|SI Entry Save Successfully.|SINum_CARejection|SIEntryScreen_SINumberValue|Y|RejectEntry|


@FlexiAccount
Scenario Outline: 5.Flexi Account Opening SB & CA Joint Nature of Account With SI
Scenario : 5.Flexi Account Opening SB & CA Joint Nature of Account With SI
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then verify product "<ProductId>" STATUS is active or not with PRODUCT table col STATUS "<STATUS>" and Flexi Applicable falg "<FLEXI_APPLICABLE>" 
Then verify Link Flexi Product For SB / CA with FLEXI_UNIT_PARAMETER  table UNIT_OF_PERIOD "<UNIT_OF_PERIOD>" and  col  PRD_ID "<PRD_ID>"  and  BASE_PRD_ID "<ProductId>"
And user select Account Type from dropdown as Saving or Current "<AccountType>"
And user select Product Type from dropdown as Flexi Product "<ProductType>"
And user enters "<CustomerNumber>" active Customer Number
Then verify Account opening Date "<AccountOpeningDate>" with BRANCHPARAMETERS table col CURRENT_DT
And user enters "<IntroducerNumber>" active Introducer Number
Then Verify "<IntroducerNumber>" introducer Is Customer "<INTRODUCERISCUSTOMER>"  in CUST_MASTER table 
And user select "<NatureofAccount>" from Nature of Account dropdown
When user click on Operator Details tab
And user enters OtherOperatorNumber"<OtherOperatorNumber>" active Customer Number
Then user select Other Operator as Partner or Official "<PatOff>" and  Authorized Signatory  as Yes or No  "<AuthorizedSignatory>"
When user click on Add Operator button
When user click on Opening Details tab
Then Verify cust Category "<Category>" where Customer Number "<CustomerNumber>"
And user select "<OperatingInstruction>" from Operating Instruction
Then Verify Currency "<Currency>" 
When user click on Notification Details tab
Then user select ATM facility  as Yes  "<ATMfacility>" 
Then user select SMS facility  as Yes  "<SMSfacility>" 
Then user select Email Notification as Yes  "<EmailNotification>" 
Then user select ChequeBook facility  as Yes  "<ChequeBookfacility>" 
Then user select Email Address from drop down "<EmailAddress>" when Email Notification as select Yes
Then user select Mobile from drop down "<Mobile>" when SMS facility  as select Yes
When user click on Flexi Account Details tab
Then Verify Flexi Account Details tab ProductId "<ProductId>" ProductName "<ProductType>" MinimumBaseAmount "<MinimumBaseAmount>" MaximumBaseAmount "<MaximumBaseAmount>" UnitAmount "<UnitAmount>"
Then verify ProductId "<ProductId>" with FLEXI_UNIT_PARAMETER table col CUT_OFF_LIMIT "<MinimumBaseAmount>" and MAX_FLEXI_AMOUNT "<MaximumBaseAmount>" and AMOUNT_PER_UNIT "<UnitAmount>" 
When user click on Submit button
Then store number on model with name "<UserAccNumStoreInCache>" and "<UserAccNumKeyInCache>"
Then store number on model with name "<InternalAccNumStoreInCache>" and "<InternalAccNumKeyInCache>"
Then store number on model with name "<FlexiAccNumStoreInCache>" and "<FlexiAccNumKeyInCache>"
Then user click SI "<ProceedforSINoOrYes>" Yes or No
And user fetched Name of Debit Acc Num 
And user enters "<CreditAccountNumber>" active Credit Account Number
Then user select SI Type "<SIType>" Fixed or Floating 
Then verify Debit Customer Name On Ui for Joint of Account Type "<AccountType>" and flow "<Flow>"
Then verify Credit Customer Name On Ui "<CreditAccountNumber>"
And user enters SI "<Amount>" 
Then user verify Todays date "<AccountOpeningDate>" with Branchparameteres
Then user click on Date & SI Settings tab
And user select Frequency from dropdown "<Frequency>"
And user enters Period "<Period>" 
And user enters GraceDays "<GraceDays>" 
Then verify From Narration  "<FromNarration>" and To Narration "<ToNarration>" 
Then user select Freeze SI amount as Yes or No "<FreezeSIamount>" 
Then user select Execute when enough credit available as Yes or No "<Executewhenenoughcreditavailable>" 
Then verify Next Due Date "<NextDueDateUi>" in Important Dates table of SI
Then verify Expiry Date "<ExpiryDateUi>" in Important Dates table of SI
Then user click on Submit of SI button 
Then store number on model with name "<SINumStoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"  
Then verify AccountType "<AccountType>" of ACCOUNT_MASTER STATUS "<STATUS>" & Customer Account & DEPOSIT_MASTER of joint account & OtherOperator "<OtherOperator>" & PartOff "<PatOff>" & AuthorizedSignatory "<AuthorizedSignatory>" & SIFlag "<SIFlag>" & Flow "<Flow>" 
Then verify SI_MASTER table col Credit Account Num "<CreditAccountNumber>" and NextDueDate "<NextDueDate>" and ExpiryDate "<ExpiryDate>" and SiType "<SIType>" and Amount "<Amount>" and NatureofAccount "<NatureofAccount>" and AccountType "<AccountType>" & Flow "<Flow>" 
Then user closes testCase

Examples:
|testCase|MenuName|MenuPath|ProductId|STATUS|FLEXI_APPLICABLE|PRD_ID|AccountType|ProductType|CustomerNumber|AccountOpeningDate|IntroducerNumber|INTRODUCERISCUSTOMER|NatureofAccount|Category|OperatingInstruction|Currency|ATMfacility|SMSfacility|EmailNotification|ChequeBookfacility|EmailAddress|Mobile|UNIT_OF_PERIOD|UserAccNumStoreInCache|UserAccNumKeyInCache|InternalAccNumStoreInCache|InternalAccNumKeyInCache|FlexiAccNumStoreInCache|FlexiAccNumKeyInCache|MinimumBaseAmount|MaximumBaseAmount|UnitAmount|OtherOperatorNumber|OtherOperator|PatOff|AuthorizedSignatory|ProceedforSINoOrYes|CreditAccountNumber|SIType|Amount|Frequency|Period|GraceDays|FromNarration|ToNarration|FreezeSIamount|Executewhenenoughcreditavailable|NextDueDate|ExpiryDate|NextDueDateUi|ExpiryDateUi|successMessage|SINumStoreInCache|KeyInCache|SIFlag|Flow|
|Flexi account Opening SB Joint Nature Of Account With SI|Account Opening|Menu_CASAAccountOpening|170|A|Y|888|Saving Account|Flexi-Saving Account|0011000000001930|23/02/2020|0011000000001937|Y|Joint Stock Company|SENR|Both Jointly|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|B|UserAccNumSBWithOperatorWithSI|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumSBWithOperatorWithSI|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumSBWithOperatorWithSI|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|0011000000001946|O|O|Y|Yes|101210101010000121|F|2000|M1|12|0|To SI|From Account|No|Yes|2020-03-23|2021-02-23|23/03/2020|23/02/2021|SI Entry Save Successfully.|SINum_SBWithOperator|SIEntryScreen_SINumberValue|Y|Entry|
|Flexi account Opening CA Joint Nature Of Account With SI|Account Opening|Menu_CASAAccountOpening|171|A|Y|889|Current Account|Flexi-Current Account|0011000000001930|23/02/2020|0011000000001937|Y|Joint Stock Company|SENR|Both Jointly|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|B|UserAccNumCAWithOperatorWithSI|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumCAWithOperatorWithSI|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumCAWithOperatorWithSI|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|0011000000001947|O|P|N|Yes|101210101010000121|F|2000|M1|12|0|To SI|From Account|No|Yes|2020-03-23|2021-02-23|23/03/2020|23/02/2021|SI Entry Save Successfully.|SINum_CAWithOperator|SIEntryScreen_SINumberValue|Y|Entry|

|SB Flexi Entry Joint Nature Of Account With SI for Rejection|Account Opening|Menu_CASAAccountOpening|170|A|Y|888|Saving Account|Flexi-Saving Account|0011000000001930|23/02/2020|0011000000001937|Y|Joint Stock Company|SENR|Both Jointly|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|B|UserAccNumSBWithOperatorWithSIRejection|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumSBWithOperatorWithSIRejection|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumSBWithOperatorWithSIRejection|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|0011000000001946|O|O|Y|Yes|101210101010000121|F|2000|M1|12|0|To SI|From Account|No|Yes|2020-03-23|2021-02-23|23/03/2020|23/02/2021|SI Entry Save Successfully.|SINum_SBWithOperatorRejection|SIEntryScreen_SINumberValue|Y|RejectEntry|
|CA Flexi Entry Joint Nature Of Account With SI for Rejection|Account Opening|Menu_CASAAccountOpening|171|A|Y|889|Current Account|Flexi-Current Account|0011000000001930|23/02/2020|0011000000001937|Y|Joint Stock Company|SENR|Both Jointly|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|B|UserAccNumCAWithOperatorWithSIRejection|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumCAWithOperatorWithSIRejection|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumCAWithOperatorWithSIRejection|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|0011000000001947|O|P|N|Yes|101210101010000121|F|2000|M1|12|0|To SI|From Account|No|Yes|2020-03-23|2021-02-23|23/03/2020|23/02/2021|SI Entry Save Successfully.|SINum_CAWithOperatorRejection|SIEntryScreen_SINumberValue|Y|RejectEntry|


############################################################## With Nominee ##############################################################################


Scenario Outline: 6.Flexi account Opening with SI and Nominee with ExistingNomineeAs NO and CustomerAsNominee NO
Scenario : 6.Flexi account Opening with SI and Nominee with ExistingNomineeAs NO and CustomerAsNominee NO
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then verify product "<ProductId>" STATUS is active or not with PRODUCT table col STATUS "<STATUS>" and Flexi Applicable falg "<FLEXI_APPLICABLE>" 
Then verify Link Flexi Product For SB / CA with FLEXI_UNIT_PARAMETER  table UNIT_OF_PERIOD "<UNIT_OF_PERIOD>" and  col  PRD_ID "<PRD_ID>"  and  BASE_PRD_ID "<ProductId>"
And user select Account Type from dropdown as Saving or Current "<AccountType>"
And user select Product Type from dropdown as Flexi Product "<ProductType>"
And user enters "<CustomerNumber>" active Customer Number
Then verify Account opening Date "<AccountOpeningDate>" with BRANCHPARAMETERS table col CURRENT_DT
And user enters "<IntroducerNumber>" active Introducer Number
Then Verify "<IntroducerNumber>" introducer Is Customer "<INTRODUCERISCUSTOMER>"  in CUST_MASTER table 
And user select "<NatureofAccount>" from Nature of Account dropdown
When user click on Opening Details tab
Then Verify cust Category "<Category>" where Customer Number "<CustomerNumber>"
And user select "<OperatingInstruction>" from Operating Instruction
Then Verify Currency "<Currency>" 
When user click on Notification Details tab
Then user select ATM facility  as Yes  "<ATMfacility>" 
Then user select SMS facility  as Yes  "<SMSfacility>" 
Then user select Email Notification as Yes  "<EmailNotification>" 
Then user select ChequeBook facility  as Yes  "<ChequeBookfacility>" 
Then user select Email Address from drop down "<EmailAddress>" when Email Notification as select Yes
Then user select Mobile from drop down "<Mobile>" when SMS facility  as select Yes
When user click on Flexi Account Details tab
Then Verify Flexi Account Details tab ProductId "<ProductId>" ProductName "<ProductType>" MinimumBaseAmount "<MinimumBaseAmount>" MaximumBaseAmount "<MaximumBaseAmount>" UnitAmount "<UnitAmount>"
Then verify ProductId "<ProductId>" with FLEXI_UNIT_PARAMETER table col CUT_OFF_LIMIT "<MinimumBaseAmount>" and MAX_FLEXI_AMOUNT "<MaximumBaseAmount>" and AMOUNT_PER_UNIT "<UnitAmount>" 
When user click on Submit button
Then store number on model with name "<UserAccNumStoreInCache>" and "<UserAccNumKeyInCache>"
Then store number on model with name "<InternalAccNumStoreInCache>" and "<InternalAccNumKeyInCache>"
Then store number on model with name "<FlexiAccNumStoreInCache>" and "<FlexiAccNumKeyInCache>"
Then user click SI "<ProceedforSINoOrYes>" Yes or No
And user fetched Name of Debit Acc Num 
And user enters "<CreditAccountNumber>" active Credit Account Number
Then user select SI Type "<SIType>" Fixed or Floating 
Then verify Debit Customer Name On SI Screen Ui of Account Type "<AccountType>" and UseExistingNominee "<UseExistingNominee>" & Flow "<Flow>"
Then verify Credit Customer Name On Ui "<CreditAccountNumber>"
And user enters SI "<Amount>" 
Then user verify Todays date "<AccountOpeningDate>" with Branchparameteres
Then user click on Date & SI Settings tab
And user select Frequency from dropdown "<Frequency>"
And user enters Period "<Period>" 
And user enters GraceDays "<GraceDays>" 
Then verify From Narration  "<FromNarration>" and To Narration "<ToNarration>" 
Then user select Freeze SI amount as Yes or No "<FreezeSIamount>" 
Then user select Execute when enough credit available as Yes or No "<Executewhenenoughcreditavailable>" 
Then verify Next Due Date "<NextDueDateUi>" in Important Dates table of SI
Then verify Expiry Date "<ExpiryDateUi>" in Important Dates table of SI
Then user click on Submit of SI button 
Then store number on model with name "<SINumStoreInCache>" and "<KeyInCache>"
Then user select Proceed for Nominee as Yes "<ProceedforNominee>" Nominee Entry screen display
Then Verify "<InternalAccNumStoreInCache>" account number Details
Then user select Use Existing Nominee as Yes or No  "<UseExistingNominee>" 
Then user select Customer as Nominee as Yes or No "<CustomerasNominee>"
And user enters Nominee Name "<NomineeName>"
And user enters Nominee Date of Birth "<DateofBirth>"
Then user verify Nominee Age "<Age>"
Then user select Nominee Photo as Yes or No "<NomineePhoto>"
And user select Nominee Releationship from dropdown  "<NomineeReleationship>"
Then user select  Nominee address same as account holder as Yes or No  "<NomineeAddressSameAsAccountHolder>"
And user enters NomineeCustomerAddress "<NomineeCustomerAddress>" 
And observe Nominee is Minor or Major "<NomineeIsMinorOrMajar>"
When user click on Nominee Submit button
Then user finds successMessage "<successMessage>"  
Then verify AccountType "<AccountType>" of ACCOUNT_MASTER col  STATUS "<STATUS>" & Customer Account & DEPOSIT_MASTER &  UseExistingNominee "<UseExistingNominee>"
Then verify SI_MASTER table col Credit Account Num "<CreditAccountNumber>" and NextDueDate "<NextDueDate>" and ExpiryDate "<ExpiryDate>" and SiType "<SIType>" and Amount "<Amount>" and NatureofAccount "<NatureofAccount>" and AccountType "<AccountType>" &  UseExistingNominee "<UseExistingNominee>"
Then verify NOMINEE_MASTER table Status "<Status>" and "<NomineeName>" and  Account Number "<InternalAccNumStoreInCache>" and NomineeAsCust "<NomineeAsCust>"
Then user closes testCase

Examples:
|testCase|MenuName|MenuPath|ProductId|STATUS|FLEXI_APPLICABLE|PRD_ID|AccountType|ProductType|CustomerNumber|AccountOpeningDate|IntroducerNumber|INTRODUCERISCUSTOMER|NatureofAccount|Category|OperatingInstruction|Currency|ATMfacility|SMSfacility|EmailNotification|ChequeBookfacility|EmailAddress|Mobile|UNIT_OF_PERIOD|UserAccNumStoreInCache|UserAccNumKeyInCache|InternalAccNumStoreInCache|InternalAccNumKeyInCache|FlexiAccNumStoreInCache|FlexiAccNumKeyInCache|MinimumBaseAmount|MaximumBaseAmount|UnitAmount|ProceedforSINoOrYes|CreditAccountNumber|SIType|Amount|Frequency|Period|GraceDays|FromNarration|ToNarration|FreezeSIamount|Executewhenenoughcreditavailable|NextDueDate|ExpiryDate|NextDueDateUi|ExpiryDateUi|SINumStoreInCache|KeyInCache|SIFlag|ProceedforNominee|UseExistingNominee|CustomerasNominee|NomineeName|DateofBirth|Age|NomineePhoto|NomineeReleationship|NomineeAddressSameAsAccountHolder|NomineeCustomerAddress|NomineeIsMinorOrMajar|NomineeName|successMessage|Status|Flow|NomineeAsCust|
|Flexi Opening SB With SI & ExistingNomineeAs NO and CustomerAsNominee NO|Account Opening|Menu_CASAAccountOpening|170|A|Y|888|Saving Account|Flexi-Saving Account|0011000000001930|23/02/2020|0011000000001937|Y|Self|SENR|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|B|UserAccNumSBWithSIExistingNomNo|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumSBWithSIExistingNomNo|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumSBWithSIExistingNomNo|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|Yes|101210101010000120|F|1000|M1|12|0|To SI|From Account|No|Yes|2020-03-23|2021-02-23|23/03/2020|23/02/2021|ExistingNomNoSINum_SB|SIEntryScreen_SINumberValue|Y|Yes|No|No|SAGAR RAM PAWAR|08/09/1991|29|No|Father|No|Pune|Major|SAGAR RAM PAWAR|Nominee Record added Successfully.|E|Entry|N|
|Flexi Opening CA With SI & ExistingNomineeAs NO and CustomerAsNominee NO|Account Opening|Menu_CASAAccountOpening|171|A|Y|889|Current Account|Flexi-Current Account|0011000000001930|23/02/2020|0011000000001937|Y|Self|SENR|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|B|UserAccNumCAWithSIExistingNomNo|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumCAWithSIExistingNomNo|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumCAWithSIExistingNomNo|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|Yes|101210101010000120|F|2000|M1|24|0|To SI|From Account|No|Yes|2020-03-23|2022-02-23|23/03/2020|23/02/2022|ExistingNomNoSINum_CA|SIEntryScreen_SINumberValue|Y|Yes|No|No|SAGAR RAM PAWAR|08/09/1991|29|No|Father|No|Pune|Major|SAGAR RAM PAWAR|Nominee Record added Successfully.|E|Entry|N|

|SB Flexi Entry With SI & ExistingNomineeAs No & CustomerAsNominee No Rejection|Account Opening|Menu_CASAAccountOpening|170|A|Y|888|Saving Account|Flexi-Saving Account|0011000000001930|23/02/2020|0011000000001937|Y|Self|SENR|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|B|UserAccNumSBWithSIExistingNomNoRejection|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumSBWithSIExistingNomNoRejection|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumSBWithSIExistingNomNoRejection|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|Yes|101210101010000120|F|1000|M1|12|0|To SI|From Account|No|Yes|2020-03-23|2021-02-23|23/03/2020|23/02/2021|ExistingNomNoSINum_SBRejection|SIEntryScreen_SINumberValue|Y|Yes|No|No|SAGAR RAM PAWAR|08/09/1991|29|No|Father|No|Pune|Major|SAGAR RAM PAWAR|Nominee Record added Successfully.|E|RejectEntry|N|
|CA Flexi Entry With SI & ExistingNomineeAs No & CustomerAsNominee No Rejection|Account Opening|Menu_CASAAccountOpening|171|A|Y|889|Current Account|Flexi-Current Account|0011000000001930|23/02/2020|0011000000001937|Y|Self|SENR|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|B|UserAccNumCAWithSIExistingNomNoRejection|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumCAWithSIExistingNomNoRejection|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumCAWithSIExistingNomNoRejection|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|Yes|101210101010000120|F|2000|M1|24|0|To SI|From Account|No|Yes|2020-03-23|2022-02-23|23/03/2020|23/02/2022|ExistingNomNoSINum_CARejection|SIEntryScreen_SINumberValue|Y|Yes|No|No|SAGAR RAM PAWAR|08/09/1991|29|No|Father|No|Pune|Major|SAGAR RAM PAWAR|Nominee Record added Successfully.|E|RejectEntry|N|



Scenario Outline: 7.Flexi account Opening with SI and Nominee with ExistingNomineeAs Yes and CustomerAsNominee Yes
Scenario : 7.Flexi account Opening with SI and Nominee with ExistingNomineeAs Yes and CustomerAsNominee Yes
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then verify product "<ProductId>" STATUS is active or not with PRODUCT table col STATUS "<STATUS>" and Flexi Applicable falg "<FLEXI_APPLICABLE>" 
Then verify Link Flexi Product For SB / CA with FLEXI_UNIT_PARAMETER  table UNIT_OF_PERIOD "<UNIT_OF_PERIOD>" and  col  PRD_ID "<PRD_ID>"  and  BASE_PRD_ID "<ProductId>"
And user select Account Type from dropdown as Saving or Current "<AccountType>"
And user select Product Type from dropdown as Flexi Product "<ProductType>"
And user enters "<CustomerNumber>" active Customer Number
Then verify Account opening Date "<AccountOpeningDate>" with BRANCHPARAMETERS table col CURRENT_DT
And user enters "<IntroducerNumber>" active Introducer Number
Then Verify "<IntroducerNumber>" introducer Is Customer "<INTRODUCERISCUSTOMER>"  in CUST_MASTER table 
And user select "<NatureofAccount>" from Nature of Account dropdown
When user click on Opening Details tab
Then Verify cust Category "<Category>" where Customer Number "<CustomerNumber>"
And user select "<OperatingInstruction>" from Operating Instruction
Then Verify Currency "<Currency>" 
When user click on Notification Details tab
Then user select ATM facility  as Yes  "<ATMfacility>" 
Then user select SMS facility  as Yes  "<SMSfacility>" 
Then user select Email Notification as Yes  "<EmailNotification>" 
Then user select ChequeBook facility  as Yes  "<ChequeBookfacility>" 
Then user select Email Address from drop down "<EmailAddress>" when Email Notification as select Yes
Then user select Mobile from drop down "<Mobile>" when SMS facility  as select Yes
When user click on Flexi Account Details tab
Then Verify Flexi Account Details tab ProductId "<ProductId>" ProductName "<ProductType>" MinimumBaseAmount "<MinimumBaseAmount>" MaximumBaseAmount "<MaximumBaseAmount>" UnitAmount "<UnitAmount>"
Then verify ProductId "<ProductId>" with FLEXI_UNIT_PARAMETER table col CUT_OFF_LIMIT "<MinimumBaseAmount>" and MAX_FLEXI_AMOUNT "<MaximumBaseAmount>" and AMOUNT_PER_UNIT "<UnitAmount>" 
When user click on Submit button
Then store number on model with name "<UserAccNumStoreInCache>" and "<UserAccNumKeyInCache>"
Then store number on model with name "<InternalAccNumStoreInCache>" and "<InternalAccNumKeyInCache>"
Then store number on model with name "<FlexiAccNumStoreInCache>" and "<FlexiAccNumKeyInCache>"
Then user click SI "<ProceedforSINoOrYes>" Yes or No
And user fetched Name of Debit Acc Num 
And user enters "<CreditAccountNumber>" active Credit Account Number
Then user select SI Type "<SIType>" Fixed or Floating 
Then verify Debit Customer Name On SI Screen Ui of Account Type "<AccountType>" and UseExistingNominee "<UseExistingNominee>" & Flow "<Flow>"
Then verify Credit Customer Name On Ui "<CreditAccountNumber>"
And user enters SI "<Amount>" 
Then user verify Todays date "<AccountOpeningDate>" with Branchparameteres
Then user click on Date & SI Settings tab
And user select Frequency from dropdown "<Frequency>"
And user enters Period "<Period>" 
And user enters GraceDays "<GraceDays>" 
Then verify From Narration  "<FromNarration>" and To Narration "<ToNarration>" 
Then user select Freeze SI amount as Yes or No "<FreezeSIamount>" 
Then user select Execute when enough credit available as Yes or No "<Executewhenenoughcreditavailable>" 
Then verify Next Due Date "<NextDueDateUi>" in Important Dates table of SI
Then verify Expiry Date "<ExpiryDateUi>" in Important Dates table of SI
Then user click on Submit of SI button 
Then store number on model with name "<SINumStoreInCache>" and "<KeyInCache>"
Then user select Proceed for Nominee as Yes "<ProceedforNominee>" Nominee Entry screen display
Then Verify "<InternalAccNumStoreInCache>" account number Details
Then user select Use Existing Nominee as Yes or No  "<UseExistingNominee>" 
And user select Nominee in All Account Number from dropdown "<AllAccountNumber>"
Then user select Customer as Nominee as Yes or No "<CustomerasNominee>"
Then user verify  Customer Number "<NomineeCustomerNumber>" and Nominee Name "<NomineeName>" and Date of Birth "<DateofBirth>" and Nominee Age "<Age>"
Then user select Nominee Photo as Yes or No "<NomineePhoto>"
And user verify Nominee Releationship from dropdown  "<NomineeReleationship>"
And user verify NomineeCustomerAddress "<NomineeCustomerAddress>" 
And observe Nominee is Minor or Major "<NomineeIsMinorOrMajar>"
When user click on Nominee Submit button
Then user finds successMessage "<successMessage>" 
Then verify AccountType "<AccountType>" of ACCOUNT_MASTER col  STATUS "<STATUS>" & Customer Account & DEPOSIT_MASTER &  UseExistingNominee "<UseExistingNominee>"
Then verify SI_MASTER table col Credit Account Num "<CreditAccountNumber>" and NextDueDate "<NextDueDate>" and ExpiryDate "<ExpiryDate>" and SiType "<SIType>" and Amount "<Amount>" and NatureofAccount "<NatureofAccount>" and AccountType "<AccountType>" &  UseExistingNominee "<UseExistingNominee>"
Then verify NOMINEE_MASTER table Status "<Status>" and "<NomineeName>" and  Account Number "<InternalAccNumStoreInCache>" and NomineeAsCust "<NomineeAsCust>"
Then user closes testCase

Examples:
|testCase|MenuName|MenuPath|ProductId|STATUS|FLEXI_APPLICABLE|PRD_ID|AccountType|ProductType|CustomerNumber|AccountOpeningDate|IntroducerNumber|INTRODUCERISCUSTOMER|NatureofAccount|Category|OperatingInstruction|Currency|ATMfacility|SMSfacility|EmailNotification|ChequeBookfacility|EmailAddress|Mobile|UNIT_OF_PERIOD|UserAccNumStoreInCache|UserAccNumKeyInCache|InternalAccNumStoreInCache|InternalAccNumKeyInCache|FlexiAccNumStoreInCache|FlexiAccNumKeyInCache|MinimumBaseAmount|MaximumBaseAmount|UnitAmount|ProceedforSINoOrYes|CreditAccountNumber|SIType|Amount|Frequency|Period|GraceDays|FromNarration|ToNarration|FreezeSIamount|Executewhenenoughcreditavailable|NextDueDate|ExpiryDate|NextDueDateUi|ExpiryDateUi|SINumStoreInCache|KeyInCache|SIFlag|ProceedforNominee|UseExistingNominee|CustomerasNominee|DateofBirth|Age|NomineePhoto|NomineeReleationship|NomineeCustomerAddress|NomineeIsMinorOrMajar|NomineeName|successMessage|AllAccountNumber|NomineeCustomerNumber|Status|Flow|NomineeAsCust|
|Flexi Opening SB With SI & ExistingNomineeAs Yes & CustomerAsNominee Yes|Account Opening|Menu_CASAAccountOpening|170|A|Y|888|Saving Account|Flexi-Saving Account|0011000000001930|23/02/2020|0011000000001937|Y|Self|SENR|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|B|UserAccNumSBWithSIExistingNomYes|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumSBWithSIExistingNomYes|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumSBWithSIExistingNomYes|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|Yes|101210101010000120|F|1000|M1|12|0|To SI|From Account|No|Yes|2020-03-23|2021-02-23|23/03/2020|23/02/2021|ExistingNomYesSINum_SB|SIEntryScreen_SINumberValue|Y|Yes|Yes|Yes|12/01/1989|31|No|Father|Pune,FC Road|Major|Automation customer G|Nominee Record added Successfully.|1|0011000000001740|E|Entry|Y|
|Flexi Opening CA With SI & ExistingNomineeAs Yes & CustomerAsNominee Yes|Account Opening|Menu_CASAAccountOpening|171|A|Y|889|Current Account|Flexi-Current Account|0011000000001930|23/02/2020|0011000000001937|Y|Self|SENR|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|B|UserAccNumCAWithSIExistingNomYes|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumCAWithSIExistingNomYes|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumCAWithSIExistingNomYes|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|Yes|101210101010000120|F|2000|M1|24|0|To SI|From Account|No|Yes|2020-03-23|2022-02-23|23/03/2020|23/02/2022|ExistingNomYesSINum_CA|SIEntryScreen_SINumberValue|Y|Yes|Yes|Yes|12/01/1989|31|No|Father|Pune,FC Road|Major|Automation customer G|Nominee Record added Successfully.|1|0011000000001740|E|Entry|Y|

|SB Flexi Entry With SI & ExistingNomineeAs Yes & CustomerAsNominee Yes Rejection|Account Opening|Menu_CASAAccountOpening|170|A|Y|888|Saving Account|Flexi-Saving Account|0011000000001930|23/02/2020|0011000000001937|Y|Self|SENR|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|B|UserAccNumSBWithSIExistingNomYesRejection|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumSBWithSIExistingNomYesRejection|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumSBWithSIExistingNomYesRejection|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|Yes|101210101010000120|F|1000|M1|12|0|To SI|From Account|No|Yes|2020-03-23|2021-02-23|23/03/2020|23/02/2021|ExistingNomYesSINum_SBRejection|SIEntryScreen_SINumberValue|Y|Yes|Yes|Yes|12/01/1989|31|No|Father|Pune,FC Road|Major|Automation customer G|Nominee Record added Successfully.|1|0011000000001740|E|RejectEntry|Y|
|CA Flexi Entry With SI & ExistingNomineeAs Yes & CustomerAsNominee Yes Rejection|Account Opening|Menu_CASAAccountOpening|171|A|Y|889|Current Account|Flexi-Current Account|0011000000001930|23/02/2020|0011000000001937|Y|Self|SENR|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com| 9550436723|B|UserAccNumCAWithSIExistingNomYesRejection|DDAcountOpeningScreen_UserAccountNumber|InternalAccountNumCAWithSIExistingNomYesRejection|DDAcountOpeningScreen_InternalAccountNumber|FlexiAccNumCAWithSIExistingNomYesRejection|DDAcountOpeningScreen_FlexiAccountNumber|50000|999999999999|10000|Yes|101210101010000120|F|2000|M1|24|0|To SI|From Account|No|Yes|2020-03-23|2022-02-23|23/03/2020|23/02/2022|ExistingNomYesSINum_CARejection|SIEntryScreen_SINumberValue|Y|Yes|Yes|Yes|12/01/1989|31|No|Father|Pune,FC Road|Major|Automation customer G|Nominee Record added Successfully.|1|0011000000001740|E|RejectEntry|Y|

############################################################### Flexi Account Opening Auth ########################################################################################


Scenario Outline: 8. Flexi account Opening Self Nature Of Account Authorization
Scenario : 8. Flexi account Opening Self Nature Of Account Authorization
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select account type from dropdown "<AccType>"
And user select unauthorized accounts from drop dowwn "<InternalAccNo>" & "<UserAccNo>"
Then verify ProductName "<ProductName>" CustName "<CustName>" IntroName "<IntroName>" NatureOfAcc "<NatureOfAcc>" AccopenDate "<AccopenDate>"
When user click on Opening Details Tab
Then verify Category "<Category>" OperatingInstru "<OperatingInstru>" Currency "<Currency>"
When user click on Notification Details Tab
Then verify ATMFacility "<ATMFacility>" SMSFacility "<SMSFacility>" EmailNoti "<EmailNoti>" ChqbkFacility "<ChqbkFacility>" EmailID "<EmailID>" MobileNo "<MobileNo>"
When user click on Flexi Account Details Tab
Then verify ProdId "<ProdId>" ProductName "<ProductName>" NatureOfAcc "<NatureOfAcc>" MiniBaseAmt "<MiniBaseAmt>" MaxBaseAmt "<MaxBaseAmt>" UnitAmt "<UnitAmt>" SiFlag "<SiFlag>"
And user click on Nominee Details Tab
And user click on Authorize button of CASA Account Authorization
Then user finds successMessage "<successMessage>"
Then verify account_master table status col where acc_no is "<InternalAccNo>" & flow "<Flow>"
Then user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccType|InternalAccNo|UserAccNo|ProductName|CustName|IntroName|NatureOfAcc|AccopenDate|Category|OperatingInstru|Currency|ATMFacility|SMSFacility|EmailNoti|ChqbkFacility|EmailID|MobileNo|ProdId|AccNo|MiniBaseAmt|MaxBaseAmt|UnitAmt|successMessage|SiFlag|Flow|
|Flexi account Opening SB Self Nature Of Account Authorization|CASA Opening Authorization|Menu_CASAAuthorization|Saving Account|InternalAccountNumSB|UserAccNumSB|Flexi-Saving Account|SAGAR RAM PAWAR|Dinesh|Self|23/02/2020|Senior Citizen|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|170|FlexiAccNumSB|50000|999999999999|10000|Saving Account Authorized Successfully.|N|Auth|
|Flexi account Opening CA Self Nature Of Account Authorization|CASA Opening Authorization|Menu_CASAAuthorization|Current Account|InternalAccountNumCA|UserAccNumCA|Flexi-Current Account|SAGAR RAM PAWAR|Dinesh|Self|23/02/2020|Senior Citizen|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|171|FlexiAccNumCA|50000|999999999999|10000|Current Account Authorized Successfully.|N|Auth|



Scenario Outline: 9. Flexi account Opening Joint Nature Of Account Authorization
Scenario : 9. Flexi account Opening Joint Nature Of Account Authorization
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select account type from dropdown "<AccType>"
And user select unauthorized accounts from drop dowwn "<InternalAccNo>" & "<UserAccNo>"
Then verify ProductName "<ProductName>" CustName "<CustName>" IntroName "<IntroName>" NatureOfAcc "<NatureOfAcc>" AccopenDate "<AccopenDate>"
When user click on Operator Details tab
Then user verify Operator number "<OtherOperatorNum>" & Operator Type "<OperatorType>" & Sign "<Sign>"
When user click on Opening Details Tab
Then verify Category "<Category>" OperatingInstru "<OperatingInstru>" Currency "<Currency>"
When user click on Notification Details Tab
Then verify ATMFacility "<ATMFacility>" SMSFacility "<SMSFacility>" EmailNoti "<EmailNoti>" ChqbkFacility "<ChqbkFacility>" EmailID "<EmailID>" MobileNo "<MobileNo>"
When user click on Flexi Account Details Tab
Then verify ProdId "<ProdId>" ProductName "<ProductName>" NatureOfAcc "<NatureOfAcc>" MiniBaseAmt "<MiniBaseAmt>" MaxBaseAmt "<MaxBaseAmt>" UnitAmt "<UnitAmt>" SiFlag "<SiFlag>" 
And user click on Nominee Details Tab
And user click on Authorize button of CASA Account Authorization
Then user finds successMessage "<successMessage>"
Then verify account_master table status col where acc_no is "<InternalAccNo>" & flow "<Flow>"
Then user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccType|InternalAccNo|UserAccNo|ProductName|CustName|IntroName|NatureOfAcc|AccopenDate|Category|OperatingInstru|Currency|ATMFacility|SMSFacility|EmailNoti|ChqbkFacility|EmailID|MobileNo|ProdId|AccNo|MiniBaseAmt|MaxBaseAmt|UnitAmt|successMessage|OtherOperatorNum|OperatorType|Sign|SiFlag|Flow|
|Flexi account Opening SB Joint Nature Of Account Authorization|CASA Opening Authorization|Menu_CASAAuthorization|Saving Account|InternalAccountNumSBWithOperator|UserAccNumSBWithOperator|Flexi-Saving Account|SAGAR RAM PAWAR|Dinesh|Joint Stock Company|23/02/2020|Senior Citizen|Both Jointly|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|170|FlexiAccNumSBWithOperator|50000|999999999999|10000|Saving Account Authorized Successfully.|0011000000001946|O|Y|N|Auth|
|Flexi account Opening CA Joint Nature Of Account Authorization|CASA Opening Authorization|Menu_CASAAuthorization|Current Account|InternalAccountNumCAWithOperator|UserAccNumCAWithOperator|Flexi-Current Account|SAGAR RAM PAWAR|Dinesh|Joint Stock Company|23/02/2020|Senior Citizen|Both Jointly|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|171|FlexiAccNumSBWithOperator|50000|999999999999|10000|Current Account Authorized Successfully.|0011000000001947|P|N|N|Auth|



Scenario Outline: 10. Flexi account Opening Self Nature Of Account Authorization With SI
Scenario : 10. Flexi account Opening Self Nature Of Account Authorization With SI
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select account type from dropdown "<AccType>"
And user select unauthorized accounts from drop dowwn "<InternalAccNo>" & "<UserAccNo>"
Then verify ProductName "<ProductName>" CustName "<CustName>" IntroName "<IntroName>" NatureOfAcc "<NatureOfAcc>" AccopenDate "<AccopenDate>"
When user click on Opening Details Tab
Then verify Category "<Category>" OperatingInstru "<OperatingInstru>" Currency "<Currency>"
When user click on Notification Details Tab
Then verify ATMFacility "<ATMFacility>" SMSFacility "<SMSFacility>" EmailNoti "<EmailNoti>" ChqbkFacility "<ChqbkFacility>" EmailID "<EmailID>" MobileNo "<MobileNo>"
When user click on Flexi Account Details Tab
Then verify ProdId "<ProdId>" ProductName "<ProductName>" NatureOfAcc "<NatureOfAcc>" MiniBaseAmt "<MiniBaseAmt>" MaxBaseAmt "<MaxBaseAmt>" UnitAmt "<UnitAmt>" SiFlag "<SiFlag>"
When user click on Standing Instruction Tab
Then verify SINum "<SiNum>" DebitAccNo "<DebitAccNo>" CreditAccNo "<CreditAccNo>" Amt "<Amount>" AccType "<AccType>" NatureOfAcc "<NatureOfAcc>" & flow "<Flow>"
And user click on Nominee Details Tab
And user click on Authorize button of CASA Account Authorization
Then user finds successMessage "<successMessage>"
Then verify account_master table status col where acc_no is "<InternalAccNo>" & flow "<Flow>"
Then verify si_master table status where si number is "<SiNum>" of AccType "<AccType>" & NatureOfAcc "<NatureOfAcc>" & flow "<Flow>"
Then user closes testCase
Examples:|
|testCase|MenuName|MenuPath|AccType|InternalAccNo|UserAccNo|ProductName|CustName|IntroName|NatureOfAcc|AccopenDate|Category|OperatingInstru|Currency|ATMFacility|SMSFacility|EmailNoti|ChqbkFacility|EmailID|MobileNo|ProdId|AccNo|MiniBaseAmt|MaxBaseAmt|UnitAmt|successMessage|SiNum|DebitAccNo|CreditAccNo|Amount|SiFlag|Flow|
|Flexi account Opening SB Self Nature Of Account Auth With SI|CASA Opening Authorization|Menu_CASAAuthorization|Saving Account|InternalAccountNumSBWithSI|UserAccNumSBWithSI|Flexi-Saving Account|SAGAR RAM PAWAR|Dinesh|Self|23/02/2020|Senior Citizen|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|170|FlexiAccNumSBWithSI|50000|999999999999|10000|Saving Account Authorized Successfully.|SINum_SB|InternalAccountNumSBWithSI|101210101010000120|1,000.00|Y|Auth|
|Flexi account Opening CA Self Nature Of Account Auth With SI|CASA Opening Authorization|Menu_CASAAuthorization|Current Account|InternalAccountNumCAWithSI|UserAccNumCAWithSI|Flexi-Current Account|SAGAR RAM PAWAR|Dinesh|Self|23/02/2020|Senior Citizen|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|171|FlexiAccNumCAWithSI|50000|999999999999|10000|Current Account Authorized Successfully.|SINum_CA|InternalAccountNumCAWithSI|101210101010000120|2,000.00|Y|Auth|



Scenario Outline: 11. Flexi account Opening Joint Nature Of Account Authorization With SI
Scenario : 11. Flexi account Opening Joint Nature Of Account Authorization With SI
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select account type from dropdown "<AccType>"
And user select unauthorized accounts from drop dowwn "<InternalAccNo>" & "<UserAccNo>"
Then verify ProductName "<ProductName>" CustName "<CustName>" IntroName "<IntroName>" NatureOfAcc "<NatureOfAcc>" AccopenDate "<AccopenDate>"
When user click on Operator Details tab
Then user verify Operator number "<OtherOperatorNum>" & Operator Type "<OperatorType>" & Sign "<Sign>"
When user click on Opening Details Tab
Then verify Category "<Category>" OperatingInstru "<OperatingInstru>" Currency "<Currency>"
When user click on Notification Details Tab
Then verify ATMFacility "<ATMFacility>" SMSFacility "<SMSFacility>" EmailNoti "<EmailNoti>" ChqbkFacility "<ChqbkFacility>" EmailID "<EmailID>" MobileNo "<MobileNo>"
When user click on Flexi Account Details Tab
Then verify ProdId "<ProdId>" ProductName "<ProductName>" NatureOfAcc "<NatureOfAcc>" MiniBaseAmt "<MiniBaseAmt>" MaxBaseAmt "<MaxBaseAmt>" UnitAmt "<UnitAmt>" SiFlag "<SiFlag>"
When user click on Standing Instruction Tab
Then verify SINum "<SiNum>" DebitAccNo "<DebitAccNo>" CreditAccNo "<CreditAccNo>" Amt "<Amount>" AccType "<AccType>" NatureOfAcc "<NatureOfAcc>" & flow "<Flow>"
And user click on Nominee Details Tab
And user click on Authorize button of CASA Account Authorization
Then user finds successMessage "<successMessage>"
Then verify account_master table status col where acc_no is "<InternalAccNo>" & flow "<Flow>"
Then verify si_master table status where si number is "<SiNum>" of AccType "<AccType>" & NatureOfAcc "<NatureOfAcc>" & flow "<Flow>"
Then user closes testCase
Examples:|
|testCase|MenuName|MenuPath|AccType|InternalAccNo|UserAccNo|ProductName|CustName|IntroName|NatureOfAcc|AccopenDate|Category|OperatingInstru|Currency|ATMFacility|SMSFacility|EmailNoti|ChqbkFacility|EmailID|MobileNo|ProdId|AccNo|MiniBaseAmt|MaxBaseAmt|UnitAmt|successMessage|SiNum|DebitAccNo|CreditAccNo|Amount|SiFlag|OtherOperatorNum|OperatorType|Sign|Flow|
|Flexi account Opening SB Joint Nature Of Account Auth With SI|CASA Opening Authorization|Menu_CASAAuthorization|Saving Account|InternalAccountNumSBWithOperatorWithSI|UserAccNumSBWithOperatorWithSI|Flexi-Saving Account|SAGAR RAM PAWAR|Dinesh|Joint Stock Company|23/02/2020|Senior Citizen|Both Jointly|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|170|FlexiAccNumSBWithOperatorWithSI|50000|999999999999|10000|Saving Account Authorized Successfully.|SINum_SBWithOperator|InternalAccountNumSBWithOperatorWithSI|101210101010000121|2,000.00|Y|0011000000001946|O|Y|Auth|
|Flexi account Opening CA Joint Nature Of Account Auth With SI|CASA Opening Authorization|Menu_CASAAuthorization|Current Account|InternalAccountNumCAWithOperatorWithSI|UserAccNumCAWithOperatorWithSI|Flexi-Current Account|SAGAR RAM PAWAR|Dinesh|Joint Stock Company|23/02/2020|Senior Citizen|Both Jointly|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|171|FlexiAccNumCAWithOperatorWithSI|50000|999999999999|10000|Current Account Authorized Successfully.|SINum_CAWithOperator|InternalAccountNumCAWithOperatorWithSI|101210101010000121|2,000.00|Y|0011000000001947|P|N|Auth|



Scenario Outline: 12. Flexi account Opening Authorization With Existing Nominee No
Scenario : 12. Flexi account Opening Authorization With Existing Nominee No
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select account type from dropdown "<AccType>"
And user select unauthorized accounts from drop dowwn "<InternalAccNo>" & "<UserAccNo>"
Then verify ProductName "<ProductName>" CustName "<CustName>" IntroName "<IntroName>" NatureOfAcc "<NatureOfAcc>" AccopenDate "<AccopenDate>"
When user click on Opening Details Tab
Then verify Category "<Category>" OperatingInstru "<OperatingInstru>" Currency "<Currency>"
When user click on Notification Details Tab
Then verify ATMFacility "<ATMFacility>" SMSFacility "<SMSFacility>" EmailNoti "<EmailNoti>" ChqbkFacility "<ChqbkFacility>" EmailID "<EmailID>" MobileNo "<MobileNo>"
When user click on Flexi Account Details Tab
Then verify ProdId "<ProdId>" ProductName "<ProductName>" NatureOfAcc "<NatureOfAcc>" MiniBaseAmt "<MiniBaseAmt>" MaxBaseAmt "<MaxBaseAmt>" UnitAmt "<UnitAmt>" CustAsNominee "<CustAsNominee>" & Flow "<Flow>"
When user click on Standing Instruction Tab
Then verify SINum "<SiNum>" DebitAccNo "<DebitAccNo>" CreditAccNo "<CreditAccNo>" Amt "<Amount>" AccType "<AccType>" CustAsNominee "<CustAsNominee>" & flow "<Flow>"
And user click on Nominee Details Tab
Then verify nomineeCustNumber "<nomineeCustNumber>" CustAsNominee "<CustAsNominee>" NomineeName "<NomineeName>" DOB "<DOB>" Age "<Age>" NomineePhoto "<NomineePhoto>" NomineeReln "<NomineeReln>" NomineeAddrSameAsAccountHolder "<NomineeAddrSameAsAccountHolder>" NomineeAddr "<NomineeAddr>" NomineeMajor "<NomineeMajor>"
And user click on Authorize button of CASA Account Authorization
Then user finds successMessage "<successMessage>"
Then verify account_master table status col where acc_no is "<InternalAccNo>" & flow "<Flow>"
Then verify si_master table status where si number is "<SiNum>" of AccType "<AccType>" & CustAsNominee "<CustAsNominee>" & flow "<Flow>"
Then verify NOMINEE_MASTER table Status "<Status>" and "<NomineeName>" and  Account Number "<InternalAccNo>" and NomineeAsCust "<NomineeAsCust>"
Then user closes testCase
Examples:|
|testCase|MenuName|MenuPath|AccType|InternalAccNo|UserAccNo|ProductName|CustName|IntroName|NatureOfAcc|AccopenDate|Category|OperatingInstru|Currency|ATMFacility|SMSFacility|EmailNoti|ChqbkFacility|EmailID|MobileNo|ProdId|AccNo|MiniBaseAmt|MaxBaseAmt|UnitAmt|successMessage|SiNum|DebitAccNo|CreditAccNo|Amount|SiFlag|CustAsNominee|NomineeName|DOB|Age|NomineePhoto|NomineeReln|NomineeAddrSameAsAccountHolder|NomineeAddr|NomineeMajor|Status|Flow|NomineeAsCust|
|SB Flexi account Opening Authorization With Existing Nominee No|CASA Opening Authorization|Menu_CASAAuthorization|Saving Account|InternalAccountNumSBWithSIExistingNomNo|UserAccNumSBWithSIExistingNomNo|Flexi-Saving Account|SAGAR RAM PAWAR|Dinesh|Self|23/02/2020|Senior Citizen|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|170|FlexiAccNumSBWithSIExistingNomNo|50000|999999999999|10000|Saving Account Authorized Successfully.|ExistingNomNoSINum_SB|InternalAccountNumSBWithSIExistingNomNo|101210101010000120|1,000.00|Y|No|SAGAR RAM PAWAR|08/09/1991|29|No|Father|Yes|Pune|Major|A|Auth|N|
|CA Flexi account Opening Authorization With Existing Nominee No|CASA Opening Authorization|Menu_CASAAuthorization|Current Account|InternalAccountNumCAWithSIExistingNomNo|UserAccNumCAWithSIExistingNomNo|Flexi-Current Account|SAGAR RAM PAWAR|Dinesh|Self|23/02/2020|Senior Citizen|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|171|FlexiAccNumCAWithSIExistingNomNo|50000|999999999999|10000|Current Account Authorized Successfully.|ExistingNomNoSINum_CA|InternalAccountNumCAWithSIExistingNomNo|101210101010000120|2,000.00|Y|No|SAGAR RAM PAWAR|08/09/1991|29|No|Father|Yes|Pune|Major|A|Auth|N|



Scenario Outline: 13. Flexi account Opening Authorization With Existing Nominee Yes
Scenario : 13. Flexi account Opening Authorization With Existing Nominee Yes
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select account type from dropdown "<AccType>"
And user select unauthorized accounts from drop dowwn "<InternalAccNo>" & "<UserAccNo>"
Then verify ProductName "<ProductName>" CustName "<CustName>" IntroName "<IntroName>" NatureOfAcc "<NatureOfAcc>" AccopenDate "<AccopenDate>"
When user click on Opening Details Tab
Then verify Category "<Category>" OperatingInstru "<OperatingInstru>" Currency "<Currency>"
When user click on Notification Details Tab
Then verify ATMFacility "<ATMFacility>" SMSFacility "<SMSFacility>" EmailNoti "<EmailNoti>" ChqbkFacility "<ChqbkFacility>" EmailID "<EmailID>" MobileNo "<MobileNo>"
When user click on Flexi Account Details Tab
Then verify ProdId "<ProdId>" ProductName "<ProductName>" NatureOfAcc "<NatureOfAcc>" MiniBaseAmt "<MiniBaseAmt>" MaxBaseAmt "<MaxBaseAmt>" UnitAmt "<UnitAmt>" CustAsNominee "<CustAsNominee>" & Flow "<Flow>"
When user click on Standing Instruction Tab
Then verify SINum "<SiNum>" DebitAccNo "<DebitAccNo>" CreditAccNo "<CreditAccNo>" Amt "<Amount>" AccType "<AccType>" CustAsNominee "<CustAsNominee>" & flow "<Flow>"
And user click on Nominee Details Tab
Then verify nomineeCustNumber "<nomineeCustNumber>" CustAsNominee "<CustAsNominee>" NomineeName "<NomineeName>" DOB "<DOB>" Age "<Age>" NomineePhoto "<NomineePhoto>" NomineeReln "<NomineeReln>" NomineeAddrSameAsAccountHolder "<NomineeAddrSameAsAccountHolder>" NomineeAddr "<NomineeAddr>" NomineeMajor "<NomineeMajor>"
And user click on Authorize button of CASA Account Authorization
Then user finds successMessage "<successMessage>"
Then verify account_master table status col where acc_no is "<InternalAccNo>" & flow "<Flow>"
Then verify si_master table status where si number is "<SiNum>" of AccType "<AccType>" & CustAsNominee "<CustAsNominee>" & flow "<Flow>"
Then verify NOMINEE_MASTER table Status "<Status>" and "<NomineeName>" and  Account Number "<InternalAccNo>" and NomineeAsCust "<NomineeAsCust>"
Then user closes testCase
Examples:|
|testCase|MenuName|MenuPath|AccType|InternalAccNo|UserAccNo|ProductName|CustName|IntroName|NatureOfAcc|AccopenDate|Category|OperatingInstru|Currency|ATMFacility|SMSFacility|EmailNoti|ChqbkFacility|EmailID|MobileNo|ProdId|AccNo|MiniBaseAmt|MaxBaseAmt|UnitAmt|successMessage|SiNum|DebitAccNo|CreditAccNo|Amount|SiFlag|CustAsNominee|NomineeName|DOB|Age|NomineePhoto|NomineeReln|NomineeAddrSameAsAccountHolder|NomineeAddr|NomineeMajor|Status|nomineeCustNumber|Flow|NomineeAsCust|
|SB Flexi account Opening Authorization With Existing Nominee Yes|CASA Opening Authorization|Menu_CASAAuthorization|Saving Account|InternalAccountNumSBWithSIExistingNomYes|UserAccNumSBWithSIExistingNomYes|Flexi-Saving Account|SAGAR RAM PAWAR|Dinesh|Self|23/02/2020|Senior Citizen|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|170|FlexiAccNumSBWithSIExistingNomYes|50000|999999999999|10000|Saving Account Authorized Successfully.|ExistingNomYesSINum_SB|InternalAccountNumSBWithSIExistingNomYes|101210101010000120|1,000.00|Y|Yes|Automation customer G|12/01/1989|31|No|Father|No|Pitaka,,|Major|A|0011000000001740|Auth|Y|
|CA Flexi account Opening Authorization With Existing Nominee Yes|CASA Opening Authorization|Menu_CASAAuthorization|Current Account|InternalAccountNumCAWithSIExistingNomYes|UserAccNumCAWithSIExistingNomYes|Flexi-Current Account|SAGAR RAM PAWAR|Dinesh|Self|23/02/2020|Senior Citizen|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|171|FlexiAccNumCAWithSIExistingNomYes|50000|999999999999|10000|Current Account Authorized Successfully.|ExistingNomYesSINum_CA|InternalAccountNumCAWithSIExistingNomYes|101210101010000120|2,000.00|Y|Yes|Automation customer G|12/01/1989|31|No|Father|No|Pitaka,,|Major|A|0011000000001740|Auth|Y|



############################################################### Flexi Account Opening Rejection ########################################################################################


Scenario Outline: 14. Flexi account Opening Self Nature Of Account Rejection
Scenario : 14. Flexi account Opening Self Nature Of Account Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select account type from dropdown "<AccType>"
And user select unauthorized accounts from drop dowwn "<InternalAccNo>" & "<UserAccNo>"
Then verify ProductName "<ProductName>" CustName "<CustName>" IntroName "<IntroName>" NatureOfAcc "<NatureOfAcc>" AccopenDate "<AccopenDate>"
When user click on Opening Details Tab
Then verify Category "<Category>" OperatingInstru "<OperatingInstru>" Currency "<Currency>"
When user click on Notification Details Tab
Then verify ATMFacility "<ATMFacility>" SMSFacility "<SMSFacility>" EmailNoti "<EmailNoti>" ChqbkFacility "<ChqbkFacility>" EmailID "<EmailID>" MobileNo "<MobileNo>"
When user click on Flexi Account Details Tab
Then verify ProdId "<ProdId>" ProductName "<ProductName>" NatureOfAcc "<NatureOfAcc>" MiniBaseAmt "<MiniBaseAmt>" MaxBaseAmt "<MaxBaseAmt>" UnitAmt "<UnitAmt>" SiFlag "<SiFlag>" for Rejection
And user click on Nominee Details Tab
And user click on Reject button of CASA Account Authorization
Then user select reject reason type "<ReasonType>" from dropdown
Then user enters reject reason "<Reason>"
And user click on Save button
Then user finds successMessage "<successMessage>"
Then verify account_master table status col where acc_no is "<InternalAccNo>" & flow "<Flow>"
Then user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccType|InternalAccNo|UserAccNo|ProductName|CustName|IntroName|NatureOfAcc|AccopenDate|Category|OperatingInstru|Currency|ATMFacility|SMSFacility|EmailNoti|ChqbkFacility|EmailID|MobileNo|ProdId|AccNo|MiniBaseAmt|MaxBaseAmt|UnitAmt|successMessage|SiFlag|Flow|ReasonType|Reason|
|Flexi account Opening SB Self Nature Of Account Rejection|CASA Opening Authorization|Menu_CASAAuthorization|Saving Account|InternalAccountNumSBRejection|UserAccNumSBRejection|Flexi-Saving Account|SAGAR RAM PAWAR|Dinesh|Self|23/02/2020|Senior Citizen|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|170|FlexiAccNumSBRejection|50000|999999999999|10000|Saving Account Rejected Successfully.|N|Reject| DUPLICATE ACCOUNT |Duplicate|
|Flexi account Opening CA Self Nature Of Account Rejection|CASA Opening Authorization|Menu_CASAAuthorization|Current Account|InternalAccountNumCARejection|UserAccNumCARejection|Flexi-Current Account|SAGAR RAM PAWAR|Dinesh|Self|23/02/2020|Senior Citizen|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|171|FlexiAccNumCARejection|50000|999999999999|10000|Current Account Rejected Successfully.|N|Reject| MISSING ACCOUNT |Missing Account|



Scenario Outline: 15. Flexi account Opening Joint Nature Of Account Rejection
Scenario : 15. Flexi account Opening Joint Nature Of Account Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select account type from dropdown "<AccType>"
And user select unauthorized accounts from drop dowwn "<InternalAccNo>" & "<UserAccNo>"
Then verify ProductName "<ProductName>" CustName "<CustName>" IntroName "<IntroName>" NatureOfAcc "<NatureOfAcc>" AccopenDate "<AccopenDate>"
When user click on Operator Details tab
Then user verify Operator number "<OtherOperatorNum>" & Operator Type "<OperatorType>" & Sign "<Sign>"
When user click on Opening Details Tab
Then verify Category "<Category>" OperatingInstru "<OperatingInstru>" Currency "<Currency>"
When user click on Notification Details Tab
Then verify ATMFacility "<ATMFacility>" SMSFacility "<SMSFacility>" EmailNoti "<EmailNoti>" ChqbkFacility "<ChqbkFacility>" EmailID "<EmailID>" MobileNo "<MobileNo>"
When user click on Flexi Account Details Tab
Then verify ProdId "<ProdId>" ProductName "<ProductName>" NatureOfAcc "<NatureOfAcc>" MiniBaseAmt "<MiniBaseAmt>" MaxBaseAmt "<MaxBaseAmt>" UnitAmt "<UnitAmt>" SiFlag "<SiFlag>" for Rejection
And user click on Nominee Details Tab
And user click on Reject button of CASA Account Authorization
Then user select reject reason type "<ReasonType>" from dropdown
Then user enters reject reason "<Reason>"
And user click on Save button
Then user finds successMessage "<successMessage>"
Then verify account_master table status col where acc_no is "<InternalAccNo>" & flow "<Flow>"
Then user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccType|InternalAccNo|UserAccNo|ProductName|CustName|IntroName|NatureOfAcc|AccopenDate|Category|OperatingInstru|Currency|ATMFacility|SMSFacility|EmailNoti|ChqbkFacility|EmailID|MobileNo|ProdId|AccNo|MiniBaseAmt|MaxBaseAmt|UnitAmt|successMessage|SiFlag|Flow|ReasonType|Reason|OtherOperatorNum|OperatorType|Sign|
|Flexi account Opening SB Joint Nature Of Account Rejection|CASA Opening Authorization|Menu_CASAAuthorization|Saving Account|InternalAccountNumSBWithOperatorRejection|UserAccNumSBWithOperatorRejection|Flexi-Saving Account|SAGAR RAM PAWAR|Dinesh|Joint Stock Company|23/02/2020|Senior Citizen|Both Jointly|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|170|FlexiAccNumSBWithOperatorRejection|50000|999999999999|10000|Saving Account Rejected Successfully.|N|Reject| DUPLICATE ACCOUNT |Duplicate|0011000000001946|O|Y|
|Flexi account Opening CA Joint Nature Of Account Rejection|CASA Opening Authorization|Menu_CASAAuthorization|Current Account|InternalAccountNumCAWithOperatorRejection|UserAccNumCAWithOperatorRejection|Flexi-Current Account|SAGAR RAM PAWAR|Dinesh|Joint Stock Company|23/02/2020|Senior Citizen|Both Jointly|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|171|FlexiAccNumCAWithOperatorRejection|50000|999999999999|10000|Current Account Rejected Successfully.|N|Reject| MISSING ACCOUNT |Missing Account|0011000000001947|P|N|



Scenario Outline: 16. Flexi account Opening Self Nature Of Account Rejection With SI
Scenario : 16. Flexi account Opening Self Nature Of Account Rejection With SI
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select account type from dropdown "<AccType>"
And user select unauthorized accounts from drop dowwn "<InternalAccNo>" & "<UserAccNo>"
Then verify ProductName "<ProductName>" CustName "<CustName>" IntroName "<IntroName>" NatureOfAcc "<NatureOfAcc>" AccopenDate "<AccopenDate>"
When user click on Opening Details Tab
Then verify Category "<Category>" OperatingInstru "<OperatingInstru>" Currency "<Currency>"
When user click on Notification Details Tab
Then verify ATMFacility "<ATMFacility>" SMSFacility "<SMSFacility>" EmailNoti "<EmailNoti>" ChqbkFacility "<ChqbkFacility>" EmailID "<EmailID>" MobileNo "<MobileNo>"
When user click on Flexi Account Details Tab
Then verify ProdId "<ProdId>" ProductName "<ProductName>" NatureOfAcc "<NatureOfAcc>" MiniBaseAmt "<MiniBaseAmt>" MaxBaseAmt "<MaxBaseAmt>" UnitAmt "<UnitAmt>" SiFlag "<SiFlag>" for Rejection
When user click on Standing Instruction Tab
Then verify SINum "<SiNum>" DebitAccNo "<DebitAccNo>" CreditAccNo "<CreditAccNo>" Amt "<Amount>" AccType "<AccType>" NatureOfAcc "<NatureOfAcc>"  & flow "<Flow>"
And user click on Nominee Details Tab
And user click on Reject button of CASA Account Authorization
Then user select reject reason type "<ReasonType>" from dropdown
Then user enters reject reason "<Reason>"
And user click on Save button
Then user finds successMessage "<successMessage>"
Then verify account_master table status col where acc_no is "<InternalAccNo>" & flow "<Flow>"
Then verify si_master table status where si number is "<SiNum>" of AccType "<AccType>" & NatureOfAcc "<NatureOfAcc>" & flow "<Flow>"
Then user closes testCase
Examples:|
|testCase|MenuName|MenuPath|AccType|InternalAccNo|UserAccNo|ProductName|CustName|IntroName|NatureOfAcc|AccopenDate|Category|OperatingInstru|Currency|ATMFacility|SMSFacility|EmailNoti|ChqbkFacility|EmailID|MobileNo|ProdId|AccNo|MiniBaseAmt|MaxBaseAmt|UnitAmt|successMessage|SiNum|DebitAccNo|CreditAccNo|Amount|SiFlag|Flow|ReasonType|Reason|
|SB Flexi Entry Self Nature Of Account Rejection With SI|CASA Opening Authorization|Menu_CASAAuthorization|Saving Account|InternalAccountNumSBWithSIRejection|UserAccNumSBWithSIRejection|Flexi-Saving Account|SAGAR RAM PAWAR|Dinesh|Self|23/02/2020|Senior Citizen|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|170|FlexiAccNumSBWithSIRejection|50000|999999999999|10000|Saving Account Rejected Successfully.|SINum_SBRejection|InternalAccountNumSBWithSIRejection|101210101010000120|1,000.00|Y|Reject| DUPLICATE ACCOUNT |Duplicate|
|CA Flexi Entry Self Nature Of Account Rejection With SI|CASA Opening Authorization|Menu_CASAAuthorization|Current Account|InternalAccountNumCAWithSIRejection|UserAccNumCAWithSIRejection|Flexi-Current Account|SAGAR RAM PAWAR|Dinesh|Self|23/02/2020|Senior Citizen|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|171|FlexiAccNumCAWithSIRejection|50000|999999999999|10000|Current Account Rejected Successfully.|SINum_CARejection|InternalAccountNumCAWithSIRejection|101210101010000120|2,000.00|Y|Reject| MISSING ACCOUNT |Missing Account|



Scenario Outline: 17. Flexi account Opening Joint Nature Of Account Rejection With SI
Scenario : 17. Flexi account Opening Joint Nature Of Account Rejection With SI
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select account type from dropdown "<AccType>"
And user select unauthorized accounts from drop dowwn "<InternalAccNo>" & "<UserAccNo>"
Then verify ProductName "<ProductName>" CustName "<CustName>" IntroName "<IntroName>" NatureOfAcc "<NatureOfAcc>" AccopenDate "<AccopenDate>"
When user click on Operator Details tab
Then user verify Operator number "<OtherOperatorNum>" & Operator Type "<OperatorType>" & Sign "<Sign>"
When user click on Opening Details Tab
Then verify Category "<Category>" OperatingInstru "<OperatingInstru>" Currency "<Currency>"
When user click on Notification Details Tab
Then verify ATMFacility "<ATMFacility>" SMSFacility "<SMSFacility>" EmailNoti "<EmailNoti>" ChqbkFacility "<ChqbkFacility>" EmailID "<EmailID>" MobileNo "<MobileNo>"
When user click on Flexi Account Details Tab
Then verify ProdId "<ProdId>" ProductName "<ProductName>" NatureOfAcc "<NatureOfAcc>" MiniBaseAmt "<MiniBaseAmt>" MaxBaseAmt "<MaxBaseAmt>" UnitAmt "<UnitAmt>" SiFlag "<SiFlag>" for Rejection
When user click on Standing Instruction Tab
Then verify SINum "<SiNum>" DebitAccNo "<DebitAccNo>" CreditAccNo "<CreditAccNo>" Amt "<Amount>" AccType "<AccType>" NatureOfAcc "<NatureOfAcc>"  & flow "<Flow>"
And user click on Nominee Details Tab
And user click on Reject button of CASA Account Authorization
Then user select reject reason type "<ReasonType>" from dropdown
Then user enters reject reason "<Reason>"
And user click on Save button
Then user finds successMessage "<successMessage>"
Then verify account_master table status col where acc_no is "<InternalAccNo>" & flow "<Flow>"
Then verify si_master table status where si number is "<SiNum>" of AccType "<AccType>" & NatureOfAcc "<NatureOfAcc>" & flow "<Flow>"
Then user closes testCase
Examples:|
|testCase|MenuName|MenuPath|AccType|InternalAccNo|UserAccNo|ProductName|CustName|IntroName|NatureOfAcc|AccopenDate|Category|OperatingInstru|Currency|ATMFacility|SMSFacility|EmailNoti|ChqbkFacility|EmailID|MobileNo|ProdId|AccNo|MiniBaseAmt|MaxBaseAmt|UnitAmt|successMessage|SiNum|DebitAccNo|CreditAccNo|Amount|SiFlag|OtherOperatorNum|OperatorType|Sign|Flow|ReasonType|Reason|
|SB Flexi Entry Joint Nature Of Account Rejection With SI|CASA Opening Authorization|Menu_CASAAuthorization|Saving Account|InternalAccountNumSBWithOperatorWithSIRejection|UserAccNumSBWithOperatorWithSIRejection|Flexi-Saving Account|SAGAR RAM PAWAR|Dinesh|Joint Stock Company|23/02/2020|Senior Citizen|Both Jointly|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|170|FlexiAccNumSBWithOperatorWithSIRejection|50000|999999999999|10000|Saving Account Rejected Successfully.|SINum_SBWithOperatorRejection|InternalAccountNumSBWithOperatorWithSIRejection|101210101010000121|2,000.00|Y|0011000000001946|O|Y|Reject| DUPLICATE ACCOUNT |Duplicate|
|CA Flexi Entry Joint Nature Of Account Rejection With SI|CASA Opening Authorization|Menu_CASAAuthorization|Current Account|InternalAccountNumCAWithOperatorWithSIRejection|UserAccNumCAWithOperatorWithSIRejection|Flexi-Current Account|SAGAR RAM PAWAR|Dinesh|Joint Stock Company|23/02/2020|Senior Citizen|Both Jointly|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|171|FlexiAccNumCAWithOperatorWithSIRejection|50000|999999999999|10000|Current Account Rejected Successfully.|SINum_CAWithOperatorRejection|InternalAccountNumCAWithOperatorWithSIRejection|101210101010000121|2,000.00|Y|0011000000001947|P|N|Reject| MISSING ACCOUNT |Missing Account|



Scenario Outline: 18. Flexi account Opening Rejection With Existing Nominee No
Scenario : 18. Flexi account Opening Rejection With Existing Nominee No
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select account type from dropdown "<AccType>"
And user select unauthorized accounts from drop dowwn "<InternalAccNo>" & "<UserAccNo>"
Then verify ProductName "<ProductName>" CustName "<CustName>" IntroName "<IntroName>" NatureOfAcc "<NatureOfAcc>" AccopenDate "<AccopenDate>"
When user click on Opening Details Tab
Then verify Category "<Category>" OperatingInstru "<OperatingInstru>" Currency "<Currency>"
When user click on Notification Details Tab
Then verify ATMFacility "<ATMFacility>" SMSFacility "<SMSFacility>" EmailNoti "<EmailNoti>" ChqbkFacility "<ChqbkFacility>" EmailID "<EmailID>" MobileNo "<MobileNo>"
When user click on Flexi Account Details Tab
Then verify ProdId "<ProdId>" ProductName "<ProductName>" NatureOfAcc "<NatureOfAcc>" MiniBaseAmt "<MiniBaseAmt>" MaxBaseAmt "<MaxBaseAmt>" UnitAmt "<UnitAmt>" CustAsNominee "<CustAsNominee>" & Flow "<Flow>"
When user click on Standing Instruction Tab
Then verify SINum "<SiNum>" DebitAccNo "<DebitAccNo>" CreditAccNo "<CreditAccNo>" Amt "<Amount>" AccType "<AccType>" CustAsNominee "<CustAsNominee>" & flow "<Flow>"
And user click on Nominee Details Tab
Then verify nomineeCustNumber "<nomineeCustNumber>" CustAsNominee "<CustAsNominee>" NomineeName "<NomineeName>" DOB "<DOB>" Age "<Age>" NomineePhoto "<NomineePhoto>" NomineeReln "<NomineeReln>" NomineeAddrSameAsAccountHolder "<NomineeAddrSameAsAccountHolder>" NomineeAddr "<NomineeAddr>" NomineeMajor "<NomineeMajor>"
And user click on Reject button of CASA Account Authorization
Then user select reject reason type "<ReasonType>" from dropdown
Then user enters reject reason "<Reason>"
And user click on Save button
Then user finds successMessage "<successMessage>"
Then verify account_master table status col where acc_no is "<InternalAccNo>" & flow "<Flow>"
Then verify si_master table status where si number is "<SiNum>" of AccType "<AccType>" & CustAsNominee "<CustAsNominee>" & flow "<Flow>"
Then verify NOMINEE_MASTER table Status "<Status>" and "<NomineeName>" and  Account Number "<InternalAccNo>" and NomineeAsCust "<NomineeAsCust>"
Then user closes testCase
Examples:|
|testCase|MenuName|MenuPath|AccType|InternalAccNo|UserAccNo|ProductName|CustName|IntroName|NatureOfAcc|AccopenDate|Category|OperatingInstru|Currency|ATMFacility|SMSFacility|EmailNoti|ChqbkFacility|EmailID|MobileNo|ProdId|AccNo|MiniBaseAmt|MaxBaseAmt|UnitAmt|successMessage|SiNum|DebitAccNo|CreditAccNo|Amount|SiFlag|CustAsNominee|NomineeName|DOB|Age|NomineePhoto|NomineeReln|NomineeAddrSameAsAccountHolder|NomineeAddr|NomineeMajor|Status|Flow|ReasonType|Reason|NomineeAsCust|
|SB Flexi account Opening Rejection With Existing Nominee No|CASA Opening Authorization|Menu_CASAAuthorization|Saving Account|InternalAccountNumSBWithSIExistingNomNoRejection|UserAccNumSBWithSIExistingNomNoRejection|Flexi-Saving Account|SAGAR RAM PAWAR|Dinesh|Self|23/02/2020|Senior Citizen|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|170|FlexiAccNumSBWithSIExistingNomNoRejection|50000|999999999999|10000|Saving Account Rejected Successfully.|ExistingNomNoSINum_SBRejection|InternalAccountNumSBWithSIExistingNomNoRejection|101210101010000120|1,000.00|Y|No|SAGAR RAM PAWAR|08/09/1991|29|No|Father|Yes|Pune|Major|R|Reject| MISSING ACCOUNT |Missing Account|N|
|CA Flexi account Opening Rejection With Existing Nominee No|CASA Opening Authorization|Menu_CASAAuthorization|Current Account|InternalAccountNumCAWithSIExistingNomNoRejection|UserAccNumCAWithSIExistingNomNoRejection|Flexi-Current Account|SAGAR RAM PAWAR|Dinesh|Self|23/02/2020|Senior Citizen|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|171|FlexiAccNumCAWithSIExistingNomNoRejection|50000|999999999999|10000|Current Account Rejected Successfully.|ExistingNomNoSINum_CARejection|InternalAccountNumCAWithSIExistingNomNoRejection|101210101010000120|2,000.00|Y|No|SAGAR RAM PAWAR|08/09/1991|29|No|Father|Yes|Pune|Major|R|Reject| MISSING ACCOUNT |Missing Account|N|



Scenario Outline: 19. Flexi account Opening Rejection With Existing Nominee Yes
Scenario : 19. Flexi account Opening Rejection With Existing Nominee Yes
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select account type from dropdown "<AccType>"
And user select unauthorized accounts from drop dowwn "<InternalAccNo>" & "<UserAccNo>"
Then verify ProductName "<ProductName>" CustName "<CustName>" IntroName "<IntroName>" NatureOfAcc "<NatureOfAcc>" AccopenDate "<AccopenDate>"
When user click on Opening Details Tab
Then verify Category "<Category>" OperatingInstru "<OperatingInstru>" Currency "<Currency>"
When user click on Notification Details Tab
Then verify ATMFacility "<ATMFacility>" SMSFacility "<SMSFacility>" EmailNoti "<EmailNoti>" ChqbkFacility "<ChqbkFacility>" EmailID "<EmailID>" MobileNo "<MobileNo>"
When user click on Flexi Account Details Tab
Then verify ProdId "<ProdId>" ProductName "<ProductName>" NatureOfAcc "<NatureOfAcc>" MiniBaseAmt "<MiniBaseAmt>" MaxBaseAmt "<MaxBaseAmt>" UnitAmt "<UnitAmt>" CustAsNominee "<CustAsNominee>" & Flow "<Flow>"
When user click on Standing Instruction Tab
Then verify SINum "<SiNum>" DebitAccNo "<DebitAccNo>" CreditAccNo "<CreditAccNo>" Amt "<Amount>" AccType "<AccType>" CustAsNominee "<CustAsNominee>" & flow "<Flow>"
And user click on Nominee Details Tab
Then verify nomineeCustNumber "<nomineeCustNumber>" CustAsNominee "<CustAsNominee>" NomineeName "<NomineeName>" DOB "<DOB>" Age "<Age>" NomineePhoto "<NomineePhoto>" NomineeReln "<NomineeReln>" NomineeAddrSameAsAccountHolder "<NomineeAddrSameAsAccountHolder>" NomineeAddr "<NomineeAddr>" NomineeMajor "<NomineeMajor>"
And user click on Reject button of CASA Account Authorization
Then user select reject reason type "<ReasonType>" from dropdown
Then user enters reject reason "<Reason>"
And user click on Save button
Then user finds successMessage "<successMessage>"
Then verify account_master table status col where acc_no is "<InternalAccNo>" & flow "<Flow>"
Then verify si_master table status where si number is "<SiNum>" of AccType "<AccType>" & CustAsNominee "<CustAsNominee>" & flow "<Flow>"
Then verify NOMINEE_MASTER table Status "<Status>" and "<NomineeName>" and  Account Number "<InternalAccNo>" and NomineeAsCust "<NomineeAsCust>"
Then user closes testCase
Examples:|
|testCase|MenuName|MenuPath|AccType|InternalAccNo|UserAccNo|ProductName|CustName|IntroName|NatureOfAcc|AccopenDate|Category|OperatingInstru|Currency|ATMFacility|SMSFacility|EmailNoti|ChqbkFacility|EmailID|MobileNo|ProdId|AccNo|MiniBaseAmt|MaxBaseAmt|UnitAmt|successMessage|SiNum|DebitAccNo|CreditAccNo|Amount|SiFlag|nomineeCustNumber|CustAsNominee|NomineeName|DOB|Age|NomineePhoto|NomineeReln|NomineeAddrSameAsAccountHolder|NomineeAddr|NomineeMajor|Status|Flow|ReasonType|Reason|NomineeAsCust|
|SB Flexi account Opening Rejection With Existing Nominee Yes|CASA Opening Authorization|Menu_CASAAuthorization|Saving Account|InternalAccountNumSBWithSIExistingNomYesRejection|UserAccNumSBWithSIExistingNomYesRejection|Flexi-Saving Account|SAGAR RAM PAWAR|Dinesh|Self|23/02/2020|Senior Citizen|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|170|FlexiAccNumSBWithSIExistingNomYesRejection|50000|999999999999|10000|Saving Account Rejected Successfully.|ExistingNomYesSINum_SBRejection|InternalAccountNumSBWithSIExistingNomYesRejection|101210101010000120|1,000.00|Y|0011000000001740|Yes|Automation customer G|12/01/1989|31|No|Father|Yes|Pitaka,,|Major|R|Reject| MISSING ACCOUNT |Missing Account|Y|
|CA Flexi account Opening Rejection With Existing Nominee Yes|CASA Opening Authorization|Menu_CASAAuthorization|Current Account|InternalAccountNumCAWithSIExistingNomYesRejection|UserAccNumCAWithSIExistingNomYesRejection|Flexi-Current Account|SAGAR RAM PAWAR|Dinesh|Self|23/02/2020|Senior Citizen|Self|INR|Yes|Yes|Yes|Yes|sarika.shingate@sysnik.com|9550436723|171|FlexiAccNumCAWithSIExistingNomYesRejection|50000|999999999999|10000|Current Account Rejected Successfully.|ExistingNomYesSINum_CARejection|InternalAccountNumCAWithSIExistingNomYesRejection|101210101010000120|2,000.00|Y|0011000000001740|Yes|Automation customer G|12/01/1989|31|No|Father|Yes|Pitaka,,|Major|R|Reject| MISSING ACCOUNT |Missing Account|Y|


@FlexiAccount @setUp
Scenario Outline: 20.Flexi Account Screen Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||