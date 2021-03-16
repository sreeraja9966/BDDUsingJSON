@ChequeBookRequest&Cancel
Feature: Cheque Book Functionality

@ChequeBookRequest&Cancel @setUp
Scenario Outline: 1.Cheque Book Request Screen Setup
Scenario : 1.Cheque Book Request Screen Setup
Given User creates a parentReport "<parentReport>"
Then setup Cheque Book Request Screen

Examples:
|parentReport|
|Cheque Book Request & Cancel|


############################################################### Cheque Book Request ########################################################################################


Scenario Outline: 2.Check Validation Message with savings account
Scenario : 2.Check Validation Message with savings account
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters account number "<AccNo>" on Cheque Book Screen
Then verify validation Message on Get Call "<Xpath>" "<ExpectedMessage>"
Then user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|Xpath|ExpectedMessage|
|Invalid Status of Account|Cheque Book|Menu_ChequeBookRequestCreate|101210101100000817|ChequeBookRequestScreen_ClosedAccount|Account is closed.|



Scenario Outline: 3.Check Validation Message with savings account Customer
Scenario : 3.Check Validation Message with savings account Customer
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters account number "<AccNo>" on Cheque Book Screen
Then verify validation Message on Get Call "<Xpath>" "<ExpectedMessage>"
Then user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|Xpath|ExpectedMessage|
|Invalid Status of Customer|Cheque Book|Menu_ChequeBookRequestCreate|101210101100000818|ChequeBookRequestScreen_ClosedCust|0011000000001829 Customer Is Closed or Deleted|



Scenario Outline: 4. Cheque Book Request for SB, CA, CC & OD Accounts 
Scenario : 4.Cheque Book Request for SB, CA, CC & OD Accounts
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters account number "<AccNo>" on Cheque Book Screen
And user select No. of leaves "<NumOfLeaves>" from dropdown
And user select No. of books "<NumOfBooks>" from dropdown
And user select instrument types "<InstrumentTypes>" from dropdown
And user select mode of delivery "<ModeOfDelivery>" from dropdown
Then user click on submit button of Cheque Book Request
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verify CHEQUE_BOOK_REQUEST table where Account Number "<AccNo>" & No. of leaves "<NumOfLeaves>" & No. of books "<NumOfBooks>" & mode of delivery "<ModeOfDeliveryDB>" & account Type "<AccType>" & flow "<Flow>" & scenario "<StoreInCache>" & InstrumentTypes "<InstrumentTypes>" 
Then user closes testCase

Examples:
|testCase|MenuName|MenuPath|AccNo|NumOfLeaves|NumOfBooks|InstrumentTypes|ModeOfDelivery|StoreInCache|KeyInCache|ModeOfDeliveryDB|AccType|successMessage|Flow|
|Saving Account Cheque Book Request|Cheque Book|Menu_ChequeBookRequestCreate|101210101100000917|10|1| Saving Account|BY POST|SBChequeBookRequest|ChequeBookRequestScreen_modelRespose|BYPO|SB|Request Accepted Successfully.|Entry|
|Current Account Cheque Book Request|Cheque Book|Menu_ChequeBookRequestCreate|101210101200000155|25|2| Current Account|BY COURIER|CAChequeBookRequest|ChequeBookRequestScreen_modelRespose|BYCO|CA|Request Accepted Successfully.|Entry|
|Cash Credit Account Cheque Book Request|Cheque Book|Menu_ChequeBookRequestCreate|101210102000000421|10|2| Cash Credit|BY POST|CCChequeBookRequest|ChequeBookRequestScreen_modelRespose|BYPO|CC|Request Accepted Successfully.|Entry|
|Overdraft Account Cheque Book Request|Cheque Book|Menu_ChequeBookRequestCreate|101210103100000319|25|1| Over Draft|ACCROSS THE COUNTER|ODChequeBookRequest|ChequeBookRequestScreen_modelRespose|ACCT|OD|Request Accepted Successfully.|Entry|



############################################################# Cheque Book Request Approve ###################################################################################


Scenario Outline: 5. Cheque Book Request Approve for SB, CA, CC & OD Accounts 
Scenario : 5.Cheque Book Request Approve for SB, CA, CC & OD Accounts
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user verify account number "<AccNo>" & Cust Name "<CustName>" & No. of leaves "<NumOfLeaves>" & No. of books "<NumOfBooks>" & mode of delivery "<ModeOfDelivery>" On Ui of Cheque Book Request Approve or Cancel 
And user click select for cheque book checkbox on Ui
Then user click on Approve button of Cheque Book Request Approve/Cancel
Then user finds successMessage "<successMessage>"
Then verify CHEQUE_BOOK_REQUEST table where Account Number "<AccNo>" & scenario "<StoreInCache>"
Then user closes testCase

Examples:
|testCase|MenuName|MenuPath|AccNo|CustName|NumOfLeaves|NumOfBooks|ModeOfDelivery|successMessage|StoreInCache|
|Overdraft Account Cheque Book Request Approve|Cheque Book|Menu_ChequeBookRequestCancel|101210103100000319|g g g|25|1|ACCROSS THE COUNTER|Cheque Book Approved Process Done Successfully.|ODChequeBookRequest|
|Saving Account Cheque Book Request Approve|Cheque Book|Menu_ChequeBookRequestCancel|101210101100000917|SAGAR RAM PAWAR|10|1|BY POST|Cheque Book Approved Process Done Successfully.|SBChequeBookRequest|
|Current Account Cheque Book Request Approve|Cheque Book|Menu_ChequeBookRequestCancel|101210101200000155|SAGAR RAM PAWAR|25|2|BY COURIER|Cheque Book Approved Process Done Successfully.|CAChequeBookRequest|
|Cash Credit Account Cheque Book Request Approve|Cheque Book|Menu_ChequeBookRequestCancel|101210102000000421|SAGAR RAM PAWAR|10|2|BY POST|Cheque Book Approved Process Done Successfully.|CCChequeBookRequest|


############################################################### Cheque Book Request Entry for Cancel ########################################################################################


Scenario Outline: 6. Cheque Book Request for Cancel Of SB, CA, CC & OD Accounts 
Scenario : 6.Cheque Book Request for Cancel of SB, CA, CC & OD Accounts
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user enters account number "<AccNo>" on Cheque Book Screen
And user select No. of leaves "<NumOfLeaves>" from dropdown
And user select No. of books "<NumOfBooks>" from dropdown
And user select instrument types "<InstrumentTypes>" from dropdown
And user select mode of delivery "<ModeOfDelivery>" from dropdown
Then user click on submit button of Cheque Book Request
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verify CHEQUE_BOOK_REQUEST table where Account Number "<AccNo>" & No. of leaves "<NumOfLeaves>" & No. of books "<NumOfBooks>" & mode of delivery "<ModeOfDeliveryDB>" & account Type "<AccType>" & flow "<Flow>" & scenario "<StoreInCache>" & InstrumentTypes "<InstrumentTypes>" 
Then user closes testCase

Examples:
|testCase|MenuName|MenuPath|AccNo|NumOfLeaves|NumOfBooks|InstrumentTypes|ModeOfDelivery|StoreInCache|KeyInCache|ModeOfDeliveryDB|AccType|successMessage|Flow|
|Saving Account Cheque Book Request for Cancel|Cheque Book|Menu_ChequeBookRequestCreate|101210101100000916|10|1| Saving Account|BY POST|SBChequeBookRequestCancel|ChequeBookRequestScreen_modelRespose|BYPO|SB|Request Accepted Successfully.|Entry|
|Current Account Cheque Book Request for Cancel|Cheque Book|Menu_ChequeBookRequestCreate|101210101200000156|25|2| Current Account|BY COURIER|CAChequeBookRequestCancel|ChequeBookRequestScreen_modelRespose|BYCO|CA|Request Accepted Successfully.|Entry|
|Cash Credit Account Cheque Book Request for Cancel|Cheque Book|Menu_ChequeBookRequestCreate|101210102000000422|10|2| Cash Credit|BY POST|CCChequeBookRequestCancel|ChequeBookRequestScreen_modelRespose|BYPO|CC|Request Accepted Successfully.|Entry|
|Overdraft Account Cheque Book Request for Cancel|Cheque Book|Menu_ChequeBookRequestCreate|101210103100000321|25|1| Over Draft|ACCROSS THE COUNTER|ODChequeBookRequestCancel|ChequeBookRequestScreen_modelRespose|ACCT|OD|Request Accepted Successfully.|Entry|



############################################################# Cheque Book Request Cancel ###################################################################################


Scenario Outline: 7. Cheque Book Request Cancel for SB, CA, CC & OD Accounts 
Scenario : 7.Cheque Book Request Cancel for SB, CA, CC & OD Accounts
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
Then user verify account number "<AccNo>" & Cust Name "<CustName>" & No. of leaves "<NumOfLeaves>" & No. of books "<NumOfBooks>" & mode of delivery "<ModeOfDelivery>" On Ui of Cheque Book Request Approve or Cancel 
And user click select for cheque book checkbox on Ui
And user select cancellation reason "<CancelReason>" from dropdown
Then user click on Cancel button of Cheque Book Request Approve/Cancel
Then user finds successMessage "<successMessage>"
Then verify CHEQUE_BOOK_REQUEST table where scenario "<StoreInCache>" & cancellation reason "<CancelReasonDB>"
Then user closes testCase

Examples:
|testCase|MenuName|MenuPath|AccNo|CustName|NumOfLeaves|NumOfBooks|ModeOfDelivery|CancelReason|successMessage|CancelReasonDB|StoreInCache|
|Overdraft Account Cheque Book Request Cancel|Cheque Book|Menu_ChequeBookRequestCancel|101210103100000321|g g g|25|1|ACCROSS THE COUNTER| Singanture not match |Chequebook Request Cancel Process Successfully Done.|CHREQCO|ODChequeBookRequestCancel|
|Saving Account Cheque Book Request Cancel|Cheque Book|Menu_ChequeBookRequestCancel|101210101100000916|SAGAR RAM PAWAR|10|1|BY POST| Singanture not match |Chequebook Request Cancel Process Successfully Done.|CHREQCO|SBChequeBookRequestCancel|
|Current Account Cheque Book Request Cancel|Cheque Book|Menu_ChequeBookRequestCancel|101210101200000156|SAGAR RAM PAWAR|25|2|BY COURIER| Singanture not match |Chequebook Request Cancel Process Successfully Done.|CHREQCO|CAChequeBookRequestCancel|
|Cash Credit Account Cheque Book Request Cancel|Cheque Book|Menu_ChequeBookRequestCancel|101210102000000422|SAGAR RAM PAWAR|10|2|BY POST| Singanture not match |Chequebook Request Cancel Process Successfully Done.|CHREQCO|CCChequeBookRequestCancel|




