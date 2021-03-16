@DisbSchedule
Feature: Loan Disbursement Schedule Functionality

@DisbSchedule @setUp
Scenario Outline: 1.Loan Disbursement Schedule Screen Setup
Scenario : 1.Loan Disbursement Schedule Screen Setup
Given User creates a parentReport "<parentReport>"
Then setup Loan Disbursement Schedule Screen

Examples:
|parentReport|
|Loan Disbursement Schedule|

############################################################### Loan Disbursement Schedule Entry ########################################################################################

@DisbSchedule 
Scenario Outline: 2.Loan Disbursement Schedule Entry 
Scenario : 2.Loan Disbursement Schedule Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters accNo "<accNo>" on Loan Disbursement Schedule Screen
Then user verify Sanctioned Amount "<SanctionedAmount>" and DisbursedAmount "<DisbursedAmount>"
And user enters Disbursement Date1 "<DisbursementDate1>"
And user enters Disbursement Amount1 "<DisbursementAmount1>"
And user enter remark1 "<Remark1>"
And user click on Add Record button of Loan Disbursement Schedule screen
And user enters Disbursement Date2 "<DisbursementDate2>"
And user enters Disbursement Amount2 "<DisbursementAmount2>"
And user enter remark2 "<Remark2>"
And user click on Add Record button of Loan Disbursement Schedule screen
And user enters Disbursement Date3 "<DisbursementDate3>"
And user enters Disbursement Amount3 "<DisbursementAmount3>"
And user enter remark3 "<Remark3>"
And user click on Add Record button of Loan Disbursement Schedule screen
And user click on submit button of Loan Disbursement Schedule screen
Then user finds successMessage "<successMessage>"
Then verify LOAN_DISB_SCHEDULE table where accNo "<accNo>" and DisbursementDate1 "<DisbursementDate1>" and DisbursementAmount1 "<DisbursementAmount1>" and remark1 "<Remark1>"  and DisbursementDate2 "<DisbursementDate2>" and DisbursementAmount2 "<DisbursementAmount2>" and remark2 "<Remark2>" and DisbursementDate3 "<DisbursementDate3>" and DisbursementAmount3 "<DisbursementAmount3>" and remark3 "<Remark3>"  
And user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|SanctionedAmount|DisbursedAmount|DisbursementDate1|DisbursementAmount1|Remark1|DisbursementDate2|DisbursementAmount2|Remark2|DisbursementDate3|DisbursementAmount3|Remark3|successMessage|
|Loan Disbursement Schedule Entry with AW Int Post Type|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104000000027|5,00,000.00|0|23/02/2020|50000|First|28/02/2020|80000|Second|10/03/2020|60000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry with CP Int Post Type|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104100000211|50,000.00|0|23/02/2020|5000|First|25/02/2020|9000|Second|10/03/2020|6000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry with RI Int Post Type|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104200000037|6,00,000.00|0|23/02/2020|20000|First|28/02/2020|8000|Second|20/03/2020|60000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry with RC Int Post Type|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210105910000118|10,00,000.00|0|24/02/2020|50000|First|05/03/2020|300000|Second|08/03/2020|400000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry with CL Int Post Type|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210105920000182|4,00,000.00|0|23/02/2020|100000|First|26/02/2020|200000|Second|15/03/2020|50000|Third|Successfully Added Loan Disbursement Schedule.|
|Disbursement Amount Greater Than Sanctioned Amount|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210105920000183|4,00,000.00|0|23/02/2020|300000|First|26/02/2020|20000|Second|15/03/2020|90000|Third|Total disbursement amount should be less than or equal to sanctioned amount.|

|Loan Disbursement Schedule Entry of AW for Rejection|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104000000029|5,00,000.00|0|23/02/2020|50000|First|28/02/2020|80000|Second|10/03/2020|60000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry of CP for Rejection|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104100000212|50,000.00|0|23/02/2020|5000|First|25/02/2020|9000|Second|10/03/2020|6000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry of RI for Rejection|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104200000038|6,00,000.00|0|23/02/2020|20000|First|28/02/2020|8000|Second|20/03/2020|60000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry of RC for Rejection|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210105910000119|10,00,000.00|0|24/02/2020|50000|First|05/03/2020|300000|Second|08/03/2020|400000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry of CL for Rejection|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210105920000184|4,00,000.00|0|23/02/2020|100000|First|26/02/2020|200000|Second|15/03/2020|50000|Third|Successfully Added Loan Disbursement Schedule.|

|Loan Disbursement Schedule Entry of AW for Modification|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104000000030|5,00,000.00|0|23/02/2020|50000|First|28/02/2020|80000|Second|10/03/2020|60000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry of CP for Modification|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104100000213|50,000.00|0|23/02/2020|5000|First|25/02/2020|9000|Second|10/03/2020|6000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry of RI for Modification|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104200000039|6,00,000.00|0|23/02/2020|20000|First|28/02/2020|8000|Second|20/03/2020|60000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry of RC for Modification|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210105910000120|10,00,000.00|0|24/02/2020|50000|First|05/03/2020|300000|Second|08/03/2020|400000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry of CL for Modification|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210105920000185|4,00,000.00|0|23/02/2020|100000|First|26/02/2020|200000|Second|15/03/2020|50000|Third|Successfully Added Loan Disbursement Schedule.|

|Loan Disbursement Schedule Entry of AW for Mod Rejection|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104000000031|5,00,000.00|0|23/02/2020|50000|First|28/02/2020|80000|Second|10/03/2020|60000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry of CP for Mod Rejection|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104100000214|50,000.00|0|23/02/2020|5000|First|25/02/2020|9000|Second|10/03/2020|6000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry of RI for Mod Rejection|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104200000040|6,00,000.00|0|23/02/2020|20000|First|28/02/2020|8000|Second|20/03/2020|60000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry of RC for Mod Rejection|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210105910000121|10,00,000.00|0|24/02/2020|50000|First|05/03/2020|300000|Second|08/03/2020|400000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry of CL for Mod Rejection|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210105920000186|4,00,000.00|0|23/02/2020|100000|First|26/02/2020|200000|Second|15/03/2020|50000|Third|Successfully Added Loan Disbursement Schedule.|

|Loan Disb. Schedule Entry of AW for Mod Rejection|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104000000032|5,00,000.00|0|23/02/2020|50000|First|28/02/2020|80000|Second|10/03/2020|60000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disb. Schedule Entry of CP for Mod Rejection|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104100000215|50,000.00|0|23/02/2020|5000|First|25/02/2020|9000|Second|10/03/2020|6000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disb. Schedule Entry of RI for Mod Rejection|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104200000041|6,00,000.00|0|23/02/2020|20000|First|28/02/2020|8000|Second|20/03/2020|60000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disb. Schedule Entry of RC for Mod Rejection|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210105910000122|10,00,000.00|0|24/02/2020|50000|First|05/03/2020|300000|Second|08/03/2020|400000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disb. Schedule Entry of CL for Mod Rejection|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210105920000187|4,00,000.00|0|23/02/2020|100000|First|26/02/2020|200000|Second|15/03/2020|50000|Third|Successfully Added Loan Disbursement Schedule.|

|Loan Disbursement Schedule Entry Transfer Mode with AW Int Post Type|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104000000064|5,00,000.00|0|23/02/2020|50000|First|28/02/2020|80000|Second|10/03/2020|60000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry Transfer Mode with CP Int Post Type|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104100000253|50,000.00|0|23/02/2020|5000|First|25/02/2020|9000|Second|10/03/2020|6000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry Transfer Mode with RI Int Post Type|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104200000075|6,00,000.00|0|23/02/2020|20000|First|28/02/2020|8000|Second|20/03/2020|60000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry Transfer Mode with RC Int Post Type|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210105910000152|10,00,000.00|0|24/02/2020|50000|First|05/03/2020|300000|Second|08/03/2020|400000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry Transfer Mode with CL Int Post Type|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210105920000215|4,00,000.00|0|23/02/2020|100000|First|26/02/2020|200000|Second|15/03/2020|50000|Third|Successfully Added Loan Disbursement Schedule.|

|Loan Disbursement Schedule Entry Reject Transfer Mode with AW Int Post Type|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104000000063|5,00,000.00|0|23/02/2020|50000|First|28/02/2020|80000|Second|10/03/2020|60000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry Reject Transfer Mode with CP Int Post Type|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104100000250|50,000.00|0|23/02/2020|5000|First|25/02/2020|9000|Second|10/03/2020|6000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry Reject Transfer Mode with RI Int Post Type|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104200000074|6,00,000.00|0|23/02/2020|20000|First|28/02/2020|8000|Second|20/03/2020|60000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry Reject Transfer Mode with RC Int Post Type|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210105910000151|10,00,000.00|0|24/02/2020|50000|First|05/03/2020|300000|Second|08/03/2020|400000|Third|Successfully Added Loan Disbursement Schedule.|
|Loan Disbursement Schedule Entry Reject Transfer Mode with CL Int Post Type|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210105920000216|4,00,000.00|0|23/02/2020|100000|First|26/02/2020|200000|Second|15/03/2020|50000|Third|Successfully Added Loan Disbursement Schedule.|


Scenario Outline: 3.Loan Disbursement Schedule Entry
Scenario : 3.Loan Disbursement Schedule Entry with Negative Scenario 1
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters accNo "<accNo>" on Loan Disbursement Schedule Screen 
Then verify validation Message of Date "<xpath>" and "<ValidationMessage>"  
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|xpath|ValidationMessage|
|Duplicate Loan Disbursement Schedule Entry|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104000000027|//span[@id='accNumberdisbusrsementScheduleEntry_ExceptionMsg']|Disbursement schedule is already created for given account.|



Scenario Outline: 4.Loan Disbursement Schedule Entry
Scenario : 4.Loan Disbursement Schedule Entry with Negative Scenario 2
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters accNo "<accNo>" on Loan Disbursement Schedule Screen
And user enters Disbursement Date1 "<DisbursementDate1>"
And user enters Disbursement Amount1 "<DisbursementAmount1>"
Then verify validation Message of Date "<xpath>" and "<ValidationMessage>"  
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|xpath|ValidationMessage|DisbursementDate1|DisbursementAmount1|
|Invalid Disbursement Amount|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210105920000183|//span[@id='disbursementAmtdisbusrsementScheduleEntry2_ExceptionMsg']|Invalid Disbursement Amount|23/02/2020|500000|



Scenario Outline: 5.Loan Disbursement Schedule Entry
Scenario : 5.Loan Disbursement Schedule Entry with Negative Scenario 3
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters accNo "<accNo>" on Loan Disbursement Schedule Screen
And user enters Disbursement Date1 "<DisbursementDate1>"
And user enters Disbursement Amount1 "<DisbursementAmount1>"
And user enter remark1 "<Remark1>"
And user click on Add Record button of Loan Disbursement Schedule screen
And user click on submit button of Loan Disbursement Schedule screen
Then user finds validationMessage"<ValidationMessage>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|Remark1|ValidationMessage|DisbursementDate1|DisbursementAmount1|
|Invalid Disbursement Date|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210105920000183|First|Invalid disbursement date.|20/02/2020|5000|



Scenario Outline: 6.Loan Disbursement Schedule Entry
Scenario : 6.Loan Disbursement Schedule Entry with Negative Scenario 4
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters accNo "<accNo>" on Loan Disbursement Schedule Screen
Then verify validation Message of Date "<xpath>" and "<ValidationMessage>"  
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|xpath|ValidationMessage|
|Invalid Status of Account Number|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210104000000028|//span[@id='accNumberdisbusrsementScheduleEntry_ExceptionMsg']|Account is closed.|



Scenario Outline: 7.Loan Disbursement Schedule Entry
Scenario : 7.Loan Disbursement Schedule Entry with CC Account Negative Scenario 4
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters accNo "<accNo>" on Loan Disbursement Schedule Screen
Then verify validation Message of Date "<xpath>" and "<ValidationMessage>"  
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|xpath|ValidationMessage|
|Invalid Product Type of Account Number|Loan Disbursement Schedule Entry|Menu_LoanDisbursementScheduleEntry|101210102000000417|//span[@id='accNumberdisbusrsementScheduleEntry_ExceptionMsg']|Invalid Product.|


############################################################### Loan Disbursement Schedule Auth ########################################################################################

@DisbSchedule 
Scenario Outline: 8.Loan Disbursement Schedule Entry Authorization
Scenario : 8.Loan Disbursement Schedule Entry Authorization
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select Account Number "<accNo>" on Loan Disbursement Schedule Auth Screen
Then user verify Sanctioned Amount "<SanctionedAmount>" and DisbursedAmount "<DisbursedAmount>"
Then user verify Disbursement Details of Ui "<accNo>" and "<xpath>"
And user click on auhtorizeButton
Then user finds successMessage "<successMessage>" 
Then verify LOAN_DISB_SCHEDULE table where accNo "<accNo>" and flag "<flag>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|SanctionedAmount|DisbursedAmount|xpath|successMessage|flag|
|Loan Disbursement Schedule Entry Auth of AW|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210104000000027|5,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|
|Loan Disbursement Schedule Entry Auth of CP|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210104100000211|50,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|
|Loan Disbursement Schedule Entry Auth of RI|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210104200000037|6,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|
|Loan Disbursement Schedule Entry Auth of RC|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210105910000118|10,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|
|Loan Disbursement Schedule Entry Auth of CL|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210105920000182|4,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|


|Loan Disbursement Schedule Entry Auth of AW|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210104000000032|5,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|
|Loan Disbursement Schedule Entry Auth of CP|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210104100000215|50,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|
|Loan Disbursement Schedule Entry Auth of RI|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210104200000041|6,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|
|Loan Disbursement Schedule Entry Auth of RC|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210105910000122|10,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|
|Loan Disbursement Schedule Entry Auth of CL|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210105920000187|4,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|

|Loan Disbursement Schedule Entry Transfer Auth of AW|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210104000000064|5,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|
|Loan Disbursement Schedule Entry Transfer Auth of CP|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210104100000253|50,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|
|Loan Disbursement Schedule Entry Transfer Auth of RI|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210104200000075|6,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|
|Loan Disbursement Schedule Entry  TransferAuth of RC|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210105910000152|10,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|
|Loan Disbursement Schedule Entry Transfer Auth of CL|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210105920000215|4,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|

|Loan Disbursement Schedule Reject Entry Transfer Auth of AW|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210104000000063|5,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|
|Loan Disbursement Schedule Reject Entry Transfer Auth of CP|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210104100000250|50,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|
|Loan Disbursement Schedule Reject Entry Transfer Auth of RI|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210104200000074|6,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|
|Loan Disbursement Schedule Reject Entry Transfer Auth of RC|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210105910000151|10,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|
|Loan Disbursement Schedule Reject Entry Transfer Auth of CL|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210105920000216|4,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Authorized.|Auth|

############################################################### Loan Disbursement Schedule Reject ########################################################################################


Scenario Outline: 9.Loan Disbursement Schedule Entry Rejection
Scenario : 9.Loan Disbursement Schedule Entry Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select Account Number "<accNo>" on Loan Disbursement Schedule Auth Screen
Then user verify Sanctioned Amount "<SanctionedAmount>" and DisbursedAmount "<DisbursedAmount>"
Then user verify Disbursement Details of Ui "<accNo>" and "<xpath>"
And user click on rejectButton
Then user finds successMessage "<successMessage>" 
Then verify LOAN_DISB_SCHEDULE table where accNo "<accNo>" and flag "<flag>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|SanctionedAmount|DisbursedAmount|xpath|successMessage|flag|
|Loan Disbursement Schedule Entry Rejection of AW|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210104000000029|5,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Rejected.|Reject|
|Loan Disbursement Schedule Entry Rejection of CP|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210104100000212|50,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Rejected.|Reject|
|Loan Disbursement Schedule Entry Rejection of RI|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210104200000038|6,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Rejected.|Reject|
|Loan Disbursement Schedule Entry Rejection of RC|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210105910000119|10,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Rejected.|Reject|
|Loan Disbursement Schedule Entry Rejection of CL|Loan Disbursement Schedule Auth|Menu_LoanDisbursementScheduleEntryAuth|101210105920000184|4,00,000.00|0|//div[@id='lstDisbursementSchedule']|Disbursement Schedule Successfully Rejected.|Reject|


###################################################################### Loan Disbursement Schedule Modification Entry ##########################################################################################################################################################################################################################################


Scenario Outline: 10.Loan Disbursement Schedule Modification Entry
Scenario : 10.Loan Disbursement Schedule Entry
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user enters accNo "<accNo>" on Loan Disbursement Schedule Screen
Then user verify Sanctioned Amount "<SanctionedAmount>" and DisbursedAmount "<DisbursedAmount>"
And user click on table record "<DisbDateXpath>"
And user enters Disbursement Date1 "<DisbursementDate1>"
And user enters Disbursement Amount1 "<DisbursementAmount1>"
And user click on Update button of Loan Disbursement Schedule Modification screen
And user click on submit button of Loan Disbursement Schedule screen
Then user finds successMessage "<successMessage>"
Then verify LOAN_DISB_SCHEDULE table after modification where accNo "<accNo>" and remark1 "<Remark1>"  and remark2 "<Remark2>" and remark3 "<Remark3>"

Examples:
|testCase|MenuName|MenuPath|accNo|SanctionedAmount|DisbursedAmount|DisbDateXpath|DisbursementDate1|DisbursementAmount1|Remark1|Remark2|Remark3|successMessage|
|Loan Disbursement Schedule Authorized Entry of AW Disb. Date & Amount Modification|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210104000000027|5,00,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|26/02/2020|400000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|
|Loan Disbursement Schedule Authorized Entry of CP Disb. Date & Amount Modification|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210104100000211|50,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|28/02/2020|30000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|
|Loan Disbursement Schedule Authorized Entry of RI Disb. Date & Amount Modification|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210104200000037|6,00,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|03/03/2020|60000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|
|Loan Disbursement Schedule Authorized Entry of RC Disb. Date & Amount Modification|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210105910000118|10,00,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|24/02/2020|100000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|
|Loan Disbursement Schedule Authorized Entry of CL Disb. Date & Amount Modification|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210105920000182|4,00,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|25/02/2020|80000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|

|Loan Disbursement Schedule Entry of AW Disb. Date & Amount Modification|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210104000000030|5,00,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|24/02/2020|300000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|
|Loan Disbursement Schedule Entry of CP Disb. Date & Amount Modification|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210104100000213|50,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|26/02/2020|10000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|
|Loan Disbursement Schedule Entry of RI Disb. Date & Amount Modification|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210104200000039|6,00,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|06/03/2020|70000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|
|Loan Disbursement Schedule Entry of RC Disb. Date & Amount Modification|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210105910000120|10,00,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|28/02/2020|400000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|
|Loan Disbursement Schedule Entry of CL Disb. Date & Amount Modification|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210105920000185|4,00,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|25/02/2020|200000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|


|Loan Disbursement Schedule Mod Entry of AW Disb. Date & Amoun|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210104000000031|5,00,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|24/02/2020|300000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|
|Loan Disbursement Schedule Mod Entry of CP Disb. Date & Amount|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210104100000214|50,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|26/02/2020|10000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|
|Loan Disbursement Schedule Mod Entry of RI Disb. Date & Amount|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210104200000040|6,00,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|06/03/2020|70000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|
|Loan Disbursement Schedule Mod Entry of RC Disb. Date & Amount|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210105910000121|10,00,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|28/02/2020|400000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|
|Loan Disbursement Schedule Mod Entry of CL Disb. Date & Amount|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210105920000186|4,00,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|25/02/2020|200000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|

|Loan Disb. Schedule Mod Entry of AW Disb. Date & Amoun|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210104000000032|5,00,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|25/02/2020|300000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|
|Loan Disb. Schedule Mod Entry of CP Disb. Date & Amount|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210104100000215|50,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|26/02/2020|10000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|
|Loan Disb. Schedule Mod Entry of RI Disb. Date & Amount|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210104200000041|6,00,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|06/03/2020|70000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|
|Loan Disb. Schedule Mod Entry of RC Disb. Date & Amount|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210105910000122|10,00,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|28/02/2020|400000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|
|Loan Disb. Schedule Mod Entry of CL Disb. Date & Amount|Loan Disbursement Schedule Modification|Menu_LoanDisbursementScheduleModEntry|101210105920000187|4,00,000.00|0|//div[@id='disbursementSchedule']//tr[1]//td[1]|27/02/2020|200000|First|Second|Third|Successfully Modified Disbursement Schedule Entry.|


###################################################################### Loan Disbursement Schedule Modification Auth ################################################################################################################################################################################################################################


Scenario Outline: 11.Loan Disbursement Schedule Modification Authorization
Scenario : 11.Loan Disbursement Schedule Modification Authorization
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select Account Number "<accNo>" on Loan Disbursement Schedule Auth Screen
Then user verify Sanctioned Amount "<SanctionedAmount>" and DisbursedAmount "<DisbursedAmount>" on mod auth screen
Then user verify Disbursement Details of Ui "<accNo>" and "<xpathOldValue>"
Then user verify Disbursement New Details of Ui "<DisbursementDate1>" and "<DisbursementAmount1>"
And user click on auhtorizeButton
Then user finds successMessage "<successMessage>" 
Then verify LOAN_DISB_SCHEDULE table after mod auth where flag "<flag>" and Modified Disbursement Date "<DisbursementDate1>" and Modified Disbursement Amount "<DisbursementAmount1>" and remark1 "<Remark1>"  and remark2 "<Remark2>" and remark3 "<Remark3>" and accNo "<accNo>" and DisbursementAmount "<DisbursementAmountDB>" and DisbursementDate "<DisbursementDateDB>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|SanctionedAmount|DisbursedAmount|xpathOldValue|DisbursementDate1|DisbursementAmount1|successMessage|flag|DisbursementAmountDB|DisbursementDateDB|
|Loan Disbursement Schedule Authorized Entry Mod Auth of AW|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210104000000027|5,00,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|26/02/2020|4,00,000.00|Disbursement Schedule Successfully Authorized.|Auth|400000.00|2020-02-26|
|Loan Disbursement Schedule Authorized Entry Mod Auth of CP|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210104100000211|50,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|28/02/2020|30,000.00|Disbursement Schedule Successfully Authorized.|Auth|30000.00|2020-02-28|
|Loan Disbursement Schedule Authorized Entry Mod Auth of RI|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210104200000037|6,00,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|03/03/2020|60,000.00|Disbursement Schedule Successfully Authorized.|Auth|60000.00|2020-03-03|
|Loan Disbursement Schedule Authorized Entry Mod Auth of RC|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210105910000118|10,00,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|24/02/2020|1,00,000.00|Disbursement Schedule Successfully Authorized.|Auth|100000.00|2020-02-24|
|Loan Disbursement Schedule Authorized Entry Mod Auth of CL|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210105920000182|4,00,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|25/02/2020|80,000.00|Disbursement Schedule Successfully Authorized.|Auth|80000.00|2020-02-25|

|Loan Disbursement Schedule Entry Mod Auth of AW|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210104000000030|5,00,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|24/02/2020|3,00,000.00|Disbursement Schedule Successfully Authorized.|Auth|300000.00|2020-02-24|
|Loan Disbursement Schedule Entry Mod Auth of CP|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210104100000213|50,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|26/02/2020|10,000.00|Disbursement Schedule Successfully Authorized.|Auth|10000.00|2020-02-26|
|Loan Disbursement Schedule Entry Mod Auth of RI|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210104200000039|6,00,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|06/03/2020|70,000.00|Disbursement Schedule Successfully Authorized.|Auth|70000.00|2020-03-06|
|Loan Disbursement Schedule Entry Mod Auth of RC|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210105910000120|10,00,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|28/02/2020|4,00,000.00|Disbursement Schedule Successfully Authorized.|Auth|400000.00|2020-02-28|
|Loan Disbursement Schedule Entry Mod Auth of CL|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210105920000185|4,00,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|25/02/2020|2,00,000.00|Disbursement Schedule Successfully Authorized.|Auth|200000.00|2020-02-25|

###################################################################### Loan Disbursement Schedule Modification Rejection ################################################################################################################################################################################################################################


Scenario Outline: 12.Loan Disbursement Schedule Modification Rejection
Scenario : 12.Loan Disbursement Schedule Modification Rejection
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
And user select Account Number "<accNo>" on Loan Disbursement Schedule Auth Screen
Then user verify Sanctioned Amount "<SanctionedAmount>" and DisbursedAmount "<DisbursedAmount>" on mod auth screen
Then user verify Disbursement Details of Ui "<accNo>" and "<xpathOldValue>"
Then user verify Disbursement New Details of Ui "<DisbursementDate1>" and "<DisbursementAmount1>"
And user click on rejectButton
Then user finds successMessage "<successMessage>" 
Then verify LOAN_DISB_SCHEDULE table after mod auth where flag "<flag>" and Modified Disbursement Date "<DisbursementDate1>" and Modified Disbursement Amount "<DisbursementAmount1>" and remark1 "<Remark1>"  and remark2 "<Remark2>" and remark3 "<Remark3>" and accNo "<accNo>" and DisbursementAmount "<DisbursementAmountDB>" and DisbursementDate "<DisbursementDateDB>"
And  user closes testCase

Examples:
|testCase|MenuName|MenuPath|accNo|SanctionedAmount|DisbursedAmount|xpathOldValue|DisbursementDate1|DisbursementAmount1|successMessage|flag|DisbursementAmountDB|DisbursementDateDB|
|Loan Disbursement Schedule Entry Mod Rejection of AW|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210104000000031|5,00,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|24/02/2020|3,00,000.00|Disbursement Schedule Successfully Rejected.|EntryReject|300000.00|2020-02-24|
|Loan Disbursement Schedule Entry Mod Rejection of CP|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210104100000214|50,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|26/02/2020|10,000.00|Disbursement Schedule Successfully Rejected.|EntryReject|10000.00|2020-02-26|
|Loan Disbursement Schedule Entry Mod Rejection of RI|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210104200000040|6,00,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|06/03/2020|70,000.00|Disbursement Schedule Successfully Rejected.|EntryReject|70000.00|2020-03-06|
|Loan Disbursement Schedule Entry Mod Rejection of RC|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210105910000121|10,00,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|28/02/2020|4,00,000.00|Disbursement Schedule Successfully Rejected.|EntryReject|400000.00|2020-02-28|
|Loan Disbursement Schedule Entry Mod Rejection of CL|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210105920000186|4,00,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|25/02/2020|2,00,000.00|Disbursement Schedule Successfully Rejected.|EntryReject|200000.00|2020-02-25|

|Loan Disbursement Schedule Entry Mod Rejection of AW|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210104000000032|5,00,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|25/02/2020|3,00,000.00|Disbursement Schedule Successfully Rejected.|ModAuthReject|300000.00|2020-02-25|
|Loan Disbursement Schedule Entry Mod Rejection of CP|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210104100000215|50,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|26/02/2020|10,000.00|Disbursement Schedule Successfully Rejected.|ModAuthReject|10000.00|2020-02-26|
|Loan Disbursement Schedule Entry Mod Rejection of RI|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210104200000041|6,00,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|06/03/2020|70,000.00|Disbursement Schedule Successfully Rejected.|ModAuthReject|70000.00|2020-03-06|
|Loan Disbursement Schedule Entry Mod Rejection of RC|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210105910000122|10,00,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|28/02/2020|4,00,000.00|Disbursement Schedule Successfully Rejected.|ModAuthReject|400000.00|2020-02-28|
|Loan Disbursement Schedule Entry Mod Rejection of CL|Loan Disbursement schedule Modification Auth|Menu_LoanDisbursementScheduleModEntryAuth|101210105920000187|4,00,000.00|0.00|//div[@id='disbusrsementScheduleEntryAuthorization2']|27/02/2020|2,00,000.00|Disbursement Schedule Successfully Rejected.|ModAuthReject|200000.00|2020-02-27|


@DisbSchedule @setUp
Scenario Outline: 13.Loan Disbursement Schedule Auth Screen Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||