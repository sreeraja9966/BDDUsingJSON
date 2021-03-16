Feature: Fixed Deposit Pre Mature Closing

@FDPreClosing @setUp @withDenom
Scenario Outline: FixedDeposit Closing Screen Setup
Given User starts a parentReport "<parentReport>"
Then setup FixedDepositPrematureClosing Screen
Examples:
|parentReport|
|FixedDeposit Pre Mature Closing|

@FDPreClosing @withDenom
Scenario Outline: FD Pre Mature Closing
Given user opens a testCase "<testCase>"
Given User is on "TD Account Premature Closing" "Menu_FDPreMatureClosingEntry"screen
When user enters accNo "<AccNo>" Fd Closing Entry screen
Then Verify CustName PeriodInMonths PeriodInDays opngDate availableBal MatAmt MatDate payableAmt of AccNo "<AccNo>"
When user click on interestInfoTab
Then Verify ROI "<ROI>" AddROI "<AddROI>" preMatROI "<preMatROI>" PreMatIntAmt "<PreMatIntAmt>" PenalIR "<PenalIR>" IntPaid "<IntPaid>" IntProvision "<IntProvision>" IntCap "<IntCap>" PreMatPeriod "<PreMatPeriod>" CashIntPayable "<CashIntPayable>"
When user click on TDSAndLoanInfoTab
Then Verify TDSDeductedAmt "<TDSDeductedAmt>" TDSAmt "<TDSAmt>" ExcessInt "<ExcessInt>" TDSRecovery "<TDSRecovery>" TotalPayable "<TotalPayable>"
When user select "<ModeOfPayableRceivableAmt>"
Then observe transaction amount "<TotalReceivableAmt>"
When user enters TokenNumber "<TokenNo>"
And user enters Remark "<Remark>"
And click on submit button on Td Closing Screen
And user click on voucherDisplayConfirm button
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<AccNo>"
Then verify Transaction_Header table TRANS_AMT "<TotalPayable>"  where voucher_num "<StoreInCache>" and tranType "W" with DenomY
Then verify Child Voucher details in Transaction_Header table TRANS_AMT "<TotalPayable>" and Status "E"  where Parent voucher_num "<StoreInCache>"
Then verify Transaction_Details table TRANS_AMT "<TotalPayable>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "W"
Then verify Dr Cr amount of Child Voucher details in Transaction_Details table where voucher_num "<StoreInCache>"
Then Verify DepositInterestHistory Table with AccNo "<AccNo>" IntAmt "<IntAmt>" Status "E"
Then verify TOKENMASTER table status col "C" where "<TokenNo>"
Examples:
|testCase|AccNo|ROI|AddROI|preMatROI|PreMatIntAmt|PenalIR|IntPaid|IntProvision|IntCap|PreMatPeriod|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|ModeOfPayableRceivableAmt|TotalReceivableAmt|TokenNo|Remark|StoreInCache|KeyInCache|successMessage|AvailableBal|ShadowBal|IntAmt|
|Pre Maturity Acc Without TDS amount|101210105550000028|7.75|0|6.75|2250|1.0|0|0|0|0 Years, 8 Months, 0 Days|0|0|0|0|0|52250|Cash|52250|1|Closing|FDPreMatClosingWithoutTDS|FdClosureScreen_ModelNumber|Account closed successfully|50000|-50000|2250|


@FDPreClosing @withDenom
Scenario Outline: FD Closing Rejection
Given user opens a testCase "<testCase>"
Given User is on "TD Account Premature Closing" "Menu_FDPreMatClosingAuth"screen
When user select accNo "<userAccNo>" on Fd Closure Auth
Then Verify CustName PeriodInMonths PeriodInDays opngDate availableBal MatAmt MatDate payableAmt of AccNo "<AccNo>"
When user click on interestInfoTab
Then Verify ROI "<ROI>" AddROI "<AddROI>" preMatROI "<preMatROI>" PreMatIntAmt "<PreMatIntAmt>" PenalIR "<PenalIR>" IntPaid "<IntPaid>" IntProvision "<IntProvision>" IntCap "<IntCap>" PreMatPeriod "<PreMatPeriod>" CashIntPayable "<CashIntPayable>"
When user click on TDSAndLoanInfoTab
Then Verify TDSDeductedAmt "<TDSDeductedAmt>" TDSAmt "<TDSAmt>" ExcessInt "<ExcessInt>" TDSRecovery "<TDSRecovery>" TotalPayable "<TotalPayable>"
Then verify TransAmt "<TotalPayable>" TokenNo "<TokenNo>" and Remarks "<Remarks>" on TD Closure Auth
When click on Rejection button on Td Closing Screen
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<AccNo>"
Then verify Transaction_Header table after Rejection TRANS_AMT "<TotalPayable>"  where voucher_num "<StoreInCache>" and tranType "W" with DenomY
Then verify Child Voucher details in Transaction_Header table TRANS_AMT "<TotalPayable>" and Status "R"  where Parent voucher_num "<StoreInCache>"
Then verify Transaction_Details table TRANS_AMT "<TotalPayable>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "W"
Then verify Dr Cr amount of Child Voucher details in Transaction_Details table where voucher_num "<StoreInCache>"
Then Verify DepositInterestHistory Table with AccNo "<AccNo>" IntAmt "<IntAmt>" Status "R"
Then verify AccountMaster table status "A" column and closedDate where AccNo "<AccNo>"
#Then Verify ClosedAccount Table with AccNo "<AccNo>"
Then verify TOKENMASTER table status col "A" where "<TokenNo>"
Examples:
|testCase|userAccNo|AccNo|ROI|AddROI|preMatROI|PreMatIntAmt|PenalIR|IntPaid|IntProvision|IntCap|PreMatPeriod|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|TotalReceivableAmt|TokenNo|Remark|successMessage|StoreInCache|AvailableBal|ShadowBal|IntAmt|
|Pre Maturity Acc Without TDS amount Rejection|1012101555000237|101210105550000028|7.75|0|6.75|2250|1.0|0|0|0|0 Years, 8 Months, 0 Days|0|0|0|0|0|52250.00|52250.00|1|Closing|Account Closing Rejected successfully.|FDPreMatClosingWithoutTDS|50000|0|2250|

@FDPreClosing @withDenom
Scenario Outline: FD Colsing Auth
Given user opens a testCase "<testCase>"
Given User is on "TD Account Premature Closing" "Menu_FDPreMatureClosingEntry"screen
When user enters accNo "<AccNo>" Fd Closing Entry screen
When user enters TokenNumber "<TokenNo>"
And user enters Remark "<Remarks>"
And click on submit button on Td Closing Screen
And user click on voucherDisplayConfirm button
Then store number on model with name "<StoreInCache>" and "FdClosureScreen_ModelNumber"
Then user finds successMessage "Account closed successfully"
Given User is on "TD Account Premature Closing" "Menu_FDPreMatClosingAuth"screen
When user select accNo "<userAccNo>" on Fd Closure Auth
Then Verify CustName PeriodInMonths PeriodInDays opngDate availableBal MatAmt MatDate payableAmt of AccNo "<AccNo>"
When user click on interestInfoTab
When user click on TDSAndLoanInfoTab
Then Verify TDSDeductedAmt "<TDSDeductedAmt>" TDSAmt "<TDSAmt>" ExcessInt "<ExcessInt>" TDSRecovery "<TDSRecovery>" TotalPayable "<TotalPayable>"
Then verify TransAmt "<TotalPayable>" TokenNo "<TokenNo>" and Remarks "<Remarks>" on TD Closure Auth
When click on submit button on Td Closing Screen
And user click on voucherDisplayConfirm button
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<AccNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<TotalPayable>"  where voucher_num "<StoreInCache>" and tranType "W" with DenomY
Then verify Child Voucher details in Transaction_Header table TRANS_AMT "<TotalPayable>" and Status "P"  where Parent voucher_num "<StoreInCache>"
Then verify Transaction_Details table TRANS_AMT "<TotalPayable>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "W"
Then verify Dr Cr amount of Child Voucher details in Transaction_Details table where voucher_num "<StoreInCache>"
Then Verify DepositInterestHistory Table with AccNo "<AccNo>" IntAmt "<IntAmt>" Status "E"
Then verify AccountMaster table status "C" column and closedDate where AccNo "<AccNo>"
Then Verify ClosedAccount Table with AccNo "<AccNo>"
Then verify TOKENMASTER table status col "C" where "<TokenNo>"

Examples:
|testCase|userAccNo|AccNo|ROI|AddROI|ROIAfterAmt|RmngIntAmt|AftrMatAmt|IntPaid|IntProvision|IntCap|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|TokenNo|Remarks|successMessage|StoreInCache|AvailableBal|ShadowBal|IntAmt|
|Pre Maturity Acc Without TDS amount Auth|1012101555000237|101210105550000028|7.75|0|6.75|2250|1.0|0|0|0|0 Years, 8 Months, 0 Days|0|0|0|0|52250.00|1|Closing|Account Closing Authorized successfully.|FDPreMatClosingWithoutTDSForAuth|50000|-50000|2250|

@FDPreClosing @withDenom
Scenario Outline: FD Colsing Payment
Given user opens a testCase "<testCase>"
Then user Enter and verify Payment screen with vouchNo "<StoreInCache>" with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then verfiy account_master table col AllBalanceCol AvailableBal "0" and ShadowBal "0" where accNo "<AccNo>"
Then verify Transaction_Header table after Denom TRANS_AMT "<TotalPayable>"  where voucher_num "<StoreInCache>" and tranType "W" with DenomY
Then verify Child Voucher details in Transaction_Header table TRANS_AMT "<TotalPayable>" and Status "A"  where Parent voucher_num "<StoreInCache>"
Then verify Transaction_Details table TRANS_AMT "<TotalPayable>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "W"
Then verify Dr Cr amount of Child Voucher details in Transaction_Details table where voucher_num "<StoreInCache>"
Then Verify DepositInterestHistory Table with AccNo "<AccNo>" IntAmt "<IntAmt>" Status "A"
Then verify AccountMaster table status "C" column and closedDate where AccNo "<AccNo>"
Then Verify ClosedAccount Table with AccNo "<AccNo>"
Then verify TOKENMASTER table status col "A" where "<TokenNo>"
Examples:
|testCase|userAccNo|AccNo|ROI|AddROI|ROIAfterAmt|RmngIntAmt|AftrMatAmt|IntPaid|IntProvision|IntCap|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|TokenNo|Remarks|successMessage|StoreInCache|AvailableBal|ShadowBal|IntAmt|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|
|Pre Maturity Acc Without TDS amount Payment|1012101555000237|101210105550000028|7.75|0|6.75|2250|1.0|0|0|0|0 Years, 8 Months, 0 Days|0|0|0|0|52250.00|1|Closing|Account Closing Authorized successfully.|FDPreMatClosingWithoutTDSForAuth|50000|-50000|2250|0|0|0|0|0|0|0|0|0|26|0|1|0|1|0|0|0|0|

@FDPreClosing @withDenom
Scenario Outline: FD Colsing Payment Rejection
Given user opens a testCase "<testCase>"
Given User is on "TD Account Premature Closing" "Menu_FDPreMatureClosingEntry"screen
When user enters accNo "<AccNo>" Fd Closing Entry screen
When user enters TokenNumber "<TokenNo>"
And user enters Remark "<Remarks>"
And click on submit button on Td Closing Screen
And user click on voucherDisplayConfirm button
Then store number on model with name "<StoreInCache>" and "FdClosureScreen_ModelNumber"
Then user finds successMessage "Account closed successfully"
Given User is on "TD Account Premature Closing" "Menu_FDPreMatClosingAuth"screen
When user select accNo "<userAccNo>" on Fd Closure Auth
When user click on TDSAndLoanInfoTab
When click on submit button on Td Closing Screen
And user click on voucherDisplayConfirm button
Then user finds successMessage "Account Closing Authorized successfully."
Then user Enter and verify Payment screen with vouchNo "<StoreInCache>" with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>" while Reject
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>" while Reject
Then verfiy account_master table col AllBalanceCol AvailableBal "50000" and ShadowBal "0" where accNo "<AccNo>"
Then verify Transaction_Header table after Rejection TRANS_AMT "<TotalPayable>"  where voucher_num "<StoreInCache>" and tranType "W" with DenomY
Then verify Child Voucher details in Transaction_Header table TRANS_AMT "<TotalPayable>" and Status "R"  where Parent voucher_num "<StoreInCache>"
Then verify Transaction_Details table TRANS_AMT "<TotalPayable>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "W"
Then verify Dr Cr amount of Child Voucher details in Transaction_Details table where voucher_num "<StoreInCache>"
Then Verify DepositInterestHistory Table with AccNo "<AccNo>" IntAmt "<IntAmt>" Status "R"
Then verify AccountMaster table status "A" column and closedDate where AccNo "<AccNo>"
Then verify TOKENMASTER table status col "A" where "<TokenNo>"

Examples:
|testCase|userAccNo|AccNo|ROI|AddROI|ROIAfterAmt|RmngIntAmt|AftrMatAmt|IntPaid|IntProvision|IntCap|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|TokenNo|Remarks|successMessage|StoreInCache|AvailableBal|ShadowBal|IntAmt|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|
|On maturity Acc Without TDS amount Payment Rejection|1012101555000239|101210105550000030|7.75|0|6.75|2250|1.0|0|0|0|0 Years, 8 Months, 0 Days|0|0|0|0|52250.00|1|Closing|Account Closing Authorized successfully.|FDPrematureClosingWithoutTDSForRejection|50000|-50000|2250|0|0|0|0|0|0|0|0|0|26|0|1|0|1|0|0|0|0|



@FDPreClosing @withDenom
Scenario Outline: FD Colsing Using Multi Loan Against FD 
Given user opens a testCase "<testCase>"
Given User is on "TD Account Premature Closing" "Menu_FDPreMatureClosingEntry"screen
When user enters accNo "<AccNo>" Fd Closing Entry screen
Then Verify CustName PeriodInMonths PeriodInDays opngDate availableBal MatAmt MatDate payableAmt of AccNo "<AccNo>"
When user click on interestInfoTab
Then Verify ROI "<ROI>" AddROI "<AddROI>" preMatROI "<preMatROI>" PreMatIntAmt "<PreMatIntAmt>" PenalIR "<PenalIR>" IntPaid "<IntPaid>" IntProvision "<IntProvision>" IntCap "<IntCap>" PreMatPeriod "<PreMatPeriod>" CashIntPayable "<CashIntPayable>"
When user click on TDSAndLoanInfoTab
Then Verify TDSDeductedAmt "<TDSDeductedAmt>" TDSAmt "<TDSAmt>" ExcessInt "<ExcessInt>" TDSRecovery "<TDSRecovery>" TotalPayable "<TotalPayable>"
When user select "<ModeOfPayableRceivableAmt>"
Then observe transaction amount "<TotalReceivableAmt>"
When user enters TokenNumber "<TokenNo>"
And user enters Remark "<Remark>"
And click on submit button on Td Closing Screen
And user click on voucherDisplayConfirm button
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "<ShadowBal>" where accNo "<AccNo>"
Then verfiy account_master table col AllBalanceCol AvailableBal "-10000" and ShadowBal "10000" where accNo "<LoanAccNo1>"
Then verfiy account_master table col AllBalanceCol AvailableBal "-10000" and ShadowBal "10000" where accNo "<LoanAccNo2>"
Then verify Transaction_Header table TRANS_AMT "<TotalPayable>"  where voucher_num "<StoreInCache>" and tranType "W" with DenomY
Then verify Child Voucher details in Transaction_Header table with Parent voucher_num "<StoreInCache>" TRANS_AMT "<TotalChildAmt>" 
Then verify Transaction_Details table TRANS_AMT "<TotalPayable>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "W"
Then verify Dr Cr amount of Child Voucher details in Transaction_Details table InTdClsong where voucher_num "<StoreInCache>"
Then Verify DepositInterestHistory Table with AccNo "<AccNo>" IntAmt "<IntAmt>" Status "E"
Then verify TOKENMASTER table status col "C" where "<TokenNo>"
Examples:
|testCase|AccNo|ROI|AddROI|preMatROI|PreMatIntAmt|PenalIR|IntPaid|IntProvision|IntCap|PreMatPeriod|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|ModeOfPayableRceivableAmt|TotalReceivableAmt|TokenNo|Remark|StoreInCache|KeyInCache|successMessage|AvailableBal|ShadowBal|IntAmt|LoanAccNo1|LoanAccNo2|TotalChildAmt|
|Pre Maturity Acc With Loan Without TDS amount|101210105550000029|7.75|0|6.75|2250|1.0|0|0|0|0 Years, 8 Months, 0 Days|0|0|0|0|0|32,250.00|Cash|32,250.00|1|Closing|FDPreMatClosingWithLoanWithoutTDS|FdClosureScreen_ModelNumber|Account closed successfully|50000|-50000|2250|101210104100000255|101210104100000254|22250.00 |
@FDPreClosing @withDenom
Scenario Outline: Multiple Loan Againt FD Closing Rejection
Given user opens a testCase "<testCase>"
Given User is on "TD Account Premature Closing" "Menu_FDPreMatClosingAuth"screen
When user select accNo "<userAccNo>" on Fd Closure Auth
Then Verify CustName PeriodInMonths PeriodInDays opngDate availableBal MatAmt MatDate payableAmt of AccNo "<AccNo>"
When user click on interestInfoTab
Then Verify ROI "<ROI>" AddROI "<AddROI>" preMatROI "<preMatROI>" PreMatIntAmt "<PreMatIntAmt>" PenalIR "<PenalIR>" IntPaid "<IntPaid>" IntProvision "<IntProvision>" IntCap "<IntCap>" PreMatPeriod "<PreMatPeriod>" CashIntPayable "<CashIntPayable>"
When user click on TDSAndLoanInfoTab
Then Verify TDSDeductedAmt "<TDSDeductedAmt>" TDSAmt "<TDSAmt>" ExcessInt "<ExcessInt>" TDSRecovery "<TDSRecovery>" TotalPayable "<TotalPayable>"
When click on Rejection button on Td Closing Screen
Then user finds successMessage "Account Closing Rejected successfully."
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "0" where accNo "<AccNo>"
Then verfiy account_master table col AllBalanceCol AvailableBal "-10000" and ShadowBal "0" where accNo "<LoanAccNo1>"
Then verfiy account_master table col AllBalanceCol AvailableBal "-10000" and ShadowBal "0" where accNo "<LoanAccNo2>"
Then verify Transaction_Header table after Rejection TRANS_AMT "<TotalPayable>"  where voucher_num "<StoreInCache>" and tranType "W" with DenomY
Then verify Child Voucher details in Transaction_Header table with Parent voucher_num "<StoreInCache>" TRANS_AMT "<TotalChildAmt>" 
Then verify Transaction_Details table TRANS_AMT "<TotalPayable>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "W"
Then verify Dr Cr amount of Child Voucher details in Transaction_Details table InTdClsong where voucher_num "<StoreInCache>"
Then Verify DepositInterestHistory Table with AccNo "<AccNo>" IntAmt "<IntAmt>" Status "R"
Then verify TOKENMASTER table status col "A" where "<TokenNo>"
Then verify AccountMaster table status "A" column and closedDate where AccNo "<AccNo>"
Then verify AccountMaster table status "A" column and closedDate where AccNo "<LoanAccNo1>"
Then verify AccountMaster table status "A" column and closedDate where AccNo "<LoanAccNo2>"
Then Verify Lien Table status col "A" with depAcc "<AccNo>" loanAcc "<LoanAccNo1>"
Then Verify Lien Table status col "A" with depAcc "<AccNo>" loanAcc "<LoanAccNo2>"
Examples:
|testCase|userAccNo|AccNo|ROI|AddROI|preMatROI|PreMatIntAmt|PenalIR|IntPaid|IntProvision|IntCap|PreMatPeriod|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|ModeOfPayableRceivableAmt|TotalReceivableAmt|TokenNo|Remark|StoreInCache|KeyInCache|successMessage|AvailableBal|ShadowBal|IntAmt|LoanAccNo1|LoanAccNo2|TotalChildAmt|
|Pre Maturity Acc With Loan Without TDS amount Rejection|1012101555000238|101210105550000029|7.75|0|6.75|2250|1.0|0|0|0|0 Years, 8 Months, 0 Days|0|0|0|0|0|32,250.00|Cash|32,250.00|1|Closing|FDPreMatClosingWithLoanWithoutTDS|FdClosureScreen_ModelNumber|Account closed successfully|50000|-50000|2250|101210104100000255|101210104100000254|22250.00 |
@FDPreClosing @withDenom
Scenario Outline: FD Colsing Using Multi Loan Against FD Auth
Given user opens a testCase "<testCase>"
Given User is on "TD Account Premature Closing" "Menu_FDPreMatureClosingEntry"screen
When user enters accNo "<AccNo>" Fd Closing Entry screen
When user click on TDSAndLoanInfoTab
When user select "Cash"
When user enters TokenNumber "<TokenNo>"
And user enters Remark "<Remark>"
And click on submit button on Td Closing Screen
And user click on voucherDisplayConfirm button
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Given User is on "TD Account Premature Closing" "Menu_FDPreMatClosingAuth"screen
When user select accNo "<userAccNo>" on Fd Closure Auth
When user click on TDSAndLoanInfoTab
And click on submit button on Td Closing Screen
And user click on voucherDisplayConfirm button
Then user finds successMessage "Account Closing Authorized successfully."
Then verfiy account_master table col AllBalanceCol AvailableBal "50000" and ShadowBal "-50000" where accNo "<AccNo>"
Then verfiy account_master table col AllBalanceCol AvailableBal "-10000" and ShadowBal "10000" where accNo "<LoanAccNo1>"
Then verfiy account_master table col AllBalanceCol AvailableBal "-10000" and ShadowBal "10000" where accNo "<LoanAccNo2>"
Then verify Transaction_Header table after Auth TRANS_AMT "<TotalPayable>"  where voucher_num "<StoreInCache>" and tranType "W" with DenomY
Then verify Child Voucher details in Transaction_Header table with Parent voucher_num "<StoreInCache>" TRANS_AMT "<TotalChildAmt>" 
Then verify Transaction_Details table TRANS_AMT "<TotalPayable>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "W"
Then verify Dr Cr amount of Child Voucher details in Transaction_Details table InTdClsong where voucher_num "<StoreInCache>"
Then Verify DepositInterestHistory Table with AccNo "<AccNo>" IntAmt "<IntAmt>" Status "E"
Then verify TOKENMASTER table status col "C" where "<TokenNo>"
Then verify AccountMaster table status "C" column and closedDate where AccNo "<AccNo>"
Then verify AccountMaster table status "C" column and closedDate where AccNo "<LoanAccNo1>"
Then verify AccountMaster table status "C" column and closedDate where AccNo "<LoanAccNo2>"
Then Verify Lien Table status col "C" with depAcc "<AccNo>" loanAcc "<LoanAccNo1>"
Then Verify Lien Table status col "C" with depAcc "<AccNo>" loanAcc "<LoanAccNo2>"
Then Verify ClosedAccount Table with AccNo "<AccNo>"
Then Verify ClosedAccount Table with AccNo "<LoanAccNo1>"
Then Verify ClosedAccount Table with AccNo "<LoanAccNo2>"
Examples:
|testCase|userAccNo|AccNo|ROI|AddROI|preMatROI|PreMatIntAmt|PenalIR|IntPaid|IntProvision|IntCap|PreMatPeriod|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|ModeOfPayableRceivableAmt|TotalReceivableAmt|TokenNo|Remark|StoreInCache|KeyInCache|successMessage|AvailableBal|ShadowBal|IntAmt|LoanAccNo1|LoanAccNo2|TotalChildAmt|
|Pre Maturity Acc With Loan Without TDS amount Auth|1012101555000238|101210105550000029|7.75|0|6.75|2250|1.0|0|0|0|0 Years, 8 Months, 0 Days|0|0|0|0|0|32,250.00|Cash|32,250.00|1|Closing|FDPreMatClosingWithLoanWithoutTDSForAuth|FdClosureScreen_ModelNumber|Account closed successfully|50000|-50000|2250|101210104100000255|101210104100000254|22250.00 |

@FDPreClosing @withDenom
Scenario Outline: Multiple Loan Against FD Colsing Payment
Given user opens a testCase "<testCase>"
Then user Enter and verify Payment screen with vouchNo "<StoreInCache>" with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then verfiy account_master table col AllBalanceCol AvailableBal "0" and ShadowBal "0" where accNo "<AccNo>"
Then verfiy account_master table col AllBalanceCol AvailableBal "0" and ShadowBal "0" where accNo "<LoanAccNo1>"
Then verfiy account_master table col AllBalanceCol AvailableBal "0" and ShadowBal "0" where accNo "<LoanAccNo2>"
Then verify Transaction_Header table after Denom TRANS_AMT "<TotalPayable>"  where voucher_num "<StoreInCache>" and tranType "W" with DenomY
Then verify Child Voucher details in Transaction_Header table with Parent voucher_num "<StoreInCache>" TRANS_AMT "<TotalChildAmt>" 
Then verify Transaction_Details table TRANS_AMT "<TotalPayable>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "W"
Then verify Dr Cr amount of Child Voucher details in Transaction_Details table InTdClsong where voucher_num "<StoreInCache>"
Then Verify DepositInterestHistory Table with AccNo "<AccNo>" IntAmt "<IntAmt>" Status "A"
Then verify AccountMaster table status "C" column and closedDate where AccNo "<AccNo>"
Then verify AccountMaster table status "C" column and closedDate where AccNo "<LoanAccNo1>"
Then verify AccountMaster table status "C" column and closedDate where AccNo "<LoanAccNo2>"
Then Verify ClosedAccount Table with AccNo "<AccNo>"
Then Verify ClosedAccount Table with AccNo "<LoanAccNo1>"
Then Verify ClosedAccount Table with AccNo "<LoanAccNo2>"
Then verify TOKENMASTER table status col "A" where "<TokenNo>"
Then Verify Lien Table status col "C" with depAcc "<AccNo>" loanAcc "<LoanAccNo1>"
Then Verify Lien Table status col "C" with depAcc "<AccNo>" loanAcc "<LoanAccNo2>"
Examples:
|testCase|userAccNo|AccNo|ROI|AddROI|ROIAfterAmt|RmngIntAmt|AftrMatAmt|IntPaid|IntProvision|IntCap|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|ModeOfPayableRceivableAmt|TotalReceivableAmt|TokenNo|Remark|StoreInCache|KeyInCache|successMessage|AvailableBal|ShadowBal|IntAmt|LoanAccNo1|LoanAccNo2|TotalChildAmt|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|
|Multiple Loans Against FD Without TDS amount Payment|1012101555000238|101210105550000029|7.75|0|3|2250|0|0|0|0|0|0|0|0|0|32250|Cash|32250.00|4|Closing|FDPreMatClosingWithLoanWithoutTDSForAuth|FdClosureScreen_ModelNumber|Account closed successfully|50000|-50000|2250|101210104100000255|101210104100000254|22250|0|0|0|0|0|0|0|0|0|16|0|0|0|0|0|0|250|0|

@FDPreClosing @setUp @withDenom
Scenario Outline: 7.Tearup
Given User Tearup automation for Parent Report
Examples:
|testCase|
||