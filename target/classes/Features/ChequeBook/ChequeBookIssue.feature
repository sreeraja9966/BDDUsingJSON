@ChequeBookIssue
Feature: Cheque Book Issue Functionality

@ChequeBookIssue @setUp
Scenario Outline: 1.Cheque Book Issue Screen Setup
Scenario : 1.Cheque Book Issue Screen Setup
Given User creates a parentReport "<parentReport>"
Then setup Cheque Book Issue Screen

Examples:
|parentReport|
|Cheque Book Issue|

############################################################### Cheque Book Issue ########################################################################################

@ChequeBookIssue
Scenario Outline: 2. Cheque Book Issue for SB, CA, CC & OD Accounts 
Scenario : 2.Cheque Book Issue for SB, CA, CC & OD Accounts
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>" of Cheque Book screen
Then user enters account number "<AccNo>" on Cheque Book Screen
And user select No. of leaves "<NumOfLeaves>" from dropdown
And user select No. of books "<NumOfBooks>" from dropdown
And user select instrument types "<InstrumentTypesUi>" from dropdown
Then user verify start number & end number No. of leaves "<NumOfLeaves>" & No. of books "<NumOfBooks>" & prod type "<PrdType>" On Ui
Then user verify Cheque Book Charges "<ChequeBookChargeCode>" & No. of leaves "<NumOfLeaves>" & No. of books "<NumOfBooks>" & CGST "<CGST>" & SGST "<SGST>" On Ui
Then user click on submit button of Cheque Book Issue
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verify CHEQUE_BOOK_MASTER table where Account Number "<AccNo>" & scenario "<StoreInCache>" & InstrumentTypes "<InstrumentTypesUi>" & prod type "<PrdType>" & InstTypeDB "<InstTypeDB>" & status "<Status>" & No. of books "<NumOfBooks>"
#Then verify Transaction_Header table 			voucher number not showing on entry success screen.
#Then verify Transaction_Details table 
Then user closes testCase

Examples:
|testCase|MenuName|MenuPath|AccNo|NumOfLeaves|NumOfBooks|InstrumentTypesUi|PrdType|InstTypeDB|ChequeBookChargeCode|CGST|SGST|StoreInCache|KeyInCache|Status|successMessage|
|Saving Account Cheque Book Issue Entry|Cheque Book|Menu_ChequeBookIssue|101210101100000917|10|1| Saving Account|SB|10|CHQBOOK|4.50|2.25|SBChequeBookIssue|ChequeBookRequestScreen_modelRespose|E|Cheque Book Issue Raised Successfully.|
#|Current Account Cheque Book Issue Entry|Cheque Book|Menu_ChequeBookIssue|101210101200000155|25|1| Current Account|CA|11|CHQBOOK|11.25|5.63|CAChequeBookIssue|ChequeBookRequestScreen_modelRespose|E|Cheque Book Issue Raised Successfully.|
#|Cash Credit Account Cheque Book Issue Entry|Cheque Book|Menu_ChequeBookIssue|101210102000000421|10|2| Cash Credit|CC|13|CHQBOOK|9.00|4.50|CCChequeBookIssue|ChequeBookRequestScreen_modelRespose|E|Cheque book issue request raised successfully.|
#|Overdraft Account Cheque Book Issue Entry|Cheque Book|Menu_ChequeBookIssue|101210103100000319|25|1| Over Draft|OD|14|CHQBOOK|11.25|5.63|ODChequeBookIssue|ChequeBookRequestScreen_modelRespose|E|Cheque book issue request raised successfully.|


############################################################### Cheque Book Issue Auth #######################################################################################################################################################################


@ChequeBookIssue
Scenario Outline: 3. Cheque Book Issue Auth for SB, CA, CC & OD Accounts 
Scenario : 3.Cheque Book Issue Auth for SB, CA, CC & OD Accounts
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>" of Cheque Book screen
Then user select batch number from dropdown of Cheque Book Issue Auth screen where batch number "<batchNum>" & account num "<AccNo>"
Then user verify account number "<AccNo>" & Cust Name "<CustName>" & Date Of Issue "<DateOfIssue>" On Ui of Cheque Book Issue Auth Screen 
And user click select for cheque book checkbox on Cheque Book Issue Auth Screen Ui
Then user click on Authorize button of Cheque Book Issue Auth Screen
Then user finds successMessage "<successMessage>"
Then user closes testCase

Examples:
|testCase|MenuName|MenuPath|AccNo|batchNum|CustName|successMessage|
#|Current Account Cheque Book Issue Authorization|Cheque Book|Menu_ChequeBookIssueAuth|101210103100000319|1|g g g|Chequebook Issue Authorization Process Successfully Done.|
|Saving Account Cheque Book Issue Authorization|Cheque Book|Menu_ChequeBookIssueAuth|101210101100000917|1|SAGAR RAM PAWAR|Chequebook Issue Authorization Process Successfully Done.|
#|Cash Credit Account Cheque Book Issue Authorization|Cheque Book|Menu_ChequeBookIssueAuth|101210101200000155|1|SAGAR RAM PAWAR|Chequebook Issue Authorization Process Successfully Done.|
#|Overdraft Account Cheque Book Issue Authorization|Cheque Book|Menu_ChequeBookIssueAuth|101210102000000421|1|SAGAR RAM PAWAR|Chequebook Issue Authorization Process Successfully Done.|






