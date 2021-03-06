Feature: Fixed Deposit Renewal
@FDRenewal @setUp @withDenom
Scenario Outline: FixedDeposit Renewal Screen Setup
Given user opens a testCase
Examples:
||

@FDRenewalJson
Scenario Outline: FD Renewal with old number entry
Given user opens a testCase "<testCase>"
Given user opens a scenario for FD Renewal "<testCase>"
Given User is on "TD Account Renewal" "Menu_FDRenewalEntry"screen
When user enters accNo Fd Renewal Entry screen
Then Verify CustName PeriodInMonths PeriodInDays opngDate availableBal MatAmt MatDate payableAmt of AccNo 
When user click on interestInfoTab on Fd Renewal Entry screen
Then Verify ROI AddROI ROIAfterAmt RmngIntAmt AftrMatAmt IntPaid IntProvision IntCap CashIntPayable
When user click on TDSAndLoanInfoTab on Fd Renewal Entry screen
Then Verify TDSDeductedAmt TDSAmt ExcessInt TDSRecovery TotalPayable on Fd Renewal Entry screen
When user click on addRenualDetails on Fd Renewal Entry screen
When user select Renewal Product from dropdown on Fd Renewal Entry screen
And user enter renewal Amount on Fd Renewal Entry screen
And select the option of Renewal accoutn option on Fd Renewal Entry screen
Then verify renewal Date on Fd Renewal Entry screen
When enter renewal DepositPeriod in months on Fd Renewal Entry screen
And enter renewal DepositPeriod in days on Fd Renewal Entry screen
Then verify following renewal details RenewalROI RenewalAddtROI RenewalNewMatAmt RenewalMatDate on Fd Renewal Entry screen 
Then verify payable amount on Fd Renewal Entry screen
When user select ModeOfPayableRceivableAmt on Fd Renewal Entry screen
Then observe transaction amount on Fd Renewal Entry screen
When user enters TokenNumber on Fd Renewal Entry screen
And user enters Remark on Fd Renewal Entry screen
And click on submit button on Td Closing Screen on Fd Renewal Entry screen
And user click on voucherDisplayConfirm button
Then store number on model with name "<scenario>" and "FDRenewalScreen_ModelNumber"
Then store number on model with name "<renewalCacheForNew>" and "FDRenewalScreen_ModelRenewalNumber"
Then user finds successMessage on Fd Renewal Entry screen  
Then verfiy account_master table for FD Renewal at level "entry"
Then verify Transaction_Header table for FD Renewal at level "entry"
Then verify Transaction_Details table for FD Renewal at level "entry"
Then Verify DepositInterestHistory Table for FD Renewal at level "entry"
Then verify TOKENMASTER table for FD Renewal at level "entry"
Examples:
|testCase|scenario|renewalCacheForNew|
|Renewal With Account Wise 12M Using Cash|RenewalWithAccountWise12MUsingCash|RenewalWithAccountWise12MUsingCashrenewalCacheForNew|
|Renewal With New Account 12M Using Cash Entry|RenewalWithNewAccount12MUsingCash|RenewalWithNewAccount12MUsingCashrenewalCacheForNew|
|Renewal Simple Quterly Account Using Cash with Old account Entry|RenewalSimpleQuterlyAccountUsingCashWithOldAccount|RenewalSimpleQuterlyAccountUsingCashWithOldAccountForNew|
|Renewal Simple HalfYearly Account Using Cash with Old account Entry|RenewalSimpleHalfYearlyAccountUsingCashWithOldAccount|RenewalSimpleHalfYearlyAccountUsingCashWithOldAccountForNew|
|Renewal Simple On-Maturity Account Using Cash with Old account Entry|RenewalSimpleOnMaturityAccountUsingCashWithOldAccount|RenewalSimpleOnMaturityAccountUsingCashWithOldAccountForNew|
|Renewal Simple Quterly Account Using Cash with Entry as Compound Quterly New Account|RenewalSimpleQuterlyAccountUsingCashwithEntryasNewAccount|RenewalSimpleQuterlyAccountUsingCashwithEntryasNewAccountCacheForNew|
|Renewal Simple Halyearly Account Using Cash with Entry as Compound Quterly New Account|RenewalSimpleHalyearlyAccountUsingCashwithEntryasNewAccount|RenewalSimpleHalyearlyAccountUsingCashwithEntryasNewAccountCacheForNew|
|Renewal Simple On-Maturity Account Using Cash with Entry as Compound Quterly New Account|RenewalSimpleOnMaturityAccountUsingCashwithEntryasNewAccount|RenewalSimpleOnMaturityAccountUsingCashwithEntryasNewAccountCacheForNew|
@FDRenewalJson
Scenario Outline: FD Renewal with old number Auth
Given user opens a testCase "<testCase>"
Given user opens a scenario for FD Renewal "<testCase>"
Given User is on "TD Account Renewal" "Menu_FDRenewalAuth"screen
When user select the accNO from dropdown of FD Renewal Auth screen
Then Verify CustName PeriodInMonths PeriodInDays opngDate availableBal MatAmt MatDate payableAmt of AccNo
When user click on interestInfoTab on Fd Renewal Entry screen
Then Verify ROI AddROI ROIAfterAmt RmngIntAmt AftrMatAmt IntPaid IntProvision IntCap CashIntPayable
When user click on TDSAndLoanInfoTab on Fd Renewal Entry screen
Then Verify TDSDeductedAmt TDSAmt ExcessInt TDSRecovery TotalPayable on Fd Renewal Entry screen
When user click on addRenualDetails on Fd Renewal Entry screen
Then verify following renewal details RenewalROI RenewalAddtROI RenewalNewMatAmt RenewalMatDate on Fd Renewal Entry screen
Then verify renewal Date on Fd Renewal Entry screen
Then observe transaction amount on Fd Renewal Entry screen
And click on submit button on Td Closing Screen on Fd Renewal Entry screen
And user click on voucherDisplayConfirm button
Then user finds successMessage on Fd Renewal Entry screen  
Then verfiy account_master table for FD Renewal at level "Auth"
Then verify Transaction_Header table for FD Renewal at level "Auth"
Then verify Transaction_Details table for FD Renewal at level "Auth"
Then Verify DepositInterestHistory Table for FD Renewal at level "Auth"
Then verify TOKENMASTER table for FD Renewal at level "Auth"
Then Verify Payment Screen Flow
Then verfiy account_master table for FD Renewal at level "payment"
Then verify Transaction_Header table for FD Renewal at level "payment"
Then verify Transaction_Details table for FD Renewal at level "payment"
Then Verify DepositInterestHistory Table for FD Renewal at level "payment"
Then verify TOKENMASTER table for FD Renewal at level "payment"
Then Verify Closed Account Table
Examples:
|testCase|
|Renewal With Account Wise 12M Using Cash Auth|
|Renewal With New Account 12M Using Cash Auth|
|Renewal Simple Quterly Account Using Cash with Old account Auth|
|Renewal Simple HalfYearly Account Using Cash with Old account Auth|
|Renewal Simple On-Maturity Account Using Cash with Old account Auth|
|Renewal Simple Quterly Account Using Cash with Entry as Compound Quterly New Account Auth|
|Renewal Simple Halyearly Account Using Cash with Entry as Compound Quterly New Account Auth|
|Renewal Simple On-Maturity Account Using Cash with Entry as Compound Quterly New Account Auth|



