Feature: Fixed Deposit Renewal
@FDRenewal @setUp @withDenom
Scenario Outline: FixedDeposit Renewal Screen Setup
Given user opens a testCase
Examples:
||

@FDPreMatureRenewalJson
Scenario Outline: FD Renewal with old number entry
Given user opens a testCase "<testCase>"
Given user opens a scenario for FD Renewal "<testCase>" "FdPreMatureRenewal"
Given User is on "td account premature" "Menu_FDPreMatureRenewalEntry"screen
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
|Renewal With Account Wise 12M Using Cash CASHINTEREST case|RenewalWithAccountWise12MUsingCash|RenewalWithAccountWise12MUsingCashrenewalCacheForNew|


