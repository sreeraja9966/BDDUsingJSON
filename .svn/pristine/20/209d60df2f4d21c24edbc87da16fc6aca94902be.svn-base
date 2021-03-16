Feature: Fixed Deposit Closing

@FDClosing @setUp @withDenom
Scenario Outline: FixedDeposit Closing with TDS Screen Setup
Given User starts a parentReport "<parentReport>"
Then setup FixedDepositClosing Screen
Examples:
|parentReport|
|FixedDeposit Closing With TDS|

@FDClosing @withDenom
Scenario Outline: FD Closing
Given user opens a testCase "<testCase>"
Given User is on "TD Account Closing" "Menu_FDClosingEntry"screen
When user enters accNo "<AccNo>" Fd Closing Entry screen
Then Verify CustName PeriodInMonths PeriodInDays opngDate availableBal MatAmt MatDate payableAmt of AccNo "<AccNo>"
When user click on interestInfoTab
Then Verify ROI "<ROI>" AddROI "<AddROI>" ROIAfterAmt "<ROIAfterAmt>" RmngIntAmt "<RmngIntAmt>" AftrMatAmt "<AftrMatAmt>" IntPaid "<IntPaid>" IntProvision "<IntProvision>" IntCap "<IntCap>" CashIntPayable "<CashIntPayable>"
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
Then verify TDSDEDUCTEDDETAILS table status "E" intAmt "<IntAmt>" tdsAmt "<TDSAmt>" TransCode "IntTDSAmount" where accNo "<AccNo>"
Examples:
|testCase|AccNo|ROI|AddROI|ROIAfterAmt|RmngIntAmt|AftrMatAmt|IntPaid|IntProvision|IntCap|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|ModeOfPayableRceivableAmt|TotalReceivableAmt|TokenNo|Remark|StoreInCache|KeyInCache|successMessage|AvailableBal|ShadowBal|IntAmt|
|On maturity Acc With TDS amount|101210105100000264|7.75|0|3|3850|0|0|0|0|0|0|385|0|0|53,465.00|Cash|53,465.00|1|Closing|FDClosingWithTDS|FdClosureScreen_ModelNumber|Account closed successfully|50000|-50000|3850|
|After Maturity Acc With TDS amount|101210105550000026|7.75|0|3|3850|137.206849|0|0|0|0|0|398.721|0|0|53,588.49|Cash|53,588.49|2|Closing|AfterMatFDClosingWithTDS|FdClosureScreen_ModelNumber|Account closed successfully|50000|-50000|3,987.21|

@FDClosing @withDenom
Scenario Outline: FD Closing Rejection
Given user opens a testCase "<testCase>"
Given User is on "TD Account Closing Auth" "Menu_FDClosingAuth"screen
When user select accNo "<userAccNo>" on Fd Closure Auth
Then Verify CustName PeriodInMonths PeriodInDays opngDate availableBal MatAmt MatDate payableAmt of AccNo "<AccNo>"
When user click on interestInfoTab
Then Verify ROI "<ROI>" AddROI "<AddROI>" ROIAfterAmt "<ROIAfterAmt>" RmngIntAmt "<RmngIntAmt>" AftrMatAmt "<AftrMatAmt>" IntPaid "<IntPaid>" IntProvision "<IntProvision>" IntCap "<IntCap>" CashIntPayable "<CashIntPayable>"
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
Then verify TDSDEDUCTEDDETAILS table status "R" intAmt "<IntAmt>" tdsAmt "<TDSAmt>" TransCode "IntTDSAmount" where accNo "<AccNo>"
Examples:
|testCase|userAccNo|AccNo|ROI|AddROI|ROIAfterAmt|RmngIntAmt|AftrMatAmt|IntPaid|IntProvision|IntCap|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|TokenNo|Remarks|successMessage|StoreInCache|AvailableBal|ShadowBal|IntAmt|
|On maturity Acc With TDS amount Rejection|1012101510000265|101210105100000264|7.75|0|3|3850|0|0|0|0|0|0|385|0|0|53,465.00|1|Closing|Account Closing Rejected successfully.|FDClosingWithTDS|50000|0|3850|
|After Maturity Acc With TDS amount Rejection|1012101555000235|101210105550000026|7.75|0|3|3850|137.206849|0|0|0|0|0|398.721|0|0|53,588.49|2|Closing|Account Closing Rejected successfully.|AfterMatFDClosingWithTDS|50000|0|3987.21|

@FDClosing @withDenom
Scenario Outline: FD Colsing Auth
Given user opens a testCase "<testCase>"
Given User is on "TD Account Closing" "Menu_FDClosingEntry"screen
When user enters accNo "<AccNo>" Fd Closing Entry screen
When user enters TokenNumber "<TokenNo>"
And user enters Remark "<Remarks>"
And click on submit button on Td Closing Screen
And user click on voucherDisplayConfirm button
Then store number on model with name "<StoreInCache>" and "FdClosureScreen_ModelNumber"
Then user finds successMessage "Account closed successfully"
Given User is on "TD Account Closing" "Menu_FDClosingAuth"screen
When user select accNo "<userAccNo>" on Fd Closure Auth
Then Verify CustName PeriodInMonths PeriodInDays opngDate availableBal MatAmt MatDate payableAmt of AccNo "<AccNo>"
When user click on interestInfoTab
Then Verify ROI "<ROI>" AddROI "<AddROI>" ROIAfterAmt "<ROIAfterAmt>" RmngIntAmt "<RmngIntAmt>" AftrMatAmt "<AftrMatAmt>" IntPaid "<IntPaid>" IntProvision "<IntProvision>" IntCap "<IntCap>" CashIntPayable "<CashIntPayable>"
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
Then verify TDSDEDUCTEDDETAILS table status "E" intAmt "<IntAmt>" tdsAmt "<TDSAmt>" TransCode "IntTDSAmount" where accNo "<AccNo>"

Examples:
|testCase|userAccNo|AccNo|ROI|AddROI|ROIAfterAmt|RmngIntAmt|AftrMatAmt|IntPaid|IntProvision|IntCap|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|TokenNo|Remarks|successMessage|StoreInCache|AvailableBal|ShadowBal|IntAmt|
|On maturity Acc With TDS amount Entry & Auth|1012101510000265|101210105100000264|7.75|0|3|3850|0|0|0|0|0|0|385|0|0|53,465.00|1|Closing|Account Closing Authorized successfully.|FDClosingWithTDSForauth|50000|-50000|3850|
|After Maturity Acc With TDS amount Entry & Auth|1012101555000235|101210105550000026|7.75|0|3|3850|137.206849|0|0|0|0|0|398.721|0|0|53,588.49|2|Closing|Account Closing Authorized successfully.|AfterMatFDClosingWithTDSForauth|50000|-50000|3987.21|

@FDClosing @withDenom
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
Then verify TDSDEDUCTEDDETAILS table status "A" intAmt "<IntAmt>" tdsAmt "<TDSAmt>" TransCode "IntTDSAmount" where accNo "<AccNo>"
Examples:
|testCase|userAccNo|AccNo|ROI|AddROI|ROIAfterAmt|RmngIntAmt|AftrMatAmt|IntPaid|IntProvision|IntCap|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|TokenNo|Remarks|successMessage|StoreInCache|AvailableBal|ShadowBal|IntAmt|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|
|On maturity Acc With TDS amount Payment|1012101510000265|101210105100000264|7.75|0|3|3850|0|0|0|0|0|0|385|0|0|53,465.00|1|Closing|Account Closing Authorized successfully.|FDClosingWithTDSForauth|50000|-50000|3850|0|0|0|0|0|0|0|0|0|26|2|0|0|0|0|0|465|0|
|After Maturity Acc With TDS amount Payment|1012101555000235|101210105550000026|7.75|0|3|3850|137.206849|0|0|0|0|0|398.721|0|0|53,588.49|2|Closing|Account Closing Authorized successfully.|AfterMatFDClosingWithTDSForauth|50000|-50000|3987.21|0|0|0|0|0|0|0|0|0|26|2|0|0|0|0|0|588|49|


@FDClosing @withDenom
Scenario Outline: FD Colsing Payment Rejection
Given user opens a testCase "<testCase>"
Given User is on "TD Account Closing" "Menu_FDClosingEntry"screen
When user enters accNo "<AccNo>" Fd Closing Entry screen
When user enters TokenNumber "<TokenNo>"
And user enters Remark "<Remarks>"
And click on submit button on Td Closing Screen
And user click on voucherDisplayConfirm button
Then store number on model with name "<StoreInCache>" and "FdClosureScreen_ModelNumber"
Then user finds successMessage "Account closed successfully"
Given User is on "TD Account Closing" "Menu_FDClosingAuth"screen
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
|On maturity Acc Without TDS amount Payment Rejection|1012101520000240|101210105200000227|7.75|0|3|3875|0|0|0|0|0|0|0|0|0|53,875.00|1|Closing|Account Closing Authorized successfully.|FDClosingWithoutTDSForauth|50000|-50000|3875|0|0|0|0|0|0|0|0|0|26|2|0|0|0|0|0|875|0|

##########################
@FDClosing @withDenom
Scenario Outline: FD Colsing Using Loan Against FD 
Given user opens a testCase "<testCase>"
Given User is on "TD Account Closing" "Menu_FDClosingEntry"screen
When user enters accNo "<AccNo>" Fd Closing Entry screen
Then Verify CustName PeriodInMonths PeriodInDays opngDate availableBal MatAmt MatDate payableAmt of AccNo "<AccNo>"
When user click on interestInfoTab
Then Verify ROI "<ROI>" AddROI "<AddROI>" ROIAfterAmt "<ROIAfterAmt>" RmngIntAmt "<RmngIntAmt>" AftrMatAmt "<AftrMatAmt>" IntPaid "<IntPaid>" IntProvision "<IntProvision>" IntCap "<IntCap>" CashIntPayable "<CashIntPayable>"
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
Then verfiy account_master table col AllBalanceCol AvailableBal "-10000" and ShadowBal "10000" where accNo "<LoanAccNo>"
Then verify Transaction_Header table TRANS_AMT "<TotalPayable>"  where voucher_num "<StoreInCache>" and tranType "W" with DenomY
Then verify Child Voucher details in Transaction_Header table with Parent voucher_num "<StoreInCache>" TRANS_AMT "<TotalChildAmt>" 
Then verify Transaction_Details table TRANS_AMT "<TotalPayable>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "W"
Then verify Dr Cr amount of Child Voucher details in Transaction_Details table InTdClsong where voucher_num "<StoreInCache>"
Then Verify DepositInterestHistory Table with AccNo "<AccNo>" IntAmt "<IntAmt>" Status "E"
Then verify TOKENMASTER table status col "C" where "<TokenNo>"
Examples:
|testCase|AccNo|ROI|AddROI|ROIAfterAmt|RmngIntAmt|AftrMatAmt|IntPaid|IntProvision|IntCap|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|ModeOfPayableRceivableAmt|TotalReceivableAmt|TokenNo|Remark|StoreInCache|KeyInCache|successMessage|AvailableBal|ShadowBal|IntAmt|LoanAccNo|TotalChildAmt|
|Loan Against FD Without TDS amount Entry|101210105100000262|8.25|0.5|3|4097|0|0|0|0|0|0|0|0|0|43,597.00|Cash|43,597.00|4|Closing|LoanAgaintFDClosingWithoutTDS|FdClosureScreen_ModelNumber|Account closed successfully|50000|-50000|4097|101210104100000246|15097|
@FDClosing @withDenom
Scenario Outline:  Loan Againt FD Closing Rejection
Given user opens a testCase "<testCase>"
Given User is on "TD Account Closing" "Menu_FDClosingAuth"screen
When user select accNo "<userAccNo>" on Fd Closure Auth
Then Verify CustName PeriodInMonths PeriodInDays opngDate availableBal MatAmt MatDate payableAmt of AccNo "<AccNo>"
When user click on interestInfoTab
Then Verify ROI "<ROI>" AddROI "<AddROI>" ROIAfterAmt "<ROIAfterAmt>" RmngIntAmt "<RmngIntAmt>" AftrMatAmt "<AftrMatAmt>" IntPaid "<IntPaid>" IntProvision "<IntProvision>" IntCap "<IntCap>" CashIntPayable "<CashIntPayable>"
When user click on TDSAndLoanInfoTab
Then Verify TDSDeductedAmt "<TDSDeductedAmt>" TDSAmt "<TDSAmt>" ExcessInt "<ExcessInt>" TDSRecovery "<TDSRecovery>" TotalPayable "<TotalPayable>"
When click on Rejection button on Td Closing Screen
Then user finds successMessage "Account Closing Rejected successfully."
Then verfiy account_master table col AllBalanceCol AvailableBal "<AvailableBal>" and ShadowBal "0" where accNo "<AccNo>"
Then verfiy account_master table col AllBalanceCol AvailableBal "-10000" and ShadowBal "0" where accNo "<LoanAccNo>"
Then verify Transaction_Header table after Rejection TRANS_AMT "<TotalPayable>"  where voucher_num "<StoreInCache>" and tranType "W" with DenomY
Then verify Child Voucher details in Transaction_Header table with Parent voucher_num "<StoreInCache>" TRANS_AMT "<TotalChildAmt>" 
Then verify Transaction_Details table TRANS_AMT "<TotalPayable>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "W"
Then verify Dr Cr amount of Child Voucher details in Transaction_Details table InTdClsong where voucher_num "<StoreInCache>"
Then Verify DepositInterestHistory Table with AccNo "<AccNo>" IntAmt "<IntAmt>" Status "R"
Then verify TOKENMASTER table status col "A" where "<TokenNo>"
Then verify AccountMaster table status "A" column and closedDate where AccNo "<AccNo>"
Then verify AccountMaster table status "A" column and closedDate where AccNo "<LoanAccNo>"
Then Verify Lien Table status col "A" with depAcc "<AccNo>" loanAcc "<LoanAccNo>"
Examples:
|testCase|userAccNo|AccNo|ROI|AddROI|ROIAfterAmt|RmngIntAmt|AftrMatAmt|IntPaid|IntProvision|IntCap|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|ModeOfPayableRceivableAmt|TotalReceivableAmt|TokenNo|Remark|StoreInCache|KeyInCache|successMessage|AvailableBal|ShadowBal|IntAmt|LoanAccNo|TotalChildAmt|
|Loan Against FD Without TDS amount Rejection|1012101510000263|101210105100000262|8.25|0.5|3|4097|0|0|0|0|0|0|0|0|0|43,597.00|Cash|43,597.00|4|Closing|LoanAgaintFDClosingWithoutTDS|FdClosureScreen_ModelNumber|Account closed successfully|50000|-50000|4097|101210104100000246|15097|

@FDClosing @withDenom
Scenario Outline: FD Colsing Using Loan Against FD Entry & Auth
Given user opens a testCase "<testCase>"
Given User is on "TD Account Closing" "Menu_FDClosingEntry"screen
When user enters accNo "<AccNo>" Fd Closing Entry screen
When user click on TDSAndLoanInfoTab
When user select "<ModeOfPayableRceivableAmt>"
When user enters TokenNumber "<TokenNo>"
And user enters Remark "<Remark>"
And click on submit button on Td Closing Screen
And user click on voucherDisplayConfirm button
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Given User is on "TD Account Closing" "Menu_FDClosingAuth"screen
When user select accNo "<userAccNo>" on Fd Closure Auth
When user click on TDSAndLoanInfoTab
And click on submit button on Td Closing Screen
And user click on voucherDisplayConfirm button
Then user finds successMessage "Account Closing Authorized successfully."
Then verfiy account_master table col AllBalanceCol AvailableBal "50000" and ShadowBal "-50000" where accNo "<AccNo>"
Then verfiy account_master table col AllBalanceCol AvailableBal "-10000" and ShadowBal "10000" where accNo "<LoanAccNo>"
Then verify Transaction_Header table after Auth TRANS_AMT "<TotalPayable>"  where voucher_num "<StoreInCache>" and tranType "W" with DenomY
Then verify Child Voucher details in Transaction_Header table with Parent voucher_num "<StoreInCache>" TRANS_AMT "<TotalChildAmt>" 
Then verify Transaction_Details table TRANS_AMT "<TotalPayable>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "W"
Then verify Dr Cr amount of Child Voucher details in Transaction_Details table InTdClsong where voucher_num "<StoreInCache>"
Then Verify DepositInterestHistory Table with AccNo "<AccNo>" IntAmt "<IntAmt>" Status "E"
Then verify TOKENMASTER table status col "C" where "<TokenNo>"
Then verify AccountMaster table status "C" column and closedDate where AccNo "<AccNo>"
Then verify AccountMaster table status "C" column and closedDate where AccNo "<LoanAccNo>"
Then Verify Lien Table status col "C" with depAcc "<AccNo>" loanAcc "<LoanAccNo>"
Then verify AccountMaster table status "C" column and closedDate where AccNo "<AccNo>"
Then verify AccountMaster table status "C" column and closedDate where AccNo "<LoanAccNo>"
Examples:
|testCase|userAccNo|AccNo|ROI|AddROI|ROIAfterAmt|RmngIntAmt|AftrMatAmt|IntPaid|IntProvision|IntCap|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|ModeOfPayableRceivableAmt|TotalReceivableAmt|TokenNo|Remark|StoreInCache|KeyInCache|successMessage|AvailableBal|ShadowBal|IntAmt|LoanAccNo|TotalChildAmt|
|Loan Against FD Without TDS amount Entry & Auth|1012101510000263|101210105100000262|8.25|0.5|3|4097|0|0|0|0|0|0|0|0|0|43,597.00|Cash|43,597.00|4|Closing|LoanAgaintFDClosingWithoutTDS|FdClosureScreen_ModelNumber|Account closed successfully|50000|-50000|4097|101210104100000246|15097|

@FDClosing @withDenom
Scenario Outline: Loan Against FD Colsing Payment
Given user opens a testCase "<testCase>"
Then user Enter and verify Payment screen with vouchNo "<StoreInCache>" with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>"
Then verfiy account_master table col AllBalanceCol AvailableBal "0" and ShadowBal "0" where accNo "<AccNo>"
Then verfiy account_master table col AllBalanceCol AvailableBal "0" and ShadowBal "0" where accNo "<LoanAccNo>"
Then verify Transaction_Header table after Denom TRANS_AMT "<TotalPayable>"  where voucher_num "<StoreInCache>" and tranType "W" with DenomY
Then verify Child Voucher details in Transaction_Header table with Parent voucher_num "<StoreInCache>" TRANS_AMT "<TotalChildAmt>" 
Then verify Transaction_Details table TRANS_AMT "<TotalPayable>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "W"
Then verify Dr Cr amount of Child Voucher details in Transaction_Details table InTdClsong where voucher_num "<StoreInCache>"
Then Verify DepositInterestHistory Table with AccNo "<AccNo>" IntAmt "<IntAmt>" Status "A"
Then verify AccountMaster table status "C" column and closedDate where AccNo "<AccNo>"
Then verify AccountMaster table status "C" column and closedDate where AccNo "<LoanAccNo>"
Then Verify ClosedAccount Table with AccNo "<AccNo>"
Then Verify ClosedAccount Table with AccNo "<LoanAccNo>"
Then verify TOKENMASTER table status col "A" where "<TokenNo>"
Then Verify Lien Table status col "C" with depAcc "<AccNo>" loanAcc "<LoanAccNo>"
Examples:
|testCase|userAccNo|AccNo|ROI|AddROI|ROIAfterAmt|RmngIntAmt|AftrMatAmt|IntPaid|IntProvision|IntCap|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|ModeOfPayableRceivableAmt|TotalReceivableAmt|TokenNo|Remark|StoreInCache|KeyInCache|successMessage|AvailableBal|ShadowBal|IntAmt|LoanAccNo|TotalChildAmt|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|
|Loan Against FD Without TDS amount Payment|1012101510000263|101210105100000262|8.25|0.5|3|4097|0|0|0|0|0|0|0|0|0|43,597.00|Cash|43,597.00|4|Closing|LoanAgaintFDClosingWithoutTDS|FdClosureScreen_ModelNumber|Account closed successfully|50000|-50000|4097|101210104100000246|15097|0|0|0|0|0|0|0|0|0|21|3|0|0|0|0|0|97|0|
@FDClosing @withDenom
Scenario Outline: Loan Against FD Colsing Payment Rejection
Given user opens a testCase "<testCase>"
Given User is on "TD Account Closing" "Menu_FDClosingEntry"screen
When user enters accNo "<AccNo>" Fd Closing Entry screen
When user click on TDSAndLoanInfoTab
When user select "<ModeOfPayableRceivableAmt>"
When user enters TokenNumber "<TokenNo>"
And user enters Remark "<Remark>"
And click on submit button on Td Closing Screen
And user click on voucherDisplayConfirm button
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "Account closed successfully"
Given User is on "TD Account Closing" "Menu_FDClosingAuth"screen
When user select accNo "<userAccNo>" on Fd Closure Auth
When user click on TDSAndLoanInfoTab
And click on submit button on Td Closing Screen
And user click on voucherDisplayConfirm button
Then user finds successMessage "Account Closing Authorized successfully."
Then user Enter and verify Payment screen with vouchNo "<StoreInCache>" with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>" while Reject
Then Verify UserwiseDenom table with "<2000FromDenom>" "<500FromDenom>" "<200FromDenom>" "<100FromDenom>" "<50FromDenom>" "<20FromDenom>" "<10FromDenom>" "<1FromDenom>" "<PaiseFromDenom>" "<2000ToDenom>" "<500ToDenom>" "<200ToDenom>" "<100ToDenom>" "<50ToDenom>" "<20ToDenom>" "<10ToDenom>" "<1ToDenom>" "<PaiseToDenom>" while Reject
Then verfiy account_master table col AllBalanceCol AvailableBal "50000" and ShadowBal "0" where accNo "<AccNo>"
Then verfiy account_master table col AllBalanceCol AvailableBal "-10000" and ShadowBal "0" where accNo "<LoanAccNo>"
Then verify Transaction_Header table after Rejection TRANS_AMT "<TotalPayable>"  where voucher_num "<StoreInCache>" and tranType "W" with DenomY
Then verify Child Voucher details in Transaction_Header table with Parent voucher_num "<StoreInCache>" TRANS_AMT "<TotalChildAmt>" 
Then verify Transaction_Details table TRANS_AMT "<TotalPayable>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "W"
Then verify Dr Cr amount of Child Voucher details in Transaction_Details table InTdClsong where voucher_num "<StoreInCache>"
Then Verify DepositInterestHistory Table with AccNo "<AccNo>" IntAmt "<IntAmt>" Status "R"
Then verify AccountMaster table status "A" column and closedDate where AccNo "<AccNo>"
Then verify AccountMaster table status "A" column and closedDate where AccNo "<LoanAccNo>"
Then Verify ClosedAccount Table with AccNo "<AccNo>"
Then Verify ClosedAccount Table with AccNo "<LoanAccNo>"
Then verify TOKENMASTER table status col "A" where "<TokenNo>"
Then Verify Lien Table status col "A" with depAcc "<AccNo>" loanAcc "<LoanAccNo>"
Examples:
|testCase|userAccNo|AccNo|ROI|AddROI|ROIAfterAmt|RmngIntAmt|AftrMatAmt|IntPaid|IntProvision|IntCap|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|ModeOfPayableRceivableAmt|TotalReceivableAmt|TokenNo|Remark|StoreInCache|KeyInCache|successMessage|AvailableBal|ShadowBal|IntAmt|LoanAccNo|TotalChildAmt|2000FromDenom|500FromDenom|200FromDenom|100FromDenom|50FromDenom|20FromDenom|10FromDenom|1FromDenom|PaiseFromDenom|2000ToDenom|500ToDenom|200ToDenom|100ToDenom|50ToDenom|20ToDenom|10ToDenom|1ToDenom|PaiseToDenom|
|Loan Against FD Without TDS amount Payment Rejection|1012101510000263|101210105100000262|8.25|0.5|3|4097|0|0|0|0|0|0|0|0|0|43,597.00|Cash|43,597.00|4|Closing|LoanAgaintFDClosingWithoutTDSPaymentRejection|FdClosureScreen_ModelNumber|Account closed successfully|50000|-50000|4097|101210104100000246|15097|0|0|0|0|0|0|0|0|0|21|3|0|0|0|0|0|97|0|



@FDClosing @withDenom
Scenario Outline: FD Colsing Using Multi Loan Against FD 
Given user opens a testCase "<testCase>"
Given User is on "TD Account Closing" "Menu_FDClosingEntry"screen
When user enters accNo "<AccNo>" Fd Closing Entry screen
Then Verify CustName PeriodInMonths PeriodInDays opngDate availableBal MatAmt MatDate payableAmt of AccNo "<AccNo>"
When user click on interestInfoTab
Then Verify ROI "<ROI>" AddROI "<AddROI>" ROIAfterAmt "<ROIAfterAmt>" RmngIntAmt "<RmngIntAmt>" AftrMatAmt "<AftrMatAmt>" IntPaid "<IntPaid>" IntProvision "<IntProvision>" IntCap "<IntCap>" CashIntPayable "<CashIntPayable>"
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
|testCase|AccNo|ROI|AddROI|ROIAfterAmt|RmngIntAmt|AftrMatAmt|IntPaid|IntProvision|IntCap|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|ModeOfPayableRceivableAmt|TotalReceivableAmt|TokenNo|Remark|StoreInCache|KeyInCache|successMessage|AvailableBal|ShadowBal|IntAmt|LoanAccNo1|LoanAccNo2|TotalChildAmt|
|Multiple Loans Against FD Without TDS amount Entry|101210105100000263|8.25|0.5|3|4097|0|0|0|0|0|0|0|0|0|34,097.00|Cash|34,097.00|4|Closing|MultiLoanAgaintFDClosingWithoutTDS|FdClosureScreen_ModelNumber|Account closed successfully|50000|-50000|4097|101210104100000247|101210104100000248|24097|
@FDClosing @withDenom
Scenario Outline: Multiple Loan Againt FD Closing Rejection
Given user opens a testCase "<testCase>"
Given User is on "TD Account Closing" "Menu_FDClosingAuth"screen
When user select accNo "<userAccNo>" on Fd Closure Auth
Then Verify CustName PeriodInMonths PeriodInDays opngDate availableBal MatAmt MatDate payableAmt of AccNo "<AccNo>"
When user click on interestInfoTab
Then Verify ROI "<ROI>" AddROI "<AddROI>" ROIAfterAmt "<ROIAfterAmt>" RmngIntAmt "<RmngIntAmt>" AftrMatAmt "<AftrMatAmt>" IntPaid "<IntPaid>" IntProvision "<IntProvision>" IntCap "<IntCap>" CashIntPayable "<CashIntPayable>"
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
|testCase|userAccNo|AccNo|ROI|AddROI|ROIAfterAmt|RmngIntAmt|AftrMatAmt|IntPaid|IntProvision|IntCap|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|ModeOfPayableRceivableAmt|TotalReceivableAmt|TokenNo|Remark|StoreInCache|KeyInCache|successMessage|AvailableBal|ShadowBal|IntAmt|LoanAccNo1|LoanAccNo2|TotalChildAmt|
|Multiple Loans Against FD Without TDS amount Rejection|1012101510000264|101210105100000263|8.25|0.5|3|4097|0|0|0|0|0|0|0|0|0|34,097.00|Cash|34,097.00|4|Closing|MultiLoanAgaintFDClosingWithoutTDS|FdClosureScreen_ModelNumber|Account closed successfully|50000|-50000|4097|101210104100000247|101210104100000248|24097|

@FDClosing @withDenom
Scenario Outline: FD Colsing Using Multi Loan Against FD Auth
Given user opens a testCase "<testCase>"
Given User is on "TD Account Closing" "Menu_FDClosingEntry"screen
When user enters accNo "<AccNo>" Fd Closing Entry screen
When user click on TDSAndLoanInfoTab
When user select "Cash"
When user enters TokenNumber "<TokenNo>"
And user enters Remark "<Remark>"
And click on submit button on Td Closing Screen
And user click on voucherDisplayConfirm button
Then store number on model with name "<StoreInCache>" and "<KeyInCache>"
Then user finds successMessage "<successMessage>"
Given User is on "TD Account Closing" "Menu_FDClosingAuth"screen
When user select accNo "<userAccNo>" on Fd Closure Auth
When user click on TDSAndLoanInfoTab
And click on submit button on Td Closing Screen
And user click on voucherDisplayConfirm button
Then user finds successMessage "Account Closing Authorized successfully."
Then verfiy account_master table col AllBalanceCol AvailableBal "0" and ShadowBal "0" where accNo "<AccNo>"
Then verfiy account_master table col AllBalanceCol AvailableBal "0" and ShadowBal "0" where accNo "<LoanAccNo1>"
Then verfiy account_master table col AllBalanceCol AvailableBal "0" and ShadowBal "0" where accNo "<LoanAccNo2>"
Then verify Transaction_Header table after Auth TRANS_AMT "<TotalPayable>"  where voucher_num "<StoreInCache>" and tranType "W" with DenomY
Then verify Child Voucher details in Transaction_Header table with Parent voucher_num "<StoreInCache>" TRANS_AMT "<TotalChildAmt>" 
Then verify Transaction_Details table TRANS_AMT "<TotalPayable>" accNo "<AccNo>"  where voucher_num "<StoreInCache>" and tranType "W"
Then verify Dr Cr amount of Child Voucher details in Transaction_Details table InTdClsong where voucher_num "<StoreInCache>"
Then Verify DepositInterestHistory Table with AccNo "<AccNo>" IntAmt "<IntAmt>" Status "A"
Then verify TOKENMASTER table status col "A" where "<TokenNo>"
Then verify AccountMaster table status "C" column and closedDate where AccNo "<AccNo>"
Then verify AccountMaster table status "C" column and closedDate where AccNo "<LoanAccNo1>"
Then verify AccountMaster table status "C" column and closedDate where AccNo "<LoanAccNo2>"
Then Verify Lien Table status col "C" with depAcc "<AccNo>" loanAcc "<LoanAccNo1>"
Then Verify Lien Table status col "C" with depAcc "<AccNo>" loanAcc "<LoanAccNo2>"
Then Verify ClosedAccount Table with AccNo "<AccNo>"
Then Verify ClosedAccount Table with AccNo "<LoanAccNo1>"
Then Verify ClosedAccount Table with AccNo "<LoanAccNo2>"
Examples:
|testCase|userAccNo|AccNo|ROI|AddROI|ROIAfterAmt|RmngIntAmt|AftrMatAmt|IntPaid|IntProvision|IntCap|CashIntPayable|TDSDeductedAmt|TDSAmt|ExcessInt|TDSRecovery|TotalPayable|ModeOfPayableRceivableAmt|TotalReceivableAmt|TokenNo|Remark|StoreInCache|KeyInCache|successMessage|AvailableBal|ShadowBal|IntAmt|LoanAccNo1|LoanAccNo2|TotalChildAmt|
|Multiple Loans Against FD Without TDS amount Entry & Auth|1012101510000264|101210105100000263|8.25|0.5|3|4097|0|0|0|0|0|0|0|0|0|34,097.00|Cash|34,097.00|4|Closing|MultiLoanAgaintFDClosingWithoutTDSForAuth|FdClosureScreen_ModelNumber|Account closed successfully|50000|-50000|4097|101210104100000247|101210104100000248|24097|

@FDClosing @withDenom
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
|Multiple Loans Against FD Without TDS amount Payment|1012101510000264|101210105100000263|8.25|0.5|3|4097|0|0|0|0|0|0|0|0|0|34,097.00|Cash|34,097.00|4|Closing|MultiLoanAgaintFDClosingWithoutTDSForAuth|FdClosureScreen_ModelNumber|Account closed successfully|50000|-50000|4097|101210104100000247|101210104100000248|24097|0|0|0|0|0|0|0|0|0|17|0|0|0|0|0|0|97|0|

@FDClosing @setUp @withDenom
Scenario Outline: 7.Tearup
Given User Tearup automation for Parent Report
Examples:
|testCase|
||