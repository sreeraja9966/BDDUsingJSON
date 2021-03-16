@CustModification
Feature: Customer Modification Functionality

@CustModification2 @setUp
Scenario Outline: 1.Customer Modification Screen Setup
Scenario : 1.Customer Modification Screen Setup
Given User creates a parentReport "<parentReport>"
Then setup Customer Modification Screen

Examples:
|parentReport|
|Customer Modification|

############################################################### Individual Customer Modification Entry ########################################################################################

@CustModification1
Scenario Outline: 2. Individual Customer Marital Status Modification Entry 
Scenario : 2.Individual Customer Marital Status Modification Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Customer Modification Screen
Then user click on Personal Details Tab
And user select married marital status from "<MaritalStatus>" dropdown
Then user click on Documents Details Tab
And user click on modify button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify auth_temp table where cust Number "<CustNumber>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|MaritalStatus|successMessage|Status|Flow|
|Individual Customer Marital Status Mod. Entry|Customer Modification|Menu_CustomerModificationEntry|0011000000001714|Married|Successfully Modified the Customer.|M|Entry|
|Individual Cust. Marital Status Mod. Entry For Rejection|Customer Modification|Menu_CustomerModificationEntry|0011000000001721|Married|Successfully Modified the Customer.|M|Entry|



Scenario Outline: 3. Individual Customer Personal Details Modification Entry 
Scenario : 3.Individual Customer Personal Details Modification Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Customer Modification Screen
Then user click on Personal Details Tab
And user enters FirstName "<FirstName>" & MiddleName "<MiddleName>" & LastName "<LastName>" 
Then user verify Customer full Name on Ui 
And user enters FatherFirstName "<FatherFirstName>" & FatherLastName "<FatherLastName>"
Then user verify father full Name on Ui 
Then user click on Documents Details Tab
And user click on modify button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify auth_temp table where cust Number "<CustNumber>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|FirstName|MiddleName|LastName|FatherFirstName|FatherLastName|successMessage|Status|Flow|
|Individual Customer Personal Details Mod. Entry|Customer Modification|Menu_CustomerModificationEntry|0011000000001713|Sahil|Sandesh|Kadam|Sandesh|Kadam|Successfully Modified the Customer.|M|Entry|
|Individual Cust. Personal Details Mod. Entry For Rejection|Customer Modification|Menu_CustomerModificationEntry|0011000000001720|Sahil|Sandesh|Kadam|Sandesh|Kadam|Successfully Modified the Customer.|M|Entry|



Scenario Outline: 4. Individual Customer Pan To Form60 Modification Entry 
Scenario : 4.Individual Customer Pan To Form60 Modification Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Customer Modification Screen
Then user click on Others Details Tab of Entry
And user select Form60/61 and select form 60 
And user select risk grade from dropdown "<RiskGrade>"
Then user click on Documents Details Tab
And user click on modify button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify auth_temp table where cust Number "<CustNumber>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|RiskGrade|successMessage|Status|Flow|
|Individual Customer Pan To Form60 Mod. Entry|Customer Modification|Menu_CustomerModificationEntry|0011000000001712|High|Successfully Modified the Customer.|M|Entry|
|Individual Cust. Pan To Form60 Mod. Entry For Rejection|Customer Modification|Menu_CustomerModificationEntry|0011000000001722|High|Successfully Modified the Customer.|M|Entry|


@CustModification2
Scenario Outline: 5. Individual Customer Residential Status Modification Entry 
Scenario : 5.Individual Customer Residential Status Modification Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Customer Modification Screen
Then user click on Professional Details Tab of Entry
And user select residential status from dropdown "<ResidentialStatus>"
Then user click on Documents Details Tab
And user click on modify button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify auth_temp table where cust Number "<CustNumber>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|ResidentialStatus|successMessage|Status|Flow|
|Individual Customer Residential Status Mod. Entry|Customer Modification|Menu_CustomerModificationEntry|0011000000001715|Person of Indian Origin|Successfully Modified the Customer.|M|Entry|
#|Individual Cust. Residential Status Mod. Entry For Rejection|Customer Modification|Menu_CustomerModificationEntry|0011000000001723|Person of Indian Origin|Successfully Modified the Customer.|M|Entry|



Scenario Outline: 6. Individual Customer TDS Exemption Modification Entry 
Scenario : 6.Individual Customer TDS Exemption Modification Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Customer Modification Screen
Then user click on Others Details Tab of Entry
And user select TDS EXEMPTION Yes or No "<TDSEXEMPTION>"
And user select TDSEXEMPTIONReason from dropdown "<TDSEXEMPTIONReason>"
Then user click on Documents Details Tab
And user click on modify button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify auth_temp table where cust Number "<CustNumber>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|TDSEXEMPTION|TDSEXEMPTIONReason|successMessage|Status|Flow|
|Individual Customer TDS Exemption Modification Entry|Customer Modification|Menu_CustomerModificationEntry|0011000000001716|Yes|Central Government|Successfully Modified the Customer.|M|Entry|
|Individual Cust. TDS Exemption Modification Entry For Rejection|Customer Modification|Menu_CustomerModificationEntry|0011000000001724|Yes|Central Government|Successfully Modified the Customer.|M|Entry|


Scenario Outline: 7. Individual Customer Gross Income Modification Entry 
Scenario : 7.Individual Customer Gross Income Modification Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Customer Modification Screen
Then user click on Professional Details Tab of Entry
And user select Gross Income from dropdown "<GrossIncome>"
Then user click on Documents Details Tab
And user click on modify button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify auth_temp table where cust Number "<CustNumber>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|GrossIncome|successMessage|Status|Flow|
|Individual Customer Gross Income Modification Entry|Customer Modification|Menu_CustomerModificationEntry|0011000000001717|10 To 15 Lakhs|Successfully Modified the Customer.|M|Entry|
|Individual Cust. Gross Income Modification Entry For Rejection|Customer Modification|Menu_CustomerModificationEntry|0011000000001725|10 To 15 Lakhs|Successfully Modified the Customer.|M|Entry|



Scenario Outline: 8. Individual Customer Address Modification Entry 
Scenario : 8.Individual Customer Address Modification Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Customer Modification Screen
Then user click on Address Details Tab
Then user click on Address Details table old data
And user select Address Type from dropdown "<AddressType>"
And user enters line1 address "<Line1Address>"
And user click on update button
Then user click on Documents Details Tab
And user click on modify button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify auth_temp table where cust Number "<CustNumber>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|AddressType|Line1Address|successMessage|Status|Flow|
|Individual Customer Address Modification Entry|Customer Modification|Menu_CustomerModificationEntry|0011000000001718|Registered Office|Om Chambers Bhosari|Successfully Modified the Customer.|M|Entry|
|Individual Cust. Address Modification Entry For Rejection|Customer Modification|Menu_CustomerModificationEntry|0011000000001726|Registered Office|Om Chambers Bhosari|Successfully Modified the Customer.|M|Entry|



Scenario Outline: 9. Individual Customer Contact Modification Entry 
Scenario : 9.Individual Customer Contact Modification Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Customer Modification Screen
Then user click on Contact Details Tab
Then user click on Contact Information table "<Row1>" old data
And user enters updated email value "<EmailValue>"
And user click on update button of email
Then user click on Contact Information table "<Row2>" old data
And user enters updated mobile value "<MobileValue>"
And user click on update button of mobile
Then user click on Documents Details Tab
And user click on modify button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify auth_temp table where cust Number "<CustNumber>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|Row1|EmailValue|Row2|MobileValue|successMessage|Status|Flow|
|Individual Customer Contact Modification Entry|Customer Modification|Menu_CustomerModificationEntry|0011000000001719|1|sarika.shingate@sysnik.com|2|9822567832|Successfully Modified the Customer.|M|Entry|
|Individual Cust. Contact Modification Entry For Rejection|Customer Modification|Menu_CustomerModificationEntry|0011000000001727|1|sarika.shingate@sysnik.com|2|9822567832|Successfully Modified the Customer.|M|Entry|



############################################################ Non-Individual Customer Modification Entry ########################################################################################


Scenario Outline: 10. Non Individual Customer Constitution Modification Entry 
Scenario : 10.Non Individual Customer Constitution Modification Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Customer Modification Screen
Then user click on Orgnization Details Tab
And user select Private Ltd Company Constitution from "<Constitution>" dropdown
Then user click on Documents Details Tab
And user click on modify button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify auth_temp table where cust Number "<CustNumber>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|Constitution|successMessage|Status|Flow|
|Non Individual Customer Constitution Mod. Entry|Customer Modification|Menu_CustomerModificationEntry|0011000000001776|Private Ltd Company|Successfully Modified the Customer.|M|Entry|
|Non Individual Cust. Constitution Mod. Entry For Rejection|Customer Modification|Menu_CustomerModificationEntry|0011000000001783|Private Ltd Company|Successfully Modified the Customer.|M|Entry|


Scenario Outline: 11. Non Individual Customer Other Operators Modification Entry 
Scenario : 11.Non Individual Customer Other Operators Modification Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Customer Modification Screen
Then user click on Operator Details Tab
Then user click on Operator Details Table Data Row1
And user enters other operator number "<OperatorNumber>"
And user select Director operator type from "<OperatorType>" dropdown
And user click on update button of operator
Then user click on Others Details Tab for Non Ind. Customer
And user select TDSEXEMPTIONReason from dropdown "<TDSEXEMPTIONReason>"
Then user click on Documents Details Tab
And user click on modify button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify auth_temp table where cust Number "<CustNumber>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|OperatorNumber|OperatorType|TDSEXEMPTIONReason|successMessage|Status|Flow|
|Non Individual Customer Other Operators Mod. Entry|Customer Modification|Menu_CustomerModificationEntry|0011000000001783|0011000000001777|Director|Central Government|Successfully Modified the Customer.|M|Entry|
|Non Individual Customer Other Operators Mod. Entry For Rejection|Customer Modification|Menu_CustomerModificationEntry|0011000000001784|0011000000001776|Director|Central Government|Successfully Modified the Customer.|M|Entry|



Scenario Outline: 12. Non Individual Customer TDS Exemption Modification Entry 
Scenario : 12.Non Individual Customer TDS Exemption Modification Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Customer Modification Screen
Then user click on Others Details Tab for Non Ind. Customer
And user select TDS EXEMPTION Yes or No "<TDSEXEMPTION>"
And user select TDSEXEMPTIONReason from dropdown "<TDSEXEMPTIONReason>"
Then user click on Documents Details Tab
And user click on modify button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify auth_temp table where cust Number "<CustNumber>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|TDSEXEMPTION|TDSEXEMPTIONReason|successMessage|Status|Flow|
|Non Individual Customer TDS Exemption Mod. Entry|Customer Modification|Menu_CustomerModificationEntry|0011000000001781|Yes|Central Government|Successfully Modified the Customer.|M|Entry|
|Non Individual Cust. TDS Exemption Mod. Entry For Rejection|Customer Modification|Menu_CustomerModificationEntry|0011000000001787|Yes|Central Government|Successfully Modified the Customer.|M|Entry|



Scenario Outline: 13. Non Individual Customer Address Modification Entry 
Scenario : 13.Non Individual Customer Address Modification Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Customer Modification Screen
Then user click on Address Details Tab
Then user click on Address Details table old data
And user select Address Type from dropdown "<AddressType>"
And user enters line1 address "<Line1Address>"
And user select country "<country>" from dropdown
And user enters postal address "<PostalAddress>"
And user click on update button
Then user click on Documents Details Tab
And user click on modify button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify auth_temp table where cust Number "<CustNumber>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|AddressType|Line1Address|country|PostalAddress|successMessage|Status|Flow|
|Non Individual Customer Address Modification Entry|Customer Modification|Menu_CustomerModificationEntry|0011000000001779|Registered Office|Om Chambers Bhosari|India|411027|Successfully Modified the Customer.|M|Entry|
|Non Individual Customer Address Modification Entry For Rejection|Customer Modification|Menu_CustomerModificationEntry|0011000000001785|Registered Office|Om Chambers Bhosari|India|411027|Successfully Modified the Customer.|M|Entry|



Scenario Outline: 14.Non Individual Customer Contact Modification Entry 
Scenario : 14.Non Individual Customer Contact Modification Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters customer number "<CustNumber>" on Customer Modification Screen
Then user click on Contact Details Tab
Then user click on Contact Information table "<Row1>" old data
And user enters updated email value "<EmailValue>"
And user click on update button of email
Then user click on Contact Information table "<Row2>" old data
And user enters updated mobile value "<MobileValue>"
And user click on update button of mobile
Then user click on Documents Details Tab
And user click on modify button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify auth_temp table where cust Number "<CustNumber>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|Row1|EmailValue|Row2|MobileValue|successMessage|Status|Flow|
|Non Individual Customer Contact Modification Entry|Customer Modification|Menu_CustomerModificationEntry|0011000000001780|1|sarika.shingate@sysnik.com|2|9822567832|Successfully Modified the Customer.|M|Entry|
|Non Individual Cust. Contact Modification Entry For Rejection|Customer Modification|Menu_CustomerModificationEntry|0011000000001786|1|sarika.shingate@sysnik.com|2|9822567832|Successfully Modified the Customer.|M|Entry|



############################################################### Individual Customer Modification Entry Auth ########################################################################################

@CustModification1
Scenario Outline: 15.Individual Customer Marital Status Modification Entry Auth
Scenario : 15.Individual Customer Marital Status Modification Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then verify Old "<oldValue>" & New "<Newvalue>" value of marital status on Ui
Then user click on Contact Details Tab
And user click on authorize button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|oldValue|Newvalue|successMessage|Status|Flow|Scenario|
|Individual Customer Marital Status Modification Auth|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001714|Automation customer G|Single|Married|Modified Customer Authorized Successfully.|A|Auth|maritalStatus|



Scenario Outline: 16.Individual Customer Personal Details Modification Entry Auth
Scenario : 16.Individual Customer Personal Details Modification Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Personal Details Tab
Then verify Old "<CustoldValue>" & New "<CustNewvalue>" value of customer & father old name "<FatherOldName>" & father new name "<FatherNewName>" name on Ui
Then user click on Contact Details Tab
And user click on authorize button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|CustoldValue|CustNewvalue|FatherOldName|FatherNewName|successMessage|Status|Flow|Scenario|
|Individual Customer Personal Details Mod. Auth|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001713|Sahil Sandesh Kadam|introducer customer G|Sahil Sandesh Kadam|Gopi Krishna Garlapati|Sandesh Krishna Kadam|Modified Customer Authorized Successfully.|A|Auth|nameChange|


Scenario Outline: 17.Individual Customer Pan To Form60 Modification Entry Auth
Scenario : 17.Individual Customer Pan To Form60 Modification Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Professional Details Tab
Then verify Old "<oldValue>" & New "<Newvalue>" value of PAN & risk Grade "<oldRiskGrade>" & "<newRiskGrade>" on Ui
Then user click on Contact Details Tab
And user click on authorize button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|oldValue|Newvalue|oldRiskGrade|newRiskGrade|successMessage|Status|Flow|Scenario|
|Individual Customer Pan To Form60 Mod. Auth|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001712|g g g|PAN|Form 60/61|Low|High|Modified Customer Authorized Successfully.|A|Auth|form60|


@CustModification2
Scenario Outline: 18.Individual Customer Residential Status Modification Entry Auth
Scenario : 18.Individual Customer Residential Status Modification Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Others Details Tab
Then verify Old "<oldValue>" & New "<Newvalue>" value of residential on Ui
Then user click on Contact Details Tab
And user click on authorize button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|oldValue|Newvalue|successMessage|Status|Flow|Scenario|
|Individual Customer Residential Status Mod. Auth|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001715|Automation customer G|Non Resident Indian|Person of Indian Origin|Modified Customer Authorized Successfully.|A|Auth|residential|



Scenario Outline: 19.Individual Customer TDS Exemption Modification Entry Auth
Scenario : 19.Individual Customer TDS Exemption Modification Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Professional Details Tab
Then verify Old "<oldValue>" & New "<Newvalue>" & Reason "<Reason>" value of TDS on Ui
Then user click on Contact Details Tab
And user click on authorize button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|oldValue|Newvalue|Reason|successMessage|Status|Flow|Scenario|
|Individual Customer TDS Exemption Mod. Auth|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001716|Automation customer G|No|Yes|Central Government|Modified Customer Authorized Successfully.|A|Auth|tds|


Scenario Outline: 20.Individual Customer Gross Income Modification Entry Auth
Scenario : 20.Individual Customer Gross Income Modification Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Others Details Tab
Then verify Old "<oldValue>" & New "<Newvalue>" value of Gross Income on Ui
Then user click on Contact Details Tab
And user click on authorize button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|oldValue|Newvalue|successMessage|Status|Flow|Scenario|
|Individual Customer Gross Income Mod. Auth|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001717|Automation customer G|Below 1 Lakh|10 To 15 Lakhs|Modified Customer Authorized Successfully.|A|Auth|grossIncome|


Scenario Outline: 21.Individual Customer Address Modification Entry Auth
Scenario : 21.Individual Customer Address Modification Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Address Details Tab
Then verify AddressType "<AddressType>" & Line1Address "<Line1Address>" value of Address on Ui
Then user click on Contact Details Tab
And user click on authorize button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|AddressType|Line1Address|successMessage|Status|Flow|Scenario|
|Individual Customer Address Mod. Auth|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001718|Automation customer G|RO|Om Chambers Bhosari,|Modified Customer Authorized Successfully.|A|Auth|address|




Scenario Outline: 22.Individual Customer Contact Modification Entry Auth
Scenario : 22.Individual Customer Contact Modification Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Contact Details Tab
Then verify Email "<Email>" & Mobile "<Mobile>" value of Contact Details on Ui
And user click on authorize button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|Email|Mobile|successMessage|Status|Flow|Scenario|
|Individual Customer Contact Mod. Auth|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001719|Automation customer G|sarika.shingate@sysnik.com|9822567832|Modified Customer Authorized Successfully.|A|Auth|contact|


############################################################ Non-Individual Customer Modification Entry Auth ########################################################################################

Scenario Outline: 23. Non Individual Customer Constitution Modification Entry Auth
Scenario : 23.Non Individual Customer Constitution Modification Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Orgnization Details Tab
Then verify Constitution value "<oldConstitution>" & "<newConstitution>" of Ui
Then user click on Contact Details Tab
And user click on authorize button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|oldConstitution|newConstitution|successMessage|Status|Flow|Scenario|
|Non Individual Customer Constitution Mod. Entry Auth|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001776| Sysnik|Proprietorship|Private Ltd Company|Modified Customer Authorized Successfully.|A|Auth|constitution|



Scenario Outline: 24. Non Individual Customer Other Operators Modification Entry Auth
Scenario : 24.Non Individual Customer Other Operators Modification Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Operator Details Tab
Then verify Operator value "<OperatorNumber>" & "<OperatorName>" on Ui
Then user click on Contact Details Tab
And user click on authorize button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|OperatorNumber|OperatorName|successMessage|Status|Flow|Scenario|
|Non Individual Customer Other Operators Mod. Entry Auth|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001783| Sysnik|0011000000001777|Sysnik|Modified Customer Authorized Successfully.|A|Auth|operator|


Scenario Outline: 25. Non Individual Customer TDS Exemption Modification Entry Auth
Scenario : 25.Non Individual CustomerTDS Exemption Modification Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Others Details Tab for Non Ind. Customer
Then verify Old "<oldValue>" & New "<Newvalue>" & Reason "<Reason>" value of TDS on Ui
Then user click on Contact Details Tab
And user click on authorize button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|oldValue|Newvalue|Reason|successMessage|Status|Flow|Scenario|
|Non Individual Customer TDS Exemption Mod. Entry Auth|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001781| Sysnik|No|Yes|Central Government|Modified Customer Authorized Successfully.|A|Auth|tds|


Scenario Outline: 26. Non Individual Customer Address Modification Entry Auth
Scenario : 26.Non Individual Customer Address Modification Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Address Details Tab
Then verify AddressType "<AddressType>" & AddressDeatils "<AddressDeatils>" & PostalCode "<PostalCode>" value of Address on Ui
Then user click on Contact Details Tab
And user click on authorize button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|AddressType|AddressDeatils|PostalCode|successMessage|Status|Flow|Scenario|
|Non Individual Customer Address Mod. Entry Auth|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001779| Sysnik|RO|Om Chambers Bhosari,Pune,Maharashtra|411027|Modified Customer Authorized Successfully.|A|Auth|address|


Scenario Outline: 27. Non Individual Customer Contact Modification Entry Auth
Scenario : 27.Non Individual Customer Contact Modification Entry Auth
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Contact Details Tab
Then verify Email "<Email>" & Mobile "<Mobile>" value of Contact Details on Ui
Then user click on Contact Details Tab
And user click on authorize button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" & scenario "<Scenario>"
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|Email|Mobile|successMessage|Status|Flow|Scenario|
|Non Individual Customer Contact Mod. Entry Auth|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001780| Sysnik|sarika.shingate@sysnik.com|9822567832|Modified Customer Authorized Successfully.|A|Auth|contact|


############################################################### Individual Customer Modification Entry Rejection ########################################################################################


Scenario Outline: 28.Individual Customer Marital Status Modification Entry Rejection
Scenario : 28.Individual Customer Marital Status Modification Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then verify Old "<oldValue>" & New "<Newvalue>" value of marital status on Ui
Then user click on Contact Details Tab
And user click on reject button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" After Rejection
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|oldValue|Newvalue|successMessage|Status|Flow|
|Individual Customer Marital Status Modification Rejection|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001721|Automation customer G|Single|Married|Modified Customer Rejected Successfully.|A|Rejection|



Scenario Outline: 29.Individual Customer Personal Details Modification Entry Rejection
Scenario : 29.Individual Customer Personal Details Modification Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Personal Details Tab
Then verify Old "<CustoldValue>" & New "<CustNewvalue>" value of customer & father old name "<FatherOldName>" & father new name "<FatherNewName>" name on Ui
Then user click on Contact Details Tab
And user click on reject button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" After Rejection
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|CustoldValue|CustNewvalue|FatherOldName|FatherNewName|successMessage|Status|Flow|
|Individual Customer Personal Details Mod. Rejection|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001720|Sahil Sandesh Kadam|Automation customer G|Sahil Sandesh Kadam|Gopi Krishna Garlapati|Sandesh Krishna Kadam|Modified Customer Rejected Successfully.|A|Rejection|


Scenario Outline: 30.Individual Customer Pan To Form60 Modification Entry Rejection
Scenario : 30.Individual Customer Pan To Form60 Modification Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Professional Details Tab
Then verify Old "<oldValue>" & New "<Newvalue>" value of PAN & risk Grade "<oldRiskGrade>" & "<newRiskGrade>" on Ui
Then user click on Contact Details Tab
And user click on reject button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" After Rejection
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|oldValue|Newvalue|oldRiskGrade|newRiskGrade|successMessage|Status|Flow|
|Individual Customer Pan To Form60 Mod. Rejection|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001722|Automation customer G|PAN|Form 60/61|Low|High|Modified Customer Rejected Successfully.|A|Rejection|



Scenario Outline: 31.Individual Customer Residential Status Modification Entry Rejection
Scenario : 31.Individual Customer Residential Status Modification Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Others Details Tab
Then verify Old "<oldValue>" & New "<Newvalue>" value of residential on Ui
Then user click on Contact Details Tab
And user click on reject button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" After Rejection
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|oldValue|Newvalue|successMessage|Status|Flow|
|Individual Customer Residential Status Mod. Rejection|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001723|Automation customer G|Non Resident Indian|Person of Indian Origin|Modified Customer Rejected Successfully.|A|Rejection|



Scenario Outline: 32.Individual Customer TDS Exemption Modification Entry Rejection
Scenario : 32.Individual Customer TDS Exemption Modification Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Professional Details Tab
Then verify Old "<oldValue>" & New "<Newvalue>" & Reason "<Reason>" value of TDS on Ui
Then user click on Contact Details Tab
And user click on reject button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" After Rejection
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|oldValue|Newvalue|Reason|successMessage|Status|Flow|
|Individual Customer TDS Exemption Mod. Rejection|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001724|Automation customer G|No|Yes|Central Government|Modified Customer Rejected Successfully.|A|Rejection|


Scenario Outline: 33.Individual Customer Gross Income Modification Entry Rejection
Scenario : 33.Individual Customer Gross Income Modification Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Others Details Tab
Then verify Old "<oldValue>" & New "<Newvalue>" value of Gross Income on Ui
Then user click on Contact Details Tab
And user click on reject button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" After Rejection
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|oldValue|Newvalue|successMessage|Status|Flow|
|Individual Customer Gross Income Mod. Rejection|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001725|Automation customer G|Below 1 Lakh|10 To 15 Lakhs|Modified Customer Rejected Successfully.|A|Rejection|


Scenario Outline: 34.Individual Customer Address Modification Entry Rejection
Scenario : 34.Individual Customer Address Modification Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Address Details Tab
Then verify AddressType "<AddressType>" & Line1Address "<Line1Address>" value of Address on Ui
Then user click on Contact Details Tab
And user click on reject button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" After Rejection
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|AddressType|Line1Address|successMessage|Status|Flow|
|Individual Customer Address Mod. Rejection|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001726|Automation customer G|RO|Om Chambers Bhosari,|Modified Customer Rejected Successfully.|A|Rejection|




Scenario Outline: 35.Individual Customer Contact Modification Entry Rejection
Scenario : 35.Individual Customer Contact Modification Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Contact Details Tab
Then verify Email "<Email>" & Mobile "<Mobile>" value of Contact Details on Ui
And user click on reject button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" After Rejection
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|Email|Mobile|successMessage|Status|Flow|
|Individual Customer Contact Mod. Rejection|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001727|Automation customer G|sarika.shingate@sysnik.com|9822567832|Modified Customer Rejected Successfully.|A|Rejection|



############################################################### Non Individual Customer Modification Entry Rejection ########################################################################################


Scenario Outline: 36. Non Individual Customer Constitution Modification Entry Rejection
Scenario : 36.Non Individual Customer Constitution Modification Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Orgnization Details Tab
Then verify Constitution value "<oldConstitution>" & "<newConstitution>" of Ui
Then user click on Contact Details Tab
And user click on reject button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" After Rejection
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|oldConstitution|newConstitution|successMessage|Status|Flow|
|Non Individual Customer Constitution Mod. Entry Rejection|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001783| Sysnik|Proprietorship|Private Ltd Company|Modified Customer Rejected Successfully.|A|Rejection|



Scenario Outline: 37. Non Individual Customer Other Operators Modification Entry Rejection
Scenario : 37.Non Individual Customer Other Operators Modification Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Operator Details Tab
Then verify Operator value "<OperatorNumber>" & "<OperatorName>" on Ui
Then user click on Contact Details Tab
And user click on reject button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" After Rejection
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|OperatorNumber|OperatorName|successMessage|Status|Flow|
|Non Individual Customer Other Operators Mod. Entry Rejection|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001784| Sysnik|0011000000001776 |Sysnik|Modified Customer Rejected Successfully.|A|Rejection|



Scenario Outline: 38. Non Individual Customer TDS Exemption Modification Entry Rejection
Scenario : 38.Non Individual CustomerTDS Exemption Modification Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Others Details Tab for Non Ind. Customer
Then verify Old "<oldValue>" & New "<Newvalue>" & Reason "<Reason>" value of TDS on Ui
Then user click on Contact Details Tab
And user click on reject button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" After Rejection
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|oldValue|Newvalue|Reason|successMessage|Status|Flow|
|Non Individual Customer TDS Exemption Mod. Entry Rejection|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001787| Sysnik|No|Yes|Central Government|Modified Customer Rejected Successfully.|A|Rejection|



Scenario Outline: 39. Non Individual Customer Address Modification Entry Rejection
Scenario : 39.Non Individual Customer Address Modification Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Address Details Tab
Then verify AddressType "<AddressType>" & AddressDeatils "<AddressDeatils>" & PostalCode "<PostalCode>" value of Address on Ui
Then user click on Contact Details Tab
And user click on reject button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" After Rejection
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|AddressType|AddressDeatils|PostalCode|successMessage|Status|Flow|
|Non Individual Customer Address Mod. Entry Rejection|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001785| Sysnik|RO|Om Chambers Bhosari,Pune,Maharashtra|411027|Modified Customer Rejected Successfully.|A|Rejection|



Scenario Outline: 40. Non Individual Customer Contact Modification Entry Rejection
Scenario : 40.Non Individual Customer Contact Modification Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user select customer number "<CustNumber>" & "<CustName>" from dropdown on Customer Modification Auth Screen
Then user click on Contact Details Tab
Then verify Email "<Email>" & Mobile "<Mobile>" value of Contact Details on Ui
Then user click on Contact Details Tab
And user click on reject button
Then user finds successMessage "<successMessage>"
Then verify cust_master table status "<Status>" & cust Number "<CustNumber>" & flow "<Flow>" After Rejection
Then verify modification_audit_log table where cust Number "<CustNumber>" & flow "<Flow>"

Examples:
|testCase|MenuName|MenuPath|CustNumber|CustName|Email|Mobile|successMessage|Status|Flow|
|Non Individual Customer Contact Mod. Entry Rejection|Customer Modification|Menu_CustomerModificationEntryAuth|0011000000001786| Sysnik|sarika.shingate@sysnik.com|9822567832|Modified Customer Rejected Successfully.|A|Rejection|






