Feature: Cash Withdrawal with denomination

@Withdrawal @setUp @withDenom @sanity
Scenario Outline: CashWithdrawal Screen Setup
Given User starts a parentReport "<parentReport>"
Then setup CashWithdrawal Screen
Examples:
|parentReport|
|CashWithdrawal With Denomination|

@Withdrawal @withDenom @sanity
Scenario Outline: Cash Withdrawal 

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on cashWithdrawal screen
And user selects "<instrumentType>" and instrument No "<instrNo>"
And user selects currency "<currency>"
And click on addDetails button on cashWithdrawal screen
And enter token number "<tokenNo>"
And click on submit button on cashDeposit screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<AccNo>"
Then verify Transaction_Header table TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction_Details table TRANS_AMT "<transAmt>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify AllLimitMaster with "<activity>" "<transCode>" "<transAmt>"
Then verify CHEQUEBOOKDETAIL table status col "<chqStaus>" transId and paidDate where "<instrumentType>" and instrument No "<instrNo>" and vouchNo "<StoreInCache>" and TransType "W"
Then verify TOKENMASTER table status col "C" where "<tokenNo>"
And user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|instrumentType|instrNo|currency|tokenNo|StoreInCache|KeyInCache|successMessage|AvailableBal|tranType|activity|transCode|ShadowBal|chqStaus|
|Cash Withdrawal using SB withdrawalSlip|Cash Withdrawal|Menu_CashWithdrawal|101210101100000816|500|Withdrawal Slip - 99|123|INR|51|CashWithdrawalusingSBwithdrawalSlip|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|10000|W|E|CashWthdrwal|-500||
|Cash Withdrawal using SB withdrawalSlip Non-Individual Acc|Cash Withdrawal|Menu_CashWithdrawal|101210101100000826|500|Withdrawal Slip - 99|123|INR|52|CashWithdrawalusingSBNonIndividualwithdrawalSlip|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|10000|W|E|CashWthdrwal|-500||
|Cash Withdrawal using SB Cheque|Cash Withdrawal|Menu_CashWithdrawal|101210101100000865|500|Saving Account - 10|100000|INR|53|CashWithdrawalusingSBCheque|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|10000|W|E|CashWthdrwal|-500|P|
|Cash Withdrawal using CC Cheque|Cash Withdrawal|Menu_CashWithdrawal|101210102000000420|500|Cash Credit - 13|100050|INR|54|CashWithdrawalusingCCCheque|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|0|W|E|CashWthdrwal|-500|P|
|Cash Withdrawal using Non_individual CC Cheque|Cash Withdrawal|Menu_CashWithdrawal|101210102000000391|500|Cash Credit - 13|100101|INR|55|CashWithdrawalusingNonindividualCCCheque|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|0|W|E|CashWthdrwal|-500|P|
|Cash Withdrawal using SB Cheque of Non-Individual Acc|Cash Withdrawal|Menu_CashWithdrawal|101210101100000866|500|Saving Account - 10|100025|INR|56|CashWithdrawalusingNonIndiSBCheque|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|10000|W|E|CashWthdrwal|-500|P|
|Cash Withdrawal using Credit Freeze Acc|Cash Withdrawal|Menu_CashWithdrawal|101210101100000821|500|Withdrawal Slip - 99|123|INR|57|CashWithdrawalusingCreditFreezeAcc|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|10000|W|E|CashWthdrwal|-500||
|Cash Withdrawal using Credit Freeze Customer|Cash Withdrawal|Menu_CashWithdrawal|101210101100000822|500|Withdrawal Slip - 99|123|INR|58|CashWithdrawalusingCreditFreezeCustomer|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|10000|W|E|CashWthdrwal|-500||

@Withdrawal @withDenom @sanity
Scenario Outline: Cash Withdrawal Authorization
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When enter voucher No on deposit auth screen "<StoreInCache>"
Then verify BranchCode "<AccNo>" Name "<InstNo>" "<InstType>" InstDate "<TransAmt>" DrCr Remarks
When user click on auth button on deposit auth screen
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<AccNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<TransAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction_Details table TRANS_AMT "<TransAmt>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify AllLimitMaster with "<activity>" "<transCode>" "<TransAmt>"
Then verify CHEQUEBOOKDETAIL table status col "<chqStaus>" transId and paidDate where "<InstType>" and instrument No "<InstNo>" and vouchNo "<StoreInCache>" and TransType "W"
Then user Enter and verify Payment screen with vouchNo "<StoreInCache>" with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBalAfterAuth>" and ShadowBal "<ShadowBalAfterAuth>" where accNo "<AccNo>"
Then verify Transaction_Header table after Denom TRANS_AMT "<TransAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction_Details table TRANS_AMT "<TransAmt>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then verify TOKENMASTER table status col "A" where "<tokenNo>"
Examples:
|testCase|MenuName|MenuPath|StoreInCache|successMessage|AccNo|InstNo|InstType|TransAmt|tranType|activity|transCode|chqStaus|AvailableBal|ShadowBal|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|AvailableBalAfterAuth|ShadowBalAfterAuth|
|Cash Withdrawal using SB withdrawalSlip Auth|Cash Withdrawal|Menu_CashWithdrawalAuth|CashWithdrawalusingSBwithdrawalSlip|Successfully Authorize.|101210101100000816|123|99|500|W|A|CashWithAuth|P|10000|-500|0|3|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|9500|0|
|Cash Withdrawal using SB withdrawalSlip Non-Individual Acc Auth|Cash Withdrawal|Menu_CashWithdrawalAuth|CashWithdrawalusingSBNonIndividualwithdrawalSlip|Successfully Authorize.|101210101100000826|123|99|500|W|A|CashWithAuth|P|10000|-500|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|9500|0|
|Cash Withdrawal using SB Cheque Auth|Cash Withdrawal|Menu_CashWithdrawalAuth|CashWithdrawalusingSBCheque|Successfully Authorize.|101210101100000865|100000|10|500|W|A|CashWithAuth|P|10000|-500|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|9500|0|
|Cash Withdrawal using CC Cheque Auth|Cash Withdrawal|Menu_CashWithdrawalAuth|CashWithdrawalusingCCCheque|Successfully Authorize.|101210102000000420|100050|13|500|W|A|CashWithAuth|P|0|-500|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|-500|0|
|Cash Withdrawal using Non_individual CC Cheque Auth|Cash Withdrawal|Menu_CashWithdrawalAuth|CashWithdrawalusingNonindividualCCCheque|Successfully Authorize.|101210102000000391|100101|13|500|W|A|CashWithAuth|P|0|-500|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|-500|0|
|Cash Withdrawal using SB Cheque of Non-Individual Acc Auth|Cash Withdrawal|Menu_CashWithdrawalAuth|CashWithdrawalusingNonIndiSBCheque|Successfully Authorize.|101210101100000866|100025|10|500|W|A|CashWithAuth|P|10000|-500|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|9500|0|
|Cash Withdrawal using Credit Freeze Acc Auth|Cash Withdrawal|Menu_CashWithdrawalAuth|CashWithdrawalusingCreditFreezeAcc|Successfully Authorize.|101210101100000821|123|99|500|W|A|CashWithAuth|P|10000|-500|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|9500|0|
|Cash Withdrawal using Credit Freeze Customer Auth|Cash Withdrawal|Menu_CashWithdrawalAuth|CashWithdrawalusingCreditFreezeCustomer|Successfully Authorize.|101210101100000822|123|99|500|W|A|CashWithAuth|P|10000|-500|0|0|0|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|9500|0|




@Withdrawal @withDenom 
Scenario Outline: Cash Withdrawal IBT transaction

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on cashWithdrawal screen
And user selects "<instrumentType>" and instrument No "<instrNo>"
And user selects currency "<currency>"
And click on addDetails button on cashWithdrawal screen
And enter token number "<tokenNo>"
And click on submit button on cashDeposit screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<AccNo>"
Then verify Transaction_Header table TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction tables in case of IBT using "<tranType>""<StoreInCache>""<transAmt>""<AccNo>""<IbtStatus>""CashWthdrwal"
Then verify TOKENMASTER table status col "C" where "<tokenNo>"
And user closes testCase
Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|instrumentType|instrNo|currency|tokenNo|StoreInCache|KeyInCache|successMessage|AvailableBal|tranType|activity|transCode|ShadowBal|chqStaus|IbtStatus|
|Cash Withdrawal using IBT|Cash Withdrawal|Menu_CashWithdrawal|101210201100000013|500|Withdrawal Slip - 99|123|INR|59|CashWithdrawalIBT|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|10000|W|E|CashWthdrwal|-500||E|

@Withdrawal @withDenom
Scenario Outline: Cash Withdrawal IBT Authorization
Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When enter voucher No on deposit auth screen "<StoreInCache>"
When user click on auth button on deposit auth screen
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<AccNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<TransAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction tables in case of IBT using "<tranType>""<StoreInCache>""<TransAmt>""<AccNo>""<IbtStatus>"
Then user Enter and verify Payment screen with vouchNo "<StoreInCache>" with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBalAfterAuth>" and ShadowBal "<ShadowBalAfterAuth>" where accNo "<AccNo>"
Then verify Transaction_Header table after Denom TRANS_AMT "<TransAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction tables in case of IBT using "<tranType>""<StoreInCache>""<TransAmt>""<AccNo>""<IbtStatusAfterAuth>"
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then verify TOKENMASTER table status col "A" where "<tokenNo>"
Examples:
|testCase|MenuName|MenuPath|StoreInCache|successMessage|AccNo|InstNo|InstType|TransAmt|tranType|activity|transCode|chqStaus|AvailableBal|ShadowBal|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|AvailableBalAfterAuth|ShadowBalAfterAuth|IbtStatus|IbtStatusAfterAuth|
|Cash Withdrawal using IBT Authrozation|Cash Withdrawal|Menu_CashWithdrawalAuth|CashWithdrawalIBT|Successfully Authorize.|101210201100000013|123|99|500|W|A|CashWithAuth||10000|-500|0|3|0|0|0|0|0|0|0|1|0|0|0|0|0|0|0|0|9500|0|P|A|

@Withdrawal @withDenom
Scenario Outline: Cash Withdrawal validation messages on GET Call

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters accNo "<AccNo>" on cashWithdrawal screen
Then verify validation Message on Get Call "<xpath>" "<ExpectedMessage>"
Examples:
|testCase|MenuName|MenuPath|AccNo|xpath|ExpectedMessage|
|Closed Account|Cash Withdrawal|Menu_CashWithdrawal|101210101100000817|//span[@id='accNocashwithdralentry1_ExceptionMsg']|Account is closed.|
|Closed Customer|Cash Withdrawal|Menu_CashWithdrawal|101210101100000818|//span[@id='accNocashwithdralentry1_ExceptionMsg']|0011000000001829 Customer Is Closed or Deleted|
|Total Freezed Account|Cash Withdrawal|Menu_CashWithdrawal|101210101100000820|//span[@id='accNocashwithdralentry1_ExceptionMsg']|Account is total freeze.|
|Total Freezed Customer|Cash Withdrawal|Menu_CashWithdrawal|101210101100000819|//span[@id='accNocashwithdralentry1_ExceptionMsg']|0011000000001830 Customer Is Debit Freeze|
|Debit Freezed Account|Cash Withdrawal|Menu_CashWithdrawal|101210101100000823|//span[@id='accNocashwithdralentry1_ExceptionMsg']|Account is debit freeze.|
|Debit Freezed Customer|Cash Withdrawal|Menu_CashWithdrawal|101210101100000824|//span[@id='accNocashwithdralentry1_ExceptionMsg']|0011000000001835 Customer Is Debit Freeze|



@Withdrawal @withDenom
Scenario Outline: Cash Withdrawal validation messages on POST Call

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on cashWithdrawal screen
And user selects "<instrumentType>" and instrument No "<instrNo>"
And user selects currency "<currency>"
And click on addDetails button on cashWithdrawal screen
And enter token number "<tokenNo>"
And click on submit button on cashDeposit screen
Then user finds validationMessage"<validationMessage>"

Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|instrumentType|instrNo|currency|tokenNo|validationMessage|
|Low balance|Cash Withdrawal|Menu_CashWithdrawal|101210101100000825|500|Withdrawal Slip - 99|123|INR|57|Balance is insufficient.|
|Token Under Circulation|Cash Withdrawal|Menu_CashWithdrawal|101210101100000816|500|Withdrawal Slip - 99|123|INR|99|Token is in Circulation|
|Balance Freeze|Cash Withdrawal|Menu_CashWithdrawal|101210101100000825|500|Withdrawal Slip - 99|123|INR|58|Balance is insufficient.|
@Withdrawal @withDenom
Scenario Outline: Cash Withdrawal validation messages of Transaction Amount GET Call

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on cashWithdrawal screen
Then verify validation Message on Get Call "<xpath>" "<ExpectedMessage>"
Examples:
|testCase|MenuName|MenuPath|AccNo|xpath|ExpectedMessage|transAmt|
|Low Balance of SB account|Cash Withdrawal|Menu_CashWithdrawal|101210101100000817|//span[@id='transAmtcashwithdralentry1_ExceptionMsg']|Balance is insufficient.|1000|
|Low Balance of CC account|Cash Withdrawal|Menu_CashWithdrawal|101210101100000817|//span[@id='transAmtcashwithdralentry1_ExceptionMsg']|Balance is insufficient.|1000|

@Withdrawal @withDenom
Scenario Outline: Cash Withdrawal Rejection At Auth Level

Given user opens a testCase "<testCase>"
Given User is on "<MenuName>" "<MenuPath>"screen
When user enters accNo "<AccNo>" and transaction Amount "<transAmt>" on cashWithdrawal screen
And user selects "<instrumentType>" and instrument No "<instrNo>"
And user selects currency "<currency>"
And click on addDetails button on cashWithdrawal screen
And enter token number "<tokenNo>"
And click on submit button on cashDeposit screen
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Given User is on "<MenuName>" "<MenuPath2>"screen
When enter voucher No on deposit auth screen "<StoreInCache>"
When user click on reject button on deposit auth screen
Then user finds successMessage "<successMessage2>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<AccNo>"
Then verify Transaction_Header table after Rejection TRANS_AMT "<transAmt>"  where voucher_num "<StoreInCache>" and tranType "<tranType>" with DenomY
Then verify Transaction_Details table TRANS_AMT "<transAmt>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "<tranType>"
Then verify TOKENMASTER table status col "A" where "<tokenNo>"
Examples:
|testCase|MenuName|MenuPath|AccNo|transAmt|instrumentType|instrNo|currency|tokenNo|StoreInCache|KeyInCache|successMessage|MenuPath2|successMessage2|AvailableBal|ShadowBal|tranType|
|Cash Withdrawal Rejection Using SB At Auth Level|Cash Withdrawal|Menu_CashWithdrawal|101210101100000864|500|Withdrawal Slip - 99|123|INR|60|CashWithdrawalRejectionUsingSB|TellerDepositScreen_ModelNumber|Transaction Completed Successfully.|Menu_CashWithdrawalAuth|Successfully Rejected.|10000|0|W|

@Withdrawal @setUp @withDenom @sanity
Scenario Outline: 7.Tearup

Given User Tearup automation for Parent Report
Examples:
|testCase|
||
